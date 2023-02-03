Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37B689BB6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5S-0008Bz-V8; Fri, 03 Feb 2023 09:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4d-0006lY-U3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4a-00058J-I2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso3975972wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0kuEeOGJXchZ8ADATn7eDSLjUofIRhTU/h1wg7+RQIY=;
 b=uwSrQabT/LxCgMKW7qSGI5DDQYZUCu7c9EQJHE8DH0cOfVec8vUofCtNKUWpydBNkG
 UIldJPeTIAcQKnfZPfZZiciGFh1pEyJmV+NZL1MlB3mnSQ0rZrNnJkpv1Ojq7q4ePhGN
 wkS/kRuhX0nNXq+qakoopBiTO6J++321UkxgBMgEAGk3bLKn6ePD2JyN85ZdRZncch+V
 a6Ag1w07X15WqUjGJ0m1U1k0dBfJ6CwkSwMztbeSBb322ZoTZnCI9D55DmVNGrnofl1g
 UFj5xC5piOwVik4h/FoHAC2Wj91mYFszrWFMYsaqNKdirVzck8buGOhc/Y+iCmEtZKA6
 C37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kuEeOGJXchZ8ADATn7eDSLjUofIRhTU/h1wg7+RQIY=;
 b=udHbysjMQej0Kc5dukYZt7+dqM6d569YgYeZjOzvyt2Sv8JXXoFY2yFIRE9u9qNBAG
 HxV0PYw0FQB8HAyCsKz1AXzxMbUuY8gWwQBDYnhqHDc2rFBF8vJjPFhZy6F1RNFrJ538
 RLdhYTji89IeoBkmfwMfBOeobTrF7Z7HMLnpiGZwSkFMMER9PbOT4KZh1UBW9oLLRuZ6
 DVRwnxaDZ/g9XHS2BP0AOWT8zcJcHFpAlqgELrO73yLXyGS5Cld7aEGaTgnaZ+K7PNyg
 f+Kq7zpdeo7BlIXJGrfL8vta4VmPlS8hrJydQhuJFuALAelKfJFX4rZyhUjZb7yENexN
 elzg==
X-Gm-Message-State: AO0yUKXUOda49MxQrRgROd5KuVHf1MAfxMX/fHaatSeZci8Mobni8vPb
 tILNeEHoSuUIg8HQX4YYviDgPxFe5UO0dZHz
X-Google-Smtp-Source: AK7set9zsUT528NEtUoB21q7NnnLsP6FP13P/XpYxNgbQuU4ZKyWhUQ+yppU98YFaqknoB8Xot01Mw==
X-Received: by 2002:a05:600c:4fc8:b0:3df:e46c:7984 with SMTP id
 o8-20020a05600c4fc800b003dfe46c7984mr3755728wmq.38.1675434591211; 
 Fri, 03 Feb 2023 06:29:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] target/arm: Mark up sysregs for HFGITR bits 0..11
Date: Fri,  3 Feb 2023 14:29:20 +0000
Message-Id: <20230203142927.834793-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 0..11. These bits cover various
cache maintenance operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-17-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-17-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 14 ++++++++++++++
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c37e013b8f3..6596c2a1233 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -646,6 +646,20 @@ typedef enum FGTBit {
     DO_BIT(HDFGWTR, PMCR_EL0),
     DO_BIT(HDFGRTR, PMMIR_EL1),
     DO_BIT(HDFGRTR, PMCEIDN_EL0),
+
+    /* Trap bits in HFGITR_EL2, starting from bit 0 */
+    DO_BIT(HFGITR, ICIALLUIS),
+    DO_BIT(HFGITR, ICIALLU),
+    DO_BIT(HFGITR, ICIVAU),
+    DO_BIT(HFGITR, DCIVAC),
+    DO_BIT(HFGITR, DCISW),
+    DO_BIT(HFGITR, DCCSW),
+    DO_BIT(HFGITR, DCCISW),
+    DO_BIT(HFGITR, DCCVAU),
+    DO_BIT(HFGITR, DCCVAP),
+    DO_BIT(HFGITR, DCCVADP),
+    DO_BIT(HFGITR, DCCIVAC),
+    DO_BIT(HFGITR, DCZVA),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e494b8f924..51866ba70e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5261,6 +5261,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
     { .name = "CURRENTEL", .state = ARM_CP_STATE_AA64,
@@ -5270,21 +5271,26 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "IC_IALLUIS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIALLUIS,
       .accessfn = access_ticab },
     { .name = "IC_IALLU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIALLU,
       .accessfn = access_tocu },
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIVAU,
       .accessfn = access_tocu },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
+      .fgt = FGT_DCIVAC,
       .type = ARM_CP_NOP },
     { .name = "DC_ISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
+      .fgt = FGT_DCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
@@ -5292,17 +5298,21 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
+      .fgt = FGT_DCCSW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCVAU,
       .accessfn = access_tocu },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
+      .fgt = FGT_DCCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
@@ -7413,6 +7423,7 @@ static const ARMCPRegInfo dcpop_reg[] = {
     { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
 };
 
@@ -7420,6 +7431,7 @@ static const ARMCPRegInfo dcpodp_reg[] = {
     { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
 };
 #endif /*CONFIG_USER_ONLY*/
@@ -7499,28 +7511,36 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "DC_IGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL1_W,
+      .fgt = FGT_DCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_IGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .fgt = FGT_DCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_IGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL1_W,
+      .fgt = FGT_DCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_IGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .fgt = FGT_DCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .fgt = FGT_DCCSW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .fgt = FGT_DCCSW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CIGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .fgt = FGT_DCCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .fgt = FGT_DCCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
 };
 
@@ -7542,26 +7562,32 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_GVA", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
@@ -7569,6 +7595,7 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
     { .name = "DC_GZVA", .state = ARM_CP_STATE_AA64,
@@ -7577,6 +7604,7 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
 };
-- 
2.34.1


