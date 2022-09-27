Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA35EBACE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:37:52 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4E2-00013f-Vk
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1od3pn-0001SM-2f
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40724 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1od3ph-0007Hk-Nk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxT+BJlDJj4J4iAA--.64861S3; 
 Tue, 27 Sep 2022 14:12:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 1/3] hw/loongarch: Add memmap for LoongArch virt machine
Date: Tue, 27 Sep 2022 14:12:23 +0800
Message-Id: <20220927061225.3566554-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxT+BJlDJj4J4iAA--.64861S3
X-Coremail-Antispam: 1UD129KBjvAXoWfuFWfWrWUXr4DCF45ZF4UXFb_yoW5GrWfuo
 WfZF4Sy348Kw1xurWjkwsrXFZIgr1jkanxAFZ7AF409anFkr4UJF1rGwna93W3Jwn8Kr9r
 ta43t3s8uasFyrn5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using memmap table for loongarch virt machine type, this method
comes from arm/riscv architectures.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/acpi-build.c   |  46 ++++++------
 hw/loongarch/fw_cfg.c       |   5 +-
 hw/loongarch/virt.c         | 138 ++++++++++++++++++++++--------------
 include/hw/loongarch/virt.h |  34 +++++----
 include/hw/pci-host/ls7a.h  |  18 -----
 5 files changed, 133 insertions(+), 108 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 378a6d9d38..cbc3f3fdf0 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -43,8 +43,10 @@
 #endif
 
 /* build FADT */
-static void init_common_fadt_data(AcpiFadtData *data)
+static void init_common_fadt_data(LoongArchMachineState *ms, AcpiFadtData *data)
 {
+    hwaddr base = ms->memmap[VIRT_ACPI_GED].base + ACPI_GED_EVT_SEL_LEN +
+                  MEMORY_HOTPLUG_IO_LEN;
     AcpiFadtData fadt = {
         /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
         .rev = 5,
@@ -55,19 +57,19 @@ static void init_common_fadt_data(AcpiFadtData *data)
         .sleep_ctl = {
             .space_id = AML_AS_SYSTEM_MEMORY,
             .bit_width = 8,
-            .address = VIRT_GED_REG_ADDR + ACPI_GED_REG_SLEEP_CTL,
+            .address = base + ACPI_GED_REG_SLEEP_CTL,
         },
         .sleep_sts = {
             .space_id = AML_AS_SYSTEM_MEMORY,
             .bit_width = 8,
-            .address = VIRT_GED_REG_ADDR + ACPI_GED_REG_SLEEP_STS,
+            .address = base + ACPI_GED_REG_SLEEP_STS,
         },
 
         /* ACPI 5.0: 4.8.3.6 Reset Register */
         .reset_reg = {
             .space_id = AML_AS_SYSTEM_MEMORY,
             .bit_width = 8,
-            .address = VIRT_GED_REG_ADDR + ACPI_GED_REG_RESET,
+            .address = base + ACPI_GED_REG_RESET,
         },
         .reset_val = ACPI_GED_RESET_VALUE,
     };
@@ -136,7 +138,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 21, 1);        /* Type */
     build_append_int_noprefix(table_data, 19, 1);        /* Length */
     build_append_int_noprefix(table_data, 1, 1);         /* Version */
-    build_append_int_noprefix(table_data, VIRT_PCH_MSI_ADDR_LOW, 8);/* Address */
+    build_append_int_noprefix(table_data, lams->memmap[VIRT_MSI].base, 8);/* Address */
     build_append_int_noprefix(table_data, 0x40, 4);      /* Start */
     build_append_int_noprefix(table_data, 0xc0, 4);      /* Count */
 
@@ -144,8 +146,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 22, 1);        /* Type */
     build_append_int_noprefix(table_data, 17, 1);        /* Length */
     build_append_int_noprefix(table_data, 1, 1);         /* Version */
