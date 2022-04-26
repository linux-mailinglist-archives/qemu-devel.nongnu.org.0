Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65A5108F7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:28:01 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQqu-0007NR-HB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq7-0001z0-7D
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:07 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq5-0005XG-BV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:06 -0400
Received: by mail-pg1-x535.google.com with SMTP id t13so16729734pgn.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yl/OU+S3BuL9gmKdF4oRGlZZLlU0MEz8InOzJS1D9S0=;
 b=IsmpfebIxpBr0Gj4Cv+gfa2ct/Itja5rMPrWyGRr2KlJdTZL7cvhrIWTi3zZPDAwl5
 Lz5Ig7ZLb5sIKsQplETgzB1cxeCvTpmS/3fCVz5IsgTJdxlO14S+jVCIbRWYAxxBd8aV
 4/BxdVcFRP+an9V2lG3cIc3PymcNyTHqYDngDgzdG6DOSXeTvPAMg+SUm3BTxwUF/hZh
 fLvUPI8CmpCq48XpECZt6SEKwmCpJSmOta1/n0d5a5csLiT4j3rkXfaDmbKi2pxhC6Dy
 EXPNcad8L9oBKOF3rw6lDllSs14x2jzgd4wJxxZO1X+Byx33OJBgdzalmJTPib0JqGd5
 rYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yl/OU+S3BuL9gmKdF4oRGlZZLlU0MEz8InOzJS1D9S0=;
 b=RpNx5bMW+8d+5Fk3hZKzEjOW5j0SopvYRs6ZE7cA6MjbaVhi9dwsQvhf36GniMcWU9
 TVa9YiRrZWIxv+udC6sT9grcPDYLq9nDghT3ZGuFYIM/Lrwz/803VkcowKOKJg3YLTWs
 soDItrD8zfNKj45O0oGmir/cv9Zbuseu9ixgnKtHoTngGnYvsA437fP+Ks5u54AEcsJ0
 gOj11/5/pG6uHEWuB+fB80CERzysIltOlwTY79lYd3iLkL2lEc7WW3Vv4VZG59pMuJH2
 ILOug8ujP3WSxT/NaMa7szrEa2W/YSlIDv/eTCjWhbUX4bjIFKeqVf4+Njti122awhD6
 Fiig==
X-Gm-Message-State: AOAM531fLm83ddov/OUk2juHjz/VchCq34YWOqTxldkhXqWpSyFiCFfS
 fLCAMbwF6iuRk3C9RTUqVK7WwkjY06pAsw==
X-Google-Smtp-Source: ABdhPJzxA2ZfbiA8gsBFI19vG2C4jQgSEbbvScmCtYH+i3bcZWopdHtQqqimKlGlElZaiwQ7Jvjotg==
X-Received: by 2002:a05:6a00:851:b0:50d:62f6:5494 with SMTP id
 q17-20020a056a00085100b0050d62f65494mr3045836pfk.75.1650997384043; 
 Tue, 26 Apr 2022 11:23:04 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 61/68] target/nios2: Advance pc when raising exceptions
Date: Tue, 26 Apr 2022 11:19:00 -0700
Message-Id: <20220426181907.103691-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

The exception return address for nios2 is the instruction
after the one that was executing at the time of the exception.

We have so far implemented this by advancing the pc during the
process of raising the exception.  It is perhaps a little less
confusing to do this advance in the translator (and helpers)
when raising the exception in the first place, so that we may
more closely match kernel sources.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-58-richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  2 ++
 linux-user/nios2/cpu_loop.c |  8 ++------
 target/nios2/helper.c       | 13 +++++++------
 target/nios2/op_helper.c    | 18 ++++++++++++++++--
 target/nios2/translate.c    |  6 +++---
 5 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 5474b1c404..f85581ee56 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -266,6 +266,8 @@ hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                               MMUAccessType access_type, int mmu_idx,
                                               uintptr_t retaddr);
+G_NORETURN void nios2_cpu_loop_exit_advance(CPUNios2State *env,
+                                            uintptr_t retaddr);
 
 void do_nios2_semihosting(CPUNios2State *env);
 
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 30a27f252b..a5e86990e2 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -39,6 +39,8 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_DIV:
+            /* Match kernel's handle_diverror_c(). */
+            env->pc -= 4;
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
 
