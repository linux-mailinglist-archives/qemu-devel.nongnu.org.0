Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17267ECDA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx6-00012H-Si; Fri, 27 Jan 2023 12:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSws-0000rR-Vp
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:39 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00061n-KZ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id y1so5694967wru.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pq0TjCp+CRyVaIxgI9qvtQAfO37P/DRfdxZhTsYpsLM=;
 b=F8bOxBIECygsdjccKlU/PXUplfsRIATJVbL5hn1+DEoZbVw7iOIaWgJUJBw0cQPyFk
 eyemePTeyjC7jvxdSESh9SYBl8mPRvS4+INQDfLUi0bW1bTf3O8jR7g/61BO/i47ugv9
 b5w0phQf+YEfMQW2eSLHK8H18nurW8Ds+4KbdbRKsig4xKmr2r+aA8oxBWpQFFOM6P50
 dmJS61kzU50nZojXBeTJDjp38xoiNEgrN92k+V0NLaPB3bVxnZRpBb8GkbH4izzUiUx4
 qAzdziJ0rx79gj2MnAnw/Mavz0mLcSYeLzjpgiEhDtuOeus8o2pvkQRPcgQ7CAyqkknd
 WFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq0TjCp+CRyVaIxgI9qvtQAfO37P/DRfdxZhTsYpsLM=;
 b=RK4KU17aQulYnykupAw7vPsH42/lhmfyDNDLYKSjbpZ82G68yzFf+k+vKyP3jYTAAK
 Nm0fJBkXcrNIhXFusKcc9poNHK3H2NH4R0QBayUk9Ln0eBVBOBsuOLIVstoycQ3vJK0i
 5s6HacLvSFm5u79Tt7bZluqNBk/y8WuFc1G6SpO/IdwEmf7Y65++AcqCzX5xvLoIkJQd
 /EKDyIVInAo9p0fQlmK50+dgwot/TacJziN1q0KBTeOEwn0Jdf6nht53a3rvi5vEeIxP
 pKmIfSw+xbvk0gOoUS8hMwsYq5TmHHkzZotKN88OJDkw4G+ZgnHojbSSeB9ylWxvz9On
 2kqg==
X-Gm-Message-State: AFqh2krWRx5aA7L0kdPqHWnl74T1fnqccu3CBGw5c8WofaF+dZSLxfV9
 vZ/5isP1tOb2kVGItlAR/1R+qxExVYF36DsG
X-Google-Smtp-Source: AMrXdXtA4ARV3QX+LsheGWIAjNkc/NVhURSfY3pnZx39CNy/epUoe5Hf+7cJx57/5kA+r+Eg6m26Tw==
X-Received: by 2002:a5d:5c13:0:b0:2bd:d84d:bbc2 with SMTP id
 cc19-20020a5d5c13000000b002bdd84dbbc2mr38252478wrb.46.1674842122020; 
 Fri, 27 Jan 2023 09:55:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/23] target/arm: Mark up sysregs for HFGRTR bits 12..23
Date: Fri, 27 Jan 2023 17:54:55 +0000
Message-Id: <20230127175507.2895013-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


