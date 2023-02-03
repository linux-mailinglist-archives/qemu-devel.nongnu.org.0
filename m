Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC63689BDA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:33:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4j-0006tW-4N; Fri, 03 Feb 2023 09:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4a-0006i6-Ht
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:53 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4X-000572-2d
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso6130144wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yQxmFDzxxFrhEVqQzCA0FWZTs2ofEI2+0Euyqm2fY1E=;
 b=vn3ejJCBVKvfaKNXNgXAMDtPSngk3iqzBj1CwoqAauUWhW0GtxbxP/PuZlskIK1Dec
 1WsmgsjFv68IFr1dSUDpMEmrC2QM60frjnLCKBnODw7clEyych1B3dKwbDz+GNDIo0rB
 T12tEg/HPGIvLv20CnSgbIoGpWSB6sGfazwGw9yzSrHgJA2zxyfFh4RtIhIUcut/EWJq
 86yQ4NzvOPWlAENtGU1BkQBI7ltLlDNQTtjJecncdn9caLSAbWIaPIx2+JRPppwVXhTq
 XMA29uaOtIYP/yfPa9N1/UAP+jd6YFKXSdiWpq/2PrxaogTF80heGDxjqdn8i0q1ok2D
 Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQxmFDzxxFrhEVqQzCA0FWZTs2ofEI2+0Euyqm2fY1E=;
 b=LIEPqlE9Ivb7En7tTnSgiIvUAebxVz86sChjJk8h+xbHDU+aqNGhky4URxQiu8m3qu
 GE1lE+y3Wx9r07VzX6E/HjLHCIegMhtG7irqCqVvcVYXC3FYGU2KuCR6Q9f2kqpp6/lW
 VmrsS5k5+f4X9sg2MSenU3tDuOTVRZxetXigODVpsePa7q9HOQGKviDCEDIj/5MAVjYx
 IYJ17dlE5PynB58r0LCNScWKna9GecF8MxFsgs4W9j4CtiIKzUl9Ti+7LfP6KlZSBVWX
 hbNACdLoh4WP0rS/0fxaYcyhDr5UO24J67zrPr8trA3TxkzHNKRzFeQkHlUI5D+6t5XU
 tnig==
X-Gm-Message-State: AO0yUKVbKE12ii0PlyJ50dh1s3hytYs2eYqOCri1/wwHiIwgM066drjl
 fyqS8p8ld0ELYjPTP3/2455cIYd9x7nmSuLe
X-Google-Smtp-Source: AK7set+tdBRj2q+iONCgcqrAFkvTexPqGqoH+dVqNefECuXzuzh4DB8PyOfnJQqAteyiGCG7aW5f/w==
X-Received: by 2002:a05:600c:3c9b:b0:3dc:46e8:982 with SMTP id
 bg27-20020a05600c3c9b00b003dc46e80982mr9496370wmb.19.1675434586066; 
 Fri, 03 Feb 2023 06:29:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] target/arm: Mark up sysregs for HFGRTR bits 0..11
Date: Fri,  3 Feb 2023 14:29:14 +0000
Message-Id: <20230203142927.834793-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 0..11.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-11-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-11-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 14 ++++++++++++++
 target/arm/helper.c | 17 +++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 8cc12045af6..82f2cefff0a 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -577,6 +577,20 @@ typedef enum FGTBit {
     FGT_HDFGRTR = FGT_RW | (FGTREG_HDFGRTR << R_FGT_IDX_SHIFT),
     FGT_HDFGWTR = FGT_W | (FGTREG_HDFGWTR << R_FGT_IDX_SHIFT),
     FGT_HFGITR = FGT_EXEC | (FGTREG_HFGITR << R_FGT_IDX_SHIFT),
+
+    /* Trap bits in HFGRTR_EL2 / HFGWTR_EL2, starting from bit 0. */
+    DO_BIT(HFGRTR, AFSR0_EL1),
+    DO_BIT(HFGRTR, AFSR1_EL1),
+    DO_BIT(HFGRTR, AIDR_EL1),
+    DO_BIT(HFGRTR, AMAIR_EL1),
+    DO_BIT(HFGRTR, APDAKEY),
+    DO_BIT(HFGRTR, APDBKEY),
+    DO_BIT(HFGRTR, APGAKEY),
+    DO_BIT(HFGRTR, APIAKEY),
+    DO_BIT(HFGRTR, APIBKEY),
+    DO_BIT(HFGRTR, CCSIDR_EL1),
+    DO_BIT(HFGRTR, CLIDR_EL1),
+    DO_BIT(HFGRTR, CONTEXTIDR_EL1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2389e41bd07..30e54455ac7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -633,6 +633,7 @@ static const ARMCPRegInfo cp_reginfo[] = {
     { .name = "CONTEXTIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_CONTEXTIDR_EL1,
       .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
@@ -2163,6 +2164,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R,
       .accessfn = access_tid4,
+      .fgt = FGT_CCSIDR_EL1,
       .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
     { .name = "CSSELR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 2, .opc2 = 0,
@@ -2179,6 +2181,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 7,
       .access = PL1_R, .type = ARM_CP_CONST,
       .accessfn = access_aa64_tid1,
+      .fgt = FGT_AIDR_EL1,
       .resetvalue = 0 },
     /*
      * Auxiliary fault status registers: these also are IMPDEF, and we
@@ -2187,10 +2190,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "AFSR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AFSR0_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AFSR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AFSR1_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * MAIR can just read-as-written because we don't implement caches
@@ -4392,6 +4397,7 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AMAIR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /* AMAIR1 is mapped to AMAIR_EL1[63:32] */
     { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
@@ -7041,42 +7047,52 @@ static const ARMCPRegInfo pauth_reginfo[] = {
     { .name = "APDAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apda.lo) },
     { .name = "APDAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apda.hi) },
     { .name = "APDBKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apdb.lo) },
     { .name = "APDBKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apdb.hi) },
     { .name = "APGAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 3, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APGAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apga.lo) },
     { .name = "APGAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APGAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apga.hi) },
     { .name = "APIAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apia.lo) },
     { .name = "APIAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apia.hi) },
     { .name = "APIBKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apib.lo) },
     { .name = "APIBKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
 };
 
@@ -7940,6 +7956,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
             .access = PL1_R, .type = ARM_CP_CONST,
             .accessfn = access_tid4,
+            .fgt = FGT_CLIDR_EL1,
             .resetvalue = cpu->clidr
         };
         define_one_arm_cp_reg(cpu, &clidr);
-- 
2.34.1


