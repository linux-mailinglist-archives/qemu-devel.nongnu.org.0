Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB449551287
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:21:26 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Cez-0004KV-UJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPU-0006f4-0F
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47762 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPI-0007Jl-OU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:18 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S3; 
 Mon, 20 Jun 2022 16:04:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 1/8] hw/loongarch: Add default bios startup support
Date: Mon, 20 Jun 2022 16:04:44 +0800
Message-Id: <20220620080451.3711049-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1kJr17XFy7tr1xWr18uFg_yoWxuFWkpF
 y3AF4kGr4kJr43Grs7G34UWr15Jw4vkFy7W3W7Cr4FkFy7Jr1UZw4v939IyFyUA3yDZa4Y
 qFn5trWF9Fn5J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/fw_cfg.c       | 33 +++++++++++++++
 hw/loongarch/fw_cfg.h       | 15 +++++++
 hw/loongarch/loongson3.c    | 81 ++++++++++++++++++++++++++++++++++++-
 include/hw/loongarch/virt.h |  7 ++++
 4 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
new file mode 100644
index 0000000000..a641f603b6
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
+#include "hw/loongarch/virt.h"
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
+    fw_cfg = fw_cfg_init_mem_wide(FW_CFG_ADDR + 8, FW_CFG_ADDR, 8, 0, NULL);
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
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bd20ebbb78..1e2c69dd8e 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -28,13 +28,46 @@
 #include "hw/pci-host/ls7a.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/misc/unimp.h"
-
+#include "hw/loongarch/fw_cfg.h"
 #include "target/loongarch/cpu.h"
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
 #define PM_CTRL 0x10
 
+struct la_memmap_entry {
+    uint64_t address;
+    uint64_t length;
+    uint32_t type;
+    uint32_t reserved;
+};
+
+static struct la_memmap_entry *la_memmap_table;
+static unsigned la_memmap_entries;
+
+static int la_memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    int i;
+
+    for (i = 0; i < la_memmap_entries; i++) {
+        if (la_memmap_table[i].address == address) {
+            fprintf(stderr, "%s address:0x%lx length:0x%lx already exists\n",
+                     __func__, address, length);
+            return 0;
+        }
+    }
+
+    la_memmap_table = g_renew(struct la_memmap_entry, la_memmap_table,
+                                                      la_memmap_entries + 1);
+    la_memmap_table[la_memmap_entries].address = cpu_to_le64(address);
+    la_memmap_table[la_memmap_entries].length = cpu_to_le64(length);
+    la_memmap_table[la_memmap_entries].type = cpu_to_le32(type);
+    la_memmap_entries++;
+
+    return la_memmap_entries;
+}
+
+
 /*
  * This is a placeholder for missing ACPI,
  * and will eventually be replaced.
@@ -279,6 +312,38 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
+static bool loongarch_firmware_init(LoongArchMachineState *lams)
+{
+    char *filename = MACHINE(lams)->firmware;
+    char *bios_name = NULL;
+    bool loaded = false;
+    int bios_size;
+
+    if (filename) {
+        bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
+        if (!bios_name) {
+            error_report("Could not find ROM image '%s'", filename);
+            exit(1);
+        }
+
+        bios_size = load_image_targphys(bios_name, LA_BIOS_BASE, LA_BIOS_SIZE);
+        if (bios_size < 0) {
+            error_report("Could not load ROM image '%s'", bios_name);
+            exit(1);
+        }
+
+        g_free(bios_name);
+
+        memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                               LA_BIOS_SIZE, &error_fatal);
+        memory_region_set_readonly(&lams->bios, true);
+        memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
+        loaded = true;
+    }
+
+    return loaded;
+}
+
 static void reset_load_elf(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -301,6 +366,7 @@ static void loongarch_init(MachineState *machine)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     LoongArchCPU *lacpu;
     int i;
+    bool firmware_loaded;
     int64_t kernel_addr = 0;
 
     if (!cpu_model) {
@@ -327,15 +393,28 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
+    la_memmap_add_entry(0, 256 * MiB, 1);
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
+    la_memmap_add_entry(0x90000000, highram_size, 1);
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* load the BIOS image. */
+    firmware_loaded = loongarch_firmware_init(lams);
+    lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
+    rom_set_fw(lams->fw_cfg);
+
+    if (lams->fw_cfg != NULL) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
+                        la_memmap_table,
+                        sizeof(struct la_memmap_entry) * (la_memmap_entries));
+    }
+
     if (kernel_filename) {
         loaderparams.ram_size = ram_size;
         loaderparams.kernel_filename = kernel_filename;
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09a816191c..448f46fc6b 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -17,6 +17,9 @@
 
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * MiB)
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -26,6 +29,10 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


