Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FDC59649E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:28:09 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO46Z-0000gu-U1
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HG-0005Ll-Uy
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:07 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HB-0004eS-JX
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:06 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso8177707otp.7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RRRZz0yfBzKJ1AXCYIskdo1GmhmX0vcEC/KRCrvx5Es=;
 b=Nb7xFtt0/uI3/mg4DtMwm/O+BIKZVZxdkkhdWQZb0fDCBdv2pHrqSuo3xrAzWaCcvk
 yV1n/GJ3rQ8mMGCMnbUFMdxHDPqV6b1dhw1gx61JYFlYl+zF+e0iPGni5Ypotls3Wb33
 +Be/HPNQEeICyC91zeGKZU2lRSAm1Quiq3FsuVMelk7Z41JmozO6L2JrAtvyQmCX9ddO
 X7Uz9gmC2zVkqcW/bUc85BGubUKUcL1Ce2V/XR0i7hvR+XeNKf3mbTsKbezXwm10AU4D
 /aktESZtYTgGjeARx4pVOQO5dZDvhJZfQ400COThfkU5jGGxJQOzyREO1QRxKkLKHrMj
 yGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RRRZz0yfBzKJ1AXCYIskdo1GmhmX0vcEC/KRCrvx5Es=;
 b=ahVMNxrDRuqqBDpnV0Rw5HxDbWrvSs+531bWgqcZ2OIv856ZY7I9VLxgIJtkSo47Om
 T5F3X8DDfF+xQPQ7BYlXa1pLwtVgw/89dOkGpO6wIedcn65NWwuZVntH2rVEYUquIzva
 Hu3ONcTHOgZF3ZRjrVD2/P3JR9NCz/QUGdRKcyKBEQbztrWga4grlkgY543WkA4zYdMA
 YdQtlZohBaaydyyEpUOsPHv3WrpvzzRjtJHLkmTzYfFb+kwTLq2IghK+FNxBRTlclyi1
 w75qJDjevrLvmYUCepA5tRISgLWRcEjlwBdw9wBzz0xCMqOIHnmYEBi8V1iX3RTSa7Rk
 36+Q==
X-Gm-Message-State: ACgBeo1/dNQYSsEF3cZ1hlRLb3jOtYdE8ukh908LAtUCGI91k1465xtp
 6RxnDhHdZRrWFGpp6jP1kL09KcYdHcVvVw==
X-Google-Smtp-Source: AA6agR4gk+McX5vYcCrYD7YYlI0XCuLlu+msh3qCLmuVsKCK3F6mURKN8Xd1OUNoatUHkfd1Qz9v7w==
X-Received: by 2002:a9d:5f16:0:b0:628:192c:dff1 with SMTP id
 f22-20020a9d5f16000000b00628192cdff1mr7863142oti.126.1660682100503; 
 Tue, 16 Aug 2022 13:35:00 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 27/33] target/arm: Change gen_*set_pc_im to gen_*update_pc
Date: Tue, 16 Aug 2022 15:33:54 -0500
Message-Id: <20220816203400.161187-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on
absolute values by passing in pc difference.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h |  2 +-
 target/arm/translate.h     |  6 ++--
 target/arm/translate-a64.c | 32 +++++++++---------
 target/arm/translate-vfp.c |  2 +-
 target/arm/translate.c     | 68 ++++++++++++++++++++------------------
 5 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 78a84c1414..09c8f467aa 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -40,7 +40,7 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
 TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs);
 void gen_set_cpsr(TCGv_i32 var, uint32_t mask);
 void gen_set_condexec(DisasContext *s);
-void gen_set_pc_im(DisasContext *s, target_ulong val);
+void gen_update_pc(DisasContext *s, int diff);
 void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 90bf7c57fc..33b94a18bb 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -254,7 +254,7 @@ static inline int curr_insn_len(DisasContext *s)
  * For instructions which want an immediate exit to the main loop, as opposed
  * to attempting to use lookup_and_goto_ptr.  Unlike DISAS_UPDATE_EXIT, this
  * doesn't write the PC on exiting the translation loop so you need to ensure
- * something (gen_a64_set_pc_im or runtime helper) has done so before we reach
+ * something (gen_a64_update_pc or runtime helper) has done so before we reach
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
@@ -263,14 +263,14 @@ static inline int curr_insn_len(DisasContext *s)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_a64_set_pc_im(uint64_t val);
+void gen_a64_update_pc(DisasContext *s, int diff);
 extern const TranslatorOps aarch64_translator_ops;
 #else
 static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_a64_set_pc_im(uint64_t val)
+static inline void gen_a64_update_pc(DisasContext *s, int diff)
 {
 }
 #endif
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 695ccd0723..90f31b1dff 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,9 @@ static void reset_btype(DisasContext *s)
     }
 }
 
