Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D28F44CF12
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:38:23 +0100 (CET)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz2k-00083u-66
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:38:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0C-0005Zx-0f
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53944 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz09-0001gV-09
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:43 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S8;
 Thu, 11 Nov 2021 09:35:38 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/30] target/loongarch: Add stabletimer support
Date: Thu, 11 Nov 2021 09:35:04 +0800
Message-Id: <1636594528-8175-7-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S8
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5ZryDWrW5Ww47Aw1rXrb_yoWrWw1xpF
 W7Ar9xtr48trZrJwn3tas0qFn8Jr4xW3W7XayfCFWvkwsrJw1xZa4vq3srZFWjva1FgrWf
 XFyrAa4YgF48X37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.h         | 11 ++++++
 target/loongarch/meson.build   |  1 +
 target/loongarch/stabletimer.c | 70 ++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 target/loongarch/stabletimer.c

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 399c4cb5e8..3dc0ef4cdf 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -148,6 +148,9 @@ FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
 extern const char * const regnames[];
 extern const char * const fregnames[];
 
+#define N_IRQS      14
+#define IRQ_TIMER   11
+
 typedef struct CPULoongArchState CPULoongArchState;
 struct CPULoongArchState {
     uint64_t gpr[32];
@@ -297,6 +300,9 @@ struct CPULoongArchState {
     uint64_t CSR_DBG;
     uint64_t CSR_DERA;
     uint64_t CSR_DESAVE;
+
+    void *irq[N_IRQS];
+    QEMUTimer *timer; /* Internal timer */
 };
 
 /**
@@ -390,4 +396,9 @@ enum {
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
+void cpu_loongarch_clock_init(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_stable_counter(CPULoongArchState *env);
+uint64_t cpu_loongarch_get_stable_timer_ticks(CPULoongArchState *env);
+void cpu_loongarch_store_stable_timer_config(CPULoongArchState *env,
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
index 0000000000..c7ecc300d4
--- /dev/null
+++ b/target/loongarch/stabletimer.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/loongarch/loongarch.h"
+#include "qemu/timer.h"
+#include "cpu.h"
+
+#define TIMER_PERIOD                10 /* 10 ns period for 100 Mhz frequency */
+#define STABLETIMER_TICK_MASK       0xfffffffffffcUL
+#define STABLETIMER_ENABLE          0x1UL
+
+/* LoongArch timer */
+uint64_t cpu_loongarch_get_stable_counter(CPULoongArchState *env)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
+}
+
+uint64_t cpu_loongarch_get_stable_timer_ticks(CPULoongArchState *env)
+{
+    uint64_t now, expire;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    expire = timer_expire_time_ns(env->timer);
+
+    return (expire - now) / TIMER_PERIOD;
+}
+
+void cpu_loongarch_store_stable_timer_config(CPULoongArchState *env,
+                                             uint64_t value)
+{
+    uint64_t now, next;
+
+    env->CSR_TCFG = value;
+    if (value & STABLETIMER_ENABLE) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (value & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(env->timer, next);
+    }
+}
+
+static void loongarch_stable_timer_cb(void *opaque)
+{
+    CPULoongArchState *env;
+    uint64_t now, next;
+
+    env = opaque;
+    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (env->CSR_TCFG & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(env->timer, next);
+    } else {
+        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
+    }
+
+   qemu_irq_raise(env->irq[IRQ_TIMER]);
+}
+
+void cpu_loongarch_clock_init(LoongArchCPU *cpu)
+{
+    CPULoongArchState *env = &cpu->env;
+
+    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                              &loongarch_stable_timer_cb, env);
+}
-- 
2.27.0


