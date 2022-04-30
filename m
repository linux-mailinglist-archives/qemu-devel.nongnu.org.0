Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42282515FBC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:03:53 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrRg-0001mr-3l
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHz-0004bH-OD
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHy-00082g-1r
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id c23so9647643plo.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pV7AUSBmQ/5B1DI3laiJ3NZUsISLiXaxdnniwS0N5G4=;
 b=bCmOPnADDk2mdKwfN3ZDQwmy0hIn30xhZR4OB63mKzMN8FNThdheIHyLmvSVvMsfk9
 4DZ9dV6Mtg+HLaLleFnYWi2JyyJ0sUM1tPu1CisefqlYqk+RKhWPxokJ+MQbQwfjldRn
 JAnKP/WDb9L/nTjfat2ipsOnG1rIadd1+iT2R3154hTXRHwmH8ivtBLlXJpITnkmW/N5
 WS/IwgkUjNxq92PC2d43CAwChLguaSuQi148S0nmBn8d87H2bGOcvQh+7zfJxTO+YZWS
 ux8YC6eM9fGDRQM0rIpOnMyGvyWJUF7IY4mVYnhgNWSoNEZZjCHESMCvspzMaqgZU+FF
 fK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pV7AUSBmQ/5B1DI3laiJ3NZUsISLiXaxdnniwS0N5G4=;
 b=DAO8sNC5y4cO0YGFL6YdEljJed7qlD8zznBkeHYg3/H2h7YFTQKuP8jEXslmBhyo5z
 TQ+W2wTWWi3scIfHEK5kUR4Po3FnU7PTnCmTDKDTHBeWD4ZEjN0vfJIAt103yc5HolUm
 2GBt1RraqtCAdEOwrqrEDo7oPTC9tD28STCtb/xFh78zo9KDh8dCg6Qlyx6D/xGCDStL
 PB4Ere70vxicbgi1S5DWqx2X2HgjHj1KC6yMQI2n3/cLh1q4UG/maD3a2025tY69dh/1
 q9tc24zozsPVtWiGrmFJpv4b5p+iOhv+QG7HJSTj9A45x/lqfukNOWhJmxL66/OGez38
 cHDg==
X-Gm-Message-State: AOAM530UGNlJth+UhFQWMVV7egxrIABQGN5K4l0Hr8FPZHDGRJvA7Xsk
 CfBTsO6fWGAtyoq/9+KXoNSXoZWmgPZVfQ==
X-Google-Smtp-Source: ABdhPJxHDafoiR4CsjJkYwTam26+wZ1Qs3aTp7gQq6BMvJrsENy4ktZOEX0V83vULFqccvcXWuusBw==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr4600572plp.162.1651341228764; 
 Sat, 30 Apr 2022 10:53:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/17] target/m68k: Fix address argument for EXCP_CHK
Date: Sat, 30 Apr 2022 10:53:31 -0700
Message-Id: <20220430175342.370628-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index 6ca3e1e63a..5d9c1f3753 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -48,7 +48,7 @@ void cpu_loop(CPUM68KState *env)
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


