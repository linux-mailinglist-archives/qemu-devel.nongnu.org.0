Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4336D0EC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 05:36:04 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbazb-0002ru-Ms
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 23:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbaw1-00082Q-Sc
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbavz-00006f-Hr
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m11so1617432pfc.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iq2xxJ2kcU7wwoLubib7cAkUK4oynZtXYi/2qrC2n1c=;
 b=FCDXF6Ot2ieA+iNhYuQPRKRrvTER+4+UBOuIg72COEOb6A/2jIjTQ6D9RwsZJ6uko8
 ImOhzM6fDe+b2BT9J3n/T2CSkqITSURppHPMITIYyKwVJAZrWQP0N7pUoua2gV2zBY3t
 /9E7gkHuxSQswkHB/IFAJy0qVkAputTdHXtnQCHHeifhsPUYe5QFc3Gma5gbDcfFBmk4
 Y/K3hwQTfynqacC+z+UG3nJpkk0/Y/hAfXv7savewi0b0sg9bUq+595K3XRYUbxpdLzn
 SxA2LC+v4D8DUDgqGkF4fMU+6u7M6/rSk1feRo0eRkQZ8dKtbHzL1bd7A0Iqvx5F3Yu/
 VVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq2xxJ2kcU7wwoLubib7cAkUK4oynZtXYi/2qrC2n1c=;
 b=LV7sSnd4sbwU+k5oBiA97ytuI8q6wqfRYvbwsdUYX+shun4ZPfaeI+CYrdm+0cb5j6
 4xwk0QwESEiR3YL88gTTgwBa/zpQcPA09wE7j5d6zl4pmahMqhX36FDtQhf8VsAEmpWW
 7pMjlSk5odKCo4PxAMkzgk6pmOoti4z+tNNBvH5vKI5csCoDuGoxSL//08/8s1FVRZe+
 HSDiBp1e4SOSc/U+inRxR/TCTKPbnSs0kec8xabjg80TGg+iBnk1EOwnlpnLnbXlQZaf
 /dvCcZROnbFZiHAzNk7FFgZEPT/8c0KUhldhVXd0G9oSlSDeY1ddfL+oYQWl9TPsWZcT
 Oamw==
X-Gm-Message-State: AOAM533x9fJObUl9rrMJyeEwmnSKQHv5WlDR2s9qVN07+axlHoBpUTuK
 AXVVc9ynVJkhKEkGp9Jus0ky696GEN96vQ==
X-Google-Smtp-Source: ABdhPJw6Vw8Tba5BXfaLDYOLWSi20weo0hL3MQsJHrWSfkLgTKrhrhf13jIONZ9biymmkNfDnhUpNQ==
X-Received: by 2002:aa7:82ce:0:b029:242:deb4:9442 with SMTP id
 f14-20020aa782ce0000b0290242deb49442mr26444715pfn.73.1619580738051; 
 Tue, 27 Apr 2021 20:32:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 18sm3572335pji.30.2021.04.27.20.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:32:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user/s390x: Clean up signal.c
Date: Tue, 27 Apr 2021 20:32:03 -0700
Message-Id: <20210428033204.133471-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428033204.133471-1-richard.henderson@linaro.org>
References: <20210428033204.133471-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "save" routines from the kernel, which are currently
commented out, are unnecessary in qemu.  We can copy from
env where the kernel needs special instructions.

Drop the return value from restore_sigregs, as it cannot fail.
Use __get_user return as input to trace, so that we properly
bswap the value for the host.

Reorder the function bodies to correspond to the kernel source.
Fix the use of host addresses where guest addresses are needed.
Drop the use of PSW_ADDR_AMODE, since we only support 64-bit.
Set psw.mask properly for the signal handler.
Use tswap_sigset in setup_rt_frame.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 184 ++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 95 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index e5bc4f0358..fb7065f243 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -32,7 +32,6 @@
 #define _SIGCONTEXT_NSIG_BPW    64 /* FIXME: 31-bit mode -> 32 */
 #define _SIGCONTEXT_NSIG_WORDS  (_SIGCONTEXT_NSIG / _SIGCONTEXT_NSIG_BPW)
 #define _SIGMASK_COPY_SIZE    (sizeof(unsigned long)*_SIGCONTEXT_NSIG_WORDS)
