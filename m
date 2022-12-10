Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB951648E65
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 12:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3xvU-00049B-OY; Sat, 10 Dec 2022 06:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3xvS-00048d-Et
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3xvO-00047D-RC
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670671305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvr7qteM6KPWgU+0yfMSh31RnTlgr9tnlKItVVdHqj0=;
 b=Vz3dzyfpTIbuvycmfznd4kRmDzCrmJfEaktI3hlsfK+4YmRvdkwXo/B90QYK0yV7ZFG0gl
 jSAeHH9e55k4s6R+IbCC1aQktoweHGxsrUkZk3PEEJKNBguNNB7lqGdOmE5frVIw8Qipr7
 NMm7+Aa8Y+h1M9hfEnTZpUNHW1EGFPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-hT43HFBwPwibPJP3gicswg-1; Sat, 10 Dec 2022 06:21:44 -0500
X-MC-Unique: hT43HFBwPwibPJP3gicswg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B841529AB45D;
 Sat, 10 Dec 2022 11:21:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 537C8C15BB2;
 Sat, 10 Dec 2022 11:21:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4556F21E6930; Sat, 10 Dec 2022 12:21:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/4] include/hw/ppc: Split pnv_chip.h off pnv.h
Date: Sat, 10 Dec 2022 12:21:37 +0100
Message-Id: <20221210112140.4057731-2-armbru@redhat.com>
In-Reply-To: <20221210112140.4057731-1-armbru@redhat.com>
References: <20221210112140.4057731-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip are defined
in pnv.h.  Many users of the header don't actually need them.  One
instance is this inclusion loop: hw/ppc/pnv_homer.h includes
hw/ppc/pnv.h for typedef PnvChip, and vice versa for struct PnvHomer.

Similar structs live in their own headers: PnvHomerClass and PnvHomer
in pnv_homer.h, PnvLpcClass and PnvLpcController in pci_lpc.h,
PnvPsiClass, PnvPsi, Pnv8Psi, Pnv9Psi, Pnv10Psi in pnv_psi.h, ...

Move PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip to new
pnv_chip.h, and adjust include directives.  This breaks the inclusion
loop mentioned above.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/ppc/pnv.h       | 143 +-----------------------------------
 include/hw/ppc/pnv_chip.h  | 147 +++++++++++++++++++++++++++++++++++++
 hw/intc/pnv_xive.c         |   1 +
 hw/intc/pnv_xive2.c        |   1 +
 hw/pci-host/pnv_phb3.c     |   1 +
 hw/pci-host/pnv_phb4_pec.c |   1 +
 hw/ppc/pnv.c               |   3 +
 hw/ppc/pnv_core.c          |   1 +
 hw/ppc/pnv_homer.c         |   1 +
 hw/ppc/pnv_lpc.c           |   1 +
 hw/ppc/pnv_xscom.c         |   1 +
 11 files changed, 160 insertions(+), 141 deletions(-)
 create mode 100644 include/hw/ppc/pnv_chip.h

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 9ef7e2d0dc..ca49e4281d 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -20,158 +20,19 @@
 #ifndef PPC_PNV_H
 #define PPC_PNV_H
 
+#include "cpu.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/ipmi/ipmi.h"
-#include "hw/ppc/pnv_lpc.h"
 #include "hw/ppc/pnv_pnor.h"
-#include "hw/ppc/pnv_psi.h"
-#include "hw/ppc/pnv_occ.h"
-#include "hw/ppc/pnv_sbe.h"
-#include "hw/ppc/pnv_homer.h"
-#include "hw/ppc/pnv_xive.h"
-#include "hw/ppc/pnv_core.h"
-#include "hw/pci-host/pnv_phb3.h"
-#include "hw/pci-host/pnv_phb4.h"
 #include "hw/pci-host/pnv_phb.h"
-#include "qom/object.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
-OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
-                    PNV_CHIP)
 
-struct PnvChip {
-    /*< private >*/
-    SysBusDevice parent_obj;
-
-    /*< public >*/
-    uint32_t     chip_id;
-    uint64_t     ram_start;
-    uint64_t     ram_size;
-
-    uint32_t     nr_cores;
-    uint32_t     nr_threads;
-    uint64_t     cores_mask;
-    PnvCore      **cores;
-
-    uint32_t     num_pecs;
-
-    MemoryRegion xscom_mmio;
-    MemoryRegion xscom;
-    AddressSpace xscom_as;
-
-    MemoryRegion *fw_mr;
-    gchar        *dt_isa_nodename;
-};
-
-#define TYPE_PNV8_CHIP "pnv8-chip"
+typedef struct PnvChip PnvChip;
 typedef struct Pnv8Chip Pnv8Chip;
