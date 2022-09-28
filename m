Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE15EDA3D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:39:35 +0200 (CEST)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUTW-0000rD-Kl
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE4-00085t-2Q
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSDz-000899-IU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:27 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWAWq-1okjND1pBC-00Xdfp; Wed, 28
 Sep 2022 10:15:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/38] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Date: Wed, 28 Sep 2022 10:14:44 +0200
Message-Id: <20220928081517.734954-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BX9J1p5IKcxeXxyXtJZHW9LN5He5NpdyFI16PYTCO0az/Ojis49
 vysosB0l71qFH+ER3DUdbC+L4fU5jnSxzztEfU/lJ2S9rGUalcaDKDJ3dqsE9VSi47HQi2a
 5tOnhgbezOzu7VAbO/tLPzU1NQ6HPfjgnWWIFUl6wHNfQBHYtRLgo85iop4BrRqve4LRzyi
 LTadu/6OoFuw+afvCBcBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SIvB0uZQUc4=:gCCUQjjQwqzMlhFPbRDkTM
 IWq1nQFbKIsa/7Xk+UGpsfq/U7viCe7LYCfOD3QyNS1481qboZcUjzEbvbr0uR+pYXjOdsORr
 3J8SL7W3ajRjXgQbNS21hG56lSr69/JULSgMEjFktquCFPeBTNpcP1n91sLyaBlqDehft+vnW
 eYCC2Zwm/LpjWdbhaMqRICgq5VDOMS+/xTbBg7Gdkp/c6+xhEVnHO7J9RmpHP5mhb/2xSzgLc
 p1U0tFKQKtHGpX3iYXThU7k//NBuohk6gUsAG/pWCBHiHOkz0UFva6/YYZ+npzSsCkg7k9j59
 tzTYBqvlYrtrv6gCcpSbifXHWRCfzoP9+PsJvUwWg3n7BPuwHRjbr8dCwS29W+GQJ3hPXyIWD
 U27lW4ndhtsK0QC10/WxBF8HKCNXcz+oyWeSD1m9hqpVSAthNOmBP2eaZ/DAcD8nC9UpI3N7B
 Z47YQgUlaLtQ3uNf2XB+xxFKJH/zfhnfnYZbTJb7nFq78Tx071WnZeoPaDu71cdeEazDS1QYA
 x3WJW2k0UbhiB4cvG/RVG0lAkZsKAM6qPgEqoB1+hXyWM8+KmZK4boVSS5oHPnWCmz9U1tn3r
 oUhZOaGTo2WyzFtoBsCFsQPvkgwBiF3tei6K4/tTjpqmGQWperqktx8E7iT/uqHnpaGxopS0r
 BwGhfNXyjdCFy/TUYxq1u2EHvGdb65rA6K5qm7s28D9uwsKnywoQKnDCdD1c9T6zsEYFJK9zz
 TzRBN5KGkqLYcY23xM7L2GqyVS2dn8s0U/a4Agm/d4kyQ96RqZ3Yj1S/1DdvSROagJW0r/oKs
 YD+OQFq
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

I noticed those were missing when running the glib2.0 testsuite.
Add the syscalls including the strace output.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-4-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 28 ++++++++++++++++++++++++++++
 linux-user/strace.list |  9 +++++++++
 linux-user/syscall.c   | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 816e67999539..5ac64df02b85 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3317,6 +3317,34 @@ print_openat(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_pidfd_send_signal
+static void
+print_pidfd_send_signal(CPUArchState *cpu_env, const struct syscallname *name,
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
+    p = lock_user(VERIFY_READ, arg2, sizeof(target_siginfo_t), 1);
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
index a78cdf3cdfef..4d8b7f6a5e0c 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1664,6 +1664,15 @@
 #ifdef TARGET_NR_pipe2
 { TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
 #endif
+#ifdef TARGET_NR_pidfd_open
+{ TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },
+#endif
+#ifdef TARGET_NR_pidfd_send_signal
+{ TARGET_NR_pidfd_send_signal, "pidfd_send_signal", NULL, print_pidfd_send_signal, NULL },
+#endif
+#ifdef TARGET_NR_pidfd_getfd
+{ TARGET_NR_pidfd_getfd, "pidfd_getfd", "%s(%d,%d,%u)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_atomic_cmpxchg_32
 { TARGET_NR_atomic_cmpxchg_32, "atomic_cmpxchg_32", NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index abf82bab2a18..850410c9b553 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -346,6 +346,16 @@ _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
 _syscall6(int,sys_futex_time64,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
 #endif
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+_syscall2(int, pidfd_open, pid_t, pid, unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signal)
+_syscall4(int, pidfd_send_signal, int, pidfd, int, sig, siginfo_t *, info,
+                             unsigned int, flags);
+#endif
+#if defined(__NR_pidfd_getfd) && defined(TARGET_NR_pidfd_getfd)
+_syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned int, flags);
+#endif
 #define __NR_sys_sched_getaffinity __NR_sched_getaffinity
 _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
           unsigned long *, user_mask_ptr);
@@ -8683,6 +8693,30 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         ret = do_open_by_handle_at(arg1, arg2, arg3);
         fd_trans_unregister(ret);
         return ret;
+#endif
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+    case TARGET_NR_pidfd_open:
+        return get_errno(pidfd_open(arg1, arg2));
+#endif
+#if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signal)
+    case TARGET_NR_pidfd_send_signal:
+        {
+            siginfo_t uinfo;
+
+            p = lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), 1);
+            if (!p) {
+                return -TARGET_EFAULT;
+            }
+            target_to_host_siginfo(&uinfo, p);
+            unlock_user(p, arg3, 0);
+            ret = get_errno(pidfd_send_signal(arg1, target_to_host_signal(arg2),
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
-- 
2.37.3


