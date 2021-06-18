Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7243AD318
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:47:44 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKSt-0001yI-1J
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBs-0001h6-6v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001Xx-7g
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id o21so5193480pll.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zh9h+PmWbwWPB35P4oSzNT2+LT+dobQgpXEUdOMWBj8=;
 b=dvxTx89lOsQh5ke2jZafIY2SdwMOM0OI16qYjtPzNYj1tZF6lCtpuTfVeaLSR/w45f
 YQO6Nx5rvN1C7r+UjdLXJMKdi13Jw6AhPKxBKVWsZ2hR9B9xd06mYB73b9EGdLmRkgbp
 0fu8WQSc5kwpKZVcQTcMK5kwh1P76gJ+Xt76mYtmRWYjz8ho5pKTi/YB5mVC34uvqJ6B
 MMnyLvVTOrgwJg63AnkhhDanazygsbNQj58uQTUw5XjwxJ/lkDI+/TURTU7n7HgJnn8f
 Toe4h1klP3HU4ErMiWCYTH3GcYbRtH1u0GcxOxsyNGcpAm9OX0iXWushAp5Ps2LJs+uT
 vtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zh9h+PmWbwWPB35P4oSzNT2+LT+dobQgpXEUdOMWBj8=;
 b=E8az78/QIR1ojn15hz4tbfUFmZ/5zFb1rPIquIA0WCDvakuUiHgh23HxaXuUriIu4v
 Qdrmu28z+XipfBwqKw6Zo8jixkI/aJ0Y1/XD9p5AJ4qXvihd6+IaPvCRf/z3Zl+NXold
 EJkeD+d168St53PF+mtctBq+vD++BHwRhE95wgdBSQGGlojrDr+NBlo9uRX511McHL08
 GV0n3o7bKsbdWwXxPI2E1cQmrBwhGDn+j1kQ9Kwixy1L59g/uMR0vMbzzP9tTt5UadZV
 1G9KWmOhowsKxFqHbseZXYkCr5icYsRz5Y5FpSNQTh/N2u4GgosgurfJlqfMSzNRUHLe
 u7DA==
X-Gm-Message-State: AOAM531Gii3yC5fNw8HbY0MiN4DSJniuaEEwArW4ilQ3UYd+gUG2P/NX
 VkkLPVGiF6Y7ntCosW0KCOokttl61JTP+g==
X-Google-Smtp-Source: ABdhPJyFohmLd/HKZHlyOFRErzz/FjSxtZwgWJ2Xb6olm71IVYN5uXvcusOBTELdkBB72/AcsdMiAA==
X-Received: by 2002:a17:90a:390d:: with SMTP id
 y13mr12789089pjb.52.1624044602466; 
 Fri, 18 Jun 2021 12:30:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] linux-user/ppc: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:45 -0700
Message-Id: <20210618192951.125651-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-ppc@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/target_signal.h |  2 ++
 linux-user/ppc/signal.c        | 34 ++++++++++++++++++----------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
index 72fcdd9bfa..82184ab8f2 100644
--- a/linux-user/ppc/target_signal.h
+++ b/linux-user/ppc/target_signal.h
@@ -24,4 +24,6 @@ typedef struct target_sigaltstack {
 #if !defined(TARGET_PPC64)
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* PPC_TARGET_SIGNAL_H */
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a37..4ae35aaf6d 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -202,9 +202,6 @@ struct target_func_ptr {
 
 #endif
 
-/* We use the mc_pad field for the signal return trampoline.  */
-#define tramp mc_pad
-
 /* See arch/powerpc/kernel/signal.c.  */
 static target_ulong get_sigframe(struct target_sigaction *ka,
                                  CPUPPCState *env,
@@ -437,12 +434,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Save user regs.  */
     save_user_regs(env, &frame->mctx);
 
-    /* Construct the trampoline code on the stack. */
-    encode_trampoline(TARGET_NR_sigreturn, (uint32_t *)&frame->mctx.tramp);
-
-    /* The kernel checks for the presence of a VDSO here.  We don't
-       emulate a vdso, so use a sigreturn system call.  */
-    env->lr = (target_ulong) h2g(frame->mctx.tramp);
+    env->lr = default_sigreturn;
 
     /* Turn off all fp exceptions.  */
     env->fpscr = 0;
@@ -478,7 +470,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_sigset_t *set, CPUPPCState *env)
 {
     struct target_rt_sigframe *rt_sf;
-    uint32_t *trampptr = 0;
     struct target_mcontext *mctx = 0;
     target_ulong rt_sf_addr, newsp = 0;
     int i, err = 0;
@@ -508,22 +499,17 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 #if defined(TARGET_PPC64)
     mctx = &rt_sf->uc.tuc_sigcontext.mcontext;
-    trampptr = &rt_sf->trampoline[0];
 
     sc = &rt_sf->uc.tuc_sigcontext;
     __put_user(h2g(mctx), &sc->regs);
     __put_user(sig, &sc->signal);
 #else
     mctx = &rt_sf->uc.tuc_mcontext;
-    trampptr = (uint32_t *)&rt_sf->uc.tuc_mcontext.tramp;
 #endif
 
     save_user_regs(env, mctx);
-    encode_trampoline(TARGET_NR_rt_sigreturn, trampptr);
 
-    /* The kernel checks for the presence of a VDSO here.  We don't
-       emulate a vdso, so use a sigreturn system call.  */
-    env->lr = (target_ulong) h2g(trampptr);
+    env->lr = default_rt_sigreturn;
 
     /* Turn off all fp exceptions.  */
     env->fpscr = 0;
@@ -721,3 +707,19 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
 
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
+    default_sigreturn = sigtramp_page;
+    encode_trampoline(TARGET_NR_sigreturn, tramp + 0);
+#endif
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    encode_trampoline(TARGET_NR_rt_sigreturn, tramp + 2);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
-- 
2.25.1


