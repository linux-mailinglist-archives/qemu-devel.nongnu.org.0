Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18E60C681
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMS-0002wy-9H; Tue, 25 Oct 2022 04:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETx-0001JF-SK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETu-0003GT-0R
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPowd-1oQSfi3qdf-00MrIH; Tue, 25
 Oct 2022 09:36:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 2/8] linux-user: fix pidfd_send_signal()
Date: Tue, 25 Oct 2022 09:36:00 +0200
Message-Id: <20221025073606.3114355-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C0zMStXtK+BLeF6sFH/S8vlAV/96IZfZaA6uWRptajzRx1Gg5b6
 fN/6oolABRr6lugUCVfu+vjO3doGtNrZAiPoqgfYdt61clcwA+t2V/x1+z4H+C+nZgtPpwg
 8QQth32dL564vUQ/uSdn/lFBp2d/Hfu6/ICjYbfvVbmvUGneH9Zu0oA1qx6fQbEBlo0gMtJ
 nCd9UJq1slrS+NywqpG1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BD8KFicWM4Y=:WMuO1bbv2odndudheMnKUR
 bM2r9ODkkzGduF7EfChus2BAUMPCUgKoLEOtFBUoSia1VRLZ2GrY91AjJ6giTYuEZe6TMkzPr
 A/uM1y/+2UYvk7yg9xFuJjowG9rfEuFH5to8i7YnaE41kx/+X6PIvGIibkCwNl4SeqnyxdID8
 jk0jlR1andAj2NwMHDdzOM9S7hQQyhFSsklIfOKxu/C4xTHuvIY81HaWMz3pTD++q5eXUlhtP
 aUiLgmFTQ1KsmIRudRKduuNLDoKadQxzDjWt2pACGUdjjRxk3jJ5xvYXHb0JauvLzrjuTNmz/
 w06SNzM4F3YmdLTNYS3kfNpMhLY+hM9qO+mWlLb6xdcg/mJWfwdXw4i56MrDRpN2s7k5w1wjs
 CcEMm1ImUvRv0uPSfzHoYhMunNH3fdGCagZ+H0tLtz4YNaFnAnmKOLk2jZHWIkncIf7ZvQ34A
 BHjLSJDs0u/0MGUvVCUzSEEQVPsJf+nR+O07irWukICLnmqQliiighlMCjejlsY5IV/2YyRpz
 PS3UWHNPx45ReDnQy5c85QQ/+GCNGCkNqM5VRX/yEZDTF5rm6FoY9C2fZlFQ0+y5dyHU71oZA
 gbAKuRD1CIyK8YgcSUXJg3edd+hmqoU1gbx9cgTmrcvzm88W8GgItPwTZL62DV4BA4knKs/QT
 YTHZz4PoonIySXWpOgnJL8Rl5ePf46TgxivnktbGiGWSh9n+xaBAM2VZLZ2wQhhziYhHZXKx2
 acgu3Jv6ORBcftxGnN8DsnYUcBMIAihCpbnPIctoZCoI3qGsFCr5/pweIlnLCJdzUgAj4XZds
 r2+Y5jD
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

According to pidfd_send_signal(2), info argument can be a NULL pointer.
Fix strace to correctly manage ending comma in parameters.

Fixes: cc054c6f13 ("linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd() syscalls")
cc: Helge Deller <deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Helge Deller <deller@gmx.de>
Message-Id: <20221005163826.1455313-1-laurent@vivier.eu>
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
index 8b2d39fe73b3..ad06ec7bd54c 100644
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


