Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5564DBA6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhM-0006pu-P4; Thu, 15 Dec 2022 07:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngy-0006o6-3o
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngw-00045d-B8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ay40so13693114wmb.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ougWcpCr0agOiWwlIFOxBLhj1zjV6ygB6kJrSrjza6I=;
 b=UEJVFVWqI+mE9AZhklJe4JNahIOLU5WJQc1avxvwklyIhYtwOP9CBhWyu7Yr1ZaXpg
 Lj8r4Do368UaLXRrGfi3JcLHiwYS+1eNJqKHbVtrexGgS4ek4z2WE/8WDs7PDSHEmUlW
 b1WKDhvsrl1O1P2cgNywzpnFRn3KyLfO2IwxHEDd/CWiIt1q8nz4LiNyks1Dgnq4htiL
 IP3yN0GRtk/XQaeM8XU14AV3ulRdEVrsjNJ/cizc7ZJ2upCv5VHxTekDLPy3ym5Ig4sD
 FPC9wORaSS2s4PARvZbEHxKn99mDyRbqYG42cmvkLK9vQoKOa5qfdxlObf/KqwyDkfTh
 6+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ougWcpCr0agOiWwlIFOxBLhj1zjV6ygB6kJrSrjza6I=;
 b=4DfiieEZ8m0LzsPIz+nwWSO93LCbwlr77HWMHmpADUZgyduJ5vkA6/IxDC+0hat4Au
 wTbeKIDZVS8QHCN87OVy/M5oo+JM1pzprdIb6kQOJXOU+V0NOSZocJBAQ1P7qnQEqsK0
 WDleP1hWQWjpyxuKeu3T4dDq1lVGqvK5Wm8ATlYbaeYiM9RcMRK9JSkgQO8z53d2gQXF
 MUxV7ym2Gng+xQekT4JWjwK2loprsmkyLu2uEDwQgPa+rUnfdX9MD5zMeePgqE3aVgXU
 +J2xvxGBW5L8sMVGPenF90pwa8XDK/xNPbJNwMG2UF0wC5nSi79z+kJH1gT4z6praNbq
 Jc4w==
X-Gm-Message-State: ANoB5pk1/YYF+5WeTt15JNRaj985psWY0LaXkrwvI53drPYo+LS6oTk2
 zaE86hbMbrDJIZ8JBvRhJXhptM10MkVtbdGd
X-Google-Smtp-Source: AA0mqf5DvmJiuyqTU5Au1xsHMbe5UfTKwhahnJ2LxQLqAbfipMypHSQQp7PB0qNiVnyH/jhBk9XM8Q==
X-Received: by 2002:a05:600c:21c1:b0:3cf:8833:1841 with SMTP id
 x1-20020a05600c21c100b003cf88331841mr22236184wmj.39.1671108625672; 
 Thu, 15 Dec 2022 04:50:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] target/arm: Implement HCR_EL2.TID4 traps
Date: Thu, 15 Dec 2022 12:49:55 +0000
Message-Id: <20221215125009.980128-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

For FEAT_EVT, the HCR_EL2.TID4 trap allows trapping of the cache ID
registers CCSIDR_EL1, CCSIDR2_EL1, CLIDR_EL1 and CSSELR_EL1 (and
their AArch32 equivalents).  This is a subset of the registers
trapped by HCR_EL2.TID2, which includes all of these and also the
CTR_EL0 register.

Our implementation already uses a separate access function for
CTR_EL0 (ctr_el0_access()), so all of the registers currently using
access_aa64_tid2() should also be checking TID4.  Make that function
check both TID2 and TID4, and rename it appropriately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eee95a42f7f..bac2ea62c44 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1895,11 +1895,12 @@ static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     scr_write(env, ri, 0);
 }
 
-static CPAccessResult access_aa64_tid2(CPUARMState *env,
-                                       const ARMCPRegInfo *ri,
-                                       bool isread)
+static CPAccessResult access_tid4(CPUARMState *env,
+                                  const ARMCPRegInfo *ri,
+                                  bool isread)
 {
-    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TID2)) {
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TID2 | HCR_TID4))) {
         return CP_ACCESS_TRAP_EL2;
     }
 
@@ -2130,12 +2131,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R,
-      .accessfn = access_aa64_tid2,
+      .accessfn = access_tid4,
       .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
     { .name = "CSSELR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 2, .opc2 = 0,
       .access = PL1_RW,
-      .accessfn = access_aa64_tid2,
+      .accessfn = access_tid4,
       .writefn = csselr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.csselr_s),
                              offsetof(CPUARMState, cp15.csselr_ns) } },
@@ -7281,7 +7282,7 @@ static const ARMCPRegInfo ccsidr2_reginfo[] = {
     { .name = "CCSIDR2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 2,
       .access = PL1_R,
-      .accessfn = access_aa64_tid2,
+      .accessfn = access_tid4,
       .readfn = ccsidr2_read, .type = ARM_CP_NO_RAW },
 };
 
@@ -7581,7 +7582,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
             .access = PL1_R, .type = ARM_CP_CONST,
-            .accessfn = access_aa64_tid2,
+            .accessfn = access_tid4,
             .resetvalue = cpu->clidr
         };
         define_one_arm_cp_reg(cpu, &clidr);
-- 
2.25.1


