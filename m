Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9683653B8F4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:24:24 +0200 (CEST)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjsF-0007xV-KO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTU-0000bb-H6
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTS-0001E6-2B
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5mSj-1ni55k3kp1-017EWB; Thu, 02
 Jun 2022 13:58:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/19] target/m68k: Fix address argument for EXCP_TRACE
Date: Thu,  2 Jun 2022 13:58:28 +0200
Message-Id: <20220602115837.2013918-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yHtcuEI5oWPEj21RnBWwmQG1PB2U1nccNA1xUHgD1dZ0tjk06zG
 kyLPVXqVegdeSi09d4cflMs8mMNm7muJpIkazz5j61oTDVyCcLJPclU+SUNwai7ch+kHxS/
 oP3Xza0M24OuFj1MZ3ta8SjiQm35wmZJI8yJFWtocx72AA8vN4CxQ9boTlqOzUiAgbhetw9
 1FfUgTDOFC10rteOGDHXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gbRDYPoZyrY=:PElDNouuAcoceyxKfdegqT
 dmHgZWsd5UWhhC7oHj4F32DmLowL2uV7nOq2/S6T1uWGcCGjZg/2qiaZEu/J4uRq4AXutK5rX
 xhiFIbDqQTli33XyZvE5KiILBQP3QxZ5HxVeXh+OAchkrG19xlTGWSobounvezhBAtpqozSJz
 A3zAcxn/Tcgyc1/Cmrr5KhTIxop7usSEq5a0H41g2TP+PFypmLNs2hEg8W20bQvJDNrKX+KcH
 bxVBwIs4fHX9enRxKDoboUDzw09Ovjgqua3htmhl5Jdr63t/AbHJaYuCzC1noHQCl+jMkFt+Y
 RfeJkV7GnyDshQ6k1oGA+VT6zlL6xQzK5x7OJbMmEltgZkVtOmM1R1Ra4bb9zRZT4xCLXTVeU
 cwq8oesNDGd0OWrlcIcQ3xkfTgaIDnzcGaatCYmAPqSkg76Zm2IGezZ3a2mofrrsKX4lBmr2P
 HhhL6guqm+1N8rXhvG+WjYVTfO0T3AKHP1WwfwmnKv+HdKtSMSPgBIXJaslaYx4Rz+XWE3DcP
 jjRAC+JiBNhhFO0S6qvL05LLMq/HCeXAY5SRzv0RJJkPuqss+Amb4Kr8fVdOwjk/VEoT0tQFq
 iPXeaRfT0CJAgiGboOqCwT/8buZdf24Tjmbp4388BhjhviZP9NKGdj/dJbQpfF+1lUkzZhPmh
 lS8ypChlyDVG+T8xFPYvCEU2gDQNdhZVzzVk2CF+QZ0Z7sr8Y6dUXJRpT5R0CtfB4dOloFHPF
 yjSFU3U+VDBgOvUUvkmmgW0H/3XnIhgC6fOG9Q==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Trace (and others) is
supposed to record the next insn in PC and the address
of the trapping instruction in ADDRESS.

Create gen_raise_exception_format2 to record the trapping
pc in env->mmu.ar.  Update m68k_interrupt_all to pass the
value to do_stack_frame.  Update cpu_loop to handle EXCP_TRACE.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/cpu_loop.c |  3 +++
 target/m68k/op_helper.c    |  2 +-
 target/m68k/translate.c    | 49 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 6598bce3c4e7..fcf92205529e 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -52,6 +52,9 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
             break;
+        case EXCP_TRACE:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_TRACE, env->mmu.ar);
+            break;
         case EXCP_TRAP0:
             {
                 abi_long ret;
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 729ee0e93482..3cb71c914003 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -397,13 +397,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
     case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
-    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_CHK:
     case EXCP_DIV0:
+    case EXCP_TRACE:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 6075f4993031..38b72d282aa6 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -114,6 +114,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     CPUM68KState *env;
     target_ulong pc;
+    target_ulong pc_prev;
     CCOp cc_op; /* Current CC operation */
     int cc_op_synced;
     TCGv_i64 mactmp;
@@ -298,6 +299,21 @@ static void gen_raise_exception(int nr)
     tcg_temp_free_i32(tmp);
 }
 
