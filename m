Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134984684D3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:35:42 +0100 (CET)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUGT-0001AW-5K
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpn-0007xS-13
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:08:08 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58552 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpe-0003Jo-GZ
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:08:06 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S26; 
 Sat, 04 Dec 2021 20:07:42 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 24/27] hw/loongarch: Add default bios startup support.
Date: Sat,  4 Dec 2021 20:07:22 +0800
Message-Id: <1638619645-11283-25-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S26
X-Coremail-Antispam: 1UD129KBjvJXoW3GFW7Jw4xWF1rtFyDGr43Awb_yoWxZw1kpF
 y7AFn5Gr48JrsxGrZ3t345WFn5Aws7CFy7uFWfAa1FkFZrXr1UZw4vy3s0vFyUJ3ykXFyq
 9r95Kw43WF4DJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  4 ++++
 hw/loongarch/fw_cfg.c            | 33 ++++++++++++++++++++++++++++++
 hw/loongarch/fw_cfg.h            | 15 ++++++++++++++
 hw/loongarch/loongson3.c         | 35 ++++++++++++++++++++++++++++++++
 hw/loongarch/meson.build         |  1 +
 include/hw/loongarch/loongarch.h |  8 ++++++++
 6 files changed, 96 insertions(+)
 create mode 100644 hw/loongarch/fw_cfg.c
 create mode 100644 hw/loongarch/fw_cfg.h

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 6d3506fee9..44319531bc 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,3 +14,7 @@ config LOONGSON3_LS7A
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
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index f86f83c0b8..bc3c1920ef 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -13,6 +13,8 @@
 #include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/irq.h"
 #include "net/net.h"
 #include "sysemu/runstate.h"
@@ -24,6 +26,9 @@
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
 #include "hw/misc/unimp.h"
+#include "hw/loongarch/fw_cfg.h"
+
+#define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
 
 static void loongarch_cpu_reset(void *opaque)
@@ -203,6 +208,8 @@ static void loongson3_init(MachineState *machine)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
     PCIBus *pci_bus = NULL;
+    int bios_size;
+    char *filename;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -238,6 +245,11 @@ static void loongson3_init(MachineState *machine)
         qemu_register_reset(loongarch_cpu_reset, cpu);
     }
 
+    if (ram_size < 1 * GiB) {
+        error_report("ram_size must be greater than 1G due to the bios memory layout");
+        exit(1);
+    }
+
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
@@ -249,6 +261,28 @@ static void loongson3_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
     offset += highram_size;
 
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
+
+    memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                           LA_BIOS_SIZE, &error_fatal);
+    memory_region_set_readonly(&lams->bios, true);
+    memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
     /*
      * There are some invalid guest memory access.
      * Create some unimplemented devices to emulate this.
@@ -286,6 +320,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "loongarch.ram";
     mc->max_cpus = LOONGARCH_MAX_VCPUS;
     mc->is_default = 1;
+    mc->default_machine_opts = "firmware=loongarch_bios.bin";
     mc->default_kernel_irqchip_split = false;
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 1db3529cbc..fed69dfb62 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,5 @@
 loongarch_ss = ss.source_set()
 loongarch_ss.add(when: 'CONFIG_LOONGSON3_LS7A', if_true: files('loongson3.c'))
+loongarch_ss.add(when: 'CONFIG_FW_CFG_LOONGARCH', if_true: files('fw_cfg.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 150403c93d..aab8097f7d 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -32,6 +32,10 @@
 #define VENDOR_REG              0x10
 #define CPUNAME_REG             0x20
 
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * 1024 * 1024)
+
 typedef struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -40,6 +44,10 @@ typedef struct LoongArchMachineState {
     MemoryRegion system_iocsr;
     MemoryRegion lowmem;
     MemoryRegion highmem;
+    MemoryRegion bios;
+
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
-- 
2.27.0


