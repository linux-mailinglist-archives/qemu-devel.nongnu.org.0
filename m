Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67A4E9794
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:08:28 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYp6h-00042e-7P
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:08:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nYowz-0002ne-TP
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34846 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nYowx-0001Pg-I9
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:25 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxbxPOsEFih08RAA--.17957S7; 
 Mon, 28 Mar 2022 20:58:19 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 05/29] target/loongarch: Add constant timer support
Date: Mon, 28 Mar 2022 20:57:25 +0800
Message-Id: <20220328125749.2918087-6-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxbxPOsEFih08RAA--.17957S7
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8Jw1fZF1DGF4rWw4fuFg_yoWrAr1xpF
 Z7Cr9xtr40yrZxW3Z7Jas8Xr1DXw4xWF12vayfCF40kwsrXw1xW34kt3srZF43Za45WrWS
 qF95Z3WYgF47JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 target/loongarch/constant_timer.c | 62 +++++++++++++++++++++++++++++++
 target/loongarch/cpu.h            | 10 +++++
 target/loongarch/meson.build      |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 target/loongarch/constant_timer.c

diff --git a/target/loongarch/constant_timer.c b/target/loongarch/constant_timer.c
new file mode 100644
index 0000000000..8477f91f35
--- /dev/null
+++ b/target/loongarch/constant_timer.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch constant timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/loongarch/loongarch.h"
+#include "qemu/timer.h"
+#include "cpu.h"
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
+    env->CSR_ESTAT |= 1 << IRQ_TIMER;
+    cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
+}
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 43be44c1a2..39d9f9a6de 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,6 +12,7 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "cpu-csr.h"
+#include "qemu/timer.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -148,6 +149,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
 extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
+#define N_IRQS      14
+#define IRQ_TIMER   11
+
 typedef struct CPUArchState {
     uint64_t gpr[32];
     uint64_t pc;
@@ -236,6 +240,7 @@ struct ArchCPU {
 
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
+    QEMUTimer timer;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
@@ -297,4 +302,9 @@ enum {
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
+void loongarch_constant_timer_cb(void *opaque);
+uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
+void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
+                                               uint64_t value);
 #endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 103f36ee15..6168e910a0 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
+  'constant_timer.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.31.1


