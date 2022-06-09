Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B845455D7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:43:38 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzP0D-0001xx-ET
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmG-0003eU-3C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmE-0008SQ-8z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u18so21154957plb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kj2ZYfRQGSWcXMLkNM8zljFGjh4Y1FzFkf5hNzLBiyI=;
 b=QmusMp69D93YwXt/7TOjJMXhkbte6nFaynuJ6DlS9+82QVE5I5dDyJD5/7g7pdGmyE
 xmhHthrgXobgre1xJCfHsEetJzDucay2DV2f9WO+dOWK+IxmHFNNe1nkmqQmE5WQlWtX
 AdlXXmxOfJL2DOWKlZjpZnIuufHv1yzuaqtqcVoHolZUaG0e8+QWTuMvxL0wPNjrq/xO
 Pb4ldVG9UXXj3axqtqKb4e9sFuc8hAjTzLQAU39ChG1itLNDaz/WtszMs7hSRO8q+FgV
 1CNinAGTpSyub7lZjUuwJCXTkmsgVIIoM7YdF2FQ8dAbbOPbmRFWLGh+3JHX4iiE4Lir
 gEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kj2ZYfRQGSWcXMLkNM8zljFGjh4Y1FzFkf5hNzLBiyI=;
 b=cYgROeCw3XH//fliES6OpmAobaYxeXtb0I8vL5MoLhmgGB42AoJTrsphwg/wwVT6Vm
 jw39C0XygKN6LSFngUyr+IyPBjda6kg8i08CHzG2ivdA51OgremkLnGpD+32eq7DJ+7e
 hdKBDEwiLAFlbyjZHYqepId48t3Dt5woSGPrGgMUfVF2Uc/FQKCDqn7BNS0b45nZWACH
 BHTq1m0/6aifVbMJrI/o/uZb3ySCLtYoJ/HfkbUa83H77+P+GuG4bTtg/GEX283xhwDD
 SNJIr2bDE8JA0y7bn/98cDsf62QLYZK6rFX7MgJtaKVz9RqQMeMGxHDoIY1b7+PL7smn
 ZYjw==
X-Gm-Message-State: AOAM5313DTAkxYJxgKgnRrer5cfG70h+lEBAOa22Xf9IMavRTIXH8o6b
 Qx0L8fcnNc9ytUdJ+9yRR/iT+3/nnRzzVg==
X-Google-Smtp-Source: ABdhPJzqRD/1COz0wfFbQYvgycVPwRKq9C3FUKEuTk5axjE/l9VKeKdfAkaDIsEF2uTfmpbX1CNQ4Q==
X-Received: by 2002:a17:902:eb85:b0:167:987e:2686 with SMTP id
 q5-20020a170902eb8500b00167987e2686mr14360987plg.33.1654806548944; 
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/23] target/arm: Move exception_bkpt_insn to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:28:45 -0700
Message-Id: <20220609202901.1177572-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a18a09a0c3..80dff0788b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -430,6 +430,37 @@ void arm_debug_excp_handler(CPUState *cs)
     }
 }
 
+/*
+ * Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 97c8c9ec77..2a8bdc2cbf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -399,35 +399,6 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-/* Raise an EXCP_BKPT with the specified syndrome register value,
- * targeting the correct exception level for debug exceptions.
- */
-void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
-{
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /* FSR will only be used if the debug target EL is AArch32. */
-    env->exception.fsr = arm_debug_exception_fsr(env);
-    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-     * values to the guest that it shouldn't be able to see at its
-     * exception/security level.
-     */
-    env->exception.vaddress = 0;
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
-}
-
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
-- 
2.34.1


