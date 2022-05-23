Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF6531D98
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:20:54 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFTw-0003N0-Tc
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyG-0000MJ-D0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-00053v-7s
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 fw21-20020a17090b129500b001df9f62edd6so687549pjb.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0l/HYM1MzYvxmgSMUeS6CVNkTdoldvUQuoyQcBcw45w=;
 b=WuVnQgDb21KqtZ4yCnf/Bpo8Krip0O8t+gZUkhcig5+eoChj3Dlav8LH3+vRDtNSfo
 389AUc+QEsQuiAJXReaQtSWq6m11v8EP9xnur0hqGvSPPFzLrHBKRzBRyF667xc5FyhS
 picFLUIpzYgwFLLT0H++7JB1e4zIr4IHl/fvHPyxr2dYTD0QuDU9ieZkkrSdRxn/0rnP
 1lpavh4o+SYcB36XJBNZ4WpsgF4zXUVfTSMPeUxQqNLM3GBiWtHkrq0rYDK+g/4xurNu
 U6HUnASCihbvme6RhQvspgC0wKQgZBq5JdL4nknI9aZsvhS8oeWvhgGiful1K2bYLhfF
 jRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0l/HYM1MzYvxmgSMUeS6CVNkTdoldvUQuoyQcBcw45w=;
 b=DetrEx7chbt3yJ2T5XDjpuh0zKxYnjeno0PwfM1M60kvbB3Vx5IgTW6WcT4/snfPzy
 7/fh99ImwnXJOZEggpov3gugn8qJ71GlwpG0yMh6oUBR94ikcVRLgOA9ALXgw4aT6tK8
 t2vwL3sPnsTn00tayaB/Jl5P2o4kJwcCU05nA/nuaydig5jfPfUvrCcNKn/iwPAoKWwY
 nIhSq7JzZU+KkPGq6SfLF92p3KnlnQuBLKY5Wcx4Y2H4/Tuzljdb8otuIJ8QW5QzbAQz
 oV9taF7P2rhZji85HeJyAze22QAhJ78YYKElJeDfyEcx626/HC6VGSuTiAUPuxBBp0XI
 9knA==
X-Gm-Message-State: AOAM530ziJ0l6vvuBtmj12yueG5H6EPNCM06r7U4g1hkV4bG3I6qpnkh
 6p1Dnm/pkpib616iPv+tDocbGBRA1QTDFQ==
X-Google-Smtp-Source: ABdhPJzBvcUwJb3O9H1H4nh4UUcQmsLNDbVVeJdIuLG1kbAj0cCfvw1QiOUkzcjeGX/TGJ2GdTa4HA==
X-Received: by 2002:a17:90a:4e4f:b0:1df:6e40:ef22 with SMTP id
 t15-20020a17090a4e4f00b001df6e40ef22mr837850pjl.105.1653338877540; 
 Mon, 23 May 2022 13:47:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/18] target/arm: Move MDCR_TDE test into exception_target_el
Date: Mon, 23 May 2022 13:47:37 -0700
Message-Id: <20220523204742.740932-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
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

Add a debug parameter, and when true test MDCR_EL2.TDE.
Use this in arm_debug_target_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 20 +++-----------------
 target/arm/op_helper.c  | 12 ++++++++++--
 target/arm/tlb_helper.c |  4 ++--
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6df38db836..fbb69e6919 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1074,27 +1074,13 @@ typedef struct ARMVAParameters {
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
-int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn);
+int exception_target_el(CPUARMState *env, int cur_el,
+                        uint32_t *psyn, bool debug);
 
 /* Return the Exception Level targeted by debug exceptions. */
 static inline int arm_debug_target_el(CPUARMState *env)
 {
-    bool secure = arm_is_secure(env);
-    bool route_to_el2 = false;
-
-    if (arm_is_el2_enabled(env)) {
-        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & MDCR_TDE;
-    }
-
-    if (route_to_el2) {
-        return 2;
-    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
-               !arm_el_is_aa64(env, 3) && secure) {
-        return 3;
-    } else {
-        return 1;
-    }
+    return exception_target_el(env, 0, NULL, true);
 }
 
 /* Determine if allocation tags are available.  */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4988b6c41..9fc9ab3d20 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,7 +28,8 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
+int exception_target_el(CPUARMState *env, int cur_el,
+                        uint32_t *psyn, bool debug)
 {
     /*
      * FIXME: The following tests really apply to an EL0 origin,
@@ -62,6 +63,12 @@ int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
         return 2;
     }
 
+    if (debug
+        && (env->cp15.mdcr_el2 & MDCR_TDE)
+        && arm_is_el2_enabled(env)) {
+        return 2;
+    }
+
     return 1;
 }
 
@@ -83,7 +90,8 @@ void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
 {
     int target_el = cur_or_target_el;
     if (cur_or_target_el <= 1) {
-        target_el = exception_target_el(env, cur_or_target_el, &syndrome);
+        target_el = exception_target_el(env, cur_or_target_el,
+                                        &syndrome, false);
     }
     raise_exception_int(env, excp, syndrome, target_el);
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 573e18f830..3bf4107faa 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -90,7 +90,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     uint32_t syn, exc, fsr, fsc;
 
     cur_el = arm_current_el(env);
-    target_el = exception_target_el(env, cur_el, NULL);
+    target_el = exception_target_el(env, cur_el, NULL, false);
 
     if (fi->stage2) {
         target_el = 2;
@@ -141,7 +141,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
-    int target_el = exception_target_el(env, arm_current_el(env), NULL);
+    int target_el = exception_target_el(env, arm_current_el(env), NULL, false);
     int mmu_idx = cpu_mmu_index(env, true);
     uint32_t fsc;
 
-- 
2.34.1


