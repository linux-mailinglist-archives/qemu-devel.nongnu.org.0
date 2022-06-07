Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC60541593
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:38:01 +0200 (CEST)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfxg-0006RK-Ko
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft7-0007HV-7U
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft3-0007Df-LN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gd1so16669569pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=WQfeqX1U+IFBpsPRJTcz748nuIuq87IcS6s8MhUOl8rTJ8kk68tIQyEP4guqvNB8dp
 VUymy3PVaIsPJSUqaBAG1XsWLAVz9WrFu1MIYMxTNw1t0SlZGA6XThZGhIqe8rUsZJoO
 3+W7xxRqmmZcxFcawoH+Utc6BhOanbPqSm2O57Zvvu3zHGyy9QmrJZ30D57X7WChu59K
 c88XOwMrB8es88jk9DKGjT/HDUKTTtroasiEjvx5hQOEh0SxZUz85HoehAjLRNZQ5hMc
 tGJTPRNxMn9sv8KZ+GRxRO3t4wgmNVzbGakXsLwtTqyRfKiSpMo1Q1ZHrP2iZOxUR/kw
 vA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=uHugxMOgDhLDy7tEJMKZUinAw/w296wvKrA3DVQhPAdpWahimMC7Gg9ZaMXEDyMyPD
 gIZJCc9Kzag6Dw6Nq18PDp7+lhFd4TGwcSOL+xL6mPGO81/jy+XoNZKlts5SM1zwRO2w
 yrnlZHQWOFRUy7vOwgc6+ll2PqKutAlg7KX3s3AaxI9/e9h/RYe2kRkxdPngx8V1dyod
 xhljBL+CpNbruKjfUrXQiPS2LRNTYJgHRSWMlZgTb4OmpAryHcIByRPya8i3vTKjrMow
 qe0FZ1Y/0EPoksUEd3ARXxbsGaauIKaJP2R+YCRbDSAu+Nu2PlVlbvjogi1FdW114ksY
 v89w==
X-Gm-Message-State: AOAM530RGly2YKG4tmWbibUnC5bjJxAtDD1Vj4nFIYQATCGh/Jpw6wQk
 mIVuY448iuRrT4oV7S038GWQkDmvf5hS+w==
X-Google-Smtp-Source: ABdhPJyI2/kz8fzoIbziI7kmc0mnosqxP+zauB/QzOclprY+79e16MVKTPC39K7TSMmuuAUpXi7JUg==
X-Received: by 2002:a17:903:41d0:b0:167:68a7:c2f with SMTP id
 u16-20020a17090341d000b0016768a70c2fmr17693386ple.148.1654633992263; 
 Tue, 07 Jun 2022 13:33:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/71] target/arm: Add el_is_in_host
Date: Tue,  7 Jun 2022 13:32:00 -0700
Message-Id: <20220607203306.657998-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


