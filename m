Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EF48632A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:50:57 +0100 (CET)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QMC-00029V-Eu
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDX-0007hZ-Ns
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:45181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDQ-0004jZ-Hz
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVNF1-1mvCmY2Uvn-00SOlJ; Thu, 06
 Jan 2022 11:41:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Thu,  6 Jan 2022 11:41:27 +0100
Message-Id: <20220106104137.732883-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qG6vv5OFKb6Yy0S4W/IXZOP6sug6DV/0tU8kkyuNGlqZutDa2aL
 HLnE19xMVs8u1U0bxGyEjNMBjfpVWQ5pa+aMyn2JGA9YlqoZu63Lu649Yo4KwDVLHH+eftQ
 B+hiC95yAbzQXyYW8sJPLMH0t2/A7DHJwqQQY6l71ogrgWzGMGyi17flnBsZDJbkZ+vp5ZN
 2b1JeI/yGQFm32bOfBN2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:07BPLdb04k4=:gslS6L2yedPYlWz7JPzWS+
 7/L/46a+zXc8/MY/5CZU6NVV4ITrbS44Ncyz7NVAtT1RCAMs6ax6jyvpn0W7SmNihUBUy4Ruv
 b2IiC9m2jlL2OdZhXa8Clm5xKw8TuYPSy7zZuOlsuIYtDLN99Y4IZFka3W1uNbXomX4NbsO6K
 VMrv98p71KtXOvqf8dXk5svNBxa+y4n+l30cqJDVuq2CL7fm2oCSo9rES0/LfEUwmLwqkiTzh
 U1eb5PAdrgW7QpeFOvr2MwYI/JNLL5raHH5awGD2YTWnNTW8BEu/4fy4HFLxDU5Ta3g4QPbur
 Y8FaFwOhyjBdPPMI4a3XmXFJ7xWiiJvA/ESkUpe8nUEggv9J/SNXsHk7ocAsLm38vnyIp68i8
 i8zg8MLfcpKi2JgHM4Un0zrN55HE9Cf/gTnZIxUDEC7rhNTAzU6lRab8YjaDFu2IwN3kIXSxW
 A6kAIQqMs9g39ZqlljqMxCH4NONxvP/kdIsmFBZvPeCDrftkTr/Xja1K8mqkDBErjYhf9tnbe
 65XbaIWE6grWdmxibbY8KFWpq9F5W1BCTPq7kUp6OGAp0Tk1d9diWCl3A9mTM/f1u2Q0ws1rB
 QkzdTIJG8Gn3t6WWOjGQrbvjdou3F4lpNlme4p1K3OiEy103qa1FcCQWUA67HXypkKcLBi4I/
 Rq7iLyeUa5DPdu9vzn6vmT6qIRQ4nqupcZezvCjlWCnFTq2SZ65zzu1nN4VZd6qs0I2k=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The real kernel has to load the instruction and extract
the imm5 field; for qemu, modify the translator to do this.

The use of R_AT for this in cpu_loop was a bug.  Handle
the other trap numbers as per the kernel's trap_table.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211221025012.1057923-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/cpu_loop.c | 40 ++++++++++++++++++++-----------------
 target/nios2/cpu.h          |  2 +-
 target/nios2/translate.c    | 17 +++++++++++++++-
 3 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 34290fb3b51c..5c3d01d22dd7 100644
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
-
-                env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-                env->regs[CR_STATUS] &= ~0x3;
-                env->regs[R_EA] = env->regs[R_PC] + 4;
-                env->regs[R_PC] = cpu->exception_addr;
 
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
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1a69ed7a49c7..d2ba0c5bbd82 100644
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
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 08d7ac539834..a75987751926 100644
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
2.33.1


