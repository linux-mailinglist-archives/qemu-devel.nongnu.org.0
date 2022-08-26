Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10045A252D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:56:39 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRW4s-0002VQ-Vt
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oRW1J-0006Z2-4g
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:52:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52018 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oRW1F-0005vb-Lo
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:52:56 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72vslwhjn00KAA--.42825S3; 
 Fri, 26 Aug 2022 17:52:45 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 1/2] hw/loongarch: Support memory hotplug
Date: Fri, 26 Aug 2022 17:52:43 +0800
Message-Id: <20220826095244.613426-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826095244.613426-1-yangxiaojuan@loongson.cn>
References: <20220826095244.613426-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72vslwhjn00KAA--.42825S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JryUCr1Dtr4fWFW5Gw4DArb_yoW3Zr4rpa
 1UZF90vr4UWFnxZ3s3tr98WF1rAr4Ika4jqF1IyrWkKFnrWryDAryFk34Yga4UJ34kXF15
 u3s8Ja12ga13JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Add hotplug/unplug interface for memory device.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig      |   2 +
 hw/loongarch/acpi-build.c |  32 +++++++++---
 hw/loongarch/virt.c       | 105 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 132 insertions(+), 7 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index fef55c5638..17d15b6c90 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -4,6 +4,7 @@ config LOONGARCH_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     imply VIRTIO_VGA
     imply PCI_DEVICES
+    imply NVDIMM
     select ISA_BUS
     select SERIAL
     select SERIAL_ISA
@@ -18,3 +19,4 @@ config LOONGARCH_VIRT
     select ACPI_PCI
     select ACPI_HW_REDUCED
     select FW_CFG_DMA
+    select DIMM
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 95e30975a8..92ee62c11a 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -186,6 +186,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_srat_memory(table_data, VIRT_HIGHMEM_BASE, machine->ram_size - VIRT_LOWMEM_SIZE,
                       0, MEM_AFFINITY_ENABLED);
 
+    if (ms->device_memory) {
+        build_srat_memory(table_data, ms->device_memory->base,
+                          memory_region_size(&ms->device_memory->mr),
+                          0, MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+    }
+
     acpi_table_end(linker, &table);
 }
 
@@ -335,6 +341,25 @@ static void build_uart_device_aml(Aml *table)
     aml_append(table, scope);
 }
 
+static void
+build_la_ged_aml(Aml *dsdt, MachineState *machine)
+{
+    uint32_t event;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+
+    build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
+                  HOTPLUG_HANDLER(lams->acpi_ged),
+                  VIRT_SCI_IRQ, AML_SYSTEM_MEMORY,
+                  VIRT_GED_EVT_ADDR);
+    event = object_property_get_uint(OBJECT(lams->acpi_ged),
+                                     "ged-event", &error_abort);
+    if (event & ACPI_GED_MEM_HOTPLUG_EVT) {
+        build_memory_hotplug_aml(dsdt, machine->ram_slots, "\\_SB", NULL,
+                                 AML_SYSTEM_MEMORY,
+                                 VIRT_GED_MEM_ADDR);
+    }
+}
+
 /* build DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
@@ -364,12 +389,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 
     build_gpex_pci0_int(dsdt);
     build_uart_device_aml(dsdt);
-    if (lams->acpi_ged) {
-        build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
-                      HOTPLUG_HANDLER(lams->acpi_ged),
-                      VIRT_SCI_IRQ, AML_SYSTEM_MEMORY,
-                      VIRT_GED_EVT_ADDR);
-    }
+    build_la_ged_aml(dsdt, machine);
 
     scope = aml_scope("\\_SB.PCI0");
     /* Build PCI0._CRS */
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 1e1dc699ef..a81db29384 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -40,6 +40,7 @@
 #include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/display/ramfb.h"
+#include "hw/mem/pc-dimm.h"
 
 static void create_fdt(LoongArchMachineState *lams)
 {
@@ -719,6 +720,35 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
     memmap_add_entry(0x90000000, highram_size, 1);
+
+    /* initialize device memory address space */
+    if (machine->ram_size < machine->maxram_size) {
+        machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
+        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+
+        if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
+            error_report("unsupported amount of memory slots: %"PRIu64,
+                         machine->ram_slots);
+            exit(EXIT_FAILURE);
+        }
+
+        if (QEMU_ALIGN_UP(machine->maxram_size,
+                          TARGET_PAGE_SIZE) != machine->maxram_size) {
+            error_report("maximum memory size must by aligned to multiple of "
+                         "%d bytes", TARGET_PAGE_SIZE);
+            exit(EXIT_FAILURE);
+        }
+        /* device memory base is the top of high memory address. */
+        machine->device_memory->base = 0x90000000 + highram_size;
+        machine->device_memory->base =
+            ROUND_UP(machine->device_memory->base, 1 * GiB);
+
+        memory_region_init(&machine->device_memory->mr, OBJECT(lams),
+                           "device-memory", device_mem_size);
+        memory_region_add_subregion(address_space_mem, machine->device_memory->base,
+                                    &machine->device_memory->mr);
+    }
+
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, VIRT_ISA_IO_SIZE);
@@ -805,6 +835,73 @@ static void loongarch_machine_initfn(Object *obj)
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
+static bool memhp_type_supported(DeviceState *dev)
+{
+    /* we only support pc dimm now */
+    return object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
+           !object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
+}
+
+static void virt_mem_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                 Error **errp)
+{
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+}
+
+static void virt_machine_device_pre_plug(HotplugHandler *hotplug_dev,
+                                            DeviceState *dev, Error **errp)
+{
+    if (memhp_type_supported(dev)) {
+        virt_mem_pre_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_mem_unplug_request(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(hotplug_dev);
+
+    /* the acpi ged is always exist */
+    hotplug_handler_unplug_request(HOTPLUG_HANDLER(lams->acpi_ged), dev,
+                                   errp);
+}
+
+static void virt_machine_device_unplug_request(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    if (memhp_type_supported(dev)) {
+        virt_mem_unplug_request(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_mem_unplug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(hotplug_dev);
+
+    hotplug_handler_unplug(HOTPLUG_HANDLER(lams->acpi_ged), dev, errp);
+    pc_dimm_unplug(PC_DIMM(dev), MACHINE(lams));
+    qdev_unrealize(dev);
+}
+
+static void virt_machine_device_unplug(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    if (memhp_type_supported(dev)) {
+        virt_mem_unplug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_mem_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(hotplug_dev);
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(lams));
+    hotplug_handler_plug(HOTPLUG_HANDLER(lams->acpi_ged),
+                         dev, &error_abort);
+}
+
 static void loongarch_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                         DeviceState *dev, Error **errp)
 {
@@ -816,6 +913,8 @@ static void loongarch_machine_device_plug_cb(HotplugHandler *hotplug_dev,
             platform_bus_link_device(PLATFORM_BUS_DEVICE(lams->platform_bus_dev),
                                      SYS_BUS_DEVICE(dev));
         }
+    } else if (memhp_type_supported(dev)) {
+        virt_mem_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -824,7 +923,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
-    if (device_is_dynamic_sysbus(mc, dev)) {
+    if (device_is_dynamic_sysbus(mc, dev) ||
+        memhp_type_supported(dev)) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
@@ -848,6 +948,9 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = loongarch_machine_device_plug_cb;
+    hc->pre_plug = virt_machine_device_pre_plug;
+    hc->unplug_request = virt_machine_device_unplug_request;
+    hc->unplug = virt_machine_device_unplug;
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
         loongarch_get_acpi, loongarch_set_acpi,
-- 
2.31.1


