Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDA663434
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0rS-0004YE-9C; Mon, 09 Jan 2023 17:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rQ-0004Um-0G; Mon, 09 Jan 2023 17:43:20 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rM-00043q-K4; Mon, 09 Jan 2023 17:43:19 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92F035CDE0;
 Mon,  9 Jan 2023 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/yjNEHJNaEULeciYQUGHgrHQEQ93O3h/mzH44EwR50=;
 b=FDMQLFVnv3uN8uJsV7NB/K+0GIT+eRVSbSygg2tAh1APyI7eWMtgrycELW/ZdEFeCZiXki
 OK0EmW7siMmr2J5/2u+CPBAMLxvj4wGBcr46HOsO709FiIZ990Rem1twyVCEuel6/Gfff+
 PuKQeZk2z31JQZyQotL3P8GhPHuKIx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/yjNEHJNaEULeciYQUGHgrHQEQ93O3h/mzH44EwR50=;
 b=oKN0hUxsRKBxCdQP9Cq7i3SrBkIunqbUE323IgDJPUo8GGTC6bOu+Dnd35iMGDBnpANuTW
 ZNQl7k1/gCQ5qFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03EDF13583;
 Mon,  9 Jan 2023 22:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJj2L3+YvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 12/19] target/arm: Move hflags code into the tcg
 directory
Date: Mon,  9 Jan 2023 19:42:25 -0300
Message-Id: <20230109224232.11661-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The hflags are used only for TCG code, so introduce a new file
hflags.c to keep that code.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c        | 361 +-----------------------------------
 target/arm/internals.h     |   2 +
 target/arm/tcg-stubs.c     |   5 +
 target/arm/tcg/hflags.c    | 370 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |   1 +
 5 files changed, 379 insertions(+), 360 deletions(-)
 create mode 100644 target/arm/tcg/hflags.c

