Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C00255C47
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 16:22:28 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBfGt-0004c8-3x
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 10:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfED-0007xV-Vc
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:19:42 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEB-00052v-IB
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:19:41 -0400
Received: by mail-pj1-x1043.google.com with SMTP id mt12so559166pjb.4
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OXLnCdYVi2j43Kppbpt72ljKyfNbleLew6fTqAwaaE=;
 b=hmdPJAKPktTlqXAhnS167pqq1Hgx4G7aaZODjJD2Kgnn/FKk1HzdFta7ailHOULFFe
 zjnmwUvy9pMdnUb6KXFraWC8om+sMVkuoU9uldkGfy/tuMzH23faANedw2JRxrNWDnZO
 dRUZRcUJQytpgbYzkCVAotoEiuq5SLPQPZKjdswB0CNvXYJJwHIfVM/0l6MjalkMFdZy
 /WrYN/FlAa6eIMjEdZIltfzKLH9Qwv4IDLfuoPwjpcAm2ympax7Ck9lmath6tFf0gh5y
 oAAwIsRxo1yYPRQsmmeh6fIGWoI92TyxRoHp5lzymvsXLhlhChYoKHgMd+6Y8IXFPODT
 j1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OXLnCdYVi2j43Kppbpt72ljKyfNbleLew6fTqAwaaE=;
 b=RceYMOmTN/MWW/ZpVcc0PKANJsauIwNpM2jcDICiJy8KYYCfx5JM2jN6FqjlGU84Uq
 vdMXj3/iR3eowAH1D1Qex4GuRt+e9cK9QuLT6EYmIIC0Fvd+brUwlkloRt25kdBvT/4H
 zF+KxeAdA+2KgAn6VDgGfola6kiMOmk48zswVjo5qBRHDY+SgbH5k4YrLUDQv1qUUFPB
 W8i1UXH2jSAE2mmByRtoi7OaJpQyFE+I4ask0bljHPr3SYMshXXT8TbWZkGDLesH71cb
 AOfTJH36eB8ZBoN5BF/HPAkmUmBkRH/a2o95rOI/WTkJhClGjIEKDHrOeD0nCFBv3O/G
 BQzA==
X-Gm-Message-State: AOAM531pVLnxcSJCGcjAWnDkrS67gDWP74apkSjAkJ/nIf6ghffo2Wbp
 imn3nr9ixtRfjCQV8mvUCRaqr0n8cgDqRw==
X-Google-Smtp-Source: ABdhPJxd/jTy/J2S8LaJOjSPTkuBfhJplaDsDw6w8jsaW17ose/KLKQTpAhK66pY+1f88pW5NdJuWw==
X-Received: by 2002:a17:902:b497:: with SMTP id
 y23mr1444238plr.251.1598624377255; 
 Fri, 28 Aug 2020 07:19:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j3sm1403080pjw.23.2020.08.28.07.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/76] target/microblaze: Split out PC from env->sregs
Date: Fri, 28 Aug 2020 07:18:18 -0700
Message-Id: <20200828141929.77854-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828141929.77854-1-richard.henderson@linaro.org>
References: <20200828141929.77854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin eliminating the sregs array in favor of individual members.
Does not correct the width of pc, yet.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          |  3 ++-
 linux-user/microblaze/cpu_loop.c | 12 +++++------
 linux-user/microblaze/signal.c   |  8 ++++----
 target/microblaze/cpu.c          |  4 ++--
 target/microblaze/gdbstub.c      |  4 ++--
 target/microblaze/helper.c       | 34 ++++++++++++++++----------------
 target/microblaze/mmu.c          |  2 +-
 target/microblaze/op_helper.c    |  2 +-
 target/microblaze/translate.c    | 10 +++++++---
 9 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index a31134b65c..d1f91bb318 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -236,6 +236,7 @@ struct CPUMBState {
 
     uint32_t imm;
     uint32_t regs[32];
+    uint64_t pc;
     uint64_t sregs[14];
     float_status fp_status;
     /* Stack protectors. Yes, it's a hw feature.  */
@@ -351,7 +352,7 @@ typedef MicroBlazeCPU ArchCPU;
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
-    *pc = env->sregs[SR_PC];
+    *pc = env->pc;
     *cs_base = 0;
     *flags = (env->iflags & IFLAGS_TB_MASK) |
                  (env->sregs[SR_MSR] & (MSR_UM | MSR_VM | MSR_EE));
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 3e0a7f730b..3c693086f4 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -51,7 +51,7 @@ void cpu_loop(CPUMBState *env)
         case EXCP_BREAK:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
-            env->sregs[SR_PC] = env->regs[14];
+            env->pc = env->regs[14];
             ret = do_syscall(env, 
                              env->regs[12], 
                              env->regs[5], 
@@ -63,7 +63,7 @@ void cpu_loop(CPUMBState *env)
                              0, 0);
             if (ret == -TARGET_ERESTARTSYS) {
                 /* Wind back to before the syscall. */
-                env->sregs[SR_PC] -= 4;
+                env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[3] = ret;
             }
@@ -73,13 +73,13 @@ void cpu_loop(CPUMBState *env)
              * not a userspace-usable register, as the kernel may clobber it
              * at any point.)
              */
