Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB9336A836
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:03:35 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahEN-0004ER-0i
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8x-0007s9-8m
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:59 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:47015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8r-0003AF-EO
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:59 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 31so6562661pgn.13
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I/QSpFJojVKD9zlGg6U9x9sUX8bwKBgn7ApEGuKeRY8=;
 b=FTPqJv8vRnySxsYyn4LMKtD/S53jeay05YLnEBHoC22yoTBwZ2nrWdNpcrffT+diOo
 676unh6QwP+qo9VsmxIWibZ++7tnj/no4tDWDrAjfFUL6cjSRttk5mQQ/hsW1m1Zq9Pa
 xmvZjddG4NE55YWyCHkDj97zmDGgy/rl6CDLchHcVVlEhLMbVCryYpaKXJNEFh0lCcjh
 rm1XhdiZPYaNtt8tkl7TEVW/BqT9PrSHjoyoIRnj2HSohj9r7zVgDRuc9yaZa87RGuxD
 hqB38WZuQz6+8PB5X2F5+Mz3WxBeV/jamto/uVbmntORpcdUNVVtuKtg+iEL+YkG2SSQ
 C13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/QSpFJojVKD9zlGg6U9x9sUX8bwKBgn7ApEGuKeRY8=;
 b=huAO3yX2SwoWMxi7Pz1W1kB576BBOwrkKCavL0mmldqZ5GEirEdoPGNNZUGqTLXDAd
 wDY58f9Dg8wy1RLHAq+6q7UAMY/lxEqU0tbwYOZf4aItmwLDoR98tPVFi11gxRoMAE9w
 Hetn0tSIXST+ewedSpt9wxe4oJRAj0CiI9dalRDAUBctR+jtTjAaUwobxNzFpstoCy/Z
 CwoslMJRljNsMaNiTLtWLn98Sls94CNZNV17BlWoMdmx0MsCUwDJyUpcKaG9dEQM4ueS
 +7HI/8AMY+QoIypXvy2uV8f/4MdhxYRpQkhgUiVrcwyc05hvqEiF0ireabLLl7dbqBwK
 9kxw==
X-Gm-Message-State: AOAM533BZnRwK+MVrowG2fkM2sYNFRAnoYovT8Wrc718F83ArVCVxeiS
 G5ajmuSkNYaANRDv9UGiVg3rtERNzl5r7Q==
X-Google-Smtp-Source: ABdhPJws4J9u6qQDDa6LCD++F8le4dKqlmmYF2rH0ThGLcei7dOqZgMKMbYWBa6KRoAWj5pP8v0NmQ==
X-Received: by 2002:a62:7d07:0:b029:21b:d1bc:f6c8 with SMTP id
 y7-20020a627d070000b029021bd1bcf6c8mr13604322pfc.45.1619366272051; 
 Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] linux-user: Use target_restore_altstack in all sigreturn
Date: Sun, 25 Apr 2021 08:57:43 -0700
Message-Id: <20210425155749.896330-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Note that target_restore_altstack uses the host memory
pointer that we have already verified, so TARGET_EFAULT
is not a possible return value.

Note that using -EFAULT was a bug.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c    | 6 +-----
 linux-user/alpha/signal.c      | 6 +-----
 linux-user/arm/signal.c        | 9 ++-------
 linux-user/hexagon/signal.c    | 6 +-----
 linux-user/hppa/signal.c       | 8 +-------
 linux-user/i386/signal.c       | 5 +----
 linux-user/m68k/signal.c       | 5 +----
 linux-user/microblaze/signal.c | 6 +-----
 linux-user/mips/signal.c       | 6 +-----
 linux-user/nios2/signal.c      | 8 +-------
 linux-user/openrisc/signal.c   | 5 +----
 linux-user/ppc/signal.c        | 4 +---
 linux-user/riscv/signal.c      | 6 +-----
 linux-user/s390x/signal.c      | 6 ++----
 linux-user/sh4/signal.c        | 7 +------
 linux-user/xtensa/signal.c     | 6 +-----
 16 files changed, 18 insertions(+), 81 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index b591790c22..2a1b7dbcdc 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -561,11 +561,7 @@ long do_rt_sigreturn(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr +
-            offsetof(struct target_rt_sigframe, uc.tuc_stack),
-            0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 3aa4b339a4..011da0a53b 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -257,11 +257,7 @@ long do_rt_sigreturn(CPUAlphaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-                                             uc.tuc_stack),
-                       0, env->ir[IR_SP]) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, env->ir[IR_SP]);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index f21d1535e4..b7a772302f 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -685,11 +685,7 @@ static int do_sigframe_return_v2(CPUARMState *env,
         }
     }
 
