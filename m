Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AF3B5DBF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:14:08 +0200 (CEST)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq9P-0008Tr-2I
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0a-0002Av-S5
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45346 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0T-00015H-8M
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:00 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S6;
 Mon, 28 Jun 2021 20:04:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] target/loongarch: Add interrupt handling support
Date: Mon, 28 Jun 2021 20:04:29 +0800
Message-Id: <1624881885-31692-5-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWxCFy8KF45AF43Ar1kZrb_yoW5Wr13pr
 W7ZFy5Ar48JrZrJ393Ja98Zrn8Zr1xWry29a1ay34FkF4jqr1UXr1kt34DXF15u34rWry2
 vF1rAa4Uu3WUJaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces functions loongarch_cpu_do_interrupt()
and loongarch_cpu_exec_interrupt()

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c      | 23 +++++++++++++++++++++++
 target/loongarch/internal.h | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index b368e79..c3ecc4b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -80,6 +80,28 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->active_tc.PC = value & ~(target_ulong)1;
 }
 
+bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+        CPULoongArchState *env = &cpu->env;
+
+        if (cpu_loongarch_hw_interrupts_enabled(env) &&
+            cpu_loongarch_hw_interrupts_pending(env)) {
+            cs->exception_index = EXCP_INTE;
+            env->error_code = 0;
+            loongarch_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
+void loongarch_cpu_do_interrupt(CPUState *cs)
+{
+    cs->exception_index = EXCP_NONE;
+}
+
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -356,6 +378,7 @@ static Property loongarch_cpu_properties[] = {
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_tcg_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
 };
 #endif /* CONFIG_TCG */
 
diff --git a/target/loongarch/internal.h b/target/loongarch/internal.h
index e2394af..09e667c 100644
--- a/target/loongarch/internal.h
+++ b/target/loongarch/internal.h
@@ -29,10 +29,34 @@ struct loongarch_def_t {
 extern const struct loongarch_def_t loongarch_defs[];
 extern const int loongarch_defs_number;
 
+void loongarch_cpu_do_interrupt(CPUState *cpu);
+bool loongarch_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
 #define cpu_signal_handler cpu_loongarch_signal_handler
 
+static inline bool cpu_loongarch_hw_interrupts_enabled(CPULoongArchState *env)
+{
+    bool ret = 0;
+
+    ret = env->CSR_CRMD & (1 << CSR_CRMD_IE_SHIFT);
+
+    return ret;
+}
+
+static inline bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+{
+    int32_t pending;
+    int32_t status;
+    bool r;
+
+    pending = env->CSR_ESTAT & CSR_ESTAT_IPMASK;
+    status  = env->CSR_ECFG & CSR_ECFG_IPMASK;
+
+    r = (pending & status) != 0;
+    return r;
+}
+
 void loongarch_tcg_init(void);
 
 void QEMU_NORETURN do_raise_exception_err(CPULoongArchState *env,
-- 
1.8.3.1


