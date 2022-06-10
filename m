Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916EA546A34
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:17:19 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhK2-00064N-Lv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBA-0007sl-O4
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB5-0007Hi-Ld
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso1368072wms.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7rZ7+K14fAta0tvCAh13EOYsic/ydHpR4N0fIgccYaA=;
 b=GDcOLIgd5dFSqsSSbegchX5LpY6b9rY7KtaspYbvLPpGRXtMl8zf5qMCD9xOTthxVK
 CtN2aLwiNILNWm2V0PkA9+S6Ser9BsFM1NBq1oy0wVfM1dWhLrFNM3G/BHfYPfHCHHPf
 Upoe2hjz//wCQec+lSlR4GHe3H0GFYZJufbaru+PGQwkRqULE2j8w54Pl5tEqOw5cxn6
 fGvsw6+Oj/hSe962U5Pghy8he1JeJ00s+PXfY1uxG9gt19DavXCHZGiaMgIeCg42p3Uk
 WPUjcT5EPqbumY/TkZEKUdyoGbZpVXX4BK6cixJRRQ88SJ5BStQW3AjaErMfgRe2+bEQ
 XVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rZ7+K14fAta0tvCAh13EOYsic/ydHpR4N0fIgccYaA=;
 b=ZeGluuFYaLoj48YhzzjjWdU8qDoAAGrWLKCfqW9RbM9YKFRZbUQnbW6Ud3InJ9lE9q
 gDanXJxGWUsljUSxTl+GE/GTUyVF8mRVK+TkrBwpRAkBrawUiRd9qfShyfcdl6MF+owo
 pwR6j6qifNtx/fOx4gAV+qmlEnkmk29Tcm3Fh7899Oh4bXUz0D9yB2UpyFhVcBPdP5RH
 brldKorz7NWL0+F5W6iFp35VBUAGAqVU+jJtjJxdKl0yaTczJElzt37sDu6G2k5AuYqf
 2DOaM01OzljhNK3322z+4/sPG6Ls4XDK6xnxcUsJDPlphpHh5U9zcOOWoedD/ppdhRhy
 Z0Uw==
X-Gm-Message-State: AOAM531IG8Z9ThUh+X2lLBjfOoNOyVYsDGtE1hz2hlTu2Nr4Fy/aY3Sa
 2yXI8tQi/suWTzC1KLw80g0jOcg1w1L0Fw==
X-Google-Smtp-Source: ABdhPJxSGxhq5Mmqz/yQ73bKvx9GR2EgRiALfnWaDA4IjV/QvaXvozWEGdi9adnll+EzetesS9vOqA==
X-Received: by 2002:a05:600c:3555:b0:39c:7c36:573b with SMTP id
 i21-20020a05600c355500b0039c7c36573bmr448605wmq.107.1654877279074; 
 Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] target/arm: Create raise_exception_debug
Date: Fri, 10 Jun 2022 17:07:31 +0100
Message-Id: <20220610160738.2230762-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Handle the debug vs current el exception test in one place.
Leave EXCP_BKPT alone, since that treats debug < current differently.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 44 +++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a3a1b98de28..26004df99ba 100644
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
2.25.1