-            env->regs[14] = env->sregs[SR_PC];
+            env->regs[14] = env->pc;
             break;
         case EXCP_HW_EXCP:
-            env->regs[17] = env->sregs[SR_PC] + 4;
+            env->regs[17] = env->pc + 4;
             if (env->iflags & D_FLAG) {
                 env->sregs[SR_ESR] |= 1 << 12;
-                env->sregs[SR_PC] -= 4;
+                env->pc -= 4;
                 /* FIXME: if branch was immed, replay the imm as well.  */
             }
 
@@ -165,5 +165,5 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->regs[29] = regs->r29;
     env->regs[30] = regs->r30;
     env->regs[31] = regs->r31;
-    env->sregs[SR_PC] = regs->pc;
+    env->pc = regs->pc;
 }
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 80950c2181..b4eeef4673 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -87,7 +87,7 @@ static void setup_sigcontext(struct target_sigcontext *sc, CPUMBState *env)
     __put_user(env->regs[29], &sc->regs.r29);
     __put_user(env->regs[30], &sc->regs.r30);
     __put_user(env->regs[31], &sc->regs.r31);
-    __put_user(env->sregs[SR_PC], &sc->regs.pc);
+    __put_user(env->pc, &sc->regs.pc);
 }
 
 static void restore_sigcontext(struct target_sigcontext *sc, CPUMBState *env)
@@ -124,7 +124,7 @@ static void restore_sigcontext(struct target_sigcontext *sc, CPUMBState *env)
     __get_user(env->regs[29], &sc->regs.r29);
     __get_user(env->regs[30], &sc->regs.r30);
     __get_user(env->regs[31], &sc->regs.r31);
-    __get_user(env->sregs[SR_PC], &sc->regs.pc);
+    __get_user(env->pc, &sc->regs.pc);
 }
 
 static abi_ulong get_sigframe(struct target_sigaction *ka,
@@ -188,7 +188,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[7] = frame_addr += offsetof(typeof(*frame), uc);
 
     /* Offset of 4 to handle microblaze rtid r14, 0 */
-    env->sregs[SR_PC] = (unsigned long)ka->_sa_handler;
+    env->pc = (unsigned long)ka->_sa_handler;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -228,7 +228,7 @@ long do_sigreturn(CPUMBState *env)
     restore_sigcontext(&frame->uc.tuc_mcontext, env);
     /* We got here through a sigreturn syscall, our path back is via an
        rtb insn so setup r14 for that.  */
-    env->regs[14] = env->sregs[SR_PC];
+    env->regs[14] = env->pc;
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 51e5c85b10..bde9992535 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -79,7 +79,7 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
-    cpu->env.sregs[SR_PC] = value;
+    cpu->env.pc = value;
 }
 
 static bool mb_cpu_has_work(CPUState *cs)
@@ -117,7 +117,7 @@ static void mb_cpu_reset(DeviceState *dev)
     /* Disable stack protector.  */
     env->shr = ~0;
 
-    env->sregs[SR_PC] = cpu->cfg.base_vectors;
+    env->pc = cpu->cfg.base_vectors;
 
 #if defined(CONFIG_USER_ONLY)
     /* start in user mode with interrupts enabled.  */
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index e65ec051a5..9ea31f8d2f 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -59,7 +59,7 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         val = env->regs[n];
         break;
     case GDB_PC:
