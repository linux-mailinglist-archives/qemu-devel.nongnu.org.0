Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CAD60797C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:24:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olswj-0001Vc-6Z
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:24:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olswh-00023h-6T
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsva-0004OF-CG; Fri, 21 Oct 2022 10:23:22 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsvV-0004QZ-Pj; Fri, 21 Oct 2022 10:23:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 11:21:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9A87080020E;
 Fri, 21 Oct 2022 11:21:58 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v4 1/3] target/ppc: introduce ppc_maybe_interrupt
Date: Fri, 21 Oct 2022 11:21:54 -0300
Message-Id: <20221021142156.4134411-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
References: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2022 14:21:58.0971 (UTC)
 FILETIME=[7AEDB0B0:01D8E558]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
v4:
  - Call gen_icount_io_start before helper_ppc_maybe_interrupt to avoid
    the cpu_abort("Raised interrupt while not in I/O function")
    in icount_handle_interrupt
---
 hw/ppc/pnv_core.c        |  1 +
 hw/ppc/ppc.c             |  7 +------
 hw/ppc/spapr_hcall.c     |  6 ++++++
 hw/ppc/spapr_rtas.c      |  2 +-
 target/ppc/cpu.c         |  2 ++
 target/ppc/cpu.h         |  1 +
 target/ppc/excp_helper.c | 42 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/helper.h      |  1 +
 target/ppc/helper_regs.c |  2 ++
 target/ppc/translate.c   | 11 ++++++++++-
 10 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 19e8eb885f..9ee79192dd 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -58,6 +58,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
     env->msr |= MSR_HVB; /* Hypervisor mode */
     env->spr[SPR_HRMOR] = pc->hrmor;
     hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
 
     pcc->intc_reset(pc->chip, cpu);
 }
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
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 891206e893..925ff523cc 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -490,6 +490,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
     env->msr |= (1ULL << MSR_EE);
     hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
 
     if (spapr_cpu->prod) {
         spapr_cpu->prod = false;
@@ -500,6 +501,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
         cs->halted = 1;
         cs->exception_index = EXCP_HLT;
         cs->exit_request = 1;
+        ppc_maybe_interrupt(env);
     }
 
     return H_SUCCESS;
@@ -521,6 +523,7 @@ static target_ulong h_confer_self(PowerPCCPU *cpu)
     cs->halted = 1;
     cs->exception_index = EXCP_HALTED;
     cs->exit_request = 1;
+    ppc_maybe_interrupt(&cpu->env);
 
     return H_SUCCESS;
 }
@@ -633,6 +636,7 @@ static target_ulong h_prod(PowerPCCPU *cpu, SpaprMachineState *spapr,
     spapr_cpu = spapr_cpu_state(tcpu);
     spapr_cpu->prod = true;
     cs->halted = 0;
+    ppc_maybe_interrupt(&cpu->env);
     qemu_cpu_kick(cs);
 
     return H_SUCCESS;
@@ -1669,6 +1673,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     spapr_cpu->in_nested = true;
 
     hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
     tlb_flush(cs);
     env->reserve_addr = -1; /* Reset the reservation */
 
@@ -1810,6 +1815,7 @@ out_restore_l1:
     spapr_cpu->in_nested = false;
 
     hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
     tlb_flush(cs);
     env->reserve_addr = -1; /* Reset the reservation */
 
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index d58b65e88f..3f664ea02c 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -214,9 +214,9 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMachineState *spapr,
      * guest.
      * For the same reason, set PSSCR_EC.
      */
-    ppc_store_lpcr(cpu, env->spr[SPR_LPCR] & ~pcc->lpcr_pm);
     env->spr[SPR_PSSCR] |= PSSCR_EC;
     cs->halted = 1;
+    ppc_store_lpcr(cpu, env->spr[SPR_LPCR] & ~pcc->lpcr_pm);
     kvmppc_set_reg_ppc_online(cpu, 0);
     qemu_cpu_kick(cs);
 }
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index e95b4c5ee1..1a97b41c6b 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -82,6 +82,8 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
     /* The gtse bit affects hflags */
     hreg_compute_hflags(env);
