Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAA611344
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPcf-0000r7-Dp; Fri, 28 Oct 2022 09:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPaq-0008No-J5
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPao-0007t9-DS
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id k8so6678781wrh.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cFrjyz9kxKQHptd6tU6hs0Xp4JtLSvbrkHazl2jSWTg=;
 b=mzfZ0RHQAihUnQPO0jkDHxH1l8X8se1bvydIasLdeG+0j2A5TLrTjVAuZ1W1vSpE5V
 k/9QoQkLth1DlFAQPXY0elGMB+3iP2dQa79nVcpCBXsFLr2MozFaAh+0UYx6nqcW1L6e
 EUiK6P71tCIuBsNrAsXDb6ihPBTTS+XbcxVQ+nguvE5U56lSS2VNBlAtKQ06kJd8LxT1
 /2+fE3x/B86f1szCdPh2MQlb/s4+RdZfl7CxFdif+pdTzyfuKUZnKrd02QWRjDDzQMWF
 mloBy7yM3dAjQ1w5ujngO+887nHz9HptH+767+KvNuzJxQSHtGbb1ytLhJ9Rf+R5Mra1
 itqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFrjyz9kxKQHptd6tU6hs0Xp4JtLSvbrkHazl2jSWTg=;
 b=LFG7ItFuFxCHt00iuZZl39MvyPh/K6TXOziZB2lact/ZH/XOxFEmQLiq2MOa5kINFp
 wpp5JF+oYK73Vng0stktfmRR2jJyF6CAFDX1kZnK4m+N29EZmP/MlAoCejXATC9A3QDr
 4A0IvEY/jSCQL0zRcrADTNouKi5TqaezaSrC8KkDvGNHA7zNSRZg7OIvSp1Jg+uXbkeK
 VZUesFEoCHcLQ0PoikgTD5TmgS63X6B/sMbFtb0ykI4ThUIE+LC+tuF6XbPy0eZtx2Bt
 reF9HrSUBgdPbPbmlBZvDE9brq0+9l36FLImEx61LqNraRzpOUBytdgFd2XADzHmN8bA
 FKIw==
X-Gm-Message-State: ACrzQf31466q8PsDekPyVUG+81sbh6Et9cQ4HBk/jLsML0YMz2IRVT25
 a2WjbLq9bZepeObkwS9uwvEUelFnL35gWg==
X-Google-Smtp-Source: AMsMyM5htgs+FtGHeb9FTs1mwulE+i46MtZFujMv7Fa6GJ+2JNfxuMqy/XSd16tg7cfL2WjS2p12hA==
X-Received: by 2002:a05:6000:144b:b0:22f:2b48:e23 with SMTP id
 v11-20020a056000144b00b0022f2b480e23mr34948272wrx.281.1666964413046; 
 Fri, 28 Oct 2022 06:40:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Implement HCR_EL2.TID4 traps
Date: Fri, 28 Oct 2022 14:40:01 +0100
Message-Id: <20221028134002.730598-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
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
---
 target/arm/helper.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1ff91f6daf7..19d1c17a147 100644
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
@@ -7279,7 +7280,7 @@ static const ARMCPRegInfo ccsidr2_reginfo[] = {
     { .name = "CCSIDR2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 2,
       .access = PL1_R,
-      .accessfn = access_aa64_tid2,
+      .accessfn = access_tid4,
       .readfn = ccsidr2_read, .type = ARM_CP_NO_RAW },
 };
 
@@ -7579,7 +7580,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


