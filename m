Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197382BB1CE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:55:05 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAci-0000jg-4h
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV4-0008UJ-KZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:58220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV2-00057J-I2
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:09 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-DYWRbe43PmCKn5it_ST3jg-1; Fri, 20 Nov 2020 12:46:53 -0500
X-MC-Unique: DYWRbe43PmCKn5it_ST3jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A76107AD29;
 Fri, 20 Nov 2020 17:46:51 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C24B5C1D5;
 Fri, 20 Nov 2020 17:46:50 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
Date: Fri, 20 Nov 2020 18:46:40 +0100
Message-Id: <20201120174646.619395-3-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to kill the "nr_ends" field in a subsequent patch.
Prepare ground by using an helper instead of peeking into
the sPAPR XIVE structure directly.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_xive.h |  1 +
 hw/intc/spapr_xive.c        | 23 ++++++++++++++---------
 hw/intc/spapr_xive_kvm.c    |  4 ++--
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 26c8d90d7196..4b967f13c030 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -75,6 +75,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
=20
 int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
                              uint32_t *out_server, uint8_t *out_prio);
+uint32_t spapr_xive_nr_ends(const SpaprXive *xive);
=20
 /*
  * KVM XIVE device helpers
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 60e0d5769dcc..f473ad9cba47 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -192,7 +192,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Monitor=
 *mon)
             uint32_t end_idx =3D xive_get_field64(EAS_END_INDEX, eas->w);
             XiveEND *end;
=20
-            assert(end_idx < xive->nr_ends);
+            assert(end_idx < spapr_xive_nr_ends(xive));
             end =3D &xive->endt[end_idx];
=20
             if (xive_end_is_valid(end)) {
@@ -270,7 +270,7 @@ static void spapr_xive_reset(void *dev)
     }
=20
     /* Clear all ENDs */
-    for (i =3D 0; i < xive->nr_ends; i++) {
+    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
         spapr_xive_end_reset(&xive->endt[i]);
     }
 }
@@ -288,6 +288,11 @@ static void spapr_xive_instance_init(Object *obj)
     xive->fd =3D -1;
 }
=20
+uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
+{
+    return xive->nr_ends;
+}
+
 static void spapr_xive_realize(DeviceState *dev, Error **errp)
 {
     SpaprXive *xive =3D SPAPR_XIVE(dev);
@@ -336,7 +341,7 @@ static void spapr_xive_realize(DeviceState *dev, Error =
**errp)
      * Allocate the routing tables
      */
     xive->eat =3D g_new0(XiveEAS, xive->nr_irqs);
-    xive->endt =3D g_new0(XiveEND, xive->nr_ends);
+    xive->endt =3D g_new0(XiveEND, spapr_xive_nr_ends(xive));
=20
     xive->nodename =3D g_strdup_printf("interrupt-controller@%" PRIx64,
                            xive->tm_base + XIVE_TM_USER_PAGE * (1 << TM_SH=
IFT));
@@ -375,7 +380,7 @@ static int spapr_xive_get_end(XiveRouter *xrtr,
 {
     SpaprXive *xive =3D SPAPR_XIVE(xrtr);
=20
-    if (end_idx >=3D xive->nr_ends) {
+    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
         return -1;
     }
=20
@@ -389,7 +394,7 @@ static int spapr_xive_write_end(XiveRouter *xrtr, uint8=
_t end_blk,
 {
     SpaprXive *xive =3D SPAPR_XIVE(xrtr);
=20
-    if (end_idx >=3D xive->nr_ends) {
+    if (end_idx >=3D spapr_xive_nr_ends(xive)) {
         return -1;
     }
=20
@@ -1138,7 +1143,7 @@ static target_ulong h_int_get_source_config(PowerPCCP=
U *cpu,
     /* EAS_END_BLOCK is unused on sPAPR */
     end_idx =3D xive_get_field64(EAS_END_INDEX, eas.w);
=20
-    assert(end_idx < xive->nr_ends);
+    assert(end_idx < spapr_xive_nr_ends(xive));
     end =3D &xive->endt[end_idx];
=20
     nvt_blk =3D xive_get_field32(END_W6_NVT_BLOCK, end->w6);
@@ -1216,7 +1221,7 @@ static target_ulong h_int_get_queue_info(PowerPCCPU *=
cpu,
         return H_P2;
     }
=20
-    assert(end_idx < xive->nr_ends);
+    assert(end_idx < spapr_xive_nr_ends(xive));
     end =3D &xive->endt[end_idx];
=20
     args[0] =3D xive->end_base + (1ull << (end_xsrc->esb_shift + 1)) * end=
_idx;
@@ -1304,7 +1309,7 @@ static target_ulong h_int_set_queue_config(PowerPCCPU=
 *cpu,
         return H_P2;
     }
=20
-    assert(end_idx < xive->nr_ends);
+    assert(end_idx < spapr_xive_nr_ends(xive));
     memcpy(&end, &xive->endt[end_idx], sizeof(XiveEND));
=20
     switch (qsize) {
@@ -1470,7 +1475,7 @@ static target_ulong h_int_get_queue_config(PowerPCCPU=
 *cpu,
         return H_P2;
     }
=20
-    assert(end_idx < xive->nr_ends);
+    assert(end_idx < spapr_xive_nr_ends(xive));
     end =3D &xive->endt[end_idx];
=20
     args[0] =3D 0;
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 66bf4c06fe55..1566016f0e28 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -531,7 +531,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive, Erro=
r **errp)
     int i;
     int ret;
=20
-    for (i =3D 0; i < xive->nr_ends; i++) {
+    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
         if (!xive_end_is_valid(&xive->endt[i])) {
             continue;
         }
@@ -701,7 +701,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_=
id)
     assert(xive->fd !=3D -1);
=20
     /* Restore the ENDT first. The targetting depends on it. */
-    for (i =3D 0; i < xive->nr_ends; i++) {
+    for (i =3D 0; i < spapr_xive_nr_ends(xive); i++) {
         if (!xive_end_is_valid(&xive->endt[i])) {
             continue;
         }
--=20
2.26.2