-#define PSW_ADDR_AMODE            0x0000000000000000UL /* 0x80000000UL for 31-bit */
 #define S390_SYSCALL_OPCODE ((uint16_t)0x0a00)
 
 typedef struct {
@@ -106,23 +105,25 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
     int i;
-    //save_access_regs(current->thread.acrs); FIXME
 
-    /* Copy a 'clean' PSW mask to the user to avoid leaking
-       information about whether PER is currently on.  */
+    /*
+     * Copy a 'clean' PSW mask to the user to avoid leaking
+     * information about whether PER is currently on.
+     */
     __put_user(env->psw.mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
+
     for (i = 0; i < 16; i++) {
         __put_user(env->regs[i], &sregs->regs.gprs[i]);
     }
     for (i = 0; i < 16; i++) {
         __put_user(env->aregs[i], &sregs->regs.acrs[i]);
     }
+
     /*
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
-    //save_fp_regs(&current->thread.fp_regs); FIXME
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
@@ -137,120 +138,124 @@ void setup_frame(int sig, struct target_sigaction *ka,
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
-    }
-
-    __put_user(set->sig[0], &frame->sc.oldmask[0]);
-
-    save_sigregs(env, &frame->sregs);
-
-    __put_user((abi_ulong)(unsigned long)&frame->sregs,
-               (abi_ulong *)&frame->sc.sregs);
-
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
-    if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long)
-                ka->sa_restorer | PSW_ADDR_AMODE;
-    } else {
-        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
-                        | PSW_ADDR_AMODE;
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   (uint16_t *)(frame->retcode));
+        force_sigsegv(sig);
+        return;
     }
 
     /* Set up backchain. */
     __put_user(env->regs[15], (abi_ulong *) frame);
 
+    /* Create struct sigcontext on the signal stack. */
+    for (int i = 0; i < ARRAY_SIZE(frame->sc.oldmask); ++i) {
+        __put_user(set->sig[i], &frame->sc.oldmask[i]);
+    }
+
+    save_sigregs(env, &frame->sregs);
+    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
+
+    /* Place signal number on stack to allow backtrace from handler.  */
+    __put_user(sig, &frame->signo);
+
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
+    if (ka->sa_flags & TARGET_SA_RESTORER) {
+        env->regs[14] = ka->sa_restorer;
+    } else {
+        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
+        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
+                   (uint16_t *)(frame->retcode));
+    }
+
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
 
-    /* We forgot to include these in the sigcontext.
-       To avoid breaking binary compatibility, they are passed as args. */
-    env->regs[4] = 0; // FIXME: no clue... current->thread.trap_no;
-    env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
+    /*
+     * We forgot to include these in the sigcontext.
+     * To avoid breaking binary compatibility, they are passed as args.
+     */
+    env->regs[4] = 0; /* FIXME: regs->int_code & 127 */
+    env->regs[5] = 0; /* FIXME: regs->int_parm_long */
+    env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
-    /* Place signal number on stack to allow backtrace from handler.  */
-    __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUS390XState *env)
 {
-    int i;
     rt_sigframe *frame;
     abi_ulong frame_addr;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
-    }
-
-    tswap_siginfo(&frame->info, info);
-
-    /* Create the ucontext.  */
-    __put_user(0, &frame->uc.tuc_flags);
-    __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
-    target_save_altstack(&frame->uc.tuc_stack, env);
-    save_sigregs(env, &frame->uc.tuc_mcontext);
-    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
-    if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
-    } else {
-        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
-                        | PSW_ADDR_AMODE;
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   (uint16_t *)(frame->retcode));
+        force_sigsegv(sig);
+        return;
     }
 
     /* Set up backchain. */
     __put_user(env->regs[15], (abi_ulong *) frame);
 
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
+    if (ka->sa_flags & TARGET_SA_RESTORER) {
+        env->regs[14] = ka->sa_restorer;
+    } else {
+        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
+        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
+                   (uint16_t *)(frame->retcode));
+    }
+
+    /* Create siginfo on the signal stack. */
+    tswap_siginfo(&frame->info, info);
+
+    /* Create the ucontext.  */
+    __put_user(0, &frame->uc.tuc_flags);
+    __put_user(0, &frame->uc.tuc_link);
+    target_save_altstack(&frame->uc.tuc_stack, env);
+    save_sigregs(env, &frame->uc.tuc_mcontext);
+    tswap_sigset(&frame->uc.tuc_sigmask, set);
+
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
 
-    env->regs[2] = sig; //map_signal(sig);
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
+    env->psw.addr = ka->_sa_handler;
+
+    env->regs[2] = sig;
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
+    env->regs[5] = 0; /* FIXME: current->thread.last_break */
 }
 
-static int
-restore_sigregs(CPUS390XState *env, target_sigregs *sc)
+static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
-    int err = 0;
+    target_ulong prev_addr;
     int i;
 
     for (i = 0; i < 16; i++) {
         __get_user(env->regs[i], &sc->regs.gprs[i]);
     }
 
+    prev_addr = env->psw.addr;
     __get_user(env->psw.mask, &sc->regs.psw.mask);
-    trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
-                                     (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
-    /* FIXME: 31-bit -> | PSW_ADDR_AMODE */
+    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
@@ -258,8 +263,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     for (i = 0; i < 16; i++) {
         __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
     }
-
-    return err;
 }
 
 long do_sigreturn(CPUS390XState *env)
@@ -271,23 +274,21 @@ long do_sigreturn(CPUS390XState *env)
 
     trace_user_do_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
-    __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
+    QEMU_BUILD_BUG_ON(sizeof(target_set) != sizeof(frame->sc.oldmask));
+    for (int i = 0; i < ARRAY_SIZE(frame->sc.oldmask); ++i) {
+        __get_user(target_set.sig[i], &frame->sc.oldmask[i]);
+    }
     target_to_host_sigset_internal(&set, &target_set);
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->sregs)) {
-        goto badframe;
-    }
+    restore_sigregs(env, &frame->sregs);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUS390XState *env)
@@ -298,23 +299,16 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     trace_user_do_rt_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
-    target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
 
+    target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
-
     target_restore_altstack(&frame->uc.tuc_stack, env);
+    restore_sigregs(env, &frame->uc.tuc_mcontext);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
-- 
2.25.1


