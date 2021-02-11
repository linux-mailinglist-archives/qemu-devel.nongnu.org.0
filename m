Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBABE318BE8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:23:15 +0100 (CET)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABwA-0001LP-Vd
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYr-0007r9-4x
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYn-0008K0-S9
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id n6so4072225wrv.8
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JYi1J+pSxxdr5OmGrLhfG7W3WTtQ7/vYCTvWo3PWr+o=;
 b=Vk9KFBVkX4AmLdPrKaVl5vCW9nBSuFu/NNe9Qk0t4Ctd7IN/uWRDVVE3vzXd0k9eYJ
 JcCWioUFJwrgfOLEmOGD1/3paxVZoJIs6u937lsujMRg5WIEhIGp8arQt3H34+8pT74K
 FXb8nXze/+bJSdnehrgus3nh6UDvXcxXio3fau/Tz55dbXThzgXzqiDPcmzBNcyauSVB
 92UcNfEdTVbI85svwCPS2/3gMfDg0jwd6uKhFmzE9vfN8ooR6WZc+0DvM/zncqvCKace
 F8nuuKWEijkuJyHY+MzT4d1bokazhlHJ3wipuI3/r8f6en3wgWXZtLEfve65gub2FUQ+
 bqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JYi1J+pSxxdr5OmGrLhfG7W3WTtQ7/vYCTvWo3PWr+o=;
 b=m9ZiO7ojfeQXgU0Q+DKNnsteamRUOOHR4EPw+HNcrPjUFzYr4YutiRULxrvjrwpqZo
 MpfCkD58e3EaQDsqeDWwMPsQQbo3IYg1uJtdneDPwN771NzGlqI44V3okPd81LnsMNLp
 s8VaVQTpVoctBhFDAFRkjYz5k22UvWhmn/VRhvpDJga6OziU9bUaeJpp2MlqhQK8RrHO
 ZfbLLKcWGeuJjuqrHMUCtAnUPznA7M7xgO2bVxGTQhtCU47M1WeWE+qfmBx3YMROeLju
 aw4J3ck1Zen7LFZZ/N2Ry2HWcw1ulCTVrsK6KtHYNGSYqWLgjrsjgG1ew3MbDUilZeWg
 QfoA==
X-Gm-Message-State: AOAM530y2qtE3XlMGEf5hqe4Fjxwz84tK33HBnCDg3O/zCLE2oIguZ5J
 NieMUwAQ3QjhCRMgD+5M5tWiPKYd5Q9VQg==
X-Google-Smtp-Source: ABdhPJyst8yslT4QkvrkCEs9C513cguwxgsC8jMslUtpR+SncKsoW9IqEpaYSt/34gLG+c0jach6Bw==
X-Received: by 2002:adf:8104:: with SMTP id 4mr5559344wrm.265.1613048344041;
 Thu, 11 Feb 2021 04:59:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/45] target/arm: Fix SCR RES1 handling
Date: Thu, 11 Feb 2021 12:58:17 +0000
Message-Id: <20210211125900.22777-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>

The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
to 1 only when there is no support for AArch32 at EL1 or above.

The reset value will be 0x30 only if the CPU is AArch64-only; if there
is support for AArch32 at EL1 or above, it will be reset to 0.

Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
is supported at EL1 or above.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d080239863c..39633f73f36 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4033,6 +4033,11 @@ static inline bool isar_feature_aa64_aa32(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL0) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a64bd748ce..51330a0c489 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2024,7 +2024,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (ri->state == ARM_CP_STATE_AA64) {
-        value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
+                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
+        }
         valid_mask &= ~SCR_NET;
 
         if (cpu_isar_feature(aa64_lor, cpu)) {
@@ -2063,6 +2066,15 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     raw_write(env, ri, value);
 }
 
+static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * scr_write will set the RES1 bits on an AArch64-only CPU.
+     * The reset value will be 0x30 on an AArch64-only CPU and 0 otherwise.
+     */
+    scr_write(env, ri, 0);
+}
+
 static CPAccessResult access_aa64_tid2(CPUARMState *env,
                                        const ARMCPRegInfo *ri,
                                        bool isread)
@@ -5785,7 +5797,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
-      .resetvalue = 0, .writefn = scr_write },
+      .resetfn = scr_reset, .writefn = scr_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.20.1


