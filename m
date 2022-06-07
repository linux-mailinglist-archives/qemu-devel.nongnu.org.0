Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333E53F42D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:56:46 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPOf-0005XZ-4Q
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0006qK-94
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFw-0000Js-Gb
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:47 -0400
Received: by mail-pl1-x634.google.com with SMTP id h1so13640587plf.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgbyv0kyxTzSSLAbU+4HIoEqn6rfGQtEpi8WGE77FZs=;
 b=heDhTZTPnv8QLs0MU9ihiZcWMCnwPLs1DaSLcfdJ8nSu+8mA6Q1e2eZUWHb9AmGda5
 wGhtMMHIY8RuSY/woxO6ZPS3ON5yWdTujvVZvU4RweaKQv2opXg9npwjtjRaGJqVYZOh
 xD/Cqm3Bv7WpzGHYHMJys/R32zfmKFLp7KglKwqDWb4sgdiIu5ClfBHCnbsFjUG+26Hh
 C9awXfwjQ6KyQOQKxYQ6urye+32ekxNiNlW3HXLqNKKH+ynP0bg4JgjLKW1OTlm7LY37
 Q9aIxCsdbZpjCflzjaXhuI/1IofwWTEZMze9JDfduqKGsaaFrdl+5VpOUXfLn1ngDWHX
 uJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgbyv0kyxTzSSLAbU+4HIoEqn6rfGQtEpi8WGE77FZs=;
 b=YnqwZYnrDWHtWXKLEJwOrC65NjKimhvNQ4xN/sx0cs6MzbBITtTa6jeTMhKjj2dMtd
 Gs9JNbwaOtwp4OGwov6oKCjYdIXaTZo4XBZzfKcKB6Egrlo3127aUbvl3+FTYxdxg39d
 5N67wU6Ma1tc5d7L9DeRsMbJjVejUz1VJErKS/vs6Yclzyz2+9Fzx8DlxWexGaFjgKqZ
 gXYkoM3LARQyhx3WSGC+Y/cujVOi1QwJGqzJMo9/vHspxQSA/wgStfRbH7K9Po1cuowp
 tbdS+caxO+ftFPeiOkiflYjx9W+nLe+IgTWb/6SrE+X4cGNEUgkqWRDBT1Dt+9eJjVgF
 t7eA==
X-Gm-Message-State: AOAM533nf1e3g+kp4B4UWEZ8vAbg7lB32pWKbs9A7t+41G8/2eNnPell
 Ums5cmAVhntu+aTiCGPpWyg7gpjS5OFfBg==
X-Google-Smtp-Source: ABdhPJxY2jVioKkvZn6G54Gve7UxJmTaIFrPUP1bZtLIYi+n4NijzCJgej2Ekuu5FkC7tIh4IqZnGQ==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id
 r4-20020a17090a5c8400b001dc9b42f2cfmr64404390pji.123.1654570063132; 
 Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 09/25] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:18 -0700
Message-Id: <20220607024734.541321-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e9ac54f244..c8410ee801 100644
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