-    build_append_int_noprefix(table_data, VIRT_PCH_REG_BASE, 8);/* Address */
-    build_append_int_noprefix(table_data, 0x1000, 2);    /* Size */
+    build_append_int_noprefix(table_data, lams->memmap[VIRT_PCH].base, 8);/* Address */
+    build_append_int_noprefix(table_data, lams->memmap[VIRT_PCH].size, 2);/* Size */
     build_append_int_noprefix(table_data, 0, 2);         /* Id */
     build_append_int_noprefix(table_data, 0x40, 2);      /* Base */
 
@@ -181,10 +183,11 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         build_append_int_noprefix(table_data, 0, 4); /* Reserved */
     }
 
-    build_srat_memory(table_data, VIRT_LOWMEM_BASE, VIRT_LOWMEM_SIZE,
-                      0, MEM_AFFINITY_ENABLED);
+    build_srat_memory(table_data, lams->memmap[VIRT_LOWDDR].base,
+                      lams->memmap[VIRT_LOWDDR].size, 0, MEM_AFFINITY_ENABLED);
 
-    build_srat_memory(table_data, VIRT_HIGHMEM_BASE, machine->ram_size - VIRT_LOWMEM_SIZE,
+    build_srat_memory(table_data, lams->memmap[VIRT_HIGHDDR].base,
+                      machine->ram_size - lams->memmap[VIRT_LOWDDR].size,
                       0, MEM_AFFINITY_ENABLED);
 
     if (ms->device_memory) {
@@ -249,25 +252,26 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
     build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
                   HOTPLUG_HANDLER(lams->acpi_ged),
                   VIRT_SCI_IRQ, AML_SYSTEM_MEMORY,
-                  VIRT_GED_EVT_ADDR);
+                  lams->memmap[VIRT_ACPI_GED].base);
     event = object_property_get_uint(OBJECT(lams->acpi_ged),
                                      "ged-event", &error_abort);
     if (event & ACPI_GED_MEM_HOTPLUG_EVT) {
         build_memory_hotplug_aml(dsdt, machine->ram_slots, "\\_SB", NULL,
                                  AML_SYSTEM_MEMORY,
-                                 VIRT_GED_MEM_ADDR);
+                                 lams->memmap[VIRT_ACPI_GED].base +
+                                 ACPI_GED_EVT_SEL_LEN);
     }
 }
 
 static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
 {
     struct GPEXConfig cfg = {
-        .mmio64.base = VIRT_PCI_MEM_BASE,
-        .mmio64.size = VIRT_PCI_MEM_SIZE,
-        .pio.base    = VIRT_PCI_IO_BASE,
-        .pio.size    = VIRT_PCI_IO_SIZE,
-        .ecam.base   = VIRT_PCI_CFG_BASE,
-        .ecam.size   = VIRT_PCI_CFG_SIZE,
+        .mmio64.base = lams->memmap[VIRT_PCI_MEM].base,
+        .mmio64.size = lams->memmap[VIRT_PCI_MEM].size,
+        .pio.base    = lams->memmap[VIRT_PCI_IO].base,
+        .pio.size    = lams->memmap[VIRT_PCI_IO].size,
+        .ecam.base   = lams->memmap[VIRT_PCI_CFG].base,
+        .ecam.size   = lams->memmap[VIRT_PCI_CFG].size,
         .irq         = PCH_PIC_IRQ_OFFSET + VIRT_DEVICE_IRQS,
         .bus         = lams->pci_bus,
     };
@@ -314,7 +318,7 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     uint8_t *u;
     GArray *tables_blob = tables->table_data;
 
-    init_common_fadt_data(&fadt_data);
+    init_common_fadt_data(lams, &fadt_data);
 
     table_offsets = g_array_new(false, true, sizeof(uint32_t));
     ACPI_BUILD_DPRINTF("init ACPI tables\n");
@@ -352,8 +356,8 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg = {
-           .base = cpu_to_le64(VIRT_PCI_CFG_BASE),
-           .size = cpu_to_le64(VIRT_PCI_CFG_SIZE),
+           .base = cpu_to_le64(lams->memmap[VIRT_PCI_CFG].base),
+           .size = cpu_to_le64(lams->memmap[VIRT_PCI_CFG].size),
         };
         build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
                    lams->oem_table_id);
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
index f15a17416c..693d75b2d4 100644
--- a/hw/loongarch/fw_cfg.c
+++ b/hw/loongarch/fw_cfg.c
@@ -20,11 +20,12 @@ static void fw_cfg_boot_set(void *opaque, const char *boot_device,
 FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
 {
     FWCfgState *fw_cfg;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(ms);
     int max_cpus = ms->smp.max_cpus;
     int smp_cpus = ms->smp.cpus;
+    hwaddr base = lams->memmap[VIRT_FW_CFG].base;
 
-    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8,
-                                  VIRT_FWCFG_BASE + 16, &address_space_memory);
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 29df99727d..3c2ad26bd3 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,6 +42,26 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 
+#define VIRT_PCI_IO_OFFSET       0x4000
+static MemMapEntry virt_memmap[] = {
+    [VIRT_LOWDDR] =       {        0x0,    0x10000000 },
+    [VIRT_PCH] =          { 0x10000000,        0x1000 },
+    [VIRT_PM] =           { 0x10080000,         0x100 },
+    [VIRT_RTC] =          { 0x100D0100,         0x100 },
+    [VIRT_ACPI_GED] =     { 0x100E0000,         0x100 },
+    [VIRT_PLATFORM_BUS] = { 0x16000000,     0x2000000 },
+    [VIRT_ISA_IO] =       { 0x18000000,        0x4000 },
+    [VIRT_PCI_IO] =       { 0x18004000,        0xC000 },
+    [VIRT_BIOS]   =       { 0x1C000000,      0x400000 },
+    [VIRT_FDT]    =       { 0x1C400000,      0x100000 },
+    [VIRT_FW_CFG] =       { 0x1E020000,          0x18 },
+    [VIRT_UART]   =       { 0x1FE001E0,         0x100 },
+    [VIRT_PCI_CFG] =      { 0x20000000,     0x8000000 },
+    [VIRT_MSI]     =      { 0x2FF00000,        0x1000 },
+    [VIRT_PCI_MEM] =      { 0x40000000,    0x40000000 },
+    [VIRT_HIGHDDR] =      { 0x90000000,           0x0 },
+};
+
 static void create_fdt(LoongArchMachineState *lams)
 {
     MachineState *ms = MACHINE(lams);
@@ -114,7 +134,7 @@ static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
 static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
 {
     char *nodename;
-    hwaddr base = VIRT_FWCFG_BASE;
+    hwaddr base = lams->memmap[VIRT_FW_CFG].base;
     const MachineState *ms = MACHINE(lams);
 
     nodename = g_strdup_printf("/fw_cfg@%" PRIx64, base);
@@ -130,12 +150,12 @@ static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
 static void fdt_add_pcie_node(const LoongArchMachineState *lams)
 {
     char *nodename;
-    hwaddr base_mmio = VIRT_PCI_MEM_BASE;
-    hwaddr size_mmio = VIRT_PCI_MEM_SIZE;
-    hwaddr base_pio = VIRT_PCI_IO_BASE;
-    hwaddr size_pio = VIRT_PCI_IO_SIZE;
-    hwaddr base_pcie = VIRT_PCI_CFG_BASE;
-    hwaddr size_pcie = VIRT_PCI_CFG_SIZE;
+    hwaddr base_mmio = lams->memmap[VIRT_PCI_MEM].base;
+    hwaddr size_mmio = lams->memmap[VIRT_PCI_MEM].size;
+    hwaddr base_pio  = lams->memmap[VIRT_PCI_IO].base;
+    hwaddr size_pio  = lams->memmap[VIRT_PCI_IO].size;
+    hwaddr base_pcie = lams->memmap[VIRT_PCI_CFG].base;
+    hwaddr size_pcie = lams->memmap[VIRT_PCI_CFG].size;
     hwaddr base = base_pcie;
 
     const MachineState *ms = MACHINE(lams);
@@ -149,7 +169,7 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
-                           PCIE_MMCFG_BUS(VIRT_PCI_CFG_SIZE - 1));
+                           PCIE_MMCFG_BUS(size_pcie - 1));
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_pcie, 2, size_pcie);
@@ -171,7 +191,7 @@ static void fdt_add_irqchip_node(LoongArchMachineState *lams)
     irqchip_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", irqchip_phandle);
 
-    nodename = g_strdup_printf("/intc@%lx", VIRT_IOAPIC_REG_BASE);
+    nodename = g_strdup_printf("/intc@%" PRIx64, lams->memmap[VIRT_PCH].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
     qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
@@ -183,15 +203,13 @@ static void fdt_add_irqchip_node(LoongArchMachineState *lams)
                             "loongarch,ls7a");
 
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-                                 2, VIRT_IOAPIC_REG_BASE,
+                                 2, lams->memmap[VIRT_PCH].base,
                                  2, PCH_PIC_ROUTE_ENTRY_OFFSET);
 
     qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", irqchip_phandle);
     g_free(nodename);
 }
 
