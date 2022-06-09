Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C3545619
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:03:30 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPJP-00061v-J1
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmH-0003hI-08
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:13 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmF-0008Sc-8W
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:12 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d13so5474678plh.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCzxefNxcQpSTLu01BysmYqWqiN0wU9rTXU9xeYcYo4=;
 b=I0oSIx0klTiW3S4pgqntyDI0vnJqmBCJfakF7r0jgq2+dVNp9oQWP8l5oLBMNtXWrh
 544RdYEnW0eOJxadDliU16Ib4J8GDV9y1NJ+lXi2lkhjdBkTLDuOMoi4eyJSz0jdGEuR
 wq8z7CJuKzuZmgOtr/cblqG5z/IPzckzPG2oAImTIl+rXG97MsovcpU6XkjyFS0poiXH
 gzLrigs05uAZD5LbxxhhxIw9idKtRDVX3qdWpZBg2wOliSRZ33F/gMNV8qttAkE1pnTE
 ertdmkg6fHo8mmhYE5DZRICiWPtslOXqLmRA9GURK16I9LtLFxfaHXnXkrDi30KCCUk0
 jE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCzxefNxcQpSTLu01BysmYqWqiN0wU9rTXU9xeYcYo4=;
 b=pyOdW/X5QD3QWWg/djGRT0vkEb2U4hlQXYzx5EbFwZ4gH9ouZuuFfiZGQjrlEEXUSc
 ij+UO4yglLMRX1sZGzar/amQYd9XxmlypwYhbA8G/LRmcDqp0BdqCLx+7e5AETGuVDJ3
 In9JzksXxwP70rCrELNMvp96y8LFfFGSD6R/pr+Zklk4BxUEmZlZn+wfsJ8MSBQasqX+
 0nz2l3rs0Qv6B/kmxlAsKDfFtjoK3f1ancqrZIGc54bw1UtHg32ZEoMRGdM0Nkqa1j2a
 hc5c4O0hAnZreiVEAajTFD2Cuh6aHnqDwOq8Ni+psXZxaecXi0AjoXm+mVPEtkgHMC75
 o+Ug==
X-Gm-Message-State: AOAM533ATAFy1hFxFGrnAE2BP0ABagvgiwGSTc8Mm+BoCMkyhcm1ZIpN
 kI0D+LFb6LHHzPXowiUA99moyn4ZA9T74A==
X-Google-Smtp-Source: ABdhPJzPXKskCwkyYJHxjRMMAXvUqgNeAhOdEUXUghZamq6OFMrJpEeY3fJSh97Z7Zaoz2p0ZRPUrA==
X-Received: by 2002:a17:902:c945:b0:163:c3c3:aff8 with SMTP id
 i5-20020a170902c94500b00163c3c3aff8mr41494569pla.56.1654806549951; 
 Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/23] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:28:46 -0700
Message-Id: <20220609202901.1177572-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 02fa70f75a..6f94f3019d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -793,31 +793,6 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
-/* Return the FSR value for a debug exception (watchpoint, hardware
- * breakpoint or BKPT insn) targeting the specified exception level.
- */
-static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
-{
-    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
-    int target_el = arm_debug_target_el(env);
-    bool using_lpae = false;
-
-    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
-        using_lpae = true;
-    } else {
-        if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
-            using_lpae = true;
-        }
-    }
-
-    if (using_lpae) {
-        return arm_fi_to_lfsc(&fi);
-    } else {
-        return arm_fi_to_sfsc(&fi);
-    }
-}
-
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 80dff0788b..a743061e89 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -379,6 +379,32 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return check_watchpoints(cpu);
 }
 
+/*
+ * Return the FSR value for a debug exception (watchpoint, hardware
+ * breakpoint or BKPT insn) targeting the specified exception level.
+ */
+static uint32_t arm_debug_exception_fsr(CPUARMState *env)
+{
+    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
+    int target_el = arm_debug_target_el(env);
+    bool using_lpae = false;
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        using_lpae = true;
+    } else {
+        if (arm_feature(env, ARM_FEATURE_LPAE) &&
+            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            using_lpae = true;
+        }
+    }
+
+    if (using_lpae) {
+        return arm_fi_to_lfsc(&fi);
+    } else {
+        return arm_fi_to_sfsc(&fi);
+    }
+}
+
 void arm_debug_excp_handler(CPUState *cs)
 {
     /*
-- 
2.34.1


