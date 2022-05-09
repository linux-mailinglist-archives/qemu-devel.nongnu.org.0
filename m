Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A851FC2B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:06:55 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2AA-0007Uv-Jl
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22S-00071t-Cj
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Q-0001Gm-Ak
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so19134476wrb.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AMHYpqYyVexl/KQxM32vgi111AbDDgBeiFSwyB6v1qY=;
 b=z2c3usWgNkj0IeuV9S3gCwit8cc13I3mZ6oaR8q4zBGP1Fiy0AEpL97X9a6gPlLACc
 qTdLg3FoLaPVLcTPDbRCKebFbFUN98CaxMEBSgniqYjOK+fUk888HkPMU09eFlDpjCpc
 c8Kyeo6X0noZYTDC+EwBoVqOhITg8MugspwiNZS25jGj9YJl2u4pdGTVEGKtMpsKu6Mb
 wqw/l3JI1xMz+GugZZ2GUAk5DAOWD7MYymSdBAJ/sDOm6Q34suCkECr5iNsXoohatq8w
 L3JBGfFdF4E1n3/jgVMGcBD482b9Yijjm63TXrkxWrEfV/AtbFHnfFzJFTGtP7ImZcZ4
 S3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMHYpqYyVexl/KQxM32vgi111AbDDgBeiFSwyB6v1qY=;
 b=IDWZWqcvzi3/I9mRE6pxBRqRo9XA6T1B4Zwp4ET2Qm87EIOync764Bja7MfQKAxdqh
 K2+7Ztg6G8Kla6aOYYv1fUb4tdTPQUaf/tXKeXtnS74YYCWiwH0y1HxNK8RmUMHrKyBG
 6BsMpfYYT7gGygDO2XxfBNJAGbAZig+1JOAj9h1CwO1qCh9X7aQGl4nzKmG7zB2LTP2L
 0z1WxwS0pyEdIQBo7T3qFuK8xdE4XRCMyyp+QU4WTOdGN0bsnL5TfK/YMh2aCOatk/fK
 FfK/wCGDw5riOliJyw6o7TsZ3iIa7Dhq69AvweOec+fdIwB2BhcowXnrCS+9fKbBYmT1
 amTg==
X-Gm-Message-State: AOAM53304TYNXh1wO8PXZua7qAnovY0GnHTGaeePSw5OF/VCjHfJWKKO
 tP2ia3UBvA67r06lgY5LZxyvEi/XAHhv4A==
X-Google-Smtp-Source: ABdhPJxMDADuwXZYygM1QeSlWj+sV9LdFUgKLipfUx1vwbYa3j6pGMRfOvfm6QTvjGu5h3vN+M/jjg==
X-Received: by 2002:adf:f748:0:b0:20c:86d5:c343 with SMTP id
 z8-20020adff748000000b0020c86d5c343mr13628104wrp.477.1652097532797; 
 Mon, 09 May 2022 04:58:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/32] target/arm: Drop EL3 no EL2 fallbacks
Date: Mon,  9 May 2022 12:58:19 +0100
Message-Id: <20220509115848.3521805-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo, and the local
vpidr_regs definition, and rely on the squashing to ARM_CP_CONST
while registering for v8.

This is a behavior change for v7 cpus with Security Extensions and
without Virtualization Extensions, in that the virtualization cpregs
are now correctly not present.  This would be a migration compatibility
break, except that we have an existing bug in which migration of 32-bit
cpus with Security Extensions enabled does not work.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 158 ++++----------------------------------------
 1 file changed, 13 insertions(+), 145 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9ab8b65e7bc..ea2788b3d53 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5099,124 +5099,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
 };
 
-/* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
-static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
-    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
-      .access = PL2_RW,
-      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
-    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "MAIR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "AFSR1_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "VTCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 6, .crm = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "SCTLR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "TPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHCTL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTVOFF_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 0, .opc2 = 3,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTVOFF", .cp = 15, .opc1 = 4, .crm = 14,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHP_CVAL_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTHP_CVAL", .cp = 15, .opc1 = 6, .crm = 14,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHP_TVAL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTHP_CTL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .accessfn = access_tda,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_CONST,
-      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .resetvalue = 0 },
-};
-
-/* Ditto, but for registers which exist in ARMv8 but not v7 */
-static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
-    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-};
-
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -7902,7 +7784,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
     }
-    if (arm_feature(env, ARM_FEATURE_EL2)) {
+
+    /*
+     * Register the base EL2 cpregs.
+     * Pre v8, these registers are implemented only as part of the
+     * Virtualization Extensions (EL2 present).  Beginning with v8,
+     * if EL2 is missing but EL3 is enabled, mostly these become
+     * RES0 from EL3, with some specific exceptions.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL2)
+        || (arm_feature(env, ARM_FEATURE_EL3)
+            && arm_feature(env, ARM_FEATURE_V8))) {
         uint64_t vmpidr_def = mpidr_read_val(env);
         ARMCPRegInfo vpidr_regs[] = {
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
@@ -7946,33 +7838,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
-    } else {
-        /* If EL2 is missing but higher ELs are enabled, we need to
-         * register the no_el2 reginfos.
-         */
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            /* When EL3 exists but not EL2, VPIDR and VMPIDR take the value
-             * of MIDR_EL1 and MPIDR_EL1.
-             */
-            ARMCPRegInfo vpidr_regs[] = {
-                { .name = "VPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-                  .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
-                  .type = ARM_CP_CONST, .resetvalue = cpu->midr,
-                  .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
-                { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-                  .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
-                  .type = ARM_CP_NO_RAW,
-                  .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
-            };
-            define_arm_cp_regs(cpu, vpidr_regs);
-            define_arm_cp_regs(cpu, el3_no_el2_cp_reginfo);
-            if (arm_feature(env, ARM_FEATURE_V8)) {
-                define_arm_cp_regs(cpu, el3_no_el2_v8_cp_reginfo);
-            }
-        }
     }
+
+    /* Register the base EL3 cpregs. */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         define_arm_cp_regs(cpu, el3_cp_reginfo);
         ARMCPRegInfo el3_regs[] = {
-- 
2.25.1


