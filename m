Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FF53F45C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:12:06 +0200 (CEST)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPdV-0001ZP-Vb
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG9-0007Mk-V7
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:57 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG8-0000P3-6P
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:57 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h192so7759991pgc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/oXSdjZYbwmqBajIXGiCmaX0gX1NZRS+oLXplWu0qM=;
 b=B5ckQxBr8yKhdl2yn0HNxyZvPq7eyHKoXSQH9IPmQh8AC/fvYPI0lzio4FefGZGqN6
 hDUHLy0WQPu7t6Qjm0wyt4pF2M2DhL/04LaSQgJsLZ36XAZdfXKbtOgNehMhulR28RmI
 2xMrmGM1j+ugRe4maTqMMk+7Gex8nkZ5aegliUXStgr03ctjIJBgQrjddkdXr9EBnt6q
 GwSCZtk77Era62eH18ckKe9g/jWs+jJ50e3aJtyWI6cyLKNe5GVIouNdRk5FZazUVhWX
 625mdPpmt83Kg4jqbsktgF6WxrF7QMpZJowZJkkX1+zn8E/cs1oScLexthDszJ0WvOew
 80KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/oXSdjZYbwmqBajIXGiCmaX0gX1NZRS+oLXplWu0qM=;
 b=G0tYoU5v9ZZLu7oCev1XsC6CAj/x/xcov8tYDRPJ57UF0m1G+pB72r2IIS6obhXjX0
 0emcjRPmKHjsy0NthMAPLXHJSz57WXUt/FyJt7r7K1hjlvgGq5gYZUfc6Txr4xaKW9VP
 fZsFal9xujc6wGSvmxMONf7zX8or08AsRxkNiEW83sd7kEatXW+Hjmkju57+kgHGFfCE
 VOmcJ1bLPqBDRKO2SPOUItSy3uHykKq3VPgYjQJaECWQIVIX5QHeurn5xIx7+w2i67B9
 N4X1Sh/KY08XqUcpbQog7RjljDY1R6sh7+yBZCxw7K448ny6ssuRMWED0uU7F5rFYxTK
 5szw==
X-Gm-Message-State: AOAM53056R1Tz/tHbSYvbXtMTDSRsWxJ+KbpGbcbOTsnI03D4DV0i4up
 OZObGcQNZfLOq2rszMQPGIEXNRP6EQ+wSQ==
X-Google-Smtp-Source: ABdhPJzxZ0QLcE0i4bVefLnQpARfa91WCmEWsUs3oMWvyT7Yg6lF5SYJHstBzlb6VII/Zq1RhG8wZQ==
X-Received: by 2002:a63:6306:0:b0:3fc:7529:7688 with SMTP id
 x6-20020a636306000000b003fc75297688mr24011902pgb.252.1654570074807; 
 Mon, 06 Jun 2022 19:47:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 22/25] target/arm: Create raise_exception_debug
Date: Mon,  6 Jun 2022 19:47:31 -0700
Message-Id: <20220607024734.541321-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