-        val = env->sregs[SR_PC];
+        val = env->pc;
         break;
     case GDB_MSR:
         val = env->sregs[SR_MSR];
@@ -115,7 +115,7 @@ int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->regs[n] = tmp;
         break;
     case GDB_PC:
-        env->sregs[SR_PC] = tmp;
+        env->pc = tmp;
         break;
     case GDB_MSR:
         env->sregs[SR_MSR] = tmp;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index ab2ceeb055..5c392deea4 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -35,7 +35,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
     env->res_addr = RES_ADDR_NONE;
-    env->regs[14] = env->sregs[SR_PC];
+    env->regs[14] = env->pc;
 }
 
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -126,7 +126,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
                 return;
             }
 
-            env->regs[17] = env->sregs[SR_PC] + 4;
+            env->regs[17] = env->pc + 4;
             env->sregs[SR_ESR] &= ~(1 << 12);
 
             /* Exception breaks branch + dslot sequence?  */
@@ -145,15 +145,15 @@ void mb_cpu_do_interrupt(CPUState *cs)
             qemu_log_mask(CPU_LOG_INT,
                           "hw exception at pc=%" PRIx64 " ear=%" PRIx64 " "
                           "esr=%" PRIx64 " iflags=%x\n",
-                          env->sregs[SR_PC], env->sregs[SR_EAR],
+                          env->pc, env->sregs[SR_EAR],
                           env->sregs[SR_ESR], env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             env->iflags &= ~(IMM_FLAG | D_FLAG);
-            env->sregs[SR_PC] = cpu->cfg.base_vectors + 0x20;
+            env->pc = cpu->cfg.base_vectors + 0x20;
             break;
 
         case EXCP_MMU:
-            env->regs[17] = env->sregs[SR_PC];
+            env->regs[17] = env->pc;
 
             env->sregs[SR_ESR] &= ~(1 << 12);
             /* Exception breaks branch + dslot sequence?  */
@@ -169,7 +169,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
                     qemu_log_mask(CPU_LOG_INT,
                                   "bimm exception at pc=%" PRIx64 " "
                                   "iflags=%x\n",
-                                  env->sregs[SR_PC], env->iflags);
+                                  env->pc, env->iflags);
                     env->regs[17] -= 4;
                     log_cpu_state_mask(CPU_LOG_INT, cs, 0);
                 }
@@ -188,10 +188,10 @@ void mb_cpu_do_interrupt(CPUState *cs)
             qemu_log_mask(CPU_LOG_INT,
                           "exception at pc=%" PRIx64 " ear=%" PRIx64 " "
                           "iflags=%x\n",
-                          env->sregs[SR_PC], env->sregs[SR_EAR], env->iflags);
+                          env->pc, env->sregs[SR_EAR], env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             env->iflags &= ~(IMM_FLAG | D_FLAG);
-            env->sregs[SR_PC] = cpu->cfg.base_vectors + 0x20;
+            env->pc = cpu->cfg.base_vectors + 0x20;
             break;
 
         case EXCP_IRQ:
