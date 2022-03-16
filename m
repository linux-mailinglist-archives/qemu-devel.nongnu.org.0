Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9C4DAA55
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:07:33 +0100 (CET)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMom-0008JZ-PI
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgO-0002Nz-TC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:52 -0400
Received: from [2607:f8b0:4864:20::102c] (port=50912
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgN-0006SZ-1d
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id m22so1358915pja.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1h13UKbDPypwb9cnxJqx8cCdJ8LHRO45cgnV/TpINpM=;
 b=DkoRqTZ18L/6SYJwnUbjpNZO86TGTlfaE8HSAzbIPHr1guWvrpjVymKjetEHQwLFwC
 FuO2TK5lFPq5g0svSq5XOgmDBolA9uL1erTd6kXCrAI9KfhgGVuKrEDNHV6wPeGupR69
 J2wuvRFYdAEsl2jUGQ/GD8p8poK5t9rITOuEv1kTeH6jRkuA1FzI5rhUsVb+iNotCbEE
 aopBU4SlhZeLVV3i1/I3tF5N4qkN7mW1ARuCqZWkkypA4GRt/rHAuvLvMJMoqNTEGPWW
 g8wAUCBI2oexe7GgRl6eE/ec8KISFwliQuaT+wWqE8PwJ/vtYJ2m01x1H5RUGnx6Ca6a
 Zf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1h13UKbDPypwb9cnxJqx8cCdJ8LHRO45cgnV/TpINpM=;
 b=ejey+eMXJbXIxiTugt46bjNHpB6k+iGhkZ+eXQp2mkWa0kBMbDwFV8x8NVAoABiU76
 62ve2FmcoQwR5iCNLqXwO4IfEvA7H+MHPm1xlrqjaEKtFcCy9byb6DyiH7nLwhx5OA7Y
 4Zy7mEX4wsLXQIHgCcxF5di9ZRat/uvE3jIhsHQRWF3zJyXy7xcoDvOmpz9lpBMY1oI0
 671/turvcszyjGwNVjHwj+U2Iv2EKJbpilovo2trpGafICfihysTgf6Hu5P47bIv+RZo
 jrMykm1BXOshqp3PqiHkty9GbSH7cApZEGZy4nCJMPVZQsoqdGL7aigXkgD2kAbMU2oZ
 ot8Q==
X-Gm-Message-State: AOAM530k4EdKMRRl3VgRO0ArQJ8YYLY5NUFjRE/F36KiK/GTm/X/CTfp
 v9xJdsL06OWcj0QvsbEC+neEpXFwDeWENw==
X-Google-Smtp-Source: ABdhPJwgdMaPDZpYzALYeZJd3ZWoL421FXUmp3wR7C24iWVICXuwmv5XtB9j1EWyridPj07Md466Mw==
X-Received: by 2002:a17:903:40c7:b0:153:b0d:f8a0 with SMTP id
 t7-20020a17090340c700b001530b0df8a0mr31672847pld.156.1647410329692; 
 Tue, 15 Mar 2022 22:58:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/17] target/m68k: Fix address argument for EXCP_TRACE
Date: Tue, 15 Mar 2022 22:58:31 -0700
Message-Id: <20220316055840.727571-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index bb7ec09fb3..9b9aabccc6 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -54,6 +54,9 @@ void cpu_loop(CPUM68KState *env)
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
index 568292e037..4140f65422 100644
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
index ae9f5a5222..0bfc1a8ddf 100644
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
2.25.1


