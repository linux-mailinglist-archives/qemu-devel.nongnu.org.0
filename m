Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8975951DEAB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:09:31 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2OQ-0006VC-Ko
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I2-0005G2-Sj
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:54 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I1-0003qG-2q
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:54 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 g11-20020a9d648b000000b00605e4278793so5415081otl.7
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=nyWnOsr6qBdaLl8HsfRZJjCu5x+U4d0tsiENH35bL2NwRF+FuKWU2iNVM9xvf/fgPD
 FLZ76tET77saNgxIpuwjAUmaMkeQw+SBZvggyBYOaR7YI1LN8wxIVLvISaVKMvdRSH9h
 UuXWneBPgPnnyf/YO3bni6bNPTGoBIcSSRtSTGQZWu/iVBixoPB2VlEgjIR4qCuKbn5c
 pmYMnXoUcLzyZ97gBSr0V/aoa0cDp0aBPhLIQh34CTiG3azVf2y1+gBPB1mreF3E9eCU
 fPkw4/Xyifeco4lFVnxvE/9DsRFLCZjq3lqbIa/RGbJDBMwZ7p8CJr2g3I7439CEd8Du
 QW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=U3e+eJqXAphsrOPdDmXXmt73pS5MdHi14lxfiJSaD3dbKA6SiuFI2hOJYJPL6l5iLj
 H543HRpw+OZA0kzE7l2+KIFpkBZ5cYFi4RImzkm1aEudpT0qzS79GZTTcOZFCF9B3mjc
 HfpR2EYsOVGb1CiZ3Dm1xNGagZaTp+xvG8bQgDzmKjm6qetT2u8ZteoExWD0iHBk/IpY
 1l13EjGSBe7J91iOlg50ZhCqDUBnAAwPU4vi3dpiXKMLZ7AIjo1wsum+yqQxQ3m6C3QS
 ih8d5lXxjQDyMWpK9zD3vxMDYY42P3duaM3187puuWVWAtYZ7rbW8aLYc3/axPcrvQlN
 ftYQ==
X-Gm-Message-State: AOAM531bUkEdS8WgQ6VWspDK18W6OOBJeECsn0LXQnHuTGQX/Ayro0PM
 mGeecbr6NMdxEhT41cfO+yb2lwHPeWPyo8PC
X-Google-Smtp-Source: ABdhPJwF0hBGBnXcsr7XdDe0BArkXJSZA96nxJFPR3CspkOW3ZfAyTTIRbrFnT5yY7bOF2dwLR8JtQ==
X-Received: by 2002:a9d:37cb:0:b0:5cc:7a51:c984 with SMTP id
 x69-20020a9d37cb000000b005cc7a51c984mr1461553otb.98.1651860171954; 
 Fri, 06 May 2022 11:02:51 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 04/24] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Fri,  6 May 2022 13:02:22 -0500
Message-Id: <20220506180242.216785-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72d05070f0..7b31c71980 100644
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
@@ -8215,6 +8218,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