-#define PM_BASE 0x10080000
-#define PM_SIZE 0x100
 #define PM_CTRL 0x10
 
 static void virt_build_smbios(LoongArchMachineState *lams)
@@ -329,6 +347,7 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     DeviceState *dev;
     MachineState *ms = MACHINE(lams);
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    hwaddr base = lams->memmap[VIRT_ACPI_GED].base;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -337,11 +356,12 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     qdev_prop_set_uint32(dev, "ged-event", event);
 
     /* ged event */
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, VIRT_GED_EVT_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     /* memory hotplug */
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, VIRT_GED_MEM_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, base + ACPI_GED_EVT_SEL_LEN);
     /* ged regs used for reset and power down */
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, VIRT_GED_REG_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2,
+                    base + ACPI_GED_EVT_SEL_LEN + MEMORY_HOTPLUG_IO_LEN);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
                        qdev_get_gpio_in(pch_pic, VIRT_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
@@ -349,7 +369,7 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     return dev;
 }
 
-static DeviceState *create_platform_bus(DeviceState *pch_pic)
+static DeviceState *create_platform_bus(LoongArchMachineState *lams, DeviceState *pch_pic)
 {
     DeviceState *dev;
     SysBusDevice *sysbus;
@@ -359,7 +379,7 @@ static DeviceState *create_platform_bus(DeviceState *pch_pic)
     dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
     dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
     qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
-    qdev_prop_set_uint32(dev, "mmio_size", VIRT_PLATFORM_BUS_SIZE);
+    qdev_prop_set_uint32(dev, "mmio_size", lams->memmap[VIRT_PLATFORM_BUS].size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus = SYS_BUS_DEVICE(dev);
@@ -369,7 +389,7 @@ static DeviceState *create_platform_bus(DeviceState *pch_pic)
     }
 
     memory_region_add_subregion(sysmem,
-                                VIRT_PLATFORM_BUS_BASEADDRESS,
+                                lams->memmap[VIRT_PLATFORM_BUS].base,
                                 sysbus_mmio_get_region(sysbus, 0));
     return dev;
 }