+static void gen_raise_exception_format2(DisasContext *s, int nr,
+                                        target_ulong this_pc)
+{
+    /*
+     * Pass the address of the insn to the exception handler,
+     * for recording in the Format $2 (6-word) stack frame.
+     * Re-use mmu.ar for the purpose, since that's only valid
+     * after tlb_fill.
+     */
+    tcg_gen_st_i32(tcg_constant_i32(this_pc), cpu_env,
+                   offsetof(CPUM68KState, mmu.ar));
+    gen_raise_exception(nr);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_exception(DisasContext *s, uint32_t dest, int nr)
 {
     update_cc_op(s);
@@ -1494,12 +1510,13 @@ static void gen_exit_tb(DisasContext *s)
     } while (0)
 
 /* Generate a jump to an immediate address.  */
-static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
+static void gen_jmp_tb(DisasContext *s, int n, target_ulong dest,
+                       target_ulong src)
 {
     if (unlikely(s->ss_active)) {
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
-        gen_raise_exception(EXCP_TRACE);
+        gen_raise_exception_format2(s, EXCP_TRACE, src);
     } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
@@ -1548,9 +1565,9 @@ DISAS_INSN(dbcc)
     tcg_gen_addi_i32(tmp, tmp, -1);
     gen_partset_reg(OS_WORD, reg, tmp);
     tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, -1, l1);
-    gen_jmp_tb(s, 1, base + offset);
+    gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
     gen_set_label(l1);
-    gen_jmp_tb(s, 0, s->pc);
+    gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
 }
 
 DISAS_INSN(undef_mac)
@@ -3096,13 +3113,13 @@ DISAS_INSN(branch)
         /* Bcc */
         TCGLabel *l1 = gen_new_label();
         gen_jmpcc(s, ((insn >> 8) & 0xf) ^ 1, l1);
-        gen_jmp_tb(s, 1, base + offset);
+        gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
         gen_set_label(l1);
-        gen_jmp_tb(s, 0, s->pc);
+        gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
     } else {
         /* Unconditional branch.  */
         update_cc_op(s);
-        gen_jmp_tb(s, 0, base + offset);
+        gen_jmp_tb(s, 0, base + offset, s->base.pc_next);
     }
 }
 
@@ -5485,9 +5502,9 @@ DISAS_INSN(fbcc)
     l1 = gen_new_label();
     update_cc_op(s);
     gen_fjmpcc(s, insn & 0x3f, l1);
-    gen_jmp_tb(s, 0, s->pc);
+    gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
     gen_set_label(l1);
-    gen_jmp_tb(s, 1, base + offset);
+    gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
 }
 
 DISAS_INSN(fscc)
@@ -6159,6 +6176,8 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
     dc->env = env;
     dc->pc = dc->base.pc_first;
+    /* This value will always be filled in properly before m68k_tr_tb_stop. */
+    dc->pc_prev = 0xdeadbeef;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_synced = 1;
     dc->done_mac = 0;
@@ -6192,6 +6211,7 @@ static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     do_writebacks(dc);
     do_release(dc);
 
+    dc->pc_prev = dc->base.pc_next;
     dc->base.pc_next = dc->pc;
 
     if (dc->base.is_jmp == DISAS_NEXT) {
@@ -6226,17 +6246,12 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         break;
     case DISAS_TOO_MANY:
         update_cc_op(dc);
-        if (dc->ss_active) {
-            tcg_gen_movi_i32(QREG_PC, dc->pc);
-            gen_raise_exception(EXCP_TRACE);
-        } else {
-            gen_jmp_tb(dc, 0, dc->pc);
-        }
+        gen_jmp_tb(dc, 0, dc->pc, dc->pc_prev);
         break;
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
         if (dc->ss_active) {
-            gen_raise_exception(EXCP_TRACE);
+            gen_raise_exception_format2(dc, EXCP_TRACE, dc->pc_prev);
         } else {
             tcg_gen_lookup_and_goto_ptr();
         }
@@ -6247,7 +6262,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * other state that may require returning to the main loop.
          */
         if (dc->ss_active) {
-            gen_raise_exception(EXCP_TRACE);
+            gen_raise_exception_format2(dc, EXCP_TRACE, dc->pc_prev);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
-- 
2.36.1


