Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CA536648
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:02:27 +0200 (CEST)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudM2-0004B1-4H
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8L-0001PL-Sn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:17 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8K-0005OO-20
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:17 -0400
Received: by mail-pj1-x102d.google.com with SMTP id d20so957662pjr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTUaM+lqbn8KxvXwj+n9JX47C53ZG33aTbTDGh5Ahv4=;
 b=x0jZrnsnykn8DH2vsjXcBAGjlvSn8h+9PLDgonUdzSjYoDJ4ZGR20NCWTkz3o9+9e1
 OLtocDcFEaXWsA8YKXeQ2LytaXbuV/eJrey/G3+t6+liWwdP7i60RWwMlBuiYc3s+4hE
 tach9gCY5jWBMOhv+ufDJ5E9n3B5o73nxUU86eJwQ6LNqHnF+C8w+Di+UznnQ+eEDEWf
 eHTSQ8iGwoNKgQmLpoNQbepPF+W1LLZFXfpWVYmwaGIKfgdj8CdaSovrMBuCs5CdkqqY
 bCZHFxi4VnEw17HdXY8N8E2aDhGHGv81ug3KbvW2pnZYpqV1dgDtaxEI/MzsOI20aLW9
 U9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTUaM+lqbn8KxvXwj+n9JX47C53ZG33aTbTDGh5Ahv4=;
 b=fMwi+attXdWK3Xv5qonEpGMHdTb9MP04JySkCza3XmYi3sCa36sGEH4E2g2UXAuuh2
 iGTJpQ30nP7SPxYX0zRwmS+ZcagrfmzjR/OZjefEZObD5fBTXjCWermwQrUOw2KjEj6+
 siN6AMBgXxgZYAJ9MM5IM+FftJf7LJ57k+0TlOx2Uw1b12MyKnxPjTZc83HS//PzKPt0
 1HHZ39+XG5dCo6IgEoSRJPsG9FOiFNgpvPzlyWjsZxWBI7PE2SLVlmJWvqe/FZA8X0dx
 Qxr3rMy8ukEobHE5GlT1OQrETVk+Lb0tyP62XF5hIIZ0YpbRPELBDDRKkrSDzcUxHZwl
 xwdw==
X-Gm-Message-State: AOAM530ZhFJwaykNVFVpet05lfqTSUlzqmNh5Enee1LUr/IGtCvmRCz9
 tNSzvqnAMtCiL0Qi3ejHUMEGoJaezvZxPA==
X-Google-Smtp-Source: ABdhPJzXqQTWZX5sOB+gM0yq7ceO0B/U0iyATwzcEuHb8Rw/zfOPC/jpFy28sjaje/Eqif3y2SdJQg==
X-Received: by 2002:a17:902:7c96:b0:162:3071:3266 with SMTP id
 y22-20020a1709027c9600b0016230713266mr23359232pll.119.1653670094684; 
 Fri, 27 May 2022 09:48:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 06/17] target/m68k: Fix address argument for EXCP_CHK
Date: Fri, 27 May 2022 09:47:56 -0700
Message-Id: <20220527164807.135038-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


