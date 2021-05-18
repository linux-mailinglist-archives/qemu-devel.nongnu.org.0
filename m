Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05289387199
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:07:23 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lissz-0005HZ-UO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKo-0007ZR-1s
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKc-00076T-HN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:01 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1OsF-1lJxtv1x8N-012lfb; Tue, 18
 May 2021 07:31:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 31/59] linux-user/sparc: Implement sparc64 rt signals
Date: Tue, 18 May 2021 07:31:03 +0200
Message-Id: <20210518053131.87212-32-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9qQKTiCwx+AMz9H92rw+WPETdOsjBQVsDKIF5oBd9PUW9lS92/s
 sUT1QUpF0RSW4rI4uvMwiyMhwxZS/K+sOpGDq56o4juQFJ+3n7VBgLfq+Dn6JYPl8yHWaeK
 2m7GdC8XgKay74gdd3XQiuc/jGyJSnGciYbM2LR7UU865OZ58mE9I7lkaDMzRK6gZ2FIqLX
 8Q40pLdwMKBOIiYFjXsxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SVKOrcXhP0I=:K/tUwSNmN/+38b75S7t1r1
 kMLRwukGgdtCw1FdRCBwSk0X+cVwjfxQ8h6t6C0o8e0SaUtaVCK5cTVw+t8q0bm4sNT58PhRo
 QZ2Z/yjXkPdxJppRCaoHTSLKtkHD4N+qGQpmh0J1M3C9q3j9fVSYK9NdHI7r4mP0A6QNGGxeE
 cNMaSMyIsYFQhx/kH5rhnyxBv3gPL8Yv+qythzJ+3+yxnXRaOW/jE0Tiy3G7+K8xTaulnrTVp
 CL/yf4u+7fwwgdAqgax42Uo3RibJ/Fd2gAZsFq4VO4Jcqa7yynYSNAj/+sO4dxbLkAL1SWuip
 Q53OZ1acXz/D7J37OkdhAB61gKmnfHYU0ftb8cYCXv55XCDiia63kpruz4PAM4aU3eHaxRijt
 Anu/GcIvH0gwKt9H6xWUpuEW5BYIEuV8e+z9jNDGPaqQB3oZ5PjSXg5I5fITXWVozxPulArlI
 CWWJLFe4XmZ4eQtnDp8nXMCv/3o/45VdYU1TF57Qx2IqUf4mhJbfIuXWRLatAucs3bRUm8sGw
 NDFjvXmSV9cVXi9pyge0EM=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-25-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c        | 27 ++++++++++++++++++++++++++-
 linux-user/sparc/target_signal.h |  2 ++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 362993da0281..0cc3db5570e8 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -61,6 +61,7 @@ struct target_siginfo_fpu {
 #endif
 };
 
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
 struct target_signal_frame {
     struct target_stackf ss;
     struct target_pt_regs regs;
@@ -71,16 +72,23 @@ struct target_signal_frame {
     abi_ulong extra_size; /* Should be 0 */
     abi_ulong rwin_save;
 };
+#endif
 
 struct target_rt_signal_frame {
     struct target_stackf ss;
     target_siginfo_t info;
     struct target_pt_regs regs;
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    abi_ulong fpu_save;
+    target_stack_t stack;
+    target_sigset_t mask;
+#else
     target_sigset_t mask;
     abi_ulong fpu_save;
     uint32_t insns[2];
     target_stack_t stack;
     abi_ulong extra_size; /* Should be 0 */
+#endif
     abi_ulong rwin_save;
 };
 
@@ -232,6 +240,7 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 #endif
 }
 
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
@@ -291,6 +300,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
     unlock_user(sf, sf_addr, sf_size);
 }
+#endif /* TARGET_ARCH_HAS_SETUP_FRAME */
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
@@ -322,21 +332,28 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     tswap_sigset(&sf->mask, set);
     target_save_altstack(&sf->stack, env);
 
+#ifdef TARGET_ABI32
     __put_user(0, &sf->extra_size);
+#endif
 
     /* 3. signal handler back-trampoline and parameters */
-    env->regwptr[WREG_SP] = sf_addr;
+    env->regwptr[WREG_SP] = sf_addr - TARGET_STACK_BIAS;
     env->regwptr[WREG_O0] = sig;
     env->regwptr[WREG_O1] =
         sf_addr + offsetof(struct target_rt_signal_frame, info);
+#ifdef TARGET_ABI32
     env->regwptr[WREG_O2] =
         sf_addr + offsetof(struct target_rt_signal_frame, regs);
+#else
+    env->regwptr[WREG_O2] = env->regwptr[WREG_O1];
+#endif
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
     env->npc = env->pc + 4;
 
     /* 5. return to kernel instructions */
+#ifdef TARGET_ABI32
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
@@ -348,11 +365,16 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         /* t 0x10 */
         __put_user(0x91d02010u, &sf->insns[1]);
     }
+#else
+    env->regwptr[WREG_O7] = ka->ka_restorer;
+#endif
+
     unlock_user(sf, sf_addr, sf_size);
 }
 
 long do_sigreturn(CPUSPARCState *env)
 {
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
     abi_ulong sf_addr;
     struct target_signal_frame *sf = NULL;
     abi_ulong pc, npc, ptr;
@@ -416,6 +438,9 @@ long do_sigreturn(CPUSPARCState *env)
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
+#else
+    return -TARGET_ENOSYS;
+#endif
 }
 
 long do_rt_sigreturn(CPUSPARCState *env)
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 911a3f5af55e..34f9a1251909 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -67,7 +67,9 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ	4096
 #define TARGET_SIGSTKSZ		16384
 
+#ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
-- 
2.31.1


