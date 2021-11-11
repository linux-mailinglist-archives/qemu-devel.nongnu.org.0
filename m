Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998B44CF68
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:59:46 +0100 (CET)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzNR-0005LD-LG
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0u-0006c1-Md
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:30 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54302 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0s-0001s5-6m
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:28 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S27; 
 Thu, 11 Nov 2021 09:36:10 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 25/30] hw/loongarch: Add default bios startup support.
Date: Thu, 11 Nov 2021 09:35:23 +0800
Message-Id: <1636594528-8175-26-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S27
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1DGw4UZry3Xr1UuF1fCrg_yoW3Zw48pF
 93ZF4kGr48JrZrJrs3K34UWFn5Jwn7GF17WFWakw1FkrsrWr1UZw4vy39YyFyUA3ykXF90
 9r95tw13Xan8t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  4 +++
 hw/loongarch/fw_cfg.c            | 33 ++++++++++++++++++
 hw/loongarch/fw_cfg.h            | 15 ++++++++
 hw/loongarch/ls3a5000_virt.c     | 60 +++++++++++++++++++++++++-------
 hw/loongarch/meson.build         |  1 +
 include/hw/loongarch/loongarch.h |  5 +++
 6 files changed, 106 insertions(+), 12 deletions(-)
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index fe100b01eb..b59cd98a7a 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -13,3 +13,7 @@ config LOONGSON_3A5000
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
     select LS7A_RTC
+    select FW_CFG_LOONGARCH
+
+config FW_CFG_LOONGARCH
+    bool
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
new file mode 100644
index 0000000000..2a7f8ed0ce
--- /dev/null
+++ b/hw/loongarch/fw_cfg.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU fw_cfg helpers (LoongArch specific)
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/loongarch/fw_cfg.h"
+#include "hw/loongarch/loongarch.h"
+#include "hw/nvram/fw_cfg.h"
+#include "sysemu/sysemu.h"
+
+static void fw_cfg_boot_set(void *opaque, const char *boot_device,
+                            Error **errp)
+{
+    fw_cfg_modify_i16(opaque, FW_CFG_BOOT_DEVICE, boot_device[0]);
+}
+
+FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
+{
+    FWCfgState *fw_cfg;
+    int max_cpus = ms->smp.max_cpus;
+    int smp_cpus = ms->smp.cpus;
+
+    fw_cfg = fw_cfg_init_mem_wide(FW_CFG_ADDR, FW_CFG_ADDR + 8, 8, 0, NULL);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+
+    qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
+    return fw_cfg;
+}
diff --git a/hw/loongarch/fw_cfg.h b/hw/loongarch/fw_cfg.h
new file mode 100644
index 0000000000..7c0de4db4a
--- /dev/null
+++ b/hw/loongarch/fw_cfg.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU fw_cfg helpers (LoongArch specific)
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LOONGARCH_FW_CFG_H
+#define HW_LOONGARCH_FW_CFG_H
+
+#include "hw/boards.h"
+#include "hw/nvram/fw_cfg.h"
+
+FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms);
+#endif
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index c5e31080f0..85c8466d75 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -13,6 +13,8 @@
 #include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/irq.h"
 #include "net/net.h"
 #include "sysemu/runstate.h"
@@ -23,6 +25,9 @@
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
 #include "hw/misc/unimp.h"
+#include "hw/loongarch/fw_cfg.h"
+
+#define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
 CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
 
@@ -195,8 +200,9 @@ static void ls3a5000_virt_init(MachineState *machine)
     const char *cpu_model = machine->cpu_type;
     LoongArchCPU *cpu;
     CPULoongArchState *env;
-    uint64_t lowram_size = 0, highram_size = 0;
+    uint64_t highram_size = 0;
     MemoryRegion *lowmem = g_new(MemoryRegion, 1);
