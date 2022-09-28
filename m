Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949705EDA1E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:33:52 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUNy-0005Lz-W0
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEB-0008Dt-OD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE7-0008BU-6J
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MX0Xf-1okSWO1gmv-00XOLj; Wed, 28
 Sep 2022 10:15:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 20/38] linux-user/hppa: Add signal trampoline for hppa target
Date: Wed, 28 Sep 2022 10:14:59 +0200
Message-Id: <20220928081517.734954-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GaeCOCjD/AgaZYVitv0iVioUDyII3FBeivX6t5fPpyBc0kZ2HoM
 OBVxB3oOgiCO/cBi1L3mfkv4tqv/wpO2X/RWNM+hP9d7JQmS24dqOpm6XBZ1la3/skjvf6J
 d57GrojWzjVzWf9PxL8jG/pHMiYKN5DtzzA2VtvWGd2bUqdc81ZMLGLHTYcgmAULmDUu6IJ
 jUi6SyPFxMisjDiz/ov1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vy6AQ3iG8rk=:8RUSUDZtmEt+/i3sS9M/B3
 hItpSpVNV0C52/AfoMPMvCrUpHiU9SEMnRbNJOlqLRUuXJlBWnwN+TttrPd0hW4p8QcTsCjz4
 ZhDUH6WdvAL+DS8YUnW4EgaL4Zq5QbA1A5zkyJAe42tbTuXz0fYTYJbcrwAFMG5PYBNhk4WbK
 442iuKeaHjHp4P1Pp+l9tS+Z/C800GgvOvDNVzwyZlTnaSoIJwPCgCpGZCl4nUNdDo724R6Sa
 8L+2mr7cScH5UQnfXlv0lLc5M2wcEp1VZZy+AlFjFBM2pFolG9aYRHR6bqs2vGxlVogyrnl8v
 kHusi8f/6Jtw8e22w2fQQyTC1cf/LIu7se231qaSSJvjGggCTnZZ3A2AO8wkSjJ90BQKYIdPy
 W4w0mOYmrzsVw52XtJuC3In0DRfqImpsvf56GoAulsRNkrqyBgSPmWEPGo5PRz7JpfEr5ae6F
 d7/TGR5f5XfRRr+10wihFX9WBHineVoHvFBQJr+rOowFbJ9+mCFkc6up7T2KvhCHA28X9BFnx
 COV9K+6hAUJKmf3xPv8z8kl+dPW5tvZAjtbjdMn41fFpIm+LGZpTEL2sXB/ePlxrfelgmR3BB
 ym5Z5G490X2IiwcHkgHw3aHwrvyXZKda/mA83TR8zp0z/YoAvC3V/dylpqmGvw4MFWe2BV11y
 8wzA5fztOvuk7aWYCEr0W54Jg3cdKfY32L0BGu2C/xt3ZXYXwjD0asB6r8mPgHBwK8JP8VORq
 YfrCF6/8LIgvJwCGv0bZl7A53pwAf6P51ZZl8LxaZUCBTH7WXIxFfsbzuORm+a1RP1eNeVced
 kRe7uA2
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

In Linux kernel v5.18 the vDSO for signal trampoline was added.
This code mimiks the bare minimum of this vDSO and thus avoids that the
parisc emulation needs executable stacks.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-4-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/signal.c        | 41 +++++++++++++++++++++++++--------
 linux-user/hppa/target_signal.h | 14 +----------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 962f551c0429..396e310dc92d 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -41,7 +41,7 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    abi_uint tramp[9];
+    abi_uint tramp[2];  /* syscall restart return address */
     target_siginfo_t info;
     struct target_ucontext uc;
     /* hidden location of upper halves of pa2.0 64-bit gregs */
@@ -101,9 +101,15 @@ static void restore_sigcontext(CPUArchState *env, struct target_sigcontext *sc)
     __get_user(env->cr[CR_SAR], &sc->sc_sar);
 }
 
-/* No, this doesn't look right, but it's copied straight from the kernel.  */
+#if TARGET_ABI_BITS == 32
+#define SIGFRAME                64
+#define FUNCTIONCALLFRAME       48
+#else
+#define SIGFRAME                128
+#define FUNCTIONCALLFRAME       96
+#endif
 #define PARISC_RT_SIGFRAME_SIZE32 \
-    ((sizeof(struct target_rt_sigframe) + 48 + 64) & -64)
+    ((sizeof(struct target_rt_sigframe) + FUNCTIONCALLFRAME + SIGFRAME) & -SIGFRAME)
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
@@ -118,7 +124,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp)) {
         sp = (ts->sigaltstack_used.ss_sp + 0x7f) & ~0x3f;
     }
-    frame_addr = QEMU_ALIGN_UP(sp, 64);
+    frame_addr = QEMU_ALIGN_UP(sp, SIGFRAME);
     sp = frame_addr + PARISC_RT_SIGFRAME_SIZE32;
 
     trace_user_setup_rt_frame(env, frame_addr);
@@ -139,14 +145,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    __put_user(0x34190000, frame->tramp + 0); /* ldi 0,%r25 */
-    __put_user(0x3414015a, frame->tramp + 1); /* ldi __NR_rt_sigreturn,%r20 */
-    __put_user(0xe4008200, frame->tramp + 2); /* be,l 0x100(%sr2,%r0) */
-    __put_user(0x08000240, frame->tramp + 3); /* nop */
-
     unlock_user_struct(frame, frame_addr, 1);
 
-    env->gr[2] = h2g(frame->tramp);
+    env->gr[2] = default_rt_sigreturn;
     env->gr[30] = sp;
     env->gr[26] = sig;
     env->gr[25] = h2g(&frame->info);
@@ -197,3 +198,23 @@ long do_rt_sigreturn(CPUArchState *env)
     force_sig(TARGET_SIGSEGV);
     return -QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6*4, 0);
+    abi_ulong SIGFRAME_CONTEXT_REGS32;
+    assert(tramp != NULL);
+
+    SIGFRAME_CONTEXT_REGS32 = offsetof(struct target_rt_sigframe, uc.tuc_mcontext);
+    SIGFRAME_CONTEXT_REGS32 -= PARISC_RT_SIGFRAME_SIZE32;
+
+    __put_user(SIGFRAME_CONTEXT_REGS32, tramp + 0);
+    __put_user(0x08000240, tramp + 1);  /* nop - b/c dwarf2 unwind routines */
+    __put_user(0x34190000, tramp + 2);  /* ldi 0, %r25 (in_syscall=0) */
+    __put_user(0x3414015a, tramp + 3);  /* ldi __NR_rt_sigreturn, %r20 */
+    __put_user(0xe4008200, tramp + 4);  /* ble 0x100(%sr2, %r0) */
+    __put_user(0x08000240, tramp + 5);  /* nop */
+
+    default_rt_sigreturn = (sigtramp_page + 8) | 3;
+    unlock_user(tramp, sigtramp_page, 6*4);
+}
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index af6c2fce589d..190bb3d653b6 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -70,18 +70,6 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
-/*
- * We cannot use a bare sigtramp page for hppa-linux.
- *
- * Unlike other guests where we use the instructions at PC to validate
- * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
- * the PC address itself to find the frame.  This is due to the fact that
- * the hppa grows the stack upward, and the frame is of unknown size.
- *
- * TODO: We should be able to use a VDSO to address this, by providing
- * proper unwind info for the sigtramp code, at which point the fallback
- * unwinder will not be used.
- */
-#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.37.3


