Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D135146E8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:39:43 +0200 (CEST)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkO2I-0006fi-BC
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXm-000888-3k
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46244 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXk-00032l-13
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:09 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S26; 
 Fri, 29 Apr 2022 18:07:53 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/43] target/loongarch: Add constant timer support
Date: Fri, 29 Apr 2022 18:07:10 +0800
Message-Id: <20220429100729.1572481-25-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S26
X-Coremail-Antispam: 1UD129KBjvJXoW3XFyUXFy8Zw15ZF17KFW7Jwb_yoW7Xr4Dpr
 Zrur9xtr48t39xWas7Ja98Xrn5Xw17WF12vaySkFW0kwsrXw1xX3Wkt39rZF45Za48WrW2
 qFn5Z3WYgF4xJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/constant_timer.c | 64 +++++++++++++++++++++++++++++++
 target/loongarch/cpu.c            |  2 +
 target/loongarch/cpu.h            |  4 ++
 target/loongarch/internals.h      |  6 +++
 target/loongarch/meson.build      |  1 +
 5 files changed, 77 insertions(+)
 create mode 100644 target/loongarch/constant_timer.c

diff --git a/target/loongarch/constant_timer.c b/target/loongarch/constant_timer.c
new file mode 100644
index 0000000000..1851f53fd6
--- /dev/null
+++ b/target/loongarch/constant_timer.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch constant timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "cpu.h"
+#include "internals.h"
+#include "cpu-csr.h"
+
+#define TIMER_PERIOD                10 /* 10 ns period for 100 MHz frequency */
+#define CONSTANT_TIMER_TICK_MASK    0xfffffffffffcUL
+#define CONSTANT_TIMER_ENABLE       0x1UL
+
+uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
+}
+
+uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu)
+{
+    uint64_t now, expire;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    expire = timer_expire_time_ns(&cpu->timer);
+
+    return (expire - now) / TIMER_PERIOD;
+}
+
+void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
+                                               uint64_t value)
+{
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    env->CSR_TCFG = value;
+    if (value & CONSTANT_TIMER_ENABLE) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (value & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    } else {
+        timer_del(&cpu->timer);
+    }
+}
+
+void loongarch_constant_timer_cb(void *opaque)
+{
+    LoongArchCPU *cpu  = opaque;
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (env->CSR_TCFG & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    } else {
+        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
+    }
+
+    loongarch_cpu_set_irq(opaque, IRQ_TIMER, 1);
+}
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f7c102dfc5..6d6216a846 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -489,6 +489,8 @@ static void loongarch_cpu_init(Object *obj)
 
     cpu_set_cpustate_pointers(cpu);
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
+    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
+                  &loongarch_constant_timer_cb, cpu);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index b983ce241c..2081902f2e 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -11,6 +11,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
+#include "qemu/timer.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -185,6 +186,8 @@ extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
 #define N_IRQS      13
+#define IRQ_TIMER   11
+#define IRQ_IPI     12
 
 #define LOONGARCH_STLB         2048 /* 2048 STLB */
 #define LOONGARCH_MTLB         64   /* 64 MTLB */
@@ -295,6 +298,7 @@ struct ArchCPU {
 
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
+    QEMUTimer timer;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 69183e8bb5..4b1bcd7c0f 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -32,6 +32,12 @@ extern const VMStateDescription vmstate_loongarch_cpu;
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level);
 
+void loongarch_constant_timer_cb(void *opaque);
+uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
+void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
+                                               uint64_t value);
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr);
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 435cc75999..04e15ba1e3 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
   'tlb_helper.c',
+  'constant_timer.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.31.1


