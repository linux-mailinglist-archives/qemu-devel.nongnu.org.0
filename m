Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DAA6876CB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNUOx-0001R6-Rx; Thu, 02 Feb 2023 02:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOv-0001Pf-CE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:57 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOt-0007kp-G2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:57 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so4825091pjq.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 23:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Delo5QkO4scLfu5O9b3W0awpyju/d+yuaDzAKXoKIMs=;
 b=iKGl5wJ/dIncLWwAc/S3f+2ihx03YRd0VYm7uftAAm36ifhzzJK9NMUNEf53opnk2/
 9aXSrXMx2BJ5ekEIM6YO7NOMCZok7N33HjmPCgIDWYv1lV+NWLn0RUc40Bk+bS+MG2Dz
 YX1v2RTjaRDkHmqylv/vk/WoSWPtXm6VTGnH0NVg5BtV2UY4WpZ7313/2f3rT7/l3BLn
 XnY2Xv0eyJxELZ6KOzuhSmfsAJTQGX/qXoAq1+fkuT17SAH9sv70ARXDjvrA0WJSLLSb
 27bko17cIF7WhpHfF0WJido9rok3KAB0fYDX69mNOe6W9ObqMwXeJnouR8vNd7y7i6Ak
 6BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Delo5QkO4scLfu5O9b3W0awpyju/d+yuaDzAKXoKIMs=;
 b=3cMb6J7WO60jXcwUD/r2uOBELgP56fVrtZ7lppHVUcDsBVVd5rLXzwP+i7LszK6PdG
 F3jiMmelOmAxOPnX/2/MA0nlFNRfKfcPXnOvl9i70xTG4v/P4O5K5MR6t3el7MSi/Egj
 AtQQD0ufWjiZwYVM8ro4oJ5/ffKaZokZykji1QOVWpsylts+6GVwpJRW0o98GISgZMqC
 a7y78jxrNphv8TaqH5cLvDLOlwVson+4URkU3d3YU9pe1VKB6h/9V5Z+RhVie0TPF9Dr
 ADRtnC52tTSnic3WGFeD/n+SreeVbeR/ornGIXnIUeGD1UiOHxtPjjaHsy/X9KZM6a6B
 LErQ==
X-Gm-Message-State: AO0yUKVIS2op4gROGofl+Jrmjk5pZfssAJDsnx1Znj+M9iQwLqB5KOmJ
 dr/hR3E06lpWjad8eXfzerDSDfJA2ngx0WZK
X-Google-Smtp-Source: AK7set9bVp4nsOttI5gvbfGLxRDrMdBVP4LKyDcEnbR0R2/sFS3hMpNxO3aB96WwIxx9U+l2NOf9zQ==
X-Received: by 2002:a05:6a20:9f9b:b0:b8:ca86:d1e8 with SMTP id
 mm27-20020a056a209f9b00b000b8ca86d1e8mr998805pzb.14.1675324373974; 
 Wed, 01 Feb 2023 23:52:53 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a7ac400b0022c35afad5bsm2496763pjl.16.2023.02.01.23.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:52:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 4/4] target/arm: Cache ARMVAParameters
Date: Wed,  1 Feb 2023 21:52:42 -1000
Message-Id: <20230202075242.260793-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
References: <20230202075242.260793-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Cache the processed ARMVAParameters, as the building is
quite expensive, particularly when PAUTH is enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  11 +++++
 target/arm/helper.c | 102 ++++++++++++++++++++++++++++++++++++--------
 2 files changed, 96 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e961afe88a..4ab8a0629b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -243,6 +243,7 @@ typedef uint32_t ARMVAParameters;
     FIELD(ARMVAP, DS, 21, 1)
     FIELD(ARMVAP, HA, 22, 1)
     FIELD(ARMVAP, HD, 23, 1)
+    FIELD(ARMVAP, INIT, 31, 1)
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 
@@ -741,6 +742,16 @@ typedef struct CPUArchState {
     /* Optional fault info across tlb lookup. */
     ARMMMUFaultInfo *tlb_fi;
 
+    /* Cached VA Parameters. */
+    struct {
+        ARMVAParameters e0[2];
+        ARMVAParameters e1[2];
+        ARMVAParameters e2[2];
+        ARMVAParameters e3;
+        ARMVAParameters stage2;
+        ARMVAParameters stage2_s;
+    } vap_cache;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 531a4bebb3..d573a8c420 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4063,6 +4063,9 @@ static void vmsa_tcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx(cs, (ARMMMUIdxBit_E10_1 |
                              ARMMMUIdxBit_E10_1_PAN |
                              ARMMMUIdxBit_E10_0));
+    memset(&env->vap_cache.e0, 0, sizeof(env->vap_cache.e0));
+    memset(&env->vap_cache.e1, 0, sizeof(env->vap_cache.e1));
+
     raw_write(env, ri, value);
 }
 
@@ -4078,6 +4081,25 @@ static void vmsa_tcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx(cs, (ARMMMUIdxBit_E20_2 |
                              ARMMMUIdxBit_E20_2_PAN |
                              ARMMMUIdxBit_E20_0));
