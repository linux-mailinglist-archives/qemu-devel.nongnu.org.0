Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58CCB81D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:21:09 +0200 (CEST)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKhv-00078v-N0
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK38-0005ko-BJ
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK36-00062A-Tt
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37909)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK36-0005zC-GV; Fri, 04 Oct 2019 05:38:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YR03vJz9sSS; Fri,  4 Oct 2019 19:38:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181883;
 bh=AJiJdvQQRtY3xCC+8NIaQB+q5QY2SYMofAFjSwQ8Fag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6aR4omsTL6br8sV4ie/XSXC7NcOHqt/vaiLGHW37pNj0n+SyUzhwErT0KLdjL5Zf
 wa7GyI6yrxQrj/n+ps0jONbRarUdkZr6Q6f4oWKLO1VzRS1SiKwiZ3RviuxOiL9ZOV
 PS11+kPrJLtCKxOvRTAdScwhHrXB0UKqCp7PVW3s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 42/53] spapr: Eliminate nr_irqs parameter to SpaprIrq::init
Date: Fri,  4 Oct 2019 19:37:36 +1000
Message-Id: <20191004093747.31350-43-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only reason this parameter was needed was to work around the
inconsistent meaning of nr_irqs between xics and xive.  Now that we've
fixed that, we can consistently use the number directly in the SpaprIrq
configuration.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_irq.c         | 21 ++++++++++-----------
 include/hw/ppc/spapr_irq.h |  2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 3207b6bd01..cded3a0154 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -92,8 +92,7 @@ static void spapr_irq_init_kvm(SpaprMachineState *spapr=
,
  * XICS IRQ backend.
  */
=20
-static void spapr_irq_init_xics(SpaprMachineState *spapr, int nr_xirqs,
-                                Error **errp)
+static void spapr_irq_init_xics(SpaprMachineState *spapr, Error **errp)
 {
     Object *obj;
     Error *local_err =3D NULL;
@@ -102,7 +101,8 @@ static void spapr_irq_init_xics(SpaprMachineState *sp=
apr, int nr_xirqs,
     object_property_add_child(OBJECT(spapr), "ics", obj, &error_abort);
     object_property_add_const_link(obj, ICS_PROP_XICS, OBJECT(spapr),
                                    &error_fatal);
-    object_property_set_int(obj, nr_xirqs, "nr-irqs",  &error_fatal);
+    object_property_set_int(obj, spapr->irq->nr_xirqs,
+                            "nr-irqs",  &error_fatal);
     object_property_set_bool(obj, true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -256,15 +256,15 @@ SpaprIrq spapr_irq_xics =3D {
 /*
  * XIVE IRQ backend.
  */
-static void spapr_irq_init_xive(SpaprMachineState *spapr, int nr_xirqs,
-                                Error **errp)
+static void spapr_irq_init_xive(SpaprMachineState *spapr, Error **errp)
 {
     uint32_t nr_servers =3D spapr_max_server_number(spapr);
     DeviceState *dev;
     int i;
=20
     dev =3D qdev_create(NULL, TYPE_SPAPR_XIVE);
-    qdev_prop_set_uint32(dev, "nr-irqs", nr_xirqs + SPAPR_XIRQ_BASE);
+    qdev_prop_set_uint32(dev, "nr-irqs",
+                         spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE);
     /*
      * 8 XIVE END structures per CPU. One for each available priority
      */
@@ -438,18 +438,17 @@ static SpaprIrq *spapr_irq_current(SpaprMachineStat=
e *spapr)
         &spapr_irq_xive : &spapr_irq_xics;
 }
=20
-static void spapr_irq_init_dual(SpaprMachineState *spapr, int nr_xirqs,
-                                Error **errp)
+static void spapr_irq_init_dual(SpaprMachineState *spapr, Error **errp)
 {
     Error *local_err =3D NULL;
=20
-    spapr_irq_xics.init(spapr, spapr_irq_xics.nr_xirqs, &local_err);
+    spapr_irq_xics.init(spapr, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
=20
-    spapr_irq_xive.init(spapr, spapr_irq_xive.nr_xirqs, &local_err);
+    spapr_irq_xive.init(spapr, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -678,7 +677,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
         spapr_irq_msi_init(spapr, spapr->irq->nr_msis);
     }
=20
-    spapr->irq->init(spapr, spapr->irq->nr_xirqs, errp);
+    spapr->irq->init(spapr, errp);
=20
     spapr->qirqs =3D qemu_allocate_irqs(spapr->irq->set_irq, spapr,
                                       spapr->irq->nr_xirqs + SPAPR_XIRQ_=
BASE);
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index a8f9a2ab11..7e26288fcd 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -41,7 +41,7 @@ typedef struct SpaprIrq {
     uint32_t    nr_msis;
     uint8_t     ov5;
=20
-    void (*init)(SpaprMachineState *spapr, int nr_irqs, Error **errp);
+    void (*init)(SpaprMachineState *spapr, Error **errp);
     int (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **er=
rp);
     void (*free)(SpaprMachineState *spapr, int irq, int num);
     qemu_irq (*qirq)(SpaprMachineState *spapr, int irq);
--=20
2.21.0