-DECLARE_INSTANCE_CHECKER(Pnv8Chip, PNV8_CHIP,
-                         TYPE_PNV8_CHIP)
-
-struct Pnv8Chip {
-    /*< private >*/
-    PnvChip      parent_obj;
-
-    /*< public >*/
-    MemoryRegion icp_mmio;
-
-    PnvLpcController lpc;
-    Pnv8Psi      psi;
-    PnvOCC       occ;
-    PnvHomer     homer;
-
-#define PNV8_CHIP_PHB3_MAX 4
-    /*
-     * The array is used to allow quick access to the phbs by
-     * pnv_ics_get_child() and pnv_ics_resend_child().
-     */
-    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
-    uint32_t     num_phbs;
-
-    XICSFabric    *xics;
-};
-
-#define TYPE_PNV9_CHIP "pnv9-chip"
 typedef struct Pnv9Chip Pnv9Chip;
-DECLARE_INSTANCE_CHECKER(Pnv9Chip, PNV9_CHIP,
-                         TYPE_PNV9_CHIP)
-
-struct Pnv9Chip {
-    /*< private >*/
-    PnvChip      parent_obj;
-
-    /*< public >*/
-    PnvXive      xive;
-    Pnv9Psi      psi;
-    PnvLpcController lpc;
-    PnvOCC       occ;
-    PnvSBE       sbe;
-    PnvHomer     homer;
-
-    uint32_t     nr_quads;
-    PnvQuad      *quads;
-
-#define PNV9_CHIP_MAX_PEC 3
-    PnvPhb4PecState pecs[PNV9_CHIP_MAX_PEC];
-};
-
-/*
- * A SMT8 fused core is a pair of SMT4 cores.
- */
-#define PNV9_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
-#define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
-
-#define TYPE_PNV10_CHIP "pnv10-chip"
 typedef struct Pnv10Chip Pnv10Chip;
-DECLARE_INSTANCE_CHECKER(Pnv10Chip, PNV10_CHIP,
-                         TYPE_PNV10_CHIP)
-
-struct Pnv10Chip {
-    /*< private >*/
-    PnvChip      parent_obj;
-
-    /*< public >*/
-    PnvXive2     xive;
-    Pnv9Psi      psi;
-    PnvLpcController lpc;
-    PnvOCC       occ;
-    PnvSBE       sbe;
-    PnvHomer     homer;
-
-    uint32_t     nr_quads;
-    PnvQuad      *quads;
-
-#define PNV10_CHIP_MAX_PEC 2
-    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
-};
-
-#define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
-#define PNV10_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
-
-struct PnvChipClass {
-    /*< private >*/
-    SysBusDeviceClass parent_class;
-
-    /*< public >*/
-    uint64_t     chip_cfam_id;
-    uint64_t     cores_mask;
-    uint32_t     num_pecs;
-    uint32_t     num_phbs;
-
-    DeviceRealize parent_realize;
-
-    uint32_t (*core_pir)(PnvChip *chip, uint32_t core_id);
-    void (*intc_create)(PnvChip *chip, PowerPCCPU *cpu, Error **errp);
-    void (*intc_reset)(PnvChip *chip, PowerPCCPU *cpu);
-    void (*intc_destroy)(PnvChip *chip, PowerPCCPU *cpu);
-    void (*intc_print_info)(PnvChip *chip, PowerPCCPU *cpu, Monitor *mon);
-    ISABus *(*isa_create)(PnvChip *chip, Error **errp);
-    void (*dt_populate)(PnvChip *chip, void *fdt);
-    void (*pic_print_info)(PnvChip *chip, Monitor *mon);
-    uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
-    uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
-};
 
 #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP
 #define PNV_CHIP_TYPE_NAME(cpu_model) cpu_model PNV_CHIP_TYPE_SUFFIX
