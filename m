Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25A417935
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:05:57 +0200 (CEST)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToe5-0003A9-1B
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXv-0002dc-C6
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:35 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXs-0006sq-UE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:35 -0400
Received: by mail-qv1-xf32.google.com with SMTP id a14so6648536qvb.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qw4dD1OgISmN9k1dJ+QkWah6FxPb8XtaJuuTt7cvGa4=;
 b=UBgNzb4w1rN/7zgVQMVmhj2RZkMfo45LY8uLiZPciaA7Dvtjy6dDPslJkzDYpDahOg
 /wLd0GkJx3tmT0wwhmMEgKfceNKnXAHroaeZqOduySHxK9y3C2/llHCwMN9Gux85B7L7
 1yph/8ZXm20ZsdE3RRxT6Ev7PyKyKZEQh7JMhpBp8jRCpQKdW4mdQc59mlFdbc2takNe
 B8q1ihXqjgME6Wu0RaO8luPT3ofxvwW0hIGiacfqT9RP+julZt9hD4InNQ8eZ47fJLj9
 lo4kIKOf+j+UhEl0PkQuBkDsyHn6M4/LzBXQ9SP/gWQ1g3LbYU6bGzfXDGY2kjTNPpdj
 T9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qw4dD1OgISmN9k1dJ+QkWah6FxPb8XtaJuuTt7cvGa4=;
 b=MK5oh8uhgiqIQpneXQFt3Lrtry7rVC8GC5dVA03k7vFQQqkugrHDvMGEQOUatc2lRj
 it8cX12U/sRfQ1iTtWuXQPitRfGBsVLsaBxpEsHFCGWGRV1EDBeh17oOFJdy8rZ/AoCW
 nQ/1i8sER6hu0FChSWpDALWEbQdthmPbNg1qg9m4f+nIxrvYe4I5WY+Rdbgy5oX5BuUw
 J0Hi4o9p3z0H0eIUn3plhapYU37bbzVbmsniOazdrQhv3QRxvLPGDkHgQcx9CzSXfRMn
 lyrrTjg3krK8LogQjatA58vdtaQmGxWFIvDGHe7mOtJDLD6cgA52Aa7FEgRUVc5AGuHu
 2T2w==
X-Gm-Message-State: AOAM5306gOeqHriYxmI638JajwzB3YWYEwF4xeFycoe80xT8dYUCMpRf
 zj9Hk7+9Dimz3iScBNJdu+Ni9Q9zm9vCDg==
X-Google-Smtp-Source: ABdhPJybsmPykVnGF0uyApYGTYzM7f9JTUP4MZO5e2oPOa6ZyhLnKu/CN7y3SsJKh9nTs9/N99ye4A==
X-Received: by 2002:a0c:cc84:: with SMTP id f4mr2268295qvl.14.1632502770503;
 Fri, 24 Sep 2021 09:59:30 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/27] linux-user/arm: Drop v1 signal frames
Date: Fri, 24 Sep 2021 12:59:02 -0400
Message-Id: <20210924165926.752809-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 signal frames are used from 2.6.12 and since cbc14e6f286,
we have set UNAME_MINIMUM_RELEASE to 2.6.32.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 220 +---------------------------------------
 1 file changed, 4 insertions(+), 216 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index ed144f9455..d0940bab47 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -46,14 +46,6 @@ struct target_sigcontext {
     abi_ulong fault_address;
 };
 
