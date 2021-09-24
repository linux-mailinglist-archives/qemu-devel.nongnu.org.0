Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F441792C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:03:00 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTobD-0005jj-MS
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY4-0002gU-TI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:44 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY1-00071g-RY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:44 -0400
Received: by mail-qv1-xf34.google.com with SMTP id a9so6724748qvf.0
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QyWQEo+8inM5iDruY826QX36+Q2J0PKidDJBY0ejKxk=;
 b=ObdanfZr1BcgLUvvWkMdYOEO77IQ8AWjbRSBuQ9axysAmhzOLHSO/AC2bBSdrUU1Gl
 lExrkwmAVuiGcYDZWzXUr+qVPxytPecQhQ80w0hC+99tJ29W2XKzr/5hR6sRvxoF/8BD
 dvSMl467KFLfOcqUnHSeQquGxfVa4yKf0Di74reozUbBN/JvxmAb2vcfRILFYxBaiAHl
 r721b8jKTY6cz2hkuxlnKuEHESv/k/KCiOKHuEW5xHDpjUOLjLiBRQNktAnFA81RaJPO
 DqILIryYDKSIw+DmpryQyv++eZb+lVhjC3mUtMVw3XSfhuVvGBNhv9tP4vPUyrfAa90V
 y3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QyWQEo+8inM5iDruY826QX36+Q2J0PKidDJBY0ejKxk=;
 b=zp4QWqmNpJyVNgKP/pkPXnRQrSYwMjjXSmHsDieJfbmpY7ww9xy0gcFNSjZfPfe0GX
 0BixiEJCclogyRPcuabJ30xY9HagyTqc+OU+xjgFQgVy4CP3HUn9OaHz2OvVxUvHaVNJ
 4lCvtZ1rNWeZdoAhffm3JjqBuwArVpBnhEODsiaPRqcxny2qdcpK1wsZlbGjNX+P57EI
 SQLKCKkmvdEEMUhS2EDrSrFtQIgXE1IIo5HMzQUukogsYH68aX8iYgnrUDUKZfma827R
 O6E547TOI0whLk6J5CcT7e8nSdiKqlek2sKwuB2zJmzdhwzafZOFHVfWQSzWXXpO24G8
 tssQ==
X-Gm-Message-State: AOAM531CdfDbh5zSWPextFFhX+mUrhimSvZ5/8VwBwAuyEgbWzbynqoq
 FqfklZ+5HpR3trcKXm27erZ8gwZmnAILEg==
X-Google-Smtp-Source: ABdhPJw+gV9C0wUZs6ULNe93EMc22YH+brLkcZtQhedOHFB4cYyQI7vb6MkcLPN8yVfucadIM0vMBw==
X-Received: by 2002:a05:6214:4b4:: with SMTP id
 w20mr11195739qvz.20.1632502779865; 
 Fri, 24 Sep 2021 09:59:39 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/27] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Fri, 24 Sep 2021 12:59:15 -0400
Message-Id: <20210924165926.752809-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
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
index 34290fb3b5..246293a501 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -39,9 +39,10 @@ void cpu_loop(CPUNios2State *env)
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
@@ -55,26 +56,26 @@ void cpu_loop(CPUNios2State *env)
 
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


