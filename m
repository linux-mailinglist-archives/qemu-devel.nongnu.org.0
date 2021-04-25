Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7136A847
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:10:02 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahKb-0002qL-O2
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8y-0007vN-Q4
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8s-0003Ak-No
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso3882730pjn.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/U/fXqVt3lh/pIHwlJV9yBNaNzKgC/XqrDdH1ymUOvA=;
 b=x3DpYWSFJr4hFwUQpecPe/5b9OGjwr0dzfn5nx5z1MmmxtJBND1FfTl0hEHeJhO5GA
 QC4Te0znF0FDxumd8st4N516bHmQcWHvX23+U+pMMb/gUgdvqJ2fetupGU3jX2iPCocl
 vZOm7sgfTSvbXySg6dcCQ9JHUSnc2+RE+PUMDwwpNTi8/mPuKIfd+onuJ9QC/Eds8OPT
 RadZSp7vlZCPBBQtenXMvLtTc1XBp93QmvofdyOKC8os3AmlpTix+XHSLzdxu8cb/K3b
 nMnOlrJlWfWkfXbqPiyw3jwC9hNbnz+i019urWfWPAgOxY//P3vtKi48YqB7H/pe+TKI
 JHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/U/fXqVt3lh/pIHwlJV9yBNaNzKgC/XqrDdH1ymUOvA=;
 b=XzN+D/npekGgSpFxcjaXW/UT/2zTzIj+dXRVvS15TKZRKNFU5S/GmvrHwVqxoyh1xn
 GzgR3X+uMbGp7mRkYcsdBvzJ9qHcAKTj8y75GJZZVLtGl0rd7rLzanGWpr1zjKaiSTMB
 igQirLeUCpddbLCAcDTwLyIQdL3QF+qHu6Ri6OwEF8dtg+9R7s+K//xROssbM7tcttIc
 /5IqIG7v/vr8qKrMlZJgNttdvoQCD0fYMrXLwt20XameJBj0XVY2NvW89j5Bc8oR0+2J
 GSQbckJr9qbuVro64+aupjP7F5aS085lj+0/f+6H/Nj2Q0Q/oLCzcMfCQCU7ZRyByaiz
 63nQ==
X-Gm-Message-State: AOAM532BspVcqN/stJFuYLLsXWmJHU3jzRk38qdwpUN5G4+vQk4zKXx+
 /dwnmDrapKJiRweK79IifQzNNVl2thMkcw==
X-Google-Smtp-Source: ABdhPJy8GlNdY8TJbqTPG8hgHX9yuE8jz8iBUL6fvu540fJtMzzdmmxy1rkzSWOc3kme3IHCf6fyTA==
X-Received: by 2002:a17:902:b601:b029:eb:1207:86ec with SMTP id
 b1-20020a170902b601b02900eb120786ecmr14128011pls.3.1619366273262; 
 Sun, 25 Apr 2021 08:57:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] linux-user: Pass CPUArchState to target_restore_altstack
Date: Sun, 25 Apr 2021 08:57:45 -0700
Message-Id: <20210425155749.896330-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In most cases we were already passing get_sp_from_cpustate
directly to the function.  In other cases, we were passing
a local variable which already contained the same value.
In the rest of the cases, we were passing the stack pointer
out of env directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal-common.h     | 2 +-
 linux-user/aarch64/signal.c    | 2 +-
 linux-user/alpha/signal.c      | 2 +-
 linux-user/arm/signal.c        | 4 ++--
 linux-user/hexagon/signal.c    | 2 +-
 linux-user/hppa/signal.c       | 2 +-
 linux-user/i386/signal.c       | 2 +-
 linux-user/m68k/signal.c       | 2 +-
 linux-user/microblaze/signal.c | 2 +-
 linux-user/mips/signal.c       | 2 +-
 linux-user/nios2/signal.c      | 2 +-
 linux-user/openrisc/signal.c   | 2 +-
 linux-user/ppc/signal.c        | 2 +-
 linux-user/riscv/signal.c      | 2 +-
 linux-user/s390x/signal.c      | 2 +-
 linux-user/sh4/signal.c        | 2 +-
 linux-user/signal.c            | 6 +++---
 linux-user/xtensa/signal.c     | 2 +-
 18 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 34b963af9a..ea86328b28 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -24,7 +24,7 @@ int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
 void target_save_altstack(target_stack_t *uss, CPUArchState *env);
-abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp);
+abi_long target_restore_altstack(target_stack_t *uss, CPUArchState *env);
 
 static inline void target_sigemptyset(target_sigset_t *set)
 {
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 2a1b7dbcdc..662bcd1c4e 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -561,7 +561,7 @@ long do_rt_sigreturn(CPUARMState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 011da0a53b..1129ffeea1 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -257,7 +257,7 @@ long do_rt_sigreturn(CPUAlphaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, env->ir[IR_SP]);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index b7a772302f..32b68ee302 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -685,7 +685,7 @@ static int do_sigframe_return_v2(CPUARMState *env,
         }
     }
 
-    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&uc->tuc_stack, env);
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
@@ -769,7 +769,7 @@ static long do_rt_sigreturn_v1(CPUARMState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 3854eb4709..85eab5e943 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -260,7 +260,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 578874cf27..0e266f472d 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -187,7 +187,7 @@ long do_rt_sigreturn(CPUArchState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, env->gr[30]);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 3a0a1546a6..8701774e37 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -581,7 +581,7 @@ long do_rt_sigreturn(CPUX86State *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 004b59fb61..d06230655e 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -400,7 +400,7 @@ long do_rt_sigreturn(CPUM68KState *env)
     if (target_rt_restore_ucontext(env, &frame->uc))
         goto badframe;
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index f59a1faf47..4c483bd8c6 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -209,7 +209,7 @@ long do_rt_sigreturn(CPUMBState *env)
 
     restore_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 456fa64f41..e6be807a81 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -368,7 +368,7 @@ long do_rt_sigreturn(CPUMIPSState *env)
     set_sigmask(&blocked);
 
     restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
-    target_restore_altstack(&frame->rs_uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->rs_uc.tuc_stack, env);
 
     env->active_tc.PC = env->CP0_EPC;
     mips_set_hflags_isa_mode_from_pc(env);
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 751ea88811..cc3872f11d 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -128,7 +128,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
 
-    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&uc->tuc_stack, env);
 
     *pr2 = env->regs[2];
     return 0;
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 86f94d7f76..5c5640a284 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -158,7 +158,7 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, frame_addr);
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return cpu_get_gpr(env, 11);
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 79f265f82e..8e1e642807 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -656,7 +656,7 @@ long do_rt_sigreturn(CPUPPCState *env)
     if (do_setcontext(&rt_sf->uc, env, 1))
         goto sigsegv;
 
-    target_restore_altstack(&rt_sf->uc.tuc_stack, env->gpr[1]);
+    target_restore_altstack(&rt_sf->uc.tuc_stack, env);
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 81d1129da3..9405c7fd9a 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -192,7 +192,7 @@ long do_rt_sigreturn(CPURISCVState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.uc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 73806f5472..b68b44ae7e 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -307,7 +307,7 @@ long do_rt_sigreturn(CPUS390XState *env)
         goto badframe;
     }
 
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 684f18da58..0451e65806 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -323,7 +323,7 @@ long do_rt_sigreturn(CPUSH4State *regs)
     set_sigmask(&blocked);
 
     restore_sigcontext(regs, &frame->uc.tuc_mcontext);
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(regs));
+    target_restore_altstack(&frame->uc.tuc_stack, regs);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 83891f7c47..9016896dcd 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -297,7 +297,7 @@ void target_save_altstack(target_stack_t *uss, CPUArchState *env)
     __put_user(ts->sigaltstack_used.ss_size, &uss->ss_size);
 }
 
-abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
+abi_long target_restore_altstack(target_stack_t *uss, CPUArchState *env)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
     size_t minstacksize = TARGET_MINSIGSTKSZ;
@@ -315,7 +315,7 @@ abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
     __get_user(ss.ss_size, &uss->ss_size);
     __get_user(ss.ss_flags, &uss->ss_flags);
 
-    if (on_sig_stack(sp)) {
+    if (on_sig_stack(get_sp_from_cpustate(env))) {
         return -TARGET_EPERM;
     }
 
@@ -820,7 +820,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        ret = target_restore_altstack(uss, get_sp_from_cpustate(env));
+        ret = target_restore_altstack(uss, env);
         if (ret) {
             goto out;
         }
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 22ec6cdeb9..72771e1294 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -253,7 +253,7 @@ long do_rt_sigreturn(CPUXtensaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, frame);
-    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+    target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.25.1


