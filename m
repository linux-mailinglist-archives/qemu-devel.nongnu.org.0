Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C75574F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:34:13 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByyq-0006sk-5Z
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoF-0002Lw-Vf
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoC-0004qh-SP
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z12so2549505wrq.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSNYIq4mNazZyNNrOkyrVy+ZP+gbwqcNvnTFnG/hGfA=;
 b=G+NrcPJ4dxnDQ+FSAvMSyc3vP7LoNkFOFeV5OcV9JRmHqFo3bZ7FDAl8RayUsaTEVg
 WYWqZDsJK6rPMGVA1D739PdOKbvLh+lvXWF8paFTx1lJDJ0LzqT0YJoW9Q56kOHCE98b
 MmBE+PkU3WFKNFjFPaO4QrUr0g127ktiWbaNJXzbgQYEF30DvX16pRcdp7+JJEk3z2tr
 SKRdvpNSUW13AXGc6yAW0e8/qeUeOQFssQps6ERBjQ6uWofQg2Koqn/L4LCorlzyDJM0
 IHs7T8YueHZ4G8Bzs76Tp/VmFM3wkrXIBd9QO3W9xM1xjZTKiVqa4MxQ9AWogL/w3DO/
 ulig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSNYIq4mNazZyNNrOkyrVy+ZP+gbwqcNvnTFnG/hGfA=;
 b=Y20srluVRb1wtar7J6ytlarUaVKV7a3QGBU/yNsIprE0BOcs/KRdxjmkCv5at77vb9
 6dpCLrN5yTAF9aw28TqZrcALW45VvFJ7K9HnMxKGyGQVNj7Foaw1VmyNJmOU4N0rg031
 LeDSu66XTzxsU0iKBtovt6fyMHCChQXBFUmLCxZYwQcriyoNOKixuWwzrCu/HjrsOo1R
 BLMt+DQ6E9vRK/kc4Pe+PxCmOFSRk57oisjS6PhmbZdWDqnAKK5uF/fPy4+TiMY2EIqc
 DZn15pcmyWT1aiw+cLnoGbrfSrBSeo+ydx64c8rlyxvGAskQN8NVaylbrXOaRZ7+eqck
 yGfA==
X-Gm-Message-State: AJIora+K20BXXn7FiQQs5ZUcqs+NNnK+IfpxnyECwROscBPkUX171m2N
 WxbCSjMlRKmDwuuhsOEWNyHoDw==
X-Google-Smtp-Source: AGRyM1t8UgSr+VKRiUDBB2KmiQHuLDsVN8JDqjcJO42Vw2eppQ2SjjCUcqz6LaEU6FheSQC58BXapw==
X-Received: by 2002:a5d:4304:0:b0:21b:9b2c:be34 with SMTP id
 h4-20020a5d4304000000b0021b9b2cbe34mr8627753wrq.577.1657804991353; 
 Thu, 14 Jul 2022 06:23:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 6/7] target/arm: Store TCR_EL* registers as uint64_t
