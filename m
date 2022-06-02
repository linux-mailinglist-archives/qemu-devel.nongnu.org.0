Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2FF53B154
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:47:06 +0200 (CEST)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZvV-0008EK-6S
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj6-0002UQ-Pm
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:17 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj4-0005Fh-NK
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i1so3277006plg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ni15K8P7PnzwsRRTsJwiOks83s+NNkxpUTsfrcqynEQ=;
 b=K+PpDcgXa4dWnYGJRfkVEMQyEofiEI6LkjjbDsD4RvJbZ8OqUcM3+mLPXHGwKceAmr
 sfAyb1OpetiUe1OPhIYemk/n/FI/NfL+18jv6Npt011tRSZiDO2mJrJ2JwFKsug3XDlO
 myJZlTZs76l/Avkxjug0oRwHt/dgo2bHi0U8qMjk4mslLrZjxsax273kNFMEn0AZcSsR
 xDrDBVIAHIW/DM94zerwZUSmrS/f8ptjY0wcAOhZsI57Fcobt+mz1ZvqTg/eAkAVz99y
 KBCj8k9Qo90Tbq1vJ0Jhyyaqznxp1pRMtzHfMoWO9RmCTwts7ei4h6krpuSpZ1QgBkXY
 qhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ni15K8P7PnzwsRRTsJwiOks83s+NNkxpUTsfrcqynEQ=;
 b=CHTYvCEsxsCJ73hNxf+25Bqtw9RQTf+5NFQHlUfcSpxokfE9SHzAHBhSJFE56bmNLb
 pZltBNvtN8Nf7T0/2CunimaJuYvVFxUj9GSkFXnmpO5gvvqDyU5MvS1a+yL0Gb1Z8ZFl
 gQKGK9T6Pav8tI2GZY3YJ5pGeYlcN8HE+FvkXon1EpkpoIFweJfKXPu1PUWeYOHSwyjt
 ysxQAWfnDTuj9ipRH9VHOW7w53o8lMNFcRafH4bvm5wnAV8AS9+Es4KHM/bqwksA2vws
 ysGBbExk3BjO2o5n0tGMmrWc8nAMA7z/+sPHk5JwYmXkaMKFPDNW2ALWaPicPFesPygs
 MuJw==
X-Gm-Message-State: AOAM533tZCMxvbFTCzAUkiYAPXPB5mr7Jlx9e+m5rtg2um419H73rshQ
 ghrVSJMJywlRWm4+IyeV2IDCdmlbqV1z1g==
X-Google-Smtp-Source: ABdhPJyL6NSga0i09VMyxeHYO52gXVPWTSnLpcYejTLJvaMjgctAnPUrT8uzhHYuj4UGMbS0Gvdoig==
X-Received: by 2002:a17:902:ec83:b0:161:ab37:7ad3 with SMTP id
 x3-20020a170902ec8300b00161ab377ad3mr2296347plg.114.1654133653372; 
 Wed, 01 Jun 2022 18:34:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 08/17] target/m68k: Fix address argument for EXCP_TRACE
Date: Wed,  1 Jun 2022 18:33:52 -0700
Message-Id: <20220602013401.303699-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Trace (and others) is
supposed to record the next insn in PC and the address
of the trapping instruction in ADDRESS.

Create gen_raise_exception_format2 to record the trapping
pc in env->mmu.ar.  Update m68k_interrupt_all to pass the
value to do_stack_frame.  Update cpu_loop to handle EXCP_TRACE.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c |  3 +++
 target/m68k/op_helper.c    |  2 +-
 target/m68k/translate.c    | 49 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 6598bce3c4..fcf9220552 100644
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