-void gen_a64_set_pc_im(uint64_t val)
+void gen_a64_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i64(cpu_pc, val);
+    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
 }
 
 /*
@@ -342,14 +342,14 @@ static void gen_exception_internal(int excp)
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 {
-    gen_a64_set_pc_im(pc);
+    gen_a64_update_pc(s, pc - s->pc_curr);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    gen_a64_set_pc_im(s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -384,11 +384,11 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
-        gen_a64_set_pc_im(dest);
+        gen_a64_update_pc(s, diff);
         tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        gen_a64_set_pc_im(dest);
+        gen_a64_update_pc(s, diff);
         if (s->ss_active) {
             gen_step_complete_exception(s);
         } else {
@@ -1960,7 +1960,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         uint32_t syndrome;
 
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
-        gen_a64_set_pc_im(s->pc_curr);
+        gen_a64_update_pc(s, 0);
         gen_helper_access_check_cp_reg(cpu_env,
                                        tcg_constant_ptr(ri),
                                        tcg_constant_i32(syndrome),
@@ -1970,7 +1970,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * The readfn or writefn might raise an exception;
          * synchronize the CPU state in case it does.
          */
-        gen_a64_set_pc_im(s->pc_curr);
+        gen_a64_update_pc(s, 0);
     }
 
     /* Handle special cases first */
@@ -2180,7 +2180,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             /* The pre HVC helper handles cases when HVC gets trapped
              * as an undefined insn by runtime configuration.
              */
-            gen_a64_set_pc_im(s->pc_curr);
+            gen_a64_update_pc(s, 0);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
             gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
@@ -2191,7 +2191,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 break;
             }
-            gen_a64_set_pc_im(s->pc_curr);
+            gen_a64_update_pc(s, 0);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
@@ -14954,7 +14954,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          */
         switch (dc->base.is_jmp) {
         default:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         case DISAS_EXIT:
         case DISAS_JUMP:
@@ -14971,13 +14971,13 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         default:
         case DISAS_UPDATE_EXIT:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_UPDATE_NOCHAIN:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
@@ -14986,11 +14986,11 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_SWI:
             break;
         case DISAS_WFE:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             gen_helper_wfe(cpu_env);
             break;
         case DISAS_YIELD:
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
@@ -14998,7 +14998,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
              * This is a special case because we don't want to just halt
              * the CPU if trying to debug across a WFI.
              */
-            gen_a64_set_pc_im(dc->base.pc_next);
+            gen_a64_update_pc(dc, curr_insn_len(dc));
             gen_helper_wfi(cpu_env, tcg_constant_i32(4));
             /*
              * The helper doesn't necessarily throw an exception, but we
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 94cc1e4b77..070f465b17 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -856,7 +856,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSID:
             if (s->current_el == 1) {
                 gen_set_condexec(s);
-                gen_set_pc_im(s, s->pc_curr);
+                gen_update_pc(s, 0);
                 gen_helper_check_hcr_el2_trap(cpu_env,
                                               tcg_constant_i32(a->rt),
                                               tcg_constant_i32(a->reg));
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2b9a58b442..92c52edb7b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -772,9 +772,9 @@ void gen_set_condexec(DisasContext *s)
     }
 }
 
-void gen_set_pc_im(DisasContext *s, target_ulong val)
+void gen_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i32(cpu_R[15], val);
+    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -866,7 +866,7 @@ static inline void gen_bxns(DisasContext *s, int rm)
 
     /* The bxns helper may raise an EXCEPTION_EXIT exception, so in theory
      * we need to sync state before calling it, but:
-     *  - we don't need to do gen_set_pc_im() because the bxns helper will
+     *  - we don't need to do gen_update_pc() because the bxns helper will
      *    always set the PC itself
      *  - we don't need to do gen_set_condexec() because BXNS is UNPREDICTABLE
      *    unless it's outside an IT block or the last insn in an IT block,
@@ -887,7 +887,7 @@ static inline void gen_blxns(DisasContext *s, int rm)
      * We do however need to set the PC, because the blxns helper reads it.
      * The blxns helper may throw an exception.
      */
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     gen_helper_v7m_blxns(cpu_env, var);
     tcg_temp_free_i32(var);
     s->base.is_jmp = DISAS_EXIT;
@@ -1055,7 +1055,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * as an undefined insn by runtime configuration (ie before
      * the insn really executes).
      */
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_pre_hvc(cpu_env);
     /* Otherwise we will treat this as a real exception which
      * happens after execution of the insn. (The distinction matters
@@ -1063,7 +1063,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * for single stepping.)
      */
     s->svc_imm = imm16;
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_HVC;
 }
 
