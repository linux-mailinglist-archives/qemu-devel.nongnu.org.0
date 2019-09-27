Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA99BFF40
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 08:39:38 +0200 (CEST)
Received: from localhost ([::1]:46980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjui-0004cw-Dh
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 02:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDjAB-0007yY-OZ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:51:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDjAA-0006Mi-BV
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:51:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48655)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDjA9-0005aA-W1; Fri, 27 Sep 2019 01:51:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrH5h2vz9sRl; Fri, 27 Sep 2019 15:50:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563439;
 bh=OUMFLJ2oAKnJyXX3VCtqoaChCMhLCtIv3hZW9G9u/Cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MHrredvOfaGEGkjhkjXCDY6N6H1ED5M91u5xjYSO+OVxCMUffNGhqlgTn1P0zV06z
 bHW69wZ/0Aju3BIpxdfWJ7QJV7JFz5Un8QzEyBrveo3VTndur/6UeiwTHZHRrcZNe2
 POIgD9kn6Dv1H9PWw7TMgotCca+hK7PHYHzQPc1U=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 30/33] spapr, xics,
 xive: Move SpaprIrq::post_load hook to backends
Date: Fri, 27 Sep 2019 15:50:25 +1000
Message-Id: <20190927055028.11493-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The remaining logic in the post_load hook really belongs to the interrupt
controller backends, and just needs to be called on the active controller
(after the active controller is set to the right thing based on the
incoming migration in the generic spapr_irq_post_load() logic).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c        |  5 +++--
 hw/intc/xics_spapr.c        | 13 +++++++++++
 hw/ppc/spapr_irq.c          | 45 ++++---------------------------------
 include/hw/ppc/spapr_irq.h  |  3 +--
 include/hw/ppc/spapr_xive.h |  1 -
 5 files changed, 21 insertions(+), 46 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index e8b946982c..ab68e6eaf6 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -462,10 +462,10 @@ static int vmstate_spapr_xive_pre_save(void *opaque=
)
  * Called by the sPAPR IRQ backend 'post_load' method at the machine
  * level.
  */
-int spapr_xive_post_load(SpaprXive *xive, int version_id)
+static int spapr_xive_post_load(SpaprInterruptController *intc, int vers=
ion_id)
 {
     if (kvm_irqchip_in_kernel()) {
-        return kvmppc_xive_post_load(xive, version_id);
+        return kvmppc_xive_post_load(SPAPR_XIVE(intc), version_id);
     }
=20
     return 0;
@@ -699,6 +699,7 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     sicc->set_irq =3D spapr_xive_set_irq;
     sicc->print_info =3D spapr_xive_print_info;
     sicc->dt =3D spapr_xive_dt;
+    sicc->post_load =3D spapr_xive_post_load;
 }
=20
 static const TypeInfo spapr_xive_info =3D {
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 8abbc799ba..9590eedc3d 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -395,6 +395,18 @@ static void xics_spapr_print_info(SpaprInterruptCont=
roller *intc, Monitor *mon)
     ics_pic_print_info(ics, mon);
 }
