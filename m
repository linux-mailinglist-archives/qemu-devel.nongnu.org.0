Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387F516254
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:59:40 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3YR-00009P-3D
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tx-0006tp-UR
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tt-0001L8-Si
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o69so8976106pjo.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvCvZqd/G9ya+Ohyp6HL6QjxXksg2p0BkixwWFQxr5M=;
 b=bKRJ+yvTIKKDRxoS6GLShppVZJUTKoPxXEyXZi4Vt4xEUAcRpc4fUe8z1Mfbed1Hx6
 aKgasFfLDevmJvcqjxqVG41tR2PRZ5qzPBPpg5BsO9LL6l5mqBT/LWtO1HNF2Gzenuyr
 krekMVaXCGOsgUHRmGNB+SLsQE4m85k8Ee3rNB8qqOqxrLDKDCx0Erj/L0NPTu1aSRrk
 0jxmQpkPJpmF26o2gIBBw9oK6wY5pJ0tufrW+mIoiQI3hB2eqd/yuGlcenOq41x2Ut9e
 Oav7uLFUBIQgcT6SUBhLvkFVSHxJFITShJ7IYKNGzoLyLTL0kl1rUSAC+V2+Bhr+m64P
 NHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvCvZqd/G9ya+Ohyp6HL6QjxXksg2p0BkixwWFQxr5M=;
 b=rKvvsTGiMiVqVJH2MB/FFZmkci08hLSUmZYuKN7kHIZuDeqRTgkY2h/g6JXM3bMydV
 2sv/468dZ30egQtsXjoIAKF4IVHPwnWRfJkgyLv6si2sfKtTYTivV+Vz9UcwjBMYCxqC
 a1c8m9wFHzj8C9JXO8QR1D7el28yGEYbra6AC1kwB0Tc41J3wz6AQAnlN5ObaPYgQa9l
 /cBO7AkPmdEkeGRDsop3Qh+Q4lKZPmYO+9hL8T2EPaCyU9I28Gi7zNMKtyzQhWFZWyXh
 jFqYeNEQdu9ENGDvixDw0kxcWl1/yHyAC4cxjN62Wv6rGlDfHUB+44MLrevBW3MuhKTr
 YkUA==
X-Gm-Message-State: AOAM532kKBY+HiMcez5ubh8bk3XEb+NPzPstUA/q3o+Or025rJtYlZNx
 cG28TyUHDVIKVAor6cSLGd6vq6FeqXPX8A==
X-Google-Smtp-Source: ABdhPJzGHAYUjf5kUfB6bjAw/DljZJUo48tGRMzcyfF7qKi+BJZO8Pz9AdiwJHRG66LZBmajbacBsw==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id
 w5-20020a170902a70500b001569cc51d6fmr6358930plq.66.1651384252739; 
 Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/45] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Sat, 30 Apr 2022 22:50:06 -0700
Message-Id: <20220501055028.646596-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 228472506d..a5741e0ad7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7246,11 +7246,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
+};
+
 static const ARMCPRegInfo vhe_reginfo[] = {
-    { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
@@ -8212,6 +8215,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        define_one_arm_cp_reg(cpu, &contextidr_el2);
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.34.1


