Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808C3DBBF5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:18:52 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UHj-0000UL-GX
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFg-0004lp-2x
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFd-0008TK-Dq
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j2so11731008wrx.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y4T9Q0phKt1q1Ay7Q+sG5xGKY/jcAnzqEkcBv03G2Xk=;
 b=c0Dg/rwBHtooBSiVbt8U7eThLZW94LxK2rYijWtW+QuMT9ILkPTDhJN4lTZqjSI3v/
 JnW/HLQ51vSKN9TQg05RHlF1fEg0l4ubICEAhBo8Nyt54gQdPXbfl7vdFjOhDOqiH4Nz
 Hx17qTQBFhwigGvFoV3tIn8CwoFZEjXa+I0gngOCZGxhF/f1nBVLvn/dMaUjDW7kyGQw
 yPDRb0l67D6DqD9zfGAPrbBmM2aVSwC4Y5kG5utwD25yCM5O7YoJmK2Vq+9bfk/qKuDu
 44QAHHgA6eA4eNUYp+CFVxrAD/eijTcVHmmEiO8SoaXN3lrmTWRiOd1s9+uL/QdwSXvF
 EuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4T9Q0phKt1q1Ay7Q+sG5xGKY/jcAnzqEkcBv03G2Xk=;
 b=QnR0lRIFS2C4YPn3cPl/qFqHZJfi7Kc6lu7f+i4uxY3q56yPh9uuoER6yfiPLWYAtW
 Mau3zOcZ90y12thZfOn89h5Q3cUcsAHi0+re5RXTQWy9DcwV2h8xHzCHH3KLXwGTSXbs
 uqej103h8fyuOKpnWqgvrQm3VjeBosOmKm/uQUhH5QwZ/XArQqR6pDzZs0GzjkIuqNjw
 PemCxsSL5nZgSW+G/0K3t8ZaHxRQhmqxW6VFfqro2qYlAkY1LcmT5+BO1oA8k5oQovUt
 jh/WVlUBfH/8LDRqaPpl03cYacvXHDJ2DzawJy5Sfq+6fvhET1ZyYrHqplZoTezZhvEp
 9jEw==
X-Gm-Message-State: AOAM530Mp2Mo8BpuHPb+sKUI91DhAssEeJMGijrjZ6CdSA9jnb6Gq63v
 6GL9/3onw+VTS1Lvf8T76Rkigg==
X-Google-Smtp-Source: ABdhPJxzQ4bVn7TZr5CXtgdkLCpDAf3LbNtwR5Yb3e/g0SQ8jTMzPQshbfXZd0ofLaYGeQuEUrOH0w==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr3581312wrq.173.1627658200076; 
 Fri, 30 Jul 2021 08:16:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Implement M-profile trapping on division by
 zero
Date: Fri, 30 Jul 2021 16:16:36 +0100
Message-Id: <20210730151636.17254-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730151636.17254-1-peter.maydell@linaro.org>
References: <20210730151636.17254-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 80c282669f0..28eabeb2323 100644
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


