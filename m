Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F465BBFA3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:50:51 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0JV-0004aH-PT
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Es-00071X-PH
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:55001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ep-0007ad-No
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530356;
 bh=eOtm8/SMP826aLASyoJ4JmH78WO5pl6ShNUkvz9YRjc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=O84RgzLJBlAJLW4lndpDy4HnW9T/yI1HWSLgRbSNZgsIdBexWtsws6PseS4oS7GIw
 Y6AWTBoIlQYEIw46MsPi1vCeDyissGQmSeXoM24p4NaEHRU01iALm/zuCLDLp/ZGvM
 /J56ABIGMt1sEnNnbjkpUgFzPaRThhix2jHSH+dk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1olydM39QS-00Vztr; Sun, 18
 Sep 2022 21:45:56 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 03/12] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Sun, 18 Sep 2022 21:45:46 +0200
Message-Id: <20220918194555.83535-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z8VSPQOPb3KPlXG6iouhHw++hJo7mDt9pAEUvJ2nVMNP5hlwxDs
 t7a/TJZK+Nzlydb+VSmCD7mSoBRNfTV3DsZJiqBGD2pJzS0/azO5ZCP5Uko7FCh53RM88k5
 DmdopYpOzM3fdm+TFaZdovzDgl+fdEtWrGJ7dSLcdGEQSmNKj9RohOn5JkoPgowkoMM9vv3
 MvYN2UX6K2DWg78N7UTpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HEfHolHnD2M=:/WS4Z0MHnp0kKiFbCddSbv
 /FkZYTw80qOqXNCTNgkYGCsAq46rGZYbPdLBfo8XFDbrjaWs6+5PZn0VBNVhD3p3PSrLpgyO4
 7VRHbN0t50cwo8zRrLzKlq2/EvCveNFc7s8ZnKg3+hf8snj3KxP1t8zINagBFmX9gHrV2/bEM
 BhEKK7tIgttCJr0MSlN6Dfv+uvEfxIMAyLuBzLKeJoVVX6UvzuggArVEKTMUXt2F1JkuJvyYu
 N9tE/tJeb26JpVuh4NkSYYPtKehrHkcOqdFu7PIxpKKDHRbP2M/yxmVSvAN3k7YGReG71juYB
 +HdD+Ma/2DciIs+yM9QmCDuO1ZH59Quk/sysZKRAJ7nFPd98LyeZ35IYEibERNifgO67kg0C0
 sjNZ64aATs7gC0aHYOPLNzdptL1Kka/wmVqbzxAYV6QV220DQrIlPJ40Ulmimyn6/BIgB3wAO
 eibsrP9pyyJb8n43r0eHtxNhr1yuMVO6aBK9X3jQXYOKerdZJU6LT82Bv1+QDaBTj66VOv6yC
 +Gu2WsY1MgneoHuMW6Zfiz9OkLvIpZtdEDpDfCEEXH99Ti3hhvWkrDXnuXxL6DuvShoyprIFf
 X8H1iR5L1AEmGFnOG+r/9TAn3PTA5Wco2JII4X9plR+G3B0GSdqVcvUYUE3ewq+ohGmBCQUVM
 JViHWCrk9AeYTcZEnIKuft5DjymyE174BD4qi7qUojDp4y6lUNcMyuXkRC3uNx63hvmLV6K9C
 vbuXgfExKqLjYa90pFXDhLfD+dRDc5nuoc6GhXPnOB7AhDfr2+q070Sye0Ob1nSC0Rp4kASmF
 JF3EuC1vveOsGA5ESE2IQyK3qnPL3+bVedB/Z26rg3e8NQKiNHZrV4pvCU1HjGktMzatzyF5J
 8WLFI4fkAGWDgZjXIuCpf5i1WkNT068nX3D8/2ejSZ1819fpNWi1kkoEwtu1H+Ijt7povd2IE
 nG1BO31Kty6+rjjKtRQWL1ttl3cMKRYTLarX6zibBrGYjcu+axer+9MAYKcl+Q+d/VCPHeTAR
 CCMGPf0/G1N9916kEV/pxOiY5rG1T5BloYDWaDC8G/5ZwebxhirqG0yNrTqTXndfepL7YpetQ
 QuPdwuAUR9XckpI0U5lKL8aP7Rr2gNco50hXZEpictZqVrFVTOyxJMVlgugwSbGx2dgHsZcsd
 MDVN4bGGkcNPsJHN/5JYsp1YZR
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

