Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259B41F152
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:36:32 +0200 (CEST)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKaN-0000M6-1t
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXt-0006MM-WC
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:58 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:33752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXr-0007gx-8d
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:57 -0400
Received: by mail-qt1-x833.google.com with SMTP id x9so9371250qtv.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rbJQ1EEbZk0qe1nOE3Vk16NPZokQglkfGktmCQn6pKM=;
 b=tiDuFxBeJ8Y6l2XoL46Aw0KK3bziDZIBnwpCSNOzN1CVg2jzenHx+v0o45/JEdT04s
 Ql2hPPV5ICNSXUsgqHbMdlOEnmVMoNowctJmlaWVf/P7JaJHvrSZl+7q16gT7I4uv/SH
 bQ+D2291EUXvv/i58mIXjPrDGiq5O05KxwDcOE5cWs3U50jW9q8NPhQmXSSZilbC6d80
 WjgfjeS7oD0qXYitmMPJUTKmhMGLd/fGtGov2AoaOpDWdddNM7YhQHKJx4CLvilIvExJ
 /bgLAJzyf/Byhf9g7wlVOr+WKjv8PhGgKr25vG1uTtxucH+99CmfJvx+k40nTnzbWkNc
 0yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbJQ1EEbZk0qe1nOE3Vk16NPZokQglkfGktmCQn6pKM=;
 b=vl332tJx8C0oFGHqdgD1A418wVdJ6uGLWg1vVMv2NJDUbY03r0JNb4sg3CZqAw5f7K
 6goASYHlqSNMHZVuR/8V60/iBpepV6CWevwCzcsgJGTcAG094fk8aoN55jKO0umwJu3+
 YgJzNeU+dWEbuEFCRDy9DeaxcASN6t8hU70a2DrvyGb6iUQJt//jGjjaa8moB07pRHAV
 mq62yu/ReRpaJdP8zwhleZr3KkFRsgVbBTB8DX6MPAfHZ4CAyKxWemkAjvQ71o45BBag
 iHdTrjPQ1CH0DqLgm+ryeXebXNKifxrXxoYalh40AqW88HRMinOYqrJz5X01gnS6Ts2m
 k0nw==
X-Gm-Message-State: AOAM531bm9DCHkjUWPRIckmMffzetQtiwzjAU7aU8ApMaljTjJmdZzzR
 cR4OXGsZi0Xi1zJ2z3FJL06wP70nG4Y1hw==
X-Google-Smtp-Source: ABdhPJzypsJlOYFJgRjpY+HFaFj6bnuVXm0o9dE5FGwqpLL4ZPGhZ/Aqfre+cbUXlfvQ2BskK23Qbw==
X-Received: by 2002:a05:622a:1886:: with SMTP id
 v6mr5179950qtc.244.1633102434273; 
 Fri, 01 Oct 2021 08:33:54 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] linux-user/nios2: Fixes for signal frame setup
Date: Fri,  1 Oct 2021 11:33:41 -0400
Message-Id: <20211001153347.1736014-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not confuse host and guest addresses.  Lock and unlock
the target_rt_sigframe structure in setup_rt_sigframe.

Since rt_setup_ucontext always returns 0, drop the return
value entirely.  This eliminates the only write to the err
variable in setup_rt_sigframe.

Always copy the siginfo structure.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210924165926.752809-19-richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 49 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index a77e8a40f4..adbffe32e3 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -42,7 +42,7 @@ struct target_rt_sigframe {
     struct target_ucontext uc;
 };
 
-static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
+static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
 {
     unsigned long *gregs = uc->tuc_mcontext.gregs;
 
@@ -75,8 +75,6 @@ static int rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_GP], &gregs[25]);
     __put_user(env->regs[R_EA], &gregs[27]);
     __put_user(env->regs[R_SP], &gregs[28]);
-
-    return 0;
 }
 
 static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
@@ -135,8 +133,8 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     return 0;
 }
 
-static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
-                          size_t frame_size)
+static abi_ptr get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
+                            size_t frame_size)
 {
     unsigned long usp;
 
@@ -144,7 +142,7 @@ static void *get_sigframe(struct target_sigaction *ka, CPUNios2State *env,
     usp = target_sigsp(get_sp_from_cpustate(env), ka);
 
     /* Verify, is it 32 or 64 bit aligned */
-    return (void *)((usp - frame_size) & -8UL);
+    return (usp - frame_size) & -8;
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
@@ -153,26 +151,25 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     CPUNios2State *env)
 {
     struct target_rt_sigframe *frame;
-    int i, err = 0;
+    abi_ptr frame_addr;
+    int i;
 
-    frame = get_sigframe(ka, env, sizeof(*frame));
-
-    if (ka->sa_flags & SA_SIGINFO) {
-        tswap_siginfo(&frame->info, info);
+    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        force_sigsegv(sig);
+        return;
     }
 
+    tswap_siginfo(&frame->info, info);
+
     /* Create the ucontext.  */
     __put_user(0, &frame->uc.tuc_flags);
     __put_user(0, &frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
-    err |= rt_setup_ucontext(&frame->uc, env);
+    rt_setup_ucontext(&frame->uc, env);
     for (i = 0; i < TARGET_NSIG_WORDS; i++) {
         __put_user((abi_ulong)set->sig[i],
-            (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    if (err) {
-        goto give_sigsegv;
+                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
     }
 
     /* Set up to return from userspace; jump to fixed address sigreturn
@@ -180,19 +177,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[R_RA] = (unsigned long) (0x1044);
 
     /* Set up registers for signal handler */
-    env->regs[R_SP] = (unsigned long) frame;
-    env->regs[4] = (unsigned long) sig;
-    env->regs[5] = (unsigned long) &frame->info;
-    env->regs[6] = (unsigned long) &frame->uc;
-    env->regs[R_EA] = (unsigned long) ka->_sa_handler;
-    return;
+    env->regs[R_SP] = frame_addr;
+    env->regs[4] = sig;
+    env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
+    env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
+    env->regs[R_EA] = ka->_sa_handler;
 
-give_sigsegv:
-    if (sig == TARGET_SIGSEGV) {
-        ka->_sa_handler = TARGET_SIG_DFL;
-    }
-    force_sigsegv(sig);
-    return;
+    unlock_user_struct(frame, frame_addr, 1);
 }
 
 long do_sigreturn(CPUNios2State *env)
-- 
2.25.1


