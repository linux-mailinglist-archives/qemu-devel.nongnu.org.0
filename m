Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3796C64EDBC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CVl-0007c8-8j; Fri, 16 Dec 2022 10:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p6CVY-0007XK-4x
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:20:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p6CVV-0007pK-TM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:20:19 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 62159401E9;
 Fri, 16 Dec 2022 18:20:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 71B563B9;
 Fri, 16 Dec 2022 18:20:07 +0300 (MSK)
Received: (nullmailer pid 2838245 invoked by uid 1000);
 Fri, 16 Dec 2022 15:20:07 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH] linux-user: fix getgroups/setgroups allocations
Date: Fri, 16 Dec 2022 18:20:06 +0300
Message-Id: <20221216152006.2838195-1-mjt@msgid.tls.msk.ru>
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

linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
used alloca() to allocate grouplist arrays, with unchecked gidsetsize
coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
is common for an application to allocate NGROUPS_MAX for getgroups()),
this means a typical allocation is half the megabyte on the stack.
Which just overflows stack, which leads to immediate SIGSEGV in actual
system getgroups() implementation.

An example of such issue is aptitude, eg
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72

Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
and use heap allocation for grouplist instead of alloca().  While at it,
fix coding style and make all 4 implementations identical.

Try to not impose random limits - for example, allow gidsetsize to be
negative for getgroups() - just do not allocate negative-sized grouplist
in this case but still do actual getgroups() call.  But do not allow
negative gidsetsize for setgroups() since its argument is unsigned.

Capping by NGROUPS_MAX seems a bit arbit arbitrary, - we can do more,
it is not an error if set size will be NGROUPS_MAX+1. But we should not
allow integer overflow for the array being allocated. Maybe it is enough
to just call g_try_new() and return ENOMEM if it fails.

Maybe there's also no need to convert setgroups() since this one is
usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
this is apparently a kernel-imposed limit for runtime group set).

The patch fixes aptitude segfault mentioned above.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 95 +++++++++++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 27 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..da105c7ccd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11433,33 +11433,51 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist;
+            gid_t *grouplist = NULL;
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (gidsetsize > NGROUPS_MAX) {
+                return -TARGET_EINVAL;
+            }
+            if (gidsetsize > 0) {
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
-            if (gidsetsize == 0)
-                return ret;
-            if (!is_error(ret)) {
+            if (!is_error(ret) && ret > 0) {
                 target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * sizeof(target_id), 0);
-                if (!target_grouplist)
+                if (!target_grouplist) {
+                    g_free(grouplist);
                     return -TARGET_EFAULT;
-                for(i = 0;i < ret; i++)
+                }
+                for(i = 0; i < ret; i++) {
                     target_grouplist[i] = tswapid(high2lowgid(grouplist[i]));
+                }
                 unlock_user(target_grouplist, arg2, gidsetsize * sizeof(target_id));
             }
+            g_free(grouplist);
+            return ret;
         }
-        return ret;
     case TARGET_NR_setgroups:
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
             gid_t *grouplist = NULL;
             int i;
-            if (gidsetsize) {
-                grouplist = alloca(gidsetsize * sizeof(gid_t));
+
+            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
+                return -TARGET_EINVAL;
+            }
+            if (gidsetsize > 0) {
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                   return -TARGET_ENOMEM;
+                }
                 target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * sizeof(target_id), 1);
                 if (!target_grouplist) {
+                    g_free(grouplist);
                     return -TARGET_EFAULT;
                 }
                 for (i = 0; i < gidsetsize; i++) {
@@ -11467,7 +11485,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 }
                 unlock_user(target_grouplist, arg2, 0);
             }
-            return get_errno(setgroups(gidsetsize, grouplist));
+            ret = get_errno(setgroups(gidsetsize, grouplist));
+            g_free(grouplist);
+            return ret;
         }
     case TARGET_NR_fchown:
         return get_errno(fchown(arg1, low2highuid(arg2), low2highgid(arg3)));
@@ -11750,42 +11770,63 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            gid_t *grouplist = NULL;
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (gidsetsize > NGROUPS_MAX) {
+                return -TARGET_EINVAL;
+            }
+            if (gidsetsize > 0) {
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
-            if (gidsetsize == 0)
-                return ret;
-            if (!is_error(ret)) {
+            if (!is_error(ret) && ret > 0) {
                 target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 4, 0);
                 if (!target_grouplist) {
+                    g_free(grouplist);
                     return -TARGET_EFAULT;
                 }
-                for(i = 0;i < ret; i++)
+                for(i = 0; i < ret; i++) {
                     target_grouplist[i] = tswap32(grouplist[i]);
+                }
                 unlock_user(target_grouplist, arg2, gidsetsize * 4);
             }
+            g_free(grouplist);
+            return ret;
         }
-        return ret;
 #endif
 #ifdef TARGET_NR_setgroups32
     case TARGET_NR_setgroups32:
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            gid_t *grouplist = NULL;
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
-            target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
-            if (!target_grouplist) {
-                return -TARGET_EFAULT;
+            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
+                return -TARGET_EINVAL;
+            }
+            if (gidsetsize > 0) {
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
+                target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
+                if (!target_grouplist) {
+                    g_free(grouplist);
+                    return -TARGET_EFAULT;
+                }
+                for(i = 0; i < gidsetsize; i++) {
+                    grouplist[i] = tswap32(target_grouplist[i]);
+                }
+                unlock_user(target_grouplist, arg2, 0);
             }
-            for(i = 0;i < gidsetsize; i++)
-                grouplist[i] = tswap32(target_grouplist[i]);
-            unlock_user(target_grouplist, arg2, 0);
-            return get_errno(setgroups(gidsetsize, grouplist));
+            ret = get_errno(setgroups(gidsetsize, grouplist));
+            g_free(grouplist);
+            return ret;
         }
 #endif
 #ifdef TARGET_NR_fchown32
-- 
2.30.2