Date: Thu, 14 Jul 2022 14:23:02 +0100
Message-Id: <20220714132303.1287193-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the representation of the TCR_EL* registers in the CPU state
struct from struct TCR to uint64_t.  This allows us to drop the
custom vmsa_ttbcr_raw_write() function, moving the "enforce RES0"
checks to their more usual location in the writefn
vmsa_ttbcr_write().  We also don't need the resetfn any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          |  8 +----
 target/arm/internals.h    |  6 ++--
 target/arm/cpu.c          |  2 +-
 target/arm/debug_helper.c |  2 +-
 target/arm/helper.c       | 75 +++++++++++----------------------------
 target/arm/ptw.c          |  2 +-
 6 files changed, 27 insertions(+), 68 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 445e477c710..bbd1afa6251 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -166,12 +166,6 @@ typedef struct ARMGenericTimer {
 #define GTIMER_HYPVIRT  4
 #define NUM_GTIMERS     5
 
-typedef struct {
-    uint64_t raw_tcr;
-    uint32_t mask;
-    uint32_t base_mask;
-} TCR;
-
 #define VTCR_NSW (1u << 29)
 #define VTCR_NSA (1u << 30)
 #define VSTCR_SW VTCR_NSW
@@ -339,7 +333,7 @@ typedef struct CPUArchState {
         uint64_t vttbr_el2; /* Virtualization Translation Table Base.  */
         uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
-        TCR tcr_el[4];
+        uint64_t tcr_el[4];
         uint64_t vtcr_el2; /* Virtualization Translation Control.  */
         uint64_t vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9f654b12cea..742135ef146 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -252,9 +252,9 @@ unsigned int arm_pamax(ARMCPU *cpu);
  */
 static inline bool extended_addresses_enabled(CPUARMState *env)
 {
-    TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
+    uint64_t tcr = env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
     return arm_el_is_aa64(env, 1) ||
-           (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
+           (arm_feature(env, ARM_FEATURE_LPAE) && (tcr & TTBCR_EAE));
 }
 
 /* Update a QEMU watchpoint based on the information the guest has set in the
@@ -790,7 +790,7 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
          */
         return env->cp15.vstcr_el2;
     }
-    return env->cp15.tcr_el[regime_el(env, mmu_idx)].raw_tcr;
+    return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
 /**
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5de7e097e9b..1b7b3d76bb3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -226,7 +226,7 @@ static void arm_cpu_reset(DeviceState *dev)
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
+        env->cp15.tcr_el[1] = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index d09fccb0a4f..c21739242c5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -439,7 +439,7 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
         using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
             using_lpae = true;
         }
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index eaf6521c615..51e58e08468 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3606,19 +3606,21 @@ static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c6_region[7]) },
 };
 
-static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                 uint64_t value)
+static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
 {
-    TCR *tcr = raw_ptr(env, ri);
-    int maskshift = extract32(value, 0, 3);
+    ARMCPU *cpu = env_archcpu(env);
 
     if (!arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_LPAE) && (value & TTBCR_EAE)) {
-            /* Pre ARMv8 bits [21:19], [15:14] and [6:3] are UNK/SBZP when
-             * using Long-desciptor translation table format */
+            /*
+             * Pre ARMv8 bits [21:19], [15:14] and [6:3] are UNK/SBZP when
+             * using Long-descriptor translation table format
+             */
             value &= ~((7 << 19) | (3 << 14) | (0xf << 3));
         } else if (arm_feature(env, ARM_FEATURE_EL3)) {
-            /* In an implementation that includes the Security Extensions
+            /*
+             * In an implementation that includes the Security Extensions
              * TTBCR has additional fields PD0 [4] and PD1 [5] for
              * Short-descriptor translation table format.
              */
@@ -3628,55 +3630,23 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    /* Update the masks corresponding to the TCR bank being written
-     * Note that we always calculate mask and base_mask, but
-     * they are only used for short-descriptor tables (ie if EAE is 0);
-     * for long-descriptor tables the TCR fields are used differently
-     * and the mask and base_mask values are meaningless.
-     */
-    tcr->raw_tcr = value;
-    tcr->mask = ~(((uint32_t)0xffffffffu) >> maskshift);
-    tcr->base_mask = ~((uint32_t)0x3fffu >> maskshift);
-}
-
-static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    TCR *tcr = raw_ptr(env, ri);
-
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
         /* With LPAE the TTBCR could result in a change of ASID
          * via the TTBCR.A1 bit, so do a TLB flush.
          */
         tlb_flush(CPU(cpu));
     }
-    /* Preserve the high half of TCR_EL1, set via TTBCR2.  */
-    value = deposit64(tcr->raw_tcr, 0, 32, value);
-    vmsa_ttbcr_raw_write(env, ri, value);
-}
-
-static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    TCR *tcr = raw_ptr(env, ri);
-
-    /* Reset both the TCR as well as the masks corresponding to the bank of
-     * the TCR being reset.
-     */
-    tcr->raw_tcr = 0;
-    tcr->mask = 0;
-    tcr->base_mask = 0xffffc000u;
+    raw_write(env, ri, value);
 }
 
 static void vmsa_tcr_el12_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
-    TCR *tcr = raw_ptr(env, ri);
 
     /* For AArch64 the A1 bit could result in a change of ASID, so TLB flush. */
     tlb_flush(CPU(cpu));
-    tcr->raw_tcr = value;
+    raw_write(env, ri, value);
 }
 
 static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3780,15 +3750,15 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .writefn = vmsa_tcr_el12_write,
-      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
+      .raw_writefn = raw_write,
+      .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[1]) },
     { .name = "TTBCR", .cp = 15, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
-      .raw_writefn = vmsa_ttbcr_raw_write,
-      /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
-      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
-                             offsetof(CPUARMState, cp15.tcr_el[1])} },
+      .raw_writefn = raw_write,
+      .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tcr_el[3]),
+                             offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
 };
 
 /* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
@@ -3799,8 +3769,8 @@ static const ARMCPRegInfo ttbcr2_reginfo = {
     .access = PL1_RW, .accessfn = access_tvm_trvm,
     .type = ARM_CP_ALIAS,
     .bank_fieldoffsets = {
-        offsetofhigh32(CPUARMState, cp15.tcr_el[3].raw_tcr),
-        offsetofhigh32(CPUARMState, cp15.tcr_el[1].raw_tcr),
+        offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
+        offsetofhigh32(CPUARMState, cp15.tcr_el[1]),
     },
 };
 
@@ -5403,7 +5373,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
-      /* no .raw_writefn or .resetfn needed as we never use mask/base_mask */
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -5643,12 +5612,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL3_RW,
-      /* no .writefn needed as this can't cause an ASID change;
-       * we must provide a .raw_writefn and .resetfn because we handle
-       * reset and migration for the AArch32 TTBCR(S), which might be
-       * using mask and base_mask.
-       */
-      .resetfn = vmsa_ttbcr_reset, .raw_writefn = vmsa_ttbcr_raw_write,
+      /* no .writefn needed as this can't cause an ASID change */
+      .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
     { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8049c67f039..3261039d93a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2466,7 +2466,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             int r_el = regime_el(env, mmu_idx);
             if (arm_el_is_aa64(env, r_el)) {
                 int pamax = arm_pamax(env_archcpu(env));
-                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+                uint64_t tcr = env->cp15.tcr_el[r_el];
                 int addrtop, tbi;
 
                 tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-- 
2.25.1


