Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8355455D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:47:54 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xtp-00027I-9W
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xpU-0007vd-TC
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53548 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xpR-0003xg-K7
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:24 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S4; 
 Wed, 22 Jun 2022 18:43:04 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 02/10] hw/loongarch: Add fw_cfg table support
Date: Wed, 22 Jun 2022 18:42:53 +0800
Message-Id: <20220622104301.804447-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S4
X-Coremail-Antispam: 1UD129KBjvJXoW3GF1rGrykXw48Cw4kJF4xWFg_yoW7KF47pF
 y3ZFWrGr4kJr17Jrs3J345Xr1fJws2kF17Way7ur4FkF17Gr1UZFnYk390vFyUJ3ykJa4Y
 qr9Yy3yFgFs5J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Add fw_cfg table for loongarch virt machine, including memmap table.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/fw_cfg.c       | 33 ++++++++++++++++++++++++++
 hw/loongarch/fw_cfg.h       | 15 ++++++++++++
 hw/loongarch/loongson3.c    | 47 ++++++++++++++++++++++++++++++++++++-
 hw/loongarch/meson.build    |  3 +++
 include/hw/loongarch/virt.h |  3 +++
 5 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
new file mode 100644
index 0000000000..f6503d5607
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
+    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8, 0, NULL);
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
index 18cb2f61da..e570919f48 100644
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
 
+struct memmap_entry {
+    uint64_t address;
+    uint64_t length;
+    uint32_t type;
+    uint32_t reserved;
+};
+
+static struct memmap_entry *memmap_table;
+static unsigned memmap_entries;
+
+static int memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    int i;
+
+    for (i = 0; i < memmap_entries; i++) {
+        if (memmap_table[i].address == address) {
+            fprintf(stderr, "%s address:0x%lx length:0x%lx already exists\n",
+                     __func__, address, length);
+            return 0;
+        }
+    }
+
+    memmap_table = g_renew(struct memmap_entry, memmap_table,
+                                                      memmap_entries + 1);
+    memmap_table[memmap_entries].address = cpu_to_le64(address);
+    memmap_table[memmap_entries].length = cpu_to_le64(length);
+    memmap_table[memmap_entries].type = cpu_to_le32(type);
+    memmap_entries++;
+
+    return memmap_entries;
+}
+
+
 /*
  * This is a placeholder for missing ACPI,
  * and will eventually be replaced.
@@ -327,15 +360,27 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
+    memmap_add_entry(0, 256 * MiB, 1);
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
+    memmap_add_entry(0x90000000, highram_size, 1);
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* fw_cfg init */
+    lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
+    rom_set_fw(lams->fw_cfg);
+
+    if (lams->fw_cfg != NULL) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
+                        memmap_table,
+                        sizeof(struct memmap_entry) * (memmap_entries));
+    }
+
     if (kernel_filename) {
         loaderparams.ram_size = ram_size;
         loaderparams.kernel_filename = kernel_filename;
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index cecb1a5d65..81131c9237 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,7 @@
 loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+    'fw_cfg.c',
+))
 loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09a816191c..9fec1f8a5c 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -17,6 +17,7 @@
 
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
+#define VIRT_FWCFG_BASE         0x1e020000UL
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -26,6 +27,8 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


