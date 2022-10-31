Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201EF612FEA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXT-0001iv-Cb; Mon, 31 Oct 2022 01:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXR-0001iY-NH
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:45 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXP-00043k-Bj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:45 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-13be3ef361dso12446515fac.12
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9qAXoDzlHGtWJjESxhzwvdwIiiEZj3DJdEKDv+hjRU=;
 b=GoTiUtv4Umd2Pg7MHBmCNLmeJO3YuT/Q4PF/EXBZl8x3entzsZK49BH81hTq0Lorxi
 rvPJtLUE63ELAle7QseAaUGm+yLF9wmyjbG57NKBkRhcxre8duy0JfMMLTL8WsmbluhK
 IZJflPdAx504oiDQAqkjbQYUyCp5Y76xs9H31NHXcetRcCW8QhNuMTOF5okpXi+OHRcB
 fD9LZqCRcEGQvPKrGpvsNc3qjDoHMnYLAgC8B5VvVKdUOTjZFRG5b9CUmAz15afQRE0G
 xx5TG9VldwPLdaCW1U1ea7oJNkGAIZ9VAmadXcNWM/qKHlXE/ILATo0Y8PnNzc4M+BR5
 cPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9qAXoDzlHGtWJjESxhzwvdwIiiEZj3DJdEKDv+hjRU=;
 b=MOr/1nhtrZ1jfq2EpBlLf8SahDss0p1YJJVQslOsovlDidc5/g70QhTX5hFj/onEgs
 O7cyyPbkMQOupagqWnk6NEqNMItezQ1K+NVTBnxG+DgvTmpfuTi9RvMtWKD/2i+VU4Vd
 RmmpN+uTquBCN6crWiff8KtVMgffdAULTbM1qtH0Y5liKLUO4nGePkvbfko31dl+38kW
 rB5BOHWGA6wiesPwu5pQwxh6RkqEpg6Xa+E3f+aZd3ux5JRgSz8iz3dTqP5dgqJKxTg4
 b+6ErX1Mg+528VlSTxSCnU/Cj71+n6quvOey5eEA18ibNvcHFJquTtUrkW4mTELUdJZj
 vGHw==
X-Gm-Message-State: ACrzQf1frGB8RNRGCRnMR9UT6PQ9ldMaNa/thvyuK8nsW3WegoP4M/J3
 ilKbD4l57Kq7iM+Wo0F6Rd5GGMuAuAD7pw==
X-Google-Smtp-Source: AMsMyM4InADtwdW6XvGxrtQf/zabyfmpuOjV+hnIjYU3zhmtBsYlnl9EJaZcfleQfFMpAUWe+QFcWw==
X-Received: by 2002:a05:6870:424d:b0:13c:12cf:84d7 with SMTP id
 v13-20020a056870424d00b0013c12cf84d7mr16374284oac.281.1667194842024; 
 Sun, 30 Oct 2022 22:40:42 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>
Subject: [PULL 09/11] accel/tcg: Remove will_exit argument from
 cpu_restore_state
Date: Mon, 31 Oct 2022 16:39:46 +1100
Message-Id: <20221031053948.3408-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The value passed is always true, and if the target's
synchronize_from_tb hook is non-trivial, not exiting
may be erroneous.

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h             |  5 +----
 accel/tcg/cpu-exec-common.c         |  2 +-
 accel/tcg/translate-all.c           | 12 ++----------
 target/alpha/helper.c               |  2 +-
 target/alpha/mem_helper.c           |  2 +-
 target/arm/op_helper.c              |  2 +-
 target/arm/tlb_helper.c             |  8 ++++----
 target/cris/helper.c                |  2 +-
 target/i386/tcg/sysemu/svm_helper.c |  2 +-
 target/m68k/op_helper.c             |  4 ++--
 target/microblaze/helper.c          |  2 +-
 target/nios2/op_helper.c            |  2 +-
 target/openrisc/sys_helper.c        |  4 ++--
 target/ppc/excp_helper.c            |  2 +-
 target/s390x/tcg/excp_helper.c      |  2 +-
 target/tricore/op_helper.c          |  2 +-
 target/xtensa/helper.c              |  6 +++---
 17 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7d851f5907..9b7bfbf09a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -56,16 +56,13 @@ bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
  * cpu_restore_state:
  * @cpu: the cpu context
  * @host_pc: the host pc within the translation
