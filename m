Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DFDD14C0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 19:01:54 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIFLV-0002Li-Kv
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 13:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59c-0001bH-Jt
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59a-0006yX-PS
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44643 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iI59Z-0006Y3-DR; Wed, 09 Oct 2019 02:08:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46p3gF4Z0gz9sR6; Wed,  9 Oct 2019 17:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570601305;
 bh=2cuy/0jdokLLzeybNt8oIsyBe/xbthchGAjiFqfUByI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZGGONLsi6FsnBP6Yz0pznbwt4jXzp0+3pYWiUVeLOl37Fp9UsfAn3nUh6KejEp1O+
 iE3W22vlYrN5QbGIv5HStCsvm5e3PhouXEN6oYc+6F2XpZk1DFNNDUuffTGL5PNUAL
 vU/p4aI4nD7gk7LKScgpG5zSyGiDnwkw0Z1GPnQ8=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 13/19] spapr, xics,
 xive: Move SpaprIrq::reset hook logic into activate/deactivate
Date: Wed,  9 Oct 2019 17:08:12 +1100
Message-Id: <20191009060818.29719-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009060818.29719-1-david@gibson.dropbear.id.au>
References: <20191009060818.29719-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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

It turns out that all the logic in the SpaprIrq::reset hooks (and some in
the SpaprIrq::post_load hooks) isn't really related to resetting the irq
backend (that's handled by the backends' own reset routines).  Rather its
about getting the backend ready to be the active interrupt controller or
stopping being the active interrupt controller - reset (and post_load) is
just the only time that changes at present.

To make this flow clearer, move the logic into the explicit backend
activate and deactivate hooks.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c       | 38 +++++++++++++++++++++
 hw/intc/xics_spapr.c       | 17 ++++++++++
 hw/ppc/spapr_irq.c         | 67 ++------------------------------------
 include/hw/ppc/spapr_irq.h |  4 ++-
 4 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 37ffb74ca5..1811653aac 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -640,6 +640,42 @@ static void spapr_xive_dt(SpaprInterruptController *=
intc, uint32_t nr_servers,
                      plat_res_int_priorities, sizeof(plat_res_int_priori=
ties)));
 }
=20
+static int spapr_xive_activate(SpaprInterruptController *intc, Error **e=
rrp)
+{
+    SpaprXive *xive =3D SPAPR_XIVE(intc);
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        PowerPCCPU *cpu =3D POWERPC_CPU(cs);
+
+        /* (TCG) Set the OS CAM line of the thread interrupt context. */
+        spapr_xive_set_tctx_os_cam(spapr_cpu_state(cpu)->tctx);
+    }
+
+    if (kvm_enabled()) {
+        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, errp);
+        if (rc < 0) {
+            return rc;
+        }
+    }
+
+    /* Activate the XIVE MMIOs */
+    spapr_xive_mmio_set_enabled(xive, true);
+
+    return 0;
+}
+
+static void spapr_xive_deactivate(SpaprInterruptController *intc)
+{
+    SpaprXive *xive =3D SPAPR_XIVE(intc);
+
+    spapr_xive_mmio_set_enabled(xive, false);
+
+    if (kvm_irqchip_in_kernel()) {
+        kvmppc_xive_disconnect(intc);
+    }
+}
+
 static void spapr_xive_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -658,6 +694,8 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->write_nvt =3D spapr_xive_write_nvt;
     xrc->get_tctx =3D spapr_xive_get_tctx;
=20
+    sicc->activate =3D spapr_xive_activate;
+    sicc->deactivate =3D spapr_xive_deactivate;
     sicc->cpu_intc_create =3D spapr_xive_cpu_intc_create;
     sicc->claim_irq =3D spapr_xive_claim_irq;
     sicc->free_irq =3D spapr_xive_free_irq;
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 4eabafc7e1..90b4d48877 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -395,6 +395,21 @@ static void xics_spapr_print_info(SpaprInterruptCont=
roller *intc, Monitor *mon)
     ics_pic_print_info(ics, mon);
 }
=20
+static int xics_spapr_activate(SpaprInterruptController *intc, Error **e=
rrp)
+{
+    if (kvm_enabled()) {
+        return spapr_irq_init_kvm(xics_kvm_connect, intc, errp);
+    }
+    return 0;
+}
+
+static void xics_spapr_deactivate(SpaprInterruptController *intc)
+{
+    if (kvm_irqchip_in_kernel()) {
+        xics_kvm_disconnect(intc);
+    }
+}
+
 static void ics_spapr_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -403,6 +418,8 @@ static void ics_spapr_class_init(ObjectClass *klass, =
void *data)
=20
     device_class_set_parent_realize(dc, ics_spapr_realize,
                                     &isc->parent_realize);
+    sicc->activate =3D xics_spapr_activate;
+    sicc->deactivate =3D xics_spapr_deactivate;
     sicc->cpu_intc_create =3D xics_spapr_cpu_intc_create;
     sicc->claim_irq =3D xics_spapr_claim_irq;
     sicc->free_irq =3D xics_spapr_free_irq;
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 7cd18e5b15..f70b331f44 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -65,9 +65,9 @@ void spapr_irq_msi_free(SpaprMachineState *spapr, int i=
rq, uint32_t num)
     bitmap_clear(spapr->irq_map, irq - SPAPR_IRQ_MSI, num);
 }
