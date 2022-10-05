Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E85F58CE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 19:04:52 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7pD-0000Tj-A9
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 13:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1og7Ps-00065l-Qh
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:38:40 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:52745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1og7Pq-0007ZR-4V
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:38:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mrfgi-1p0piu1TYC-00ngX8; Wed, 05
 Oct 2022 18:38:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: fix pidfd_send_signal()
Date: Wed,  5 Oct 2022 18:38:26 +0200
Message-Id: <20221005163826.1455313-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LjGp+bV06cIqjfXh8nuy/p6CUSINLYXv4gAg+Z/4YIivRP6d1xZ
 Y61jq5v99+pHeFKQwPYrCbcKolEVEeYm0ilhgzWYb5bZr80PkdjAjcJWqx2nmuZmZ2AjVDx
 oQwsgGzp88JABcFoldraXAf9r2neAkz/A+ZHyf6qGoR8wy2z8OkmcqoYFbUCnTmYt2x9B04
 OY91OZRXrdYcL1kOfbVsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IBZfzPb+5E8=:9p8HW3OM0x/VjdfbqUfXeK
 5JuPNAYHfmjlJ6LQ8+CMGa/RKnvZrbJhjhWB05CoHwTocRjeuXyxqQ4o/KutFrNXtZViI5+/j
 oQX54iVl7EZ03NNa85POqnzp8NhMbK56EmMecUcKpwzrLx0y9Lvo3nc0/wzJZK65IuvzGd5gB
 M/k3lux91xBiFUorTs1EDX6NTnG59OZsPU6PUqkh/TMze/NqhLt6aEjIo+NOMqsS0TJEGniW4
 z8TDnhngbd2JIx41M9GRhBAKRP/76+9R/eyw3qRDAHK/zE4879XJGrGAPPgmqWwmOXCDwJzH/
 lf76dx8SxcNBcJMQ3rRP5pyzCy2arBzPJXPKYmgggJGlhAe96V4wqI63oRbiaZRQ67jVSUyHl
 8CyQJ45wvbpuI05mUN3RAnkmNjOsoh92Vnas8ej0QygraPflXom7/JVoneMNIXvPtN0MJZShy
 FyIm461+XCMf+Ofmrk1Dh4dz1aKqJTOk0wUbq/nHTN0wb+uuhJ3agGfoxLb5qxafTGtRVVYFp
 VjHeUvl/pBiK31BGr7ezAzr1iPr17Hb9M6NpHcxodSsB0bEkJb3zlknBn6FKJRncXznuJYtaq
 ulRSu+hOnJExygflIV2kqAUOv+muI0TP6Rp+x0GyV5LybTrovBwRbpaNgcG7lTw2mPk1Ziq0X
 nesx2+9prYwP3r9a0llkZhuS3+TPwcUxZPolF9+HM15LCNb0T1DXDjN0DmWrNYQ5mgn2n/PLR
 A1ranroXkvc6y8pq/z1dcxwbtjakAIJuy+8lspt30/FeciVAasr+q3e/Vrd1iaqtl/z3noqJ3
 dGGoe4T
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

According to pidfd_send_signal(2), info argument can be a NULL pointer.
Fix strace to correctly manage ending comma in parameters.

Fixes: cc054c6f13 ("linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd() syscalls")
cc: Helge Deller <deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c  |  4 ++--
 linux-user/syscall.c | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 37bc96df9bb6..86c081c83f74 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3383,10 +3383,10 @@ print_pidfd_send_signal(CPUArchState *cpu_env, const struct syscallname *name,
 
         unlock_user(p, arg2, 0);
     } else {
-        print_pointer(arg2, 1);
+        print_pointer(arg2, 0);
     }
 
-    print_raw_param("%u", arg3, 0);
+    print_raw_param("%u", arg3, 1);
     print_syscall_epilogue(name);
 }
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e954d8dbd9e..b1493917ee07 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8679,16 +8679,21 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signal)
     case TARGET_NR_pidfd_send_signal:
         {
-            siginfo_t uinfo;
+            siginfo_t uinfo, *puinfo;
 
-            p = lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), 1);
-            if (!p) {
-                return -TARGET_EFAULT;
+            if (arg3) {
+                p = lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), 1);
+                if (!p) {
+                    return -TARGET_EFAULT;
+                 }
+                 target_to_host_siginfo(&uinfo, p);
+                 unlock_user(p, arg3, 0);
+                 puinfo = &uinfo;
+            } else {
+                 puinfo = NULL;
             }
-            target_to_host_siginfo(&uinfo, p);
-            unlock_user(p, arg3, 0);
             ret = get_errno(pidfd_send_signal(arg1, target_to_host_signal(arg2),
-                &uinfo, arg4));
+                                              puinfo, arg4));
         }
         return ret;
 #endif
-- 
2.37.3


