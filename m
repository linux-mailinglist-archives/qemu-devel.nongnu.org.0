Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B831551DEA5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:08:00 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2Mx-00038k-Q6
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I4-0005Ne-LG
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:56 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I2-0003qy-Jd
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:56 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso5407097otr.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RP7uxMyjyjVvNPdZI9ZcRwKJ1kV5jw0hdIhEr9Ry6LU=;
 b=m+rkv4PzkNdVHUyOisQWvBCRsUi4FRoADJA6lYX2PJr2S5rCPCT5l94cwGCAKR4YNd
 F2uGYLPoAU85+vbNQ7ugLSfeSNZbaNqEC5mf4+IwUTDlGNMDHlKtmzeblU32Hk/Om1cg
 4zAN97xglXt0q/xiH+NGMICx0BIBmCIMGpkDenJuOaHdSC3AhJQO1S5W1WGv51fQ+eVM
 GlwT+uDdVCk/DUjco/3ZFQl7vk3NscertbsURpHAgj8apXV+Li9Z86X+7xnqOFLXZyJh
 Ux15EJeKijZ3FhgCOXA/2Gxs3mlkcdhVSD6KpNsWdYihhzT7Ii1lxlDuQKQRH5t6qhWX
 oCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RP7uxMyjyjVvNPdZI9ZcRwKJ1kV5jw0hdIhEr9Ry6LU=;
 b=irUtTB/n2h/uym4z3eH5ZGxxpo15fP6bS/5kLLMYZD2HzF2JHQ7JzgYsZ2ryoE9ycP
 hnbpCjEOfpAHuRe8tZiyo12gTyi/AiUP2Z4kI1jhUXann/eZrCsdEMFYHALNoN6sd7bv
 BcznajDAapVFvW7eDS//dq+3b3WMxGml/a2cfC4S7OEPnn8tnSfulLtN+2EdFeUbLsvH
 uLrNj5KAiQCleQBmi8ES1YlOXNpaLCya3o9wsoh353/d5qEDbljw8QyptAIN0gqeh+aO
 TZPTl74O5baYN9k7YDS8QlBOkZEY+p+Eu30y/L3ENxoh831h0dunvecEOt/nFSjr4/ap
 8zTQ==
X-Gm-Message-State: AOAM533RpDjlBvMJuexH2GpG3XwKapkxO0BX8Eawme2olJ9QWoOQ0nd0
 wgqcz5EJVKuNO0csc17OAmOIRc2XBfSXscoU
X-Google-Smtp-Source: ABdhPJzvV5Kd5bgDeFUxSjRes9IoHacISsGD/A4YRVfSEcSUSYyIvhhUx6A8JflNA/sFa2zHXiOCag==
X-Received: by 2002:a9d:68cb:0:b0:605:f1c9:991d with SMTP id
 i11-20020a9d68cb000000b00605f1c9991dmr1477619oto.345.1651860173282; 
 Fri, 06 May 2022 11:02:53 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 05/24] target/arm: Move cortex impdef sysregs to cpu_tcg.c
Date: Fri,  6 May 2022 13:02:23 -0500
Message-Id: <20220506180242.216785-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

Previously we were defining some of these in user-only mode,
but none of them are accessible from user-only, therefore
define them only in system mode.

This will shortly be used from cpu_tcg.c also.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: New patch.
---
 target/arm/internals.h |  6 ++++
 target/arm/cpu64.c     | 64 +++---------------------------------------
 target/arm/cpu_tcg.c   | 59 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 60 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 255833479d..343b465d51 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1307,4 +1307,10 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
 #endif
 
+#ifdef CONFIG_USER_ONLY
+static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
+#else
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
+#endif
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c841d55d0e..33a0a71900 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,65 +34,9 @@
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
-#include "cpregs.h"
+#include "internals.h"
 
 
-#ifndef CONFIG_USER_ONLY
-static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    /* Number of cores is in [25:24]; otherwise we RAZ */
-    return (cpu->core_count - 1) << 24;
-}
-#endif
-
-static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = a57_a53_l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-    { .name = "L2CTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = a57_a53_l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-#endif
-    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ECTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR",
-      .cp = 15, .opc1 = 0, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUECTLR",
-      .cp = 15, .opc1 = 1, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUMERRSR",
-      .cp = 15, .opc1 = 2, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2MERRSR",
-      .cp = 15, .opc1 = 3, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-};
-
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -143,7 +87,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 static void aarch64_a53_initfn(Object *obj)
@@ -196,7 +140,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 static void aarch64_a72_initfn(Object *obj)
@@ -247,7 +191,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9338088b22..d078f06931 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -20,6 +20,65 @@
 #endif
 #include "cpregs.h"
 
+#ifndef CONFIG_USER_ONLY
+static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Number of cores is in [25:24]; otherwise we RAZ */
+    return (cpu->core_count - 1) << 24;
+}
+
+static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
+    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2CTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ECTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR",
+      .cp = 15, .opc1 = 0, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUECTLR",
+      .cp = 15, .opc1 = 1, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUMERRSR",
+      .cp = 15, .opc1 = 2, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2MERRSR",
+      .cp = 15, .opc1 = 3, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+};
+
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+}
+#endif /* !CONFIG_USER_ONLY */
+
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-- 
2.34.1


