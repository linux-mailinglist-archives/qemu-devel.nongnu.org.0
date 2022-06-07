Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2854053F41C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:53:20 +0200 (CEST)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPLK-0007jW-Vl
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFw-0006cP-GF
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFr-0000H8-N2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so6821404pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyyg44YF2Y/mmVGaXvfp7YJNYhSRY+k5gyUVMMceFu0=;
 b=YtLN5NL/SuUJYB+B2n5PsAKkkVF7Vj7pJifU2gWBKNFD6aXmnoj5RlPKj2GzWuKCwu
 JmRsCAYAz8yaLrPGkFzJrYSv1aI6g37xQRGkNkHD19YRQkjuov3fo2cBjIjyzViQu5+p
 9I7gnAFwsGEajNoRhG3qTiSVUwbE3+uCBe6TDmwWN+Mpv3a+aMusqru1lYBNsaoS3+j0
 odem/PFJvHxEXUI3MaLPHCoLxCax0J4W3ckc2Asth7elYJqK3j1O+Z72klk23rHpcqk/
 SZslsVtzJN0kWbD1tOnUyg5PWQE2it1/1PPAmXn9BdqktfAFE2+TvTK4x93U6JM/VwtU
 DRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyyg44YF2Y/mmVGaXvfp7YJNYhSRY+k5gyUVMMceFu0=;
 b=wLmtOhmVRYgUjYiRWB9Vp3gkOZOaVfmNqrttIP4w3Vfd3wJy/RBFduT9GD1u1905De
 9FCLUFMSgW/oTKhPw3xQfPWHa7/bigwCrKrwTNPKW9i1pUziGUQ72BxjV8XEPn5yvM7v
 vlue3m7CqucvmTxGAmsMCkJALhW2dxxElELFZw1sn4i/MbyoaEGjVTIK0fid0Q9+Rfyq
 DqYQcntcjKoK1MRkAuMNO3m0qv3lxU58ydvygCsFkD0s8PKXAHhFfIr5jXSmjJMLNU09
 hoqMxGQuig9+es2ZdUeehSTASptncbUG9Yi7oPMONOpo/oNNlMUFzW6arSxf2Nfx9eQs
 KOnw==
X-Gm-Message-State: AOAM531+yI4rvo94ggIcOXiMNYtBssFzj2Pchpm/INqCyo88EcJhCzau
 7BlbMGDZRru7ZALVKE5aVPNqn7ePXS1Kvw==
X-Google-Smtp-Source: ABdhPJzPI2mufyLkUn1dm2/KzKXdjCCXQctffuY82su91hqT9k4lc5ZjB2iDmzyMa7fPnrCc4/yruA==
X-Received: by 2002:a17:90b:4c4e:b0:1e3:368b:c09c with SMTP id
 np14-20020a17090b4c4e00b001e3368bc09cmr29414260pjb.140.1654570058279; 
 Mon, 06 Jun 2022 19:47:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 03/25] target/arm: Move fp access syndrome adjust out of
 raise_exception
Date: Mon,  6 Jun 2022 19:47:12 -0700
Message-Id: <20220607024734.541321-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Create helper_exception_advsimdfp_access to handle both
the routing and the syndrome contents, depending on the
eventual target EL and mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/translate.h     |  9 +++++++++
 target/arm/op_helper.c     | 32 +++++++++++++++++++++++---------
 target/arm/translate-a64.c |  5 ++---
 target/arm/translate-vfp.c |  4 +++-
 5 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73d..a13007699d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -46,6 +46,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9f0bb270c5..da5f89d49d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -337,6 +337,15 @@ static inline void gen_exception(int excp, uint32_t syndrome,
                                        tcg_constant_i32(target_el));
 }
 
+static inline void gen_exception_advsimdfp_access(DisasContext *s,
+                                                  uint32_t syndrome)
+{
+    gen_helper_exception_advsimdfp_access(cpu_env,
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(s->fp_excp_el));
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..67b7dbeaa9 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -34,16 +34,8 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     CPUState *cs = env_cpu(env);
 
     if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
-        /*
-         * Redirect NS EL1 exceptions to NS EL2. These are reported with
-         * their original syndrome register value, with the exception of
-         * SIMD/FP access traps, which are reported as uncategorized
-         * (see DDI0478C.a D1.10.4)
-         */
+        /* Redirect NS EL1 exceptions to NS EL2. */
         target_el = 2;
-        if (syn_get_ec(syndrome) == EC_ADVSIMDFPACCESSTRAP) {
-            syndrome = syn_uncategorized();
-        }
     }
 
     assert(!excp_is_internal(excp));
@@ -384,6 +376,28 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/* Raise an exception with EC_ADVSIMDFPACCESS. */
+void HELPER(exception_advsimdfp_access)(CPUARMState *env,
+                                        uint32_t syndrome, uint32_t target_el)
+{
+    if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
+        /*
+         * SIMD/FP access traps, when re-routed to EL2, are reported with
+         * uncategorized syndrome.  See DDI0487H.a rule RJNBTN.
+         */
+        target_el = 2;
+        syndrome = syn_uncategorized();
+    } else if (arm_el_is_aa64(env, target_el)) {
+        /*
+         * From AArch32, we will have filled in TA and/or COPROC for use
+         * by aa32 HSR.  But in aa64 ESR_ELx, the low 20 bits are RES0.
+         */
+        syndrome &= 0xfff00000;
+    }
+
+    raise_exception(env, EXCP_UDEF, syndrome, target_el);
+}
+
 /* Raise an EXCP_BKPT with the specified syndrome register value,
  * targeting the correct exception level for debug exceptions.
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 14b90a37ea..3251c69180 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1161,9 +1161,8 @@ static bool fp_access_check(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false, 0),
-                           s->fp_excp_el);
+        gen_a64_set_pc_im(s->pc_curr);
+        gen_exception_advsimdfp_access(s, syn_fp_access_trap(1, 0xe, false, 0));
         return false;
     }
     s->fp_access_checked = true;
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 0f797c56fd..2a98387411 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,9 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_set_condexec(s);
+        gen_set_pc_im(s, s->pc_curr);
+        gen_exception_advsimdfp_access(s, syn);
         return false;
     }
 
-- 
2.34.1


