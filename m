Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2559337F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:50:16 +0200 (CEST)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdI7-0007nv-FL
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrS-0000DE-U7; Mon, 15 Aug 2022 12:22:42 -0400
Received: from [200.168.210.66] (port=4179 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrR-0005wd-4V; Mon, 15 Aug 2022 12:22:42 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4E0C2800186;
 Mon, 15 Aug 2022 13:20:45 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 12/13] target/ppc: introduce ppc_maybe_interrupt
Date: Mon, 15 Aug 2022 13:20:18 -0300
Message-Id: <20220815162020.2420093-13-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:45.0766 (UTC)
 FILETIME=[F9270E60:01D8B0C2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This new method will check if any pending interrupt was unmasked and
then call cpu_interrupt/cpu_reset_interrupt accordingly. Code that
raises/lowers or masks/unmasks interrupts should call this method to
keep CPU_INTERRUPT_HARD coherent with env->pending_interrupts.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 hw/ppc/ppc.c             |  7 +------
 target/ppc/cpu.h         |  1 +
 target/ppc/excp_helper.c | 19 +++++++++++++++++++
 target/ppc/helper_regs.c |  2 ++
 target/ppc/translate.c   |  8 ++++++--
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 77e611e81c..dc86c1c7db 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -42,7 +42,6 @@ static void cpu_ppc_tb_start (CPUPPCState *env);
 
 void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 {
-    CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     unsigned int old_pending;
     bool locked = false;
@@ -57,19 +56,15 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 
     if (level) {
         env->pending_interrupts |= irq;
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         env->pending_interrupts &= ~irq;
-        if (env->pending_interrupts == 0) {
-            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-        }
     }
 
     if (old_pending != env->pending_interrupts) {
+        ppc_maybe_interrupt(env);
         kvmppc_set_interrupt(cpu, irq, level);
     }
 
-
     trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
                            CPU(cpu)->interrupt_request);
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5018296f02..f65e0d7de8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1358,6 +1358,7 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 #ifndef CONFIG_USER_ONLY
+void ppc_maybe_interrupt(CPUPPCState *env);
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b4c1198ea2..788dcd732a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2143,6 +2143,23 @@ static int ppc_pending_interrupt(CPUPPCState *env)
     }
 }
 
+void ppc_maybe_interrupt(CPUPPCState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    if (ppc_pending_interrupt(env)) {
+        if (!qemu_mutex_iothread_locked()) {
+            qemu_mutex_lock_iothread();
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+            qemu_mutex_unlock_iothread();
+        } else {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
 static void ppc_hw_interrupt(CPUPPCState *env, int pending_interrupt)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -2380,6 +2397,8 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
     /* Condition for waking up at 0x100 */
     env->resume_as_sreset = (insn != PPC_PM_STOP) ||
         (env->spr[SPR_PSSCR] & PSSCR_EC);
+
+    ppc_maybe_interrupt(env);
 }
 #endif /* defined(TARGET_PPC64) */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 12235ea2e9..2e85e124ab 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -260,6 +260,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     env->msr = value;
     hreg_compute_hflags(env);
 #if !defined(CONFIG_USER_ONLY)
+    ppc_maybe_interrupt(env);
+
     if (unlikely(FIELD_EX64(env->msr, MSR, POW))) {
         if (!env->pending_interrupts && (*env->check_pow)(env)) {
             cs->halted = 1;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 388337f81b..60dd66f736 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6174,7 +6174,8 @@ static void gen_wrtee(DisasContext *ctx)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[rD(ctx->opcode)], (1 << MSR_EE));
     tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
-    tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
+    tcg_gen_or_tl(t0, cpu_msr, t0);
+    gen_helper_store_msr(cpu_env, t0);
     tcg_temp_free(t0);
     /*
      * Stop translation to have a chance to raise an exception if we
@@ -6192,7 +6193,10 @@ static void gen_wrteei(DisasContext *ctx)
 #else
     CHK_SV(ctx);
     if (ctx->opcode & 0x00008000) {
-        tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
+        TCGv t0 = tcg_temp_new();
+        tcg_gen_ori_tl(t0, cpu_msr, (1 << MSR_EE));
+        gen_helper_store_msr(cpu_env, t0);
+        tcg_temp_free(t0);
         /* Stop translation to have a chance to raise an exception */
         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else {
-- 
2.25.1


