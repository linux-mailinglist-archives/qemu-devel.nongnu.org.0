Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905CC4D10F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:28:12 +0100 (CET)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUGR-0007I3-D8
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8q-00053E-QS
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:22 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42770
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8o-0006EQ-Fo
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1595317pjq.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7spU4QOgMYXFOcsYuyZeK5HKFS4OU5xF4gFnu01zGk=;
 b=ABPbx/FPkBnIkIt020vUemRdBOGWO0FkmE6dhoYCG8LNrhnTnivt0J1legD/nxwDzU
 9MzsQUQq3js4Hn2Y555VhkoLE+FoUNDFsU/U0QQJh8iiq4Zn4Mlyfq6IaZIBK+/ChBt5
 LyBzFvwG1nPomeDlV9y8TrhwoAYTMFpuOVOkzhT5Xv7mTrwGP7s/R/OmD1DT6kM4wOFN
 GB/pdUZTl0G2cR37xFVoVdkO3k4ckuk7EdsbBw4xCiBfTY5Htf+fcfZE9A5yaQrEWqDj
 gMvg3CQaUHgzlImLha5FzpPnLAFOBSGF3Pya0higLQwR9XpD0Ww7+ZjvXaokKs5zL5uh
 hdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7spU4QOgMYXFOcsYuyZeK5HKFS4OU5xF4gFnu01zGk=;
 b=bvSquvM2xc7olCYn8py+xqvikgfPSRZWRZrTyE3fg9L8QUOcXljyz7Ndx566uKJrCW
 icHKzPF0sUpFT5+/fJND3qPZT2CkJUa/cuknIvzw5COlcCXtudwWSdqxR6ZuoVEj8H/e
 qIu77M5H9T1CZBS4chLLNlYYAri/eO00JyMxKMg8kGqpwV7OIPXQXbvgaQuE8p4HZTvC
 FUOwvWdtn/v/HqX411rGyQqng3nsdy38WYumE0pRGS1E/4XmVJDgrJSBLVwXOsy6tPBM
 WNnZpAwG7S6Q596+DK9mXmxZ7FOeCO2TzTuNfb3qDMOBgmBuGwhlWjqTFmoYRYwGLe/v
 zKGA==
X-Gm-Message-State: AOAM531UztJT7QkHxOXNBYmKUyWTtM9oHgRBscj2lTiB9jXZKfP/6KbW
 6h0vLnAQkWBpGrXD9KdizXcqUrKc31EyAQ==
X-Google-Smtp-Source: ABdhPJw67AxLUicGX3bV4QQSljTCSAodvwPMIB4VMQlwjvMZbU4GRKXNaNRqttzOI3S1nZHgdQtW+Q==
X-Received: by 2002:a17:903:2308:b0:151:8b3a:e43e with SMTP id
 d8-20020a170903230800b001518b3ae43emr16060011plh.30.1646724015692; 
 Mon, 07 Mar 2022 23:20:15 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/33] target/nios2: Split PC out of env->regs[]
Date: Mon,  7 Mar 2022 21:19:36 -1000
Message-Id: <20220308072005.307955-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is cleaner to have a separate name for this variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h          | 10 +++-----
 linux-user/elfload.c        |  2 +-
 linux-user/nios2/cpu_loop.c | 17 ++++++-------
 linux-user/nios2/signal.c   |  6 ++---
 target/nios2/cpu.c          |  8 +++---
 target/nios2/helper.c       | 51 +++++++++++++++++--------------------
 target/nios2/translate.c    | 26 ++++++++++---------
 7 files changed, 57 insertions(+), 63 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 655a440033..727d31c427 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -60,8 +60,8 @@ struct Nios2CPUClass {
 #define NUM_GP_REGS 32
 #define NUM_CR_REGS 32
 
-/* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
+/* GP regs + CR regs */
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -131,9 +131,6 @@ struct Nios2CPUClass {
 #define CR_MPUBASE   (CR_BASE + 14)
 #define CR_MPUACC    (CR_BASE + 15)
 
-/* Other registers */
-#define R_PC         64
-
 /* Exceptions */
 #define EXCP_BREAK    0x1000
 #define EXCP_RESET    0
@@ -159,6 +156,7 @@ struct Nios2CPUClass {
 
 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
+    uint32_t pc;
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
@@ -242,7 +240,7 @@ typedef Nios2CPU ArchCPU;
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
-    *pc = env->regs[R_PC];
+    *pc = env->pc;
     *cs_base = 0;
     *flags = (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9628a38361..23ff9659a5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1170,7 +1170,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
     (*regs)[30] = -1;    /* R_SSTATUS */
     (*regs)[31] = tswapreg(env->regs[R_RA]);
 
-    (*regs)[32] = tswapreg(env->regs[R_PC]);
+    (*regs)[32] = tswapreg(env->pc);
 
     (*regs)[33] = -1; /* R_STATUS */
     (*regs)[34] = tswapreg(env->regs[CR_ESTATUS]);
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 1e93ef34e6..7b20c024db 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -56,25 +56,24 @@ void cpu_loop(CPUNios2State *env)
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-                env->regs[R_PC] += 4;
+                env->pc += 4;
                 break;
 
             case 1:
                 qemu_log_mask(CPU_LOG_INT, "\nTrap 1\n");
-                force_sig_fault(TARGET_SIGUSR1, 0, env->regs[R_PC]);
+                force_sig_fault(TARGET_SIGUSR1, 0, env->pc);
                 break;
             case 2:
                 qemu_log_mask(CPU_LOG_INT, "\nTrap 2\n");
-                force_sig_fault(TARGET_SIGUSR2, 0, env->regs[R_PC]);
+                force_sig_fault(TARGET_SIGUSR2, 0, env->pc);
                 break;
             case 31:
                 qemu_log_mask(CPU_LOG_INT, "\nTrap 31\n");
-                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
+                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
                 break;
             default:
                 qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->error_code);
-                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
-                                env->regs[R_PC]);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
                 break;
 
             case 16: /* QEMU specific, for __kuser_cmpxchg */
@@ -99,7 +98,7 @@ void cpu_loop(CPUNios2State *env)
                     o = env->regs[5];
                     n = env->regs[6];
                     env->regs[2] = qatomic_cmpxchg(h, o, n) - o;
-                    env->regs[R_PC] += 4;
+                    env->pc += 4;
                 }
                 break;
             }
