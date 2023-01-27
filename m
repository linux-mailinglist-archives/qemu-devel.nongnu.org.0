Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192E67ECCE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx9-00014y-9t; Fri, 27 Jan 2023 12:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwv-0000sF-6K
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:41 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00061X-NP
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id q5so5716973wrv.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dRvnpD/SS8NrhvE6itIT8RGFAlHq7tuRDHg3zL/7iNk=;
 b=pmTc7U3gf/1bvYlUizDcF0EeVOGsuwQjjxMWFvGkig4+atS4nuvAq7WhATRcCLoFT/
 YEEeKPXwZw+sQxI+ND0u1FyGNyJGX5fs+GwBruHzpOll1B61IHP1H7Ycqsi7f3n18hWR
 Egem2VGcu+ixWX4x7K6+tNtUqiGbi2+0ydv1WAL3UYs4nKQGfgS+Sueu0fBJ7gGuFLYb
 n9SJett6f2V8J3Wly2wxb4cpIS9WW0C6rjtgDFMAQjN08QY28u4XzepxLNqqtU7y0YZf
 QbPBH00QU7QhU6IUlBkfwgqzpg8ICJzGfqjqRLxJhy/ThrYibHneFLzlM4sWAkbS7jpC
 KVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRvnpD/SS8NrhvE6itIT8RGFAlHq7tuRDHg3zL/7iNk=;
 b=Ca4b1zGZBTvs7bq1Zxx4aCqyh1+EbtgDN20sDaZcL4Dpfn7FVkfNDSRofCYalSDDbt
 YY1e20l0oRpBeXNJYny+yu/59D/bWbY5QGV9+JtJlRve43plhHBnIic6ALgf0ldmJ5io
 c87/0Pfl3kW6f/uspftZ6ueD85j+bnpGNb1ozfSScezqpwA1LOvKnPBavGeoGbE5/DLr
 7ykaF8jpfguhEO3Ucg0KP03CioOxkLIS9RaIGWRyYGzfVqqmJRdPaOd2GYJFR1UoEkLM
 sR+roSjfPZC+m8sxWhOEerAr9zZW0QLrqIQwhsZxyC7S68V1BOQXxRHEiecqqD9rYVz0
 DNkg==
X-Gm-Message-State: AFqh2kprXmm3uz1OlqM0hCi2V3fEMQfcR/HCJt0qQnGnCOUAxevfrz+5
 75WUbaqdgsAnPsQEAzj5nbZQLA==
X-Google-Smtp-Source: AMrXdXvrr1+MPLZJbssmQ/mbel911I7ongPsSDozsXiMzr4uqfG4eSXO+BRwL2UT82PHJV0u6eYmIQ==
X-Received: by 2002:adf:f605:0:b0:2bd:be31:cd77 with SMTP id
 t5-20020adff605000000b002bdbe31cd77mr32440948wrp.30.1674842120771; 
 Fri, 27 Jan 2023 09:55:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/23] target/arm: Mark up sysregs for HFGRTR bits 0..11
Date: Fri, 27 Jan 2023 17:54:54 +0000
Message-Id: <20230127175507.2895013-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
---
The annotation of the cpreg definitions is split into multiple
patches for ease of review, 12 bits or so at a time.
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


