Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4F5455C6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:38:12 +0200 (CEST)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOux-0004RB-BX
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmD-0003Uc-5l
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:09 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmB-0008RB-KN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i1so21129986plg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MrEhOa+yMtE+t8fOZfBlrA2frjHLPNVyhuaexNOThYc=;
 b=ZV22uVUUkEgpdPG4eIApV7/5PqnIL3Og6yWXIbEGC2AnIAk0xxkuEfZapqEEhOHwtU
 Ci2qBLRroqxP6SK+0ojy7z+cw36nNDBgaArM7PadPGWCfriPErVJg27bo9/fSEdrkt8r
 ebFvtVfQM7J5uzByCHBb/xiNUe6KPpwh7V4kjMTk35Q4ko854uhkthbgtQR4xgc7e5mv
 VjL+iUiovmz0YOmkdQ1+qNTzurj02/oFsbsJYuB02WUfV3yvsmC8QY2admPsTZV32/tT
 B2HR7i+ysM0zDBJci2K+s5X1IKwkW+CP5F5WuuUHdQSfHI/5jRBzX2Z8W4iyj+QiH10U
 4O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrEhOa+yMtE+t8fOZfBlrA2frjHLPNVyhuaexNOThYc=;
 b=wTBwirPpzmMZQTzHBw5l9NlfYLDDY/SJ2SIe9YRUpC+quQwlpz5cII6Hy7abNMMr+0
 62G7UyK6GLct1HzxzoIqgMY1DEJHB2RlCdLX01SZNj0W8mkfBxEtKpgLMael6yBc05nH
 BZnV5d5rq2YkYoMWChV8vOn8CZKaJa5/ql0ZPjxEVleKCIVMwbxXSRvExDbfE6Y3VdpE
 TtBmWzrdAd1xMctFB3Ww0AVX2S5bYTn1Ft0l5jbXpjRA/BKtbWGm8D9X5PI3CTuEmm15
 ZOmmNm/0qh4esdGu6owxNhXS7IjckLqKm69y+iIDEzI0ZSuVUz4JtLZF7dkepZyqSHrB
 xkhw==
X-Gm-Message-State: AOAM531WMqNa0BQb1PRgzqJl3LHtkWghSHbvXJJ5SiYv0gkKjVz01ZMr
 7/4k9DgpKTEMvJbuMXORjzCVVMKUoN+4wQ==
X-Google-Smtp-Source: ABdhPJxSKVDd/L0FQZBMhlLKoa2N1FoMULZRMGjxCIAoHgI8P/zwOWAewCfOCR1zGTHyBHeX0bDCOg==
X-Received: by 2002:a17:903:1c2:b0:163:ef7b:e10f with SMTP id
 e2-20020a17090301c200b00163ef7be10fmr40853642plh.158.1654806546215; 
 Thu, 09 Jun 2022 13:29:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/23] target/arm: Move arm_singlestep_active out of line
Date: Thu,  9 Jun 2022 13:28:42 -0700
Message-Id: <20220609202901.1177572-5-richard.henderson@linaro.org>
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

Move the function to debug_helper.c, and the
declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 10 ----------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 12 ++++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 78dbcb5592..bb1dc3289a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3106,16 +3106,6 @@ static inline bool arm_generate_debug_exceptions(CPUARMState *env)
     }
 }
 
-/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
- * implicitly means this always returns false in pre-v8 CPUs.)
- */
-static inline bool arm_singlestep_active(CPUARMState *env)
-{
-    return extract32(env->cp15.mdscr_el1, 0, 1)
-        && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index af9de2dbe5..64e2c1dfad 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1325,6 +1325,7 @@ bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
+bool arm_singlestep_active(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 46893697cc..1abf41c5f8 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,18 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/*
+ * Is single-stepping active? (Note that the "is EL_D AArch64?" check
+ * implicitly means this always returns false in pre-v8 CPUs.)
+ */
+bool arm_singlestep_active(CPUARMState *env)
+{
+    return extract32(env->cp15.mdscr_el1, 0, 1)
+        && arm_el_is_aa64(env, arm_debug_target_el(env))
+        && arm_generate_debug_exceptions(env);
+}
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
-- 
2.34.1


