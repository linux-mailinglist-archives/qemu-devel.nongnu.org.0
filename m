Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED845048D0
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:12:36 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Nz-0004BC-I1
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xN-0001T8-Mu
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:05 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xK-0003S2-Sh
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:05 -0400
Received: by mail-pg1-x534.google.com with SMTP id bg9so14932516pgb.9
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9GROJ2XF7+CSyCmZaDichiw/5K3bO7LPiqj5yPTM2o=;
 b=TiJ/iHh+jx0A4f0aUVSWgh+fNcmuIZfwpS5D7JDnZ2AZp/mHW1sXqA814ap6ZQfI2C
 OviNEvii8EHqK7SaDXi2QnkNPIkmBFIRLskgQEeyTc3kOEuwbwjOEU3DsC4OGw4nR8W9
 eeG9IBP5+ZFzBMSDJ2DhL2p8KP5v7rAkjGk/IKzrv4hARZ2+35gf+tW+wDXq7lGSQK8/
 SnZlOdsiqWtjGUAdU/0YNUOIz5BjUgot2bHEecifCTS3E1scBG2xeZyzAz6q7uiSZ74C
 XRZJzLD44PVdYE5Gzx/I3vK29tWX3bqZKGpu+9kbgSd64XmygePzMOFvWC+ighkt7gMV
 rumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9GROJ2XF7+CSyCmZaDichiw/5K3bO7LPiqj5yPTM2o=;
 b=g2CcrnrmMX4TfDs1xIWgl/A9Zrzrxl0zQ5OoZncMpvJapQ/1tJviplWBH8sUTEgNM1
 LyWF9hk9qMqARUbyFJ6hl0QAc0daFy94CKR6CXl9KV+yuvRe5a9UbEXZcgIAkaFPKLU1
 Jovqv6ifA+5cDXwXLwwHfETL1NgCVWLy4U1ceJ4D6jPNsEO80dQ+G4MaMXoEh6pYNPa4
 eOTRRAa8FeAOjySQ6saW+stVMXoXmUBwuPDJfstDkV3X0UpcSN/QthhT+ep9s2y9gtkT
 EZRsxwA/dAj6NONHfQKedKZjTTzuGQ8GF+DXxOske4Cdl9s2LT1UJDbnIs4DnoJTMRvp
 8O/A==
X-Gm-Message-State: AOAM530AOU2vre1e93MnHedDenY7czOCphX9JAsh+/nATgTEzmhhDf3p
 TbW0G5k4nEhDmcNa7ngtQj9IRFK6KWo+Jg==
X-Google-Smtp-Source: ABdhPJxwcVXbBdDLXPGKreBVbeLJ48+OfCqWIJjjLxP1YNgioBZYQuVcahjAcS9+XAktClG7pf3Bog==
X-Received: by 2002:a05:6a00:23d2:b0:4fa:f262:719 with SMTP id
 g18-20020a056a0023d200b004faf2620719mr8494563pfc.4.1650217501473; 
 Sun, 17 Apr 2022 10:45:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/60] target/arm: Merge zcr reginfo
Date: Sun, 17 Apr 2022 10:44:03 -0700
Message-Id: <20220417174426.711829-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cc65ab887e..e762054b5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6132,35 +6132,22 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static const ARMCPRegInfo zcr_el1_reginfo = {
-    .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_no_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
-};
-
-static const ARMCPRegInfo zcr_el3_reginfo = {
-    .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
-    .writefn = zcr_write, .raw_writefn = raw_write
+static const ARMCPRegInfo zcr_reginfo[] = {
+    { .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
 void hw_watchpoint_update(ARMCPU *cpu, int n)
@@ -8240,15 +8227,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            define_one_arm_cp_reg(cpu, &zcr_el2_reginfo);
-        } else {
-            define_one_arm_cp_reg(cpu, &zcr_no_el2_reginfo);
-        }
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            define_one_arm_cp_reg(cpu, &zcr_el3_reginfo);
-        }
+        define_arm_cp_regs(cpu, zcr_reginfo);
     }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1


