Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E52BC13B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 07:08:58 +0200 (CEST)
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCd4L-0008Po-EF
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 01:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iCcvm-0001GD-8C
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iCcvk-0001w2-8G
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:00:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41027 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iCcvj-0001rh-21; Tue, 24 Sep 2019 01:00:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46cps84lN4z9sP7; Tue, 24 Sep 2019 14:59:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569301196;
 bh=v/bvaDusoHtbVksWbv6wuUI+7+7m/wPijmJz4VnYCZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P4ykigGqfYouPQOdvx7GGht/pBgm/2er/rLUTnRFXu69awdO+gHVObQu2sZQvWJvs
 WDHWAngYpeH7P7e8dYLxLVieMjEZtg2TtuVUJqZP8LHvMjNJ3JUM+Loy8JGjCf4JEX
 j3Qe61iwx/CSER1fkD6/HWMNC12cxkf3dMztOHeY=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org
Subject: [PATCH 4/4] xics: Merge TYPE_ICS_BASE and TYPE_ICS_SIMPLE classes
Date: Tue, 24 Sep 2019 14:59:52 +1000
Message-Id: <20190924045952.11412-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924045952.11412-1-david@gibson.dropbear.id.au>
References: <20190924045952.11412-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: gkurz@kaod.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_ICS_SIMPLE is the only subtype of TYPE_ICS_BASE that's ever
instantiated, and the only one we're ever likely to want.  The
existence of different classes is just a hang over from when we
(misguidedly) had separate subtypes for the KVM and non-KVM version of
the device.

So, collapse the two classes together into just TYPE_ICS.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics.c        | 57 ++++++++++++++++---------------------------
 hw/ppc/pnv_psi.c      |  2 +-
 hw/ppc/spapr_irq.c    |  4 +--
 include/hw/ppc/xics.h | 17 ++-----------
 4 files changed, 26 insertions(+), 54 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 9ae51bbc76..388dbba870 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -555,7 +555,7 @@ static void ics_reset_irq(ICSIRQState *irq)
