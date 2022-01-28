Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F449F268
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:21:35 +0100 (CET)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIlR-0007Yg-CR
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBu-0008AY-LO
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40556 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBr-0002MK-8W
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:50 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S17; 
 Fri, 28 Jan 2022 11:44:33 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 15/30] hw/loongarch: Add support loongson3-ls7a machine
 type.
Date: Thu, 27 Jan 2022 22:43:57 -0500
Message-Id: <20220128034412.1262452-16-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S17
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw47JFy7JrWfWFyUXrWDJwb_yoW8Jr1xJo
 WavFyUKr4xGr1avF1rtrsxWrW7Kr1vkF45AayfZ3WkGanYkF15JFyDKws0yFy3JFn5tr15
 ua4YgFsrJ3s7trykn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emulate a 3A5000 board use the new loongarch instruction.
3A5000 belongs to the Loongson3 series processors.
The board consists of a 3A5000 cpu model and the 7A1000
bridge. The host 3A5000 board is really complicated and
contains many functions.Now for the tcg softmmu mode
only part functions are emulated.

More detailed info you can see
https://github.com/loongson/LoongArch-Documentation

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   3 +
 hw/Kconfig                                    |   1 +
 hw/loongarch/Kconfig                          |   3 +
 hw/loongarch/loongson3.c                      | 151 ++++++++++++++++++
 hw/loongarch/meson.build                      |   4 +
 hw/meson.build                                |   1 +
 include/exec/poison.h                         |   2 +
 include/hw/loongarch/loongarch.h              |  52 ++++++
 include/sysemu/arch_init.h                    |   1 +
 qapi/machine.json                             |   2 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/cpu.h                        |   2 +
 14 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/loongson3.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 include/hw/loongarch/loongarch.h
 create mode 100644 target/loongarch/Kconfig

diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
new file mode 100644
index 0000000000..973ce4c30a
--- /dev/null
+++ b/configs/devices/loongarch64-softmmu/default.mak
@@ -0,0 +1,3 @@
+# Default configuration for loongarch64-softmmu
+
+CONFIG_LOONGSON3_LS7A=y
diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
index f33fa1590b..7bc06c850c 100644
--- a/configs/targets/loongarch64-softmmu.mak
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -1 +1,4 @@
+TARGET_ARCH=loongarch64
+TARGET_BASE_ARCH=loongarch
+TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
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
index 0000000000..ae8498de6a
--- /dev/null
+++ b/hw/loongarch/Kconfig
@@ -0,0 +1,3 @@
+config LOONGSON3_LS7A
+    bool
+    select PCI_EXPRESS_7A
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
new file mode 100644
index 0000000000..83c464899b
--- /dev/null
+++ b/hw/loongarch/loongson3.c
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU loongson 3a5000 develop board emulation
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/units.h"
+#include "qemu/datadir.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
+#include "sysemu/reset.h"
+#include "hw/loongarch/loongarch.h"
+#include "hw/pci-host/ls7a.h"
+
+#include "target/loongarch/cpu.h"
+
+static void loongarch_cpu_reset(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+}
+
+static void loongarch_qemu_write(void *opaque, hwaddr addr,
+                                 uint64_t val, unsigned size)
+{
+}
+
+static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint64_t feature = 0UL;
+
+    switch (addr) {
+    case FEATURE_REG:
+        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
+                   1UL << IOCSRF_CSRIPI;
+        return feature ;
+    case VENDOR_REG:
+        return *(uint64_t *)"Loongson";
+    case CPUNAME_REG:
+        return *(uint64_t *)"3A5000";
+    case MISC_FUNC_REG:
+        return 1UL << IOCSRM_EXTIOI_EN;
+    }
+    return 0;
+}
+
+static const MemoryRegionOps loongarch_qemu_ops = {
+    .read = loongarch_qemu_read,
+    .write = loongarch_qemu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
+static void loongarch_init(MachineState *machine)
+{
+    const char *cpu_model = machine->cpu_type;
+    LoongArchCPU *la_cpu;
+    CPULoongArchState *env;
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
+        la_cpu = LOONGARCH_CPU(cpu_create(machine->cpu_type));
+
+        timer_init_ns(&la_cpu->timer, QEMU_CLOCK_VIRTUAL,
+                      &loongarch_constant_timer_cb, la_cpu);
+
+        qemu_register_reset(loongarch_cpu_reset, la_cpu);
+
+        env = &la_cpu->env;
+        memory_region_init_io(&env->iocsr_mem, OBJECT(la_cpu),
+                              &loongarch_qemu_ops,
+                              NULL, "iocsr_misc", IOCSR_MEM_SIZE);
+        memory_region_add_subregion(env->system_iocsr,
+                                    0, &env->iocsr_mem);
+
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
+    offset += highram_size;
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
index 0000000000..1db3529cbc
--- /dev/null
+++ b/hw/loongarch/meson.build
@@ -0,0 +1,4 @@
+loongarch_ss = ss.source_set()
+loongarch_ss.add(when: 'CONFIG_LOONGSON3_LS7A', if_true: files('loongson3.c'))
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
index 7ad4ad18e8..590bc305c7 100644
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
@@ -73,6 +74,7 @@
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
 #pragma GCC poison CONFIG_HEXAGON_DIS
+#pragma GCC poison CONFIG_LOONGARCH_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
new file mode 100644
index 0000000000..4a889267af
--- /dev/null
+++ b/include/hw/loongarch/loongarch.h
@@ -0,0 +1,52 @@
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
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "qemu/queue.h"
+
+#define LOONGARCH_MAX_VCPUS     4
+
+#define FEATURE_REG             0x8
+#define IOCSRF_TEMP             0
+#define IOCSRF_NODECNT          1
+#define IOCSRF_MSI              2
+#define IOCSRF_EXTIOI           3
+#define IOCSRF_CSRIPI           4
+#define IOCSRF_FREQCSR          5
+#define IOCSRF_FREQSCALE        6
+#define IOCSRF_DVFSV1           7
+#define IOCSRF_GMOD             9
+#define IOCSRF_VM               11
+
+#define IOCSR_MEM_SIZE          0x428
+
+#define VENDOR_REG              0x10
+#define CPUNAME_REG             0x20
+#define MISC_FUNC_REG           0x420
+#define IOCSRM_EXTIOI_EN        48
+
+#define LOONGARCH_ISA_IO_BASE   0x18000000UL
+#define LOONGARCH_ISA_IO_SIZE   0x0004000
+
+typedef struct LoongArchMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    MemoryRegion lowmem;
+    MemoryRegion highmem;
+    MemoryRegion isa_io;
+} LoongArchMachineState;
+
+#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
+DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
+                         TYPE_LOONGARCH_MACHINE)
+#endif
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 70c579560a..3ac3634bbb 100644
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
index c87c81b803..f32a68d82d 100644
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
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index ca59a40781..a62f9c805f 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,6 +13,7 @@
 #include "hw/registerfields.h"
 #include "cpu-csr.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -253,6 +254,7 @@ struct CPULoongArchState {
 
     AddressSpace *address_space_iocsr;
     MemoryRegion *system_iocsr;
+    MemoryRegion iocsr_mem;
 #endif
 };
 
-- 
2.27.0