=20
+static int xics_spapr_post_load(SpaprInterruptController *intc, int vers=
ion_id)
+{
+    if (!kvm_irqchip_in_kernel()) {
+        CPUState *cs;
+        CPU_FOREACH(cs) {
+            PowerPCCPU *cpu =3D POWERPC_CPU(cs);
+            icp_resend(spapr_cpu_state(cpu)->icp);
+        }
+    }
+    return 0;
+}
+
 static void xics_spapr_activate(SpaprInterruptController *intc, Error **=
errp)
 {
     if (kvm_enabled()) {
@@ -425,6 +437,7 @@ static void ics_spapr_class_init(ObjectClass *klass, =
void *data)
     sicc->set_irq =3D xics_spapr_set_irq;
     sicc->print_info =3D xics_spapr_print_info;
     sicc->dt =3D xics_spapr_dt;
+    sicc->post_load =3D xics_spapr_post_load;
 }
=20
 static const TypeInfo ics_spapr_info =3D {
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 2fd9dd0ec2..040384b0fe 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -100,43 +100,22 @@ int spapr_irq_init_kvm(int (*fn)(SpaprInterruptCont=
roller *, Error **),
  * XICS IRQ backend.
  */
=20
-static int spapr_irq_post_load_xics(SpaprMachineState *spapr, int versio=
n_id)
-{
-    if (!kvm_irqchip_in_kernel()) {
-        CPUState *cs;
-        CPU_FOREACH(cs) {
-            PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-            icp_resend(spapr_cpu_state(cpu)->icp);
-        }
-    }
-    return 0;
-}
-
 SpaprIrq spapr_irq_xics =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D true,
     .xive        =3D false,
-
-    .post_load   =3D spapr_irq_post_load_xics,
 };
=20
 /*
  * XIVE IRQ backend.
  */
=20
-static int spapr_irq_post_load_xive(SpaprMachineState *spapr, int versio=
n_id)
-{
-    return spapr_xive_post_load(spapr->xive, version_id);
-}
-
 SpaprIrq spapr_irq_xive =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D false,
     .xive        =3D true,
-
-    .post_load   =3D spapr_irq_post_load_xive,
 };
=20
 /*
@@ -148,21 +127,6 @@ SpaprIrq spapr_irq_xive =3D {
  * activated after an extra machine reset.
  */
=20
-/*
- * Returns the sPAPR IRQ backend negotiated by CAS. XICS is the
- * default.
- */
-static SpaprIrq *spapr_irq_current(SpaprMachineState *spapr)
-{
-    return spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT) ?
-        &spapr_irq_xive : &spapr_irq_xics;
-}
-
-static int spapr_irq_post_load_dual(SpaprMachineState *spapr, int versio=
n_id)
-{
-    return spapr_irq_current(spapr)->post_load(spapr, version_id);
-}
-
 /*
  * Define values in sync with the XIVE and XICS backend
  */
@@ -171,8 +135,6 @@ SpaprIrq spapr_irq_dual =3D {
     .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D true,
     .xive        =3D true,
-
-    .post_load   =3D spapr_irq_post_load_dual,
 };
=20
=20
@@ -454,8 +416,11 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int ir=
q)
=20
 int spapr_irq_post_load(SpaprMachineState *spapr, int version_id)
 {
+    SpaprInterruptControllerClass *sicc;
+
     spapr_irq_update_active_intc(spapr);
-    return spapr->irq->post_load(spapr, version_id);
+    sicc =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
+    return sicc->post_load(spapr->active_intc, version_id);
 }
=20
 void spapr_irq_reset(SpaprMachineState *spapr, Error **errp)
@@ -596,8 +561,6 @@ SpaprIrq spapr_irq_xics_legacy =3D {
     .nr_msis     =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
     .xics        =3D true,
     .xive        =3D false,
-
-    .post_load   =3D spapr_irq_post_load_xics,
 };
=20
 static void spapr_irq_register_types(void)
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 28044d7479..bc379b0761 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -62,6 +62,7 @@ typedef struct SpaprInterruptControllerClass {
     void (*print_info)(SpaprInterruptController *intc, Monitor *mon);
     void (*dt)(SpaprInterruptController *intc, uint32_t nr_servers,
                void *fdt, uint32_t phandle);
+    int (*post_load)(SpaprInterruptController *intc, int version_id);
 } SpaprInterruptControllerClass;
=20
 void spapr_irq_update_active_intc(SpaprMachineState *spapr);
@@ -82,8 +83,6 @@ typedef struct SpaprIrq {
     uint32_t    nr_msis;
     bool        xics;
     bool        xive;
-
-    int (*post_load)(SpaprMachineState *spapr, int version_id);
 } SpaprIrq;
=20
 extern SpaprIrq spapr_irq_xics;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 64972754f9..d84bd5c229 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -55,7 +55,6 @@ typedef struct SpaprXive {
 #define SPAPR_XIVE_BLOCK_ID 0x0
=20
 void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
-int spapr_xive_post_load(SpaprXive *xive, int version_id);
=20
 void spapr_xive_hcall_init(SpaprMachineState *spapr);
 void spapr_xive_set_tctx_os_cam(XiveTCTX *tctx);
--=20
2.21.0


