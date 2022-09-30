Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75895F0CCD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:53:48 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGSZ-00071s-NG
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAr-0000Lq-4Z
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAf-0006Td-KA
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so5050202wma.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=73I/YN0PohfN/LqwegA1J/BEgnb2qX8LZ5lHJjg4/5M=;
 b=eHwEFu3esV1/kGkXdAd0JUt3YzZ/nRMkSZXGloMvmZrksYcJUSiaxGPejnxYkzqJtz
 0BxCU1cdpx5KSKfYiF1Jp209m6xzuEH1Cr8wj4rOvfY1WBgDFYaiMWmS+eFnt9XOjOv4
 6y8glS9llj/HHtEcOo6Io3vJJHWqhDr5atxc8B7p404C7gVHhVGmh/56oiuEFLczvFHk
 3itvkTVCd9SJlCQGVaZAIpSgcX3aeANl0CBLap9sil4eOcrI92UcLPwEpPTUXgmLDOIC
 ieOAubo9TjtI5CqmgqAxSvGvp2hEdUCxuDKIWi4DbIT0yvJFTSclZB+Jev6TCsxXnwuJ
 bGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=73I/YN0PohfN/LqwegA1J/BEgnb2qX8LZ5lHJjg4/5M=;
 b=xU0GViN+/UxkhT3WiIzieOUKYP5H29Yu9AScHlKzB7Xb+Y8nF54HDI3tSPfIyDLrEt
 iRBu5m/FL326RV75bUvQHk96NWTKZCfIZEBgH0kpUCFjk/lkbm71rG0zNBW6U3KMwpLS
 OUWnNcBLiQLq/QC9NELvbqt6xpF5VUoupDbFA0CynH5QST3sB6BqixnSsPfItS2beGwE
 QFEdyjeSHtqKwlw7iF5aBEMY9WOp2bXIsI9cZ79/DY0KwOVOR8LWmF8Kb8ITJRpV6kZx
 ZEuV1ndC8DpR6diSqfP1hTLO+820PGlIEfjfK1r6L8qdQtNpFxpOuDmwPyt2gX+HDvgZ
 zIrA==
X-Gm-Message-State: ACrzQf2JMEscsnHCeq3+Y+UppMHNFmMEpXl63+NQVN/tPw/AdOJipEWw
 6afczj6NQqTHXByTjKtF6bivl79qineB3Q==
X-Google-Smtp-Source: AMsMyM6pJQFkIjmUTe1SZtrn1e1PT276kbL0J5NYfdqgIDm0cPMx6SDCPk2DN3/S/aSxASpqOo3BgQ==
X-Received: by 2002:a7b:c3c8:0:b0:3b4:7279:c2c2 with SMTP id
 t8-20020a7bc3c8000000b003b47279c2c2mr6062202wmj.186.1664544915942; 
 Fri, 30 Sep 2022 06:35:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] target/arm: Make writes to MDCR_EL3 use PMU start/finish
 calls
Date: Fri, 30 Sep 2022 14:35:03 +0100
Message-Id: <20220930133511.2112734-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

In commit 01765386a88868 we fixed a bug where we weren't correctly
bracketing changes to some registers with pmu_op_start() and
pmu_op_finish() calls for changes which affect whether the PMU
counters might be enabled.  However, we missed the case of writes to
the AArch64 MDCR_EL3 register, because (unlike its AArch32
counterpart) they are currently done directly to the CPU state struct
without going through the sdcr_write() function.

Give MDCR_EL3 a writefn which handles the PMU start/finish calls.
The SDCR writefn then simplfies to "call the MDCR_EL3 writefn after
masking off the bits which don't exist in the AArch32 register".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220923123412.1214041-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fadeed0b6bb..24c592ffef8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4756,8 +4756,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                       uint64_t value)
+static void mdcr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
 {
     /*
      * Some MDCR_EL3 bits affect whether PMU counters are running:
@@ -4769,12 +4769,19 @@ static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (pmu_op) {
         pmu_op_start(env);
     }
-    env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+    env->cp15.mdcr_el3 = value;
     if (pmu_op) {
         pmu_op_finish(env);
     }
 }
 
+static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    /* Not all bits defined for MDCR_EL3 exist in the AArch32 SDCR */
+    mdcr_el3_write(env, ri, value & SDCR_VALID_MASK);
+}
+
 static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
@@ -5122,9 +5129,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
     { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
-      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
+      .access = PL3_RW,
+      .writefn = mdcr_el3_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
     { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.25.1