diff --git a/include/hw/ppc/pnv_chip.h b/include/hw/ppc/pnv_chip.h
new file mode 100644
index 0000000000..53e1d921d7
--- /dev/null
+++ b/include/hw/ppc/pnv_chip.h
@@ -0,0 +1,147 @@
+#ifndef PPC_PNV_CHIP_H
+#define PPC_PNV_CHIP_H
+
+#include "hw/pci-host/pnv_phb4.h"
+#include "hw/ppc/pnv_core.h"
+#include "hw/ppc/pnv_homer.h"
+#include "hw/ppc/pnv_lpc.h"
+#include "hw/ppc/pnv_occ.h"
+#include "hw/ppc/pnv_psi.h"
+#include "hw/ppc/pnv_sbe.h"
+#include "hw/ppc/pnv_xive.h"
+#include "hw/sysbus.h"
+
+OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
+                    PNV_CHIP)
+
+struct PnvChip {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    uint32_t     chip_id;
+    uint64_t     ram_start;
+    uint64_t     ram_size;
+
+    uint32_t     nr_cores;
+    uint32_t     nr_threads;
+    uint64_t     cores_mask;
+    PnvCore      **cores;
+
+    uint32_t     num_pecs;
+
+    MemoryRegion xscom_mmio;
+    MemoryRegion xscom;
+    AddressSpace xscom_as;
+
+    MemoryRegion *fw_mr;
+    gchar        *dt_isa_nodename;
+};
+
+#define TYPE_PNV8_CHIP "pnv8-chip"
+DECLARE_INSTANCE_CHECKER(Pnv8Chip, PNV8_CHIP,
+                         TYPE_PNV8_CHIP)
+
+struct Pnv8Chip {
+    /*< private >*/
+    PnvChip      parent_obj;
+
+    /*< public >*/
+    MemoryRegion icp_mmio;
+
+    PnvLpcController lpc;
+    Pnv8Psi      psi;
+    PnvOCC       occ;
+    PnvHomer     homer;
+
+#define PNV8_CHIP_PHB3_MAX 4
+    /*
+     * The array is used to allow quick access to the phbs by
+     * pnv_ics_get_child() and pnv_ics_resend_child().
+     */
+    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
+    uint32_t     num_phbs;
+
+    XICSFabric    *xics;
+};
+
+#define TYPE_PNV9_CHIP "pnv9-chip"
+DECLARE_INSTANCE_CHECKER(Pnv9Chip, PNV9_CHIP,
+                         TYPE_PNV9_CHIP)
+
+struct Pnv9Chip {
+    /*< private >*/
+    PnvChip      parent_obj;
+
+    /*< public >*/
+    PnvXive      xive;
+    Pnv9Psi      psi;
+    PnvLpcController lpc;
+    PnvOCC       occ;
+    PnvSBE       sbe;
+    PnvHomer     homer;
+
+    uint32_t     nr_quads;
+    PnvQuad      *quads;
+
+#define PNV9_CHIP_MAX_PEC 3
+    PnvPhb4PecState pecs[PNV9_CHIP_MAX_PEC];
+};
+
+/*
+ * A SMT8 fused core is a pair of SMT4 cores.
+ */
+#define PNV9_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
+#define PNV9_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
+
+#define TYPE_PNV10_CHIP "pnv10-chip"
+DECLARE_INSTANCE_CHECKER(Pnv10Chip, PNV10_CHIP,
+                         TYPE_PNV10_CHIP)
+
+struct Pnv10Chip {
+    /*< private >*/
+    PnvChip      parent_obj;
+
+    /*< public >*/
+    PnvXive2     xive;
+    Pnv9Psi      psi;
+    PnvLpcController lpc;
+    PnvOCC       occ;
+    PnvSBE       sbe;
+    PnvHomer     homer;
+
+    uint32_t     nr_quads;
+    PnvQuad      *quads;
+
+#define PNV10_CHIP_MAX_PEC 2
+    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
+};
+
+#define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
+#define PNV10_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
+
+struct PnvChipClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+
+    /*< public >*/
+    uint64_t     chip_cfam_id;
+    uint64_t     cores_mask;
+    uint32_t     num_pecs;
+    uint32_t     num_phbs;
+
+    DeviceRealize parent_realize;
+
+    uint32_t (*core_pir)(PnvChip *chip, uint32_t core_id);
+    void (*intc_create)(PnvChip *chip, PowerPCCPU *cpu, Error **errp);
+    void (*intc_reset)(PnvChip *chip, PowerPCCPU *cpu);
+    void (*intc_destroy)(PnvChip *chip, PowerPCCPU *cpu);
+    void (*intc_print_info)(PnvChip *chip, PowerPCCPU *cpu, Monitor *mon);
+    ISABus *(*isa_create)(PnvChip *chip, Error **errp);
+    void (*dt_populate)(PnvChip *chip, void *fdt);
+    void (*pic_print_info)(PnvChip *chip, Monitor *mon);
+    uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
+    uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
+};
+
+#endif
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index c7b75ed12e..622f9d28b7 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -18,6 +18,7 @@
 #include "monitor/monitor.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_core.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/pnv_xive.h"
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index f22ce5ca59..7176d70234 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -16,6 +16,7 @@
 #include "monitor/monitor.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_core.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xive2.h"
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 9054c393a2..7a21497cf8 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -16,6 +16,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 9871f462cd..43267a428f 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -17,6 +17,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3d01e26f84..44b1fbbc93 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -44,9 +44,12 @@
 #include "target/ppc/mmu-hash64.h"
 #include "hw/pci/msi.h"
 #include "hw/pci-host/pnv_phb.h"
+#include "hw/pci-host/pnv_phb3.h"
+#include "hw/pci-host/pnv_phb4.h"
 
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/pnv_pnor.h"
 
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 9ee79192dd..410f31bdf8 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -25,6 +25,7 @@
 #include "target/ppc/cpu.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_core.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xics.h"
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index ea73919e54..f9a203d11d 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -25,6 +25,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_homer.h"
 #include "hw/ppc/pnv_xscom.h"
 
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index ee890e7ab4..71143b7692 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -26,6 +26,7 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_lpc.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/fdt.h"
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index 79f10de57f..d820e05e40 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -26,6 +26,7 @@
 
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_chip.h"
 #include "hw/ppc/pnv_xscom.h"
 
 #include <libfdt.h>
-- 
2.37.3


