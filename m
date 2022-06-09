Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00A54565F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:15:46 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPVJ-0003Ah-Pe
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmX-0004G3-0Z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-0008Qi-Li
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so379259pju.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZvVhJ9luWKkwdZYjhq+lmyv/sw3Hp1aeF2mDU3UCb9I=;
 b=DPulRIgojQCZy6t5X9+M99Rqkf7yq/DJOkd1kZalEiFRDXJog77c/qCzgTuJ08CDhh
 UNGE6JeqZudQ6EfcoWeEBglJCaVjq4f5yrZ9R4WWCNIWc5fcuevs+DiI8w+zzpeCopP3
 OWDdxvIAwUqSjFVtFjfdyflfZdAbcXOIX60mx07rf5lQdSujthQfjCddAK3SYnykzLii
 EFdPnJOAw2FhPYCze5CEwFhWrZBGAqfr+xGU2eGgXl8JocGWVgEeWM/BVH6KlOZdCTNG
 kG2igrLOgkXxoa29sTMpBbjNqeVCZwWASDFq+VYjg6daRt5fKaMYR3TW/HGO2VpSs6AP
 L60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvVhJ9luWKkwdZYjhq+lmyv/sw3Hp1aeF2mDU3UCb9I=;
 b=5QYevd1rpA+q03jgN95vxSCfeRiMa9A9fjlaFd2q3dZ9hyCviWq1/oJZW2xJQ5pb3v
 AT7ekJsW27DuK3gW/RsbkQ/TOsvs7xX0YU9RKdJG51Qcd+xVyCQAiHUDTudCoOps/aZS
 wV/7arxcoMkx7CGz4Ds3g22ScztR/DGO3EkEQ5lmvbmVUkvmfVvslg86z8usDrek2NJA
 TBghcXzyGgZuaUpKqrRQL/A7w4Xy1EA6pXuXnGFjf49PGR8+xxwZHx8L3ptUxlca0m9r
 uUs0wxGa9ejjwdeRNXHNmNOIwgEDQvkqj6sXvnxY9AKbtGShFhf6LUlqnLGeR0IdTiO3
 L06w==
X-Gm-Message-State: AOAM533+6J2fENwmT8gvTg5whuY9OHMsFlpVQLsHVszz5KGiXKcHmEcI
 BmxVKgQC2Vl8CNb47KhWMr7wHQYryzdUvw==
X-Google-Smtp-Source: ABdhPJye3YztWSG6SnWKnZKXgTw4NoZz/leGXGiMdA/IJzHaqRUKxVO/v+fxYEsk1UWNJ1/P8DD0+g==
X-Received: by 2002:a17:903:32c1:b0:166:3f58:c1b3 with SMTP id
 i1-20020a17090332c100b001663f58c1b3mr39938291plr.108.1654806561573; 
 Thu, 09 Jun 2022 13:29:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 21/23] target/arm: Create raise_exception_debug
Date: Thu,  9 Jun 2022 13:28:59 -0700
Message-Id: <20220609202901.1177572-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Handle the debug vs current el exception test in one place.
Leave EXCP_BKPT alone, since that treats debug < current differently.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 44 +++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a3a1b98de2..26004df99b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,26 @@
 #include "exec/helper-proto.h"
 
 
+/*
+ * Raise an exception to the debug target el.
+ * Modify syndrome to indicate when origin and target EL are the same.
+ */
+G_NORETURN static void
+raise_exception_debug(CPUARMState *env, uint32_t excp, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /*
+     * If singlestep is targeting a lower EL than the current one, then
+     * DisasContext.ss_active must be false and we can never get here.
+     * Similarly for watchpoint and breakpoint matches.
+     */
+    assert(debug_el >= cur_el);
+    syndrome |= (debug_el == cur_el) << ARM_EL_EC_SHIFT;
+    raise_exception(env, excp, syndrome, debug_el);
+}
+
 /* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
 static bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
@@ -418,19 +438,16 @@ void arm_debug_excp_handler(CPUState *cs)
     if (wp_hit) {
         if (wp_hit->flags & BP_CPU) {
             bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
-            bool same_el = arm_debug_target_el(env) == arm_current_el(env);
 
             cs->watchpoint_hit = NULL;
 
             env->exception.fsr = arm_debug_exception_fsr(env);
             env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception(env, EXCP_DATA_ABORT,
-                    syn_watchpoint(same_el, 0, wnr),
-                    arm_debug_target_el(env));
+            raise_exception_debug(env, EXCP_DATA_ABORT,
+                                  syn_watchpoint(0, 0, wnr));
         }
     } else {
         uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-        bool same_el = (arm_debug_target_el(env) == arm_current_el(env));
 
         /*
          * (1) GDB breakpoints should be handled first.
@@ -450,9 +467,7 @@ void arm_debug_excp_handler(CPUState *cs)
          * exception/security level.
          */
         env->exception.vaddress = 0;
-        raise_exception(env, EXCP_PREFETCH_ABORT,
-                        syn_breakpoint(same_el),
-                        arm_debug_target_el(env));
+        raise_exception_debug(env, EXCP_PREFETCH_ABORT, syn_breakpoint(0));
     }
 }
 
@@ -489,18 +504,7 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 
 void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
 {
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /*
-     * If singlestep is targeting a lower EL than the current one, then
-     * DisasContext.ss_active must be false and we can never get here.
-     */
-    assert(debug_el >= cur_el);
-    if (debug_el == cur_el) {
-        syndrome |= 1 << ARM_EL_EC_SHIFT;
-    }
-    raise_exception(env, EXCP_UDEF, syndrome, debug_el);
+    raise_exception_debug(env, EXCP_UDEF, syndrome);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.34.1