+
+    ppc_maybe_interrupt(env);
 }
 #endif
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ad758b00e5..cc2d0305ff 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1358,6 +1358,7 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
 #ifndef CONFIG_USER_ONLY
+void ppc_maybe_interrupt(CPUPPCState *env);
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e9beb002e3..8b67053728 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -390,6 +390,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
     env->nip = vector;
     env->msr = msr;
     hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
 
     powerpc_reset_excp_state(cpu);
 
@@ -2050,6 +2051,40 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
     }
 }
 
+/*
+ * Sets CPU_INTERRUPT_HARD if there is at least one unmasked interrupt to be
+ * delivered and clears CPU_INTERRUPT_HARD otherwise.
+ *
+ * This method is called by ppc_set_interrupt when an interrupt is raised or
+ * lowered, and should also be called whenever an interrupt masking condition
+ * is changed, e.g.:
+ *  - When relevant bits of MSR are altered, like EE, HV, PR, etc.;
+ *  - When relevant bits of LPCR are altered, like PECE, HDICE, HVICE, etc.;
+ *  - When PSSCR[EC] or env->resume_as_sreset are changed;
+ *  - When cs->halted is changed and the CPU has a different interrupt masking
+ *    logic in power-saving mode (e.g., POWER7/8/9/10);
+ */
+void ppc_maybe_interrupt(CPUPPCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    bool locked = false;
+
+    if (!qemu_mutex_iothread_locked()) {
+        locked = true;
+        qemu_mutex_lock_iothread();
+    }
+
+    if (ppc_next_unmasked_interrupt(env)) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+
+    if (locked) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 #if defined(TARGET_PPC64)
 static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
 {
@@ -2497,6 +2532,11 @@ void helper_store_msr(CPUPPCState *env, target_ulong val)
     }
 }
 
+void helper_ppc_maybe_interrupt(CPUPPCState *env)
+{
+    ppc_maybe_interrupt(env);
+}
+
 #if defined(TARGET_PPC64)
 void helper_scv(CPUPPCState *env, uint32_t lev)
 {
@@ -2517,6 +2557,8 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
     /* Condition for waking up at 0x100 */
     env->resume_as_sreset = (insn != PPC_PM_STOP) ||
         (env->spr[SPR_PSSCR] & PSSCR_EC);
+
+    ppc_maybe_interrupt(env);
 }
 #endif /* defined(TARGET_PPC64) */
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8344fe39c6..25533b8f33 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -10,6 +10,7 @@ DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
 DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
+DEF_HELPER_1(ppc_maybe_interrupt, void, env)
 DEF_HELPER_1(rfi, void, env)
 DEF_HELPER_1(40x_rfci, void, env)
 DEF_HELPER_1(rfci, void, env)
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
index 64893e3670..aa9f47d7d1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -305,6 +305,14 @@ static void gen_icount_io_start(DisasContext *ctx)
     }
 }
 
+#if !defined(CONFIG_USER_ONLY)
+static void gen_ppc_maybe_interrupt(DisasContext *ctx)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_ppc_maybe_interrupt(cpu_env);
+}
+#endif
+
 /*
  * Tells the caller what is the appropriate exception to generate and prepares
  * SPR registers for this exception.
@@ -6161,7 +6169,6 @@ static void gen_tlbilx_booke206(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-
 /* wrtee */
 static void gen_wrtee(DisasContext *ctx)
 {
@@ -6175,6 +6182,7 @@ static void gen_wrtee(DisasContext *ctx)
     tcg_gen_andi_tl(t0, cpu_gpr[rD(ctx->opcode)], (1 << MSR_EE));
     tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
     tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
+    gen_ppc_maybe_interrupt(ctx);
     tcg_temp_free(t0);
     /*
      * Stop translation to have a chance to raise an exception if we
@@ -6193,6 +6201,7 @@ static void gen_wrteei(DisasContext *ctx)
     CHK_SV(ctx);
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
+        gen_ppc_maybe_interrupt(ctx);
         /* Stop translation to have a chance to raise an exception */
         ctx->base.is_jmp = DISAS_EXIT_UPDATE;
     } else {
-- 
2.25.1


