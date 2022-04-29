Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5705146CF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:34:51 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNxa-0000Bj-4z
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXq-0008Ag-W2
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46316 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXn-000339-JB
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:14 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S32; 
 Fri, 29 Apr 2022 18:07:58 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/43] hw/loongarch: Add support loongson3 virt machine
 type.
Date: Fri, 29 Apr 2022 18:07:16 +0800
Message-Id: <20220429100729.1572481-31-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S32
X-Coremail-Antispam: 1UD129KBjvJXoW3ury7ZF1kKr43tr47XFy8uFg_yoWDuF1DpF
 9xZw1kGF48Xr9xArWDG34rWF1kJan7CFy7uF4Iyw40k39rAryUZr1kt3srAFyUA3yDJryS
 vr95uF12qa1UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emulate a 3A5000 board use the new loongarch instruction.
3A5000 belongs to the Loongson3 series processors.
The board consists of a 3A5000 cpu model and the virt
bridge. The host 3A5000 board is really complicated and
contains many functions.Now for the tcg softmmu mode
only part functions are emulated.

More detailed info you can see
https://github.com/loongson/LoongArch-Documentation

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                   |  4 +
 .../devices/loongarch64-softmmu/default.mak   |  3 +
 configs/targets/loongarch64-softmmu.mak       |  3 +
 hw/Kconfig                                    |  1 +
 hw/loongarch/Kconfig                          |  4 +
 hw/loongarch/loongson3.c                      | 89 +++++++++++++++++++
 hw/loongarch/meson.build                      |  4 +
 hw/meson.build                                |  1 +
 include/exec/poison.h                         |  2 +
 include/hw/loongarch/virt.h                   | 31 +++++++
 include/sysemu/arch_init.h                    |  1 +
 qapi/machine.json                             |  2 +-
 target/Kconfig                                |  1 +
 target/loongarch/Kconfig                      |  2 +
 target/loongarch/cpu.c                        |  2 +
 15 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/loongson3.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 include/hw/loongarch/virt.h
 create mode 100644 target/loongarch/Kconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 6361c24b3a..69f4f6e60b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1130,6 +1130,10 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 M: Song Gao <gaosong@loongson.cn>
 S: Maintained
 F: docs/system/loongarch/loongson3.rst
+F: configs/targets/loongarch64-softmmu.mak
+F: configs/devices/loongarch64-softmmu/default.mak
+F: hw/loongarch/
+F: include/hw/loongarch/virt.h
 
 M68K Machines
 -------------
diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
new file mode 100644
index 0000000000..928bc117ef
--- /dev/null
+++ b/configs/devices/loongarch64-softmmu/default.mak
@@ -0,0 +1,3 @@
+# Default configuration for loongarch64-softmmu
+
+CONFIG_LOONGARCH_VIRT=y
diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
new file mode 100644
index 0000000000..666154022f
--- /dev/null
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=loongarch64
+TARGET_BASE_ARCH=loongarch
+TARGET_SUPPORTS_MTTCG=y
diff --git a/hw/Kconfig b/hw/Kconfig
index ad20cce0a9..f71b2155ed 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -49,6 +49,7 @@ source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
+source loongarch/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
new file mode 100644
index 0000000000..13e8501897
--- /dev/null
+++ b/hw/loongarch/Kconfig
@@ -0,0 +1,4 @@
+config LOONGARCH_VIRT
+    bool
+    select PCI
+    select PCI_EXPRESS_GENERIC_BRIDGE
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
new file mode 100644
index 0000000000..a80ce8d383
--- /dev/null
+++ b/hw/loongarch/loongson3.c
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU loongson 3a5000 develop board emulation
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/datadir.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
+#include "sysemu/reset.h"
+#include "sysemu/rtc.h"
+#include "hw/loongarch/virt.h"
+#include "exec/address-spaces.h"
+#include "target/loongarch/cpu.h"
+
+static void loongarch_init(MachineState *machine)
+{
+    const char *cpu_model = machine->cpu_type;
+    ram_addr_t offset = 0;
+    ram_addr_t ram_size = machine->ram_size;
+    uint64_t highram_size = 0;
+    MemoryRegion *address_space_mem = get_system_memory();
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    int i;
+
+    if (!cpu_model) {
+        cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
+    }
+
+    if (!strstr(cpu_model, "Loongson-3A5000")) {
+        error_report("LoongArch/TCG needs cpu type Loongson-3A5000");
+        exit(1);
+    }
+
+    /* Init CPUs */
+    for (i = 0; i < machine->smp.cpus; i++) {
+        cpu_create(machine->cpu_type);
+    }
+
+    /* Add memory region */
+    memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
+                             machine->ram, 0, 256 * MiB);
+    memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
+    offset += 256 * MiB;
+
+    highram_size = ram_size - 256 * MiB;
+    memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
+                             machine->ram, offset, highram_size);
+    memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
+
+    /* Add isa io region */
+    memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
+                             get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
+    memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
+                                &lams->isa_io);
+}
+
+static void loongarch_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Loongson-3A5000 LS7A1000 machine";
+    mc->init = loongarch_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
+    mc->default_ram_id = "loongarch.ram";
+    mc->max_cpus = LOONGARCH_MAX_VCPUS;
+    mc->is_default = 1;
+    mc->default_kernel_irqchip_split = false;
+    mc->block_default_type = IF_VIRTIO;
+    mc->default_boot_order = "c";
+    mc->no_cdrom = 1;
+}
+
+static const TypeInfo loongarch_machine_types[] = {
+    {
+        .name           = TYPE_LOONGARCH_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(LoongArchMachineState),
+        .class_init     = loongarch_class_init,
+    }
+};
+
+DEFINE_TYPES(loongarch_machine_types)
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
new file mode 100644
index 0000000000..cecb1a5d65
--- /dev/null
+++ b/hw/loongarch/meson.build
@@ -0,0 +1,4 @@
+loongarch_ss = ss.source_set()
+loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
+
+hw_arch += {'loongarch': loongarch_ss}
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..95202649b7 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -49,6 +49,7 @@ subdir('avr')
 subdir('cris')
 subdir('hppa')
 subdir('i386')
