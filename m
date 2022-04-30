Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB160515FBD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:03:55 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrRi-0001q7-V3
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI2-0004dq-0M
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:56 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI0-000831-85
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u7so9578969plg.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fjeo0HvEVxkPgodgKfBulTRYe64uwbkWnzaPS9u5yUI=;
 b=pSd05TqAjJ6O27mgpAtMqSUlYBtM1kXwr66hU3fjmQAnvfct/cnbTgbjuH80ISRfyX
 bro6rQ6TTgm2yfEitOU5Uj+w4ePtqND5ZR/SkHouNIf8dx62U7ExR2arSNAItZObHeKJ
 6ap7OdHG5zTtG59c4+Gs/83n5m6EB7rEhx5hzzFgpphA9EsAqkAfmXlb+ardIf4NXoQk
 69FdV/BsI9OLM5mwu1HHM8BKhX8KFaim4h5hrnscy6SO9YhXk49UfwnI/W1mTsJ/RgrJ
 5/o5NyTPjwSC5pn8F8SHqpzGkVkFvGwfwTJUJ+mQXJdLPS2TknOHWEpkhm7GnG3lFB5x
 UrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fjeo0HvEVxkPgodgKfBulTRYe64uwbkWnzaPS9u5yUI=;
 b=AnzkvWziwRhcL2c28eyrz/6ZjKjqWdyNNPCOI7rVmI22qlK5IC39tOFoVThPVjf3CN
 I2pmumFjsHwOrGmwQvQd7IPU81SBgoiLD4ATPi2Cnz3qIyw59EZcuXY7tPArm8elQpd5
 +oCBWfeoo2SiTMbgfyMy4JdfrdRQsetkxNd6/mDIjn7dexIXJXss0TSrqPTX5D+LnLgj
 5SSFbfWGvLsHed+Ty2ieEkxuNNJRZeF4VgpiOZfv5xR/84pwxd9g9xYV/oBKnHIekph5
 4quQdcdg9RFYnbv6U8pSETG5IX3T4nTshFMjS9m4C6HcPWnXzFynuSCbsTNjvTYb+GuZ
 8qsw==
X-Gm-Message-State: AOAM533xL12BIYJ7z8RvqMdr2STX37P+PmyHDnkbeDSlwGhQV32qgjTA
 fyacZDSqyVq2dC7xgEXX3U2dWShKFWasGA==
X-Google-Smtp-Source: ABdhPJyrjjnd8Wwwdj5cUizanqSClxB/a6lyNE9pH2fTTkuUp6aQHC62/Fi0B002TCBJakTYGp3iZA==
X-Received: by 2002:a17:902:f605:b0:154:aa89:bd13 with SMTP id
 n5-20020a170902f60500b00154aa89bd13mr4607821plg.112.1651341230965; 
 Sat, 30 Apr 2022 10:53:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/17] target/m68k: Fix address argument for EXCP_TRACE
Date: Sat, 30 Apr 2022 10:53:33 -0700
Message-Id: <20220430175342.370628-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Trace (and others) is
supposed to record the next insn in PC and the address
of the trapping instruction in ADDRESS.

Create gen_raise_exception_format2 to record the trapping
pc in env->mmu.ar.  Update m68k_interrupt_all to pass the
value to do_stack_frame.  Update cpu_loop to handle EXCP_TRACE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c |  3 +++
 target/m68k/op_helper.c    |  2 +-
 target/m68k/translate.c    | 49 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 45419d4471..000bb44cc3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -53,6 +53,9 @@ void cpu_loop(CPUM68KState *env)
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
index 729ee0e934..3cb71c9140 100644
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
index d775345bfa..399d9232e4 100644
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
@@ -6158,6 +6175,8 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
     dc->env = env;
     dc->pc = dc->base.pc_first;
+    /* This value will always be filled in properly before m68k_tr_tb_stop. */
+    dc->pc_prev = 0xdeadbeef;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_synced = 1;
     dc->done_mac = 0;
@@ -6191,6 +6210,7 @@ static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     do_writebacks(dc);
     do_release(dc);
 
+    dc->pc_prev = dc->base.pc_next;
     dc->base.pc_next = dc->pc;
 
     if (dc->base.is_jmp == DISAS_NEXT) {
@@ -6225,17 +6245,12 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
@@ -6246,7 +6261,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * other state that may require returning to the main loop.
          */
         if (dc->ss_active) {
-            gen_raise_exception(EXCP_TRACE);
+            gen_raise_exception_format2(dc, EXCP_TRACE, dc->pc_prev);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
-- 
2.34.1


