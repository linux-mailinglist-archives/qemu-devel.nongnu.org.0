Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5B51FBE5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:03:45 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no276-0001xS-Lv
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22T-00073w-1A
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Q-0001Gn-D3
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id e24so19108668wrc.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vS3vnqyqeVbTmMwpOiEpeAFu4aTlt8ymePUVlIPTNuA=;
 b=PBzoCT6kke2+/PWr10clQtscft37He8oP/r/by+OI3W4YpHg7073bFUTvrnLFCxYuy
 2X/Wr69Cg09HtgZB/nhDzhXAvBod6gxq9/WMeDNvigIMFv+Ko2mk2kAmYa0aWKUMQEiq
 E/IBZ4XnrrFcBEP29xVUrPogPN1Zm9AngYgb+SMviK7o9vnWqw3uziyaF3Do6n/f7gwk
 0ZqCbhJYzeWHYBNuu5lKfGpfqfpWsMzgphCv2xZKBQ0kFqEHOscdAuZvz4As299MRPDw
 1qAJp4rS6PsqTlKqcPg0unJpWq9ZCqqmkR6tla1jtMrfHxpjdi+FjpUKe0+dmVWpZqGP
 zVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vS3vnqyqeVbTmMwpOiEpeAFu4aTlt8ymePUVlIPTNuA=;
 b=1BQU2C9w/84KNy/FHLo3aRcNh0RUwN7Qp+fphKU9UQathpehLyCm6bnLiTrxM3reuV
 cKJ5eUpiyCQjKpLB6+AvoUsj7jJGZwzhLwsUoOWHD6hF5AUsU/PRWbS1kA5yTHu6HgNI
 o66irAOABzSS8AJ1zPsxLYtsobtWEAYfDdfTd1XQz3jKsukOm3Q/1a9Mj1bE3LhuUf5Q
 QqOVd1Ahf8DH0PTuOuRyjL9gksd7H78VRcwPRH9ufFfrTOFV+4s3pgO/tui1N1/N3XAm
 Es7PQbcoEwZvgRtG9heN24SmwFsujHWNhHXMruNZ1T244JHA8MtFGG5CvqC3+4QfEtLY
 zwmw==
X-Gm-Message-State: AOAM532/CkyuhJn+9D4Ey1JS8AFnQwTnIZ4FQdKhwyv+47Lmy03DxMeF
 QL+npPHBE6nDiLBq98OWyIEQJ7ZFPVxwKA==
X-Google-Smtp-Source: ABdhPJwlA2ZpO6Uw0TcqJN1qUaaGbX8QXJJUXikM6hwbFx1ZRigvPU6OVfbuTs7iJ2utQYNPm+SVBA==
X-Received: by 2002:a05:6000:2a5:b0:20c:520a:a12e with SMTP id
 l5-20020a05600002a500b0020c520aa12emr13088129wry.629.1652097531815; 
 Mon, 09 May 2022 04:58:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/32] target/arm: Handle cpreg registration for missing EL
Date: Mon,  9 May 2022 12:58:18 +0100
Message-Id: <20220509115848.3521805-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

More gracefully handle cpregs when EL2 and/or EL3 are missing.
If the reg is entirely inaccessible, do not register it at all.
If the reg is for EL2, and EL3 is present but EL2 is not,
either discard, squash to res0, const, or keep unchanged.

Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.
Mark the 2 virtualization processor id regs ARM_CP_EL3_NO_EL2_C_NZ.

