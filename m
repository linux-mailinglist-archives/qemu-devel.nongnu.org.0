Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFF531D72
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:13:38 +0200 (CEST)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFMv-0007XA-DT
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-0008OW-F0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-00052T-JP
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id l14so15064576pjk.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpJpY6Zi7IyphD262mZyPHWMPDsMk1fOKGRcuezpDcQ=;
 b=sb3JFY4untB5UH6tbCKZ3cy4DNgG4NsQc8o+H1jbfWmha1FpENkxiCP8raRPaNkrNJ
 W07/0JJ6/nUnPKmdSV8kdsdo7htnD27B4YcsYDKkNW9E+dA1YcZmMFjhUZC6qpdj+60F
 X4a40AMezszzDlYGL9zlMUu9toT9PQO+povnGwHhVPc9/kXQgCbkBaIDVKWjJ975u+hV
 HdnLff27A6/eoiR74sQ390waqrgRqK2sbbqg3BKrcvHAS6wzFCOeiSO8hC1m+sWdzm+7
 VNw2oNZG8/N4q/3dDEld1sjMKxhxlajz/bEtOtmsVmBLO9lw4xmJZAdkmeHBAwYNtds/
 yq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpJpY6Zi7IyphD262mZyPHWMPDsMk1fOKGRcuezpDcQ=;
 b=y1ZxxnpSLhUoiXJ4YIP91mc6+ccEdo7fhz3rma7HZAc+sW8C740ojGtTh65pLDz5jR
 Q4k9A1RgsCGR56U0h4rgG/weRvcdCyHsA3kPqvKL81diCBOFrJKbb9WiUxmmYcsj8apb
 Ho9+YSy1pKpv4CbU02ZcVThypq5lKJlh22WA63DNRpWf/a71/GgDOmWfxEt/mtpRjRHK
 ZIMLLJd11bbPpLjtRuWLIuTxtOP65g9WY+TuheQwLPwFr2qUxhr/HYVnSv+mYKbX2vw8
 n7NpP1B+IG0SY8rSTatuANadujv9DvztS2e3Sry3p2e4Q8soGy0qnFDPTKJOlLB/vn7a
 TI3w==
X-Gm-Message-State: AOAM532esf62kblzWvizNSeotxJV0BulBvhJGyeiI7J8jLy9Ij5uBxOT
 7nJOcDcJz+z/gC191NdWmkomNgkIr3G4hA==
X-Google-Smtp-Source: ABdhPJyBwQqQDznd9OQOUJfkXPLtyJ/pS7TUaR9A7nSVeVy1LJ6KUyogFIAJ6pLhVJBAzaIKCuKFZQ==
X-Received: by 2002:a17:902:dad1:b0:161:a5b5:c8f4 with SMTP id
 q17-20020a170902dad100b00161a5b5c8f4mr23724510plx.169.1653338874207; 
 Mon, 23 May 2022 13:47:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/18] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Mon, 23 May 2022 13:47:34 -0700
Message-Id: <20220523204742.740932-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index 91702b3ff7..bb45100f06 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -794,31 +794,6 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
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
index bdcd5f36d6..08d461fd19 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -378,6 +378,32 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
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