diff --git a/target/arm/helper.c b/target/arm/helper.c
index acefd4b69f..d6aa59fecc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -239,32 +239,6 @@ int sme_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-/* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
-static bool sme_fa64(CPUARMState *env, int el)
-{
-    if (!cpu_isar_feature(aa64_sme_fa64, env_archcpu(env))) {
-        return false;
-    }
-
-    if (el <= 1 && !el_is_in_host(env, el)) {
-        if (!FIELD_EX64(env->vfp.smcr_el[1], SMCR, FA64)) {
-            return false;
-        }
-    }
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (!FIELD_EX64(env->vfp.smcr_el[2], SMCR, FA64)) {
-            return false;
-        }
-    }
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        if (!FIELD_EX64(env->vfp.smcr_el[3], SMCR, FA64)) {
-            return false;
-        }
-    }
-
-    return true;
-}
-
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -1832,7 +1806,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
-static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
+int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 57, 2);
@@ -2543,339 +2517,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
-                                           ARMMMUIdx mmu_idx,
-                                           CPUARMTBFlags flags)
-{
-    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
-    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
-
-    if (arm_singlestep_active(env)) {
-        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
-    }
-    return flags;
-}
-
-static CPUARMTBFlags rebuild_hflags_common_32(CPUARMState *env, int fp_el,
-                                              ARMMMUIdx mmu_idx,
-                                              CPUARMTBFlags flags)
-{
-    bool sctlr_b = arm_sctlr_b(env);
-
-    if (sctlr_b) {
-        DP_TBFLAG_A32(flags, SCTLR__B, 1);
-    }
-    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
-    }
-    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
-
-    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
-    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_v7m_is_handler_mode(env)) {
-        DP_TBFLAG_M32(flags, HANDLER, 1);
-    }
-
-    /*
-     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
-     * is suppressing them because the requested execution priority
-     * is less than 0.
-     */
-    if (arm_feature(env, ARM_FEATURE_V8) &&
-        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        DP_TBFLAG_M32(flags, STACKCHECK, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
-        DP_TBFLAG_M32(flags, SECURE, 1);
-    }
-
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    int el = arm_current_el(env);
-
-    if (arm_sctlr(env, el) & SCTLR_A) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_el_is_aa64(env, 1)) {
-        DP_TBFLAG_A32(flags, VFPEN, 1);
-    }
-
-    if (el < 2 && env->cp15.hstr_el2 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
-    }
-
-    if (env->uncached_cpsr & CPSR_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
-    /*
-     * The SME exception we are testing for is raised via
-     * AArch64.CheckFPAdvSIMDEnabled(), as called from
-     * AArch32.CheckAdvSIMDOrFPEnabled().
-     */
-    if (el == 0
-        && FIELD_EX64(env->svcr, SVCR, SM)
-        && (!arm_is_el2_enabled(env)
-            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
-        && arm_el_is_aa64(env, 1)
-        && !sme_fa64(env, el)) {
-        DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
-    }
-
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr(env, mmu_idx);
-    uint64_t sctlr;
-    int tbii, tbid;
-
-    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
-
-    /* Get control bits for tagged addresses.  */
-    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
-    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
-
-    DP_TBFLAG_A64(flags, TBII, tbii);
-    DP_TBFLAG_A64(flags, TBID, tbid);
-
-    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        int sve_el = sve_exception_el(env, el);
-
-        /*
-         * If either FP or SVE are disabled, translator does not need len.
-         * If SVE EL > FP EL, FP exception has precedence, and translator
-         * does not need SVE EL.  Save potential re-translations by forcing
-         * the unneeded data to zero.
-         */
-        if (fp_el != 0) {
-            if (sve_el > fp_el) {
-                sve_el = 0;
-            }
-        } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
-        }
-        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-    }
-    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        int sme_el = sme_exception_el(env, el);
-        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
-
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
-        if (sme_el == 0) {
-            /* Similarly, do not compute SVL if SME is disabled. */
-            int svl = sve_vqm1_for_el_sm(env, el, true);
-            DP_TBFLAG_A64(flags, SVL, svl);
-            if (sm) {
-                /* If SVE is disabled, we will not have set VL above. */
-                DP_TBFLAG_A64(flags, VL, svl);
-            }
-        }
-        if (sm) {
-            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
-            DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
-        }
-        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
-    }
-
-    sctlr = regime_sctlr(env, stage1);
-
-    if (sctlr & SCTLR_A) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
-    }
-
-    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
-        /*
-         * In order to save space in flags, we record only whether
-         * pauth is "inactive", meaning all insns are implemented as
-         * a nop, or "active" when some action must be performed.
-         * The decision of which action to take is left to a helper.
-         */
-        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
-        }
-    }
-
-    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
-        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
-        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-            DP_TBFLAG_A64(flags, BT, 1);
-        }
-    }
-
-    /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
-    if (!(env->pstate & PSTATE_UAO)) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_E10_1:
-        case ARMMMUIdx_E10_1_PAN:
-            /* TODO: ARMv8.3-NV */
-            DP_TBFLAG_A64(flags, UNPRIV, 1);
-            break;
-        case ARMMMUIdx_E20_2:
-        case ARMMMUIdx_E20_2_PAN:
-            /*
-             * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
-             * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
-             */
-            if (env->cp15.hcr_el2 & HCR_TGE) {
-                DP_TBFLAG_A64(flags, UNPRIV, 1);
-            }
-            break;
-        default:
-            break;
-        }
-    }
-
-    if (env->pstate & PSTATE_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
-    if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
-        /*
-         * Set MTE_ACTIVE if any access may be Checked, and leave clear
-         * if all accesses must be Unchecked:
-         * 1) If no TBI, then there are no tags in the address to check,
-         * 2) If Tag Check Override, then all accesses are Unchecked,
-         * 3) If Tag Check Fail == 0, then Checked access have no effect,
-         * 4) If no Allocation Tag Access, then all accesses are Unchecked.
-         */
-        if (allocation_tag_access_enabled(env, el, sctlr)) {
-            DP_TBFLAG_A64(flags, ATA, 1);
-            if (tbid
-                && !(env->pstate & PSTATE_TCO)
-                && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
-                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
-            }
-        }
-        /* And again for unprivileged accesses, if required.  */
-        if (EX_TBFLAG_A64(flags, UNPRIV)
-            && tbid
-            && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF0)
-            && allocation_tag_access_enabled(env, 0, sctlr)) {
-            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
-        }
-        /* Cache TCMA as well as TBI. */
-        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
-    }
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    if (is_a64(env)) {
-        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-    } else if (arm_feature(env, ARM_FEATURE_M)) {
-        return rebuild_hflags_m32(env, fp_el, mmu_idx);
-    } else {
-        return rebuild_hflags_a32(env, fp_el, mmu_idx);
-    }
-}
-
-void arm_rebuild_hflags(CPUARMState *env)
-{
-    env->hflags = rebuild_hflags_internal(env);
-}
-
-/*
- * If we have triggered a EL state change we can't rely on the
- * translator having passed it to us, we need to recompute.
- */
-void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-}
-
-/*
- * If we have triggered a EL state change we can't rely on the
- * translator having passed it to us, we need to recompute.
- */
-void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-}
-
-static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
-{
-#ifdef CONFIG_DEBUG_TCG
-    CPUARMTBFlags c = env->hflags;
-    CPUARMTBFlags r = rebuild_hflags_internal(env);
-
-    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
-        fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
-                c.flags, c.flags2, r.flags, r.flags2);
-        abort();
-    }
-#endif
-}
-
 static bool mve_no_pred(CPUARMState *env)
 {
     /*
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0983e65300..865b9e8104 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1087,6 +1087,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
+int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx);
 
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
@@ -1368,4 +1369,5 @@ bool arm_generate_debug_exceptions(CPUARMState *env);
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
      (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
 
+void assert_hflags_rebuild_correctly(CPUARMState *env);
 #endif
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index 021489cf38..b6bc09504c 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -26,3 +26,8 @@ void arm_reset_sve_state(CPUARMState *env)
 {
     g_assert_not_reached();
 }
+
+/* Temporarily while cpu_get_tb_cpu_state() is still in common code */
+void assert_hflags_rebuild_correctly(CPUARMState *env)
+{
+}
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
new file mode 100644
index 0000000000..746b1c0d70
--- /dev/null
+++ b/target/arm/tcg/hflags.c
@@ -0,0 +1,370 @@
+/*
+ * ARM hflags
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+
+static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
+                                           ARMMMUIdx mmu_idx,
+                                           CPUARMTBFlags flags)
+{
+    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
+    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
+
+    if (arm_singlestep_active(env)) {
+        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
+    }
+    return flags;
+}
+
+static CPUARMTBFlags rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                              ARMMMUIdx mmu_idx,
+                                              CPUARMTBFlags flags)
+{
+    bool sctlr_b = arm_sctlr_b(env);
+
+    if (sctlr_b) {
+        DP_TBFLAG_A32(flags, SCTLR__B, 1);
+    }
+    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+    }
+    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+
+    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
+    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_v7m_is_handler_mode(env)) {
+        DP_TBFLAG_M32(flags, HANDLER, 1);
+    }
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+        DP_TBFLAG_M32(flags, STACKCHECK, 1);
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
+/* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
+static bool sme_fa64(CPUARMState *env, int el)
+{
+    if (!cpu_isar_feature(aa64_sme_fa64, env_archcpu(env))) {
+        return false;
+    }
+
+    if (el <= 1 && !el_is_in_host(env, el)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[1], SMCR, FA64)) {
+            return false;
+        }
+    }
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[2], SMCR, FA64)) {
+            return false;
+        }
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        if (!FIELD_EX64(env->vfp.smcr_el[3], SMCR, FA64)) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    int el = arm_current_el(env);
+
+    if (arm_sctlr(env, el) & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_el_is_aa64(env, 1)) {
+        DP_TBFLAG_A32(flags, VFPEN, 1);
+    }
+
+    if (el < 2 && env->cp15.hstr_el2 &&
+        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
+    }
+
+    if (env->uncached_cpsr & CPSR_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
+    /*
+     * The SME exception we are testing for is raised via
+     * AArch64.CheckFPAdvSIMDEnabled(), as called from
+     * AArch32.CheckAdvSIMDOrFPEnabled().
+     */
+    if (el == 0
+        && FIELD_EX64(env->svcr, SVCR, SM)
+        && (!arm_is_el2_enabled(env)
+            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
+        && arm_el_is_aa64(env, 1)
+        && !sme_fa64(env, el)) {
+        DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
+    uint64_t sctlr;
+    int tbii, tbid;
+
+    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
+
+    /* Get control bits for tagged addresses.  */
+    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
+    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
+
+    DP_TBFLAG_A64(flags, TBII, tbii);
+    DP_TBFLAG_A64(flags, TBID, tbid);
+
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        int sve_el = sve_exception_el(env, el);
+
+        /*
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL > FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
+         */
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
+        }
+        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
+    }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        int sme_el = sme_exception_el(env, el);
+        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            int svl = sve_vqm1_for_el_sm(env, el, true);
+            DP_TBFLAG_A64(flags, SVL, svl);
+            if (sm) {
+                /* If SVE is disabled, we will not have set VL above. */
+                DP_TBFLAG_A64(flags, VL, svl);
+            }
+        }
+        if (sm) {
+            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+            DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
+        }
+        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
+    }
+
+    sctlr = regime_sctlr(env, stage1);
+
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+    }
+
+    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
+        /*
+         * In order to save space in flags, we record only whether
+         * pauth is "inactive", meaning all insns are implemented as
+         * a nop, or "active" when some action must be performed.
+         * The decision of which action to take is left to a helper.
+         */
+        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
+            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
+        }
+    }
+
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
+        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
+            DP_TBFLAG_A64(flags, BT, 1);
+        }
+    }
+
+    /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
+    if (!(env->pstate & PSTATE_UAO)) {
+        switch (mmu_idx) {
+        case ARMMMUIdx_E10_1:
+        case ARMMMUIdx_E10_1_PAN:
+            /* TODO: ARMv8.3-NV */
+            DP_TBFLAG_A64(flags, UNPRIV, 1);
+            break;
+        case ARMMMUIdx_E20_2:
+        case ARMMMUIdx_E20_2_PAN:
+            /*
+             * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
+             * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
+             */
+            if (env->cp15.hcr_el2 & HCR_TGE) {
+                DP_TBFLAG_A64(flags, UNPRIV, 1);
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (env->pstate & PSTATE_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
+    if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
+        /*
+         * Set MTE_ACTIVE if any access may be Checked, and leave clear
+         * if all accesses must be Unchecked:
+         * 1) If no TBI, then there are no tags in the address to check,
+         * 2) If Tag Check Override, then all accesses are Unchecked,
+         * 3) If Tag Check Fail == 0, then Checked access have no effect,
+         * 4) If no Allocation Tag Access, then all accesses are Unchecked.
+         */
+        if (allocation_tag_access_enabled(env, el, sctlr)) {
+            DP_TBFLAG_A64(flags, ATA, 1);
+            if (tbid
+                && !(env->pstate & PSTATE_TCO)
+                && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
+                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
+            }
+        }
+        /* And again for unprivileged accesses, if required.  */
+        if (EX_TBFLAG_A64(flags, UNPRIV)
+            && tbid
+            && !(env->pstate & PSTATE_TCO)
+            && (sctlr & SCTLR_TCF0)
+            && allocation_tag_access_enabled(env, 0, sctlr)) {
+            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+        }
+        /* Cache TCMA as well as TBI. */
+        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
+    }
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    if (is_a64(env)) {
+        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+    } else if (arm_feature(env, ARM_FEATURE_M)) {
+        return rebuild_hflags_m32(env, fp_el, mmu_idx);
+    } else {
+        return rebuild_hflags_a32(env, fp_el, mmu_idx);
+    }
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    env->hflags = rebuild_hflags_internal(env);
+}
+
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it to us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it to us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
+inline void assert_hflags_rebuild_correctly(CPUARMState *env)
+{
+#ifdef CONFIG_DEBUG_TCG
+    CPUARMTBFlags c = env->hflags;
+    CPUARMTBFlags r = rebuild_hflags_internal(env);
+
+    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
+        fprintf(stderr, "TCG hflags mismatch "
+                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
+                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                c.flags, c.flags2, r.flags, r.flags2);
+        abort();
+    }
+#endif
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 47006f903c..25bc98999e 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -25,6 +25,7 @@ arm_ss.add(files(
   'translate-vfp.c',
   'crypto_helper.c',
   'debug_helper.c',
+  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
-- 
2.35.3


