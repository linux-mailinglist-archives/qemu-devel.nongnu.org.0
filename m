Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182C55455E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:48:07 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xu2-0002iW-II
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xpd-00088Y-To
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53538 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xpY-0003xm-6L
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S9; 
 Wed, 22 Jun 2022 18:43:06 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 07/10] hw/loongarch: Add fdt support
Date: Wed, 22 Jun 2022 18:42:58 +0800
Message-Id: <20220622104301.804447-8-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S9
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1rtry5ArW8Jr13GFWktFb_yoW3Kr1xpF
 W7AFW7WrW8Xrsrurs7W345uwn3Jr18GFW7Wa17WrWFk34DWw18Zay8Aa9IyF1UJ34jqFyY
 vFZ0qrySg3WxKFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Add LoongArch flatted device tree, adding cpu device node, firmware cfg node,
pcie node into it, and create fdt rom memory region. Now fdt info is not
full since only uefi bios uses fdt, linux kernel does not use fdt.
Loongarch Linux kernel uses acpi table which is full in qemu virt
machine.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/loongson3.c    | 136 +++++++++++++++++++++++++++++++++++-
 include/hw/loongarch/virt.h |   4 ++
 target/loongarch/cpu.c      |   1 +
 target/loongarch/cpu.h      |   3 +
 4 files changed, 141 insertions(+), 3 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 4465d87beb..4b58a76025 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -35,6 +35,129 @@
 #include "qapi/qapi-visit-common.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/mem/nvdimm.h"
+#include "sysemu/device_tree.h"
+#include <libfdt.h>
+
+static void create_fdt(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+
+    ms->fdt = create_device_tree(&lams->fdt_size);
+    if (!ms->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    /* Header */
+    qemu_fdt_setprop_string(ms->fdt, "/", "compatible",
+                            "linux,dummy-loongson3");
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
+}
+
+static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
+{
+    int num;
+    const MachineState *ms = MACHINE(lams);
+    int smp_cpus = ms->smp.cpus;
+
+    qemu_fdt_add_subnode(ms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
+
+    /* cpu nodes */
+    for (num = smp_cpus - 1; num >= 0; num--) {
+        char *nodename = g_strdup_printf("/cpus/cpu@%d", num);
+        LoongArchCPU *cpu = LOONGARCH_CPU(qemu_get_cpu(num));
+
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "cpu");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
+                                cpu->dtb_compatible);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "reg", num);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                              qemu_fdt_alloc_phandle(ms->fdt));
+        g_free(nodename);
+    }
+
+    /*cpu map */
+    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+
+    for (num = smp_cpus - 1; num >= 0; num--) {
+        char *cpu_path = g_strdup_printf("/cpus/cpu@%d", num);
+        char *map_path;
+
+        if (ms->smp.threads > 1) {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/core%d/thread%d",
+                num / (ms->smp.cores * ms->smp.threads),
+                (num / ms->smp.threads) % ms->smp.cores,
+                num % ms->smp.threads);
+        } else {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/core%d",
+                num / ms->smp.cores,
+                num % ms->smp.cores);
+        }
+        qemu_fdt_add_path(ms->fdt, map_path);
+        qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+
+        g_free(map_path);
+        g_free(cpu_path);
+    }
+}
+
+static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_FWCFG_BASE;
+    const MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/fw_cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, 0x8);
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+}
+
+static void fdt_add_pcie_node(const LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base_mmio = LS7A_PCI_MEM_BASE;
+    hwaddr size_mmio = LS7A_PCI_MEM_SIZE;
+    hwaddr base_pio = LS7A_PCI_IO_BASE;
+    hwaddr size_pio = LS7A_PCI_IO_SIZE;
+    hwaddr base_pcie = LS7A_PCI_CFG_BASE;
+    hwaddr size_pcie = LS7A_PCI_CFG_SIZE;
+    hwaddr base = base_pcie;
+
+    const MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
+                            "compatible", "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 3);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
+                           PCIE_MMCFG_BUS(LS7A_PCI_CFG_SIZE - 1));
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base_pcie, 2, size_pcie);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
+                                 1, FDT_PCI_RANGE_IOPORT, 2, LS7A_PCI_IO_OFFSET,
+                                 2, base_pio, 2, size_pio,
+                                 1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
+                                 2, base_mmio, 2, size_mmio);
+    g_free(nodename);
+    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
+}
+
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
@@ -526,12 +649,12 @@ static void loongarch_init(MachineState *machine)
         error_report("ram_size must be greater than 1G.");
         exit(1);
     }
-
+    create_fdt(lams);
     /* Init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
         cpu_create(machine->cpu_type);
     }
-
+    fdt_add_cpu_nodes(lams);
     /* Add memory region */
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
                              machine->ram, 0, 256 * MiB);
@@ -554,12 +677,12 @@ static void loongarch_init(MachineState *machine)
     /* fw_cfg init */
     lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
     rom_set_fw(lams->fw_cfg);
-
     if (lams->fw_cfg != NULL) {
         fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
                         memmap_table,
                         sizeof(struct memmap_entry) * (memmap_entries));
     }
+    fdt_add_fw_cfg_node(lams);
     loaderparams.ram_size = ram_size;
     loaderparams.kernel_filename = machine->kernel_filename;
     loaderparams.kernel_cmdline = machine->kernel_cmdline;
@@ -576,6 +699,13 @@ static void loongarch_init(MachineState *machine)
     loongarch_irq_init(lams);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
+    fdt_add_pcie_node(lams);
+
+    /* load fdt */
+    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
+    memory_region_init_rom(fdt_rom, NULL, "fdt", LA_FDT_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), LA_FDT_BASE, fdt_rom);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, LA_FDT_BASE);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index fb4a4f4e7b..f4f24df428 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -28,6 +28,9 @@
 #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
 #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
 
+#define LA_FDT_BASE             0x1c400000
+#define LA_FDT_SIZE             0x100000
+
 struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -45,6 +48,7 @@ struct LoongArchMachineState {
     char         *oem_id;
     char         *oem_table_id;
     DeviceState  *acpi_ged;
+    int          fdt_size;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4c8f96bc3a..401d3fd30a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -328,6 +328,7 @@ static void loongarch_la464_initfn(Object *obj)
         env->cpucfg[i] = 0x0;
     }
 
+    cpu->dtb_compatible = "loongarch,Loongson-3A5000";
     env->cpucfg[0] = 0x14c010;  /* PRID */
 
     uint32_t data = 0;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 71a5036c3c..ce394c3287 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -326,6 +326,9 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
     QEMUTimer timer;
+
+    /* 'compatible' string for this CPU for Linux device trees */
+    const char *dtb_compatible;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
-- 
2.31.1


