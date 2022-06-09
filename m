Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605D545605
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:53:15 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzP9V-000244-NE
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmO-0003y3-4X
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmI-0008QY-BP
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e24so22355680pjt.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MAUNs6V4mRPp9A90sOBEHx7YdKEYigB5XZ+QV7oJR0=;
 b=dLa6MlYhZeV6cRwT7o9InFiViK/vfkYlHjeoV+RxGDsrW13IFLgNBbVEVV6FM4m9Z4
 jQxwpVwwY3XtN2FvBrIyOpdMwtIuojJtPZFzXr7q+7oFOqcPR/VeH7wU8iT/XBd6K9ZC
 +MFlr9hzThkg8ZyCkdEpr9DXuD3DAXhszH9NFSjn3Atwrdu+YaEzOJStQdhuKLq8QGc0
 sYpDXLxZttmg86uVBlzrfud3w+99d9okQq3z12UNrxuEOTeQQDDEvBmfULOIsMts8l5O
 oB7Z/MGRqHp582OyaggHZA2FORdT6QdMLEzydN2bxKVl05wFA+UYN2CfnYA3BLs8eAsh
 lskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MAUNs6V4mRPp9A90sOBEHx7YdKEYigB5XZ+QV7oJR0=;
 b=5YgHwW4uKYibhpzs/UkELEPSo3HtKoxauSEhtyiEOpT2SDTS/lN1A5TedsQWKKZIJ8
 SkhC+vqsvgoPxguiwt8R2CShih2XB/VwPPpEoGJUh3CTMR2lI+K7SRsXJ5v/khcU8fjE
 SWbvvCr6340teNyIyVr5TwblHIuL1ab1iO7EAXV34rbJDDCjKMZ8HuEOvms9bBKVbXqf
 VxZc4IWOrxLi0JBfmIcIEhZ5UiSAYJYtpZCiRbbQdGOBivogEuuzBx410XH0siBBVonS
 NyETbxUAq5mPTohTwDRu4M/YVGTmLiKCiIyD65f89wHwhDIHx1QvqiP9s3C0si0ZoVP2
 B2XQ==
X-Gm-Message-State: AOAM531aq45FP2EPQDdOQX89FFQ8BhTQf7I2raMgdt2eLsHUXds7i8dd
 amQMtzJyFo0vza2RNT+0DLzLfT2ZcnG91w==
X-Google-Smtp-Source: ABdhPJx+afm2KENFvHWU0Wqvj9thS9L40bKs9j18AKkgKRmzOucNHvl5PwX/LHCIdj1FHMB/7+0Crw==
X-Received: by 2002:a17:90b:3907:b0:1e8:57f9:dadb with SMTP id
 ob7-20020a17090b390700b001e857f9dadbmr5023014pjb.137.1654806552237; 
 Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/23] target/arm: Rename gen_exception_insn to
 gen_exception_insn_el
Date: Thu,  9 Jun 2022 13:28:49 -0700
Message-Id: <20220609202901.1177572-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  4 ++--
 target/arm/translate-a64.c    | 36 ++++++++++++++++----------------
 target/arm/translate-m-nocp.c | 16 +++++++-------
 target/arm/translate-mve.c    |  4 ++--
 target/arm/translate-vfp.c    |  6 +++---
 target/arm/translate.c        | 39 ++++++++++++++++++-----------------
 6 files changed, 53 insertions(+), 52 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c57830126b..9ae76535ad 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -279,8 +279,8 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el);
+void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+                           uint32_t syn, uint32_t target_el);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e752589090..14bc80dba0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1161,9 +1161,9 @@ static bool fp_access_check(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false, 0),
-                           s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_fp_access_trap(1, 0xe, false, 0),
+                              s->fp_excp_el);
         return false;
     }
     s->fp_access_checked = true;
@@ -1179,8 +1179,8 @@ bool sve_access_check(DisasContext *s)
         assert(!s->sve_access_checked);
         s->sve_access_checked = true;
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_sve_access_trap(), s->sve_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_sve_access_trap(), s->sve_excp_el);
         return false;
     }
     s->sve_access_checked = true;
@@ -1816,8 +1816,8 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome,
-                       default_exception_el(s));
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syndrome,
+                          default_exception_el(s));
 }
 
 /* MRS - move from system register
@@ -2069,8 +2069,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
-                               syn_aa64_svc(imm16), default_exception_el(s));
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_SWI,
+                                  syn_aa64_svc(imm16), default_exception_el(s));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -2083,8 +2083,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_HVC,
-                               syn_aa64_hvc(imm16), 2);
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
+                                  syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -2094,8 +2094,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
-                               syn_aa64_smc(imm16), 3);
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
+                                  syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14725,8 +14725,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(s));
         return;
     }
 
@@ -14757,9 +14757,9 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype),
-                                   default_exception_el(s));
+                gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                                      syn_btitrap(s->btype),
+                                      default_exception_el(s));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 27363a7b4e..636bfb1788 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -143,8 +143,8 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return true;
     }
 
@@ -376,7 +376,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
+             * gen_exception_insn_el()'s default to DISAS_NORETURN
              */
             s->base.is_jmp = DISAS_NEXT;
             break;
@@ -532,7 +532,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
+             * gen_exception_insn_el()'s default to DISAS_NORETURN
              */
             s->base.is_jmp = DISAS_NEXT;
             break;
@@ -765,14 +765,14 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), default_exception_el(s));
         return true;
     }
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return true;
     }
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4267d43cc7..5aec2a1555 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,8 +100,8 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         return false;
     }
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 0f797c56fd..82fdbcae53 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
@@ -260,8 +260,8 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
          * the encoding space handled by the patterns in m-nocp.decode,
          * and for them we may need to raise NOCP here.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9cb31663dd..44f462a3a3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1100,8 +1100,8 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el)
+void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+                           uint32_t syn, uint32_t target_el)
 {
     gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
 }
@@ -1117,8 +1117,8 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
+                          default_exception_el(s));
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2869,8 +2869,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                       syn_uncategorized(), exc_target);
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                          syn_uncategorized(), exc_target);
     return false;
 }
 
@@ -5094,7 +5094,8 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(), 3);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_uncategorized(), 3);
         return;
     }
 
@@ -8479,8 +8480,8 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * Do the check-and-raise-exception by hand.
          */
         if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
+            gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                                  syn_uncategorized(), s->fp_excp_el);
             return true;
         }
     }
@@ -8582,8 +8583,8 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         gen_set_label(skipexc);
     }
 
@@ -9053,8 +9054,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         return;
     }
 
@@ -9063,8 +9064,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(s));
         return;
     }
 
@@ -9633,8 +9634,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(dc));
+        gen_exception_insn_el(dc, dc->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(dc));
         return;
     }
 
@@ -9707,8 +9708,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(dc));
+        gen_exception_insn_el(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(dc));
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1


