Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257D531D63
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:08:21 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFHo-0000I4-8G
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyG-0000Kb-FL
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-00053i-89
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:07 -0400
Received: by mail-pl1-x636.google.com with SMTP id 10so10694254plj.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgXeFZJ++svyGxcNWIu+V+WtRKFzNHxuY5DM2JGZ0B0=;
 b=nOpxxtlZ82NIBSeSHYtbSiGQY+olxw6hPaKO0+mEwOvHxpCCWe/zRQRoQuthEue8Dl
 44knTcjYfidnYE//c2UKTBXvuAFdBK9I5RXV/mw3LwiajN+QCYVMCcUBoWiTcJtoYMhQ
 Rl1NAJ8H+NT4FyRdYo3e183od2LhAqOGNr2rHgmga7dXAyRygb4r7oV2dL7UIjPD+Q7P
 rFEW/EYPSH0GLqPoQQnC/tLasd+zCuhnnG/rtGTW2LGqvKH+khbC/pJw4hnhgpLRZ9TJ
 w35iphH/gjHvB1JXJKHWfCfHj25U6ZqTagycRZp3W5wiYJNOp+RLoJB13qwa4ngx8kiE
 M2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgXeFZJ++svyGxcNWIu+V+WtRKFzNHxuY5DM2JGZ0B0=;
 b=YX7plkLXHQm0fRJoRMeX42fOW28Wt02PYpZj7+0xdZV29Z4JbrRgLdRLqeLj2kgFjA
 T5ug++B8YceGH72bOmtlfT53286US9nNHbH/p6BHx/2ioYfoyRQOIS7cEJgVmIn0PHg3
 oHwPyv+w2GQFD6IjAsgPnDMMrFDNsLoeW2fPSGhsflpCDAdKRUlPtvO3gpgzUUfEtZlM
 HHPINkg84sdsRycqHsVcN5ak+Ji0TQCy54ddusdjnS261tODdSEssftXVZ8c3N7fykP8
 jgpNKZP6KcNxAMSDZhZFjo1IQ/vjOXlsHpXj6OYSWUcboeYprj7xA2TZxfWVnjXzTnSb
 LSFw==
X-Gm-Message-State: AOAM533MCu7QzXcIPXuTGSPJsxtVNlaSARoWSfRRK6BEQVlUWT3ylxy7
 KVfuFE/yyBnAbSlBttuS+tV/FNmlUwVT4g==
X-Google-Smtp-Source: ABdhPJxaykZi3Yx01upm/1nfWujgepEmiO+0eTyr2nRnUDr+azeN8p7ojn9wLcjpL8UrI8DZhCfOLg==
X-Received: by 2002:a17:90b:1e50:b0:1e0:3a08:9b12 with SMTP id
 pi16-20020a17090b1e5000b001e03a089b12mr826455pjb.119.1653338876559; 
 Mon, 23 May 2022 13:47:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/18] target/arm: Create raise_exception_debug
Date: Mon, 23 May 2022 13:47:36 -0700
Message-Id: <20220523204742.740932-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Handle EL testing for debug exceptions in a single place.
Split out raise_exception_int as a common helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    |  8 ++++++++
 target/arm/debug_helper.c | 27 ++++--------------------
 target/arm/op_helper.c    | 43 ++++++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 685214503b..6df38db836 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -125,6 +125,14 @@ G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
                                    uint32_t syndrome,
                                    uint32_t cur_or_target_el, uintptr_t ra);
 
+/**
+ * raise_exception_debug:
+ * Similarly.  If @excp != EXCPBKPT, modify syndrome to indicate
+ * when origin and target EL are the same.
+ */
+G_NORETURN void raise_exception_debug(CPUARMState *env, uint32_t excp,
+                                      uint32_t syndrome);
+
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
  * Note that this mapping and the AArch32 mapping defined in bank_number()
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 08d461fd19..181ba7b042 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -417,19 +417,16 @@ void arm_debug_excp_handler(CPUState *cs)
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
@@ -449,9 +446,7 @@ void arm_debug_excp_handler(CPUState *cs)
          * exception/security level.
          */
         env->exception.vaddress = 0;
-        raise_exception(env, EXCP_PREFETCH_ABORT,
-                        syn_breakpoint(same_el),
-                        arm_debug_target_el(env));
+        raise_exception_debug(env, EXCP_PREFETCH_ABORT, syn_breakpoint(0));
     }
 }
 
@@ -461,9 +456,6 @@ void arm_debug_excp_handler(CPUState *cs)
  */
 void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 {
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
     /* FSR will only be used if the debug target EL is AArch32. */
     env->exception.fsr = arm_debug_exception_fsr(env);
     /*
@@ -472,18 +464,7 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
      * exception/security level.
      */
     env->exception.vaddress = 0;
-    /*
-     * Other kinds of architectural debug exception are ignored if
-     * they target an exception level below the current one (in QEMU
-     * this is checked by arm_generate_debug_exceptions()). Breakpoint
-     * instructions are special because they always generate an exception
-     * to somewhere: if they can't go to the configured debug exception
-     * level they are taken to the current exception level.
-     */
-    if (debug_el < cur_el) {
-        debug_el = cur_el;
-    }
-    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+    raise_exception_debug(env, EXCP_BKPT, syndrome);
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 0a50dbf274..c4988b6c41 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -65,15 +65,11 @@ int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
     return 1;
 }
 
-void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
-                     uint32_t cur_or_target_el)
+G_NORETURN static
+void raise_exception_int(CPUARMState *env, uint32_t excp,
+                         uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
-    int target_el = cur_or_target_el;
-
-    if (cur_or_target_el <= 1) {
-        target_el = exception_target_el(env, cur_or_target_el, &syndrome);
-    }
 
     assert(!excp_is_internal(excp));
     cs->exception_index = excp;
@@ -82,6 +78,39 @@ void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     cpu_loop_exit(cs);
 }
 
+void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+                     uint32_t cur_or_target_el)
+{
+    int target_el = cur_or_target_el;
+    if (cur_or_target_el <= 1) {
+        target_el = exception_target_el(env, cur_or_target_el, &syndrome);
+    }
+    raise_exception_int(env, excp, syndrome, target_el);
+}
+
+void raise_exception_debug(CPUARMState *env, uint32_t excp, uint32_t syndrome)
+{
+    int cur_el = arm_current_el(env);
+    int debug_el = arm_debug_target_el(env);
+
+    /*
+     * Most kinds of architectural debug exception are ignored if
+     * they target an exception level below the current (in QEMU
+     * this is checked by arm_generate_debug_exceptions()).
+     * Breakpoint instructions are special because they always generate
+     * an exception to somewhere: if they can't go to the configured
+     * debug exception level they are taken to the current exception level.
+     */
+    if (excp == EXCP_BKPT) {
+        debug_el = MAX(cur_el, debug_el);
+    } else {
+        assert(debug_el >= cur_el);
+        syndrome |= (debug_el == cur_el) << ARM_EL_EC_SHIFT;
+    }
+
+    raise_exception_int(env, excp, syndrome, debug_el);
+}
+
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                         uint32_t cur_or_target_el, uintptr_t ra)
 {
-- 
2.34.1


