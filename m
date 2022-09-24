Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9775E8BF6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:56:04 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3lL-00051T-RP
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3at-0004Lo-SU
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:48391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qq-1L
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019904;
 bh=ljqkKXznJzX9TgABKStdjkw7mBu4gZIwRnYEMPdc0Nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ck2J9vX8ol5SL4sOEDcmi2dz0MjgVnUT6Htm/95nbbJSgwn4Dx/PnhZHGRu/Y8N+T
 2lqVXev2p27Ot7P3JyAeLBwE+97PHm87xmhnlfL+XGFgeqy32sEEbbiH6lVdXl9vNH
 fmgHvaWYTHjtEt7A7FfcVpvApVFAc3pwNlcxzXvw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0Ne-1p04gS2y7M-00kMAg; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 3/7] linux-user/hppa: Add signal trampoline for hppa target
Date: Sat, 24 Sep 2022 13:44:57 +0200
Message-Id: <20220924114501.21767-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SjGi00umzcJqHOb6307zBG9ZrpcKPI9HaJY5CHtU0YpqINJCVHi
 9o2D/fPR4DuIMLP65UVo1V/ZVZ8wCGobWV1UWrKNfTaPNNRT2EPtvEGneqVX1LX/a0jbysz
 0u5GMDgLV3qTUM6pKwc3zZHV4E/KRLacPVKGfEQkIwe4V3oJmBWw545kL+2IAOvbVK9yY1n
 Nz5Nj2el2Dz0iW+P23fQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DlWbEM4nQG8=:JaHedRlZpoii9TAb074rlI
 s6XuSHAoq7Jv2a3aAmImtLPOzYSLjgwdc/x3EK3Quy5tAGiG3nBOR+JZGTQgiKPgiMYEnLgVg
 t36kb4Ay3o4q2RInrFD/14SM5SdMhjpJNP8WdT6FU5rhv+DBuNlmtPU4C1iO+25lpLJBf044w
 cnT7BGJb6PJWuqOXwkUhYgWGvTo8wMzKPB/BZMOj0hMtE+9P15YfThszHbHYl7g7ULyimfciq
 4fPZYDAY/yMypJt/5Vl5HcXtdtvYuHiew3jpO3cLCfQDalZslAsOFbxNADI/YXPVW0KTErcxG
 BK0nTaAXCVz8IBC9gZrImATLYQJR5ZNDnMGsmSI/CXXsP85nO4Pg3DEgR3r0RGw4ky1Sn2Ifb
 q1VGAYSwaPrFCT0vq90REXTs83mq9X0KDoBo+rtwKCWwmVxZwBuukv6w3WOMh204dujXdo8fV
 I0QGqQrzJEBSxN6NVmWeV1REhjDRNolYJ9dTEPtw9LaVW26cTtH7hPHetCBlYxDO+elyOv6RX
 SEuYa2GeQEMO5xmihsm7R+6oLcRd/dTlRLp2vJg3GVBOdLWglyCEjT18Iy11mXqdPD+wqBLny
 FXn7lEABeyPhK1x/3OuY8AIbiqYLR6tp+U94zbdMcUb92wyBbs5qzUNzvlij/R06XOGM2J+Yq
 Z24ugFIJ5c5IRIlJBKUJYyXzavBAfDtDMOh7eGKcCKocKmsbz5icynXr08cd9DwdBiQpp9SeR
 BMrFYdbkyMNbauCfyh2MQXWs691rZiUqebyZz0rOBZLl5S+p0GjEAOKPygqHZvRNvNKOzY3GZ
 RyYkzZ3gwe4/jsrY+2uQCxzUHX34oLz/U2uRJ7tjjtT+wY2IMWP66QWtGvDupflCmEKlOSiMn
 Xdvlif+sk+lNzeCM/gAXaOtHTefKPhuISHt50IUsgSUiis+Y8//jQzZMb6HnvZGfAScJ2V9jg
 T4QwbIY6Ja0U00rHp7l9J6vtQk0vMu7hW/S7TaC5IiAgLPBGi+B6wRrdBYGiIS1cQmDgcQNeX
 0Y/4tiaMKJGtALBfzXuunWXz6S/Eq57iWr5ufPVbUA3xqc5cWMzVhE306K1wBa4Kl4PTp1Lk0
 L+U1NpU+iFWdKU21BltuJlFvHjbeRbdm/dMee/mfzN+hGbj+hEyMG8gRx8DvFnw3bTjjNMO/6
 puT3UZQJ/HghzQMS6eLosYh6j5
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In Linux kernel v5.18 the vDSO for signal trampoline was added.
This code mimiks the bare minimum of this vDSO and thus avoids that the
parisc emulation needs executable stacks.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/hppa/signal.c        | 41 +++++++++++++++++++++++++--------
 linux-user/hppa/target_signal.h | 14 +----------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 962f551c04..396e310dc9 100644