@@ -393,25 +413,27 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     ecam_alias = g_new0(MemoryRegion, 1);
     ecam_reg = sysbus_mmio_get_region(d, 0);
     memory_region_init_alias(ecam_alias, OBJECT(gpex_dev), "pcie-ecam",
-                             ecam_reg, 0, VIRT_PCI_CFG_SIZE);
-    memory_region_add_subregion(get_system_memory(), VIRT_PCI_CFG_BASE,
-                                ecam_alias);
+                             ecam_reg, 0, lams->memmap[VIRT_PCI_CFG].size);
+    memory_region_add_subregion(get_system_memory(),
+                                lams->memmap[VIRT_PCI_CFG].base, ecam_alias);
 
     /* Map PCI mem space */
     mmio_alias = g_new0(MemoryRegion, 1);
     mmio_reg = sysbus_mmio_get_region(d, 1);
     memory_region_init_alias(mmio_alias, OBJECT(gpex_dev), "pcie-mmio",
-                             mmio_reg, VIRT_PCI_MEM_BASE, VIRT_PCI_MEM_SIZE);
-    memory_region_add_subregion(get_system_memory(), VIRT_PCI_MEM_BASE,
-                                mmio_alias);
+                             mmio_reg, lams->memmap[VIRT_PCI_MEM].base,
+                             lams->memmap[VIRT_PCI_MEM].size);
+    memory_region_add_subregion(get_system_memory(),
+                                lams->memmap[VIRT_PCI_MEM].base, mmio_alias);
 
     /* Map PCI IO port space. */
     pio_alias = g_new0(MemoryRegion, 1);
     pio_reg = sysbus_mmio_get_region(d, 2);
     memory_region_init_alias(pio_alias, OBJECT(gpex_dev), "pcie-io", pio_reg,
-                             VIRT_PCI_IO_OFFSET, VIRT_PCI_IO_SIZE);
-    memory_region_add_subregion(get_system_memory(), VIRT_PCI_IO_BASE,
-                                pio_alias);
+                             VIRT_PCI_IO_OFFSET,
+                             lams->memmap[VIRT_PCI_IO].size);
+    memory_region_add_subregion(get_system_memory(),
+                                lams->memmap[VIRT_PCI_IO].base, pio_alias);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_connect_irq(d, i,
@@ -419,7 +441,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
         gpex_set_irq_num(GPEX_HOST(gpex_dev), i, 16 + i);
     }
 
