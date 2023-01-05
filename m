Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257B65F19F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLu-0000LZ-Lh; Thu, 05 Jan 2023 11:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLr-0000Bj-NU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLp-00072G-Kc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ja17so28449479wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Yuo7qK1mL55V9kttGcjYaiTtFdumRPFENl39UXW9mMo=;
 b=CURm2aHYSLjNVaFu4jFPVh5GEmDEb99ahposk6Q2BYXcJ4uhzq4km8rjdJ2UWhqZde
 PvoqVRWcYp2vC+xfjc7PCqxlBCop6jA4GXII9UuneMGi6+Nvhj1aMCobAbDZu8vJPoR4
 a9PTjEs1Zj8Bny5b8KQjo9QLd1g6y6JvV455u5XBIRThhWK/B+xYu1SrkSBmOtc708za
 F77v01D3DYvQyCq+ZJ8NNqgoYFMMf/cFqbkSe25E7KshFVCCQA+tKXS7bZZ/Z7mWc1S3
 DTdiQ0DzQJun/T8QD3xfi7copPVSYe4jWFnl4BuGPsTKcFfV6FnzamLBFR3haP3gxPDj
 mP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yuo7qK1mL55V9kttGcjYaiTtFdumRPFENl39UXW9mMo=;
 b=ixXsX24aGZ6EEAvpjnjzIQk31tCzNI0EKNxNZGNmzpvNCmG9n0yfq/QwQCMP2XNcp1
 CZE03nPKDpuMJ3dU26Qm6PcB1YM2ooiHGA69BAn2m8Zsy6Fu7MyZbaN9s90AyuyLrAhL
 i+tYGyIFuBtsADuIkROE40BL9PMGNaW8QJwU6NsarslorZXD3szNz1bKk9O+PnRNATTp
 tQc2pByQB4/Bq/cEazLQn3K4eK+1wixLOcWWPY02bxlgvaz6nOVQNARx2bukODXqhWjO
 rcTeGmAuK2U4uTboYqBRltPSXrYhJ5Kw7iCSyVHkR9DGCF+N4RmSNNPjAe11Y3p31bN3
 +DBA==
X-Gm-Message-State: AFqh2kpO1SIFaF+KKEq2maZzL6qbVdiHPdosYChdyQHqa1SA+Pc9wNrx
 bFisS2x1O9T46UdJyWvpY3trHx/1jXj4q+GS
X-Google-Smtp-Source: AMrXdXuX5D/gT7xQWofRKF/KgzyTd3w99Z9jZTGasX8Tsg94+tBIrEfE9D9V21MPubryb08IV/ijYw==
X-Received: by 2002:a05:600c:4854:b0:3d3:5a4a:90ff with SMTP id
 j20-20020a05600c485400b003d35a4a90ffmr39115253wmo.23.1672937060960; 
 Thu, 05 Jan 2023 08:44:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/34] target/arm: Don't add all MIDR aliases for cores that
 implement PMSA
Date: Thu,  5 Jan 2023 16:43:45 +0000
Message-Id: <20230105164417.3994639-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Cores with PMSA have the MPUIR register which has the
same encoding as the MIDR alias with opc2=4. So we only
add that alias if we are not realizing a core that
implements PMSA.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221206102504.165775-2-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c44..090daf93c71 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8153,10 +8153,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
-            /* crn = 0 op1 = 0 crm = 0 op2 = 4,7 : AArch32 aliases of MIDR */
-            { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
-              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
-              .access = PL1_R, .resetvalue = cpu->midr },
+            /* crn = 0 op1 = 0 crm = 0 op2 = 7 : AArch32 aliases of MIDR */
             { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 7,
               .access = PL1_R, .resetvalue = cpu->midr },
@@ -8166,6 +8163,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
+        ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
+            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+            .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
+            .access = PL1_R, .resetvalue = cpu->midr
+        };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
             { .name = "CTR",
@@ -8231,6 +8233,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
+            if (!arm_feature(env, ARM_FEATURE_PMSA)) {
+                define_one_arm_cp_reg(cpu, &id_v8_midr_alias_cp_reginfo);
+            }
         } else {
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
-- 
2.25.1