=20
-static int spapr_irq_init_kvm(int (*fn)(SpaprInterruptController *, Erro=
r **),
-                              SpaprInterruptController *intc,
-                              Error **errp)
+int spapr_irq_init_kvm(int (*fn)(SpaprInterruptController *, Error **),
+                       SpaprInterruptController *intc,
+                       Error **errp)
 {
     MachineState *machine =3D MACHINE(qdev_get_machine());
     Error *local_err =3D NULL;
@@ -112,11 +112,6 @@ static int spapr_irq_post_load_xics(SpaprMachineStat=
e *spapr, int version_id)
     return 0;
 }
=20
-static void spapr_irq_reset_xics(SpaprMachineState *spapr, Error **errp)
-{
-    spapr_irq_init_kvm(xics_kvm_connect, SPAPR_INTC(spapr->ics), errp);
-}
-
 SpaprIrq spapr_irq_xics =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
@@ -124,7 +119,6 @@ SpaprIrq spapr_irq_xics =3D {
     .xive        =3D false,
=20
     .post_load   =3D spapr_irq_post_load_xics,
-    .reset       =3D spapr_irq_reset_xics,
 };
=20
 /*
@@ -136,26 +130,6 @@ static int spapr_irq_post_load_xive(SpaprMachineStat=
e *spapr, int version_id)
     return spapr_xive_post_load(spapr->xive, version_id);
 }
=20
-static void spapr_irq_reset_xive(SpaprMachineState *spapr, Error **errp)
-{
-    CPUState *cs;
-
-    CPU_FOREACH(cs) {
-        PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-
-        /* (TCG) Set the OS CAM line of the thread interrupt context. */
-        spapr_xive_set_tctx_os_cam(spapr_cpu_state(cpu)->tctx);
-    }
-
-    if (spapr_irq_init_kvm(kvmppc_xive_connect,
-                           SPAPR_INTC(spapr->xive), errp) < 0) {
-        return;
-    }
-
-    /* Activate the XIVE MMIOs */
-    spapr_xive_mmio_set_enabled(spapr->xive, true);
-}
-
 SpaprIrq spapr_irq_xive =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
@@ -163,7 +137,6 @@ SpaprIrq spapr_irq_xive =3D {
     .xive        =3D true,
=20
     .post_load   =3D spapr_irq_post_load_xive,
-    .reset       =3D spapr_irq_reset_xive,
 };
=20
 /*
@@ -187,37 +160,9 @@ static SpaprIrq *spapr_irq_current(SpaprMachineState=
 *spapr)
=20
 static int spapr_irq_post_load_dual(SpaprMachineState *spapr, int versio=
n_id)
 {
-    /*
-     * Force a reset of the XIVE backend after migration. The machine
-     * defaults to XICS at startup.
-     */
-    if (spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
-        if (kvm_irqchip_in_kernel()) {
-            xics_kvm_disconnect(SPAPR_INTC(spapr->ics));
-        }
-        spapr_irq_xive.reset(spapr, &error_fatal);
-    }
-
     return spapr_irq_current(spapr)->post_load(spapr, version_id);
 }
=20
-static void spapr_irq_reset_dual(SpaprMachineState *spapr, Error **errp)
-{
-    /*
-     * Deactivate the XIVE MMIOs. The XIVE backend will reenable them
-     * if selected.
-     */
-    spapr_xive_mmio_set_enabled(spapr->xive, false);
-
-    /* Destroy all KVM devices */
-    if (kvm_irqchip_in_kernel()) {
-        xics_kvm_disconnect(SPAPR_INTC(spapr->ics));
-        kvmppc_xive_disconnect(SPAPR_INTC(spapr->xive));
-    }
-
-    spapr_irq_current(spapr)->reset(spapr, errp);
-}
-
 /*
  * Define values in sync with the XIVE and XICS backend
  */
@@ -228,7 +173,6 @@ SpaprIrq spapr_irq_dual =3D {
     .xive        =3D true,
=20
     .post_load   =3D spapr_irq_post_load_dual,
-    .reset       =3D spapr_irq_reset_dual,
 };
=20
=20
@@ -512,10 +456,6 @@ void spapr_irq_reset(SpaprMachineState *spapr, Error=
 **errp)
     assert(!spapr->irq_map || bitmap_empty(spapr->irq_map, spapr->irq_ma=
p_nr));
=20
     spapr_irq_update_active_intc(spapr);
-
-    if (spapr->irq->reset) {
-        spapr->irq->reset(spapr, errp);
-    }
 }
=20
 int spapr_irq_get_phandle(SpaprMachineState *spapr, void *fdt, Error **e=
rrp)
@@ -651,7 +591,6 @@ SpaprIrq spapr_irq_xics_legacy =3D {
     .xive        =3D false,
=20
     .post_load   =3D spapr_irq_post_load_xics,
-    .reset       =3D spapr_irq_reset_xics,
 };
=20
 static void spapr_irq_register_types(void)
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 06179b271f..e02e44624b 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -84,7 +84,6 @@ typedef struct SpaprIrq {
     bool        xive;
=20
     int (*post_load)(SpaprMachineState *spapr, int version_id);
-    void (*reset)(SpaprMachineState *spapr, Error **errp);
 } SpaprIrq;
=20
 extern SpaprIrq spapr_irq_xics;
@@ -99,6 +98,9 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq);
 int spapr_irq_post_load(SpaprMachineState *spapr, int version_id);
 void spapr_irq_reset(SpaprMachineState *spapr, Error **errp);
 int spapr_irq_get_phandle(SpaprMachineState *spapr, void *fdt, Error **e=
rrp);
+int spapr_irq_init_kvm(int (*fn)(SpaprInterruptController *, Error **),
+                       SpaprInterruptController *intc,
+                       Error **errp);
=20
 /*
  * XICS legacy routines
--=20
2.21.0


