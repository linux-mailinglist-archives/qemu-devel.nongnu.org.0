Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47C5A29D0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:42:49 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaXo-0006we-Rx
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAm-0000aT-5c
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:00 -0400
Received: from mout.gmx.net ([212.227.15.15]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00054s-31
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=Rm37/UMtMZy/vrc/Mh4Erf/0gMnHLsIB/UJJVZ50obo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RKG0/9YkJiAgwX1e+L3yEBB8Pw1yQqAPQd1pRmYUljkblLq6cyTLVPIxEHnEixR+B
 6vbF6m/wRvQnwVgKjdkkQl7NAcDp184y+n7R5gwWn27KrJxNtjr1qzdfWoMff7cTH/
 3n/n+yRPOQ//Fcku2PlWh9+f9DmblDW2vMyVeGec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1oormt2daH-00NSDP; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 04/13] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Fri, 26 Aug 2022 16:18:44 +0200
Message-Id: <20220826141853.419564-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lYz7os+2Ot5XYZ0+JTUfz6mfB9umwxXXmb9x1CPh/Wo2Tq/9zUn
 rr1bTGtJt1DNDZD1+u3XQDh7KB1QM5jKdV0DqRmv0LuohK7dN4/3pGo1MGX3aOL7HiqOCKe
 nKmaLwtlfjeBERIhRArWG38Su732SnY6Y4ricI+prruPqOfOjazBQChifEsf35GkysmHJ8L
 oiSEogAp8msK1VDRaQmzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QYvPT7KFr+Q=:WhogArtIAgrk06tTbSMRbP
 j1X1FcSv0rLT+W2fNpMmr7l+GO6i0ZLJh1gfRyi3I1Jwon8zgXG/hhzrLmgQc97Rlfj4IJBIG
 RVHUY6LpVj3VELIjrHjc9qvaFWyIYaHmlzt9lQwToYDKuI+okNBMWo8jkQKaefUfMkgMPecd7
 U5LOwk9Y/niKga7ueF++465BobSg7jzRL9F67YYDXZB2DmnEnxCnq1eMTUxnch7C4UfNWZ6Qd
 XhxOxoLx5OGqWryZtzAeHRZ2y69egunwkoiFU+9vIAlgtlTuISgLPfiv1aDs6b4U0I8sUuAQZ
 f9YGCpkmUsOb+hLelVBNFkJCfqb7BgI+ICjguqqer+mBZtjCUoqoDZXCfbu2FBoYEXg1m5aH9
 7MGuJLgthAvcgkR+sl4JbE9/5ioqqYtxA/nNoAcYpG6BcT8du+wjq4cEnwjqAqhnKtNua8O38
 ZxduevNIecTUTQP9I9nRNs0YwMsOmpKNWePzBS/bhNHoKi4cnWfcFzODyOTcvjkHMoqQ8LS67
 /NZtaNms2HLAkykDUnNxG57iwMvWxmqI0CluNdIvazSEUmgqB3v9uMXASqkmQX2UhVCjpQ91V
 K2vzVNjz09YzXYYoGkvadoQNANUg3N1XwYvtv6Szh/BMAHDqZQsqoEUG5P9tVNFSDISTVgitC
 uycEi6QznalyPeMsuTHsjb+wq6sLsADPSZrQrEfINB7HOnOJoBl0D45iocpXXWpw80E/aJysZ
 0Uk0qqSJFHaujfpxG0vKeFnGoCJB0nYJKRcUyhdKVF3iN/lkYL0oKhT5ccIkMmJWppwKmMha6
 GGl0WQKAkyRtFhVdd+yNWRPERhF/B7M0dMQhqT0h92SLcfnEbGRstfCenhK/gCS5R9qnDxxNR
 vCP32ynL+LxfWVExuOvXVp15w3Ez42vFp7PeVFGoSAammn607GzgXIeJPEg4sHNSgVGQH2Mcm
 xWRdwZZREc+zEKPLRGsQDEnCWfZunglOuOtsBN4yidHxfi7xnc5d6z/TNVp8E8DHp+jrL9xDa
 8ebpeurnKIU9DypixCxYb1dp+ek+n1CAndT89aZOxg1UHvxjpCW12FQ6/nWuULTWSnbW0hVz8
 l+jlPDI/HHTscnybxS27Q2f+cHK/7U7dEgfPUlCHUDzfKije2oRmeGOLQ==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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
index e8c63aa4c2..86b2034c81 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3316,6 +3316,34 @@ print_openat(CPUArchState *cpu_env, const struct sy=
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
index 6e88da7fad..7a69152db7 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1667,6 +1667,15 @@
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
index f51c4fbabd..a1e6d4ad53 100644
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
@@ -8686,6 +8696,30 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
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
2.37.1


