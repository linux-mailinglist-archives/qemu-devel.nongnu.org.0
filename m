Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC2A51DECB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:13:08 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2Rv-00056c-NW
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2II-0005x2-0F
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:11 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IF-0003nu-BR
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:08 -0400
Received: by mail-oi1-x230.google.com with SMTP id e189so8276376oia.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=aRFI4zneLPQxf9CcVlLWt780H/tT5AIzROUd+wJ7HRYpF4o0jb4LclaNatwsKxk/12
 BKh6HpRag0rQY8QKEC94x2N6OkhO79gI9jfkGOuo1Veel7IIpL3FDlyqop5MHtL2gZol
 qvKx1k6UuuPHPgxka8GlpbEGtner8svwF5XNPQ3zcYL3lTvP3EVtFit0UUI2+fwKvCNM
 2frxtGejcZY8FBTpt73BRXzp31wOBFOVDzkoZP/1gkJoD3BPSqfKqXUIeIw3MJKrCaeL
 lW1ygSy8TkYGkAzklsrI86/cgSUe9ed8zHn2FF2vn1UZq+y13oGODUqik7ChKyFZDe4V
 yhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=c/hj7wr/E7GFnnrTThU/ps2SFNiqefHfjcl+um+2GoE5LOtBDf2x97mt0PKzjSIp04
 oMkqGuUS8CsDIogeM0Y5iWNGoWnAcRr3S5gNDoITIjPx/OhWSGVtQIdXLaRLzvH21sZW
 LgJcNAWB0v1d64OtDPjlCk7LyBbgF3ub1cmVIjpM2k0JtKzWd6d3yb2OI8hVp/18jcJW
 QEJUJaqQmU4Q+hY4vysy7L6si0Cmq4MJNqbZHKfq+wnNhz34vFCiGYYXXFsUPc7bRTDb
 Te/maKcHOQubTaVel/zG9uoL4M7cNlN6iiBPuGHJsfzqj6P5QUQnb60Hjpivz81X+MIG
 RiMQ==
X-Gm-Message-State: AOAM5332ZMq+wOY0yVLAOWqb/sz1hckaNZG9UAUTk0TN2+p3NUfQbOG3
 SbASlUkBZUYC+nOzelZjRq6irXh3NaddmEGM
X-Google-Smtp-Source: ABdhPJxdRWq7ecbRKyP6vrTfOwjddHo4vXhh9XtmoA8tuRxf200umIdlCZWhy1q7Jz7Os//ytYNhSQ==
X-Received: by 2002:a05:6808:1385:b0:325:efe5:b340 with SMTP id
 c5-20020a056808138500b00325efe5b340mr1923424oiw.249.1651860186658; 
 Fri, 06 May 2022 11:03:06 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 13/24] target/arm: Add minimal RAS registers
Date: Fri,  6 May 2022 13:02:31 -0500
Message-Id: <20220506180242.216785-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

Add only the system registers required to implement zero error
records.  This means that all values for ERRSELR are out of range,
which means that it and all of the indexed error record registers
need not be implemented.

Add the EL2 registers required for injecting virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Leave ERRSELR_EL1 undefined.
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca01f909a8..a55980d66d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -525,6 +525,11 @@ typedef struct CPUArchState {
         uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
         uint64_t gcr_el1;
         uint64_t rgsr_el1;
+
+        /* Minimal RAS registers */
+        uint64_t disr_el1;
+        uint64_t vdisr_el2;
+        uint64_t vsesr_el2;
     } cp15;
 
     struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b31c71980..37c5e42bc0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5980,6 +5980,87 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
 };
 
+/*
+ * Check for traps to RAS registers, which are controlled
+ * by HCR_EL2.TERR and SCR_EL3.TERR.
+ */
+static CPAccessResult access_terr(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_TERR)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_TERR)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t disr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        return env->cp15.vdisr_el2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return 0; /* RAZ/WI */
+    }
+    return env->cp15.disr_el1;
+}
+
+static void disr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        env->cp15.vdisr_el2 = val;
+        return;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return; /* RAZ/WI */
+    }
+    env->cp15.disr_el1 = val;
+}
+
+/*
+ * Minimal RAS implementation with no Error Records.
+ * Which means that all of the Error Record registers:
+ *   ERXADDR_EL1
+ *   ERXCTLR_EL1
+ *   ERXFR_EL1
+ *   ERXMISC0_EL1
+ *   ERXMISC1_EL1
+ *   ERXMISC2_EL1
+ *   ERXMISC3_EL1
+ *   ERXPFGCDN_EL1  (RASv1p1)
+ *   ERXPFGCTL_EL1  (RASv1p1)
+ *   ERXPFGF_EL1    (RASv1p1)
+ *   ERXSTATUS_EL1
+ * and
+ *   ERRSELR_EL1
+ * may generate UNDEFINED, which is the effect we get by not
+ * listing them at all.
+ */
+static const ARMCPRegInfo minimal_ras_reginfo[] = {
+    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
+      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
+    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_terr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
+};
+
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
@@ -8217,6 +8298,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_ssbs, cpu)) {
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
+    if (cpu_isar_feature(any_ras, cpu)) {
+        define_arm_cp_regs(cpu, minimal_ras_reginfo);
+    }
 
     if (cpu_isar_feature(aa64_vh, cpu) ||
         cpu_isar_feature(aa64_debugv8p2, cpu)) {
-- 
2.34.1