-    serial_mm_init(get_system_memory(), VIRT_UART_BASE, 0,
+    serial_mm_init(get_system_memory(), lams->memmap[VIRT_UART].base, 0,
                    qdev_get_gpio_in(pch_pic,
                                     VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
@@ -440,18 +462,20 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
      * Create some unimplemented devices to emulate this.
      */
     create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
-    sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
+    sysbus_create_simple("ls7a_rtc", lams->memmap[VIRT_RTC].base,
                          qdev_get_gpio_in(pch_pic,
                          VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
 
     pm_mem = g_new(MemoryRegion, 1);
     memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
-                          NULL, "loongarch_virt_pm", PM_SIZE);
-    memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
+                          NULL, "loongarch_virt_pm",
+                          virt_memmap[VIRT_PM].size);
+    memory_region_add_subregion(get_system_memory(), lams->memmap[VIRT_PM].base,
+                                pm_mem);
     /* acpi ged */
     lams->acpi_ged = create_acpi_ged(pch_pic, lams);
     /* platform bus */
-    lams->platform_bus_dev = create_platform_bus(pch_pic);
+    lams->platform_bus_dev = create_platform_bus(lams, pch_pic);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
@@ -464,6 +488,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     CPULoongArchState *env;
     CPUState *cpu_state;
     int cpu, pin, i;
+    hwaddr base = lams->memmap[VIRT_PCH].base;
 
     ipi = qdev_new(TYPE_LOONGARCH_IPI);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
@@ -528,13 +553,13 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
     d = SYS_BUS_DEVICE(pch_pic);
     sysbus_realize_and_unref(d, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), VIRT_IOAPIC_REG_BASE,
+    memory_region_add_subregion(get_system_memory(), base,
                             sysbus_mmio_get_region(d, 0));
     memory_region_add_subregion(get_system_memory(),
-                            VIRT_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
+                            base + PCH_PIC_ROUTE_ENTRY_OFFSET,
                             sysbus_mmio_get_region(d, 1));
     memory_region_add_subregion(get_system_memory(),
-                            VIRT_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
+                            base + PCH_PIC_INT_STATUS_LO,
                             sysbus_mmio_get_region(d, 2));
 
     /* Connect 64 pch_pic irqs to extioi */
@@ -546,7 +571,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
     d = SYS_BUS_DEVICE(pch_msi);
     sysbus_realize_and_unref(d, &error_fatal);
-    sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
+    sysbus_mmio_map(d, 0, lams->memmap[VIRT_MSI].base);
     for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
         /* Connect 192 pch_msi irqs to extioi */
         qdev_connect_gpio_out(DEVICE(d), i,
@@ -570,7 +595,8 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
             exit(1);
         }
 
-        bios_size = load_image_targphys(bios_name, VIRT_BIOS_BASE, VIRT_BIOS_SIZE);
+        bios_size = load_image_targphys(bios_name, lams->memmap[VIRT_BIOS].base,
+                                        lams->memmap[VIRT_BIOS].size);
         if (bios_size < 0) {
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
@@ -579,9 +605,10 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
         g_free(bios_name);
 
         memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
-                               VIRT_BIOS_SIZE, &error_fatal);
+                                lams->memmap[VIRT_BIOS].size, &error_fatal);
         memory_region_set_readonly(&lams->bios, true);
-        memory_region_add_subregion(get_system_memory(), VIRT_BIOS_BASE, &lams->bios);
+        memory_region_add_subregion(get_system_memory(),
+                                    lams->memmap[VIRT_BIOS].base, &lams->bios);
         lams->bios_loaded = true;
     }
 
@@ -686,7 +713,7 @@ static void loongarch_init(MachineState *machine)
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
-    MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *mr = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
 
@@ -703,6 +730,8 @@ static void loongarch_init(MachineState *machine)
         error_report("ram_size must be greater than 1G.");
         exit(1);
     }