+    memset(&env->vap_cache.e0, 0, sizeof(env->vap_cache.e0));
+    memset(&env->vap_cache.e2, 0, sizeof(env->vap_cache.e2));
+
+    raw_write(env, ri, value);
+}
+
+static void vmsa_vtcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    /* Bits of VSTCR_EL2 are shared with VTCR_EL2: flush both. */
+    env->vap_cache.stage2 = 0;
+    env->vap_cache.stage2_s = 0;
+    raw_write(env, ri, value);
+}
+
+static void vmsa_tcr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    env->vap_cache.e3 = 0;
     raw_write(env, ri, value);
 }
 
@@ -5552,6 +5574,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
+    uint64_t changed;
 
     if (arm_feature(env, ARM_FEATURE_V8)) {
         valid_mask |= MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
@@ -5605,6 +5628,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 
     /* Clear RES0 bits.  */
     value &= valid_mask;
+    changed = env->cp15.hcr_el2 ^ value;
+    env->cp15.hcr_el2 = value;
 
     /*
      * These bits change the MMU setup:
@@ -5614,11 +5639,14 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_DCT enables tagging on (disabled) stage1 translation
      * HCR_FWB changes the interpretation of stage2 descriptor bits
      */
-    if ((env->cp15.hcr_el2 ^ value) &
-        (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB)) {
+    if (changed & (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB)) {
         tlb_flush(CPU(cpu));
     }
-    env->cp15.hcr_el2 = value;
+    /* E2H and TGE control {E20_2, E20_0} vs {E2, E10_0} regimes. */
+    if (changed & (HCR_E2H | HCR_TGE)) {
+        memset(&env->vap_cache.e0, 0, sizeof(env->vap_cache.e0));
+        memset(&env->vap_cache.e2, 0, sizeof(env->vap_cache.e2));
+    }
 
     /*
      * Updates to VI and VF require us to update the status of
@@ -5915,13 +5943,12 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS, .writefn = vmsa_vtcr_el2_write,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW,
-      /* no .writefn needed as this can't cause an ASID change */
+      .access = PL2_RW, .writefn = vmsa_vtcr_el2_write,
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
@@ -6154,8 +6181,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
     { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL3_RW,
-      /* no .writefn needed as this can't cause an ASID change */
+      .access = PL3_RW, .writefn = vmsa_tcr_el3_write,
       .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
     { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
@@ -11039,19 +11065,47 @@ static ARMGranuleSize sanitize_gran_size(ARMCPU *cpu, ARMGranuleSize gran,
     return Gran64K;
 }
 
-ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx)
+static ARMVAParameters *vap_cache(CPUARMState *env, ARMMMUIdx idx, bool sel)
+{
+    switch (idx) {
+    case ARMMMUIdx_Stage2:
+        return &env->vap_cache.stage2;
+    case ARMMMUIdx_Stage2_S:
+        return &env->vap_cache.stage2_s;
+    case ARMMMUIdx_E3:
+        return &env->vap_cache.e3;
+    case ARMMMUIdx_E2:
+        return &env->vap_cache.e2[0];
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_E20_2:
+        return &env->vap_cache.e2[sel];
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+        return &env->vap_cache.e1[sel];
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_Stage1_E0:
+        return &env->vap_cache.e0[sel];
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static ARMVAParameters __attribute__((noinline))
+aa64_va_parameters_build(CPUARMState *env, ARMMMUIdx mmu_idx, bool select)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd;
-    int select, tsz, tbii, tbid, max_tsz, min_tsz, ps, sh;
+    int tsz, tbii, tbid, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
     bool stage2 = regime_is_stage2(mmu_idx);
     ARMVAParameters r;
 
     if (!regime_has_2_ranges(mmu_idx)) {
-        select = 0;
+        select = false;
         tsz = extract32(tcr, 0, 6);
         gran = tg0_to_gran_size(extract32(tcr, 14, 2));
         if (stage2) {
@@ -11069,11 +11123,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         bool e0pd;
 
-        /*
-         * Bit 55 is always between the two regions, and is canonical for
-         * determining if address tagging is enabled.
-         */
-        select = extract64(va, 55, 1);
         if (!select) {
             tsz = extract32(tcr, 0, 6);
             gran = tg0_to_gran_size(extract32(tcr, 14, 2));
@@ -11166,6 +11215,25 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     r = FIELD_DP32(r, ARMVAP, DS, ds);
     r = FIELD_DP32(r, ARMVAP, HA, ha);
     r = FIELD_DP32(r, ARMVAP, HD, ha && hd);
+    r = FIELD_DP32(r, ARMVAP, INIT, 1);
+    return r;
+}
+
+ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
+                                   ARMMMUIdx mmu_idx)
+{
+    /*
+     * Bit 55 is always between the two regions, and is canonical for
+     * determining if address tagging is enabled.
+     * Will be zapped if !regime_has_2_ranges.
+     */
+    bool select = extract64(va, 55, 1);
+    ARMVAParameters *c = vap_cache(env, mmu_idx, select);
+    ARMVAParameters r = *c;
+
+    if (unlikely(!FIELD_EX32(r, ARMVAP, INIT))) {
+        *c = r = aa64_va_parameters_build(env, mmu_idx, select);
+    }
     return r;
 }
 
-- 
2.34.1


