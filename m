Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A47599AD0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:22:59 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP05b-0000br-1D
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkN-0002Ce-0Y
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkG-0001Q6-HZ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id k9so4784375wri.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=gmgWZcEd2xgM6CGJtMX2e3RN3Kslo8iCQtt3bLXG/as=;
 b=wBXAy7+sSeyMEqVnntIC1ZeLi6BGN4wS3BnY73ClYHUItCTrG9dH8HCgL75ICYr0p0
 YEplB0xzns0gpHECYIrHWTOabRZs1lDo7W6ULemAsFxNJhEpGYrYCpefSWzQGbm8NWE/
 2h3EX7v9TlhSrtmKtk6z/RC8gFdPWPw2iAaeGv2ZLOEUfMxIasAdZ1f370yf2u3aAkW5
 nDsjUEHehDljKX5IvtQa1BKM37h302dLASyU5m3hBpx2fqFt06FcA+nZT5riBY713hAM
 54msD/1aqUCrES5D5MPKZMAD4VEk4vCpODdch7C0yiywOUPHevz8T3Y0n8UIebeD8Z5V
 OY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=gmgWZcEd2xgM6CGJtMX2e3RN3Kslo8iCQtt3bLXG/as=;
 b=wSPyxJ5ZYPKRk1ulCJN/tKxYqh9Tlsmrq9Lz0HsNWRzXXZB6FChDPX4ZCYSGU8Hx3u
 U/MLxwPqXu+VvAGDr4NykR15HWSPHaSloJuBTINWk8Buw6eP55uZNh9CjfsrC1rGm6Nx
 9++br/qqnGRF6o3+ccAM8WYQvz2Hr1akl6Rstm/P2oQ7LZp0KNSI4lYe6lpuR+/Z0+5X
 O7Qnt6n/rIYlqWjdTeZLmkshtsaaoGSK3sAekjjI33ut7k+gLKqM5PZ2TWC4isskJIxz
 APTosEHttP36k3rbeSHd2o4L/tHT6l16BMp6+k0dz4ox520hhgdkjVbK46PvuSEruOIP
 GbsQ==
X-Gm-Message-State: ACgBeo3JxlbEqjdrss0Qn/wo6M1QZnLD24eCy2HgLBeY/F5/x781l5B6
 xdvFiyX3Q4hcdvZ3iHFoEDyA3A==
X-Google-Smtp-Source: AA6agR5IsRs0+LIAr/G2doP9i8eLJM8EcrYDN2nxvC9FeyS7xH1UM9JCSiLdTPy5Q5yq+9jgYkrKmw==
X-Received: by 2002:a5d:4204:0:b0:225:382f:a8be with SMTP id
 n4-20020a5d4204000000b00225382fa8bemr1631192wrq.379.1660906855117; 
 Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Make cpregs 0, c0, c{3-15},
 {0-7} correctly RAZ in v8
Date: Fri, 19 Aug 2022 12:00:47 +0100
Message-Id: <20220819110052.2942289-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In the AArch32 ID register scheme, coprocessor registers with
encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
what in v6 and v7 was called the "CPUID scheme", and are supposed to
RAZ if they're not allocated to a specific ID register.  For our
pre-v8 CPUs we get this right, because the regdefs in
id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
for v8 we failed to put in the necessary patterns to cover this, so
we end up UNDEFing on everything we didn't have an ID register for.
This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
are now being used for new ID registers, and guests might thus start
trying to read them.  (We already have one of these: ID_PFR2.)

For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
is, the space is completely allocated with no reserved spaces).  Add
entries to v8_idregs[] covering 0, c0, c3, {0-7}:
 * c3, {0-2} is the reserved AArch32 space corresponding to the
   AArch64 MVFR[012]_EL1
 * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
   (in fact some of these are given defined meanings in Armv8.6,
   but we don't implement them yet)
 * c3, 4 is ID_PFR2 (already defined)

We then programmatically add RAZ patterns for AArch32 for
0, c0, c{4..15}, {0-7}:
 * c4-c7 are unused, and not shared with AArch64 (these
   are the encodings corresponding to where the AArch64
   specific ID registers live in the system register space)
 * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
   the AArch32 reserved-should-RAZ space to cover these;
   the equivalent area of the AArch64 sysreg space is not
   defined as must-RAZ

Note that the architecture allows some registers in this space
to return an UNKNOWN value; we always return 0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..c171770b035 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7345,11 +7345,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        /* AArch64 ID registers, which all have impdef reset values.
+        /*
+         * v8 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
          * must all RAZ, not UNDEF; future architecture versions may
          * define new registers here.
+         * ID registers which are AArch64 views of the AArch32 ID registers
+         * which already existed in v6 and v7 are handled elsewhere,
+         * in v6_idregs[].
          */
+        int i;
         ARMCPRegInfo v8_idregs[] = {
             /*
              * ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST in system
@@ -7539,7 +7544,34 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.mvfr2 },
-            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            /*
+             * "0, c0, c3, {0,1,2}" are the encodings corresponding to
+             * AArch64 MVFR[012]_EL1. Define the STATE_AA32 encoding
+             * as RAZ, since it is in the "reserved for future ID
+             * registers, RAZ" part of the AArch32 encoding space.
+             */
+            { .name = "RES_0_C0_C3_0", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_1", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 1,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_2", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            /*
+             * Other encodings in "0, c0, c3, ..." are STATE_BOTH because
+             * they're also RAZ for AArch64, and in v8 are gradually
+             * being filled with AArch64-view-of-AArch32-ID-register
+             * for new ID registers.
+             */
+            { .name = "RES_0_C0_C3_3", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7549,17 +7581,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_pfr2 },
-            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7625,6 +7657,29 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
+
+        for (i = 4; i < 16; i++) {
+            /*
+             * Encodings in "0, c0, {c4-c7}, {0-7}" are RAZ for AArch32.
+             * For pre-v8 cores there are RAZ patterns for these in
+             * id_pre_v8_midr_cp_reginfo[]; for v8 we do that here.
+             * v8 extends the "must RAZ" part of the ID register space
+             * to also cover c0, 0, c{8-15}, {0-7}.
+             * These are STATE_AA32 because in the AArch64 sysreg space
+             * c4-c7 is where the AArch64 ID registers live (and we've
+             * already defined those in v8_idregs[]), and c8-c15 are not
+             * "must RAZ" for AArch64.
+             */
+            g_autofree char *name = g_strdup_printf("RES_0_C0_C%d_X", i);
+            ARMCPRegInfo v8_aa32_raz_idregs = {
+                .name = name,
+                .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 0, .crn = 0, .crm = i, .opc2 = CP_ANY,
+                .access = PL1_R, .type = ARM_CP_CONST,
+                .accessfn = access_aa64_tid3,
+                .resetvalue = 0 };
+            define_one_arm_cp_reg(cpu, &v8_aa32_raz_idregs);
+        }
     }
 
     /*
-- 
2.25.1


