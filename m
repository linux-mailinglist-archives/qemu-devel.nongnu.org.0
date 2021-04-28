Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0236D0E6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 05:33:46 +0200 (CEST)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbaxN-0000zB-PK
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 23:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbaw4-000858-P0
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbaw1-00008y-QF
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:24 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso8361027pjn.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UK1YbqqlmWYWZ3nCDAZqXJgWrK622W4kr3AfSUK6QPg=;
 b=fcFoqTBjCqcj/0QvoQKQBtF/pBlujHhlzsVqEmlvQNSRyO2OnpnrgUkBrgLEyz5uhv
 ZitYcppbUHDNACe3rU7NIy7fBz9zSK6bEGSwl9VMcke8N5KbQ69H/cMyGA5hXp197k0y
 G7oSLQEBvxVVSqI3zNQO4fhoCjO+E2Xk6dk5tNo4aekxhK7uEgzzWQoT6srTGEb6VdYF
 4BbOlK17g6yvE0xlQAqQDrLqf7v7ejSLsKrBFcNvYSc2XFowaC9uZq/e965KKp2Vs487
 gr+P6uMwYv1/9YfMSEJLc1d/6o1JYnhDNwUETYjegcxSIlnUkA2W57TWYOjHpnotSrUx
 Viug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UK1YbqqlmWYWZ3nCDAZqXJgWrK622W4kr3AfSUK6QPg=;
 b=tAX4GmDd8Ri5p6Q+XPI5HustC3BWeETyhVboG84XtBfW/Or0ia9WCRNNs6j4UNlqfL
 sDqMyrF+K6lJAdtt4BPDJFKSBEbrKzjYItDfkMx9SdtcfJUztmStHsd6oWoBHhCg3rpQ
 UmwsYQ4EVEN+fpzFPa19bWJfw3z7hlqK0WnYX81LJ0lQxHoDeT9fXzjzrnfvKvP+SkVN
 qJ846nLsu/itGFbmTN0HRVWI1xnVdR9E9SQlC6S0ZPK8uqT+kXJYrFf0bXL/1UZc54df
 mbF9cQHkj/wbStvvTMCxwT006M9X/scjewwnOf42UTzv0AIY07XFmQabe8dnXcuks4F4
 A02Q==
X-Gm-Message-State: AOAM530LXd/JzO5yJurhezPQawdsSQcCKKRYOJLeNfTbqmfm7m2rc0sF
 +LrJUPg/ayhLYjgYvXeMn64kzNime4wFdg==
X-Google-Smtp-Source: ABdhPJzvAkX9JMGz2G8tClGHd5HivNN99Dk4FjTY1FEj9LfO7wHnIHx48toxy0kTO9eYNCx3Hc0H6w==
X-Received: by 2002:a17:902:7b8e:b029:ec:982d:7a7e with SMTP id
 w14-20020a1709027b8eb02900ec982d7a7emr27912209pll.55.1619580740428; 
 Tue, 27 Apr 2021 20:32:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 18sm3572335pji.30.2021.04.27.20.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:32:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user/s390x: Handle vector regs in signal stack
Date: Tue, 27 Apr 2021 20:32:04 -0700
Message-Id: <20210428033204.133471-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428033204.133471-1-richard.henderson@linaro.org>
References: <20210428033204.133471-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 62 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index fb7065f243..57752a2a96 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -51,6 +51,12 @@ typedef struct {
     target_s390_fp_regs     fpregs;
 } target_sigregs;
 
+typedef struct {
+    uint64_t vxrs_low[16];
+    uint64_t vxrs_high[16][2];
+    uint8_t reserved[128];
+} target_sigregs_ext;
+
 typedef struct {
     abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
     abi_ulong sregs;
@@ -61,15 +67,20 @@ typedef struct {
     target_sigcontext sc;
     target_sigregs sregs;
     int signo;
+    target_sigregs_ext sregs_ext;
     uint8_t retcode[S390_SYSCALL_SIZE];
 } sigframe;
 
+#define TARGET_UC_VXRS 2
+
 struct target_ucontext {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
     target_stack_t tuc_stack;
     target_sigregs tuc_mcontext;
-    target_sigset_t tuc_sigmask;   /* mask last for extensibility */
+    target_sigset_t tuc_sigmask;
+    uint8_t reserved[128 - sizeof(target_sigset_t)];
+    target_sigregs_ext tuc_mcontext_ext;
 };
 
 typedef struct {
@@ -129,6 +140,24 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
     }
 }
 
+static void save_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
+{
+    int i;
+
+    /*
+     * if (MACHINE_HAS_VX) ...
+     * That said, we always allocate the stack storage and the
+     * space is always available in env.
+     */
+    for (i = 0; i < 16; ++i) {
+       __put_user(env->vregs[i][1], &ext->vxrs_low[i]);
+    }
+    for (i = 0; i < 16; ++i) {
+       __put_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
+       __put_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
+    }
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUS390XState *env)
 {
@@ -156,6 +185,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Place signal number on stack to allow backtrace from handler.  */
     __put_user(sig, &frame->signo);
 
+    /* Create sigregs_ext on the signal stack. */
+    save_sigregs_ext(env, &frame->sregs_ext);
+
     /*
      * Set up to return from userspace.
      * If provided, use a stub already in userspace.
@@ -196,6 +228,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     rt_sigframe *frame;
     abi_ulong frame_addr;
+    abi_ulong uc_flags;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
@@ -223,10 +256,15 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     tswap_siginfo(&frame->info, info);
 
     /* Create the ucontext.  */
-    __put_user(0, &frame->uc.tuc_flags);
+    uc_flags = 0;
+    if (s390_has_feat(S390_FEAT_VECTOR)) {
+        uc_flags |= TARGET_UC_VXRS;
+    }
+    __put_user(uc_flags, &frame->uc.tuc_flags);
     __put_user(0, &frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
     save_sigregs(env, &frame->uc.tuc_mcontext);
+    save_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
     tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up registers for signal handler */
@@ -265,6 +303,24 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     }
 }
 
+static void restore_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
+{
+    int i;
+
+    /*
+     * if (MACHINE_HAS_VX) ...
+     * That said, we always allocate the stack storage and the
+     * space is always available in env.
+     */
+    for (i = 0; i < 16; ++i) {
+       __get_user(env->vregs[i][1], &ext->vxrs_low[i]);
+    }
+    for (i = 0; i < 16; ++i) {
+       __get_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
+       __get_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
+    }
+}
+
 long do_sigreturn(CPUS390XState *env)
 {
     sigframe *frame;
@@ -286,6 +342,7 @@ long do_sigreturn(CPUS390XState *env)
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
     restore_sigregs(env, &frame->sregs);
+    restore_sigregs_ext(env, &frame->sregs_ext);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
@@ -308,6 +365,7 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     target_restore_altstack(&frame->uc.tuc_stack, env);
     restore_sigregs(env, &frame->uc.tuc_mcontext);
+    restore_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.25.1


