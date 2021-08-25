Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB523F73EC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:00:10 +0200 (CEST)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqdd-00055W-Rv
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGU-0004mK-2q
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGP-0005dk-6B
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f5so35619930wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DkSKucbRVfZaukjnVODkmhOBvmBFYtKFjtgssow2x4M=;
 b=grIijKxBBCp71b61W9eHjT+WKK6suKIsXOcswYxPn9CTAaujW9N1uOmnrKMUv+MQHe
 Gp7M1YpylbN8GNBZjibR3IqxdBZjfAgflMGkA5i5nJaU5v5h6UiM6a4mCXkCqhqXx2sB
 x3D8p4SYBf+Q5Inyr4HcEyeXGlBPWg6in1kbr3VMsLOaj/J+npZjSgiOa1UCNhhcMvYI
 WKuWW9dZsdTsANeXmcsOJzf+t/Ob1GTblZXvQaknv8q0K0FV6ir4BMLtyECGO+COEJBa
 0DrBpc2wmYdWxonaz/8Z72psQTvXYPEj9jkilT088Colvuqka99u4pcvm/5DGH4dehNV
 nOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DkSKucbRVfZaukjnVODkmhOBvmBFYtKFjtgssow2x4M=;
 b=K+vtiIheuU8IbVe1UkswjXad452geLeDI7EJjwkMF+n52/k+0+LuS5ac3+yyg/r7Og
 g8UcxaOzBlNxSMERO5uGgH1Tdq2NV/N5EDydtN8JGGI6zUZPZ1/0p22AYfyOu4/GqbAb
 FQTvnVlNu/q/ciOSmNVCD1KQU+8AxW0O1K3rvr34CtOw5BMslv3B77CT060GJ/QSh3J9
 A+umTN/T9UhKv9azHrmdlCPPog7lcHHebTbMBbVAuNtPC3t6yN0u2LW28DjtqlXeTqpi
 PpsXkTSvh0Id5CFpNN/FB7uTTfVqsZnnpHLTCROfjxxOzAxnE+it1r0uyTs5HZTSLvmd
 puiw==
X-Gm-Message-State: AOAM530ZV7RTRo7l2ZWX9SnNEInTPVND7wcWroK6QbXV+HBNFfq44KUF
 Q7gThpRrm539lQ20W8hkO4RrgxAEmrkk6w==
X-Google-Smtp-Source: ABdhPJzOX0yzdGRJ8EWPvC2CsvXDQW0S+RtiBLQgmR86YD9zvaeFVfclXMtxcWT/2EUVHLwDSKViBA==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr14866454wri.227.1629887767922; 
 Wed, 25 Aug 2021 03:36:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/44] target/arm: Implement M-profile trapping on division by
 zero
Date: Wed, 25 Aug 2021 11:35:27 +0100
Message-Id: <20210825103534.6936-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Unlike A-profile, for M-profile the UDIV and SDIV insns can be
configured to raise an exception on division by zero, using the CCR
DIV_0_TRP bit.

Implement support for setting this bit by making the helper functions
raise the appropriate exception.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730151636.17254-3-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  4 ++--
 target/arm/helper.c    | 19 +++++++++++++++++--
 target/arm/m_helper.c  |  4 ++++
 target/arm/translate.c |  4 ++--
 5 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d50..5cf8996ae3c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -54,6 +54,7 @@
 #define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
+#define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 248569b0cd8..aee8f0019b4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -6,8 +6,8 @@ DEF_HELPER_3(add_saturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_saturate, i32, env, i32, i32)
 DEF_HELPER_3(add_usaturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_usaturate, i32, env, i32, i32)
-DEF_HELPER_FLAGS_2(sdiv, TCG_CALL_NO_RWG_SE, s32, s32, s32)
-DEF_HELPER_FLAGS_2(udiv, TCG_CALL_NO_RWG_SE, i32, i32, i32)
+DEF_HELPER_FLAGS_3(sdiv, TCG_CALL_NO_RWG, s32, env, s32, s32)
+DEF_HELPER_FLAGS_3(udiv, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_1(rbit, TCG_CALL_NO_RWG_SE, i32, i32)
 
 #define PAS_OP(pfx)  \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e9c2a2cf8c..56c520cf8e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9345,6 +9345,18 @@ uint32_t HELPER(sxtb16)(uint32_t x)
     return res;
 }
 
+static void handle_possible_div0_trap(CPUARMState *env, uintptr_t ra)
+{
+    /*
+     * Take a division-by-zero exception if necessary; otherwise return
+     * to get the usual non-trapping division behaviour (result of 0)
+     */
+    if (arm_feature(env, ARM_FEATURE_M)
+        && (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_DIV_0_TRP_MASK)) {
+        raise_exception_ra(env, EXCP_DIVBYZERO, 0, 1, ra);
+    }
+}
+
 uint32_t HELPER(uxtb16)(uint32_t x)
 {
     uint32_t res;
@@ -9353,9 +9365,10 @@ uint32_t HELPER(uxtb16)(uint32_t x)
     return res;
 }
 
-int32_t HELPER(sdiv)(int32_t num, int32_t den)
+int32_t HELPER(sdiv)(CPUARMState *env, int32_t num, int32_t den)
 {
     if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
         return 0;
     }
     if (num == INT_MIN && den == -1) {
@@ -9364,9 +9377,10 @@ int32_t HELPER(sdiv)(int32_t num, int32_t den)
     return num / den;
 }
 
-uint32_t HELPER(udiv)(uint32_t num, uint32_t den)
+uint32_t HELPER(udiv)(CPUARMState *env, uint32_t num, uint32_t den)
 {
     if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
         return 0;
     }
     return num / den;
@@ -9567,6 +9581,7 @@ void arm_log_exception(int idx)
             [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+            [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 20761c94877..47903b3dc35 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2252,6 +2252,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
         break;
+    case EXCP_DIVBYZERO:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_DIVBYZERO_MASK;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.secure);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 804a53279bd..115aa768b6a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7992,9 +7992,9 @@ static bool op_div(DisasContext *s, arg_rrr *a, bool u)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (u) {
-        gen_helper_udiv(t1, t1, t2);
+        gen_helper_udiv(t1, cpu_env, t1, t2);
     } else {
-        gen_helper_sdiv(t1, t1, t2);
+        gen_helper_sdiv(t1, cpu_env, t1, t2);
     }
     tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
-- 
2.20.1


