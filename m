Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28756063EF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:14:03 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXF9-0006Uy-Lc
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:13:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXE1-0002Ld-GG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYk-0001Ko-6S
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:04 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYh-0000ys-DB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bv10so34050522wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DNvu1PA9TfawtozW+0/g94EAn9Es1trWOaFjVC+j1FQ=;
 b=MBWxi8O12g2fSxa+Pi7iRgM6MXqEoFOkm930dPM1MrNSRGos0vTxuSx5d1hy6AnFxY
 wfpCYt5CqgcnA5b575O6+luoB7nWAiRdHzB+qEoQgQMcipXqvSki+I6x5wFXQKakAFw9
 uIQYbNy1e+rTfwLLPvFU4SGF0epn0qRQMsSDb+ysg3ujnCyiYpOMIUDVWHL4fynsU/vF
 0tEGbiz98f+003rhgbULbnqcYxZey1X0MV1CbtYhHhP9AVjzvmaV5wwJlqq1i/grndz6
 Rlu/5PNO7yEe2fadvTGnn60q2QKLCu73GeNyDqefmeqIfE3/qLy3pUkGgwvn5GoRfXC0
 b6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNvu1PA9TfawtozW+0/g94EAn9Es1trWOaFjVC+j1FQ=;
 b=kPMsXQwGPqpAtGdDyszzLVYvzYd+bga1Y/IR1MrBMvn4+Ni72jJ6TVBM0+VwXbTWwZ
 AXDGCVsdCaxzPAO2F45cIWoikAMACpOQoYRhlkDrT48Gowuq6457TxJgvDeTX/RNhQ/c
 +4qo9bsrBO0CoN7ZrH13JaDrGsGqaAAL6r/6Waq7cFMpuJFJTTN9nIyOaWr9vl0NuQpj
 ViEEpPqoZyylbvKDWRk1YpNqTc99BMSDP7pWhWf4fFtH41uCkdjPklf2ud2EK+CAvcyz
 ddopTrvgrmY7IR0j/m01Jr9Qff1RK3KQu+3nywnJGhQFsZdZDfEeEfeS1zcPgnazfmr9
 0Cgg==
X-Gm-Message-State: ACrzQf2s97icGyB5uRAyHULAAP+ikNqzI5w5Jg7YhsoWOOeCQ+xmyHrr
 FIi/tZudojsQm2KjFdFMoKyM07u1/rFHOQ==
X-Google-Smtp-Source: AMsMyM7ovc0JorQ0wpDRY9ezoKcSyVUpl5R/0Nsp1wsB/+mOUWcjQqqwn194Pro+ItUpCvdwrQ70Tw==
X-Received: by 2002:a5d:46c6:0:b0:22e:4b9a:3f02 with SMTP id
 g6-20020a5d46c6000000b0022e4b9a3f02mr8417909wrs.516.1666268517819; 
 Thu, 20 Oct 2022 05:21:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
Date: Thu, 20 Oct 2022 13:21:29 +0100
Message-Id: <20221020122146.3177980-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
Flush the tlb when invalidating stage 1+2 translations.  Re-use
alle1_tlbmask() for other instances of EL1&0 + Stage2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221011031911.2408754-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h |   2 +-
 target/arm/cpu.h       |  23 ++++---
 target/arm/helper.c    | 151 ++++++++++++++++++++++++++++++-----------
 3 files changed, 127 insertions(+), 49 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index a5b27db2751..b7bde189860 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 10
+#define NB_MMU_MODES 12
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b185f39bf5b..315c1c2820c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2906,8 +2906,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
  * Physical (NS & S)
+ * Stage2 (NS & S)
  *
- * for a total of 10 different mmu_idx.
+ * for a total of 12 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2976,6 +2977,15 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
     ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
 
+    /*
+     * Used for second stage of an S12 page table walk, or for descriptor
+     * loads during first stage of an S1 page table walk.  Note that both
+     * are in use simultaneously for SecureEL2: the security state for
+     * the S2 ptw is selected by the NS bit from the S1 ptw.
+     */
+    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
@@ -2983,15 +2993,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    /*
-     * Not allocated a TLB: used only for second stage of an S12 page
-     * table walk, or for descriptor loads during first stage of an S1
-     * page table walk. Note that if we ever want to have a TLB for this
-     * then various TLB flush insns which currently are no-ops or flush
-     * only stage 1 MMU indexes will need to change to flush stage 2.
-     */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3022,6 +3023,8 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(E3),
+    TO_CORE_BIT(Stage2),
+    TO_CORE_BIT(Stage2_S),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dde64a487ae..18c51bb7774 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -399,6 +399,21 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static int alle1_tlbmask(CPUARMState *env)
+{
+    /*
+     * Note that the 'ALL' scope must invalidate both stage 1 and
+     * stage 2 translations, whereas most other scopes only invalidate
+     * stage 1 translations.
+     */
+    return (ARMMMUIdxBit_E10_1 |
+            ARMMMUIdxBit_E10_1_PAN |
+            ARMMMUIdxBit_E10_0 |
+            ARMMMUIdxBit_Stage2 |
+            ARMMMUIdxBit_Stage2_S);
+}
+
+
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
@@ -501,10 +516,7 @@ static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx(cs,
-                        ARMMMUIdxBit_E10_1 |
-                        ARMMMUIdxBit_E10_1_PAN |
-                        ARMMMUIdxBit_E10_0);
+    tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
 }
 
 static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -512,10 +524,7 @@ static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                        ARMMMUIdxBit_E10_1 |
