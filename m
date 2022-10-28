Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CE611341
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:43:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPbP-0008Qe-Aa; Fri, 28 Oct 2022 09:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPan-0008MM-Dm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPak-0007qI-3l
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so6662979wrq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iaQaLNeH+r8nV7a6wPuseUPpAMj5ZezeNV5IHkVdQkc=;
 b=YrX08ZrtVNnQt1RdleZVdL8RulXRGnSuLF6sHz2SrmaFNFevobRGn/ausl5KUA17jg
 +qbWSJ1EE8Ezc3EwA6Mu/dGxUxCQwRNu64DjQ5BsUhGzG2mITCOYdSYJ0r0vQGwg8nV1
 M1GxJ/dGQUCU9fr7exqS9IDGHoArgDiexuuH0+NwYf34NBw22mNAgdiBaSF7uYUB9d+f
 qlWWnVlfQ+VtfFRJOFMVFdQTM6EuMCaRwk1Rd7kmCSuuQk9dvXbwd39uMIWjbjjqT8LI
 S5POHnekyYLos+Zci9dgv3KI11Y5Y/LJqLcjM3Agzx8VnCbyQ1na0owsG/yPoTuEzPmS
 DlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaQaLNeH+r8nV7a6wPuseUPpAMj5ZezeNV5IHkVdQkc=;
 b=sEiK/SwdtnZjQbEcqKxNTcjNW+jC3YwIQHUaH9Hgn/R7b3WdNHq73ddMRTzFIo2/T3
 BoNoovArLvhxNyoZdeiwwx8wipCJpkVz92JLdVL8ViCl7cbOVSN6Cn2yggfNq6AmRNHZ
 65nekw7jikfUTEN3SGjHB6jZt8N4VnfwCGvT+RzvxYBXclG4wE24nzi/yomWEphMbvW4
 +b3igKlWrkyrv9n7bG0p0dw7WRwuGUIgxlr4KP6uWof2CloDq4x8AEPEhjErB+bVceFL
 ChIrWKAq4xmFTnuwJerPJYj5t/vYWKHcXHiE3g53tOs2xOamaun9qn/VaHgvfe3kqcCW
 pZSQ==
X-Gm-Message-State: ACrzQf0pUVs+wdr10r8ATGIecpxwETJrkjGLmcFk1GFoq3Tgv92rCRro
 S/9M9YqUyw+gmtldd8oyZ64WdQ==
X-Google-Smtp-Source: AMsMyM5On4xeJ/U+KOJNRpoVucNi5ktWzeEeQWKRsW5PIsdVWSs4vRzmlddzHDAFYx1hcdKeh9V0qA==
X-Received: by 2002:a05:6000:184d:b0:22f:4ef4:47a7 with SMTP id
 c13-20020a056000184d00b0022f4ef447a7mr35251377wri.563.1666964409382; 
 Fri, 28 Oct 2022 06:40:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/7] target/arm: Implement HCR_EL2.TTLBIS traps
Date: Fri, 28 Oct 2022 14:39:58 +0100
Message-Id: <20221028134002.730598-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For FEAT_EVT, the HCR_EL2.TTLBIS bit allows trapping on EL1 use of
TLB maintenance instructions that operate on the inner shareable
domain:

AArch64:
 TLBI VMALLE1IS, TLBI VAE1IS, TLBI ASIDE1IS, TLBI VAAE1IS,
 TLBI VALE1IS, TLBI VAALE1IS, TLBI RVAE1IS, TLBI RVAAE1IS,
 TLBI RVALE1IS, and TLBI RVAALE1IS.

AArch32:
 TLBIALLIS, TLBIMVAIS, TLBIASIDIS, TLBIMVAAIS, TLBIMVALIS,
 and TLBIMVAALIS.

Add the trapping support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e358d32033..dcd3af6e7d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -362,6 +362,17 @@ static CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBIS. */
+static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBIS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2206,16 +2217,16 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     /* 32 bit TLB invalidates, Inner Shareable */
     { .name = "TLBIALLIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbiall_is_write },
     { .name = "TLBIMVAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimva_is_write },
     { .name = "TLBIASIDIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbiasid_is_write },
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimvaa_is_write },
 };
 
@@ -4945,27 +4956,27 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
@@ -5075,10 +5086,10 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 #endif
     /* TLB invalidate last level of translation table walk */
     { .name = "TLBIMVALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimva_is_write },
     { .name = "TLBIMVAALIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
-      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
+      .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlbis,
       .writefn = tlbimvaa_is_write },
     { .name = "TLBIMVAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
@@ -6724,19 +6735,19 @@ static const ARMCPRegInfo pauth_reginfo[] = {
 static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-- 
2.25.1


