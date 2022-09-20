Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3C5BF0E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:14:30 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamRh-00017v-BK
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6I-000469-0M
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:03 -0400
Received: from mout.gmx.net ([212.227.17.21]:41195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003I7-Hg
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695113;
 bh=eOtm8/SMP826aLASyoJ4JmH78WO5pl6ShNUkvz9YRjc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QEXJB8+YmprpF04moN6OpkWQiqQW9dlEMpCpMS+WmzWKiHPCqdk8X6dDcPTNq2VTP
 qKk9jOSmMOe/GrqiDYc3/a3I+XvCFADUmXmqlgXuWMv9Nc1da9w4vVKAr20ZqVM+Ln
 2PF7oO180a6vnjmxpR8Hv0KXM6zZjg2f0IkocvGs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1orfkd2FPK-00LYSJ; Tue, 20
 Sep 2022 19:31:53 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 03/12] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Tue, 20 Sep 2022 19:31:43 +0200
Message-Id: <20220920173152.199359-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O4+bcdrQe2R0zWqHQgjY6MgYVgoy1XDgAZ1F/KJuS2adnw7Rgfw
 KoyE+FPqnSFA3wydxqidBlBlsU4HEDrmAX2PAf5cJ6Nv9XL1C9Hr5+r9wRek4hwz6uA/TlV
 TS7fVZsTrw0H4Q1MLAn/K1LMgXbgX1RFOo6Ii2EE0UMnM6V/TJAuzUM5s5iAm/e2jeykejL
 bDS5ZDFjSUz+3N6s2FR9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mR5+OZrBUU=:itClqw1WfiImnII+qfZgsF
 WxZl+Bj3mMnAXuHdhF9iZN1l3jwD57CfMxa34ovAOli9Jan11IkJE1Ascl3Lk1N1VeK1zw85y
 j5utm5wpu5rYNz2r5dj3HTpWgFfYPXAquQRh6YHPM7oVZ+Yiv5SuuIbbdD2zRgO7nb3wrNHuI
 +Y2XZAlKAHiGiGu2pBxMnoIQ6Q+GQZ9+ZoNYpuz+Jhyk+jcEE1gCNd/nDhKjiFChhJ+LEvTOq
 zAIcel75LWAKwpVHuqGZPDZ/jSweZ9+byw0g6jaqmNn/Lvj8Qt/LSFBhY43S8DA/GCM1Y5jVM
 bi2i2J41DvVxcPJpMeLxdD8gdu9hGGJ4iQtusTNxpEOepUJM0ZA8QOOyuKPx4+i8v0XCUPmGP
 RZCdDxZoCD6L+deAo5QMPkrbuU8BV/46E9ve+5IbV+rEbPC9IUoXVa4b5oEJqYVFngeqbLbjZ
 K2kSo78fIxrLSmWOa6KgT+0+Z01ZlIsd6bZY5v3w4zcNtOgmk20fEsa06mrodwyP+jqw2J/my
 Hlad9ZvSV/RTy6xYmuwEilfxU5W5XQwBXp8TdHiIxHLRU5OobJ2xlYMofKFgQ4vep5adZslTc
 St+S/kpDzv53/4QQSSP6XmSBYPDjzqcYAIR/iPmixYZH623WGKM+z9GI7YUfKu30/Vh7Xap6X
 srWTQ2xe7HveafGV9sxcgMr4JP31dkJorLzMZDyGGiZx8MdboDnV56xCcAa8owcfV5Rgyi5Dk
 VeLreBYMaCn8MyBQJx2l7WuDjDGZyk9TESVTFiy8PceQiOW3A+YKaFoMRXYctP7en3WEhcnaN
 KVI7DdWbayqmbGX1uk2R3oJpa2I+8oSnU6wEfiuLcEkamYzAxt8j+gGejCDszYShuqFYNfBc5
 H8nF8brmjEWmm0ckBx9m5um5fJ9yR96XreeoaQBKfMbn3eUVNhgcoQ888NSNZPkisra7nx8+l
 3af7UI2zot6qR9RlfSmHzNNNLexeOHMMgJs7qzP26DLodu7lQRCgBNV+WrCWzroppUDnjiAJ8
 GqnWoBxgx4E0uzP9N3t32ePrKBa3PfTzoqaf1IDQ7fkvyAWNP0Nwvn75WlBx1nQuud2qOkdjL
 mGyK58kwvQfKMzZInGd9ueasBOi58D5jFTfj1Kmh62Ev8O1UJlYOfmciLAvvsMT3tLou32FEJ
 5HrK4pHpst7dmWuWtbMa7DTVko
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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


