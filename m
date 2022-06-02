Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D453B157
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:51:03 +0200 (CEST)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZzL-0004ND-04
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjJ-0002eY-31
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj2-0005FE-3D
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so4797637pjm.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTUaM+lqbn8KxvXwj+n9JX47C53ZG33aTbTDGh5Ahv4=;
 b=TMupXwDwJV7romQFcvkK3avSMh+Dd9KiHQ+ZncD116YInpq0N/Qji4//5NRAxu0kzD
 XoVqpBraci2MIwuKU6OM7XlV06EPN2e1gQMlHaYJqU7+Bn5Km/rCAgLd7/lDpv5O4paZ
 +XBzm6aR6pTz8U2rO3EdBmTuXWEHgxoj7kMfqk+NRBRtHrYmml5Scf//MniJWZ+741vB
 /n1cs6IPPDd1UiMb24jlrkpyiolKiFpJsF9yeORyQelDAf41w+4vZk4efT6hhFMMh22p
 3Pyyub9Wzqn0rHA3O7+Ok2w/F1WFw9t6h4Z7EnIxzLiCLsUo1sLCJNmkOtAQZDJeNUm1
 JTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTUaM+lqbn8KxvXwj+n9JX47C53ZG33aTbTDGh5Ahv4=;
 b=Xbd3ZC/UUsyOPzDHu+2+J1p2UuS1ESRVoPYFZ4SI0eWZVroFDm9hYIU/Li3rGxz48T
 HR+dIgCGRXflaH9VoS1gKzv8p4DHHuzSb5L0WUVcDaSJLkBQyfbm3ihNyyOt+F3uQjpF
 umOmAA040lghcItCSE5tf5ikW/O3zoxqc/uQR9OmwsaOgIepok55w5eszZAKIf2H9MXb
 hcyYpFlRg5pqBAoq3VX4gK9D/NkC01B2xMbLGDVvlRCrDHUM/7j5bXF4dtEdHrLmV15k
 SM/CdcBTPMEJ0uho5mERlithzxZ+rqHvBw/zyIMHiaxysc7enkRrutdk8LMkSbtDS5Vt
 VvJA==
X-Gm-Message-State: AOAM533yW/qivTaiARx4THLnSKarLj44BNPDyegvhz5SCbtLVTiPz0eo
 hhF2zT8GT/o9LpVklDEMzcR2UUKF6+HwIw==
X-Google-Smtp-Source: ABdhPJxUg9AE9ZYVG2WCkBfZQLAE2lJrxCx5ReV/Rt+2lX3kXI+OetVeUd57y8mSKuIVnK7POB9yBA==
X-Received: by 2002:a17:90a:4896:b0:1de:fff2:6c48 with SMTP id
 b22-20020a17090a489600b001defff26c48mr2427993pjh.89.1654133650766; 
 Wed, 01 Jun 2022 18:34:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 06/17] target/m68k: Fix address argument for EXCP_CHK
Date: Wed,  1 Jun 2022 18:33:50 -0700
Message-Id: <20220602013401.303699-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), CHK, CHK2 (and others)
are supposed to record the next insn in PC and the
address of the trapping instruction in ADDRESS.

Create a raise_exception_format2 function to centralize recording
of the trapping pc in mmu.ar, plus advancing to the next insn.

Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
kernel does in trap_c().

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h          |  6 +++++
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 54 ++++++++++++++++++++------------------
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9b3bf7a448..558c3c67d6 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -122,6 +122,12 @@ typedef struct CPUArchState {
 
     /* MMU status.  */
     struct {
+        /*
+         * Holds the "address" value in between raising an exception
+         * and creation of the exception stack frame.
+         * Used for both Format 7 exceptions (Access, i.e. mmu)
+         * and Format 2 exceptions (chk, div0, trapcc, etc).
+         */
         uint32_t ar;
         uint32_t ssw;
         /* 68040 */
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 12e5d9cd53..e24d17e180 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -47,7 +47,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 777869790b..750d65576f 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -397,13 +397,16 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
     case EXCP_ILLEGAL:
     case EXCP_DIV0:
-    case EXCP_CHK:
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
+    case EXCP_CHK:
+        do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
+        break;
+
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
@@ -548,6 +551,29 @@ void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
     raise_exception(env, tt);
 }
 
+G_NORETURN static void
+raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = tt;
+
+    /* Recover PC and CC_OP for the beginning of the insn.  */
+    cpu_restore_state(cs, raddr, true);
+
+    /* Flags are current in env->cc_*, or are undefined. */
+    env->cc_op = CC_OP_FLAGS;
+
+    /*
+     * Remember original pc in mmu.ar, for the Format 2 stack frame.
+     * Adjust PC to end of the insn.
+     */
+    env->mmu.ar = env->pc;
+    env->pc += ilen;
+
+    cpu_loop_exit(cs);
+}
+
 void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
 {
     uint32_t num = env->dregs[destr];
@@ -1065,18 +1091,7 @@ void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)
     env->cc_c = 0 <= ub ? val < 0 || val > ub : val > ub && val < 0;
 
     if (val < 0 || val > ub) {
-        CPUState *cs = env_cpu(env);
-
-        /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
-
-        /* flags have been modified by gen_flush_flags() */
-        env->cc_op = CC_OP_FLAGS;
-        /* Adjust PC to end of the insn.  */
-        env->pc += 2;
-
-        cs->exception_index = EXCP_CHK;
-        cpu_loop_exit(cs);
+        raise_exception_format2(env, EXCP_CHK, 2, GETPC());
     }
 }
 
@@ -1097,17 +1112,6 @@ void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, int32_t ub)
     env->cc_c = lb <= ub ? val < lb || val > ub : val > ub && val < lb;
 
     if (env->cc_c) {
-        CPUState *cs = env_cpu(env);
-
-        /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
-
-        /* flags have been modified by gen_flush_flags() */
-        env->cc_op = CC_OP_FLAGS;
-        /* Adjust PC to end of the insn.  */
-        env->pc += 4;
-
-        cs->exception_index = EXCP_CHK;
-        cpu_loop_exit(cs);
+        raise_exception_format2(env, EXCP_CHK, 4, GETPC());
     }
 }
-- 
2.34.1