-struct target_ucontext_v1 {
-    abi_ulong tuc_flags;
-    abi_ulong tuc_link;
-    target_stack_t tuc_stack;
-    struct target_sigcontext tuc_mcontext;
-    target_sigset_t  tuc_sigmask;       /* mask last for extensibility */
-};
-
 struct target_ucontext_v2 {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
@@ -98,28 +90,12 @@ struct target_iwmmxt_sigframe {
 #define TARGET_VFP_MAGIC 0x56465001
 #define TARGET_IWMMXT_MAGIC 0x12ef842a
 
-struct sigframe_v1
-{
-    struct target_sigcontext sc;
-    abi_ulong extramask[TARGET_NSIG_WORDS-1];
-    abi_ulong retcode[4];
-};
-
 struct sigframe_v2
 {
     struct target_ucontext_v2 uc;
     abi_ulong retcode[4];
 };
 
-struct rt_sigframe_v1
-{
-    abi_ulong pinfo;
-    abi_ulong puc;
-    struct target_siginfo info;
-    struct target_ucontext_v1 uc;
-    abi_ulong retcode[4];
-};
-
 struct rt_sigframe_v2
 {
     struct target_siginfo info;
@@ -363,37 +339,6 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     }
 }
 
-/* compare linux/arch/arm/kernel/signal.c:setup_frame() */
-static void setup_frame_v1(int usig, struct target_sigaction *ka,
-                           target_sigset_t *set, CPUARMState *regs)
-{
-    struct sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, regs, sizeof(*frame));
-    int i;
-
-    trace_user_setup_frame(regs, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    setup_sigcontext(&frame->sc, regs, set->sig[0]);
-
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->extramask[i - 1]);
-    }
-
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
-}
-
 static void setup_frame_v2(int usig, struct target_sigaction *ka,
                            target_sigset_t *set, CPUARMState *regs)
 {
@@ -422,60 +367,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_frame_v2(usig, ka, set, regs);
-    } else {
-        setup_frame_v1(usig, ka, set, regs);
-    }
-}
-
-/* compare linux/arch/arm/kernel/signal.c:setup_rt_frame() */
-static void setup_rt_frame_v1(int usig, struct target_sigaction *ka,
-                              target_siginfo_t *info,
-                              target_sigset_t *set, CPUARMState *env)
-{
-    struct rt_sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
-    struct target_sigaltstack stack;
-    int i;
-    abi_ulong info_addr, uc_addr;
-
-    trace_user_setup_rt_frame(env, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    info_addr = frame_addr + offsetof(struct rt_sigframe_v1, info);
-    __put_user(info_addr, &frame->pinfo);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe_v1, uc);
-    __put_user(uc_addr, &frame->puc);
-    tswap_siginfo(&frame->info, info);
-
-    /* Clear all the bits of the ucontext we don't use.  */
-    memset(&frame->uc, 0, offsetof(struct target_ucontext_v1, tuc_mcontext));
-
-    memset(&stack, 0, sizeof(stack));
-    target_save_altstack(&stack, env);
-    memcpy(&frame->uc.tuc_stack, &stack, sizeof(stack));
-
-    setup_sigcontext(&frame->uc.tuc_mcontext, env, set->sig[0]);
-    for(i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    env->regs[1] = info_addr;
-    env->regs[2] = uc_addr;
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
+    setup_frame_v2(usig, ka, set, regs);
 }
 
 static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
@@ -516,11 +408,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_rt_frame_v2(usig, ka, info, set, env);
-    } else {
-        setup_rt_frame_v1(usig, ka, info, set, env);
-    }
+    setup_rt_frame_v2(usig, ka, info, set, env);
 }
 
 static int
@@ -553,54 +441,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     return err;
 }
 
-static long do_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct sigframe_v1 *frame = NULL;
-    target_sigset_t set;
-    sigset_t host_set;
-    int i;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    __get_user(set.sig[0], &frame->sc.oldmask);
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __get_user(set.sig[i], &frame->extramask[i - 1]);
-    }
-
-    target_to_host_sigset_internal(&host_set, &set);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->sc)) {
-        goto badframe;
-    }
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
-}
-
 static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
 {
     int i;
@@ -733,55 +573,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_sigreturn_v2(env);
-    } else {
-        return do_sigreturn_v1(env);
-    }
-}
-
-static long do_rt_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct rt_sigframe_v1 *frame = NULL;
-    sigset_t host_set;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_rt_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    target_to_host_sigset(&host_set, &frame->uc.tuc_sigmask);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
-
-    target_restore_altstack(&frame->uc.tuc_stack, env);
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return do_sigreturn_v2(env);
 }
 
 static long do_rt_sigreturn_v2(CPUARMState *env)
@@ -822,9 +614,5 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_rt_sigreturn_v2(env);
-    } else {
-        return do_rt_sigreturn_v1(env);
-    }
+    return do_rt_sigreturn_v2(env);
 }
-- 
2.25.1


