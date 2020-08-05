Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45323CD8E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 19:38:14 +0200 (CEST)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3NMj-0001vX-F5
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 13:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3NKY-0007As-U2
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 13:35:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35173
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k3NKT-0001aE-P0
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 13:35:58 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-Km0eNhT2PM27S1DmYzNv3A-1; Wed, 05 Aug 2020 13:35:47 -0400
X-MC-Unique: Km0eNhT2PM27S1DmYzNv3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A44641005504;
 Wed,  5 Aug 2020 17:35:46 +0000 (UTC)
Received: from bahia.lan (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7892100239B;
 Wed,  5 Aug 2020 17:35:45 +0000 (UTC)
Subject: [PATCH for-5.2 4/5] spapr/xive: Convert KVM device fd checks to
 assert()
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 05 Aug 2020 19:35:44 +0200
Message-ID: <159664894478.638781.7802223440952803421.stgit@bahia.lan>
In-Reply-To: <159664891296.638781.18417631893299150932.stgit@bahia.lan>
References: <159664891296.638781.18417631893299150932.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.110.61; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 04:10:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers guard these functions with kvmppc_xive_in_kernel() or one
of its variants. Make it clear that these functions are only to be
called when the KVM XIVE device is active.

Note that the check on xive is dropped in kvmppc_xive_disconnect(). It
really cannot be NULL since it comes from set_active_intc() which only
passes pointers to allocated objects.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/spapr_xive_kvm.c |   35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index a9657e2b0cda..3364832de83a 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -79,10 +79,7 @@ void kvmppc_xive_cpu_set_state(XiveTCTX *tctx, Error **e=
rrp)
     uint64_t state[2];
     int ret;
=20
-    /* The KVM XIVE device is not in use yet */
-    if (xive->fd =3D=3D -1) {
-        return;
-    }
+    assert(xive->fd !=3D -1);
=20
     /* word0 and word1 of the OS ring. */
     state[0] =3D *((uint64_t *) &tctx->regs[TM_QW1_OS]);
@@ -101,10 +98,7 @@ void kvmppc_xive_cpu_get_state(XiveTCTX *tctx, Error **=
errp)
     uint64_t state[2] =3D { 0 };
     int ret;
=20
-    /* The KVM XIVE device is not in use */
-    if (xive->fd =3D=3D -1) {
-        return;
-    }
+    assert(xive->fd !=3D -1);
=20
     ret =3D kvm_get_one_reg(tctx->cs, KVM_REG_PPC_VP_STATE, state);
     if (ret !=3D 0) {
@@ -156,10 +150,7 @@ void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **e=
rrp)
     unsigned long vcpu_id;
     int ret;
=20
-    /* The KVM XIVE device is not in use */
-    if (xive->fd =3D=3D -1) {
-        return;
-    }
+    assert(xive->fd !=3D -1);
=20
     /* Check if CPU was hot unplugged and replugged. */
     if (kvm_cpu_is_enabled(tctx->cs)) {
@@ -245,10 +236,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int=
 srcno, Error **errp)
     SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     uint64_t state =3D 0;
=20
-    /* The KVM XIVE device is not in use */
-    if (xive->fd =3D=3D -1) {
-        return -ENODEV;
-    }
+    assert(xive->fd !=3D -1);
=20
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
         state |=3D KVM_XIVE_LEVEL_SENSITIVE;
@@ -592,10 +580,7 @@ static void kvmppc_xive_change_state_handler(void *opa=
que, int running,
=20
 void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
 {
-    /* The KVM XIVE device is not in use */
-    if (xive->fd =3D=3D -1) {
-        return;
-    }
+    assert(xive->fd !=3D -1);
=20
     /*
      * When the VM is stopped, the sources are masked and the previous
@@ -622,10 +607,7 @@ int kvmppc_xive_pre_save(SpaprXive *xive)
 {
     Error *local_err =3D NULL;
=20
-    /* The KVM XIVE device is not in use */
-    if (xive->fd =3D=3D -1) {
-        return 0;
-    }
+    assert(xive->fd !=3D -1);
=20
     /* EAT: there is no extra state to query from KVM */
=20
@@ -845,10 +827,7 @@ void kvmppc_xive_disconnect(SpaprInterruptController *=
intc)
     XiveSource *xsrc;
     size_t esb_len;
=20
-    /* The KVM XIVE device is not in use */
-    if (!xive || xive->fd =3D=3D -1) {
-        return;
-    }
+    assert(xive->fd !=3D -1);
=20
     /* Clear the KVM mapping */
     xsrc =3D &xive->source;



