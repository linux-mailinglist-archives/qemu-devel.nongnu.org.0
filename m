Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91853CB885
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:41:21 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGL1A-0004Iv-AV
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3q-0006q7-NC
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK3p-0006fG-8e
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:39:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51769)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK3o-0006Kj-TJ; Fri, 04 Oct 2019 05:39:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YT4p5Cz9sSc; Fri,  4 Oct 2019 19:38:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181885;
 bh=C5o+5j2lY/c6Dtuq+8PtKvrbepJXSlhW+IzR13Xojbs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GqSjawwQqrGD78c1AUzRE+uAU9zCfcBqTo6G1dVXJ4hEunx+R/cnZrMzRQkMJb8M/
 Z1eBnmkETEFpCZ96FX/NsfLB/1l5E1kbKk9FKIFZ9FAp4O0LeUzC74GCC2nHxFAjDU
 O0mY3NLehrGWEz9wmsD4gpRzSRNI4zV4qCoP6a4w=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 52/53] spapr: Eliminate SpaprIrq::init hook
Date: Fri,  4 Oct 2019 19:37:46 +1000
Message-Id: <20191004093747.31350-53-david@gibson.dropbear.id.au>
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

This method is used to set up the interrupt backends for the current
configuration.  However, this means some confusing redirection between
the "dual" mode init and the init hooks for xics only and xive only modes=
.

