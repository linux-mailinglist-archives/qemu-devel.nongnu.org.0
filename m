Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27701AFDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 15:43:20 +0200 (CEST)
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i82tz-0002NR-9n
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 09:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i82qv-0007l8-Cd
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i82qu-0006T0-17
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:40:09 -0400
Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72]:59567)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i82qt-0006SW-S6
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:40:07 -0400
Received: from player792.ha.ovh.net (unknown [10.109.146.213])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0B90D18DC01
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 15:40:06 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 2731A9C4DFE2;
 Wed, 11 Sep 2019 13:39:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 11 Sep 2019 15:39:37 +0200
Message-Id: <20190911133937.2716-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911133937.2716-1-clg@kaod.org>
References: <20190911133937.2716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17957259091022220262
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.35.72
Subject: [Qemu-devel] [PATCH v2 2/2] spapr/irq: Only claim VALID interrupts
 at the KVM level
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A typical pseries VM with 16 vCPUs, one disk, one network adapater
uses less than 100 interrupts but the whole IRQ number space of the
QEMU machine is allocated at reset time and it is 8K wide. This is
wasting a considerable amount of interrupt numbers in the global IRQ
space which has 1M interrupts per socket on a POWER9.

To optimise the HW resources, only request at the KVM level interrupts
which have been claimed by the guest. This will help to increase the
maximum number of VMs per system and also help supporting nested guests
using the XIVE interrupt mode.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/spapr_xive_kvm.c | 29 ++++++++++++++++++++++++++---
 hw/intc/xics_kvm.c       |  8 ++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 17af4d19f54e..71b88d7797bc 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -255,11 +255,16 @@ void kvmppc_xive_source_reset_one(XiveSource *xsrc,=
 int srcno, Error **errp)
=20
 static void kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
 {
+    SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     int i;
=20
     for (i =3D 0; i < xsrc->nr_irqs; i++) {
         Error *local_err =3D NULL;
=20
+        if (!xive_eas_is_valid(&xive->eat[i])) {
+            continue;
+        }
+
         kvmppc_xive_source_reset_one(xsrc, i, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
@@ -328,11 +333,18 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int s=
rcno, uint32_t offset,
=20
 static void kvmppc_xive_source_get_state(XiveSource *xsrc)
 {
+    SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     int i;
=20
     for (i =3D 0; i < xsrc->nr_irqs; i++) {
+        uint8_t pq;
+
+        if (!xive_eas_is_valid(&xive->eat[i])) {
+            continue;
+        }
+
         /* Perform a load without side effect to retrieve the PQ bits */
-        uint8_t pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
+        pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
=20
         /* and save PQ locally */
         xive_source_esb_set(xsrc, i, pq);
@@ -521,9 +533,14 @@ static void kvmppc_xive_change_state_handler(void *o=
paque, int running,
      */
     if (running) {
         for (i =3D 0; i < xsrc->nr_irqs; i++) {
-            uint8_t pq =3D xive_source_esb_get(xsrc, i);
+            uint8_t pq;
             uint8_t old_pq;
=20
+            if (!xive_eas_is_valid(&xive->eat[i])) {
+                continue;
+            }
+
+            pq =3D xive_source_esb_get(xsrc, i);
             old_pq =3D xive_esb_read(xsrc, i, XIVE_ESB_SET_PQ_00 + (pq <=
< 8));
=20
             /*
@@ -545,7 +562,13 @@ static void kvmppc_xive_change_state_handler(void *o=
paque, int running,
      * migration is in progress.
      */
     for (i =3D 0; i < xsrc->nr_irqs; i++) {
-        uint8_t pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
+        uint8_t pq;
+
+        if (!xive_eas_is_valid(&xive->eat[i])) {
+            continue;
+        }
+
+        pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
=20
         /*
          * PQ is set to PENDING to possibly catch a triggered
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index a4d2e876cc5f..ba90d6dc966c 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -190,6 +190,10 @@ void ics_get_kvm_state(ICSState *ics)
     for (i =3D 0; i < ics->nr_irqs; i++) {
         ICSIRQState *irq =3D &ics->irqs[i];
=20
+        if (ics_irq_free(ics, i)) {
+            continue;
+        }
+
         kvm_device_access(kernel_xics_fd, KVM_DEV_XICS_GRP_SOURCES,
                           i + ics->offset, &state, false, &error_fatal);
=20
@@ -301,6 +305,10 @@ int ics_set_kvm_state(ICSState *ics, Error **errp)
         Error *local_err =3D NULL;
         int ret;
=20
+        if (ics_irq_free(ics, i)) {
+            continue;
+        }
+
         ret =3D ics_set_kvm_state_one(ics, i, &local_err);
         if (ret < 0) {
             error_propagate(errp, local_err);
--=20
2.21.0


