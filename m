Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE9432FD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:41:10 +0200 (CEST)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjkD-0001O1-A3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjf0-0001I6-2q
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34916 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjex-0004W9-9l
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:45 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S13; 
 Tue, 19 Oct 2021 15:35:36 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/31] target/loongarch: Add stabletimer support
Date: Tue, 19 Oct 2021 15:34:57 +0800
Message-Id: <1634628917-10031-12-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S13
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr48JFWktFWxXFW7Ary7Wrg_yoWxKF47pF
 W7CFy3tr4rtrZ2y3s7tas0qr1DXw47G342qan29rZ2kanrJrs7Z34vvwsrXFyUJa1YgrWx
 ZF95Z3WagF47Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Mailman-Version: 2.1.23
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
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add a stabletimer support.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c         |  1 +
 target/loongarch/cpu.h         | 10 +++++
 target/loongarch/csr_helper.c  | 26 +++++++++++++
 target/loongarch/meson.build   |  1 +
 target/loongarch/stabletimer.c | 71 ++++++++++++++++++++++++++++++++++
 5 files changed, 109 insertions(+)
 create mode 100644 target/loongarch/stabletimer.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 3e3cf233db..2886dbd642 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -435,6 +435,7 @@ static void set_loongarch_csr(CPULoongArchState *env)
     env->CSR_CPUID = (cs->cpu_index & 0x1ff);
     env->CSR_EENTRY |= (uint64_t)0x80000000;
     env->CSR_TLBRENTRY |= (uint64_t)0x80000000;
+    env->CSR_TMID = cs->cpu_index;
 }
 #endif
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 182b03fb33..e77517d375 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -46,6 +46,9 @@ FIELD(FCSR0, CAUSE, 24, 5)
 extern const char * const regnames[];
 extern const char * const fregnames[];
 
+#define N_IRQS      14
+#define IRQ_TIMER   11
+
 #define LOONGARCH_HFLAG_KU     0x00003 /* kernel/user mode mask   */
 #define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
 #define LOONGARCH_HFLAG_KM     0x00000 /* kernel mode flag                   */
@@ -84,6 +87,8 @@ struct CPULoongArchState {
     int error_code;
     target_ulong exception_base;
 #endif
+    void *irq[N_IRQS];
+    QEMUTimer *timer; /* Internal timer */
 };
 
 /**
@@ -181,4 +186,9 @@ enum {
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
+void cpu_loongarch_clock_init(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_stable_counter(CPULoongArchState *env);
+uint64_t cpu_loongarch_get_stable_timer_ticks(CPULoongArchState *env);
+void cpu_loongarch_store_stable_timer_config(CPULoongArchState *env,
+                                             uint64_t value);
 #endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 9251bfa2a6..6cfb910799 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -14,6 +14,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "hw/irq.h"
 #include "cpu-csr.h"
 #include "tcg/tcg-ldst.h"
 
@@ -78,7 +79,12 @@ target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
     CASE_CSR_RDQ(KS7)
     CASE_CSR_RDQ(KS8)
     CASE_CSR_RDQ(TMID)
+    CASE_CSR_RDQ(TCFG)
+    case LOONGARCH_CSR_TVAL:
+        v = cpu_loongarch_get_stable_timer_ticks(env);
+        break;
     CASE_CSR_RDQ(CNTC)
+    CASE_CSR_RDQ(TINTCLR)
     CASE_CSR_RDQ(LLBCTL)
     CASE_CSR_RDQ(IMPCTL1)
     CASE_CSR_RDQ(IMPCTL2)
@@ -223,8 +229,16 @@ target_ulong helper_csr_wrq(CPULoongArchState *env, target_ulong val,
     CASE_CSR_WRQ(KS7)
     CASE_CSR_WRQ(KS8)
     CASE_CSR_WRQ(TMID)
+    case LOONGARCH_CSR_TCFG:
+        old_v = env->CSR_TCFG;
+        cpu_loongarch_store_stable_timer_config(env, val);
+        break;
     CASE_CSR_WRQ(TVAL)
     CASE_CSR_WRQ(CNTC)
+    case LOONGARCH_CSR_TINTCLR:
+        old_v = 0;
+        qemu_irq_lower(env->irq[IRQ_TIMER]);
+        break;
     CASE_CSR_WRQ(LLBCTL)
     CASE_CSR_WRQ(IMPCTL1)
     CASE_CSR_WRQ(IMPCTL2)
@@ -373,8 +387,12 @@ void helper_csr_xchgq_r0(CPULoongArchState *env, target_ulong mask, uint64_t csr
     CASE_CSR_XCHGQ(KS7)
     CASE_CSR_XCHGQ(KS8)
     CASE_CSR_XCHGQ(TMID)
+    case LOONGARCH_CSR_TCFG:
+        cpu_loongarch_store_stable_timer_config(env, env->CSR_TCFG & (~mask));
+        break;
     CASE_CSR_XCHGQ(TVAL)
     CASE_CSR_XCHGQ(CNTC)
+    CASE_CSR_XCHGQ(TINTCLR)
     CASE_CSR_XCHGQ(LLBCTL)
     CASE_CSR_XCHGQ(IMPCTL1)
     CASE_CSR_XCHGQ(IMPCTL2)
@@ -471,6 +489,7 @@ void helper_csr_xchgq_r0(CPULoongArchState *env, target_ulong mask, uint64_t csr
 target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong val,
                               target_ulong mask, uint64_t csr)
 {
+    target_ulong tmp;
     target_ulong v = val & mask;
 
 #define CASE_CSR_XCHGQ(csr)                                 \
@@ -523,8 +542,15 @@ target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong val,
     CASE_CSR_XCHGQ(KS7)
     CASE_CSR_XCHGQ(KS8)
     CASE_CSR_XCHGQ(TMID)
+    case LOONGARCH_CSR_TCFG:
+        val = env->CSR_TCFG;
+        tmp = val & ~mask;
+        tmp |= v;
+        cpu_loongarch_store_stable_timer_config(env, tmp);
+        break;
     CASE_CSR_XCHGQ(TVAL)
     CASE_CSR_XCHGQ(CNTC)
+    CASE_CSR_XCHGQ(TINTCLR)
     CASE_CSR_XCHGQ(LLBCTL)
     CASE_CSR_XCHGQ(IMPCTL1)
     CASE_CSR_XCHGQ(IMPCTL2)
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 74f4a63d15..fd0365cffd 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_softmmu_ss.add(files(
   'machine.c',
   'tlb_helper.c',
   'csr_helper.c',
+  'stabletimer.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/stabletimer.c b/target/loongarch/stabletimer.c
new file mode 100644
index 0000000000..a3bf32a865
--- /dev/null
+++ b/target/loongarch/stabletimer.c
@@ -0,0 +1,71 @@
+/*
+ * QEMU LoongArch timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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


