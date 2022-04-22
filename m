Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778FD50BDF1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:06:40 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwjv-0005dz-IB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWv-0000wc-9Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:13 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWs-0007GN-IY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:12 -0400
Received: by mail-pl1-x629.google.com with SMTP id c12so12097236plr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6tK1AeH5jwbz3jIl7FB7GUKXxYdrLeMzRjc3oifIdk=;
 b=vuRkr3I3+kSWCt4LEhns8pYGuCm2ag11MHo2YO6TCI0CZrVuQ9bp0zyMYpJo/d0BWs
 6sTLQwVxUsvRL2fsQDQ3vmu1yE5K6e37EaFrp2nsdwdKd2ca+1jtr1oyqOmodVUJwyEZ
 UdxsbjiBeKi14wPWIPt1QS6ouldFTKRg0VY83JAsz4Z2QXGNiMqd2U8yhMyf/8ei/Xp7
 IhtUb74+hyhQnzMYs/Y31fEBigIkVkopmuWv8zRFSJ6LM/eqnXd7NiePZwkU89DJUfVC
 3BdSZ8FvfnR4Xj67ZJQAx29+RtgSy2AtppFaUm9F/taTLOFz/bS7LimnzPmWAYL7fSYg
 o2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6tK1AeH5jwbz3jIl7FB7GUKXxYdrLeMzRjc3oifIdk=;
 b=kAZnQMOHDaP6W9UmZujejtm9v1AQS9thSklrrSyug4qE3hc5wFC2MVtG9HLZ4ioCwN
 SULx4NZowbFJZe8odfugweBUY4YoftG1SD4se9fIOucIYSvqMLAH6uNHIPaTSgU5KiT4
 NW+pOvnMF5dzUXRzYvdH4sGv+cs5RrHXF6KplPHl7wH9VwxM6d1HDClZCLAfZl2yJcaQ
 fs0gjZe7QCkJe5jgOILGGiEgOz41WYhFoTti+WXdcZWzRvv1BSIQjOcM+zRx62E+08/N
 EgZbkQ17cSZ2Os5vQKPolGsaLJnRijTuTH5/lUeKdVECVmkZ3IWgqM2xLcUejppaazvd
 sBpQ==
X-Gm-Message-State: AOAM533LJYTFQiRkaQxC2m5GmowwVG7ZJuQj8/1Np7bZY2gnxvYx/HCX
 enPmaMHHXMtT9wF86qouVKvaIAp9XAj/WEWJ
X-Google-Smtp-Source: ABdhPJxghNzP1P9hkuftXQiQtpBJt6uTvk64MGbyJyPM76V4bvj41H3G/81JceD22cy58JpZyBz5pw==
X-Received: by 2002:a17:902:ea05:b0:15a:d75d:eaeb with SMTP id
 s5-20020a170902ea0500b0015ad75deaebmr5256977plg.75.1650646389154; 
 Fri, 22 Apr 2022 09:53:09 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/68] target/nios2: Split PC out of env->regs[]
Date: Fri, 22 Apr 2022 09:51:46 -0700
Message-Id: <20220422165238.1971496-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is cleaner to have a separate name for this variable.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-17-richard.henderson@linaro.org>
---
 target/nios2/cpu.h          | 10 +++-----
 linux-user/elfload.c        |  2 +-
 linux-user/nios2/cpu_loop.c | 19 +++++++-------
 linux-user/nios2/signal.c   |  6 ++---
 target/nios2/cpu.c          |  8 +++---
 target/nios2/helper.c       | 49 +++++++++++++++++--------------------
 target/nios2/translate.c    | 29 +++++++++++-----------
 7 files changed, 58 insertions(+), 65 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 09dc38a4e7..7c48b3452f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -59,8 +59,8 @@ struct Nios2CPUClass {
 #define NUM_GP_REGS 32
 #define NUM_CR_REGS 32
 
-/* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
+/* GP regs + CR regs */
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -130,9 +130,6 @@ struct Nios2CPUClass {
 #define CR_MPUBASE   (CR_BASE + 14)
 #define CR_MPUACC    (CR_BASE + 15)
 
-/* Other registers */
-#define R_PC         64
-
 /* Exceptions */
 #define EXCP_BREAK    0x1000
 #define EXCP_RESET    0
@@ -158,6 +155,7 @@ struct Nios2CPUClass {
 
 struct CPUArchState {
     uint32_t regs[NUM_CORE_REGS];
+    uint32_t pc;
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
@@ -237,7 +235,7 @@ typedef Nios2CPU ArchCPU;
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
-    *pc = env->regs[R_PC];
+    *pc = env->pc;
     *cs_base = 0;
     *flags = (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d6bb1fc7ca..397dec5eb8 100644
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
index e725036628..a941f9032e 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -43,7 +43,7 @@ void cpu_loop(CPUNios2State *env)
              * TODO: This advance should be done in the translator, as
              * hardware produces an advanced pc as part of all exceptions.
              */
-            env->regs[R_PC] += 4;
+            env->pc += 4;
 
             switch (env->error_code) {
             case 0:
@@ -59,7 +59,7 @@ void cpu_loop(CPUNios2State *env)
                     break;
                 }
                 if (ret == -QEMU_ERESTARTSYS) {
-                    env->regs[R_PC] -= 4;
+                    env->pc -= 4;
                     break;
                 }
                 /*
@@ -74,22 +74,21 @@ void cpu_loop(CPUNios2State *env)
 
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
                 /* Match kernel's breakpoint_c(). */
-                env->regs[R_PC] -= 4;
-                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
+                env->pc -= 4;
+                force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
                 break;
             default:
                 qemu_log_mask(CPU_LOG_INT, "\nTrap %d\n", env->error_code);
-                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
-                                env->regs[R_PC]);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
                 break;
 
             case 16: /* QEMU specific, for __kuser_cmpxchg */
@@ -120,7 +119,7 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_DEBUG:
-            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
@@ -156,6 +155,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->regs[R_SP] = regs->sp;
     env->regs[R_GP] = regs->gp;
     env->regs[CR_ESTATUS] = regs->estatus;
-    env->regs[R_PC] = regs->ea;
+    env->pc = regs->ea;
     /* TODO: unsigned long  orig_r7; */
 }
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 9aa525e723..32b3dc99c6 100644
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
 
@@ -121,7 +121,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc)
     __get_user(env->regs[R_GP], &gregs[25]);
     /* Not really necessary no user settable bits */
     __get_user(temp, &gregs[26]);
-    __get_user(env->regs[R_PC], &gregs[27]);
+    __get_user(env->pc, &gregs[27]);
 
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
@@ -177,7 +177,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[4] = sig;
     env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->regs[R_PC] = ka->_sa_handler;
+    env->pc = ka->_sa_handler;
 
     unlock_user_struct(frame, frame_addr, 1);
 }
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9774a3b8a4..dc1551241e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -31,7 +31,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
-    env->regs[R_PC] = value;
+    env->pc = value;
 }
 
 static bool nios2_cpu_has_work(CPUState *cs)