=20
 static void ics_reset(DeviceState *dev)
 {
-    ICSState *ics =3D ICS_BASE(dev);
+    ICSState *ics =3D ICS(dev);
     int i;
     uint8_t flags[ics->nr_irqs];
=20
@@ -573,7 +573,7 @@ static void ics_reset(DeviceState *dev)
     if (kvm_irqchip_in_kernel()) {
         Error *local_err =3D NULL;
=20
-        ics_set_kvm_state(ICS_BASE(dev), &local_err);
+        ics_set_kvm_state(ICS(dev), &local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -587,7 +587,7 @@ static void ics_reset_handler(void *dev)
=20
 static void ics_realize(DeviceState *dev, Error **errp)
 {
-    ICSState *ics =3D ICS_BASE(dev);
+    ICSState *ics =3D ICS(dev);
     Error *local_err =3D NULL;
     Object *obj;
=20
@@ -609,26 +609,14 @@ static void ics_realize(DeviceState *dev, Error **e=
rrp)
     qemu_register_reset(ics_reset_handler, ics);
 }
=20
-static void ics_simple_class_init(ObjectClass *klass, void *data)
+static void ics_instance_init(Object *obj)
 {
-}
-
-static const TypeInfo ics_simple_info =3D {
-    .name =3D TYPE_ICS_SIMPLE,
-    .parent =3D TYPE_ICS_BASE,
-    .instance_size =3D sizeof(ICSState),
-    .class_init =3D ics_simple_class_init,
-    .class_size =3D sizeof(ICSStateClass),
-};
-
-static void ics_base_instance_init(Object *obj)
-{
-    ICSState *ics =3D ICS_BASE(obj);
+    ICSState *ics =3D ICS(obj);
=20
     ics->offset =3D XICS_IRQ_BASE;
 }
=20
-static int ics_base_pre_save(void *opaque)
+static int ics_pre_save(void *opaque)
 {
     ICSState *ics =3D opaque;
=20
@@ -639,7 +627,7 @@ static int ics_base_pre_save(void *opaque)
     return 0;
 }
=20
-static int ics_base_post_load(void *opaque, int version_id)
+static int ics_post_load(void *opaque, int version_id)
 {
     ICSState *ics =3D opaque;
=20
@@ -657,7 +645,7 @@ static int ics_base_post_load(void *opaque, int versi=
on_id)
     return 0;
 }
=20
-static const VMStateDescription vmstate_ics_base_irq =3D {
+static const VMStateDescription vmstate_ics_irq =3D {
     .name =3D "ics/irq",
     .version_id =3D 2,
     .minimum_version_id =3D 1,
@@ -671,46 +659,44 @@ static const VMStateDescription vmstate_ics_base_ir=
q =3D {
     },
 };
=20
-static const VMStateDescription vmstate_ics_base =3D {
+static const VMStateDescription vmstate_ics =3D {
     .name =3D "ics",
     .version_id =3D 1,
     .minimum_version_id =3D 1,
-    .pre_save =3D ics_base_pre_save,
-    .post_load =3D ics_base_post_load,
+    .pre_save =3D ics_pre_save,
+    .post_load =3D ics_post_load,
     .fields =3D (VMStateField[]) {
         /* Sanity check */
         VMSTATE_UINT32_EQUAL(nr_irqs, ICSState, NULL),
=20
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(irqs, ICSState, nr_irqs,
-                                             vmstate_ics_base_irq,
+                                             vmstate_ics_irq,
                                              ICSIRQState),
         VMSTATE_END_OF_LIST()
     },
 };
=20
-static Property ics_base_properties[] =3D {
+static Property ics_properties[] =3D {
     DEFINE_PROP_UINT32("nr-irqs", ICSState, nr_irqs, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
-static void ics_base_class_init(ObjectClass *klass, void *data)
+static void ics_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D ics_realize;
-    dc->props =3D ics_base_properties;
+    dc->props =3D ics_properties;
     dc->reset =3D ics_reset;
-    dc->vmsd =3D &vmstate_ics_base;
+    dc->vmsd =3D &vmstate_ics;
 }
=20
-static const TypeInfo ics_base_info =3D {
-    .name =3D TYPE_ICS_BASE,
+static const TypeInfo ics_info =3D {
+    .name =3D TYPE_ICS,
     .parent =3D TYPE_DEVICE,
-    .abstract =3D true,
     .instance_size =3D sizeof(ICSState),
-    .instance_init =3D ics_base_instance_init,
-    .class_init =3D ics_base_class_init,
-    .class_size =3D sizeof(ICSStateClass),
+    .instance_init =3D ics_instance_init,
+    .class_init =3D ics_class_init,
 };
=20
 static const TypeInfo xics_fabric_info =3D {
@@ -749,8 +735,7 @@ void ics_set_irq_type(ICSState *ics, int srcno, bool =
lsi)
=20
 static void xics_register_types(void)
 {
-    type_register_static(&ics_simple_info);
-    type_register_static(&ics_base_info);
+    type_register_static(&ics_info);
     type_register_static(&icp_info);
     type_register_static(&xics_fabric_info);
 }
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 8ea81e9d8e..a997f16bb4 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -469,7 +469,7 @@ static void pnv_psi_power8_instance_init(Object *obj)
     Pnv8Psi *psi8 =3D PNV8_PSI(obj);
=20
     object_initialize_child(obj, "ics-psi",  &psi8->ics, sizeof(psi8->ic=
s),
-                            TYPE_ICS_SIMPLE, &error_abort, NULL);
+                            TYPE_ICS, &error_abort, NULL);
 }
=20
 static const uint8_t irq_to_xivr[] =3D {
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index ac189c5796..6c45d2a3c0 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -98,7 +98,7 @@ static void spapr_irq_init_xics(SpaprMachineState *spap=
r, int nr_irqs,
     Object *obj;
     Error *local_err =3D NULL;
=20
-    obj =3D object_new(TYPE_ICS_SIMPLE);
+    obj =3D object_new(TYPE_ICS);
     object_property_add_child(OBJECT(spapr), "ics", obj, &error_abort);
     object_property_add_const_link(obj, ICS_PROP_XICS, OBJECT(spapr),
                                    &error_fatal);
@@ -109,7 +109,7 @@ static void spapr_irq_init_xics(SpaprMachineState *sp=
apr, int nr_irqs,
         return;
     }
=20
-    spapr->ics =3D ICS_BASE(obj);
+    spapr->ics =3D ICS(obj);
=20
     xics_spapr_init(spapr);
 }
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 92628e7cab..d8cf206a69 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -89,21 +89,8 @@ struct PnvICPState {
     uint32_t links[3];
 };
=20
-#define TYPE_ICS_BASE "ics-base"
-#define ICS_BASE(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS_BASE)
-
-/* Retain ics for sPAPR for migration from existing sPAPR guests */
-#define TYPE_ICS_SIMPLE "ics"
-#define ICS_SIMPLE(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS_SIMPLE)
-
-#define ICS_BASE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(ICSStateClass, (klass), TYPE_ICS_BASE)
-#define ICS_BASE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(ICSStateClass, (obj), TYPE_ICS_BASE)
-
-struct ICSStateClass {
-    DeviceClass parent_class;
-};
+#define TYPE_ICS "ics"
+#define ICS(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS)
=20
 struct ICSState {
     /*< private >*/
--=20
2.21.0