This will simplify cpreg registration for conditional arm features.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h |  11 +++
 target/arm/helper.c | 178 ++++++++++++++++++++++++++++++--------------
 2 files changed, 133 insertions(+), 56 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 73984549d25..db03d6a7e13 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -102,6 +102,17 @@ enum {
     ARM_CP_SVE                   = 1 << 14,
     /* Flag: Do not expose in gdb sysreg xml. */
     ARM_CP_NO_GDB                = 1 << 15,
+    /*
+     * Flags: If EL3 but not EL2...
+     *   - UNDEF: discard the cpreg,
+     *   -  KEEP: retain the cpreg as is,
+     *   -  C_NZ: set const on the cpreg, but retain resetvalue,
+     *   -  else: set const on the cpreg, zero resetvalue, aka RES0.
+     * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+     */
+    ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
+    ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
+    ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
 };
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4daf4f0761..9ab8b65e7bc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5056,16 +5056,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
     { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_FPU,
+      .access = PL2_RW,
+      .type = ARM_CP_ALIAS | ARM_CP_FPU | ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]) },
     { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .type = ARM_CP_EL3_NO_EL2_KEEP,
       .writefn = dacr_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
     { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .type = ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
     { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
@@ -5542,27 +5543,27 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = tlbimva_hyp_is_write },
     { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2_write },
     { .name = "TLBI_VAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2_write },
     { .name = "TLBI_VALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2_write },
     { .name = "TLBI_ALLE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2is_write },
     { .name = "TLBI_VAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
     { .name = "TLBI_VALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
 #ifndef CONFIG_USER_ONLY
     /* Unlike the other EL2-related AT operations, these must
@@ -5572,11 +5573,13 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "AT_S1E2R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 0,
       .access = PL2_W, .accessfn = at_s1e2_access,
-      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC, .writefn = ats_write64 },
+      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC | ARM_CP_EL3_NO_EL2_UNDEF,
+      .writefn = ats_write64 },
     { .name = "AT_S1E2W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 1,
       .access = PL2_W, .accessfn = at_s1e2_access,
-      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC, .writefn = ats_write64 },
+      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC | ARM_CP_EL3_NO_EL2_UNDEF,
+      .writefn = ats_write64 },
     /* The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
      * if EL2 is not implemented; we choose to UNDEF. Behaviour at EL3
      * with SCR.NS == 0 outside Monitor mode is UNPREDICTABLE; we choose
@@ -6076,7 +6079,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP },
+      .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
     /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
      * Channel but Linux may try to access this register. The 32-bit
      * alias is DBGDCCINT.
@@ -6892,11 +6895,11 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NOP },
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
    { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
@@ -6906,19 +6909,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NOP },
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
    { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2_write },
    { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2_write },
    { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
@@ -6973,11 +6976,11 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2is_write },
     { .name = "TLBI_VAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
    { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
@@ -6985,7 +6988,7 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_VALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
     { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
@@ -7905,21 +7908,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = cpu->midr, .type = ARM_CP_ALIAS,
+              .resetvalue = cpu->midr,
+              .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
             { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .resetvalue = cpu->midr,
+              .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = vmpidr_def, .type = ARM_CP_ALIAS,
+              .resetvalue = vmpidr_def,
+              .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
             { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-              .access = PL2_RW,
-              .resetvalue = vmpidr_def,
+              .access = PL2_RW, .resetvalue = vmpidr_def,
+              .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
         };
         define_arm_cp_regs(cpu, vpidr_regs);
@@ -8506,13 +8512,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
+    CPUARMState *env = &cpu->env;
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
-    bool isbanked;
     size_t name_len;
+    bool make_const;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
@@ -8547,6 +8554,32 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
+    /*
+     * Eliminate registers that are not present because the EL is missing.
+     * Doing this here makes it easier to put all registers for a given
+     * feature into the same ARMCPRegInfo array and define them all at once.
+     */
+    make_const = false;
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        /*
+         * An EL2 register without EL2 but with EL3 is (usually) RES0.
+         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+         */
+        int min_el = ctz32(r->access) / 2;
+        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
+            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
+                return;
+            }
+            make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
+        }
+    } else {
+        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
+                                 ? PL2_RW : PL1_RW);
+        if ((r->access & max_el) == 0) {
+            return;
+        }
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8567,44 +8600,77 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->opaque = opaque;
     }
 
-    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
-    if (isbanked) {
+    if (make_const) {
+        /* This should not have been a very special register to begin. */
+        int old_special = r2->type & ARM_CP_SPECIAL_MASK;
+        assert(old_special == 0 || old_special == ARM_CP_NOP);
         /*
-         * Register is banked (using both entries in array).
-         * Overwriting fieldoffset as the array is only used to define
-         * banked registers but later only fieldoffset is used.
+         * Set the special function to CONST, retaining the other flags.
+         * This is important for e.g. ARM_CP_SVE so that we still
+         * take the SVE trap if CPTR_EL3.EZ == 0.
          */
-        r2->fieldoffset = r->bank_fieldoffsets[ns];
-    }
+        r2->type = (r2->type & ~ARM_CP_SPECIAL_MASK) | ARM_CP_CONST;
+        /*
+         * Usually, these registers become RES0, but there are a few
+         * special cases like VPIDR_EL2 which have a constant non-zero
+         * value with writes ignored.
+         */
+        if (!(r->type & ARM_CP_EL3_NO_EL2_C_NZ)) {
+            r2->resetvalue = 0;
+        }
+        /*
+         * ARM_CP_CONST has precedence, so removing the callbacks and
+         * offsets are not strictly necessary, but it is potentially
+         * less confusing to debug later.
+         */
+        r2->readfn = NULL;
+        r2->writefn = NULL;
+        r2->raw_readfn = NULL;
+        r2->raw_writefn = NULL;
+        r2->resetfn = NULL;
+        r2->fieldoffset = 0;
+        r2->bank_fieldoffsets[0] = 0;
+        r2->bank_fieldoffsets[1] = 0;
+    } else {
+        bool isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
 
-    if (state == ARM_CP_STATE_AA32) {
         if (isbanked) {
             /*
-             * If the register is banked then we don't need to migrate or
-             * reset the 32-bit instance in certain cases:
-             *
-             * 1) If the register has both 32-bit and 64-bit instances then we
-             *    can count on the 64-bit instance taking care of the
-             *    non-secure bank.
-             * 2) If ARMv8 is enabled then we can count on a 64-bit version
-             *    taking care of the secure bank.  This requires that separate
-             *    32 and 64-bit definitions are provided.
+             * Register is banked (using both entries in array).
+             * Overwriting fieldoffset as the array is only used to define
+             * banked registers but later only fieldoffset is used.
              */
-            if ((r->state == ARM_CP_STATE_BOTH && ns) ||
-                (arm_feature(&cpu->env, ARM_FEATURE_V8) && !ns)) {
+            r2->fieldoffset = r->bank_fieldoffsets[ns];
+        }
+        if (state == ARM_CP_STATE_AA32) {
+            if (isbanked) {
+                /*
+                 * If the register is banked then we don't need to migrate or
+                 * reset the 32-bit instance in certain cases:
+                 *
+                 * 1) If the register has both 32-bit and 64-bit instances
+                 *    then we can count on the 64-bit instance taking care
+                 *    of the non-secure bank.
+                 * 2) If ARMv8 is enabled then we can count on a 64-bit
+                 *    version taking care of the secure bank.  This requires
+                 *    that separate 32 and 64-bit definitions are provided.
+                 */
+                if ((r->state == ARM_CP_STATE_BOTH && ns) ||
+                    (arm_feature(env, ARM_FEATURE_V8) && !ns)) {
+                    r2->type |= ARM_CP_ALIAS;
+                }
+            } else if ((secstate != r->secure) && !ns) {
+                /*
+                 * The register is not banked so we only want to allow
+                 * migration of the non-secure instance.
+                 */
                 r2->type |= ARM_CP_ALIAS;
             }
-        } else if ((secstate != r->secure) && !ns) {
-            /*
-             * The register is not banked so we only want to allow migration
-             * of the non-secure instance.
-             */
-            r2->type |= ARM_CP_ALIAS;
-        }
 
-        if (HOST_BIG_ENDIAN &&
-            r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
-            r2->fieldoffset += sizeof(uint32_t);
+            if (HOST_BIG_ENDIAN &&
+                r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
+                r2->fieldoffset += sizeof(uint32_t);
+            }
         }
     }
 
@@ -8615,7 +8681,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if (r->type & ARM_CP_SPECIAL_MASK) {
+    if (r2->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
-- 
2.25.1


