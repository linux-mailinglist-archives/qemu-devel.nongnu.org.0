Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B453C08E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:03:01 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsuC-0005fC-5J
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgm-0004bz-05
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsge-0008Uu-CQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso10610722pjl.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=U4SDgABtc7qf5g49OVWbGQJvO3x2QaH5yFiFAOEre0YLKzh7rpPy5ZXMabsrBz2dlv
 sFRfNlKnLRbH+LJIIfg27obrmm2Zn1eiWBThBo07GsdMkkBVw7OupjcV4h1KCYxvuvKp
 hBMiYfvru7XdZg4IeWIZ2K9hUKsTo2JU8N9Pdzg7EAAMheqbdvQh3jDTKq2GrWmSqUFf
 +UXP/F6Wn30jKevcgQTuh/jF2jNJsml868X+ZtQ4bVGvVowWTyVxlu7eM7eKv85/U0Um
 c+cjtHr0rmklsIpsaCSr9lEymhwUCyB6oXTvkgXoL/v/JSrNcC1R4yn9THAP0dFwnPaV
 UwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=1zlcXjKDjZyd9RgGPlkp53FQlhUKfELGBF3oqMoiols5gjOH800gW1LgY0JqU/e8hv
 IoBQvUBJ3h/MNtwoS5qSAsSXG/cJeEhFK5XftS0YWSLfITY6vQTnfKGwox0X3K3hJf/n
 8VkSBixxA9MEdTj+6xDc8rix5X7+ZcFCA7afwlLyjZnzXnEo5o5IM3Sd+krc9jwv19um
 UIdZISYCt6kBj7j+Q3iO/bPEgVv5jjE5A0ACwtMPWQdEk+Y+7iP4+bIwzQvu5j5XxHqK
 m0esPJ43TyGlWrvMrMcfERrz3g0JBLKtvy7WVAZWFQOyuAebVNHDUPqNoUNcYDpncODl
 Usfg==
X-Gm-Message-State: AOAM530/yuyIdhwyHW37fMSSGhZViWxQuXaDjDby59CbK/5Gg9xmqOsC
 tOzuc5OqmuJDf4samgb1y9pC4POl43rG5A==
X-Google-Smtp-Source: ABdhPJy3HSjPFjSmoHdsCoxs8SZpG+RBuE6WJLGRvO5sPqAq6euvQZWNdo/Kvhvgnmn4MD22jczEiQ==
X-Received: by 2002:a17:90b:1a8a:b0:1e0:3630:19f0 with SMTP id
 ng10-20020a17090b1a8a00b001e0363019f0mr42099725pjb.89.1654206539020; 
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/71] target/arm: Add el_is_in_host
Date: Thu,  2 Jun 2022 14:47:47 -0700
Message-Id: <20220602214853.496211-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

This (newish) ARM pseudocode function is easier to work with
than open-coded tests for HCR_E2H etc.  Use of the function
will be staged into the code base in parts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..a73f2a94c5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1328,6 +1328,8 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+bool el_is_in_host(CPUARMState *env, int el);
+
 void aa32_max_features(ARMCPU *cpu);
 
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bcf48f1b11..839d6401b0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5292,6 +5292,34 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+/*
+ * Corresponds to ARM pseudocode function ELIsInHost().
+ */
+bool el_is_in_host(CPUARMState *env, int el)
+{
+    uint64_t mask;
+
+    /*
+     * Since we only care about E2H and TGE, we can skip arm_hcr_el2_eff().
+     * Perform the simplest bit tests first, and validate EL2 afterward.
+     */
+    if (el & 1) {
+        return false; /* EL1 or EL3 */
+    }
+
+    /*
+     * Note that hcr_write() checks isar_feature_aa64_vh(),
+     * aka HaveVirtHostExt(), in allowing HCR_E2H to be set.
+     */
+    mask = el ? HCR_E2H : HCR_E2H | HCR_TGE;
+    if ((env->cp15.hcr_el2 & mask) != mask) {
+        return false;
+    }
+
+    /* TGE and/or E2H set: double check those bits are currently legal. */
+    return arm_is_el2_enabled(env) && arm_el_is_aa64(env, 2);
+}
+
 static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-- 
2.34.1


