Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E560696980
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD7-0006mx-PK; Tue, 14 Feb 2023 11:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD5-0006jC-20
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:15 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD3-0002D2-6U
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:14 -0500
Received: by mail-pg1-x535.google.com with SMTP id u75so10562115pgc.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVeEC1XgZv+0JDQi5rIgvqYs5+9oYvw4P4dYcheYUZc=;
 b=wNJcnkVeCLUUWJubZMojCT5vM33rZUwaNBdOfrZByqXZVgjWShKPi3ZIl/U9tr1cfU
 DUcNaKmEZ/Pgqz2FwcFx2qIh1LyhVE3zP7kAXHChGWA3FMOiGKb18Vm+T9pjrl74HZkw
 gc2u3egOHWkSN9ibzQTMf3HTb+9/oNR8mt7qSWaC6CEIggk/5MLMgrVTvrE6mPK+/D42
 JzgLihajVUP1A3xnp03DVZxHTBuQAMAmnorI7N+5yKAtJws0dsSMwT6WkXJ5iAT1M3zi
 2ZpFvgqkMKRnBePnTlkOAHWe1A3rbkkoCuhpcaOuuJYexVkTUTd9Ei6VVkQUvnVNWLI1
 k/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVeEC1XgZv+0JDQi5rIgvqYs5+9oYvw4P4dYcheYUZc=;
 b=WVGbSfOA4okYDge9enjTOM9lRDHmx1PSJQf9KSLYkRFB1rkipuDBwMUxu2K4SJFmiP
 ETnTA2sWRB9E+6f5HPwhCx+uVAw3llPS6s/OoM7IREVyDy6SnvOVTloOd6AVYI5oi93z
 h/azYh2IszI+Ar2MTrQeGA8VCz+1a8mCZXmN0x+w3k2v8PFDOqH1kA6+yN62rF6izYPZ
 xSveMzDNLndXsQAFOFiYGhqFj1aUTxmtucMIfk4J4qOGUachBWugbcd5MBAElQ4QakDb
 0vxJALq0uJZCWYUxUkFS/gD2yMyM+WVo1HZL2tsNalC3YnHjaSgYICv5MjCycS/yd7Ai
 6Yog==
X-Gm-Message-State: AO0yUKUD5riYYH8Kh+RgOsIhK04v1wHxc0xabZQKz/ARHYnpEP9bdAlE
 iNrfDVHEOv2imSi4oo+nt9RJcsI6KXKQYAehFQ4=
X-Google-Smtp-Source: AK7set9wgg6/Gv2ua2B6pRDwxlyb4NtBY5B9J70eJTUVl7sg0MTOvFtIpzNM3EMi2i8kUCOjxZmyoQ==
X-Received: by 2002:a62:1a46:0:b0:58d:b8f8:5e2f with SMTP id
 a67-20020a621a46000000b0058db8f85e2fmr2333523pfa.10.1676392271554; 
 Tue, 14 Feb 2023 08:31:11 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH 13/14] target/arm: Export arm_v7m_get_sp_ptr
Date: Tue, 14 Feb 2023 06:30:47 -1000
Message-Id: <20230214163048.903964-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 10 +++++
 target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 127a425961..6ad14048db 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1356,6 +1356,16 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
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
index c20bcac977..87e30c59a8 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -605,42 +605,6 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
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
@@ -765,8 +729,8 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
             !mode;
 
         mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv);
-        frame_sp_p = get_v7m_sp_ptr(env, M_REG_S, mode,
-                                    lr & R_V7M_EXCRET_SPSEL_MASK);
+        frame_sp_p = arm_v7m_get_sp_ptr(env, M_REG_S, mode,
+                                        lr & R_V7M_EXCRET_SPSEL_MASK);
         want_psp = mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
         if (want_psp) {
             limit = env->v7m.psplim[M_REG_S];
@@ -1611,10 +1575,8 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
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
@@ -1920,7 +1882,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
         threadmode = !arm_v7m_is_handler_mode(env);
         spsel = env->v7m.control[M_REG_S] & R_V7M_CONTROL_SPSEL_MASK;
 
-        frame_sp_p = get_v7m_sp_ptr(env, true, threadmode, spsel);
+        frame_sp_p = arm_v7m_get_sp_ptr(env, true, threadmode, spsel);
         frameptr = *frame_sp_p;
 
         /*
@@ -2856,6 +2818,42 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 
 #endif /* !CONFIG_USER_ONLY */
 
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
+
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
-- 
2.34.1