+
+    lams->memmap = virt_memmap;
     create_fdt(lams);
     /* Init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
@@ -712,14 +741,15 @@ static void loongarch_init(MachineState *machine)
     /* Add memory region */
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
                              machine->ram, 0, 256 * MiB);
-    memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
+    memory_region_add_subregion(mr, offset, &lams->lowmem);
     offset += 256 * MiB;
     memmap_add_entry(0, 256 * MiB, 1);
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
-    memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
-    memmap_add_entry(0x90000000, highram_size, 1);
+    memory_region_add_subregion(mr, lams->memmap[VIRT_HIGHDDR].base,
+                                &lams->highmem);
+    memmap_add_entry(lams->memmap[VIRT_HIGHDDR].base, highram_size, 1);
 
     /* initialize device memory address space */
     if (machine->ram_size < machine->maxram_size) {
@@ -739,20 +769,21 @@ static void loongarch_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
         /* device memory base is the top of high memory address. */
-        machine->device_memory->base = 0x90000000 + highram_size;
+        machine->device_memory->base = lams->memmap[VIRT_HIGHDDR].base + highram_size;
         machine->device_memory->base =
             ROUND_UP(machine->device_memory->base, 1 * GiB);
 
         memory_region_init(&machine->device_memory->mr, OBJECT(lams),
                            "device-memory", device_mem_size);
-        memory_region_add_subregion(address_space_mem, machine->device_memory->base,
+        memory_region_add_subregion(mr, machine->device_memory->base,
                                     &machine->device_memory->mr);
     }
 
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
-                             get_system_io(), 0, VIRT_ISA_IO_SIZE);
-    memory_region_add_subregion(address_space_mem, VIRT_ISA_IO_BASE,
+                             get_system_io(), 0,
+                             lams->memmap[VIRT_ISA_IO].size);
+    memory_region_add_subregion(mr, lams->memmap[VIRT_ISA_IO].base,
                                 &lams->isa_io);
     /* load the BIOS image. */
     loongarch_firmware_init(lams);
@@ -787,8 +818,8 @@ static void loongarch_init(MachineState *machine)
     loongarch_irq_init(lams);
     fdt_add_irqchip_node(lams);
     platform_bus_add_all_fdt_nodes(machine->fdt, "/intc",
-                                   VIRT_PLATFORM_BUS_BASEADDRESS,
-                                   VIRT_PLATFORM_BUS_SIZE,
+                                   lams->memmap[VIRT_PLATFORM_BUS].base,
+                                   lams->memmap[VIRT_PLATFORM_BUS].size,
                                    VIRT_PLATFORM_BUS_IRQ);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
