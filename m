Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A35569D863
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGd-0001kM-9U; Mon, 20 Feb 2023 21:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGT-0001gV-1m
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:22 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGO-0008Gx-I7
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso2199710pjv.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IdlPIsbyU63QTH8OjgZ/6X4x7sICRqYPKrZtVtFUFwM=;
 b=ygWv7RorVIYKMA9vAgRqgfHF1CuoVxM5ImvinGKkYG05Ikj3G4mAjh265icXy1xG+9
 JjVlrx89q+gay5bseCkJeQrd3rZLK6nNIPkUSrksFGqkdGa+64qugLaJfsxettvri0M7
 I76pNXcSz9d0D4KFygLISkEYj+NtFlaxCWDl/75Ej5YJc8PgKBayB6H71FZwm5DiWW98
 7cDyQyBtqOwgmYULYCCVqNNZCU2r62VKEYDPZtwMGOdRJSyKSzswhDz3T35KawXL5w6C
 3NQ7NTNdgLct+EinNoriOj42M58gjd58hGg2J5OL6sexWzNOocTMWeWIrvkzbtOBc2BV
 h76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdlPIsbyU63QTH8OjgZ/6X4x7sICRqYPKrZtVtFUFwM=;
 b=LvjMGJiDsIMNL7wTP0ojwdPMh5kERjjZg8+4oEnRX8kkM/V6NkgF6LwrJAzRmhxvK3
 jHhfYnAHvnVfSAoAByS6hCdCI2V39xLACU9w8rtMpIofNXZdQq1EydPRtmZ/n6riUdIB
 ZYc6SRM/a7VXyH3zD4HBxCoyHMnlWLoqFpC2BiFV8jxAx1ksLFUV+tdFfFYcLjn/6d4c
 j6iYirDv+lmz+VrS2zcnWS3QmjeAtwOPbTweVJ08Z7Tt0ZglY3WPBIHc0tjdt5uxY3rd
 Lyb0s7Vz8A48Vf9bccg6yLavUnQU142gEwASXyIVfgFk9Z/dP43n8Nb/xhIQ3y+ND3XL
 lLYA==
X-Gm-Message-State: AO0yUKUNw8tT5E+Nr4XAzctdB5GeohMpMDgbXRwmFlbDeb9GsvQC82Ii
 L2YxIpC8M4nQMqjTZSRFigxSGA5WGf+G0TrApuc=
X-Google-Smtp-Source: AK7set8IclW5jgTb7DdHRpEfr9Qzu+3hqZ11QMgpBrFPU/9a+sETs1b6kct92tzBdIuQLCYZXaqX4g==
X-Received: by 2002:a17:903:2805:b0:196:5839:b36a with SMTP id
 kp5-20020a170903280500b001965839b36amr2925918plb.8.1676946014861; 
 Mon, 20 Feb 2023 18:20:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 13/14] target/arm: Export arm_v7m_get_sp_ptr
Date: Mon, 20 Feb 2023 16:19:50 -1000
Message-Id: <20230221021951.453601-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Reiss <dreiss@meta.com>

Allow the function to be used outside of m_helper.c.
Move to be outside of ifndef CONFIG_USER_ONLY block.
Rename from get_v7m_sp_ptr.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 10 +++++
 target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89052b1c94..523822ac87 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1342,6 +1342,16 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 /* Read the CONTROL register as the MRS instruction would. */
 uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
 
+/*
+ * Return a pointer to the location where we currently store the
+ * stack pointer for the requested security state and thread mode.
+ * This pointer will become invalid if the CPU state is updated
+ * such that the stack pointers are switched around (eg changing
+ * the SPSEL control bit).
+ */
+uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure,
+                             bool threadmode, bool spsel);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 03be79e7bf..081fc3f5f7 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -650,42 +650,6 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     arm_rebuild_hflags(env);
 }
 
