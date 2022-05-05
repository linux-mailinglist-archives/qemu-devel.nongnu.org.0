Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA151C8E6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:23:28 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmh4S-0007OL-1k
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYU-0002dX-DE
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:26 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004NF-Ne
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:26 -0400
Received: by mail-oi1-x231.google.com with SMTP id j12so337895oie.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=ilBdOtWmaaU//pKM7FFsegWSpvRNjwDLc4z7U6l23Xp4eTcQQb967RGtHgV3UlIfCY
 HxJpInnH+n/03o8SXKeG++uH3iJ5taqcVP7u2CeQifybtfDAjvz8Nk4875XSqLvv4FJ0
 gbeb90wF/sUrb+rcr6va4fUDnXWrv3mhKjZSQcGvYamj6uoz6hrOarjhrMPeloM79vLJ
 jElxw0cazd4K5LZ7SljGLYhotpWBLyHNgzky7FP93tUAwDUajKcHxc438tmDvB7gBXwb
 lxcx4Mt/ByBRbRsYjb8WkcVXvbN1E8h5wq/qeda4buhghA7l+xKPG74RPMAA+SxI2LVg
 pYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=Q5ErUIVn2dFRFd93iejhZ647OhgTPv1QQNjm3bf4phcb3U3TFYyc43jHmNAOgQyZJQ
 B32j6M4TvXbcmsHCzyQi99q4a9lY4AG/+oMWVxsgRKMGlNtNtOz8eP3RY0pa43s3ZJHU
 Pyg1O1zl9U/XlqOvnEQsUkqxhktuRvxSM/ysYFwZenJ9iJe3hUCi1RkgXIlfhL1qMm9+
 zwaH5qSvESQsBTgg4bYfsC3eMm4Xfbj1YWPYA0rXf1SLOUWBLjJpOwQ4vQIC2y2k5LWk
 88LprIgu1xvyBJlJVd9VPxWfHk8PjUMgi1N5p3uuRj/0UDAia3c9WqI4cihkrakcdf0W
 cAnA==
X-Gm-Message-State: AOAM5324/29n40B8mvVViVcMKx+mzMUBo3BDlJmcR40sHV1OqNfz9MEK
 AHu1M0lbANLKdYqXnzkdQ0fzc6K4902dlWSB
X-Google-Smtp-Source: ABdhPJzjEavGJbfQZS4sCZ/UjiBj7ffmNiOeRDHjVZsMlsy/XiIpsGhiZyqYz7bzoSBAOZH+Nn5F6g==
X-Received: by 2002:a05:6808:56b:b0:325:9f5e:3fd4 with SMTP id
 j11-20020a056808056b00b003259f5e3fd4mr3227705oig.199.1651776612848; 
 Thu, 05 May 2022 11:50:12 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/24] target/arm: Merge zcr reginfo
Date: Thu,  5 May 2022 13:49:45 -0500
Message-Id: <20220505185006.200555-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ea2788b3d5..72d05070f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6122,35 +6122,22 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -8233,15 +8220,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.34.1


