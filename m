Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C94CECF1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 18:56:34 +0100 (CET)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQv7S-0004wq-0b
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 12:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQv4H-0006OM-Nn
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:53:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQv4F-0003Ua-Kn
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:53:17 -0500
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KBTgG5l5Vz67MV8;
 Mon,  7 Mar 2022 01:51:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 18:53:13 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 17:53:12 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v7 23/46] hw/cxl/component: Implement host bridge MMIO (8.2.5,
 table 142)
Date: Sun, 6 Mar 2022 17:41:14 +0000
Message-ID: <20220306174137.5707-24-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

CXL host bridges themselves may have MMIO. Since host bridges don't have
a BAR they are treated as special for MMIO.  This patch includes
i386/pc support.
Also hook up the device reset now that we have have the MMIO
space in which the results are visible.

Note that we duplicate the PCI express case for the aml_build but
the implementations will diverge when the CXL specific _OSC is
introduced.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/i386/acpi-build.c                | 25 +++++++++++-
 hw/i386/pc.c                        | 27 ++++++++++++-
 hw/pci-bridge/pci_expander_bridge.c | 62 ++++++++++++++++++++++++++++-
 include/hw/cxl/cxl.h                |  4 ++
 4 files changed, 114 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ebd47aa26f..0a28dd6d4e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -28,6 +28,7 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
 #include "hw/core/cpu.h"
 #include "target/i386/cpu.h"
 #include "hw/misc/pvpanic.h"
@@ -1564,10 +1565,21 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             }
 
             scope = aml_scope("\\_SB");
-            dev = aml_device("PC%.02X", bus_num);
+
+            if (pci_bus_is_cxl(bus)) {
+                dev = aml_device("CL%.02X", bus_num);
+            } else {
+                dev = aml_device("PC%.02X", bus_num);
+            }
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            if (pci_bus_is_express(bus)) {
+            if (pci_bus_is_cxl(bus)) {
+                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+
+                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+                aml_append(dev, build_q35_osc_method(true));
+            } else if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
 
@@ -1587,6 +1599,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_CRS", crs));
             aml_append(scope, dev);
             aml_append(dsdt, scope);
+
+            /* Handle the ranges for the PXB expanders */
+            if (pci_bus_is_cxl(bus)) {
+                MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+                uint64_t base = mr->addr;
+
+                crs_range_insert(crs_range_set.mem_ranges, base,
+                                 base + memory_region_size(mr) - 1);
+            }
         }
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b6800a511a..7a18dce529 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -75,6 +75,7 @@
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/cxl/cxl.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
@@ -815,6 +816,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr cxl_base;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -904,6 +906,26 @@ void pc_memory_init(PCMachineState *pcms,
                                     &machine->device_memory->mr);
     }
 
+    if (machine->cxl_devices_state->is_enabled) {
+        MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+        hwaddr cxl_size = MiB;
+
+        if (pcmc->has_reserved_memory && machine->device_memory->base) {
+            cxl_base = machine->device_memory->base;
+            if (!pcmc->broken_reserved_end) {
+                cxl_base += memory_region_size(&machine->device_memory->mr);
+            }
+        } else if (pcms->sgx_epc.size != 0) {
+            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
+        } else {
+            cxl_base = 0x100000000ULL + x86ms->above_4g_mem_size;
+        }
+
+        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
+        memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
+        memory_region_add_subregion(system_memory, cxl_base, mr);
+    }
+
     /* Initialize PC system firmware */
     pc_system_firmware_init(pcms, rom_memory);
 
@@ -964,7 +986,10 @@ uint64_t pc_pci_hole64_start(void)
     X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (pcmc->has_reserved_memory && ms->device_memory->base) {
+    if (ms->cxl_devices_state->host_mr.addr) {
+        hole64_start = ms->cxl_devices_state->host_mr.addr +
+            memory_region_size(&ms->cxl_devices_state->host_mr);
+    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index f762eb4a6e..b3b5f93650 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -75,6 +75,9 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
+    struct cxl_dev {
+        CXLHost *cxl_host_bridge;
+    } cxl;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -92,6 +95,9 @@ static GList *pxb_dev_list;
 
 #define TYPE_PXB_HOST "pxb-host"
 
+#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
+#define PXB_CXL_HOST(obj) OBJECT_CHECK(CXLHost, (obj), TYPE_PXB_CXL_HOST)
+
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
@@ -197,6 +203,52 @@ static const TypeInfo pxb_host_info = {
     .class_init    = pxb_host_class_init,
 };
 
+static void pxb_cxl_realize(DeviceState *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    CXLHost *cxl = PXB_CXL_HOST(dev);
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+    hwaddr offset;
+
+    cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
+                                      TYPE_PXB_CXL_HOST);
+    sysbus_init_mmio(sbd, mr);
+
+    offset = memory_region_size(mr) * ms->cxl_devices_state->next_mr_idx;
+    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
+        error_setg(errp, "Insufficient space for pxb cxl host register space");
+        return;
+    }
+
+    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offset, mr);
+    ms->cxl_devices_state->next_mr_idx++;
+}
+
+static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(class);
+
+    hc->root_bus_path = pxb_host_root_bus_path;
+    dc->fw_name = "cxl";
+    dc->realize = pxb_cxl_realize;
+    /* Reason: Internal part of the pxb/pxb-pcie device, not usable by itself */
+    dc->user_creatable = false;
+}
+
+/*
+ * This is a device to handle the MMIO for a CXL host bridge. It does nothing
+ * else.
+ */
+static const TypeInfo cxl_host_info = {
+    .name          = TYPE_PXB_CXL_HOST,
+    .parent        = TYPE_PCI_HOST_BRIDGE,
+    .instance_size = sizeof(CXLHost),
+    .class_init    = pxb_cxl_host_class_init,
+};
+
 /*
  * Registers the PXB bus as a child of pci host root bus.
  */
@@ -245,6 +297,12 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 
 static void pxb_dev_reset(DeviceState *dev)
 {
+    CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
+
+    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
 }
 
 static gint pxb_compare(gconstpointer a, gconstpointer b)
@@ -281,12 +339,13 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
         dev_name = dev->qdev.id;
     }
 
-    ds = qdev_new(TYPE_PXB_HOST);
+    ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
         bus->flags |= PCI_BUS_CXL;
+        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
@@ -475,6 +534,7 @@ static void pxb_register_types(void)
     type_register_static(&pxb_pcie_bus_info);
     type_register_static(&pxb_cxl_bus_info);
     type_register_static(&pxb_host_info);
+    type_register_static(&cxl_host_info);
     type_register_static(&pxb_dev_info);
     type_register_static(&pxb_pcie_dev_info);
     type_register_static(&pxb_cxl_dev_info);
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 31af92fd5e..75e5bf71e1 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -17,8 +17,12 @@
 #define CXL_COMPONENT_REG_BAR_IDX 0
 #define CXL_DEVICE_REG_BAR_IDX 2
 
+#define CXL_WINDOW_MAX 10
+
 typedef struct CXLState {
     bool is_enabled;
+    MemoryRegion host_mr;
+    unsigned int next_mr_idx;
 } CXLState;
 
 #endif
-- 
2.32.0