@@ -49,12 +51,6 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_TRAP:
-            /*
-             * TODO: This advance should be done in the translator, as
-             * hardware produces an advanced pc as part of all exceptions.
-             */
-            env->pc += 4;
-
             switch (env->error_code) {
             case 0:
                 qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e256d1528e..bb3b09e5a7 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -49,7 +49,7 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
             cr_es = CR_BSTATUS;
         }
         env->ctrl[cr_es] = old_status;
-        env->regs[r_ea] = env->pc + 4;
+        env->regs[r_ea] = env->pc;
 
         if (cpu->mmu_present) {
             new_status |= CR_STATUS_EH;
@@ -113,7 +113,7 @@ static void do_eic_irq(Nios2CPU *cpu)
             }
             env->shadow_regs[new_rs][R_SSTATUS] = old_status;
         }
-        env->shadow_regs[new_rs][R_EA] = env->pc + 4;
+        env->shadow_regs[new_rs][R_EA] = env->pc;
     }
 
     env->ctrl[CR_STATUS] = new_status;
@@ -187,6 +187,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
+        /* Note that PC is advanced for interrupts as well. */
+        env->pc += 4;
         if (cpu->eic_present) {
             do_eic_irq(cpu);
         } else {
@@ -249,7 +251,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         break;
 
     case EXCP_SEMIHOST:
-        env->pc += 4;
         do_nios2_semihosting(env);
         break;
 
@@ -291,7 +292,7 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     env->ctrl[CR_BADADDR] = addr;
     cs->exception_index = EXCP_UNALIGN;
-    cpu_loop_exit_restore(cs, retaddr);
+    nios2_cpu_loop_exit_advance(env, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -330,7 +331,7 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             cs->exception_index = (access_type == MMU_INST_FETCH
                                    ? EXCP_SUPERA_X : EXCP_SUPERA_D);
             env->ctrl[CR_BADADDR] = address;
-            cpu_loop_exit_restore(cs, retaddr);
+            nios2_cpu_loop_exit_advance(env, retaddr);
         }
     }
 
@@ -367,5 +368,5 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     cs->exception_index = excp;
     env->ctrl[CR_BADADDR] = address;
-    cpu_loop_exit_restore(cs, retaddr);
+    nios2_cpu_loop_exit_advance(env, retaddr);
 }
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 94040102f4..2e30d0a908 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -31,6 +31,20 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cpu_loop_exit(cs);
 }
 
+void nios2_cpu_loop_exit_advance(CPUNios2State *env, uintptr_t retaddr)
+{
+    CPUState *cs = env_cpu(env);
+
+    /*
+     * Note that PC is advanced for all hardware exceptions.
+     * Do this here, rather than in restore_state_to_opc(),
+     * lest we affect QEMU internal exceptions, like EXCP_DEBUG.
+     */
+    cpu_restore_state(cs, retaddr, true);
+    env->pc += 4;
+    cpu_loop_exit(cs);
+}
+
 static void maybe_raise_div(CPUNios2State *env, uintptr_t ra)
 {
     Nios2CPU *cpu = env_archcpu(env);
@@ -38,7 +52,7 @@ static void maybe_raise_div(CPUNios2State *env, uintptr_t ra)
 
     if (cpu->diverr_present) {
         cs->exception_index = EXCP_DIV;
-        cpu_loop_exit_restore(cs, ra);
+        nios2_cpu_loop_exit_advance(env, ra);
     }
 }
 
@@ -69,7 +83,7 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     if (unlikely(new_pc & 3)) {
         env->ctrl[CR_BADADDR] = new_pc;
         cs->exception_index = EXCP_UNALIGND;
-        cpu_loop_exit_restore(cs, GETPC());
+        nios2_cpu_loop_exit_advance(env, GETPC());
     }
 
     /*
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index b52f98180d..3a037a68cc 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -202,10 +202,10 @@ static TCGv dest_gpr(DisasContext *dc, unsigned reg)
 #endif
 }
 
-static void t_gen_helper_raise_exception(DisasContext *dc,
-                                         uint32_t index)
+static void t_gen_helper_raise_exception(DisasContext *dc, uint32_t index)
 {
-    tcg_gen_movi_tl(cpu_pc, dc->pc);
+    /* Note that PC is advanced for all hardware exceptions. */
+    tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.34.1


