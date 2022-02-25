Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5394C40E4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:04:17 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWWO-0006Jb-MN
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:04:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nNVhg-0003ux-OP
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:54 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44666 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nNVhb-0004gl-40
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:52 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMg8jRhiw9UGAA--.8228S26; 
 Fri, 25 Feb 2022 16:03:23 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 24/29] hw/loongarch: Add default bios startup support.
Date: Fri, 25 Feb 2022 03:03:03 -0500
Message-Id: <20220225080308.1405-25-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
References: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxqMg8jRhiw9UGAA--.8228S26
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1DKw4fXFW5Ww4fJw1kXwb_yoWfJrWxpF
 y3AF4kGr48JrnrGrZ3J34UWr1DJws2kFy7ua47CF4FkrW7Jr1UZw4vy39IqFyUt3ykZFyY
 9r9YkFWFvF48J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  4 ++
 hw/loongarch/fw_cfg.c            | 33 ++++++++++++++
 hw/loongarch/fw_cfg.h            | 15 +++++++
 hw/loongarch/loongson3.c         | 76 +++++++++++++++++++++++++++++++-
 hw/loongarch/meson.build         |  1 +
 include/hw/loongarch/loongarch.h |  8 ++++
 6 files changed, 135 insertions(+), 2 deletions(-)
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 35b6680772..33a9066586 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,3 +14,7 @@ config LOONGARCH_VIRT
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
     select LS7A_RTC
+    select FW_CFG_LOONGARCH
+
+config FW_CFG_LOONGARCH
+    bool
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
new file mode 100644
index 0000000000..4cefffc896
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
index 975e8f991b..2795fcc895 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -18,6 +18,8 @@
 #include "sysemu/rtc.h"
 #include "hw/irq.h"
 #include "net/net.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/loongarch/loongarch.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
@@ -26,9 +28,44 @@
 #include "hw/pci-host/ls7a.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/misc/unimp.h"
+#include "hw/loongarch/fw_cfg.h"
 
 #include "target/loongarch/cpu.h"
 
+#define LOONGSON3_BIOSNAME "loongarch_bios.bin"
+
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
 static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 {
     LoongArchCPU *cpu = opaque;
@@ -297,6 +334,8 @@ static void loongarch_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
+    int bios_size;
+    char *filename;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -313,23 +352,55 @@ static void loongarch_init(MachineState *machine)
         loongarch_cpu_init(la_cpu, i);
     }
 
+    if (ram_size < 1 * GiB) {
+        error_report("ram_size must be greater than 1G.");
+        exit(1);
+    }
+
     /* Add memory region */
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
-
+    la_memmap_add_entry(0, 256 * MiB, 1);
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
     offset += highram_size;
-
+    la_memmap_add_entry(0x90000000, highram_size, 1);
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
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
+    }
+
+    if ((bios_size < 0 || bios_size > LA_BIOS_SIZE) && !qtest_enabled()) {
+        error_report("Could not load LOONGARCH bios '%s'", machine->firmware);
+        exit(1);
+    }
+
+    memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                           LA_BIOS_SIZE, &error_fatal);
+    memory_region_set_readonly(&lams->bios, true);
+    memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
+    if (lams->fw_cfg != NULL) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
+                        la_memmap_table,
+                        sizeof(struct la_memmap_entry) * (la_memmap_entries));
+    }
+
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams, ipi, extioi);
 }
@@ -345,6 +416,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "loongarch.ram";
     mc->max_cpus = LOONGARCH_MAX_VCPUS;
     mc->is_default = 1;
+    mc->default_machine_opts = "firmware=loongarch_bios.bin";
     mc->default_kernel_irqchip_split = false;
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index cecb1a5d65..2ce560f060 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,5 @@
 loongarch_ss = ss.source_set()
 loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
+loongarch_ss.add(when: 'CONFIG_FW_CFG_LOONGARCH', if_true: files('fw_cfg.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 21a9aa40c1..44afb06b37 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -37,6 +37,10 @@
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
 
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * 1024 * 1024)
+
 typedef struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -44,6 +48,10 @@ typedef struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.27.0


