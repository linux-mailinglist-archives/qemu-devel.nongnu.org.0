Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76556BD13
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:54:56 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qJj-0002H0-GJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjQ-0004NX-0Q
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjO-0002TY-7b
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bf13so9556735pgb.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=84H03quhV23tsQtptgYsSVgdXeP+LjLwInxbgDJtprk=;
 b=Oz/TiA8MmV3xIdM+MaurNIuOibDIJq9clPQeaz9a71rTsJbLiHTTesr937A8KG/OKV
 Nc7AD2D/1xFcWsqS3xG/4Xff7gGPFSxtzOsvxXQWaU4GwQjxYnAxnzW48UYddBAQM/+W
 A+Oxp9TXoxgZS2aNrT7Oq/LDEScveVl22bU2174Du6deXIad4QQI55IAGUxL62IQHMRc
 4AIsoY6wWK9LRVjBicR4q+s1z/lhFLqdnybdJPIQ6lhBF+m/7hNF7s/RlSutIKAK9R8n
 jZoN6ZsWsY4xCelmiehmovy/zEbCubZLVT1Trw7PiDkzjlnlNNzrO9BNR/+luj7PDdBv
 dapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=84H03quhV23tsQtptgYsSVgdXeP+LjLwInxbgDJtprk=;
 b=gty8Bb0jeCkJqDqrRoYWRUtn1bAOm4w+U7hdtt74K9n2dO2K0n2gTbw0vww4QF8133
 m1YrzMcieD7FyKM2PSaBH8SSr9eRYGbYMEqSNwWLK5TVIHlcDc8A8oPIXSNCWGeJyptL
 zwdn0fLMCVQRGQXh+Poyy2w1hQosAvaxHCu3cxMKOjpLMO1wsJUsgT9KYY8fSjfhZOdU
 OL3wD4/8jKf9XEcAIGq7PlWHlvtyesF3lqOfBQS/Z+I4KbAIopQHoC9lKVD41gcpd3xS
 vLAubBiRzAOA63IaGt7jdGWxumUBGc3KbONMkBIonnrZ/zKMLfJZ7ErrOK66O9IaQFT2
 roCw==
X-Gm-Message-State: AJIora9yMoj/Zmvvg8EhTaRTPG77oZcztiZ6a8kqQV1PrliEqyqPgvq2
 tPdqcgYK8GJ39l+bBsnE11lkMbPRi/exRvc/
X-Google-Smtp-Source: AGRyM1tW+JCQeVmxtMR+g5U/ubjn/ttP1VlpYNxx3C/mKrRpd5FIO9FYnPrhFt7h0vko/zXYfv1v6A==
X-Received: by 2002:a62:a113:0:b0:51c:1b4c:38d1 with SMTP id
 b19-20020a62a113000000b0051c1b4c38d1mr4453742pff.13.1657293439963; 
 Fri, 08 Jul 2022 08:17:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Fri,  8 Jul 2022 20:45:26 +0530
Message-Id: <20220708151540.18136-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 73a5b2b86d..cfcad97ce0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11242,6 +11242,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11254,10 +11267,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1


