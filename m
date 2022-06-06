Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08B53F2B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:46:19 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMQM-0000JB-SK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwT-0001kE-SD
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwR-0003jv-JS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:25 -0400
Received: by mail-pg1-x536.google.com with SMTP id c14so14157864pgu.13
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hf/x1v5/GfeKJxXsj5B6gz1vTqPzvlwk4xj666vJsn8=;
 b=VIdpvzRko6q8k7zXio5834v5UN9wnh2dq4Kvxoo9+Dqp2t9Kix5amC1cQEpZF3ZNg9
 IccBjh0fJrg/OF5ongXDFCajVaFXNbjCouUjQ5puRPQn22C1D+WoPUbsPFrNw7KMZA3i
 hkifBuTGOl4HgkQYJ4zAc4ONqKS33E8Wnhdx3Ntvf0MWhzxvmiqyHiZs38HO25rKj+sz
 VtVPaM2XLmGU9tZ2WCo6znYLVVON/NctIO30JMI7uIpR1M/Z0jx2fZgIzGfkDbh1HU6m
 ydGn3qAIfgDFTqbBSbUc3Ibrj2ADIOIIG/dSi86SYDSEpBTCqnwk5qRSNl8N7tq0WfhC
 Eknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hf/x1v5/GfeKJxXsj5B6gz1vTqPzvlwk4xj666vJsn8=;
 b=H5jtnoBxhzYj6DG+go/8nI80bqQ/s9IQEy7d19rdLsh17ca22+N2Q8tX81nW88Xroz
 RLv1Fg9lsLmmmuKiN3EMYJQNTXEcafNTIW0tdKg1b22hGmdYl9TEvqhacGFXBhsYjahd
 YfbbhQjjw2qkaEEQ8F6sHhn+wT6skOG++VIgOfF5FZ4oGgEbmsOtJ+/vqu9IO38jO5ex
 J9GcIEV4aizPUB2tb7kuHOvjb9qLI4bhn0jgZovpDqSvgcbPtWxaX9Fk4UsLRVeae2i5
 p00lXA1zTC9u2GvU6ST7M9zUSuwEr4EsoYp6kFl78F44TvFiSQ7bepoddHPejg2Kx+j6
 zY6Q==
X-Gm-Message-State: AOAM530haCMVUzSXrsD/8VWaR4gFgsCvoxTvcX2onhfsf426YndysOoY
 SshDzU2Im/B9QISt9+qDvF91FX+8NR1aAw==
X-Google-Smtp-Source: ABdhPJxN5MgAIINO1156U2hAw8++Iv43I8XzbTwFTja0wIgAaNoGgSEZgV5gg9WFuj1gJkYXv7fjfw==
X-Received: by 2002:a63:e61:0:b0:3fd:ef50:c881 with SMTP id
 33-20020a630e61000000b003fdef50c881mr2266436pgo.115.1654557319824; 
 Mon, 06 Jun 2022 16:15:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 30/43] hw/loongarch: Add support loongson3 virt machine type.
Date: Mon,  6 Jun 2022 16:14:37 -0700
Message-Id: <20220606231450.448443-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

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
Message-Id: <20220606124333.2060567-31-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../devices/loongarch64-softmmu/default.mak   |  3 +
 configs/targets/loongarch64-softmmu.mak       |  3 +
 qapi/machine.json                             |  2 +-
 include/exec/poison.h                         |  2 +
 include/hw/loongarch/virt.h                   | 31 ++++++
 include/sysemu/arch_init.h                    |  1 +
 hw/loongarch/loongson3.c                      | 94 +++++++++++++++++++
 target/loongarch/cpu.c                        |  2 +
 MAINTAINERS                                   |  4 +
 hw/Kconfig                                    |  1 +
 hw/loongarch/Kconfig                          |  4 +
 hw/loongarch/meson.build                      |  4 +
 hw/meson.build                                |  1 +
 target/Kconfig                                |  1 +
 target/loongarch/Kconfig                      |  2 +
 15 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 include/hw/loongarch/virt.h
 create mode 100644 hw/loongarch/loongson3.c
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 target/loongarch/Kconfig

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
diff --git a/qapi/machine.json b/qapi/machine.json
index 883ce3f9ea..f750a16396 100644
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
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
new file mode 100644
index 0000000000..7df32f777e
--- /dev/null
+++ b/hw/loongarch/loongson3.c
@@ -0,0 +1,94 @@
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
+        cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
+    }
+
+    if (!strstr(cpu_model, "la464")) {
+        error_report("LoongArch/TCG needs cpu type la464");
+        exit(1);
+    }
+
+    if (ram_size < 1 * GiB) {
+        error_report("ram_size must be greater than 1G.");
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
+    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
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
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index b846bd1a8b..3b7d6289d2 100644
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
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f875071a..0c54c03cef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1129,6 +1129,10 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 M: Song Gao <gaosong@loongson.cn>
 S: Maintained
 F: docs/system/loongarch/loongson3.rst
+F: configs/targets/loongarch64-softmmu.mak
+F: configs/devices/loongarch64-softmmu/default.mak
+F: hw/loongarch/
+F: include/hw/loongarch/virt.h
 
 M68K Machines
 -------------
diff --git a/hw/Kconfig b/hw/Kconfig
index 50e0952889..38233bbb0f 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -50,6 +50,7 @@ source avr/Kconfig
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
index 9992c5101e..c7ac7d3d75 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -50,6 +50,7 @@ subdir('avr')
 subdir('cris')
 subdir('hppa')
 subdir('i386')
+subdir('loongarch')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
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
-- 
2.34.1


