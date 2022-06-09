Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D054560E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:58:35 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPEe-0000tR-SF
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0003v2-49
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmH-0008Pt-VZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:18 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so22038910pfh.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBq9cvT3mNZnwBfSHCh8l7KhDANOXMY80ZzRcK7glgg=;
 b=RnxSB7KiSM+3qgtygFaek4KN9uWfeehJtibSdVBd2kUSANq1xup4UTo3iqDtbpNlIE
 TzEUz83FooTGNSHC+jWZbZX34JvjhhObodK1frI8lu7v2+PyOyJ2QTT3E6eiP6DtLX+W
 q+mKglYfv/JOeVK6dvTPEkAGFoC1Fc/AXd5MZkJs7f3LBZ/c6yTSOTNUwSQPTclp+kO/
 JyavuVGI3txUZ7AZ3rCU3i6ITYNN3G4tvSr0deuVjRyvvq51irwVCd/jopmNAe6WCFSV
 X6ZHtd+1BdBQV0BVnegYIuVWW72n4X5xOFjp3zbRJObxBEXkUc2RjpyWYpXvb8sVkbQy
 dQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBq9cvT3mNZnwBfSHCh8l7KhDANOXMY80ZzRcK7glgg=;
 b=5i9zA5k0WsuCVHwCPk6GmfF+X7xaijsXl23o9mR/PF42hz8KNwpohRf6MkUSZPS3ZL
 Bq0T0HOuyRR1JS8kneTwyerTKu4HnS2mu4MfK2SMB7GL0iPLysA4I2S2rC3xk4ie1m9i
 5JmO+/IhjPr6TT2NKNSHcYTUGwxVN+lKxwYd1lv+KaPPecQxyVKCiNpYEN/ewQKBag5H
 PYR9iAEE22cMAYyyIMsY8MgOk5kxU1kABBID6jkElKd6+x2f/aecpFnXx5umtroJZ29z
 7ZGvAOEAc0uafqC7skb+yeoCI210iCIg04UEHYfqvgamm+L8n22OMlBlWv+2QSlPaVwJ
 RoYA==
X-Gm-Message-State: AOAM532JRLicKHKkeZsT8JvJEozmi+jTawsvSWks71LM4W+mQYj2bUUi
 uy7Y6JZZJW+sCP40DWKvIEzyWwdZ1AkQSg==
X-Google-Smtp-Source: ABdhPJzRKmsU/nP5ZWlwNdQWEG/xU6spOqlJTUizifp9fiCtEJLuxakSDFHEU14YsUFbaI1RyDMN+g==
X-Received: by 2002:a63:8b4b:0:b0:3fc:ea73:db40 with SMTP id
 j72-20020a638b4b000000b003fcea73db40mr33788087pge.399.1654806553140; 
 Thu, 09 Jun 2022 13:29:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/23] target/arm: Introduce gen_exception_insn
Date: Thu,  9 Jun 2022 13:28:50 -0700
Message-Id: <20220609202901.1177572-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Create a new wrapper function that passes the default
exception target to gen_exception_insn_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  1 +
 target/arm/translate-a64.c    | 15 ++++++---------
 target/arm/translate-m-nocp.c |  3 +--
 target/arm/translate-mve.c    |  3 +--
 target/arm/translate.c        | 29 +++++++++++++----------------
 5 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9ae76535ad..4575af6e1c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,6 +281,7 @@ MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
 void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
                            uint32_t syn, uint32_t target_el);
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 14bc80dba0..0581118f56 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1816,8 +1816,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syndrome,
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2069,8 +2068,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SWI,
-                                  syn_aa64_svc(imm16), default_exception_el(s));
+            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
+                               syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -14725,8 +14724,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14757,9 +14755,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                                      syn_btitrap(s->btype),
-                                      default_exception_el(s));
+                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                                   syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 636bfb1788..4029d7fdd4 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -765,8 +765,7 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
-                              syn_uncategorized(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5aec2a1555..0cf1b5ea4f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,8 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 44f462a3a3..c7d422b541 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1106,6 +1106,11 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
     gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+{
+    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1117,8 +1122,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2731,8 +2735,6 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
      * an exception and return false. Otherwise it will return true,
      * and set *tgtmode and *regno appropriately.
      */
-    int exc_target = default_exception_el(s);
-
     /* These instructions are present only in ARMv8, or in ARMv7 with the
      * Virtualization Extensions.
      */
@@ -2869,8 +2871,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                          syn_uncategorized(), exc_target);
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -8583,8 +8584,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9054,8 +9054,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9064,8 +9063,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9634,8 +9632,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9708,8 +9705,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
+                           syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1


