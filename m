Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3C36DFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:56:09 +0200 (CEST)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqI5-0002bQ-1G
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpxG-00065a-MN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:38 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwy-0004j3-Bn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso9699299pjn.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ld1aOOPFCTaDlIM4pseMTjUT2N/AiXsA3fl7Bo9Xfu4=;
 b=PC4rOSN52eqF1IWhTmwsVrG2RyppGJdWOOkCljx/JFXuiJjNaJe8gyJ0n42aLYRYsR
 7l9FU1dQaMgj9bbqqBD+oZQUCQ0mIiSqXsIPO9K0GySJe1ZCBrtmPRUNtVk4izBG7m+A
 QSVSpmN6lGbnmv2nCl+bmil/dR/dY0Q0Q9MKogeXFFrOkJKOgFEaGmjpaFqJ5Q8CrML/
 HoA2iuOgK7vfnjyjJivXGu4wWTqo2GfT9YG8SysSLyerkCiLvOwakUNcnKUMcuE0ySUe
 swsoaZ51jbVgr0aZJ2kcRVocsnpJHIHFbnzfrV9vdO3sRkVd5Xc3FQ63dsD4VO+7Y5ra
 EWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ld1aOOPFCTaDlIM4pseMTjUT2N/AiXsA3fl7Bo9Xfu4=;
 b=gpKQPRUUdDjHoF9j/IcsLbj4cLRt9QtlLNwxD9DUD9lb0PLylQO7HbKWkI9EU7IjXt
 sa1KRGOTa6vIBVesGq/7MM1Z8wjXLM8JrArTr+cFom3oKyvMp8SJ3MiC3tlGVLwCCyg7
 7Q4NGxdxcVp1P31g4y3oy/kUs46T3aCHJ1XYjlWmK7Wr2dcyQCV3DlfF/voDSWtmlAM9
 8mrY4Fsrf9r+5Lrp+O6yQZNC0t3E7yzPgILsZoTLBuhIFaUumwSNmc2+t673T1ODu/ub
 X1cSXybRQUf/nR57bwO7SF23zNG+vWhmiE51QoO+BB9P4YBbOzSIcGWis/tLDIiVBjIl
 FSOQ==
X-Gm-Message-State: AOAM53109891gUFMFHibWVwIJCMYTUpS0HAhkxg05gaw/Ms6ygZcu8ZU
 mMKygnk37S8tLwzOXttl0PVUvOTecbt24w==
X-Google-Smtp-Source: ABdhPJzLXuxz1jcOk9T0cpTs51vICRngvVd96T0urPEDowVyc2oS6eBta9IoJZ7C5EeAZQ6CEqZ30A==
X-Received: by 2002:a17:90a:a505:: with SMTP id
 a5mr34071344pjq.58.1619638459021; 
 Wed, 28 Apr 2021 12:34:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] linux-user/s390x: Handle vector regs in signal stack
Date: Wed, 28 Apr 2021 12:34:08 -0700
Message-Id: <20210428193408.233706-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
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
index 9d470e4ca0..b537646e60 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -50,6 +50,12 @@ typedef struct {
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
@@ -60,15 +66,20 @@ typedef struct {
     target_sigcontext sc;
     target_sigregs sregs;
     int signo;
+    target_sigregs_ext sregs_ext;
     uint16_t retcode;
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
@@ -128,6 +139,24 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
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
@@ -161,6 +190,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
      */
     __put_user(sig, &frame->signo);
 
+    /* Create sigregs_ext on the signal stack. */
+    save_sigregs_ext(env, &frame->sregs_ext);
+
     /*
      * Set up to return from userspace.
      * If provided, use a stub already in userspace.
@@ -202,6 +234,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     rt_sigframe *frame;
     abi_ulong frame_addr;
     abi_ulong restorer;
+    abi_ulong uc_flags;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
@@ -229,10 +262,15 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     tswap_siginfo(&frame->info, info);
 
     /* Create ucontext on the signal stack. */
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
@@ -271,6 +309,24 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
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
@@ -292,6 +348,7 @@ long do_sigreturn(CPUS390XState *env)
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
     restore_sigregs(env, &frame->sregs);
+    restore_sigregs_ext(env, &frame->sregs_ext);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
@@ -313,6 +370,7 @@ long do_rt_sigreturn(CPUS390XState *env)
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
     restore_sigregs(env, &frame->uc.tuc_mcontext);
+    restore_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
 
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
-- 
2.25.1


