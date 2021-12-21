Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9647B893
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:52:07 +0100 (CET)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVG2-0005ld-Nx
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEI-0003b0-H7
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:18 -0500
Received: from [2607:f8b0:4864:20::52c] (port=43776
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEG-0000A6-RY
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:18 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 8so3467385pgc.10
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qz+xdjhIIVqjd9hJ/vGpCTslUdMVxxkBaypOe4lBkQo=;
 b=rt7uL8tyF2eVsXOh4ifpZoro0Ztm9DLC99lbq8Nw4uAmB/7g0ReWFreAYjKcMGzBgj
 1wo2WdXK0aXrDMQPhdJzauz99sUBEigIQjaWJi2WFvl0sWR6TJHPiPnY/atut8M78EML
 1NJQB3yAKG/RvBlHQXID0zqxvhgC35KRIUp2/ArqgVIoyDqYdt59Ew9Vsz2LWTAuN6pV
 MPsTLxT9yYRO3EjtvvwJ0F3RjPYOSz9665+JDo/15su9dHuEmGsyeCn8wzuTSEMm4rot
 K5zC+BkFAbP/HqRdOb66w6gCytab9vZ1IpExOEbeMeNXFeAhPq+mohS+U5gLMx84MFVA
 JQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qz+xdjhIIVqjd9hJ/vGpCTslUdMVxxkBaypOe4lBkQo=;
 b=8Cp/PYMmUu9XL7V94TOZDye48DZiE0GstWsbYgadbczExLKD5nIs9eFrHZ4exrFTLX
 KohFanl1JYoaF4tQCd1gT/4YumGudX8LLcny+hHfX9cLRGK9VB4qYwHHcQuSVYnBkEkX
 pruu92EYYxbnlgE5gBt5yfC1JCaubKdC+j7bcvZvC1aj49LgpUTq9BfP1mFITIs7Ot7Q
 mUhOyEdEAdo8ZvrAe9rTR39b2ev1Qs8Y0dADH0NfzuXeMYp2jniDwp0RurBR8dFxhVtR
 EPV6O+nb1IfVWmKkdpCFYhcDzwfUMU/fUWCyZ6o3MT+76eqb0tmbZKhZ4GSKOj+OP18f
 xKOQ==
X-Gm-Message-State: AOAM530XHlJ5yRmPK6ePjG4W/gUufZ5G3WiUjBWAZpOmPzIrNpPDQjEz
 ZgYCSt+Aly0cQrfylHP2TCCM5g9bI3gdgw==
X-Google-Smtp-Source: ABdhPJxYTMCnyFQWUueg1aeS/DzjhEeXl2dpD2Mu3TeQNwNKPWwHdc7yANCArL1LozrfY9f+ih+lzA==
X-Received: by 2002:aa7:8891:0:b0:4ba:ee8a:8cdd with SMTP id
 z17-20020aa78891000000b004baee8a8cddmr1041442pfe.79.1640055015479; 
 Mon, 20 Dec 2021 18:50:15 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Mon, 20 Dec 2021 18:50:06 -0800
Message-Id: <20211221025012.1057923-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel has to load the instruction and extract
the imm5 field; for qemu, modify the translator to do this.

The use of R_AT for this in cpu_loop was a bug.  Handle
the other trap numbers as per the kernel's trap_table.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  2 +-
 linux-user/nios2/cpu_loop.c | 40 ++++++++++++++++++++-----------------
 target/nios2/translate.c    | 17 +++++++++++++++-
 3 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1a69ed7a49..d2ba0c5bbd 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -160,9 +160,9 @@ struct CPUNios2State {
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
-
     uint32_t irq_pending;
 #endif
+    int error_code;
 };
 
 /**
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 34290fb3b5..5c3d01d22d 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    Nios2CPU *cpu = NIOS2_CPU(cs);
     target_siginfo_t info;
     int trapnr, ret;
 
@@ -39,9 +38,10 @@ void cpu_loop(CPUNios2State *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+
         case EXCP_TRAP:
-            if (env->regs[R_AT] == 0) {
-                abi_long ret;
+            switch (env->error_code) {
+            case 0:
                 qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
 
                 ret = do_syscall(env, env->regs[2],
@@ -55,26 +55,30 @@ void cpu_loop(CPUNios2State *env)
 
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
+            case 31:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap 31\n");
+                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
+                break;
+            default:
+                qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->error_code);
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
index 08d7ac5398..a759877519 100644
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
+     * things easier for cpu_loop if we pop this into env->error_code.
+     */
+    R_TYPE(instr, code);
+    tcg_gen_st_i32(tcg_constant_i32(instr.imm5), cpu_env,
+                   offsetof(CPUNios2State, error_code));
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


