Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526649F280
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:29:11 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIso-0001Ds-CB
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIIe-0007b9-6p
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:51:49 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42624 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIIa-0003R0-9r
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:51:47 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S31; 
 Fri, 28 Jan 2022 11:44:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 29/30] hw/loongarch: Add fdt support.
Date: Thu, 27 Jan 2022 22:44:11 -0500
Message-Id: <20220128034412.1262452-30-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S31
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar1kurW8WF1UKry3XFW5Jrb_yoW3uF4rpF
 W7AFWDWrW8Jrs7ursag345uwn3Jr18GFW7Xa17KrW0kayDWw18Zay8Ca93AF15J340qFyY
 vFZ5XrySg3WIgr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tree nodes for 3A5000 device tree.
- cpu nodes;
- fw_cfg nodes;
- pcie nodes.

The lastest loongarch bios have supported fdt.
- https://github.com/loongson/edk2
- https://github.com/loongson/edk2-platforms

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c         | 137 +++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |   5 ++
 target/loongarch/cpu.c           |   2 +
 target/loongarch/cpu.h           |   3 +
 4 files changed, 147 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index a4dd2509c4..808964f68f 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -32,6 +32,9 @@
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/aml-build.h"
 #include "qapi/qapi-visit-common.h"
+#include "sysemu/device_tree.h"
+
+#include <libfdt.h>
 
 #include "target/loongarch/cpu.h"
 
@@ -377,6 +380,126 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
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
+    hwaddr base = FW_CFG_ADDR;
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
+    hwaddr base_pcie = LS_PCIECFG_BASE;
+    hwaddr size_pcie = LS_PCIECFG_SIZE;
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
+                           PCIE_MMCFG_BUS(LS_PCIECFG_SIZE - 1));
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
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -403,6 +526,8 @@ static void loongarch_init(MachineState *machine)
         exit(1);
     }
 
+    create_fdt(lams);
+
     /* Init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
         la_cpu = LOONGARCH_CPU(cpu_create(machine->cpu_type));
@@ -424,6 +549,8 @@ static void loongarch_init(MachineState *machine)
 
     }
 
+    fdt_add_cpu_nodes(lams);
+
     if (ram_size < 1 * GiB) {
         error_report("ram_size must be greater than 1G.");
         exit(1);
@@ -464,6 +591,8 @@ static void loongarch_init(MachineState *machine)
         exit(1);
     }
 
+    fdt_add_fw_cfg_node(lams);
+
     if (kernel_filename) {
         loaderparams.ram_size = ram_size;
         loaderparams.kernel_filename = kernel_filename;
@@ -482,6 +611,14 @@ static void loongarch_init(MachineState *machine)
 
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
+
+    fdt_add_pcie_node(lams);
+
+    /* load fdt */
+    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
+    memory_region_init_rom(fdt_rom, NULL, "fdt", LA_FDT_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), LA_FDT_BASE, fdt_rom);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, LA_FDT_BASE);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 85278fc4b8..dd764bdd91 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -41,6 +41,9 @@
 #define LA_BIOS_BASE            0x1c000000
 #define LA_BIOS_SIZE            (4 * 1024 * 1024)
 
+#define LA_FDT_BASE             0x1c400000
+#define LA_FDT_SIZE             0x100000
+
 /* Kernels can be configured with 64KB pages */
 #define INITRD_PAGE_SIZE        (64 * KiB)
 #define INITRD_BASE             0x04000000
@@ -61,6 +64,8 @@ typedef struct LoongArchMachineState {
     OnOffAuto   acpi;
     char        *oem_id;
     char        *oem_table_id;
+
+    int fdt_size;
 } LoongArchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 6a31ca08e5..eff7a1246b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -334,6 +334,8 @@ static void loongarch_3a5000_initfn(Object *obj)
         env->cpucfg[i] = 0x0;
     }
 
+    cpu->dtb_compatible = "loongarch,Loongson-3A5000";
+
     env->cpucfg[0] = 0x14c010;  /* PRID */
 
     uint32_t data = 0;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a62f9c805f..88c2d2d298 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -360,6 +360,9 @@ struct LoongArchCPU {
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
     QEMUTimer timer;
+
+    /* 'compatible' string for this CPU for Linux device trees */
+    const char *dtb_compatible;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
-- 
2.27.0


