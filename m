Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0D546A25
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:13:45 +0200 (CEST)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhGa-0008Es-Gq
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAx-0007Yq-Qu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007Eb-W3
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h5so37186654wrb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Dh4ahbAccO/WhNzbGu7MVvRhZkjydi4lVBcjQLLsTpw=;
 b=tbOndCDQFTdoMtcw1LYf60NDKNg3tCSNlh9VDplzNOyKvpHFkMwTcdMjQiT8evd4b0
 VMPj5ukCwYTD7mRbjStrmG4brznU9RHlp0MPk/VsHWmUp9UUgopcN1id3T8gSiTk7dd2
 QtRJI59HqWWmqoBeGacItBnJ7iJV8zwSVsu0ZWFYzqiAzXw6BSUsREUZg2iAwTw3VApt
 yaRQuqFlyyxafOE7j7Xs376H5NvN1dnE9WyD+lpWNmfgtmvh4r6xXgBDoGoys39+SVtc
 tNbtDSv7wOAJwWLAAHgP/de13MR4vDdz6Ly19zb/AjlEWfc1Q8iBjo7yAi3Rk2y2/ePK
 SKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dh4ahbAccO/WhNzbGu7MVvRhZkjydi4lVBcjQLLsTpw=;
 b=jARlk8Bli6OMhxdTq76usO1t85wTxI9Q4Lln1Dt7SlES/Wcmva3N8SRlT1v4+IY9WW
 Yk6l7H+HiN1LVET/Qn8ZbsZoqX+HTm4o9zh5QyOE7ZKQVic231R3UFwWWoYbRpGF40/C
 A8Za20hfeqO/y7j//z/bzt5H7orNLkmVpg35lU6QCNOHdJbdplEQxtMuXW8hNMBy8hH2
 e3qsSHzO8roESyldbx1ChtyDaLxacOxmYf15QufkiQ+1OWLHv4UQ/5dL3fa9psjVpQun
 JypjlPkKIDahLh35u9VZWh+nkWi2upsZWBW9X978fukmriVt9lp7yA2eNmJOUiRp5kHP
 TCmQ==
X-Gm-Message-State: AOAM532IChDfAIxVa9nwm775RG+7imUspAnE99BahaLD9GqWx6kCltkL
 QIZAv3DPiOPSxYAskQspgs9WMNRureTVDQ==
X-Google-Smtp-Source: ABdhPJyCS0pwq4wWxxwiBn3f/RlJAdf2bTsBQ4yhDNssWnjGvO9yLbZkuBjrDvGOU1se2ApjuKcrnw==
X-Received: by 2002:adf:fc07:0:b0:216:af8b:f9cd with SMTP id
 i7-20020adffc07000000b00216af8bf9cdmr32437390wrr.680.1654877272066; 
 Fri, 10 Jun 2022 09:07:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] target/arm: Introduce gen_exception_insn
Date: Fri, 10 Jun 2022 17:07:22 +0100
Message-Id: <20220610160738.2230762-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Create a new wrapper function that passes the default
exception target to gen_exception_insn_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h        |  1 +
 target/arm/translate-a64.c    | 15 ++++++---------
 target/arm/translate-m-nocp.c |  3 +--
 target/arm/translate-mve.c    |  3 +--
 target/arm/translate.c        | 29 +++++++++++++----------------
 5 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9ae76535ada..4575af6e1c9 100644
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
index 14bc80dba03..0581118f566 100644
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
index 636bfb1788a..4029d7fdd49 100644
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
index 5aec2a15555..0cf1b5ea4f5 100644
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
index 44f462a3a31..c7d422b5415 100644
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
2.25.1


