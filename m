Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9C5F5FC6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:51:30 +0200 (CEST)
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHuz-0001hy-Oq
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiv-00035n-6f
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:39:01 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002ub-0x
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:39:00 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so3191674pjs.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qYcFHuExaC0pWN10zxNA5s8A2t2jmkUdLzZPnydMjJ0=;
 b=ui+ZRVVL4c2MiqZ2LMWh1PxUtEf06y6a/muegCyF4Q+8x8ZYrwul9B55WetRgjB6Ht
 FSV6BY3ZiQr7oiz2WDFMJFMc+KZUEtIaFkQGWW/20rQJrve2CG9p9KteYnKH3lPQtPVh
 tFlAMcV5PZKVBO3H+uOnh+Z3F1eVDaWWWg/RVTLnzqYHSpjuLpWYJc41tOyK45Z/Z8Ll
 pFJfxOGSwbL1/6Tpqzc5ezlwAOV9jn6l93SWrsWEYF1pwoqeKX6DLIcoS6vESI26y9XN
 uLwFGUFDzN9lEYIVpju2YGhpvUNsrvfkP+4H+W1yvni1jv/UxUYKTbQ/PDelZ7EQ5eE2
 8QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qYcFHuExaC0pWN10zxNA5s8A2t2jmkUdLzZPnydMjJ0=;
 b=LvaHzzxhSrDv+i+C3fMEQiK6S8lndBWhJDwt7g3+g3uB+WvlnZ84vcsKmMIvRSkWqe
 JDG/WdoKN3wK0PwFFminWVSZu1gtN+ft+fk/DQaO4KJ7mS57sGFCr+raZPMF7/l6KjcE
 euOUu/VnJI76cEFO6k9Z9uXxK10dULWOw9IaF8id7cQ8rGDeVwKv0v+818T/ZrnfUU9v
 J+1bRCCTsTGco2D0fsaYSvDVrqDvMs9mamDg2o0aTPAM7FaTiyUoffzQqvb3noXom4ZH
 CZRoR50PPCrnuax56r72jXAiD3zESoBUL1BMBDV4xtFV+RaEdEv7sus3Id5AwRysLf63
 yAhA==
X-Gm-Message-State: ACrzQf1IvT/ABaTMSkPFD3arfbq9eE7mFVcLaD5u+QkFU1lbZYLP8Kos
 s0Q94LWpib+fPow4BJ2wiUyaUNqI/7cNFw==
X-Google-Smtp-Source: AMsMyM78xQk4dkf37j7sZi+AnRe0A61v6MPh6vjdzKNUhjOvGsVYOI4K45RGygeU0DP5hBZK9Du4oQ==
X-Received: by 2002:a17:90b:1bc2:b0:200:a97b:4ae5 with SMTP id
 oa2-20020a17090b1bc200b00200a97b4ae5mr3056174pjb.147.1665027531469; 
 Wed, 05 Oct 2022 20:38:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 4/9] target/arm: Change gen_exception_insn* to work on
 displacements
Date: Wed,  5 Oct 2022 20:38:41 -0700
Message-Id: <20221006033846.1178422-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  5 +++--
 target/arm/translate-a64.c    | 28 ++++++++++-------------
 target/arm/translate-m-nocp.c |  6 ++---
 target/arm/translate-mve.c    |  2 +-
 target/arm/translate-vfp.c    |  6 ++---
 target/arm/translate.c        | 42 +++++++++++++++++------------------
 6 files changed, 43 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d651044855..4aa239e23c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,9 +281,10 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
+void gen_exception_insn(DisasContext *s, target_long pc_diff,
+                        int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 914c789187..2621b3b36a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1163,7 +1163,7 @@ static bool fp_access_check_only(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_fp_access_trap(1, 0xe, false, 0),
                               s->fp_excp_el);
         return false;
@@ -1178,7 +1178,7 @@ static bool fp_access_check(DisasContext *s)
         return false;
     }
     if (s->sme_trap_nonstreaming && s->is_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming, false));
         return false;
     }
@@ -1198,7 +1198,7 @@ bool sve_access_check(DisasContext *s)
             goto fail_exit;
         }
     } else if (s->sve_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
         goto fail_exit;
     }
@@ -1220,7 +1220,7 @@ bool sve_access_check(DisasContext *s)
 static bool sme_access_check(DisasContext *s)
 {
     if (s->sme_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_smetrap(SME_ET_AccessTrap, false),
                               s->sme_excp_el);
         return false;
@@ -1250,12 +1250,12 @@ bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
         return false;
     }
     if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_NotStreaming, false));
         return false;
     }
     if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_InactiveZA, false));
         return false;
     }
@@ -1915,7 +1915,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
+    gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2169,8 +2169,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
-                               syn_aa64_svc(imm16));
+            gen_exception_insn(s, 4, EXCP_SWI, syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -2183,8 +2182,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
-                                  syn_aa64_hvc(imm16), 2);
+            gen_exception_insn_el(s, 4, EXCP_HVC, syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -2194,8 +2192,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
-                                  syn_aa64_smc(imm16), 3);
+            gen_exception_insn_el(s, 4, EXCP_SMC, syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14833,7 +14830,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14864,8 +14861,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype));
+                gen_exception_insn(s, 0, EXCP_UDEF, syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 4029d7fdd4..694fae7e2e 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -143,7 +143,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
@@ -765,12 +765,12 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0cf1b5ea4f..db7ea3f603 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,7 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 070f465b17..5c5d58d2c6 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
@@ -240,7 +240,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
      * appear to be any insns which touch VFP which are allowed.
      */
     if (s->sme_trap_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
                                        curr_insn_len(s) == 2));
         return false;
@@ -272,7 +272,7 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
          * the encoding space handled by the patterns in m-nocp.decode,
          * and for them we may need to raise NOCP here.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return false;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 01b7536c7e..f9d3128656 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1103,32 +1103,34 @@ static void gen_exception(int excp, uint32_t syndrome)
                                        tcg_constant_i32(syndrome));
 }
 
-static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
-                                    uint32_t syn, TCGv_i32 tcg_el)
+static void gen_exception_insn_el_v(DisasContext *s, target_long pc_diff,
+                                    int excp, uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el)
 {
-    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+    gen_exception_insn_el_v(s, pc_diff, excp, syn,
+                            tcg_constant_i32(target_el));
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+void gen_exception_insn(DisasContext *s, target_long pc_diff,
+                        int excp, uint32_t syn)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1145,7 +1147,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2869,7 +2871,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+            gen_exception_insn_el_v(s, 0, EXCP_UDEF,
                                     syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
@@ -2895,7 +2897,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -5119,8 +5121,7 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_uncategorized(), 3);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
 
@@ -8502,7 +8503,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * Do the check-and-raise-exception by hand.
          */
         if (s->fp_excp_el) {
-            gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+            gen_exception_insn_el(s, 0, EXCP_NOCP,
                                   syn_uncategorized(), s->fp_excp_el);
             return true;
         }
@@ -8605,7 +8606,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9073,7 +9074,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9082,7 +9083,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9647,7 +9648,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(dc, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9720,8 +9721,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
-                           syn_uncategorized());
+        gen_exception_insn(dc, 0, EXCP_INVSTATE, syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1