-    if (do_sigaltstack(context_addr
-                       + offsetof(struct target_ucontext_v2, tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT) {
-        return 1;
-    }
+    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
@@ -773,8 +769,7 @@ static long do_rt_sigreturn_v1(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(struct rt_sigframe_v1, uc.tuc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
 #if 0
     /* Send SIGTRAP if we're single-stepping */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index fde8dc93b7..3854eb4709 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -260,11 +260,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-            uc.uc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index d1a58feeb3..578874cf27 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -187,13 +187,7 @@ long do_rt_sigreturn(CPUArchState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    unlock_user_struct(frame, frame_addr, 0);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-                                             uc.tuc_stack),
-                       0, env->gr[30]) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, env->gr[30]);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 9320e1d472..3a0a1546a6 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -581,10 +581,7 @@ long do_rt_sigreturn(CPUX86State *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(struct rt_sigframe, uc.tuc_stack), 0,
-                       get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 49ff87c77b..004b59fb61 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -400,10 +400,7 @@ long do_rt_sigreturn(CPUM68KState *env)
     if (target_rt_restore_ucontext(env, &frame->uc))
         goto badframe;
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index cf0707b556..f59a1faf47 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -209,11 +209,7 @@ long do_rt_sigreturn(CPUMBState *env)
 
     restore_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 455a8a229a..456fa64f41 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -368,11 +368,7 @@ long do_rt_sigreturn(CPUMIPSState *env)
     set_sigmask(&blocked);
 
     restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
-
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, rs_uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -EFAULT)
-        goto badframe;
+    target_restore_altstack(&frame->rs_uc.tuc_stack, get_sp_from_cpustate(env));
 
     env->active_tc.PC = env->CP0_EPC;
     mips_set_hflags_isa_mode_from_pc(env);
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 7d535065ed..751ea88811 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -82,9 +82,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
                                int *pr2)
 {
     int temp;
-    abi_ulong off, frame_addr = env->regs[R_SP];
     unsigned long *gregs = uc->tuc_mcontext.gregs;
-    int err;
 
     /* Always make any pending restarted system calls return -EINTR */
     /* current->restart_block.fn = do_no_restart_syscall; */
@@ -130,11 +128,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
 
-    off = offsetof(struct target_rt_sigframe, uc.tuc_stack);
-    err = do_sigaltstack(frame_addr + off, 0, get_sp_from_cpustate(env));
-    if (err == -EFAULT) {
-        return 1;
-    }
+    target_restore_altstack(&uc->tuc_stack, get_sp_from_cpustate(env));
 
     *pr2 = env->regs[2];
     return 0;
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 232ad82b98..86f94d7f76 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -158,10 +158,7 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, &frame->uc.tuc_mcontext);
-    if (do_sigaltstack(frame_addr + offsetof(target_rt_sigframe, uc.tuc_stack),
-                       0, frame_addr) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, frame_addr);
 
     unlock_user_struct(frame, frame_addr, 0);
     return cpu_get_gpr(env, 11);
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index b78613f7c8..79f265f82e 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -656,9 +656,7 @@ long do_rt_sigreturn(CPUPPCState *env)
     if (do_setcontext(&rt_sf->uc, env, 1))
         goto sigsegv;
 
-    do_sigaltstack(rt_sf_addr
-                   + offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                   0, env->gpr[1]);
+    target_restore_altstack(&rt_sf->uc.tuc_stack, env->gpr[1]);
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 67a95dbc7b..81d1129da3 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -192,11 +192,7 @@ long do_rt_sigreturn(CPURISCVState *env)
     }
 
     restore_ucontext(env, &frame->uc);
-
-    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
-            uc.uc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.uc_stack, get_sp_from_cpustate(env));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 7107c5fb53..73806f5472 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -307,10 +307,8 @@ long do_rt_sigreturn(CPUS390XState *env)
         goto badframe;
     }
 
-    if (do_sigaltstack(frame_addr + offsetof(rt_sigframe, uc.tuc_stack), 0,
-                       get_sp_from_cpustate(env)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
+
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 29c1ee30e6..684f18da58 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -323,12 +323,7 @@ long do_rt_sigreturn(CPUSH4State *regs)
     set_sigmask(&blocked);
 
     restore_sigcontext(regs, &frame->uc.tuc_mcontext);
-
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(regs)) == -EFAULT) {
-        goto badframe;
-    }
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(regs));
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 590f0313ff..22ec6cdeb9 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -253,12 +253,8 @@ long do_rt_sigreturn(CPUXtensaState *env)
     set_sigmask(&set);
 
     restore_sigcontext(env, frame);
+    target_restore_altstack(&frame->uc.tuc_stack, get_sp_from_cpustate(env));
 
-    if (do_sigaltstack(frame_addr +
-                       offsetof(struct target_rt_sigframe, uc.tuc_stack),
-                       0, get_sp_from_cpustate(env)) == -TARGET_EFAULT) {
-        goto badframe;
-    }
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
-- 
2.25.1


