Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07707318BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:13:58 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABnB-000365-2V
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYs-0007sc-0W
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYp-0008Lf-OH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id g6so4044604wrs.11
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eUbSMazfyfMsBMjES0tnhx8PHPELPJGOsUzJPWKDUhc=;
 b=G7Yu9PDtCtU0HiaHnuSTqPv6Y7i1UYGpfAvy1klT0qeMBkvzhI0UVRcSRP2CikvB3O
 zhfhUv/SHVWC3Ug1v2Q+MTqrjl5VC2mFX4tFT6v2+AoiZBj80qUfyXewxf2T4rRLOPAu
 MP7GslXKncUEQ2PJLze1t2romx/3Fq/A7PzeACfLveyiq10lGUechey/9ddJ2T7A+tjh
 0uxvhGOvroK/cYwRrXt+F+JHaWh6+UnC/Mh4FNOoocS3j4+pKjuVshrjQythgJPmdfkF
 pVNdbuY7eunW73eJV208+O8MgnPO/tGHzHvDPaK4Y6zrj+hnCNGFQLZHT7ezQU+PI8ji
 momw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUbSMazfyfMsBMjES0tnhx8PHPELPJGOsUzJPWKDUhc=;
 b=faGHPgapi8A0cd06PAKKag1ZOihlPLbDJJ7g/x1TOJDnR0LUhd2Hc15xmWwAwj86YQ
 y/zR3qiJo/1Ix5WP6CjfBDfXXMxNy6Vw9DnZA8+1tjsGcHj8j/PrtJKGYrRnaKAAO4y3
 rGNUYCFHJwLl+U0wttDV76U3EkYKSo7Dv00sJu8VjI5GPl+xI6jfjBlGGPcrWy7COwiH
 yBVnnywezYOPHIglB3+Z6X0C5tQa4UJ99L/WNEnMLP24cd9q+dt9vhdcZHliSDT82gB9
 E6gPwamVY8TYj0+dZJBGPmPAYvmJ5sulbmoNksvVCtchAi0W1nkhHGPebWhLX9qmCdg7
 0nQQ==
X-Gm-Message-State: AOAM530yGmdZKeNS7kYzYUeUdd2LHtYNFXPTp+G2GUcAUaoaS/77XnuC
 F1Ig6byHnDpwnfCPX2dS7qt8AKUzyHYZEA==
X-Google-Smtp-Source: ABdhPJz26srC/HdltingZmthvnJdaAvfKeDP/b4fddLjG3kCLI8vmxMUSFg/T54tlwt5N2B6zN81Lg==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr5770300wrq.51.1613048346340; 
 Thu, 11 Feb 2021 04:59:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] target/arm: Support AA32 DIT by moving PSTATE_SS from
 cpsr into env->pstate
Date: Thu, 11 Feb 2021 12:58:20 +0000
Message-Id: <20210211125900.22777-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Rebecca Cran <rebecca@nuviainc.com>

cpsr has been treated as being the same as spsr, but it isn't.
Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.

This allows us to add support for CPSR_DIT, adding helper functions
to merge SPSR_ELx to and from CPSR.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210208065700.19454-3-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.c | 27 +++++++++++++++++++++++----
 target/arm/helper.c     | 24 ++++++++++++++++++------
 target/arm/op_helper.c  |  9 +--------
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c426c23d2c4..ae611d73c2c 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -945,11 +945,31 @@ static int el_from_spsr(uint32_t spsr)
     }
 }
 
+static void cpsr_write_from_spsr_elx(CPUARMState *env,
+                                     uint32_t val)
+{
+    uint32_t mask;
+
+    /* Save SPSR_ELx.SS into PSTATE. */
+    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
+    val &= ~PSTATE_SS;
+
+    /* Move DIT to the correct location for CPSR */
+    if (val & PSTATE_DIT) {
+        val &= ~PSTATE_DIT;
+        val |= CPSR_DIT;
+    }
+
+    mask = aarch32_cpsr_valid_mask(env->features, \
+        &env_archcpu(env)->isar);
+    cpsr_write(env, val, mask, CPSRWriteRaw);
+}
+
 void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
 {
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t mask, spsr = env->banked_spsr[spsr_idx];
+    uint32_t spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
@@ -998,10 +1018,9 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
          */
-        mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
-        cpsr_write(env, spsr, mask, CPSRWriteRaw);
+        cpsr_write_from_spsr_elx(env, spsr);
         if (!arm_singlestep_active(env)) {
-            env->uncached_cpsr &= ~PSTATE_SS;
+            env->pstate &= ~PSTATE_SS;
         }
         aarch64_sync_64_to_32(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf8e80419da..2c27077fb2d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9445,7 +9445,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
      * For exceptions taken to AArch32 we must clear the SS bit in both
      * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
      */
-    env->uncached_cpsr &= ~PSTATE_SS;
+    env->pstate &= ~PSTATE_SS;
     env->spsr = cpsr_read(env);
     /* Clear IT bits.  */
     env->condexec_bits = 0;
@@ -9801,6 +9801,21 @@ static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
     }
 }
 
+static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+{
+    uint32_t ret = cpsr_read(env);
+
+    /* Move DIT to the correct location for SPSR_ELx */
+    if (ret & CPSR_DIT) {
+        ret &= ~CPSR_DIT;
+        ret |= PSTATE_DIT;
+    }
+    /* Merge PSTATE.SS into SPSR_ELx */
+    ret |= env->pstate & PSTATE_SS;
+
+    return ret;
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -9923,7 +9938,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         aarch64_save_sp(env, arm_current_el(env));
         env->elr_el[new_el] = env->pc;
     } else {
-        old_mode = cpsr_read(env);
+        old_mode = cpsr_read_for_spsr_elx(env);
         env->elr_el[new_el] = env->regs[15];
 
         aarch64_sync_32_to_64(env);
@@ -13217,7 +13232,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
     uint32_t flags = env->hflags;
-    uint32_t pstate_for_ss;
 
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
@@ -13227,7 +13241,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
-        pstate_for_ss = env->pstate;
     } else {
         *pc = env->regs[15];
 
@@ -13275,7 +13288,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TBFLAG_AM32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_AM32, CONDEXEC, env->condexec_bits);
-        pstate_for_ss = env->uncached_cpsr;
     }
 
     /*
@@ -13288,7 +13300,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
-        (pstate_for_ss & PSTATE_SS)) {
+        (env->pstate & PSTATE_SS)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
     }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5e0f123043b..65cb37d088f 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -389,14 +389,7 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
-    /*
-     * We store the ARMv8 PSTATE.SS bit in env->uncached_cpsr.
-     * This is convenient for populating SPSR_ELx, but must be
-     * hidden from aarch32 mode, where it is not visible.
-     *
-     * TODO: ARMv8.4-DIT -- need to move SS somewhere else.
-     */
-    return cpsr_read(env) & ~(CPSR_EXEC | PSTATE_SS);
+    return cpsr_read(env) & ~CPSR_EXEC;
 }
 
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
-- 
2.20.1


