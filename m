Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B67689BB2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4g-0006qo-RJ; Fri, 03 Feb 2023 09:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006hm-M1
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-00056G-FH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4005857wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mxLk9UAVIvLrK+pxFU4lwUCPe5SiyMuXU578mmntVS4=;
 b=XhmwRjzK31X5R9YD1XmKUTIz6wfW8bbCzHBF/xH72qBdmi9dhHZicnAh41q4rYn34I
 u7qj6o8hrG1HX6rWrE5AMV1QemcP24eRo86pwan9RP2l3n22NIkRkzKk/6oXXYnrQlw1
 6nlYfumTkA6x5+3iRelpkPwxOav1dCodHuj/DFqsJEPgor2sB+DNJVKNIAbIffYvp6Fi
 vTblwMJ+E2vLFfZ29YMCsgha1nle2uIOdi5/17hDGneuxWP/qg+ZSLSrvRAJXRKJ+1K0
 1pM2B7NE8eztbFG65lVZgLDJG+mbiFAUZmEVtEEmTR5K3fOvK34s0TIUKHkoLGK3Q5fV
 o1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxLk9UAVIvLrK+pxFU4lwUCPe5SiyMuXU578mmntVS4=;
 b=NOiazYP2H+fcwDELKO24myJl2zrSKNC+giOoDz8OimmCxsFLF+jdMw5rQeFSvJPX6U
 yV9dWJyiRLMKSh3MYN0sYmVxlLmB5QKeSuoyTLCV0xaFtv9sR4mbCdG64j+giO78dUvY
 2LCOm2GdG701yhPocjySBUJGM4s64AB5zmK4Z7b9cG45nTZ+ORRdjT2Dh6ARyffuEOzv
 Ubq/HyzhCIJey05M85MdygkPbpKi9pKMTmpJXvTJxNrNR7TeRvYhOg0hIEhX97auPJg4
 VfZNDsNf1pVap3P2wsWO7LfiroJFpJWulPwTJ6LlrivB6MrfgZqsBKThP1Iu3fXbOBUF
 44Bw==
X-Gm-Message-State: AO0yUKWmy2GpyiPr91IYme0mgtvk8dOonDzl7BDWEJtQsTt6dI5mCgTe
 8RGri6SiH/qbK7t+NuYNEct5azvMBcYnt0J7
X-Google-Smtp-Source: AK7set92DmYWoeVR3LVzJcgJyCqqn73/7ZwKI2RIb4gBxtmLTwwsGKprCtO8uzIgMPE27+XWIn30dg==
X-Received: by 2002:a05:600c:4f96:b0:3cf:9844:7b11 with SMTP id
 n22-20020a05600c4f9600b003cf98447b11mr10832298wmq.23.1675434583478; 
 Fri, 03 Feb 2023 06:29:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
Date: Fri,  3 Feb 2023 14:29:11 +0000
Message-Id: <20230203142927.834793-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

The HSTR_EL2 register is not supposed to have an effect unless EL2 is
enabled in the current security state.  We weren't checking for this,
which meant that if the guest set up the HSTR_EL2 register we would
incorrectly trap even for accesses from Secure EL0 and EL1.

Add the missing checks. (Other places where we look at HSTR_EL2
for the not-in-v8A bits TTEE and TJDBX are already checking that
we are in NS EL0 or EL1, so there we alredy know EL2 is enabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-8-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-8-peter.maydell@linaro.org
---
 target/arm/helper.c    | 2 +-
 target/arm/op_helper.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6f6772d8e04..66966869218 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11716,7 +11716,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
-    if (el < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 && arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7797a137af6..dec03310ad5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -663,6 +663,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * we only need to check here for traps from EL0.
      */
     if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
+        arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
-- 
2.34.1


