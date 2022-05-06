Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7212B51DEA9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:09:27 +0200 (CEST)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2OM-0006EJ-Gr
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I0-0005Ar-Uu
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:52 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hy-0003nt-6j
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:52 -0400
Received: by mail-oi1-x236.google.com with SMTP id m25so8306404oih.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptjDtEiLpCOaJ8VQ+D/jSFXKE6U8bdHxVPiUtMKZSjQ=;
 b=RCLVnvVdeGE9SNiAUiPdIaxXVU/ZrlMx9d5Pyp+3jquH2YDaWL87V1AnUvobolCKmH
 EY92UbqDvG391Of07UVOlKb5U7n53Pc8HL8Vf7nW16vfwvq3ROrcvRrEoIQdRwOi8wpB
 7gYI90CNzTIAty2H/cw7r8zpVYMRepdg4jAxk4Vk2vyNwfzApxXuJJIbVulY5lC14M5v
 eTTiosrpIY3uYH8RVu19ryI6tutxZg9o9FVxPjlHwKVq2Q6y9yHad3m7AktHGR6F2LTk
 yLXCJ4a7AVimLwtUamnZzKr2Cx4d4pAhKp+A8yEqdQCp9TQ7J3v3d6JnStps/pUOOGx6
 5xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptjDtEiLpCOaJ8VQ+D/jSFXKE6U8bdHxVPiUtMKZSjQ=;
 b=ZXyxgF4xtDzpiWOdb/NcOuXMnPMXXYTJo4+vKQGwr9Ezh7LGTqHOJ+w0r8CuQt2V3O
 ZezefzCokpx7vh0P6qi4GQbna20MjGtr7XgsiA642vUWBKh+durC2e1UKPMfzPpseZoK
 ifGDuTNmPYU8QjcIdf8QSGwkdPBCxDV+WCx46m3EHn6zN/8uF0hfu7bxT2oMWNW+WHLE
 gw/mztvDqHIs9tIwJTLfPcUXeQTj0erYd1QMN9gkD01QP0oXs3yUwbaTECv02O4jWSiI
 SWu+2KRV6DKf6YfhTyTRxHwJ9fZ1+s+ZzkyuuPW1RWWD3oSdFcoHlFWpBA3VbQmOSEEa
 Z+Sw==
X-Gm-Message-State: AOAM532ck2HMEmdwQRSJpcqihRkHDQRlVKrf2Fx+Gzp3gPw5OtpUbuXx
 uXZ3lSGfPYo1FlvqsO6NgK1zeK4EFYtKfg==
X-Google-Smtp-Source: ABdhPJyX7zviMAo8qcd1AVgAzRb1aJcOOPI9lWgjUTJqeXgXr5qjOYLmKa5tKYYY0Q38WO5dmAo0Zw==
X-Received: by 2002:aca:1817:0:b0:2ec:f542:c96c with SMTP id
 h23-20020aca1817000000b002ecf542c96cmr2097123oih.36.1651860169421; 
 Fri, 06 May 2022 11:02:49 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 02/24] target/arm: Drop EL3 no EL2 fallbacks
Date: Fri,  6 May 2022 13:02:20 -0500
Message-Id: <20220506180242.216785-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
---
 target/arm/helper.c | 158 ++++----------------------------------------
 1 file changed, 13 insertions(+), 145 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9ab8b65e7b..ea2788b3d5 100644
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
2.34.1