@@ -49,7 +49,7 @@ static void nios2_cpu_reset(DeviceState *dev)
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-    env->regs[R_PC] = cpu->reset_addr;
+    env->pc = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
@@ -156,7 +156,7 @@ static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     if (n < 32) {          /* GP regs */
         return gdb_get_reg32(mem_buf, env->regs[n]);
     } else if (n == 32) {    /* PC */
-        return gdb_get_reg32(mem_buf, env->regs[R_PC]);
+        return gdb_get_reg32(mem_buf, env->pc);
     } else if (n < 49) {     /* Status regs */
         return gdb_get_reg32(mem_buf, env->regs[n - 1]);
     }
@@ -178,7 +178,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (n < 32) {            /* GP regs */
         env->regs[n] = ldl_p(mem_buf);
     } else if (n == 32) {    /* PC */
-        env->regs[R_PC] = ldl_p(mem_buf);
+        env->pc = ldl_p(mem_buf);
     } else if (n < 49) {     /* Status regs */
         env->regs[n - 1] = ldl_p(mem_buf);
     }
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 04a8831443..34b3e18e37 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,7 +38,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_IRQ:
         assert(env->regs[CR_STATUS] & CR_STATUS_PIE);
 
-        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->regs[R_PC]);
+        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
 
         env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
         env->regs[CR_STATUS] |= CR_STATUS_IH;
@@ -47,14 +47,13 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -70,11 +69,10 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -85,14 +83,14 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
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
@@ -105,19 +103,18 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -126,17 +123,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -145,24 +141,23 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
@@ -171,7 +166,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_PC] = cpu->exception_addr;
+        env->pc = cpu->exception_addr;
         break;
 
     default:
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index d61e349207..226bd9e30b 100644
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
@@ -742,7 +743,7 @@ illegal_op:
     t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
-static const char * const regnames[] = {
+static const char * const regnames[NUM_CORE_REGS] = {
     "zero",       "at",         "r2",         "r3",
     "r4",         "r5",         "r6",         "r7",
     "r8",         "r9",         "r10",        "r11",
@@ -759,7 +760,6 @@ static const char * const regnames[] = {
     "reserved6",  "reserved7",  "reserved8",  "reserved9",
     "reserved10", "reserved11", "reserved12", "reserved13",
     "reserved14", "reserved15", "reserved16", "reserved17",
-    "rpc"
 };
 
 #include "exec/gen-icount.h"
@@ -827,7 +827,7 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_TOO_MANY:
     case DISAS_UPDATE:
         /* Save the current PC back into the CPU register */
-        tcg_gen_movi_tl(cpu_R[R_PC], dc->base.pc_next);
+        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
@@ -877,8 +877,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         return;
     }
 
-    qemu_fprintf(f, "IN: PC=%x %s\n",
-                 env->regs[R_PC], lookup_symbol(env->regs[R_PC]));
+    qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_CORE_REGS; i++) {
         qemu_fprintf(f, "%9s=%8.8x ", regnames[i], env->regs[i]);
@@ -904,10 +903,12 @@ void nios2_tcg_init(void)
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
2.34.1