I noticed those were missing when running the glib2.0 testsuite.
Add the syscalls including the strace output.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 28 ++++++++++++++++++++++++++++
 linux-user/strace.list |  9 +++++++++
 linux-user/syscall.c   | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 816e679995..5ac64df02b 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3317,6 +3317,34 @@ print_openat(CPUArchState *cpu_env, const struct sy=
scallname *name,
 }
 #endif

+#ifdef TARGET_NR_pidfd_send_signal
+static void
+print_pidfd_send_signal(CPUArchState *cpu_env, const struct syscallname *=
name,
+                abi_long arg0, abi_long arg1, abi_long arg2,
+                abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    void *p;
+    target_siginfo_t uinfo;
+
+    print_syscall_prologue(name);
+    print_raw_param("%d", arg0, 0);
+    print_signal(arg1, 0);
+
+    p =3D lock_user(VERIFY_READ, arg2, sizeof(target_siginfo_t), 1);
+    if (p) {
+        get_target_siginfo(&uinfo, p);
+        print_siginfo(&uinfo);
+
+        unlock_user(p, arg2, 0);
+    } else {
+        print_pointer(arg2, 1);
+    }
+
+    print_raw_param("%u", arg3, 0);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_mq_unlink
 static void
 print_mq_unlink(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index a78cdf3cdf..4d8b7f6a5e 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1664,6 +1664,15 @@
 #ifdef TARGET_NR_pipe2
 { TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
 #endif
+#ifdef TARGET_NR_pidfd_open
+{ TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },
+#endif
+#ifdef TARGET_NR_pidfd_send_signal
+{ TARGET_NR_pidfd_send_signal, "pidfd_send_signal", NULL, print_pidfd_sen=
d_signal, NULL },
+#endif
+#ifdef TARGET_NR_pidfd_getfd
+{ TARGET_NR_pidfd_getfd, "pidfd_getfd", "%s(%d,%d,%u)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_atomic_cmpxchg_32
 { TARGET_NR_atomic_cmpxchg_32, "atomic_cmpxchg_32", NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..ca39acfceb 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -346,6 +346,16 @@ _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
 _syscall6(int,sys_futex_time64,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
 #endif
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+_syscall2(int, pidfd_open, pid_t, pid, unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signa=
l)
+_syscall4(int, pidfd_send_signal, int, pidfd, int, sig, siginfo_t *, info=
,
+                             unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_getfd) && defined(TARGET_NR_pidfd_getfd)
+_syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned int, flag=
s);
+#endif
 #define __NR_sys_sched_getaffinity __NR_sched_getaffinity
 _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
           unsigned long *, user_mask_ptr);
@@ -8683,6 +8693,30 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
         ret =3D do_open_by_handle_at(arg1, arg2, arg3);
         fd_trans_unregister(ret);
         return ret;
+#endif
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+    case TARGET_NR_pidfd_open:
+        return get_errno(pidfd_open(arg1, arg2));
+#endif
+#if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signa=
l)
+    case TARGET_NR_pidfd_send_signal:
+        {
+            siginfo_t uinfo;
+
+            p =3D lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), =
1);
+            if (!p) {
+                return -TARGET_EFAULT;
+            }
+            target_to_host_siginfo(&uinfo, p);
+            unlock_user(p, arg3, 0);
+            ret =3D get_errno(pidfd_send_signal(arg1, target_to_host_sign=
al(arg2),
+                &uinfo, arg4));
+        }
+        return ret;
+#endif
+#if defined(__NR_pidfd_getfd) && defined(TARGET_NR_pidfd_getfd)
+    case TARGET_NR_pidfd_getfd:
+        return get_errno(pidfd_getfd(arg1, arg2, arg3));
 #endif
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
=2D-
2.37.3


