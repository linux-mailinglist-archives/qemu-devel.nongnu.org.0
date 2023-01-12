Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E192666836
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 02:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlgt-0002wF-AW; Wed, 11 Jan 2023 19:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlgr-0002vk-6e
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:43:33 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlgp-0002xb-0N
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:43:32 -0500
Received: by mail-pl1-x634.google.com with SMTP id p24so18558977plw.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=inXmzky/60Hlt6gfUbuKvMTaqwfghw6G+BptVAjeZXs=;
 b=c6aKMuKhGSQdIAjmkhqOW6oG64VDOWRasqtKNg0tBr10SFGzqYnnJi+nMX7csp3Qfk
 k7J1kz0N1V0lZIigGOnT/88EHFJWHNRcJBN2yW/LbO6AlG2Bl7gkG5lJO1Bs+YiMZ2Ub
 loeiuCPnwQDNAwBx2gsGq9NZH0C0+J/ov2rn5FFYqcEecEfnefQ0Fp0vcSnm8Pnl7J6y
 Q9+aGyiI4Y7U9Uv3+aX+5fxM/NCc0XuH2yCDzv0mV9t5SAxQDc4FfwmOafUofAFRB7ne
 hHFZ7y5N/ZFV7PIMR5aBtnMRlOgFoYbYGha5DnRiEElJOAdsaypO9hqM9W6feutAXEMD
 oCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=inXmzky/60Hlt6gfUbuKvMTaqwfghw6G+BptVAjeZXs=;
 b=UwDWNWiZnHd3XcA8uo5a1lMaSkbVxXCBAxJr04Hm8QtuBxao7rJf3DC8WuydzChiNI
 QqN/MvE3iwLnbBmqWBwZc2/PmFRmLbCX0fbnOv4xT83JG8o3G2EyEAuqauXlsXjKCq42
 05qIl54AxSTCrBK+giGDi3PgqsZUQpBeku/NTZc6UzEFRm0AuYCJewQlYcRicezVZEo2
 TmiPTNnHZYj6zgrOAUe9BXfcyR91pZitrB4XdUzaNIyONAf77Nk9St64/estRxhAk9wX
 wPbKq0YW/alAv1ICBrbNwJJ5ljvyfJXvsZ5BBrQSGex8JQ6mAnGfs3MVGx2spkl7K5Q3
 fTLg==
X-Gm-Message-State: AFqh2koty2+SgeRIC55KOPrnQIZ+Cl7QcPrO/mcnrWQsfk9ifkZCsGs1
 NBMYut8KQT7QclTdNTRv3SUzANchKcaTtBTk
X-Google-Smtp-Source: AMrXdXtwZxaRJAEFahVGTqlsMOzN1E2HDSWLMeEjKcrY6kPFyIGvggwQwXwg43uFdRSuzVvXA6UK6Q==
X-Received: by 2002:a05:6a20:548e:b0:9d:efd3:66ca with SMTP id
 i14-20020a056a20548e00b0009defd366camr104744896pzk.17.1673484209418; 
 Wed, 11 Jan 2023 16:43:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 14-20020a630c4e000000b00478f87eaa44sm8866490pgm.35.2023.01.11.16.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 16:43:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PATCH] target/arm: Introduce aarch64_set_svcr
Date: Wed, 11 Jan 2023 14:43:22 -1000
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Unify the two helper_set_pstate_{sm,za} in this function.
Do not call helper_* functions from svcr_write.
Cleans up linux-user usage by consolodating logic.

Cc: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fabiano, I expect this to replace much of your

  [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into cpregs.c

r~
---
 target/arm/cpu.h              |  2 +-
 target/arm/helper-sme.h       |  3 +--
 linux-user/aarch64/cpu_loop.c | 11 ++--------
 linux-user/aarch64/signal.c   | 13 ++---------
 target/arm/helper.c           | 41 ++++++++++++++++++++++++++++++++---
 target/arm/sme_helper.c       | 37 ++-----------------------------
 target/arm/translate-a64.c    | 19 ++++++----------
 7 files changed, 53 insertions(+), 73 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..a471add499 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1123,7 +1123,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void arm_reset_sve_state(CPUARMState *env);
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index d2d544a696..27eef49a11 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -17,8 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
-DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_3(set_svcr, TCG_CALL_NO_RWG, void, env, i32, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
 
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 9875d609a9..2e2f7cf218 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,15 +89,8 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
-            /*
-             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
-             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
-             */
-            if (FIELD_EX64(env->svcr, SVCR, SM)) {
-                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
-                arm_rebuild_hflags(env);
-                arm_reset_sve_state(env);
-            }
+            /* On syscall, PSTATE.ZA is preserved, PSTATE.SM is cleared. */
+            aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 6a2c6e06d2..b265cfd470 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -665,17 +665,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
-    /*
-     * Invoke the signal handler with both SM and ZA disabled.
-     * When clearing SM, ResetSVEState, per SMSTOP.
-     */
-    if (FIELD_EX64(env->svcr, SVCR, SM)) {
-        arm_reset_sve_state(env);
-    }
-    if (env->svcr) {
-        env->svcr = 0;
-        arm_rebuild_hflags(env);
-    }
+    /* Invoke the signal handler with both SM and ZA disabled. */
+    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
 
     if (info) {
         tswap_siginfo(&frame->info, info);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cee3804354..1d74b95971 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6722,12 +6722,47 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* ResetSVEState */
+static void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
+{
+    uint64_t change = (env->svcr ^ new) & mask;
+
+    if (change == 0) {
+        return;
+    }
+    env->svcr ^= change;
+
+    if (change & R_SVCR_SM_MASK) {
+        arm_reset_sve_state(env);
+    }
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (change & new & R_SVCR_ZA_MASK) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+
+    arm_rebuild_hflags(env);
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
-    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
-    arm_rebuild_hflags(env);
+    aarch64_set_svcr(env, value, -1);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f891306bb9..1e67fcac30 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -29,42 +29,9 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
-/* ResetSVEState */
-void arm_reset_sve_state(CPUARMState *env)
+void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
-    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
-    /* Recall that FFR is stored as pregs[16]. */
-    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
-    vfp_set_fpcr(env, 0x0800009f);
-}
-
-void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_SM_MASK;
-    arm_reset_sve_state(env);
-}
-
-void helper_set_pstate_za(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_ZA_MASK;
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
+    aarch64_set_svcr(env, val, mask);
 }
 
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ee171f249..19cf371c4c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1841,19 +1841,14 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
             goto do_unallocated;
         }
         if (sme_access_check(s)) {
-            bool i = crm & 1;
-            bool changed = false;
+            int old = s->pstate_sm | (s->pstate_za << 1);
+            int new = (crm & 1) * 3;
+            int msk = (crm >> 1) & 3;
 
-            if ((crm & 2) && i != s->pstate_sm) {
-                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if ((crm & 4) && i != s->pstate_za) {
-                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if (changed) {
-                gen_rebuild_hflags(s);
+            if ((old ^ new) & msk) {
+                /* At least one bit changes. */
+                gen_helper_set_svcr(cpu_env, tcg_constant_i32(new),
+                                    tcg_constant_i32(msk));
             } else {
                 s->base.is_jmp = DISAS_NEXT;
             }
-- 
2.34.1