+subdir('loongarch')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 9f1ca3409c..bbb82cf9ec 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -14,6 +14,7 @@
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HEXAGON
 #pragma GCC poison TARGET_HPPA
+#pragma GCC poison TARGET_LOONGARCH64
 #pragma GCC poison TARGET_M68K
 #pragma GCC poison TARGET_MICROBLAZE
 #pragma GCC poison TARGET_MIPS
@@ -71,6 +72,7 @@
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
 #pragma GCC poison CONFIG_HEXAGON_DIS
+#pragma GCC poison CONFIG_LOONGARCH_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
new file mode 100644
index 0000000000..4a4bb3f51f
--- /dev/null
+++ b/include/hw/loongarch/virt.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Definitions for loongarch board emulation.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LOONGARCH_H
+#define HW_LOONGARCH_H
+
+#include "target/loongarch/cpu.h"
+#include "hw/boards.h"
+#include "qemu/queue.h"
+
+#define LOONGARCH_MAX_VCPUS     4
+
+#define LOONGARCH_ISA_IO_BASE   0x18000000UL
+#define LOONGARCH_ISA_IO_SIZE   0x0004000
+
+struct LoongArchMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    MemoryRegion lowmem;
+    MemoryRegion highmem;
+    MemoryRegion isa_io;
+};
+
+#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchMachineState, LOONGARCH_MACHINE)
+#endif
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 79c2591425..8850cb1a14 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,6 +24,7 @@ enum {
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
     QEMU_ARCH_HEXAGON = (1 << 22),
+    QEMU_ARCH_LOONGARCH = (1 << 23),
 };
 
 extern const uint32_t arch_type;
diff --git a/qapi/machine.json b/qapi/machine.json
index d25a481ce4..63fdba50d3 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -30,7 +30,7 @@
 ##
 { 'enum' : 'SysEmuTarget',
   'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
-             'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
+             'loongarch64', 'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore',
diff --git a/target/Kconfig b/target/Kconfig
index ae7f24fc66..83da0bd293 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -4,6 +4,7 @@ source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
+source loongarch/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
diff --git a/target/loongarch/Kconfig b/target/loongarch/Kconfig
new file mode 100644
index 0000000000..46b26b1a85
--- /dev/null
+++ b/target/loongarch/Kconfig
@@ -0,0 +1,2 @@
+config LOONGARCH64
+    bool
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7cf9c344db..6c98b07b5e 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -82,6 +82,8 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+#include "hw/loongarch/virt.h"
+
 void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 {
     LoongArchCPU *cpu = opaque;
-- 
2.31.1


