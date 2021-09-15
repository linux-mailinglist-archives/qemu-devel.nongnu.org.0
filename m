Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C152240CBF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:52:38 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ5J-0003WE-TP
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2o-00012M-Ai
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:50:02 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2h-00037l-Fl
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:50:02 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q68so3459942pga.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75RqB79QvpeJPK1TnV3ytIKNiMyyMPujvshHYxsAxvE=;
 b=mnSP83B5TSJ+mLg5oy7b+32S1DAKt08gQFhJyYmPPxHSAYUUlUzZ58K6zgQjiOACD7
 DKJhAn2Ia9Jn/mr6z7A+C1EHo+Wn75m4rroX4feX8bjpZ+zkj6v39wr95uqGkVneOot8
 BNEWVExd2cl/++bqCqSa2W8jFAXHTjzNSE87Txcd61QF8/4uq3iXkM6Dz0/ijANdN9Cz
 4bqAQDuafLCYyTe/RnNbe2KD3UHaufi4qFlR2iondoLJZdGicOSxf19lzAC7tsxTBTA9
 aHnAW+tWjU/hkYnis6DcZWdRHhxmyJ229+KX8EP3tvegr8btBj6MxPtd6JX5FNR3UM/8
 0XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75RqB79QvpeJPK1TnV3ytIKNiMyyMPujvshHYxsAxvE=;
 b=PRK4CC59yiYyytWWELqmq8Ir0jUKfDYCbtiJAUPRptL4GxsdJUr/Urpdg6wnGBtLCN
 /6VO8eDRlYaoHJbIPdY7D74uBSmBlHV9n+aFsFv0Ze/iYrOGLTokGjDxAjW5vdQr1zP+
 NtmtDxhi4IT38BAeH9YOWarY47wIXfNXdIvRuwxgMUp/H8r66Wmyw/zJ8U/8nWPZ+mRU
 HjQR80W6xVME7Pe6M0YBKQMwpkQOEcsxw7kIjtFp2OwN9EvtEHtOlqjeFUVlD8e/sh9O
 KYKuLvv9NMa1mTfAP/vbYt7x/ehFQvQTZrcEvtfvh1pb/AfjQLcw4cvljppec9RiyCbm
 ykbw==
X-Gm-Message-State: AOAM531DeswzxVQd2eYd3ngcduWnSIuVL63Wnz+euT2XVwP2L2YennQx
 FpbCpvXOxUJd7AQFCqgDaqeZf9098i/wLw==
X-Google-Smtp-Source: ABdhPJw1x1DW3ygvI1NfJQZP75Cg7C2yYSpGQlrQ/cpC+zefW0gw/yeLpoAcdMR7nIo1iDF+044hIQ==
X-Received: by 2002:a65:404d:: with SMTP id h13mr943458pgp.130.1631728193850; 
 Wed, 15 Sep 2021 10:49:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm311667pjt.56.2021.09.15.10.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 10:49:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Wed, 15 Sep 2021 10:49:50 -0700
Message-Id: <20210915174951.1852266-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915174951.1852266-1-richard.henderson@linaro.org>
References: <20210915174951.1852266-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, crwulff@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel has to load the instruction and extract
the imm5 field; for qemu, modify the translator to do this.

The use of R_AT for this in cpu_loop was a bug.  Handle
the other trap numbers as per the kernel's trap_table.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  5 +++--
 linux-user/nios2/cpu_loop.c | 35 ++++++++++++++++++-----------------
 target/nios2/translate.c    | 17 ++++++++++++++++-
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc71..395e4d3281 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -158,9 +158,10 @@ struct Nios2CPUClass {
 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
 
-#if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_USER_ONLY
+    int trap_code;
+#else
     Nios2MMU mmu;
-
     uint32_t irq_pending;
 #endif
 };
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 9869083fa1..d76bdb2891 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -37,9 +37,10 @@ void cpu_loop(CPUNios2State *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+
         case EXCP_TRAP:
-            if (env->regs[R_AT] == 0) {
-                abi_long ret;
+            switch (env->trap_code) {
+            case 0:
                 qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
 
                 ret = do_syscall(env, env->regs[2],
@@ -53,26 +54,26 @@ void cpu_loop(CPUNios2State *env)
 
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
-                env->regs[7] = (ret > 0xfffffffffffff000ULL);
-                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-                env->regs[CR_STATUS] &= ~0x3;
-                env->regs[R_EA] = env->regs[R_PC] + 4;
+                env->regs[7] = ret > 0xfffff000u;
                 env->regs[R_PC] += 4;
                 break;
-            } else {
-                qemu_log_mask(CPU_LOG_INT, "\nTrap\n");
 
-                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-                env->regs[CR_STATUS] &= ~0x3;
-                env->regs[R_EA] = env->regs[R_PC] + 4;
-                env->regs[R_PC] = cpu->exception_addr;
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            case 1:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 1\n");
+                force_sig_fault(TARGET_SIGUSR1, 0, env->regs[R_PC]);
+                break;
+            case 2:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 2\n");
+                force_sig_fault(TARGET_SIGUSR2, 0, env->regs[R_PC]);
+                break;
+            default:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->trap_code);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
+                                env->regs[R_PC]);
                 break;
             }
+            break;
+
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 08d7ac5398..485b487665 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -636,6 +636,21 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
     tcg_temp_free(t0);
 }
 
+static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * The imm5 field is not stored anywhere on real hw; the kernel
+     * has to load the insn and extract the field.  But we can make
+     * things easier for cpu_loop if we pop this into env->trap_code.
+     */
+    R_TYPE(instr, code);
+    tcg_gen_st_i32(tcg_constant_i32(instr.imm5), cpu_env,
+                   offsetof(CPUNios2State, trap_code));
+#endif
+    t_gen_helper_raise_exception(dc, EXCP_TRAP);
+}
+
 static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(eret),                                /* eret */
@@ -682,7 +697,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
-    INSTRUCTION_FLG(gen_excp, EXCP_TRAP),             /* trap */
+    INSTRUCTION(trap),                                /* trap */
     INSTRUCTION(wrctl),                               /* wrctl */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(gen_cmpxx, TCG_COND_LTU),         /* cmpltu */
-- 
2.25.1