=2D-- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -41,7 +41,7 @@ struct target_ucontext {
 };

 struct target_rt_sigframe {
-    abi_uint tramp[9];
+    abi_uint tramp[2];  /* syscall restart return address */
     target_siginfo_t info;
     struct target_ucontext uc;
     /* hidden location of upper halves of pa2.0 64-bit gregs */
@@ -101,9 +101,15 @@ static void restore_sigcontext(CPUArchState *env, str=
uct target_sigcontext *sc)
     __get_user(env->cr[CR_SAR], &sc->sc_sar);
 }

-/* No, this doesn't look right, but it's copied straight from the kernel.=
  */
+#if TARGET_ABI_BITS =3D=3D 32
+#define SIGFRAME                64
+#define FUNCTIONCALLFRAME       48
+#else
+#define SIGFRAME                128
+#define FUNCTIONCALLFRAME       96
+#endif
 #define PARISC_RT_SIGFRAME_SIZE32 \
-    ((sizeof(struct target_rt_sigframe) + 48 + 64) & -64)
+    ((sizeof(struct target_rt_sigframe) + FUNCTIONCALLFRAME + SIGFRAME) &=
 -SIGFRAME)

 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
@@ -118,7 +124,7 @@ void setup_rt_frame(int sig, struct target_sigaction *=
ka,
     if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp)) {
         sp =3D (ts->sigaltstack_used.ss_sp + 0x7f) & ~0x3f;
     }
-    frame_addr =3D QEMU_ALIGN_UP(sp, 64);
+    frame_addr =3D QEMU_ALIGN_UP(sp, SIGFRAME);
     sp =3D frame_addr + PARISC_RT_SIGFRAME_SIZE32;

     trace_user_setup_rt_frame(env, frame_addr);
@@ -139,14 +145,9 @@ void setup_rt_frame(int sig, struct target_sigaction =
*ka,

     setup_sigcontext(&frame->uc.tuc_mcontext, env);

-    __put_user(0x34190000, frame->tramp + 0); /* ldi 0,%r25 */
-    __put_user(0x3414015a, frame->tramp + 1); /* ldi __NR_rt_sigreturn,%r=
20 */
-    __put_user(0xe4008200, frame->tramp + 2); /* be,l 0x100(%sr2,%r0) */
-    __put_user(0x08000240, frame->tramp + 3); /* nop */
-
     unlock_user_struct(frame, frame_addr, 1);

-    env->gr[2] =3D h2g(frame->tramp);
+    env->gr[2] =3D default_rt_sigreturn;
     env->gr[30] =3D sp;
     env->gr[26] =3D sig;
     env->gr[25] =3D h2g(&frame->info);
@@ -197,3 +198,23 @@ long do_rt_sigreturn(CPUArchState *env)
     force_sig(TARGET_SIGSEGV);
     return -QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp =3D lock_user(VERIFY_WRITE, sigtramp_page, 6*4, 0);
+    abi_ulong SIGFRAME_CONTEXT_REGS32;
+    assert(tramp !=3D NULL);
+
+    SIGFRAME_CONTEXT_REGS32 =3D offsetof(struct target_rt_sigframe, uc.tu=
c_mcontext);
+    SIGFRAME_CONTEXT_REGS32 -=3D PARISC_RT_SIGFRAME_SIZE32;
+
+    __put_user(SIGFRAME_CONTEXT_REGS32, tramp + 0);
+    __put_user(0x08000240, tramp + 1);  /* nop - b/c dwarf2 unwind routin=
es */
+    __put_user(0x34190000, tramp + 2);  /* ldi 0, %r25 (in_syscall=3D0) *=
/
+    __put_user(0x3414015a, tramp + 3);  /* ldi __NR_rt_sigreturn, %r20 */
+    __put_user(0xe4008200, tramp + 4);  /* ble 0x100(%sr2, %r0) */
+    __put_user(0x08000240, tramp + 5);  /* nop */
+
+    default_rt_sigreturn =3D (sigtramp_page + 8) | 3;
+    unlock_user(tramp, sigtramp_page, 6*4);
+}
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_sign=
al.h
index af6c2fce58..190bb3d653 100644
=2D-- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -70,18 +70,6 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM

-/*
- * We cannot use a bare sigtramp page for hppa-linux.
- *
- * Unlike other guests where we use the instructions at PC to validate
- * an offset from SP, the hppa libgcc signal frame fallback unwinding use=
s
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
=2D-
2.37.3


