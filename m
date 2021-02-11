Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B9318C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:51:42 +0100 (CET)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACNh-0004C0-Ci
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZT-0000D8-R1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZK-00009r-2z
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l17so3920269wmq.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+xKp4USF8HdcDvFONqzcb5CsKSqkOk9RvnsPo2dYa6Q=;
 b=K90Ye++pe7OxoQFaKHP+ll2MmniIflL5xVIXePq9EReK/1wqllO67vhif1NDKJyI3S
 /mIhIhkekGpjAoEE8KzLTHExh19vMKd7vqb9TJW9T0BOsbpMROUlWbinRa7iR2burrEP
 DLcXVHD02dtxLp3KJtoEX+NvZK+5Lig2hrESIfBKF2Pk5ZbMjenr5FoHq8K63UnR+JLz
 EtYWHw10SNajeYZgbuWF1I2dJZ+pT8N8WprMHNxCqX9MWT/4FLxAuYJZiTN5fQRDNfZv
 C31JFYVwrZhCZvGeg6MidzfQDaD012exzt0K49qxzLiXpNSS8ZpWZ1MTvHtLVTiAwYPX
 h13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xKp4USF8HdcDvFONqzcb5CsKSqkOk9RvnsPo2dYa6Q=;
 b=i2nnfbGQcusFP92XEq5m2bgLwJTm8YeQ0NZ77rSpSWHVb1XP1r1wX0xnAaPJtDmkR7
 5LhW60+ZB03VMJojKoIfuJQLrZglKs6HyEWrxm+15KWIcIOQV2HnAZl2CuxwZNldDq6r
 Y4DPcR+4e1taVra85lrK1n7GyYNQSijeSZRcIajDNHM+2oh04OIK+oVhlikdAr5DTaT/
 RJRHlzbPp3brYmQPuftRpxo5kyAiYIbNLWD/RwLsScln8uP+N121OaBYLb6rYvsIw1FE
 8JKF4v/jMcLbB4ugvRonJ/PZbybQMpQ5dihK5aB2hlj0VJfjjyjy7v+bdopnlhlgE3Rk
 CiVg==
X-Gm-Message-State: AOAM530/tOA2pwcXO7u78op3GWDasPDsGyCMz08x9Z6S764IoaANfsyK
 AAi/wV0rufVIWhq/U+FEJSU9s3+6OuYi0Q==
X-Google-Smtp-Source: ABdhPJz81L3a4r7sV9o8BOMITShIp9jyH6oyuZSnsPxXpP4Ppur92HCjuPJnd+ucoI37qGdos2egjw==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr5133746wmc.185.1613048376951; 
 Thu, 11 Feb 2021 04:59:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] target/arm: Correctly initialize MDCR_EL2.HPMN
Date: Thu, 11 Feb 2021 12:59:00 +0000
Message-Id: <20210211125900.22777-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Daniel Müller <muellerd@fb.com>

When working with performance monitoring counters, we look at
MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
counters are "enabled" for < EL2.
That's in violation of the Arm specification, which states that

> On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> PMCR_EL0.N

That's also what a comment in the code acknowledges, but the necessary
adjustment seems to have been forgotten when support for more counters
was added.
This change fixes the issue by setting the reset value to PMCR.N, which
is four.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2c27077fb2d..0e1a3b94211 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,6 +38,7 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
+#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -5735,13 +5736,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset value
-     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
-     * don't implement any PMU event counters, so using zero as a reset
-     * value for MDCR_EL2 is okay
+     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
      */
     { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
       .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
@@ -6672,7 +6671,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = 4;
+    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
-- 
2.20.1