Since we now have simple flags indicating whether XICS and/or XIVE are
supported, it's easier to just open code each initialization directly in
spapr_irq_init().  This will also make some future cleanups simpler.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_irq.c         | 130 +++++++++++++++++--------------------
 include/hw/ppc/spapr_irq.h |   1 -
 2 files changed, 61 insertions(+), 70 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 0413fbd0a3..457eabe24c 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -92,26 +92,6 @@ static void spapr_irq_init_kvm(SpaprMachineState *spap=
r,
  * XICS IRQ backend.
  */
=20
-static void spapr_irq_init_xics(SpaprMachineState *spapr, Error **errp)
-{
-    Object *obj;
-    Error *local_err =3D NULL;
-
-    obj =3D object_new(TYPE_ICS_SPAPR);
-    object_property_add_child(OBJECT(spapr), "ics", obj, &error_abort);
-    object_property_add_const_link(obj, ICS_PROP_XICS, OBJECT(spapr),
-                                   &error_fatal);
-    object_property_set_int(obj, spapr->irq->nr_xirqs,
-                            "nr-irqs",  &error_fatal);
-    object_property_set_bool(obj, true, "realized", &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    spapr->ics =3D ICS_SPAPR(obj);
-}
-
 static int spapr_irq_claim_xics(SpaprMachineState *spapr, int irq, bool =
lsi,
                                 Error **errp)
 {
@@ -213,7 +193,6 @@ SpaprIrq spapr_irq_xics =3D {
     .xics        =3D true,
     .xive        =3D false,
=20
-    .init        =3D spapr_irq_init_xics,
     .claim       =3D spapr_irq_claim_xics,
     .free        =3D spapr_irq_free_xics,
     .print_info  =3D spapr_irq_print_info_xics,
@@ -228,33 +207,6 @@ SpaprIrq spapr_irq_xics =3D {
 /*
  * XIVE IRQ backend.
  */
-static void spapr_irq_init_xive(SpaprMachineState *spapr, Error **errp)
-{
-    uint32_t nr_servers =3D spapr_max_server_number(spapr);
-    DeviceState *dev;
-    int i;
-
-    dev =3D qdev_create(NULL, TYPE_SPAPR_XIVE);
-    qdev_prop_set_uint32(dev, "nr-irqs",
-                         spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE);
-    /*
-     * 8 XIVE END structures per CPU. One for each available priority
-     */
-    qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
-    qdev_init_nofail(dev);
-
-    spapr->xive =3D SPAPR_XIVE(dev);
-
-    /* Enable the CPU IPIs */
-    for (i =3D 0; i < nr_servers; ++i) {
-        if (spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i,
-                                 false, errp) < 0) {
-            return;
-        }
-    }
-
-    spapr_xive_hcall_init(spapr);
-}
=20
 static int spapr_irq_claim_xive(SpaprMachineState *spapr, int irq, bool =
lsi,
                                 Error **errp)
@@ -354,7 +306,6 @@ SpaprIrq spapr_irq_xive =3D {
     .xics        =3D false,
     .xive        =3D true,
=20
-    .init        =3D spapr_irq_init_xive,
     .claim       =3D spapr_irq_claim_xive,
     .free        =3D spapr_irq_free_xive,
     .print_info  =3D spapr_irq_print_info_xive,
@@ -385,23 +336,6 @@ static SpaprIrq *spapr_irq_current(SpaprMachineState=
 *spapr)
         &spapr_irq_xive : &spapr_irq_xics;
 }
=20
-static void spapr_irq_init_dual(SpaprMachineState *spapr, Error **errp)
-{
-    Error *local_err =3D NULL;
-
-    spapr_irq_xics.init(spapr, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    spapr_irq_xive.init(spapr, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-}
-
 static int spapr_irq_claim_dual(SpaprMachineState *spapr, int irq, bool =
lsi,
                                 Error **errp)
 {
@@ -516,7 +450,6 @@ SpaprIrq spapr_irq_dual =3D {
     .xics        =3D true,
     .xive        =3D true,
=20
-    .init        =3D spapr_irq_init_dual,
     .claim       =3D spapr_irq_claim_dual,
     .free        =3D spapr_irq_free_dual,
     .print_info  =3D spapr_irq_print_info_dual,
@@ -612,7 +545,67 @@ void spapr_irq_init(SpaprMachineState *spapr, Error =
**errp)
         spapr_irq_msi_init(spapr, spapr->irq->nr_msis);
     }
=20
-    spapr->irq->init(spapr, errp);
+    if (spapr->irq->xics) {
+        Error *local_err =3D NULL;
+        Object *obj;
+
+        obj =3D object_new(TYPE_ICS_SPAPR);
+        object_property_add_child(OBJECT(spapr), "ics", obj, &local_err)=
;
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        object_property_add_const_link(obj, ICS_PROP_XICS, OBJECT(spapr)=
,
+                                       &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        object_property_set_int(obj, spapr->irq->nr_xirqs, "nr-irqs",
+                                &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        object_property_set_bool(obj, true, "realized", &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        spapr->ics =3D ICS_SPAPR(obj);
+    }
+
+    if (spapr->irq->xive) {
+        uint32_t nr_servers =3D spapr_max_server_number(spapr);
+        DeviceState *dev;
+        int i;
+
+        dev =3D qdev_create(NULL, TYPE_SPAPR_XIVE);
+        qdev_prop_set_uint32(dev, "nr-irqs",
+                             spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE);
+        /*
+         * 8 XIVE END structures per CPU. One for each available
+         * priority
+         */
+        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
+        qdev_init_nofail(dev);
+
+        spapr->xive =3D SPAPR_XIVE(dev);
+
+        /* Enable the CPU IPIs */
+        for (i =3D 0; i < nr_servers; ++i) {
+            if (spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i,
+                                     false, errp) < 0) {
+                return;
+            }
+        }
+
+        spapr_xive_hcall_init(spapr);
+    }
=20
     spapr->qirqs =3D qemu_allocate_irqs(spapr->irq->set_irq, spapr,
                                       spapr->irq->nr_xirqs + SPAPR_XIRQ_=
BASE);
@@ -759,7 +752,6 @@ SpaprIrq spapr_irq_xics_legacy =3D {
     .xics        =3D true,
     .xive        =3D false,
=20
-    .init        =3D spapr_irq_init_xics,
     .claim       =3D spapr_irq_claim_xics,
     .free        =3D spapr_irq_free_xics,
     .print_info  =3D spapr_irq_print_info_xics,
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index d3f3b85eb9..69a37f608e 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -42,7 +42,6 @@ typedef struct SpaprIrq {
     bool        xics;
     bool        xive;
=20
-    void (*init)(SpaprMachineState *spapr, Error **errp);
     int (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **er=
rp);
     void (*free)(SpaprMachineState *spapr, int irq);
     void (*print_info)(SpaprMachineState *spapr, Monitor *mon);
--=20
2.21.0


