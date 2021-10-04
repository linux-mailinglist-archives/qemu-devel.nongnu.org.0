Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA04206E8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:59:19 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIsY-0006PZ-70
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXIeO-0004FM-Tp; Mon, 04 Oct 2021 03:44:40 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXIeL-0004qK-Ck; Mon, 04 Oct 2021 03:44:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MvazO-1mpNxt0G6I-00sh6y; Mon, 04
 Oct 2021 09:44:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] linux-user/ppc: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:14 +0200
Message-Id: <20211004074421.3141222-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zJQDeNvfKA3D0pmA19DTna78yMG7NV0QZ+MSC7gMdgRf7L3WuCj
 57+TdP5GjA0aEFupg66KMZ8cP2Kmlbn8R6DNPCKsIEZzHKH30jJAjpVp59htzJfUU5exSaV
 lkJ/mL8URDXyWunBrHZaE0osjrNbvZag31kDmfqA+IvuGwMzOC62MLfVHCTq3NQw/koZA0V
 lQ7pzgh0TM1k3f0yeMy2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pee8h0ATvpo=:3mfWjJAR2w9x0MJ43r6JvO
 sVHIbsWBsRir0vyv0gOmO/DEAmjv6BtywiYoAkozSmDJr8FGcKi6yqIh773Dc3gHuFHhJuRLK
 hICqVznEl0Ugrf3QneRtzblzoXse/EkhuP9SLwEtZ8tadunxvzy6uQRYL5zhjwIMuWA98pYWU
 R6dBJNOE2hGU8AdLVidGWVQjSoV15F2Nc93f63DXmkKG3PZnFT+orKBUaiZ1ht2rL+4Muo/Ng
 CD3hrREsrjhsiV+3gtfAiNm6XZiZB83TKk4/biMaOyJmNkBOa3ARI0okVq4K5WLDcRZYd4FYO
 XrZ8QScdRj3qBTKE+mLpOQNl15cUiqQz7K8Ps4tVjbuF/zK7lPZucG9upA7EL2zFmSVGI02jO
 SrKLlsjbpVLLzUZ2WgUdM3YMJlLiouvmZ1T4ogpws046NDoSxKs8XMlMgfJlngALPSSiVOYfb
 wgGd6RsdH8zrQqV/x7rJtP/cZlLs0hoklvdv3EMVVAQtSSrCjxgnljvE/QIU4jsaeKahSCt6A
 1CfozmDV2E9lnProvVo6ZLIko2pvJrmQImerV+Qn4fGxVEo80KMijYbgldDrhJttQXDyjusVK
 HPNf8PFGH9xG2n4cptU+agAuuasXYv/KsfI7iCYTf1sfB1Cbz1r32cvbGh1tJuRtyTIHB4H7p
 Vj/khk3nmvKKpBBokOZ9YbEuVz859g4Kb1kIM193VsFsRgchNFA/3iOItZZrCd8N/5m9XNCYO
 qnmecVGt/Ws4YhwyzAlN0ZrgiznKCmazrhdZ6w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-20-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ppc/signal.c        | 34 ++++++++++++++++++----------------
 linux-user/ppc/target_signal.h |  2 ++
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 77f37b9f0131..c37744c8fc55 100644
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
diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
index 72fcdd9bfa20..82184ab8f2ef 100644
--- a/linux-user/ppc/target_signal.h
+++ b/linux-user/ppc/target_signal.h
@@ -24,4 +24,6 @@ typedef struct target_sigaltstack {
 #if !defined(TARGET_PPC64)
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* PPC_TARGET_SIGNAL_H */
-- 
2.31.1


