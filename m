Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55B9BFF29
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 08:35:43 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjqv-0008F9-RA
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 02:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9v-0007YF-Gs
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9t-0005iw-DD
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:51:15 -0400
Received: from ozlabs.org ([203.11.71.1]:44787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9s-0005eC-R7; Fri, 27 Sep 2019 01:51:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrJ0mPFz9sRp; Fri, 27 Sep 2019 15:50:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563440;
 bh=WsBAeucLTRlBUSu8uUJrVdP7flbCnws+2WmbX760dSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gSiDlcjTy7TGPAZ+IbBhBI73U25Ipb4Z0AxcCpVizEK7GQXHtM6o16AquzcT9sIKf
 CLuaxa5aIEMc5LiBSh2+Yd7bcEh4nJeKyhZZlF2hLthN2hnJqgVqzydcpuKKKcQ5Xd
 G5QWSu3k3vMjC+G0xFZh0GwBmjTPZ662u0lqNVOs=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 31/33] spapr: Remove SpaprIrq::nr_msis
Date: Fri, 27 Sep 2019 15:50:26 +1000
Message-Id: <20190927055028.11493-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
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

The nr_msis value we use here has to line up with whether we're using
legacy or modern irq allocation.  Therefore it's safer to derive it based
on legacy_irq_allocation rather than having SpaprIrq contain a canned
value.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              |  5 ++---
 hw/ppc/spapr_irq.c          | 26 +++++++++++++++++---------
 hw/ppc/spapr_pci.c          |  7 ++++---
 include/hw/pci-host/spapr.h |  4 ++--
 include/hw/ppc/spapr_irq.h  |  5 +----
 5 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f55d227cd3..34b693beba 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1345,7 +1345,7 @@ static void *spapr_build_fdt(SpaprMachineState *spa=
pr)
     }
=20
     QLIST_FOREACH(phb, &spapr->phbs, list) {
-        ret =3D spapr_dt_phb(phb, PHANDLE_INTC, fdt, spapr->irq->nr_msis=
, NULL);
+        ret =3D spapr_dt_phb(spapr, phb, PHANDLE_INTC, fdt, NULL);
         if (ret < 0) {
             error_report("couldn't setup PCI devices in fdt");
             exit(1);
@@ -3980,8 +3980,7 @@ int spapr_phb_dt_populate(SpaprDrc *drc, SpaprMachi=
neState *spapr,
         return -1;
     }
=20
-    if (spapr_dt_phb(sphb, intc_phandle, fdt, spapr->irq->nr_msis,
-                     fdt_start_offset)) {
+    if (spapr_dt_phb(spapr, sphb, intc_phandle, fdt, fdt_start_offset)) =
{
         error_setg(errp, "unable to create FDT node for PHB %d", sphb->i=
ndex);
         return -1;
     }
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 040384b0fe..799755c811 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -29,9 +29,14 @@ static const TypeInfo spapr_intc_info =3D {
     .class_size =3D sizeof(SpaprInterruptControllerClass),
 };
=20
-void spapr_irq_msi_init(SpaprMachineState *spapr, uint32_t nr_msis)
+static void spapr_irq_msi_init(SpaprMachineState *spapr)
 {
-    spapr->irq_map_nr =3D nr_msis;
+    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
+        /* Legacy mode doesn't use this allocater */
+        return;
+    }
+
+    spapr->irq_map_nr =3D spapr_irq_nr_msis(spapr);
     spapr->irq_map =3D bitmap_new(spapr->irq_map_nr);
 }
=20
@@ -102,7 +107,6 @@ int spapr_irq_init_kvm(int (*fn)(SpaprInterruptContro=
ller *, Error **),
=20
 SpaprIrq spapr_irq_xics =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
-    .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D true,
     .xive        =3D false,
 };
@@ -113,7 +117,6 @@ SpaprIrq spapr_irq_xics =3D {
=20
 SpaprIrq spapr_irq_xive =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
-    .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D false,
     .xive        =3D true,
 };
@@ -132,7 +135,6 @@ SpaprIrq spapr_irq_xive =3D {
  */
 SpaprIrq spapr_irq_dual =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
-    .nr_msis     =3D SPAPR_NR_MSIS,
     .xics        =3D true,
     .xive        =3D true,
 };
@@ -245,6 +247,15 @@ void spapr_irq_dt(SpaprMachineState *spapr, uint32_t=
 nr_servers,
     sicc->dt(spapr->active_intc, nr_servers, fdt, phandle);
 }
=20
+uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr)
+{
+    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
+        return spapr->irq->nr_xirqs;
+    } else {
+        return SPAPR_XIRQ_BASE + spapr->irq->nr_xirqs - SPAPR_IRQ_MSI;
+    }
+}
+
 void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
 {
     MachineState *machine =3D MACHINE(spapr);
@@ -267,9 +278,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
     }
