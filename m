Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75118529949
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:07:09 +0200 (CEST)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqMO-0005Xj-A7
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4r-0000UA-GS
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4o-0007on-Rk
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:01 -0400
Received: by mail-pl1-x629.google.com with SMTP id m12so16441134plb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZWPLUoqPQwRNEP7N/mQ6KcZy+VCmkdoHNOMQdySREE=;
 b=BBhBZtGRqYUcaXBpG3+7zdUq4zM39qyTm8nURSTNIjHnbz5pOkzIcYC8RxCzIp47+v
 TAkGa/N0jhmz8Ym/9EFVaBZ5DouqalXAQLRPY825oBFCIs0kc74X7gKGW30qdlhkws2H
 AVM3G7vPwrjCXqkalrqsPgYJTcN/J0hyxpAQfCp46T73V0f+zDYVyD+wss21NAO1sIXS
 EGP2LnsobAhFODS2UmKccGdbeVCNAKDweB8u8LKJMJJHIVxeXJETn1zxdWP3qvzZJ6dg
 qNL4TVLKcN8ouc2IIiFLsji3tGFdKpI4JnLpKYG+Jd2nVZX5rc3haGGPpwVMcjrfim1t
 Q11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZWPLUoqPQwRNEP7N/mQ6KcZy+VCmkdoHNOMQdySREE=;
 b=44yP5asN09NTcI7ivOZo16gg5owFpx9+f7acaFS/opf9b4Cx9Nc3Jl7RFxUXw8Kqhg
 WwLd9TXHg+/cblv3oRlZLpKT6xRYxtLNQjhOQk/ar1qISf8vfibLURodRk2iIetleaaK
 BT9NVnXDXzZ5JOeCkWPTMiEtg/Xy5Va9sMFdIkshpX9OFFbd9S4+YHBBWoeq92bjXm35
 149am45BP78eWGb64KTP1+0++7807d/xK7mkeZxpnhrC54UBc96wIC68/JPzxR7dMBmN
 sBym4cTTEsF8BNfar4wn+dR1roGiaNEMdYXPEXqPXvVm23GwC8SFwVK63WNKw1tiMG8o
 PMHg==
X-Gm-Message-State: AOAM532ECQH+/mLVGq7bTOQX4X7O45M6LIE83+OeyKEs3szReOudeYt0
 17Iij01RkZ0xegdcBZwQNrYrsZDZN2V86Q==
X-Google-Smtp-Source: ABdhPJxNbcJ2WEtplO7A94Z0nRL9ghXu2Lcm4aR2rFSS7DQww7rL2fqdQq37LZpLPTKEwaWtlV4Hpw==
X-Received: by 2002:a17:90b:35cc:b0:1df:8218:a427 with SMTP id
 nb12-20020a17090b35cc00b001df8218a427mr2478553pjb.15.1652766537541; 
 Mon, 16 May 2022 22:48:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 7/7] target/arm: Add el_is_in_host
Date: Mon, 16 May 2022 22:48:50 -0700
Message-Id: <20220517054850.177016-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4165d49570..58392c8246 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1310,6 +1310,8 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+bool el_is_in_host(CPUARMState *env, int el);
+
 void aa32_max_features(ARMCPU *cpu);
 
 /* Powers of 2 for sve_vq_map et al. */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 05baa73986..d082a1cf18 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5282,6 +5282,29 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+/*
+ * Corresponds to ARM pseudocode function ELIsInHost().
+ */
+bool el_is_in_host(CPUARMState *env, int el)
+{
+    uint64_t mask;
+    /*
+     * Since we only care about E2H and TGE, we can skip arm_hcr_el2_eff.
+     * Perform the simplest bit tests first, and validate EL2 afterward.
+     */
+    if (el & 1) {
+        return false; /* EL1 or EL3 */
+    }
+
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