@@ -209,14 +209,14 @@ void mb_cpu_do_interrupt(CPUState *cs)
             {
                 const char *sym;
 
-                sym = lookup_symbol(env->sregs[SR_PC]);
+                sym = lookup_symbol(env->pc);
                 if (sym
                     && (!strcmp("netif_rx", sym)
                         || !strcmp("process_backlog", sym))) {
 
                     qemu_log(
                          "interrupt at pc=%x msr=%x %x iflags=%x sym=%s\n",
-                         env->sregs[SR_PC], env->sregs[SR_MSR], t, env->iflags,
+                         env->pc, env->sregs[SR_MSR], t, env->iflags,
                          sym);
 
                     log_cpu_state(cs, 0);
@@ -226,14 +226,14 @@ void mb_cpu_do_interrupt(CPUState *cs)
             qemu_log_mask(CPU_LOG_INT,
                          "interrupt at pc=%" PRIx64 " msr=%" PRIx64 " %x "
                          "iflags=%x\n",
-                         env->sregs[SR_PC], env->sregs[SR_MSR], t, env->iflags);
+                         env->pc, env->sregs[SR_MSR], t, env->iflags);
 
             env->sregs[SR_MSR] &= ~(MSR_VMS | MSR_UMS | MSR_VM \
                                     | MSR_UM | MSR_IE);
             env->sregs[SR_MSR] |= t;
 
-            env->regs[14] = env->sregs[SR_PC];
-            env->sregs[SR_PC] = cpu->cfg.base_vectors + 0x10;
+            env->regs[14] = env->pc;
+            env->pc = cpu->cfg.base_vectors + 0x10;
             //log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             break;
 
@@ -245,17 +245,17 @@ void mb_cpu_do_interrupt(CPUState *cs)
             qemu_log_mask(CPU_LOG_INT,
                         "break at pc=%" PRIx64 " msr=%" PRIx64 " %x "
                         "iflags=%x\n",
-                        env->sregs[SR_PC], env->sregs[SR_MSR], t, env->iflags);
+                        env->pc, env->sregs[SR_MSR], t, env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             env->sregs[SR_MSR] &= ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM);
             env->sregs[SR_MSR] |= t;
             env->sregs[SR_MSR] |= MSR_BIP;
             if (cs->exception_index == EXCP_HW_BREAK) {
-                env->regs[16] = env->sregs[SR_PC];
+                env->regs[16] = env->pc;
                 env->sregs[SR_MSR] |= MSR_BIP;
-                env->sregs[SR_PC] = cpu->cfg.base_vectors + 0x18;
+                env->pc = cpu->cfg.base_vectors + 0x18;
             } else
-                env->sregs[SR_PC] = env->btarget;
+                env->pc = env->btarget;
             break;
         default:
             cpu_abort(cs, "unhandled exception type=%d\n",
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 6763421ba2..3f403b567b 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -251,7 +251,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
                 if (i < 3 && !(v & TLB_VALID) && qemu_loglevel_mask(~0))
                     qemu_log_mask(LOG_GUEST_ERROR,
                              "invalidating index %x at pc=%" PRIx64 "\n",
-                             i, env->sregs[SR_PC]);
+                             i, env->pc);
                 env->mmu.tids[i] = env->mmu.regs[MMU_R_PID] & 0xff;
                 mmu_flush_idx(env, i);
             }
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index f3b17a95b3..2deef32740 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -75,7 +75,7 @@ void helper_debug(CPUMBState *env)
 {
     int i;
 
-    qemu_log("PC=%" PRIx64 "\n", env->sregs[SR_PC]);
+    qemu_log("PC=%" PRIx64 "\n", env->pc);
     qemu_log("rmsr=%" PRIx64 " resr=%" PRIx64 " rear=%" PRIx64 " "
              "debug[%x] imm=%x iflags=%x\n",
              env->sregs[SR_MSR], env->sregs[SR_ESR], env->sregs[SR_EAR],
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a96cb21d96..9f6815cc1f 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1805,7 +1805,7 @@ void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 
     qemu_fprintf(f, "IN: PC=%" PRIx64 " %s\n",
-                 env->sregs[SR_PC], lookup_symbol(env->sregs[SR_PC]));
+                 env->pc, lookup_symbol(env->pc));
     qemu_fprintf(f, "rmsr=%" PRIx64 " resr=%" PRIx64 " rear=%" PRIx64 " "
                  "debug=%x imm=%x iflags=%x fsr=%" PRIx64 " "
                  "rbtr=%" PRIx64 "\n",
@@ -1868,7 +1868,11 @@ void mb_tcg_init(void)
                           offsetof(CPUMBState, regs[i]),
                           regnames[i]);
     }
-    for (i = 0; i < ARRAY_SIZE(cpu_SR); i++) {
+
+    cpu_SR[SR_PC] =
+        tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, pc), "rpc");
+
+    for (i = 1; i < ARRAY_SIZE(cpu_SR); i++) {
         cpu_SR[i] = tcg_global_mem_new_i64(cpu_env,
                           offsetof(CPUMBState, sregs[i]),
                           special_regnames[i]);
@@ -1878,5 +1882,5 @@ void mb_tcg_init(void)
 void restore_state_to_opc(CPUMBState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->sregs[SR_PC] = data[0];
+    env->pc = data[0];
 }
-- 
2.25.1


