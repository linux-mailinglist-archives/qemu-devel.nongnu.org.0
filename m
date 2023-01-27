Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE567ECD3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxB-00017o-H0; Fri, 27 Jan 2023 12:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSww-0000tt-4v
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00062z-Nf
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id h12so5662030wrv.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=50+pSdkqlnc2kD6BwIetGsLKDyujD2JgI4S3MkXjiWw=;
 b=rloI3kifKEp40BdMMD2d7uY9JxhBBTwSXhHzBzGzDQGZq8WvZ9koQosrDY1UD77bD8
 +dhQ1+R58F6Z33+c07lSUnp2uoJrW4XS9Ca7xJ3+w+SAvySf2XFmhvK+AoYToZUO0GqU
 2Fd9EG3Vx4vjcmGz1KB5IZybXk6fwj2Fmf6tbtQ5rzpRytP2d/K0EPEv6twjeKJUGHIR
 XSUMieEGnbEwRa2o9Ala9JrfLQ+FeXTuukuAoZnOofcBeqGgO+YCBM6XxgKJqlPC8GPK
 cWnkRjgFMtaw1EdJ7KqoLUgzcu8Ch5ba9VCBxPLmqzZPy+cfCFYCLn3Gui4kOguNUtOk
 NmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50+pSdkqlnc2kD6BwIetGsLKDyujD2JgI4S3MkXjiWw=;
 b=c6d/OWkRbITquL0o5CYGRAB6Ia7faGgIxRuezkw3tjAFNo1cqtFGS+nN5VPe8nc8wk
 MTAc0nl6+CHmZ39K0bi7udx5vvFsv7HXpVmOVixpjnnXces5M0FW9VmtJZUtVsWdfZiW
 ZvUwSzhSh6w7dk47OjrqT0/ncX4NMh8V05/p0R2bQZfB89drTsTqOUQT7qxNV9PQKe2d
 p2KjQ1KyW861gbwSB993RjNzttRrbgQhYXpDiFCpHQMYZ4cgt/n8r+2/CLvZ70QxcSri
 ZdMUABMlhKcx/6zs8God0901JrZOXU/I2UatcSAGSK7b4MCIG1st5oG5ziyF5NC0TglM
 LjJw==
X-Gm-Message-State: AO0yUKXtm8NioGP2EIVGaMNBc0zJfJSCcVzqBpBuP6L61To4FIKxLLqS
 ZoyH8IMPpHDZm3xa/jx+5eGE7Q37sfPbS0Js
X-Google-Smtp-Source: AK7set8X9qPC4UZEZ3ML6U051X3rIyFeVefrNKYs7ump8QDpLYnowV8vRos+zlP7jQggTOUvvzM3SQ==
X-Received: by 2002:a5d:5541:0:b0:2bf:c0e4:1bc5 with SMTP id
 g1-20020a5d5541000000b002bfc0e41bc5mr7282180wrw.56.1674842125812; 
 Fri, 27 Jan 2023 09:55:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/23] target/arm: Mark up sysregs for HDFGRTR bits 12..63
Date: Fri, 27 Jan 2023 17:54:59 +0000
Message-Id: <20230127175507.2895013-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
by HDFGRTR/HDFGWTR bits 12..x.

Bits 12..22 and bit 58 are for PMU registers.

The remaining bits in HDFGRTR/HDFGWTR are for traps on
registers that are part of features we don't implement:

Bits 23..32 and 63 : FEAT_SPE
Bits 33..48 : FEAT_ETE
Bits 50..56 : FEAT_TRBE
Bits 59..61 : FEAT_BRBE
Bit 62 : FEAT_SPEv1p2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 12 ++++++++++++
 target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7c4d07ed9c6..c37e013b8f3 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -634,6 +634,18 @@ typedef enum FGTBit {
     DO_BIT(HDFGRTR, OSLSR_EL1),
     DO_BIT(HDFGRTR, OSECCR_EL1),
     DO_BIT(HDFGRTR, OSDLR_EL1),
+    DO_BIT(HDFGRTR, PMEVCNTRN_EL0),
+    DO_BIT(HDFGRTR, PMEVTYPERN_EL0),
+    DO_BIT(HDFGRTR, PMCCFILTR_EL0),
+    DO_BIT(HDFGRTR, PMCCNTR_EL0),
+    DO_BIT(HDFGRTR, PMCNTEN),
+    DO_BIT(HDFGRTR, PMINTEN),
+    DO_BIT(HDFGRTR, PMOVS),
+    DO_BIT(HDFGRTR, PMSELR_EL0),
+    DO_BIT(HDFGWTR, PMSWINC_EL0),
+    DO_BIT(HDFGWTR, PMCR_EL0),
+    DO_BIT(HDFGRTR, PMMIR_EL1),
+    DO_BIT(HDFGRTR, PMCEIDN_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a48b022def6..2e494b8f924 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2035,21 +2035,25 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenset_write,
       .accessfn = pmreg_access,
+      .fgt = FGT_PMCNTEN,
       .raw_writefn = raw_write },
     { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64, .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 1,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMCNTEN,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten), .resetvalue = 0,
       .writefn = pmcntenset_write, .raw_writefn = raw_write },
     { .name = "PMCNTENCLR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .accessfn = pmreg_access,
+      .fgt = FGT_PMCNTEN,
       .writefn = pmcntenclr_write,
       .type = ARM_CP_ALIAS | ARM_CP_IO },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMCNTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
