Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5665B7ABE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:28:18 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBZx-0001IK-VK
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLn-0008Ll-I1
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
Received: from mout.gmx.net ([212.227.17.21]:57269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007ef-TM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=Ny5Bq2KxQ3ykP1Enntmr9piHIvdc1WrGIrxLctjRt1I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fyVn7bML2gKNKu8PJFrrASiLu3cnxB5rb+SxcPmZpyaYGejXMkuRAis+ewKqh7EAO
 08BJ3Q6XISOPfS3/euIf6w9v+rTrv+7PmhB5IxY5q4Vu0Zj6siFX43r9Yc85pVmlvq
 9T0f+AFpoI4pC+X+TKgLn+vwV5y3GORgGHnwJkm0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ygt-1obDLz1uHL-0035Ny; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 03/12] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Tue, 13 Sep 2022 21:13:12 +0200
Message-Id: <20220913191321.96747-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MHuvEmB/UY+VsTnY7qBTFXNVIpB9ESLfv3zF8urq193WU1Qasaf
 QJQgEQABLjOv08cw2evtHqk+32lPI9QIRMI/b2i1rgtmG62MJc3y8CxUy71tcTBKzTe97q+
 DurzHs5XHM9kVUbnsh0gjv7InfBYxIqQmF6NledZORcr2b0k5KpCtPQTiE3Rlj2xORtuqUl
 wF055LrvTxR6VObACUfMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vNV1q2AYqDc=:yn2oDJ8XD3x4m7Mn52/7mU
 Q/hPJYxyOUp+p096A12DOkVhs+upQmA7eR5kFvrVZliwXJGYfoNnA3mWge8e+j4GN9Ep0XHz7
 iT8C6RyAvcsXpQWzbD6DsbThsElPrbJC8p8LohZAsVZSssSO+Pf6hkxtNvXpixF305ikeqack
 tqZ3rIkH2Mueydi7iZYNcypNxrQFhDBT/IIo4KlyoN7HARr3UI4jr2kB+ubf/Z84L9NoJZI6R
 j72bSlFg8OrI5mxJIHDsuzgiOjEWMYFD5r2rNhPNvISzqBQmKlAmCceqAu7EDXtPFbm9R3h3Y
 KuqYH5BSDBaAVxmU7XWNgImDApWzfkrmH+jly/RG097CKr1O01aHUMd+3WiyO3265Kt84JXAL
 3DRhbUkVz3VQAU6inIlJAbWfVReoPn8B/Jf9HBbj7UmBXCuy/G7YupH+bBJDmu5wx6DVqOe1R
 rOnVDLrntO0IKDKqmR4GldvJ+GCohpxBmMhyuSEEU64/VMaEBnM14gZPzAZ5VDuYjpGn/1JqB
 iMxr3WkCHmo+8rSLBPjk6DGPEqpD+W4NqsQE4tYCZsQw4LeJZVaNngooS032Ci+girMsHNyQT
 wRLXNR+IE1bplmor2fcPhBPTT25hV9L0okUGBehB+TdzrHeM4YxgYfSR0nm6OWFm8Mqo1bUCb
 izdR374coruTAFGv55qsCBRKFLdb6TrBwfesXjVKbq4z2JUMwS0IEMd/1GeWhTj/bt8O8kW9P
 Wd+K7CmMiyNZ0XOOEwnZI0RdLIy6fzSl+Cch0WIEQxiZidVc56KlljVz9x4zlJzDCegJ3vUO+
 6eAf/MztHgPtZbPZvIKgj78faO1pmUkD1LayNchEC0uIq2hjjWB7yOsmZfeOL+OuYle971Ylm
 tk65JJ4/M4ArDkTLKp8J/otQ+S9cL2wS55z2f1mxkWVldLA2uKyL0QvdYoSVN7nM7ZcTZUY+3
 GmXXjaJuJtTNtf8ikTVzg2I7xI4EZfqaxmBdZ6BUFTjeXqjeJsE6wusY6YEos/qRkt/wnaNZA
 wO3rMbCGU2w6JwjdwqDkPZpDkaPmiqPcMUn91pABvsc4SfLSzf+gabrF5RKNAlslKssKHC9E2
 RSC9EO5EWQv7PHPa6HHk6410gVchJLGt/NLI5gjkMB/c4EL5ZVxgBF6bcKKAxbyVX8+4k1DRo
 OD2exjVCKq/3qZ2x32y0Xg9l83
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index f409121202..df018f0e32 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -346,6 +346,16 @@ _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
 _syscall6(int,sys_futex_time64,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
 #endif
+#if defined(__NR_pidfd_open)
+_syscall2(int, pidfd_open, pid_t, pid, unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_send_signal)
+_syscall4(int, pidfd_send_signal, int, pidfd, int, sig, siginfo_t *, info=
,
+                             unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_getfd)
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
+#if defined(TARGET_NR_pidfd_open)
+    case TARGET_NR_pidfd_open:
+        return get_errno(pidfd_open(arg1, arg2));
+#endif
+#if defined(TARGET_NR_pidfd_send_signal)
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
+#if defined(TARGET_NR_pidfd_getfd)
+    case TARGET_NR_pidfd_getfd:
+        return get_errno(pidfd_getfd(arg1, arg2, arg3));
 #endif
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
=2D-
2.37.2