- * @will_exit: true if the TB executed will be interrupted after some
-               cpu adjustments. Required for maintaining the correct
-               icount valus
  * @return: true if state was restored, false otherwise
  *
  * Attempt to restore the state for a fault occurring in translated
  * code. If @host_pc is not in translated code no state is
  * restored and the function returns false.
  */
-bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit);
+bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc);
 
 G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit(CPUState *cpu);
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5..c7bc8c6efa 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -71,7 +71,7 @@ void cpu_loop_exit(CPUState *cpu)
 void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 {
     if (pc) {
-        cpu_restore_state(cpu, pc, true);
+        cpu_restore_state(cpu, pc);
     }
     cpu_loop_exit(cpu);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 319becb698..90997fed47 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -318,16 +318,8 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 #endif
 }
 
-bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
+bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
 {
-    /*
-     * The pc update associated with restore without exit will
-     * break the relative pc adjustments performed by TARGET_TB_PCREL.
-     */
-    if (TARGET_TB_PCREL) {
-        assert(will_exit);
-    }
-
     /*
      * The host_pc has to be in the rx region of the code buffer.
      * If it is not we will not be able to resolve it here.
@@ -341,7 +333,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
     if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
         TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
-            cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
+            cpu_restore_state_from_tb(cpu, tb, host_pc, true);
             return true;
         }
     }
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index a5a389b5a3..970c869771 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -532,7 +532,7 @@ G_NORETURN void dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
     cs->exception_index = excp;
     env->error_code = error;
     if (retaddr) {
-        cpu_restore_state(cs, retaddr, true);
+        cpu_restore_state(cs, retaddr);
         /* Floating-point exceptions (our only users) point to the next PC.  */
         env->pc += 4;
     }
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index 47283a0612..a39b52c5dd 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -28,7 +28,7 @@ static void do_unaligned_access(CPUAlphaState *env, vaddr addr, uintptr_t retadd
     uint64_t pc;
     uint32_t insn;
 
-    cpu_restore_state(env_cpu(env), retaddr, true);
+    cpu_restore_state(env_cpu(env), retaddr);
 
     pc = env->pc;
     insn = cpu_ldl_code(env, pc);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c5bde1cfcc..70672bcd9f 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -78,7 +78,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
      * we must restore CPU state here before setting the syndrome
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
-    cpu_restore_state(cs, ra, true);
+    cpu_restore_state(cs, ra);
     raise_exception(env, excp, syndrome, target_el);
 }
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 69b0dc69df..0f4f4fc809 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -156,7 +156,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     ARMMMUFaultInfo fi = {};
 
     /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
 
     fi.type = ARMFault_Alignment;
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
@@ -196,7 +196,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     ARMMMUFaultInfo fi = {};
 
     /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
 
     fi.ea = arm_extabort_type(response);
     fi.type = ARMFault_SyncExternal;
@@ -252,7 +252,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     } else {
         /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
+        cpu_restore_state(cs, retaddr);
         arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
 }
@@ -271,7 +271,7 @@ void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
      * We report both ESR and FAR to signal handlers.
      * For now, it's easiest to deliver the fault normally.
      */