@@ -2057,41 +2061,49 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .type = ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .accessfn = pmreg_access,
+      .fgt = FGT_PMOVS,
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
     { .name = "PMOVSCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 3,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMOVS,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc,
+      .fgt = FGT_PMSWINC_EL0,
       .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .writefn = pmswinc_write },
     { .name = "PMSWINC_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc,
+      .fgt = FGT_PMSWINC_EL0,
       .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .writefn = pmswinc_write },
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .fgt = FGT_PMSELR_EL0,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
       .accessfn = pmreg_access_selr, .writefn = pmselr_write,
       .raw_writefn = raw_write},
     { .name = "PMSELR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 5,
       .access = PL0_RW, .accessfn = pmreg_access_selr,
+      .fgt = FGT_PMSELR_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
       .writefn = pmselr_write, .raw_writefn = raw_write, },
     { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
       .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .fgt = FGT_PMCCNTR_EL0,
       .readfn = pmccntr_read, .writefn = pmccntr_write32,
       .accessfn = pmreg_access_ccntr },
     { .name = "PMCCNTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 0,
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
+      .fgt = FGT_PMCCNTR_EL0,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c15_ccnt),
       .readfn = pmccntr_read, .writefn = pmccntr_write,
@@ -2099,32 +2111,38 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMCCFILTR_EL0,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .resetvalue = 0, },
     { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write, .raw_writefn = raw_write,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMCCFILTR_EL0,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
       .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .accessfn = pmreg_access,
+      .fgt = FGT_PMEVTYPERN_EL0,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
     { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
       .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .accessfn = pmreg_access,
+      .fgt = FGT_PMEVTYPERN_EL0,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .accessfn = pmreg_access_xevcntr,
+      .fgt = FGT_PMEVCNTRN_EL0,
       .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
     { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
       .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .accessfn = pmreg_access_xevcntr,
+      .fgt = FGT_PMEVCNTRN_EL0,
       .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
@@ -2139,6 +2157,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tpm,
+      .fgt = FGT_PMINTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
       .resetvalue = 0,
@@ -2146,18 +2165,21 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tpm,
+      .fgt = FGT_PMINTEN,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenset_write, .raw_writefn = raw_write,
       .resetvalue = 0x0 },
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
+      .fgt = FGT_PMINTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write, },
     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
+      .fgt = FGT_PMINTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write },
@@ -2293,6 +2315,7 @@ static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
     /* PMOVSSET is not implemented in v7 before v7ve */
     { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMOVS,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsset_write,
@@ -2300,6 +2323,7 @@ static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
     { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
       .access = PL0_RW, .accessfn = pmreg_access,
+      .fgt = FGT_PMOVS,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsset_write,
@@ -6884,6 +6908,7 @@ static void define_pmu_regs(ARMCPU *cpu)
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
+        .fgt = FGT_PMCR_EL0,
         .type = ARM_CP_IO | ARM_CP_ALIAS,
         .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcr),
         .accessfn = pmreg_access, .writefn = pmcr_write,
@@ -6893,6 +6918,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         .name = "PMCR_EL0", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 0,
         .access = PL0_RW, .accessfn = pmreg_access,
+        .fgt = FGT_PMCR_EL0,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
         .resetvalue = cpu->isar.reset_pmcr_el0,
@@ -6910,23 +6936,27 @@ static void define_pmu_regs(ARMCPU *cpu)
             { .name = pmevcntr_name, .cp = 15, .crn = 14,
               .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
               .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+              .fgt = FGT_PMEVCNTRN_EL0,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
               .accessfn = pmreg_access_xevcntr },
             { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
               .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access_xevcntr,
               .type = ARM_CP_IO,
+              .fgt = FGT_PMEVCNTRN_EL0,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
               .raw_readfn = pmevcntr_rawread,
               .raw_writefn = pmevcntr_rawwrite },
             { .name = pmevtyper_name, .cp = 15, .crn = 14,
               .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
               .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+              .fgt = FGT_PMEVTYPERN_EL0,
               .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
               .accessfn = pmreg_access },
             { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 12 | (3 & (i >> 3)),
               .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+              .fgt = FGT_PMEVTYPERN_EL0,
               .type = ARM_CP_IO,
               .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
               .raw_writefn = pmevtyper_rawwrite },
@@ -6942,10 +6972,12 @@ static void define_pmu_regs(ARMCPU *cpu)
             { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = extract64(cpu->pmceid0, 32, 32) },
             { .name = "PMCEID3", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = extract64(cpu->pmceid1, 32, 32) },
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
@@ -6955,6 +6987,7 @@ static void define_pmu_regs(ARMCPU *cpu)
             .name = "PMMIR_EL1", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 6,
             .access = PL1_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+            .fgt = FGT_PMMIR_EL1,
             .resetvalue = 0
         };
         define_one_arm_cp_reg(cpu, &v84_pmmir);
@@ -8251,18 +8284,22 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "PMCEID0", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 6,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = extract64(cpu->pmceid0, 0, 32) },
             { .name = "PMCEID0_EL0", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 6,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = cpu->pmceid0 },
             { .name = "PMCEID1", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 7,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = extract64(cpu->pmceid1, 0, 32) },
             { .name = "PMCEID1_EL0", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 7,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = cpu->pmceid1 },
         };
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1