+    MemoryRegion *highmem = g_new(MemoryRegion, 1);
     char *ramName = NULL;
     ram_addr_t ram_size = machine->ram_size;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -204,6 +210,10 @@ static void ls3a5000_virt_init(MachineState *machine)
     int i;
     MemoryRegion *iomem = NULL;
     PCIBus *pci_bus = NULL;
+    int bios_size;
+    char *filename;
+    MemoryRegion *bios = g_new(MemoryRegion, 1);
+    ram_addr_t offset = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -246,21 +256,46 @@ static void ls3a5000_virt_init(MachineState *machine)
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
+    if (ram_size < 1 * GiB) {
+        error_report("ram_size must be greater than 1G due to the bios memory layout");
+        exit(1);
+    }
+
     ramName = g_strdup_printf("loongarch.lowram");
-    lowram_size = MIN(ram_size, 256 * 0x100000);
     memory_region_init_alias(lowmem, NULL, ramName, machine->ram,
-                             0, lowram_size);
-    memory_region_add_subregion(address_space_mem, 0, lowmem);
-
-    highram_size = ram_size > lowram_size ? ram_size - 256 * 0x100000 : 0;
-    if (highram_size > 0) {
-        MemoryRegion *highmem = g_new(MemoryRegion, 1);
-        ramName = g_strdup_printf("loongarch.highram");
-        memory_region_init_alias(highmem, NULL, ramName, machine->ram,
-                                 lowram_size, highram_size);
-        memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
+                             0, 256 * MiB);
+    memory_region_add_subregion(address_space_mem, offset, lowmem);
+    offset += 256 * MiB;
+
+    highram_size = ram_size - 256 * MiB;
+    ramName = g_strdup_printf("loongarch.highram");
+    memory_region_init_alias(highmem, NULL, ramName, machine->ram,
+                             offset, highram_size);
+    memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
+    offset += highram_size;
+
+    /* load the BIOS image. */
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                              machine->firmware ?: LOONGSON3_BIOSNAME);
+    if (filename) {
+        bios_size = load_image_targphys(filename, LA_BIOS_BASE, LA_BIOS_SIZE);
+        lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
+        rom_set_fw(lams->fw_cfg);
+        g_free(filename);
+    } else {
+        bios_size = -1;
     }
 
+    if ((bios_size < 0 || bios_size > LA_BIOS_SIZE) && !qtest_enabled()) {
+        error_report("Could not load LOONGARCH bios '%s'", machine->firmware);
+        exit(1);
+    }
+
+    memory_region_init_ram(bios, NULL, "loongarch.bios",
+                           LA_BIOS_SIZE, &error_fatal);
+    memory_region_set_readonly(bios, true);
+    memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, bios);
+
     /* Add PM mmio memory for reboot and shutdown*/
     iomem = g_new(MemoryRegion, 1);
     memory_region_init_io(iomem, NULL, &loongarch_pm_ops, NULL,
@@ -311,6 +346,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "loongarch.ram";
     mc->max_cpus = LOONGARCH_MAX_VCPUS;
     mc->is_default = 1;
+    mc->default_machine_opts = "firmware=loongarch_bios.bin";
     mc->default_kernel_irqchip_split = false;
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 1bd209c9eb..3fabfa72dc 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,5 +1,6 @@
 loongarch_ss = ss.source_set()
 loongarch_ss.add(files('loongarch_int.c'))
 loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c', 'ipi.c'))
+loongarch_ss.add(when: 'CONFIG_FW_CFG_LOONGARCH', if_true: files('fw_cfg.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index a9690f63c1..2eb43e1263 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -33,6 +33,10 @@
 #define VENDOR_REG              0x10
 #define CPUNAME_REG             0x20
 
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * 1024 * 1024)
+
 typedef struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -42,6 +46,7 @@ typedef struct LoongArchMachineState {
 
     gipiState   *gipi;
     qemu_irq    *pch_irq;
+    FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
-- 
2.27.0


