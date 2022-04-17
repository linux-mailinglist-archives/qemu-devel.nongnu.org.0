Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C85048E3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:24:54 +0200 (CEST)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Zt-0005zk-Bx
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xP-0001Zz-Ap
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xN-0003Ue-8U
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q19so14969381pgm.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hifCwEGN2LJwACcTt38/T1y33ShijigpbIfXemOwv90=;
 b=bIU79iLYpnr7IjvMxoxod5GuDpIgVIn1Avh2GoMgxsmZLL2IoqwwzjcNoIuS/a+W8z
 s9dKhfNRJwa8u4nfYbN2PwoV1ppvEBt+C+ptX4nDlv3UEmc2zKqUY43kZ8JhpUkb+GS9
 MapzNxpClvFm2U1cGk+hxTnsrtTGqQZVsqrZ0ECWAqBBakG94xgvL9TwmWSAlpR94nsQ
 vuTR0IFstPBZZKfaeGFCz/sJwo6OIHHHzlLHws0QejNpsl7bSZppGL1MSMCYVXfzxkzl
 M8Mag44UVqQ09aUtSv/yZdgWhSFeFAhDcxS4zJ5VMXdVzT8oxj1ydXILyOQ399NAR59q
 QMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hifCwEGN2LJwACcTt38/T1y33ShijigpbIfXemOwv90=;
 b=SsYl74+VmrsG4xJA2zbnqaejGD4wvbkKLf02PXFfebZigrbRu7jNGdaSIo1Ri4AJOa
 kc9D7Sl05txwyqiRmP0iHOLp7cRW/Cwst2uOpjoZJ3Ie26pbugZsudECh/AMrcDMphGs
 pQTMgD7lvTX172T2VqeTRX5Qg5msT+1mRuXgqD2HIZFcCP1ZGj/arxqF0M97XOwdlLWQ
 s68gXSCGn9Sj9gQY7BR1eF8Mj5c3w0e0AKV9ZYuBInLWLAGWxPsDN6F+4UeUv5OlLheq
 XJ80PStvxxvCA0D2O70myDl+0UoIfLbaTiRQBSTz9RIF8hNFVfDmM6386p7g/EVkYcMD
 UAKw==
X-Gm-Message-State: AOAM5313gXnda6fOHsTIkxYeN9rm8xVbrUjtY0SVgulvBd/n+X/W//GA
 NoQHV6DDrCbWYJ6qLUfQcu6gWsSrN4u8xw==
X-Google-Smtp-Source: ABdhPJw3VtM8hoKlhaOIlcNozX6XO8ky6LPqwVGQDw86qYq6+83+ssoRKWkOV1Pak2fIxRt/9INYHg==
X-Received: by 2002:aa7:9522:0:b0:4e1:d277:ce8 with SMTP id
 c2-20020aa79522000000b004e1d2770ce8mr8479794pfp.16.1650217503114; 
 Sun, 17 Apr 2022 10:45:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/60] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Sun, 17 Apr 2022 10:44:05 -0700
Message-Id: <20220417174426.711829-40-richard.henderson@linaro.org>
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
index e762054b5d..3570212089 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7256,11 +7256,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
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
@@ -8222,6 +8225,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.25.1


