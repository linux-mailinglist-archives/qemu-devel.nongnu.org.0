Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625747B89D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:54:32 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVIN-0001Pj-KZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEJ-0003bU-D7
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:19 -0500
Received: from [2607:f8b0:4864:20::533] (port=33724
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEH-0000AC-Jz
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:18 -0500
Received: by mail-pg1-x533.google.com with SMTP id f125so11082179pgc.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbNBQfasK4f+xfMQiEwPjjsKiwcmSRl4Jt7JCBlYZlo=;
 b=NfUfLCNIjMo8KMEKTAiv2uAEDlt0axISwbzsiOaD+OSocglWRo4Tx7kAlBR4tQfmml
 pvFCLm446w9QXbadzxKNpt034iCGmw+oX1New3O2pexBhh4ef9Qdylr3wtRN6alY6VXQ
 byyMj6mklHJp/LBIOz6J8Sw5vFb2B5PtYga/F0eyk2Rg24BPpRHr8DqMnO0x8162ovnd
 xv5lljWuTZ+9fZCZPq1O2Dd03SSNMICnoM4z/4RYHY2MufJ9Usf9oRJBORhXuQkWb+Y0
 zp9YkyNdD3N5x8iCoXyJeOk9PQkvpxGe0UbvVRCXx8b8DKB/Ac1gS7uL0w216MIVwsYc
 60/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbNBQfasK4f+xfMQiEwPjjsKiwcmSRl4Jt7JCBlYZlo=;
 b=12AaVBMhuHzR7N59lDJsgCotA+ZM/ezuWPN/VjENZIfvtIJq6K49MCMWD0z6HdXd/j
 hFx9DOzQTt0Iyrt90YqGQ+Ihqpanciocg6l6Ufv3Khi9isbkhexb9YMU2P/9ZzTH27Iw
 pwNEt0UDvs/MeUsbsdGr3dntFb/UkIORWnPQLOolPT9S8V6/+fxYZRl7fnzHp1iCKuTu
 IHWgcN36xoo4aQEcZcs8y3cxhQalJooFxTzeBVnMoQtNH4qfLsRycRqIZxaul5ceZX7s
 MFs5zxA6EGkttLnwrK2uoVmcpExvvfxTTvQPIyWATWZuAXxD9IaNlR406Ej3q1PPehRG
 o7Ug==
X-Gm-Message-State: AOAM532cWvBmcEC0hILwS6kF/qxaCVn4W2aSZFILlz4QnK5nGK3r1NzK
 S/GiMd7Dys1/oOCnK2TaRO+P6lZ93oCTiA==
X-Google-Smtp-Source: ABdhPJyYbtXJWtdWGGPIbY3YXaSyCLEszXqfC3O0a3YnpC4CNhlbLR6B4taKqDbYJO1oiPgoS54D8g==
X-Received: by 2002:a63:4c45:: with SMTP id m5mr1013980pgl.105.1640055016375; 
 Mon, 20 Dec 2021 18:50:16 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] linux-user/nios2: Fixes for signal frame setup
Date: Mon, 20 Dec 2021 18:50:07 -0800
Message-Id: <20211221025012.1057923-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not confuse host and guest addresses.  Lock and unlock
the target_rt_sigframe structure in setup_rt_sigframe.

Since rt_setup_ucontext always returns 0, drop the return
value entirely.  This eliminates the only write to the err
variable in setup_rt_sigframe.

Always copy the siginfo structure.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