@@ -796,9 +827,12 @@ static void loongarch_init(MachineState *machine)
 
     /* load fdt */
     MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
-    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
-    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
+    memory_region_init_rom(fdt_rom, NULL, "fdt",
+                           lams->memmap[VIRT_FDT].size, &error_fatal);
+    memory_region_add_subregion(get_system_memory(),
+                           lams->memmap[VIRT_FDT].base, fdt_rom);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size,
+                       lams->memmap[VIRT_FDT].base);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09f1c88ee5..25d979e674 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -15,21 +15,24 @@
 
 #define LOONGARCH_MAX_VCPUS     4
 
-#define VIRT_ISA_IO_BASE        0x18000000UL
-#define VIRT_ISA_IO_SIZE        0x0004000
-#define VIRT_FWCFG_BASE         0x1e020000UL
-#define VIRT_BIOS_BASE          0x1c000000UL
-#define VIRT_BIOS_SIZE          (4 * MiB)
-
-#define VIRT_LOWMEM_BASE        0
-#define VIRT_LOWMEM_SIZE        0x10000000
-#define VIRT_HIGHMEM_BASE       0x90000000
-#define VIRT_GED_EVT_ADDR       0x100e0000
-#define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
-#define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
-
-#define VIRT_FDT_BASE           0x1c400000
-#define VIRT_FDT_SIZE           0x100000
+enum {
+    VIRT_LOWDDR,
+    VIRT_PCH,
+    VIRT_PM,
+    VIRT_RTC,
+    VIRT_ACPI_GED,
+    VIRT_ISA_IO,
+    VIRT_PCI_IO,
+    VIRT_BIOS,
+    VIRT_FDT,
+    VIRT_FW_CFG,
+    VIRT_UART,
+    VIRT_PCI_CFG,
+    VIRT_MSI,
+    VIRT_PCI_MEM,
+    VIRT_HIGHDDR,
+    VIRT_PLATFORM_BUS,
+};
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -51,6 +54,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
+    MemMapEntry  *memmap;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 9bd875ca8b..09c030b146 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -15,18 +15,6 @@
 #include "qemu/range.h"
 #include "qom/object.h"
 
-#define VIRT_PCI_MEM_BASE        0x40000000UL
-#define VIRT_PCI_MEM_SIZE        0x40000000UL
-#define VIRT_PCI_IO_OFFSET       0x4000
-#define VIRT_PCI_CFG_BASE        0x20000000
-#define VIRT_PCI_CFG_SIZE        0x08000000
-#define VIRT_PCI_IO_BASE         0x18004000UL
-#define VIRT_PCI_IO_SIZE         0xC000
-
-#define VIRT_PCH_REG_BASE        0x10000000UL
-#define VIRT_IOAPIC_REG_BASE     (VIRT_PCH_REG_BASE)
-#define VIRT_PCH_MSI_ADDR_LOW    0x2FF00000UL
-
 /*
  * According to the kernel pch irq start from 64 offset
  * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
@@ -36,15 +24,9 @@
 #define VIRT_DEVICE_IRQS         16
 #define VIRT_PCI_IRQS            48
 #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
-#define VIRT_UART_BASE           0x1fe001e0
 #define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
-#define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
-#define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
-#define VIRT_RTC_LEN             0x100
 #define VIRT_SCI_IRQ             (PCH_PIC_IRQ_OFFSET + 4)
 
-#define VIRT_PLATFORM_BUS_BASEADDRESS   0x16000000
-#define VIRT_PLATFORM_BUS_SIZE          0x2000000
 #define VIRT_PLATFORM_BUS_NUM_IRQS      2
 #define VIRT_PLATFORM_BUS_IRQ           69
 #endif
-- 
2.31.1