-                                        ARMMMUIdxBit_E10_1_PAN |
-                                        ARMMMUIdxBit_E10_0);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, alle1_tlbmask(env));
 }
 
 
@@ -554,6 +563,24 @@ static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                              ARMMMUIdxBit_E2);
 }
 
+static void tlbiipas2_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = (value & MAKE_64BIT_MASK(0, 28)) << 12;
+
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_Stage2);
+}
+
+static void tlbiipas2is_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = (value & MAKE_64BIT_MASK(0, 28)) << 12;
+
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, ARMMMUIdxBit_Stage2);
+}
+
 static const ARMCPRegInfo cp_reginfo[] = {
     /* Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
@@ -3786,13 +3813,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /*
      * A change in VMID to the stage2 page table (Stage2) invalidates
-     * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
+     * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        uint16_t mask = ARMMMUIdxBit_E10_1 |
-                        ARMMMUIdxBit_E10_1_PAN |
-                        ARMMMUIdxBit_E10_0;
-        tlb_flush_by_mmuidx(cs, mask);
+        tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
         raw_write(env, ri, value);
     }
 }
@@ -4313,18 +4337,6 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static int alle1_tlbmask(CPUARMState *env)
-{
-    /*
-     * Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
-    return (ARMMMUIdxBit_E10_1 |
-            ARMMMUIdxBit_E10_1_PAN |
-            ARMMMUIdxBit_E10_0);
-}
-
 static int e2_tlbmask(CPUARMState *env)
 {
     return (ARMMMUIdxBit_E20_0 |
@@ -4467,6 +4479,43 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_E3, bits);
 }
 
+static int ipas2e1_tlbmask(CPUARMState *env, int64_t value)
+{
+    /*
+     * The MSB of value is the NS field, which only applies if SEL2
+     * is implemented and SCR_EL3.NS is not set (i.e. in secure mode).
+     */
+    return (value >= 0
+            && cpu_isar_feature(aa64_sel2, env_archcpu(env))
+            && arm_is_secure_below_el3(env)
+            ? ARMMMUIdxBit_Stage2_S
+            : ARMMMUIdxBit_Stage2);
+}
+
+static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = ipas2e1_tlbmask(env, value);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    } else {
+        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
+    }
+}
+
+static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = ipas2e1_tlbmask(env, value);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+}
+
 #ifdef TARGET_AARCH64
 typedef struct {
     uint64_t base;
@@ -4652,6 +4701,20 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
 
     do_rvae_write(env, value, ARMMMUIdxBit_E3, true);
 }
+
+static void tlbi_aa64_ripas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     uint64_t value)
+{
+    do_rvae_write(env, value, ipas2e1_tlbmask(env, value),
+                  tlb_force_broadcast(env));
+}
+
+static void tlbi_aa64_ripas2e1is_write(CPUARMState *env,
+                                       const ARMCPRegInfo *ri,
+                                       uint64_t value)
+{
+    do_rvae_write(env, value, ipas2e1_tlbmask(env, value), true);
+}
 #endif
 
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4930,10 +4993,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1is_write },
     { .name = "TLBI_IPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1is_write },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -4944,10 +5009,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_IPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1_write },
     { .name = "TLBI_IPAS2LE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1_write },
     { .name = "TLBI_ALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -5028,16 +5095,20 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbimva_hyp_is_write },
     { .name = "TLBIIPAS2",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_hyp_write },
     { .name = "TLBIIPAS2IS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2is_hyp_write },
     { .name = "TLBIIPAS2L",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_hyp_write },
     { .name = "TLBIIPAS2LIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2is_hyp_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
@@ -6694,10 +6765,12 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1is_write },
     { .name = "TLBI_RIPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 6,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1is_write },
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
@@ -6708,10 +6781,12 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
-      .access = PL2_W, .type = ARM_CP_NOP },
-   { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1_write },
+    { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 6,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1_write },
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-- 
2.25.1


