Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508A619578
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquyu-0001Bz-CX; Fri, 04 Nov 2022 07:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyr-0001Af-NC
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyp-000858-Tf
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v1so6629999wrt.11
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rEqx4pUAyvcNCFw109Z//pIeNENb6Z5peeqvuKyFDlg=;
 b=GO4S1Crt0+leZ3f2QF5c7B6Mtn03OXb9a3Rd89djx/6cdOk08SrGN0immgDh+FqoTD
 QIB11iDi8MRJdvw4zyoVO5Vfpd8MtI9BeE0ddKl/IR3aVjz14VyJlNmPP4fizCZSJkcf
 imXM59/IO/Gdk7WFRE3TABld9Qbzgqy7RbZnd3x9PhL0VD39f4mIRyNzsN8T6bRpKu8f
 mCGCAUm1gbvwpi7kgHcHusW/qp4gv/23iJZ24hidL0Jyi3zYxDBEcfVcE+k/Oienn1JW
 R9pz9Tvvql+6LJeIvzbTEK1BSbDb5zEnj7gwXLBxFfILG3HD9Fx0JL6W04jPWM65R/GC
 TQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEqx4pUAyvcNCFw109Z//pIeNENb6Z5peeqvuKyFDlg=;
 b=dnX5OFYcIsctNSU/K1A2kdmK1cY5aY7r+Bcq7wrIqg3RplAgWJg1a5KgFMVbxeeKgx
 ceensm6R2rBzqG2HvxPa8BgQl3H1gn7lWRA2ZiUOmYmO0KEBQf74qKpul613mNDic2Se
 Ooh7Q1JdZdo95B+91vvOaUH+y/AQMyAh78DPwFoYP9eKMj4iEW/iBKMSEjWyLBah9mPe
 YFSBM6mgakPjPtQdEOEaN44mReDKtvzQlx4uPcM8Q/BH2HMO+5wDdPqVHgAuG+QdXgKP
 vERv9XlvmICiwwSJYSS0LJrGZGDM2wp0EgncVc0uffHg5ZeoQLOH9dMvKV7XfX2AQ9uN
 eaVA==
X-Gm-Message-State: ACrzQf3THxET0kcL34R3sD2M+mBphvXw4/X4xO9jA+1gjOMHhK0p1eDQ
 w82eissjbnm7MHywMOh3JADwBZhg0tzAdQ==
X-Google-Smtp-Source: AMsMyM6I+d9DosjM0zqIFL452k15FZxHssemXD1WfmSOz8MTmtbNdfFTqM00zKHjYEKSb8XpHdSeKg==
X-Received: by 2002:a5d:4f8d:0:b0:236:714b:29f0 with SMTP id
 d13-20020a5d4f8d000000b00236714b29f0mr21052319wru.145.1667561721325; 
 Fri, 04 Nov 2022 04:35:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] target/arm: Make TLBIOS and TLBIRANGE ops trap on
 HCR_EL2.TTLB
Date: Fri,  4 Nov 2022 11:35:11 +0000
Message-Id: <20221104113515.2278508-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The HCR_EL2.TTLB bit is supposed to trap all EL1 execution of TLB
maintenance instructions.  However we have added new TLB insns for
FEAT_TLBIOS and FEAT_TLBIRANGE, and forgot to set their accessfn to
access_ttlb.  Add the missing accessfns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b070a20f1ad..efbdc657a2d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6717,51 +6717,51 @@ static const ARMCPRegInfo pauth_reginfo[] = {
 static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
    { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
@@ -6832,27 +6832,27 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
 static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.25.1


