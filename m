Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72936DFC0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:40:39 +0200 (CEST)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq34-0002XI-4D
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpxF-000646-H5
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwx-0004is-SH
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:37 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso9699289pjn.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98u88U7fkuo5HbNaAbqWqzoS298FvDgsPdHfpqhJggU=;
 b=tooRbEflV/SnoAwrPkX6H9oQ6XmY7jfXKDQSn4IW1yV2RpREdlNTLMX0PA0khfgKRU
 roR5wWGKdvaX2VFzKzNNGjTSe6J6m2NdSIJXqvhLFz3ScDjTMJLW+tFyiJmcAm8Rdadl
 Fq46G0EUwhPGxTupSoKCN8YcETih2CKhfhlRKX8zBb+mQbs2HU2tC0cQYwymwWef5u5d
 KmlxHHuUL76N0Fyru4Ey5/4/IYzY1nIqLtaGsy+rmEEyL8eol6Fj+L75X3jRh/y5+TME
 IbN99u9RK20W8LuHgv5HKS2iUttA8wY9pOs5l49x0sjwu0URmZjy+w9z9WxZohLl77DJ
 EG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98u88U7fkuo5HbNaAbqWqzoS298FvDgsPdHfpqhJggU=;
 b=AW0IYxBLFhSwp+Dvr4smWLX0t8fZqsiTg781PaJyRmYYgF4kTeRK990ENKc4ae0kTv
 kaABtAoamrHs9hCKRerlwRuB0LR9QgvQU2iIDacscAxsxxFkrHRU885rUefL/pTd1Czg
 vDCU9caPtTAIPZmhjk3MAR+iDestoXBw0OeO67o1QdZORF/D9wLUiZwTx1Z5xOM0rJgJ
 kwsqJH7AWIC/62GgSS+RS+/SzYodiuCIhX4K8nlAqN0I6EqDp2ntVYOeeQLP7HjBp2UZ
 rMCKR8OX/lKGsbZv4aEU1C70RbASnLLREV3IwV00KE3SnVOk6nfIWg/8hvg2ReGKtm4e
 iMtQ==
X-Gm-Message-State: AOAM533/1KiZX82s/Twl+J2bZvP5gWRS7/16o+X6quy8ysOk5VkL3Fg3
 JTnlBHiBusukfktQ29d9Nm1vxmRGdrd97A==
X-Google-Smtp-Source: ABdhPJzYXiX5d18FXiX1AT9YS7ZYwcLW0sfYUHF16mqjayvR3weVJvfA18TeGeSYn+a80cC8ChVYRg==
X-Received: by 2002:a17:90a:ad84:: with SMTP id
 s4mr5650212pjq.162.1619638458475; 
 Wed, 28 Apr 2021 12:34:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] linux-user/s390x: Clean up signal.c
Date: Wed, 28 Apr 2021 12:34:07 -0700
Message-Id: <20210428193408.233706-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Reorder the function bodies to correspond to the kernel source.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 67 ++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 839a7ae4b3..9d470e4ca0 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -133,6 +133,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     sigframe *frame;
     abi_ulong frame_addr;
+    abi_ulong restorer;
 
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     trace_user_setup_frame(env, frame_addr);
@@ -141,28 +142,39 @@ void setup_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
+    /* Set up backchain. */
+    __put_user(env->regs[15], (abi_ulong *) frame);
+
+    /* Create struct sigcontext on the signal stack. */
     /* Make sure that we're initializing all of oldmask. */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
-
-    save_sigregs(env, &frame->sregs);
-
     __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
 
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
+    /* Create _sigregs on the signal stack */
+    save_sigregs(env, &frame->sregs);
+
+    /*
+     * ??? The kernel uses regs->gprs[2] here, which is not yet the signo.
+     * Moreover the comment talks about allowing backtrace, which is really
+     * done by the r15 copy above.
+     */
+    __put_user(sig, &frame->signo);
+
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer;
+        restorer = ka->sa_restorer;
     } else {
-        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
+        restorer = frame_addr + offsetof(sigframe, retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    &frame->retcode);
     }
 
-    /* Set up backchain. */
-    __put_user(env->regs[15], (abi_ulong *) frame);
-
     /* Set up registers for signal handler */
+    env->regs[14] = restorer;
     env->regs[15] = frame_addr;
     /* Force default amode and default user address space control. */
     env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
@@ -180,8 +192,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[5] = 0; /* FIXME: regs->int_parm_long */
     env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
-    /* Place signal number on stack to allow backtrace from handler.  */
-    __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
 }
 
@@ -191,6 +201,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     rt_sigframe *frame;
     abi_ulong frame_addr;
+    abi_ulong restorer;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
@@ -199,29 +210,33 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
-    tswap_siginfo(&frame->info, info);
+    /* Set up backchain. */
+    __put_user(env->regs[15], (abi_ulong *) frame);
 
-    /* Create the ucontext.  */
-    __put_user(0, &frame->uc.tuc_flags);
-    __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
-    target_save_altstack(&frame->uc.tuc_stack, env);
-    save_sigregs(env, &frame->uc.tuc_mcontext);
-    tswap_sigset(&frame->uc.tuc_sigmask, set);
-
-    /* Set up to return from userspace.  If provided, use a stub
-       already in userspace.  */
+    /*
+     * Set up to return from userspace.
+     * If provided, use a stub already in userspace.
+     */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer;
+        restorer = ka->sa_restorer;
     } else {
-        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
+        restorer = frame_addr + offsetof(typeof(*frame), retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    &frame->retcode);
     }
 
-    /* Set up backchain. */
-    __put_user(env->regs[15], (abi_ulong *) frame);
+    /* Create siginfo on the signal stack. */
+    tswap_siginfo(&frame->info, info);
+
+    /* Create ucontext on the signal stack. */
+    __put_user(0, &frame->uc.tuc_flags);
+    __put_user(0, &frame->uc.tuc_link);
+    target_save_altstack(&frame->uc.tuc_stack, env);
+    save_sigregs(env, &frame->uc.tuc_mcontext);
+    tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up registers for signal handler */
+    env->regs[14] = restorer;
     env->regs[15] = frame_addr;
     /* Force default amode and default user address space control. */
     env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
-- 
2.25.1


