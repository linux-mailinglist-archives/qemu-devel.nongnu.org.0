Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC564F0BD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6F89-0005z8-Vy; Fri, 16 Dec 2022 13:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p6F86-0005xS-MT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:08:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p6F84-0001Ob-9U
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:08:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6A5BC401E9;
 Fri, 16 Dec 2022 21:08:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E54D13B9;
 Fri, 16 Dec 2022 21:08:08 +0300 (MSK)
Received: (nullmailer pid 2843082 invoked by uid 1000);
 Fri, 16 Dec 2022 18:08:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Cc: Arnd Bergmann <arnd@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [RFC PATCH] linux-user: time64: consolidate rt_sigtimedwait_time64
 and rt_sigtimedwait
Date: Fri, 16 Dec 2022 21:08:07 +0300
Message-Id: <20221216180807.2843032-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Both system calls are exactly the same, the only difference is the
(optional) timespec conversion. Consolidate the two, and check which
syscall being emulated in the timespec conversion place.

This is just a PoC. But this brings at least 2 questions.

Let's take pselect6 as an example. There are 2 possible pselects
in there (actually more, but let's focus on just the two):
TARGET_NR_pselect6 and TARGET_NR_pselect6_time64.  Both are implemented
in a single do_pselect6() function, which, depending on its "time64"
argument, will call either target_to_host_timespec64() or
target_to_host_timespec().

But these functions, in turn, are guarded by a lot of #if
defined(foo). In particular, in context of pselect6,
target_to_host_timespec() is guarded by
 if defined(TARGET_NR_pselect6),
while target_to_host_timespec64() is guarded by
 if defined(TARGET_NR_pselect6_time64).

So basically, if just one of the two TARGET_NR_pselect6*
is defined, one of target_to_host_timespec*() will not
be defined, but do_pselect6() calls *both* anyway.  In
other words, both functions must be provided if any of
the select6 are to be implemented.

But the good news is that these functions
(target_to_host_timespec*()) are always defined because
they're needed for some syscalls anyway, like, eg,
TARGET_NR_semop or TARGET_NR_utimensat or CONFIG_TIMERFD.

It looks like whole gigantic ifdeffery around these two
functions should be dropped, and a common function provided,
with an extra argument like time64, to be used in many
places where this construct is already used. Like in
this PoC too, which again calls one of the two depending
on the actual syscall being used.  Or maybe we can even
combine the two into one with an extra arg like "time64".

This should simplify quite some code greatly.

What do you think?

And another question: this PoC should work in either of
4 cases, including when just one (any of) rt_sigtimedwait
and rt_sigtimedwait_time64 is defined. It uses small
preprocessor trick, which - to my taste anyway - isn't
exactly great. Maybe there's some other, more elegant,
way to do that exists?

Thanks,

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 46 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..c175e03207 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9700,48 +9700,16 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             finish_sigsuspend_mask(ret);
         }
         return ret;
+#if defined(TARGET_NR_rt_sigtimedwait) || defined(TARGET_NR_rt_sigtimedwait_time64)
 #ifdef TARGET_NR_rt_sigtimedwait
     case TARGET_NR_rt_sigtimedwait:
-        {
-            sigset_t set;
-            struct timespec uts, *puts;
-            siginfo_t uinfo;
-
-            if (arg4 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-
-            if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-                return -TARGET_EFAULT;
-            target_to_host_sigset(&set, p);
-            unlock_user(p, arg1, 0);
-            if (arg3) {
-                puts = &uts;
-                if (target_to_host_timespec(puts, arg3)) {
-                    return -TARGET_EFAULT;
-                }
-            } else {
-                puts = NULL;
-            }
-            ret = get_errno(safe_rt_sigtimedwait(&set, &uinfo, puts,
-                                                 SIGSET_T_SIZE));
-            if (!is_error(ret)) {
-                if (arg2) {
-                    p = lock_user(VERIFY_WRITE, arg2, sizeof(target_siginfo_t),
-                                  0);
-                    if (!p) {
-                        return -TARGET_EFAULT;
-                    }
-                    host_to_target_siginfo(p, &uinfo);
-                    unlock_user(p, arg2, sizeof(target_siginfo_t));
-                }
-                ret = host_to_target_signal(ret);
-            }
-        }
-        return ret;
 #endif
 #ifdef TARGET_NR_rt_sigtimedwait_time64
     case TARGET_NR_rt_sigtimedwait_time64:
+#define rt_sigtimedwait_istime64() (num == TARGET_NR_rt_sigtimedwait_time64)
+#else
+#define rt_sigtimedwait_istime64() 0
+#endif
         {
             sigset_t set;
             struct timespec uts, *puts;
@@ -9759,7 +9727,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             unlock_user(p, arg1, 0);
             if (arg3) {
                 puts = &uts;
-                if (target_to_host_timespec64(puts, arg3)) {
+                if (rt_sigtimedwait_istime64()
+                    ? target_to_host_timespec64(puts, arg3)
+                    : target_to_host_timespec(puts, arg3)) {
                     return -TARGET_EFAULT;
                 }
             } else {
-- 
2.30.2


