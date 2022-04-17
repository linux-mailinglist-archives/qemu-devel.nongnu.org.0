Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA045048EE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:32:31 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9hH-0000sD-0c
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xO-0001Up-57
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xK-0003RR-7V
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:05 -0400
Received: by mail-pg1-x52a.google.com with SMTP id k14so14987254pga.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejRoUXpC9pNdpYPEkTcVE2TTGW1PPspJDDIBjsGqdiY=;
 b=TAaqPBvrORxDPELRwR1iQbWOef+kBL+uSVObm9hvkQ4J+5EkNRxtuEP3U0YnBtVj7u
 RGj15rLxFPGSjESNSYc7u4aun0q1np7JvN3TNXZZdCtMSgnk9AdS67LaRroc1SAIYEQH
 3IDJhk/TqjUViY+3AeCPYHYjvdD9/fw3P6tonRPHnfqtIOajdjf3MqBmD41ZYlKA9niw
 Qa9cxyliN+pEAiZ6842tMdfTXq/8b3hx818rJnMKoAFjHOKPluDgY3jbxqPJPssqtII6
 yv4DodSPbMfbuOx2MR+t/h0ybuaiY83yWnuGvMkhlUnjzM3+UjXBVfL+UACfOPgWo7JX
 Nq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejRoUXpC9pNdpYPEkTcVE2TTGW1PPspJDDIBjsGqdiY=;
 b=Q2v/JAgNrG+uTXbqxHbQl3VCbtRTr4XcRsGyeCjX91HRQ7Yanoci7+8fIdnVGDkMq6
 HEkVMLxVNk2tInub8N0oVmQw/Gnu1yuV9t+/GIDz7vtrxGzIbdn1OgSr2GdT+Lr4kUEa
 lN2zIwcb3v+1uoxdBSsHV0VftoAN8+pNyF1VAO3CRfqqvegFJXW4/kUi1Pak7onmd205
 05DwJsB3GjkdCVNlgt2HUwavzD1suyUCs+RnKkC+T4R72c4SYV064C8SAL4IwL4IvJPp
 Z4U5bisua7wF67oK5fyW65Z5WMr514hAtSeQpV91xxyVwp6hql5yKrXJtshCy06kGO3t
 eerw==
X-Gm-Message-State: AOAM531u3iZ3qWeIHHe5cdNzU/LOOF/xllIH7Qe5iHhbCnTih9HzAi5b
 IEvIWfQxQhy9ExxOw8hgkMEonaz19gVL7w==
X-Google-Smtp-Source: ABdhPJww9boLMkfgZn+2v4MJlO49TFDh8FDMDfRXILaRoPXQcVCHoQnH0HuzuyXU2d9bB41CXE+CQw==
X-Received: by 2002:a63:f642:0:b0:386:53e:9cd4 with SMTP id
 u2-20020a63f642000000b00386053e9cd4mr6990379pgj.265.1650217500650; 
 Sun, 17 Apr 2022 10:45:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 36/60] target/arm: Drop EL3 no EL2 fallbacks
Date: Sun, 17 Apr 2022 10:44:02 -0700
Message-Id: <20220417174426.711829-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo,
and the local vpidr_regs definition, and rely on the
squasing to ARM_CP_CONST while registering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 158 ++++----------------------------------------
 1 file changed, 13 insertions(+), 145 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9837b5bd2..cc65ab887e 100644
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
@@ -7912,7 +7794,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -7953,33 +7845,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


