Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A24F30D2B8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:00:13 +0100 (CET)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7AGy-0002Kn-9D
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFF-00011L-Mk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:25 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:35351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFD-0007yb-TS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:25 -0500
Received: by mail-il1-x12d.google.com with SMTP id g7so20215439iln.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 20:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk0xyCoVAMRqT9GKlFufrmlmpQNpG0K1YUjKkhlKwVg=;
 b=yYGDBHFS1SqUYiLLHCXFTNALY/JH9hWEnuWKOZ8uLpAez5KXfyarhCTOkGozxLUJVO
 i1yVjuBAlYDGFZMkl+S6j5fT2xXfEE5pDPUfqwoUuZFK54UUTAx+Ue0XQCFZ5InuWY2/
 XOum9nRRk2MG+xtLW7wwatKbo9MbzGCyJCYgD14vut9miQppFnO0euHrJleRTzS60gwq
 b4DAelsUYY/Gcnf2SBvkxfRQbr9iC8FA8XM1KfMmLqzt0vttOcTY15aTZk0Rs3mCBbjn
 8qOhRWMQdNPSGM8IM2vy5ImX2JbtfStNa4ZNzCb8YYcqPYTZw4ovqfQcYxVCwPOV58iO
 lxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk0xyCoVAMRqT9GKlFufrmlmpQNpG0K1YUjKkhlKwVg=;
 b=CbK3Noje5xHoMc/jqi1FjWqUmZjXmaq3EhUSKq0JaIQsyhD2xy4YaO7wA+c8ifp2BN
 h5FYZEyjvAC8Lil8BDWz4KCsUsWoQZ3IdBHn0dAFRjkUZkMVUa+DIQxh3FILdjXiS8Ko
 Q6yb+ewiN2VkMcWmaX4NKy/BqzcKBi44fu/3OWBJTQnZw2zuxAhYoHEVeqLSJQ9CHOkh
 ZGwzr4VrqpIrMd5CnX1w8a19GK4ASTQwS28ix4TSZ8Z5luCvwIveLKIjSDGS9LDGSpuK
 nOpqZcd+oht00BPWp5aOMhz55bx0yviUuVSecjtX1BnxL+RHR451e6v5ZyLa5DS+nLFW
 WL/A==
X-Gm-Message-State: AOAM531lVOqAejY7hsCbC91qi6w4DFZXoo2zGbZ2KRw+zG22WJazIXeO
 0bvvliqqO7i5Me05uTZElAo5MgzGHT8dUAlczC1OdcIqIr22/s/TII9BZoDvCZT9c+zdZxa4/lV
 hMfKaceID61XKMw42gYOPIJMszUaiBK8YSfug96Nq/k5jSNkseJakMGpIpK7WlM2UGac48I8=
X-Google-Smtp-Source: ABdhPJyPF6Y3iveMrckuXD5M5qgO+7Farni0DfYwEewk5dOnBzvzA1Ucg//AXBdi74QDTPHSenYsbQ==
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr1236043ili.260.1612328302460; 
 Tue, 02 Feb 2021 20:58:22 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a21sm529203ioa.34.2021.02.02.20.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 20:58:21 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS from
 cpsr into env->pstate
Date: Tue,  2 Feb 2021 21:58:14 -0700
Message-Id: <20210203045816.10953-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203045816.10953-1-rebecca@nuviainc.com>
References: <20210203045816.10953-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpsr has been treated as being the same as spsr, but it isn't.
Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.

This allows us to add support for CPSR_DIT, adding helper functions
to merge SPSR_ELx to and from CPSR.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/helper-a64.c | 32 +++++++++++++++++---
 target/arm/helper.c     | 27 ++++++++++++-----
 target/arm/op_helper.c  |  9 +-----
 3 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c426c23d2c4e..be5d3f6e75cb 100644
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
 
@@ -998,11 +1018,13 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
          */
-        mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
-        cpsr_write(env, spsr, mask, CPSRWriteRaw);
+        cpsr_write_from_spsr_elx(env, spsr);
         if (!arm_singlestep_active(env)) {
-            env->uncached_cpsr &= ~PSTATE_SS;
+            env->pstate &= ~PSTATE_SS;
+        } else {
+            env->pstate |= PSTATE_SS;
         }
+
         aarch64_sync_64_to_32(env);
 
         if (spsr & CPSR_T) {
@@ -1022,6 +1044,8 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
             env->pstate &= ~PSTATE_SS;
+        } else {
+            env->pstate |= PSTATE_SS;
         }
         aarch64_restore_sp(env, new_el);
         helper_rebuild_hflags_a64(env, new_el);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0aad6d79dcb1..a31f37e2a257 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9420,6 +9420,21 @@ void aarch64_sync_64_to_32(CPUARMState *env)
     env->regs[15] = env->pc;
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
 static void take_aarch32_exception(CPUARMState *env, int new_mode,
                                    uint32_t mask, uint32_t offset,
                                    uint32_t newpc)
@@ -9433,8 +9448,9 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
      * For exceptions taken to AArch32 we must clear the SS bit in both
      * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
      */
-    env->uncached_cpsr &= ~PSTATE_SS;
-    env->spsr = cpsr_read(env);
+    env->pstate &= ~PSTATE_SS;
+    env->spsr = cpsr_read_for_spsr_elx(env);
+
     /* Clear IT bits.  */
     env->condexec_bits = 0;
     /* Switch to the new mode, and to the correct instruction set.  */
@@ -9911,7 +9927,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         aarch64_save_sp(env, arm_current_el(env));
         env->elr_el[new_el] = env->pc;
     } else {
-        old_mode = cpsr_read(env);
+        old_mode = cpsr_read_for_spsr_elx(env);
         env->elr_el[new_el] = env->regs[15];
 
         aarch64_sync_32_to_64(env);
@@ -13201,7 +13217,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
     uint32_t flags = env->hflags;
-    uint32_t pstate_for_ss;
 
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
@@ -13211,7 +13226,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
-        pstate_for_ss = env->pstate;
     } else {
         *pc = env->regs[15];
 
@@ -13259,7 +13273,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TBFLAG_AM32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_AM32, CONDEXEC, env->condexec_bits);
-        pstate_for_ss = env->uncached_cpsr;
     }
 
     /*
@@ -13272,7 +13285,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
-        (pstate_for_ss & PSTATE_SS)) {
+        (env->pstate & PSTATE_SS)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
     }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5e0f123043b5..65cb37d088f8 100644
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
2.26.2


