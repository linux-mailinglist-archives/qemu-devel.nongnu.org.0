Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47F4DAA54
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:07:32 +0100 (CET)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMol-0008HR-47
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:07:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgN-0002JC-Be
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:51 -0400
Received: from [2607:f8b0:4864:20::634] (port=40468
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgL-0006SE-81
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id h5so961552plf.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DThk5ngpwpGvt1GxCRNuf2gEP+rgC2MmpmILNWrK4ZI=;
 b=AqZdt7C1T65NGGgfpRKfHzRGKYHzaWtxw1518pH1cB3ihc+EGCOj3QSTIetsYdNXaU
 iwTXSD7RaAkZ279OQBGtcJHsjjWOnH6L7n0nMjD4Buvg7NMmDlHRJhcdsr1BwvT3NCrN
 YSUsBKlKkg2Nq5mQWamfywAhLiSuxAbAzi3R8pWAu+cpvphotbrbQvavWeEEyvNtsvtS
 imxNy/wF+Y2FGQpeTAYIeTd/FCl6hhRU7Rfl5nwVIwlnroXB3P7RS89B9kXL0QZ+QJx/
 VQ5k61sv6+msD3uHq63AkYEfd182mNZsCPDXcBLfnS7Vn/gcSWHf4SYESmeLXnaV25At
 hB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DThk5ngpwpGvt1GxCRNuf2gEP+rgC2MmpmILNWrK4ZI=;
 b=f/xmNEBT0rVIVdTyCMHCKNcAniANCicPbQnj1b6KxmwZ+4l5sCpTF5C4Xotu5Jv4N/
 TWHeNBkS5on24bkcMWCAQetXQfPYah43XOt8OLQxM6ms8CFGS8x2BHMpP/f+zFxKMlY7
 YslIUorQwABEbDZ1bqUyKq9JseWUh4TzCwEIOwE4ZJqUX8BGSvK3jy1Yvx2IevZg9NyU
 iJMY/zZ3XU55X9GJJZ3Cn3418W+xOHaaKnxFAsribOslH4WAY/RS2l8WFyHIBK1A93Ic
 VSaTmO0T/LBymrtkEP0/+xoTQbJ0FKl/nKCSG+2VaLdwHs/+XnvSfTaY+uPZ8Uwz74GS
 nxdA==
X-Gm-Message-State: AOAM530aBwFKk2bUyC7rQ9elOb0HgQ9KlCnZGpZXYicBAukCgZYOJgln
 2Nfb8x1JCj8cv04nYg7chwyUFFsFBi4ikw==
X-Google-Smtp-Source: ABdhPJwovNhCsDassrSzg4rbgrcTVEFRDUnLgIWu+IkXG9CX+uKrGp9BICFpyrf8uCIPW6j10+qSfQ==
X-Received: by 2002:a17:903:240a:b0:14e:dad4:5ce4 with SMTP id
 e10-20020a170903240a00b0014edad45ce4mr32200387plo.125.1647410327795; 
 Tue, 15 Mar 2022 22:58:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/17] target/m68k: Fix address argument for EXCP_CHK
Date: Tue, 15 Mar 2022 22:58:29 -0700
Message-Id: <20220316055840.727571-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
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
index 872e8ce637..5469d5dace 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -121,6 +121,12 @@ typedef struct CPUArchState {
 
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
index ac2555f47b..e6b06841aa 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -49,7 +49,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 777869790b..0411e2208a 100644
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
 
+static void QEMU_NORETURN
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
2.25.1


