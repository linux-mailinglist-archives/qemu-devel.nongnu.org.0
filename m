Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874751622B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:21:09 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2xA-0000de-9a
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tt-0006tX-Ag
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tq-0001JN-8H
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id i1so4136920plg.7
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86JJW2/FsLKv+cotPyQaiKRVQrrBoAkHpPLmFPzaDwg=;
 b=ekmmEKwRd9JGSms00gpnpBQruTkcfb1tSYSURO0+FzYuTmFloOuyeh+TG10Dj8aolv
 IeGym91dmCLr45pyQNXljS8fH9S2oflhAr0I4pFOhTX9ToR3UFVMdnwYmteIY5tIqXaU
 0w/FcMyfz19KxS0kwcV9fMBk/ofrU2gk6ErNGtduLSYVqo9GMBGVoLb+IirX3IGW9UIm
 ByM7G+UUcXqU+vFrFqC+Tvs8w2a0pA2dXONMZggDHvqFGOfDOqIijbcAmhTYvJHVdmnf
 4qnyCUcd4W4qVSItWoCflXWtzWIh3gPU+gtr5eGjQvN8R8Yu+aYIBkv5TfLmzG3e38wE
 +RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86JJW2/FsLKv+cotPyQaiKRVQrrBoAkHpPLmFPzaDwg=;
 b=bJEkQaor9zPQn1pEOKgFCsFA4XNv3Yoz4oRYhcJrUiPrFtzlivvw/1ZQS4b+lN4Zzr
 mwmWFzlgMPIqABbI2iT7IJ4Ap2jFOZtndPgbpiNeIYkh8m0J2UIM8/l2Z/BqFQQqEQnc
 xt2rqRYOgWONBVBFEKqVj+29AcwbVfRMaD/xjI5lP0VMTtY+GmR30tSaViTE+rKO3XLO
 y9cknLuM9y8NiTj5qDpZrDjlqPNXqiekbEhmtMtfPpRLOKxjpv0FZzxiUMllmBYAnHhW
 M0blMfgkzetVCHSSfzdXGqRGPyeY6b/OR3pJh58ZgoSkm3GjZTrAwgqRGObuze8/lphs
 8L4w==
X-Gm-Message-State: AOAM533+tuYMJUvn+Ae8ZiAihL8ZWxKcLWBMX/Luyb74iET3Z4+Oa+iP
 lG+wQ1UoNBIMXcZOrNnJfoY7pshZQbzXdQ==
X-Google-Smtp-Source: ABdhPJyLIxlQAmykSFzVT5igepbyNzFW2BOGf0RznG7lvMwlGFCO06NnfuwMUOJOTKUfGGoH4ewR6w==
X-Received: by 2002:a17:90b:1d87:b0:1d9:c22a:eba with SMTP id
 pf7-20020a17090b1d8700b001d9c22a0ebamr7100156pjb.83.1651384248742; 
 Sat, 30 Apr 2022 22:50:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/45] target/arm: Handle cpreg registration for missing EL
Date: Sat, 30 Apr 2022 22:50:02 -0700
Message-Id: <20220501055028.646596-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More gracefully handle cpregs when EL2 and/or EL3 are missing.
If the reg is entirely inaccessible, do not register it at all.
If the reg is for EL2, and EL3 is present but EL2 is not,
either discard, squash to const, or keep unchanged.

Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.

This will simplify cpreg registration for conditional arm features.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add ARM_CP_EL3_NO_EL2_{UNDEF,KEEP}.
---
 target/arm/cpregs.h |   9 +++
 target/arm/helper.c | 163 ++++++++++++++++++++++++++++++--------------
 2 files changed, 120 insertions(+), 52 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 73984549d2..9ed94d7121 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -102,6 +102,15 @@ enum {
     ARM_CP_SVE                   = 1 << 14,
     /* Flag: Do not expose in gdb sysreg xml. */
     ARM_CP_NO_GDB                = 1 << 15,
+    /*
+     * Flags: If EL3 but not EL2...
+     *   - UNDEF: discard the cpreg,
+     *   -  KEEP: retain the cpreg as is,
+     *   -  else: set CONST on the cpreg.
+     * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+     */
+    ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
+    ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
 };
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4359739081..598a9253d0 100644
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
@@ -8506,13 +8509,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
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
@@ -8547,6 +8551,32 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
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
@@ -8567,44 +8597,73 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
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
+         * value with writes ignored.  So leave resetvalue as is.
+         *
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
 
@@ -8615,7 +8674,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if (r->type & ARM_CP_SPECIAL_MASK) {
+    if (r2->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
-- 
2.34.1


