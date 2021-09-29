Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CA41C580
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:24:44 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZZj-0001ON-AM
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZII-0007Mx-3n
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:42 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIG-0006Mf-Bs
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:41 -0400
Received: by mail-oi1-x235.google.com with SMTP id y201so2809998oie.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MmSCGYIFzfMZzarwBYHnm0N3s8Oxz8OvMDOHLBQ9iBw=;
 b=xIGAflf67FDK6UWvw0vzQ8mB6cZeXGB5mDEBNdeWoQ3NXx7nW0ybQg/+d60CIIiAaz
 G1V6xAmLl+kAnl8xpwpsDBFJ1tf3qKg1NcmGmmt+Pqqe2IJ6OrkX11bcV9r1g6RFBWdn
 YyKlNzijtYxKjoJQkffltVedsaavvBzwXLbfxkMUO0WeNY6i8uJYp8y6iGnFKtOlWqJN
 K8xGuV9XLXsnSqKL0LgIzoALeCEPHEImC7DfBw2V6aYfigfcaAkbChItXdNl8egcwh0Q
 zmKZ8BFs16T/cmEBoa0XgXeEeezwjX4Z5hwFMhJjCwOAo9s5vwVbZsM4+WWzdvISVYsU
 hb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MmSCGYIFzfMZzarwBYHnm0N3s8Oxz8OvMDOHLBQ9iBw=;
 b=q8swQQ8FGmz49a2T7KScro8BbmHHDWPp9z58yO/zw5FHqzL3slbikagx9S9SUCqUIg
 J91URbvcPvqBA6YptM4pN4/SjioCdGyfDbd/dl0gC1BvG0+UYNU82k8Y2L/kIsCJTo6k
 BzeIL26SGbVt0P3gF7lIxeU8hRmP2fNoUWZnLCjhSN2LJlxW7/rBs01XShZbaMg70LN1
 FSwBX6jtaMa9nQnipNfACKFT+gkcfOPVKppci4tAcA+v/TBQBNbLssGFp1DreH0IjocW
 TVXJt8iZlrseuAUpJuBMw1wmTvzyfOMFNkfi94iZ+a8Ove+kMwyazgCimr+35b95ZGsL
 oE+A==
X-Gm-Message-State: AOAM530n+pJKfQHnR1fKM91j5AgHjBhIbqp5psNQFYRkxhk6qOy1jdWq
 m/O+GYQAr+ZB04mCABXV/nV4A2WLfIOa7A==
X-Google-Smtp-Source: ABdhPJzpPbsXafQamrJIBc9+qvujBkzLbyVxXjeX6Ji3wvhrd/x6lJYEGKesuSxMJ6gz4mahezGvFA==
X-Received: by 2002:a05:6808:180a:: with SMTP id
 bh10mr7998306oib.6.1632920798220; 
 Wed, 29 Sep 2021 06:06:38 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/26] linux-user/ppc: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:46 -0400
Message-Id: <20210929130553.121567-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: qemu-ppc@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 77f37b9f01..c37744c8fc 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -203,9 +203,6 @@ struct target_func_ptr {
 
 #endif
 
-/* We use the mc_pad field for the signal return trampoline.  */
-#define tramp mc_pad
-
 /* See arch/powerpc/kernel/signal.c.  */
 static target_ulong get_sigframe(struct target_sigaction *ka,
                                  CPUPPCState *env,
@@ -436,12 +433,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
@@ -477,7 +469,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_sigset_t *set, CPUPPCState *env)
 {
     struct target_rt_sigframe *rt_sf;
-    uint32_t *trampptr = 0;
     struct target_mcontext *mctx = 0;
     target_ulong rt_sf_addr, newsp = 0;
     int i, err = 0;
@@ -507,22 +498,17 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
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
@@ -720,3 +706,19 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
 
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