=20
     /* Initialize the MSI IRQ allocator. */
-    if (!SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
-        spapr_irq_msi_init(spapr, spapr->irq->nr_msis);
-    }
+    spapr_irq_msi_init(spapr);
=20
     if (spapr->irq->xics) {
         Object *obj;
@@ -558,7 +567,6 @@ int spapr_irq_find(SpaprMachineState *spapr, int num,=
 bool align, Error **errp)
=20
 SpaprIrq spapr_irq_xics_legacy =3D {
     .nr_xirqs    =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
-    .nr_msis     =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
     .xics        =3D true,
     .xive        =3D false,
 };
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 6934d506a7..8ed06e5964 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2305,8 +2305,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *=
phb)
=20
 }
=20
-int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_phandle, void *fdt,
-                 uint32_t nr_msis, int *node_offset)
+int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
+                 uint32_t intc_phandle, void *fdt, int *node_offset)
 {
     int bus_off, i, j, ret;
     uint32_t bus_range[] =3D { cpu_to_be32(0), cpu_to_be32(0xff) };
@@ -2371,7 +2371,8 @@ int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_=
phandle, void *fdt,
     _FDT(fdt_setprop(fdt, bus_off, "ranges", &ranges, sizeof_ranges));
     _FDT(fdt_setprop(fdt, bus_off, "reg", &bus_reg, sizeof(bus_reg)));
     _FDT(fdt_setprop_cell(fdt, bus_off, "ibm,pci-config-space-type", 0x1=
));
-    _FDT(fdt_setprop_cell(fdt, bus_off, "ibm,pe-total-#msi", nr_msis));
+    _FDT(fdt_setprop_cell(fdt, bus_off, "ibm,pe-total-#msi",
+                          spapr_irq_nr_msis(spapr)));
=20
     /* Dynamic DMA window */
     if (phb->ddw_enabled) {
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 23506f05d9..8877ff51fb 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -128,8 +128,8 @@ struct SpaprPhbState {
 #define SPAPR_PCI_NV2ATSD_WIN_SIZE   (NVGPU_MAX_NUM * NVGPU_MAX_LINKS * =
\
                                       64 * KiB)
=20
-int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_phandle, void *fdt,
-                 uint32_t nr_msis, int *node_offset);
+int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
+                 uint32_t intc_phandle, void *fdt, int *node_offset);
=20
 void spapr_pci_rtas_init(void);
=20
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index bc379b0761..308bfcefd1 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -27,7 +27,6 @@
 #define SPAPR_IRQ_MSI        (SPAPR_XIRQ_BASE + 0x0300)
=20
 #define SPAPR_NR_XIRQS       0x1000
-#define SPAPR_NR_MSIS        (SPAPR_XIRQ_BASE + SPAPR_NR_XIRQS - SPAPR_I=
RQ_MSI)
=20
 typedef struct SpaprMachineState SpaprMachineState;
=20
@@ -72,15 +71,13 @@ void spapr_irq_dt(SpaprMachineState *spapr, uint32_t =
nr_servers,
                   void *fdt, uint32_t phandle);
 int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
                               PowerPCCPU *cpu, Error **errp);
-
-void spapr_irq_msi_init(SpaprMachineState *spapr, uint32_t nr_msis);
+uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr);
 int spapr_irq_msi_alloc(SpaprMachineState *spapr, uint32_t num, bool ali=
gn,
                         Error **errp);
 void spapr_irq_msi_free(SpaprMachineState *spapr, int irq, uint32_t num)=
;
=20
 typedef struct SpaprIrq {
     uint32_t    nr_xirqs;
-    uint32_t    nr_msis;
     bool        xics;
     bool        xive;
 } SpaprIrq;
--=20
2.21.0