@@ -117,7 +116,7 @@ void cpu_loop(CPUNios2State *env)
                 info.si_errno = 0;
                 /* TODO: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->regs[R_PC];
+                info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             }
             break;
@@ -155,6 +154,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->regs[R_SP] = regs->sp;
     env->regs[R_GP] = regs->gp;
     env->regs[CR_ESTATUS] = regs->estatus;
-    env->regs[R_PC] = regs->ea;
+    env->pc = regs->ea;
     /* TODO: unsigned long  orig_r7; */
 }
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..ccfaa75d3b 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -73,7 +73,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_RA], &gregs[23]);
     __put_user(env->regs[R_FP], &gregs[24]);
     __put_user(env->regs[R_GP], &gregs[25]);
-    __put_user(env->regs[R_PC], &gregs[27]);
+    __put_user(env->pc, &gregs[27]);
     __put_user(env->regs[R_SP], &gregs[28]);
 }
 
@@ -122,7 +122,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_GP], &gregs[25]);
     /* Not really necessary no user settable bits */
     __get_user(temp, &gregs[26]);
-    __get_user(env->regs[R_PC], &gregs[27]);
+    __get_user(env->pc, &gregs[27]);
 
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
@@ -180,7 +180,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[4] = sig;
     env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->regs[R_PC] = ka->_sa_handler;
+    env->pc = ka->_sa_handler;
 
     unlock_user_struct(frame, frame_addr, 1);
 }
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..40031c9f20 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -31,7 +31,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
-    env->regs[R_PC] = value;
+    env->pc = value;
 }
 
 static bool nios2_cpu_has_work(CPUState *cs)
@@ -54,7 +54,7 @@ static void nios2_cpu_reset(DeviceState *dev)
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-    env->regs[R_PC] = cpu->reset_addr;
+    env->pc = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
@@ -161,7 +161,7 @@ static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     if (n < 32) {          /* GP regs */
         return gdb_get_reg32(mem_buf, env->regs[n]);
     } else if (n == 32) {    /* PC */
-        return gdb_get_reg32(mem_buf, env->regs[R_PC]);
+        return gdb_get_reg32(mem_buf, env->pc);
     } else if (n < 49) {     /* Status regs */
         return gdb_get_reg32(mem_buf, env->regs[n - 1]);
     }
@@ -183,7 +183,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (n < 32) {            /* GP regs */
         env->regs[n] = ldl_p(mem_buf);
     } else if (n == 32) {    /* PC */
-        env->regs[R_PC] = ldl_p(mem_buf);
+        env->pc = ldl_p(mem_buf);
     } else if (n < 49) {     /* Status regs */
         env->regs[n - 1] = ldl_p(mem_buf);
     }
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..31cec29e89 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -35,7 +35,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
     cs->exception_index = -1;
-    env->regs[R_EA] = env->regs[R_PC] + 4;
+    env->regs[R_EA] = env->pc + 4;
 }
 
 void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
@@ -58,7 +58,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_IRQ:
         assert(env->regs[CR_STATUS] & CR_STATUS_PIE);
 
-        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
 
         env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
         env->regs[CR_STATUS] |= CR_STATUS_IH;
@@ -67,14 +67,13 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_EA] = env->regs[R_PC] + 4;
-        env->regs[R_PC] = cpu->exception_addr;
+        env->regs[R_EA] = env->pc + 4;
+        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_TLBD:
         if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n",