-    cpu_restore_state(cs, ra, true);
+    cpu_restore_state(cs, ra);
     arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &fi);
 }
 
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 91e4aeb178..81a72699b5 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -87,7 +87,7 @@ bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     cs->exception_index = EXCP_BUSFAULT;
     env->fault_vector = res.bf_vec;
     if (retaddr) {
-        if (cpu_restore_state(cs, retaddr, true)) {
+        if (cpu_restore_state(cs, retaddr)) {
             /* Evaluate flags after retranslation. */
             helper_top_evaluate_flags(env);
         }
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 8e88567399..2d27731b60 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -704,7 +704,7 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1,
 {
     CPUState *cs = env_cpu(env);
 
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
 
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmexit(%08x, %016" PRIx64 ", %016"
                   PRIx64 ", " TARGET_FMT_lx ")!\n",
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 5da176d642..1ce850bbc5 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -460,7 +460,7 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
 
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
 
     if (m68k_feature(env, M68K_FEATURE_M68040)) {
         env->mmu.mmusr = 0;
@@ -558,7 +558,7 @@ raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
     cs->exception_index = tt;
 
     /* Recover PC and CC_OP for the beginning of the insn.  */
-    cpu_restore_state(cs, raddr, true);
+    cpu_restore_state(cs, raddr);
 
     /* Flags are current in env->cc_*, or are undefined. */
     env->cc_op = CC_OP_FLAGS;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index a607fe68e5..98bdb82de8 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -277,7 +277,7 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     uint32_t esr, iflags;
 
     /* Recover the pc and iflags from the corresponding insn_start.  */
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
     iflags = cpu->env.iflags;
 
     qemu_log_mask(CPU_LOG_INT,
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 2e30d0a908..0aaf33ffc2 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -40,7 +40,7 @@ void nios2_cpu_loop_exit_advance(CPUNios2State *env, uintptr_t retaddr)
      * Do this here, rather than in restore_state_to_opc(),
      * lest we affect QEMU internal exceptions, like EXCP_DEBUG.
      */
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
     env->pc += 4;
     cpu_loop_exit(cs);
 }
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index dde2fa1623..ec145960e3 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -45,7 +45,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
 
     case TO_SPR(0, 16): /* NPC */
-        cpu_restore_state(cs, GETPC(), true);
+        cpu_restore_state(cs, GETPC());
         /* ??? Mirror or1ksim in not trashing delayed branch state
            when "jumping" to the current instruction.  */
         if (env->pc != rb) {
@@ -131,7 +131,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
     case TO_SPR(8, 0):  /* PMR */
         env->pmr = rb;
         if (env->pmr & PMR_DME || env->pmr & PMR_SME) {
-            cpu_restore_state(cs, GETPC(), true);
+            cpu_restore_state(cs, GETPC());
             env->pc += 4;
             cs->halted = 1;
             raise_exception(cpu, EXCP_HALTED);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 43f2480e94..3ded309265 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2414,7 +2414,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     uint32_t insn;
 
     /* Restore state and reload the insn we executed, for filling in DSISR.  */
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
     insn = cpu_ldl_code(env, env->nip);
 
     switch (env->mmu_model) {
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 29ccf70df1..2cd6d062b9 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -39,7 +39,7 @@ G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
 {
     CPUState *cs = env_cpu(env);
 
-    cpu_restore_state(cs, ra, true);
+    cpu_restore_state(cs, ra);
     qemu_log_mask(CPU_LOG_INT, "program interrupt at %#" PRIx64 "\n",
                   env->psw.addr);
     trigger_pgm_exception(env, code);
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index a79c838a92..532ae6b74c 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -31,7 +31,7 @@ void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin
 {
     CPUState *cs = env_cpu(env);
     /* in case we come from a helper-call we need to restore the PC */
-    cpu_restore_state(cs, pc, true);
+    cpu_restore_state(cs, pc);
 
     /* Tin is loaded into d[15] */
     env->gpr_d[15] = tin;
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index e0a9caab4b..2aa9777a8e 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -253,7 +253,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
 
     assert(xtensa_option_enabled(env->config,
                                  XTENSA_OPTION_UNALIGNED_EXCEPTION));
-    cpu_restore_state(CPU(cpu), retaddr, true);
+    cpu_restore_state(CPU(cpu), retaddr);
     HELPER(exception_cause_vaddr)(env,
                                   env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
                                   addr);
@@ -284,7 +284,7 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        cpu_restore_state(cs, retaddr, true);
+        cpu_restore_state(cs, retaddr);
         HELPER(exception_cause_vaddr)(env, env->pc, ret, address);
     }
 }
@@ -297,7 +297,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
 
-    cpu_restore_state(cs, retaddr, true);
+    cpu_restore_state(cs, retaddr);
     HELPER(exception_cause_vaddr)(env, env->pc,
                                   access_type == MMU_INST_FETCH ?
                                   INSTR_PIF_ADDR_ERROR_CAUSE :
-- 
2.34.1


