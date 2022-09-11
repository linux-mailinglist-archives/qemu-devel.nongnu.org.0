Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394335B5099
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:32:55 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRlG-000356-AX
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXX-0002S4-Dv
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.18]:45461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002lJ-8k
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=Ny5Bq2KxQ3ykP1Enntmr9piHIvdc1WrGIrxLctjRt1I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JRTfWvlSEjOYzxbovzf/wNIMeHC5H+HUgtB4bcnfx03JejABdJIzbmlylQ3oGry/k
 0/QgZfFWa7VaCxLqTBOc2nAPIoh/TYau+n3D+dRiRHS0HO8WqmUUBdSQex/KY670vE
 jLJAXnXlDkuF/N9ZZ4sOOsZoJVMdYur9ED1Y5qfI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlXA-1pDt5b3RQ6-00joeR; Sun, 11
 Sep 2022 20:18:33 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/12] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Sun, 11 Sep 2022 20:18:21 +0200
Message-Id: <20220911181830.15851-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AkDZjWbGJmYZSPGreK1pQsA1e/gS09TMYKnvmhAXSNnES7kmv4z
 lsbhaE39gnW/y+mI+SluQi1PJ5JppMHci/q389VU5Eyn/Cwn0GsZEFovCkfUFH6SNlTxOjJ
 k1KNm2+ba75kUZW5XFHVZBPZuzn1ac+rWBj6YuVYW2jHIYk5tXvjTdPhfG6SM+yq3mup7cW
 f5E3pD9FNd9yVm03oA2ng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ux+Klu/k9ho=:4s6yvBbYMtiFdzsOTYqfm8
 ukP9aII6QYcQwun6pyyYIgLMKIIeXYWfLJtQZqfVN2TGkVxDWUoWpflI62CX4TNLSMjNyWipv
 BryNqFzGsOJq6kJDWaDAtvLXO3AswiBM9GmKnhvKl3emgABGQqY/QpwSOLWwML9rq1Dtu3NBt
 Qu4kffAnkpcW+ZirLqPvjQVKG837t4CNXRkUk6zJtkmEn7882KjoCOoEd/MpdTu5R6lC5cljc
 1pwZAUJeKgUZITdfonfol7gl1pgPrsrrbPIR1KbCESJhTvqwTTT7yWcYebZXH84SdTkEBFebl
 iYGR5DNPiEN3iSFYYcUuuJlCnRhYJL8nXdUWMkX1MvajJeXQlJ03d6rYzqN8or2Es0+T+pa4o
 CuATkDlLB1K3atBMliQHEwHjVxxkC+CoMmcBu844eNYKOMfjwRDFzJjoe5ofFlf+l6ZLnfXLD
 Via3j+k2BmOAWReLCfXrfvIZq1WSlGy2cNPOX2ZYaTsmANw4NuaMr6kQS+OHSinMfxrcGQK1f
 An8AqyQIORR5nBE9yUR1QJZI8gkROwobGqIiYtfJpaM4WXi9WAA4aSldhoL5LVbUNjgcGkvyc
 2wVQqhlZW+kjQlsDt/UiBmhOQuGYXzD5/KVFfcwszTnoUf1m9Ki5sIe0pi3jqRwan8i/Fr7Q3
 8d8ZzwUgGNcDyEtB4p1KVwTmvHDk0/eTeA3xqhp060xJT/4Jp2PkKjvHlfJ3pCRiuZ2INN5zh
 b7NssMJVBbefdT7Y1EAXHHW6ModF7IqcqDV5M1XFoOVkTSB/DWtQCath6Xw055f4FZ+N2Y9Vx
 2TavKf5LgcwNmlQ1HeMAQofAPnKKS2c9qAI/Iq76FAnjbIcepFyMLepMvAWpy7Lu4GQ9JvCim
 9POwXV+/Ag6PHDkuUFbsT4IvJp4IMKLAonFuKHmlCXfwLP2SBcix+De3wck1QJ+2uqSDQxbiu
 A8hzkW0poMimSZ1IysA72MowOlnykB6G/Cj0JpjoyeJIf46z8jXpXQXI3d29SvX+JSTdacjQ9
 yOhr60PqEnn+6VHfna4re32uDVsKiCojCRB9Tc8A6mmWk8hHZ3wbeqiLs9/RUOtL4U9Et9326
 uibezof70IJhwiKf5Wjah6yV8ryJxaB2XMwSfhSP6iCHYpUEEF4c6kJalrdAM78OnfQc8Dm1F
 ZLqODtI/le851d2qiCgEwDctW/
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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


