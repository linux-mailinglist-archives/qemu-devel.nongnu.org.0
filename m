Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73615689B9C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4n-0006uf-C4; Fri, 03 Feb 2023 09:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4c-0006jJ-0z
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-00057G-BY
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so6145934wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p6ebWUhLxy1Vko9RKec4Spu2hlMYvJ/5ZZfi2NMMhLY=;
 b=m3o7g7LhK5q8cqpL4j091RrVmUQyFzUloPWMHfgS+aNbhLD14RDz9TMgnliR1aokHH
 9qysRQNs0JHAsuijtYaouh4EUL8WTTmbd+rR5JLoO912pPfHcjx3CeCReigSecuvOCqW
 NNrb8JQvVbP5bj5KPq+YLd69xjtH14gv4kqUvI1qg/Z/hNF8xmYbxb4CP1dDeqCOyiyt
 KAPjS5jL8cC2GV3n3Jt6xV4ISU4vygfL/+srEAR7hQJkMz5faAUtB3fdFbqKJ0ssRccf
 Ho1WQlj64n9Qk39LgN7fSmeehOvsAxAfYVfuX7qFOSSoDHd8KlMDK7PUCv1cYB6IAVzY
 eOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6ebWUhLxy1Vko9RKec4Spu2hlMYvJ/5ZZfi2NMMhLY=;
 b=Me2y9esak2Rjo55hWDAachaL/aCNBGKseebG1yipo90fBBEPZJsWZRWYXUfRrvehhw
 tKjgUh5gqzBJYUSjAgfk+wa0DhyjJkn7VYk2iqAdWye9bFu4pfaFSAVLUqdeoirQW5ag
 XtOIPUcu7Z8PsVpE9yacDNgvNEBvb87DVlEcVpjV5SHsPOQ8eupdbJoliOVM/75jWey3
 b5N4TGqCedJEmH9VVLHygtO4xail3QNSrlSkvgx0+r/6rvp5bq0dctE49DedCJVzMLge
 HmiuDh9Hapig+7GBrYfCKGoIB4Sh5ng0XrOThxKuv36wIKFM4M1uJfw2w8t/XpLAJlgV
 zS8A==
X-Gm-Message-State: AO0yUKUayy8Kv3lyCY40NjasDNJt6gleZ8z7yh2V2g47nfRYhzVk7cPb
 KgDLcxNcd43A+4zJHgrRKYcZhhrujBNgAYxL
X-Google-Smtp-Source: AK7set8KuWmlOkW4EOxa54HPMyi426+Rm56hT7BXKaOl4StLiVo8iQ3Yps6CbTWqhOnSxKYAEz0vqA==
X-Received: by 2002:a05:600c:1d83:b0:3cf:68d3:3047 with SMTP id
 p3-20020a05600c1d8300b003cf68d33047mr9499897wms.41.1675434586946; 
 Fri, 03 Feb 2023 06:29:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] target/arm: Mark up sysregs for HFGRTR bits 12..23
Date: Fri,  3 Feb 2023 14:29:15 +0000
Message-Id: <20230203142927.834793-22-peter.maydell@linaro.org>
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
by HFGRTR/HFGWTR bits 12..23.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-12-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-12-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 12 ++++++++++++
 target/arm/helper.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 82f2cefff0a..67d87ae8bf5 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -591,6 +591,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, CCSIDR_EL1),
     DO_BIT(HFGRTR, CLIDR_EL1),
     DO_BIT(HFGRTR, CONTEXTIDR_EL1),
+    DO_BIT(HFGRTR, CPACR_EL1),
+    DO_BIT(HFGRTR, CSSELR_EL1),
+    DO_BIT(HFGRTR, CTR_EL0),
+    DO_BIT(HFGRTR, DCZID_EL0),
+    DO_BIT(HFGRTR, ESR_EL1),
+    DO_BIT(HFGRTR, FAR_EL1),
+    DO_BIT(HFGRTR, ISR_EL1),
+    DO_BIT(HFGRTR, LORC_EL1),
+    DO_BIT(HFGRTR, LOREA_EL1),
+    DO_BIT(HFGRTR, LORID_EL1),
+    DO_BIT(HFGRTR, LORN_EL1),
+    DO_BIT(HFGRTR, LORSA_EL1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 30e54455ac7..c059935d0e6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -869,6 +869,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0, },
     { .name = "CPACR", .state = ARM_CP_STATE_BOTH, .opc0 = 3,
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
+      .fgt = FGT_CPACR_EL1,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
       .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
 };
@@ -2170,6 +2171,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 2, .opc2 = 0,
       .access = PL1_RW,
       .accessfn = access_tid4,
+      .fgt = FGT_CSSELR_EL1,
       .writefn = csselr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.csselr_s),
                              offsetof(CPUARMState, cp15.csselr_ns) } },
@@ -2233,6 +2235,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .resetfn = arm_cp_reset_ignore },
     { .name = "ISR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 0,
+      .fgt = FGT_ISR_EL1,
       .type = ARM_CP_NO_RAW, .access = PL1_R, .readfn = isr_read },
     /* 32 bit ITLB invalidates */
     { .name = "ITLBIALL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 0,
@@ -4135,6 +4138,7 @@ static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
     { .name = "FAR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_FAR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.far_el[1]),
       .resetvalue = 0, },
 };
@@ -4143,6 +4147,7 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "ESR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 5, .crm = 2, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_ESR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.esr_el[1]), .resetvalue = 0, },
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
@@ -5215,6 +5220,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DCZID_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 7, .crn = 0, .crm = 0,
       .access = PL0_R, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_DCZID_EL0,
       .readfn = aa64_dczid_read },
     { .name = "DC_ZVA", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 1,
@@ -7005,22 +7011,27 @@ static const ARMCPRegInfo lor_reginfo[] = {
     { .name = "LORSA_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_lor_other,
+      .fgt = FGT_LORSA_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LOREA_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_lor_other,
+      .fgt = FGT_LOREA_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LORN_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_lor_other,
+      .fgt = FGT_LORN_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LORC_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_lor_other,
+      .fgt = FGT_LORC_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
       .access = PL1_R, .accessfn = access_lor_ns,
+      .fgt = FGT_LORID_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
@@ -8619,6 +8630,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "CTR_EL0", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .opc2 = 1, .crn = 0, .crm = 0,
               .access = PL0_R, .accessfn = ctr_el0_access,
+              .fgt = FGT_CTR_EL0,
               .type = ARM_CP_CONST, .resetvalue = cpu->ctr },
             /* TCMTR and TLBTR exist in v8 but have no 64-bit versions */
             { .name = "TCMTR",
-- 
2.34.1


