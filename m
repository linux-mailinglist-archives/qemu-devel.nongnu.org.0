Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44606AC5A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrV-00046X-NZ; Mon, 06 Mar 2023 10:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrS-000455-QU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:50 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrQ-0002BG-VA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p16so5911115wmq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O+ujOWWybD9KNJcAQ8vS9zB0/hV+GpzXbwAmASVSlKM=;
 b=O1fUZYsNbUOIuxp8faCHqwRLvdIuKDFWtWoocdh459b2HpXMGMecBu10H0CpVmR0TQ
 evZI/ET7ntu7QIzWskkE8PIwighCtcvT293DM5j3d4uRsfBJJ/noESnzpWGuswTx1T1z
 ezh18juQXSk/eKnTzvfJGaBRiU8k0dZ0z1Kb/3VGPFn1AzZB9E2ENK1ESLkqq8hR/YR9
 K3DGmOPfqSB1EYlqHBR7yxPc9/flmcgA+NfLRT6GJa0phZiVOgdHSvfjRT7CELVlWpok
 wT2xfsIuN6vPVUZZvOgi8XMmqNazf02W2MtmIZvl4VUt2gfNMQrAb4Qlb8HKK1q31BcB
 TAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+ujOWWybD9KNJcAQ8vS9zB0/hV+GpzXbwAmASVSlKM=;
 b=WlbBen/oLW9HTke7AYogFvC64m1XFsjLV8jVRjz9lwXv5F3CzlgiUW6nMGxJLPoZx9
 hkSDRVojzp0WEo8dKAD0+QXR2x6bG0Mtp5/7JsAoOPRyhBJKUYpIoJLInnW/j92FpPfb
 8bzmoNjl2COtIlWimpYLEkHR3k3TWaSWi6zh08NZPmuJflEFjGGJ1Ip+1r10WsfpCV+/
 7AUeyXDs7wW1I7jHDxHv4KUqEt747WaHzMYcRIZwpTWOaToI0pMvXJDkIS1qT3knW2eL
 cBNPUVpXtn1eil66XKLl6VSs4mgY3cRZ7TJTkgGpMuvVSxldwNG/Git5NnLQeg4HN3lI
 uwEg==
X-Gm-Message-State: AO0yUKXLZHgHevHyc0kyi3MB6lXkrYRbMbcM2oJ3gqhtxqkEtDqT0VaI
 Uf5q74y0ccCLQngFE93z6s5lNJ5D0YBLCrW+88E=
X-Google-Smtp-Source: AK7set9KH1iQrAwB7HuiGerR7fDzyXUATLabC9RMZjlFd0a0R7ZGDpVVaCJ4swpieK8yIZI55oZElQ==
X-Received: by 2002:a05:600c:1d09:b0:3eb:3945:d3f4 with SMTP id
 l9-20020a05600c1d0900b003eb3945d3f4mr10317130wms.2.1678116887643; 
 Mon, 06 Mar 2023 07:34:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] target/arm: Export arm_v7m_get_sp_ptr
Date: Mon,  6 Mar 2023 15:34:27 +0000
Message-Id: <20230306153435.490894-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-14-richard.henderson@linaro.org
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h    | 10 +++++
 target/arm/tcg/m_helper.c | 84 +++++++++++++++++++--------------------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 086e88e2377..b1ef05963f8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1360,6 +1360,16 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
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
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 03be79e7bfa..081fc3f5f75 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
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


