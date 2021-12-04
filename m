Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D283D4684AD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:12:04 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtTtb-0002Du-Bs
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpP-0007Nh-09
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57976 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpL-0003FH-7W
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:42 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S7;
 Sat, 04 Dec 2021 20:07:29 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 05/27] target/loongarch: Add stabletimer support
Date: Sat,  4 Dec 2021 20:07:03 +0800
Message-Id: <1638619645-11283-6-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S7
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUKFy3Ary7Aw4UZw4DXFb_yoW7JF1xpF
 W7ur9xtr48trZrJ3Z7ta4Yqrn8Xr4xWr17Xa1SkrW0kwsrJ348Xa40q3srWFyUAa4rWrWS
 qF1Fya4YgF48A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 target/loongarch/cpu.c         |  9 +++++
 target/loongarch/cpu.h         | 10 ++++++
 target/loongarch/meson.build   |  1 +
 target/loongarch/stabletimer.c | 63 ++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 target/loongarch/stabletimer.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 343632c644..f34e9763af 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -234,12 +234,21 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+#ifndef CONFIG_USER_ONLY
+    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
+#endif
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
+#ifndef CONFIG_USER_ONLY
+    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
+                  &loongarch_stable_timer_cb, cpu);
+#endif
+
     cpu_reset(cs);
     qemu_init_vcpu(cs);
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a4acd3b285..aeb8a5d397 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,6 +12,7 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "cpu-csr.h"
+#include "qemu/timer.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -148,6 +149,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
 extern const char * const regnames[];
 extern const char * const fregnames[];
 
+#define N_IRQS      14
+#define IRQ_TIMER   11
+
 typedef struct CPULoongArchState CPULoongArchState;
 struct CPULoongArchState {
     uint64_t gpr[32];
@@ -242,6 +246,7 @@ struct LoongArchCPU {
 
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
+    QEMUTimer timer; /* Internal timer */
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
@@ -306,4 +311,9 @@ enum {
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
+void loongarch_stable_timer_cb(void *opaque);
+uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu);
+void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
+                                             uint64_t value);
 #endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 103f36ee15..bda9f47ae4 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
+  'stabletimer.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/stabletimer.c b/target/loongarch/stabletimer.c
new file mode 100644
index 0000000000..151f5073f5
--- /dev/null
+++ b/target/loongarch/stabletimer.c
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/loongarch/loongarch.h"
+#include "qemu/timer.h"
+#include "cpu.h"
+
+#define TIMER_PERIOD                10 /* 10 ns period for 100 Mhz frequency */
+#define STABLETIMER_TICK_MASK       0xfffffffffffcUL
+#define STABLETIMER_ENABLE          0x1UL
+
+/* LoongArch timer */
+uint64_t cpu_loongarch_get_stable_counter(LoongArchCPU *cpu)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
+}
+
+uint64_t cpu_loongarch_get_stable_timer_ticks(LoongArchCPU *cpu)
+{
+    uint64_t now, expire;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    expire = timer_expire_time_ns(&cpu->timer);
+
+    return (expire - now) / TIMER_PERIOD;
+}
+
+void cpu_loongarch_store_stable_timer_config(LoongArchCPU *cpu,
+                                             uint64_t value)
+{
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    env->CSR_TCFG = value;
+    if (value & STABLETIMER_ENABLE) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (value & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    }
+}
+
+void loongarch_stable_timer_cb(void *opaque)
+{
+    LoongArchCPU *cpu  = opaque;
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (env->CSR_TCFG & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    } else {
+        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
+    }
+
+    env->CSR_ESTAT |= 1 << IRQ_TIMER;
+    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
+}
-- 
2.27.0


