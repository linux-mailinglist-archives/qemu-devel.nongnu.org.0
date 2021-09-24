Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA22417978
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:11:45 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTojg-0006JG-Qt
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY6-0002mZ-N9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:46 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY3-00071w-I0
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:46 -0400
Received: by mail-qk1-x72e.google.com with SMTP id p4so28962528qki.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTxH4FIm8UZKfO6Q1wb4hu+tVJghYRydXpLjkNTr2zo=;
 b=VJTfst6MefBeUJw+1PD7rTKn4E+MszmdumrP3jlb+MS5MzK0+FBft8HrFzZqaIAiZi
 55VfyDP1VOkGOJ6Zxg1berkvS+gqm+IDZbCiOdSnmgm2TPcqnL2cHcQDYQh5pL0LL1tu
 QxqB2DhcY9PP6HXHFrtYKLy3rlIZ7YE2YoIDznueAq2zJUlddxw/2fjV4DQNYArYius1
 aN3KIWeWP42pMLOKfHPQScOA3yEV8NlxmtlZ64uYLlttF+HpT9rjfHGvlQ3rNRpU6KNm
 tnbprB7mOdzZdUT02BLFLlJDcG6j5WtwLEGLsZ6B+Xhkqfw4tJc4cW1VQiGPTk0u30UT
 Okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTxH4FIm8UZKfO6Q1wb4hu+tVJghYRydXpLjkNTr2zo=;
 b=JeSSex8AvJcJog5SIR/d91tDmBKrxyx0XavS6D2/Kpw+snm4NyHWOECCZ2u7HjGAhD
 FSNOPMRJuwZmwpLcj2COCYqKX/FLkVTmCg8mbYCAZVhLpE2vasFHOxyHxSbexIraaE6a
 6y63lSKbSLOxWaWe2R7tYbaBMN5uSg/ffNCP938hLiQMLvuSmDa6E+P4311b8lg1VkoE
 TPreo6veFHr537E0cOfDd7m4ecCrJyAWfBww5Y45wfbnoLMfye1oGZXkt83MXa0okXCQ
 U8Uz1S4KkCLzOTSx/hH2HkDnONRyzX1hbwj4Sn6LU1HeL5B7Z6kSHs1XHf5FkhZhqyoQ
 x5qg==
X-Gm-Message-State: AOAM5333j1nlgMDJzdtAYZUELwbsARpezPj49DIB4qATKpLd5xtQp1Kw
 a1q57Ohvat52t0eYWwYoVFOseY5guhokDg==
X-Google-Smtp-Source: ABdhPJx2h/mf/on1G+QFmrxEK5Hj021WGBrocskeRFeiLesUxxeQQml6PqiqEFHlh8SMItm6dgtmZQ==
X-Received: by 2002:a37:a88e:: with SMTP id
 r136mr11551861qke.490.1632502781593; 
 Fri, 24 Sep 2021 09:59:41 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/27] linux-user/nios2: Fixes for signal frame setup
Date: Fri, 24 Sep 2021 12:59:17 -0400
Message-Id: <20210924165926.752809-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not confuse host and guest addresses.  Lock and unlock
the target_rt_sigframe structure in setup_rt_sigframe.

Since rt_setup_ucontext always returns 0, drop the return
value entirely.  This eliminates the only write to the err
variable in setup_rt_sigframe.

Always copy the siginfo structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 49 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index c9a235ded5..95f6d737e1 100644
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
     env->regs[R_RA] = default_rt_sigreturn;
 
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