-static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
-                                bool spsel)
-{
-    /*
-     * Return a pointer to the location where we currently store the
-     * stack pointer for the requested security state and thread mode.
-     * This pointer will become invalid if the CPU state is updated
-     * such that the stack pointers are switched around (eg changing
-     * the SPSEL control bit).
-     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
-     * Unlike that pseudocode, we require the caller to pass us in the
-     * SPSEL control bit value; this is because we also use this
-     * function in handling of pushing of the callee-saves registers
-     * part of the v8M stack frame (pseudocode PushCalleeStack()),
-     * and in the tailchain codepath the SPSEL bit comes from the exception
-     * return magic LR value from the previous exception. The pseudocode
-     * opencodes the stack-selection in PushCalleeStack(), but we prefer
-     * to make this utility function generic enough to do the job.
-     */
-    bool want_psp = threadmode && spsel;
-
-    if (secure == env->v7m.secure) {
-        if (want_psp == v7m_using_psp(env)) {
-            return &env->regs[13];
-        } else {
-            return &env->v7m.other_sp;
-        }
-    } else {
-        if (want_psp) {
-            return &env->v7m.other_ss_psp;
-        } else {
-            return &env->v7m.other_ss_msp;
-        }
-    }
-}
-
 static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
                                 uint32_t *pvec)
 {
@@ -810,8 +774,8 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
             !mode;
 
         mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv);
-        frame_sp_p = get_v7m_sp_ptr(env, M_REG_S, mode,
-                                    lr & R_V7M_EXCRET_SPSEL_MASK);
+        frame_sp_p = arm_v7m_get_sp_ptr(env, M_REG_S, mode,
+                                        lr & R_V7M_EXCRET_SPSEL_MASK);
         want_psp = mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
         if (want_psp) {
             limit = env->v7m.psplim[M_REG_S];
@@ -1656,10 +1620,8 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * use 'frame_sp_p' after we do something that makes it invalid.
          */
         bool spsel = env->v7m.control[return_to_secure] & R_V7M_CONTROL_SPSEL_MASK;
-        uint32_t *frame_sp_p = get_v7m_sp_ptr(env,
-                                              return_to_secure,
-                                              !return_to_handler,
-                                              spsel);
+        uint32_t *frame_sp_p = arm_v7m_get_sp_ptr(env, return_to_secure,
+                                                  !return_to_handler, spsel);
         uint32_t frameptr = *frame_sp_p;
         bool pop_ok = true;
         ARMMMUIdx mmu_idx;
@@ -1965,7 +1927,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
         threadmode = !arm_v7m_is_handler_mode(env);
         spsel = env->v7m.control[M_REG_S] & R_V7M_CONTROL_SPSEL_MASK;
 
-        frame_sp_p = get_v7m_sp_ptr(env, true, threadmode, spsel);
+        frame_sp_p = arm_v7m_get_sp_ptr(env, true, threadmode, spsel);
         frameptr = *frame_sp_p;
 
         /*
@@ -2900,3 +2862,39 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 }
 
 #endif /* !CONFIG_USER_ONLY */
+
+uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
+                             bool spsel)
+{
+    /*
+     * Return a pointer to the location where we currently store the
+     * stack pointer for the requested security state and thread mode.
+     * This pointer will become invalid if the CPU state is updated
+     * such that the stack pointers are switched around (eg changing
+     * the SPSEL control bit).
+     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
+     * Unlike that pseudocode, we require the caller to pass us in the
+     * SPSEL control bit value; this is because we also use this
+     * function in handling of pushing of the callee-saves registers
+     * part of the v8M stack frame (pseudocode PushCalleeStack()),
+     * and in the tailchain codepath the SPSEL bit comes from the exception
+     * return magic LR value from the previous exception. The pseudocode
+     * opencodes the stack-selection in PushCalleeStack(), but we prefer
+     * to make this utility function generic enough to do the job.
+     */
+    bool want_psp = threadmode && spsel;
+
+    if (secure == env->v7m.secure) {
+        if (want_psp == v7m_using_psp(env)) {
+            return &env->regs[13];
+        } else {
+            return &env->v7m.other_sp;
+        }
+    } else {
+        if (want_psp) {
+            return &env->v7m.other_ss_psp;
+        } else {
+            return &env->v7m.other_ss_msp;
+        }
+    }
+}
-- 
2.34.1