-                          env->regs[R_PC]);
+            qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
 
             /* Fast TLB miss */
             /* Variation from the spec. Table 3-35 of the cpu reference shows
@@ -90,11 +89,10 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->regs[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->regs[CR_TLBMISC] |= CR_TLBMISC_WR;
 
-            env->regs[R_EA] = env->regs[R_PC] + 4;
-            env->regs[R_PC] = cpu->fast_tlb_miss_addr;
+            env->regs[R_EA] = env->pc + 4;
+            env->pc = cpu->fast_tlb_miss_addr;
         } else {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n",
-                          env->regs[R_PC]);
+            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
 
             /* Double TLB miss */
             env->regs[CR_STATUS] |= CR_STATUS_EH;
@@ -105,14 +103,14 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
             env->regs[CR_TLBMISC] |= CR_TLBMISC_DBL;
 
-            env->regs[R_PC] = cpu->exception_addr;
+            env->pc = cpu->exception_addr;
         }
         break;
 
     case EXCP_TLBR:
     case EXCP_TLBW:
     case EXCP_TLBX:
-        qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
 
         env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
         env->regs[CR_STATUS] |= CR_STATUS_EH;
@@ -125,19 +123,18 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->regs[CR_TLBMISC] |= CR_TLBMISC_WR;
         }
 
-        env->regs[R_EA] = env->regs[R_PC] + 4;
-        env->regs[R_PC] = cpu->exception_addr;
+        env->regs[R_EA] = env->pc + 4;
+        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
-        qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n",
-                      env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
 
         if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-            env->regs[R_EA] = env->regs[R_PC] + 4;
+            env->regs[R_EA] = env->pc + 4;
         }
 
         env->regs[CR_STATUS] |= CR_STATUS_EH;
@@ -146,17 +143,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_PC] = cpu->exception_addr;
+        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
-        qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n",
-                      env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
 
         if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-            env->regs[R_EA] = env->regs[R_PC] + 4;
+            env->regs[R_EA] = env->pc + 4;
         }
 
         env->regs[CR_STATUS] |= CR_STATUS_EH;
@@ -165,24 +161,23 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_PC] = cpu->exception_addr;
+        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_BREAK:
-        qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n",
-                      env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
         /* The semihosting instruction is "break 1".  */
         if (semihosting_enabled() &&
-            cpu_ldl_code(env, env->regs[R_PC]) == 0x003da07a)  {
+            cpu_ldl_code(env, env->pc) == 0x003da07a)  {
             qemu_log_mask(CPU_LOG_INT, "Entering semihosting\n");
-            env->regs[R_PC] += 4;
+            env->pc += 4;
             do_nios2_semihosting(env);
             break;
         }
 
         if ((env->regs[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->regs[CR_BSTATUS] = env->regs[CR_STATUS];
-            env->regs[R_BA] = env->regs[R_PC] + 4;
+            env->regs[R_BA] = env->pc + 4;
         }
 
         env->regs[CR_STATUS] |= CR_STATUS_EH;
@@ -191,7 +186,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_PC] = cpu->exception_addr;
+        env->pc = cpu->exception_addr;
         break;
 
     default:
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 1e0ab686dc..7a33181c4b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -104,6 +104,7 @@ typedef struct DisasContext {
 } DisasContext;
 
 static TCGv cpu_R[NUM_CORE_REGS];
+static TCGv cpu_pc;
 
 typedef struct Nios2Instruction {
     void     (*handler)(DisasContext *dc, uint32_t code, uint32_t flags);
@@ -144,7 +145,7 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
 {
     TCGv_i32 tmp = tcg_const_i32(index);
 
-    tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
+    tcg_gen_movi_tl(cpu_pc, dc->pc);
     gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     dc->base.is_jmp = DISAS_NORETURN;
@@ -156,10 +157,10 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
     if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(cpu_R[R_PC], dest);
+        tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
     } else {
-        tcg_gen_movi_tl(cpu_R[R_PC], dest);
+        tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
 }
@@ -391,7 +392,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
     }
 
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
+    tcg_gen_mov_tl(cpu_pc, cpu_R[R_EA]);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -399,7 +400,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_RA]);
+    tcg_gen_mov_tl(cpu_pc, cpu_R[R_RA]);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -407,7 +408,7 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ba */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_BA]);
+    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -417,7 +418,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -440,7 +441,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
     tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
@@ -827,7 +828,7 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_TOO_MANY:
     case DISAS_UPDATE:
         /* Save the current PC back into the CPU register */
-        tcg_gen_movi_tl(cpu_R[R_PC], dc->base.pc_next);
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
@@ -876,8 +877,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         return;
     }
 
-    qemu_fprintf(f, "IN: PC=%x %s\n",
-                 env->regs[R_PC], lookup_symbol(env->regs[R_PC]));
+    qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_CORE_REGS; i++) {
         qemu_fprintf(f, "%9s=%8.8x ", regnames[i], env->regs[i]);
@@ -903,10 +903,12 @@ void nios2_tcg_init(void)
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
     }
+    cpu_pc = tcg_global_mem_new(cpu_env,
+                                offsetof(CPUNios2State, pc), "pc");
 }
 
 void restore_state_to_opc(CPUNios2State *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->regs[R_PC] = data[0];
+    env->pc = data[0];
 }
-- 
2.25.1