@@ -1072,16 +1072,16 @@ static inline void gen_smc(DisasContext *s)
     /* As with HVC, we may take an exception either before or after
      * the insn executes.
      */
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa32_smc()));
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_SMC;
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, pc);
+    gen_update_pc(s, pc - s->pc_curr);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1107,10 +1107,10 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
-        gen_a64_set_pc_im(pc);
+        gen_a64_update_pc(s, pc - s->pc_curr);
     } else {
         gen_set_condexec(s);
-        gen_set_pc_im(s, pc);
+        gen_update_pc(s, pc - s->pc_curr);
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1125,10 +1125,10 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
     if (s->aarch64) {
-        gen_a64_set_pc_im(pc);
+        gen_a64_update_pc(s, pc - s->pc_curr);
     } else {
         gen_set_condexec(s);
-        gen_set_pc_im(s, pc);
+        gen_update_pc(s, pc - s->pc_curr);
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1137,7 +1137,7 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syn));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2603,10 +2603,10 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 
     if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         tcg_gen_exit_tb(s->base.tb, n);
     } else {
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         gen_goto_ptr();
     }
     s->base.is_jmp = DISAS_NORETURN;
@@ -2615,9 +2615,11 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
 {
+    int diff = dest - s->pc_curr;
+
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         s->base.is_jmp = DISAS_JUMP;
         return;
     }
@@ -2634,7 +2636,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest - s->pc_curr);
+        gen_goto_tb(s, tbno, diff);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -2643,7 +2645,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          * Avoid using goto_tb so we really do exit back to the main loop
          * and don't chain to another TB.
          */
-        gen_set_pc_im(s, dest);
+        gen_update_pc(s, diff);
         gen_goto_ptr();
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -2911,7 +2913,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because msr_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     tcg_reg = load_reg(s, rn);
     gen_helper_msr_banked(cpu_env, tcg_reg,
                           tcg_constant_i32(tgtmode),
@@ -2931,7 +2933,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because mrs_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     tcg_reg = tcg_temp_new_i32();
     gen_helper_mrs_banked(tcg_reg, cpu_env,
                           tcg_constant_i32(tgtmode),
@@ -4752,7 +4754,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             }
 
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc_curr);
+            gen_update_pc(s, 0);
             gen_helper_access_check_cp_reg(cpu_env,
                                            tcg_constant_ptr(ri),
                                            tcg_constant_i32(syndrome),
@@ -4763,7 +4765,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * synchronize the CPU state in case it does.
              */
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc_curr);
+            gen_update_pc(s, 0);
         }
 
         /* Handle special cases first */
@@ -4777,7 +4779,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 unallocated_encoding(s);
                 return;
             }
-            gen_set_pc_im(s, s->base.pc_next);
+            gen_update_pc(s, curr_insn_len(s));
             s->base.is_jmp = DISAS_WFI;
             return;
         default:
@@ -5164,7 +5166,7 @@ static void gen_srs(DisasContext *s,
     addr = tcg_temp_new_i32();
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
+    gen_update_pc(s, 0);
     gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
@@ -6233,7 +6235,7 @@ static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
      * scheduling of other vCPUs.
      */
     if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->base.is_jmp = DISAS_YIELD;
     }
     return true;
@@ -6249,7 +6251,7 @@ static bool trans_WFE(DisasContext *s, arg_WFE *a)
      * implemented so we can't sleep like WFI does.
      */
     if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->base.is_jmp = DISAS_WFE;
     }
     return true;
@@ -6258,7 +6260,7 @@ static bool trans_WFE(DisasContext *s, arg_WFE *a)
 static bool trans_WFI(DisasContext *s, arg_WFI *a)
 {
     /* For WFI, halt the vCPU until an IRQ. */
-    gen_set_pc_im(s, s->base.pc_next);
+    gen_update_pc(s, curr_insn_len(s));
     s->base.is_jmp = DISAS_WFI;
     return true;
 }
@@ -8773,7 +8775,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
-        gen_set_pc_im(s, s->base.pc_next);
+        gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
         s->base.is_jmp = DISAS_SWI;
     }
@@ -9787,7 +9789,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
         case DISAS_UPDATE_NOCHAIN:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         default:
             /* FIXME: Single stepping a WFI insn will not halt the CPU. */
@@ -9811,13 +9813,13 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
         case DISAS_UPDATE_EXIT:
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             /* fall through */
         default:
             /* indicate that the hash table must be used to find the next TB */
@@ -9857,7 +9859,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
-            gen_set_pc_im(dc, dc->base.pc_next);
+            gen_update_pc(dc, curr_insn_len(dc));
             gen_singlestep_exception(dc);
         } else {
             gen_goto_tb(dc, 1, curr_insn_len(dc));
-- 
2.34.1


