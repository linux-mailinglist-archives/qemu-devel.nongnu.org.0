Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37670274A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTcc-0003kK-6u; Mon, 15 May 2023 04:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc7-0003i4-Mz
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:28 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc5-00025k-EV
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:27 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3bfB-1q7JKi0Mpn-010gCv; Mon, 15
 May 2023 10:31:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 9/9] linux-user: fix getgroups/setgroups allocations
Date: Mon, 15 May 2023 10:31:13 +0200
Message-Id: <20230515083113.107056-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QefSNvp2s86mozQG6GYc5pbQ9im4IW9hnHVr+ve9ePYDb2MAUXP
 sHiXujdP/A7/Ktgw/BVGP3VWfkvjkpRuoOeH0llExno5B/oME2iDBpMQDgQ0QHUJ7MzU2re
 rI1yAKve3SERVROtGfXNQ/6HX6/oj02GX/KETWuG/BTlNpoEceDxv0NZZolHsTZXrZOl9N1
 W8+GuEbueH+qX8wC7ngvw==
UI-OutboundReport: notjunk:1;M01:P0:4LPFANhDr7E=;P+N2yoRHW+KMr22Sf3iOFDIXshd
 54mSY4Y6zNnnN/98KGG+ZIjezT29O1Tey9hiI8f4+5m6BOsfql7vMexOZduXER+cZ1p0PskVM
 OEY2JHLwUXPqXMqY87ePqnqEtWZp9TR70bAr9ZcfYJLmbpB6y4SlciR+dfWBMTkku4BVAVfS3
 H2DgJHZtgr2nQvN1XHwDClPgVILhKeIsV+If3KJwGdgbf10fGiQ+e30iOMGsPrAcOMQsAB/X7
 OEGPN1g4TjkyfDnEJHayO3gARpACmIaTBOWcBiJppFYXFbqiU1p/C5gbFuhIS9S2rwV/WGelZ
 Ca/A1FDz0obk3BO3XFILzwhnMtw5TKJPdjZaSMe+Dx0wbSMfOIW5rhHrDC4U1oR3cmttDQUMI
 fS3zek4+BEGN2YHgUbkrjbHI6cVRcfGXIVN6cg/aTiTaql6GN4s3G1cILld2IrmbPLMlP6DdM
 N7LvVztP8H6vqOEj14hiFgcKI+XOqpq//QSi7eDY74wxtyroM7swr7MCl5Hcl10iB6My0Alw+
 2S0rCRWBqEiORXaxbgryl+evudxK/tnjtJpuVTe4OHacKmAUUwZkSSDw0T8cqfAZ4xI0zKyrE
 AaBKlFNfoaSdT8kQB6/yC7sGbfSEyOrSxP910POtOeOaz/BIu0bJzY7Nl1+OiEapSQn8gbWdn
 y1ZseyKjEoTpxfll0Ywm53Y5fodpHBlTWnvBED8QUA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Tokarev <mjt@tls.msk.ru>

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

Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
not an error if set size will be NGROUPS_MAX+1. But we should not allow
integer overflow for the array being allocated. Maybe it is enough to
just call g_try_new() and return ENOMEM if it fails.

Maybe there's also no need to convert setgroups() since this one is
usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
this is apparently a kernel-imposed limit for runtime group set).

The patch fixes aptitude segfault mentioned above.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 99 ++++++++++++++++++++++++++++++--------------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6655982821ba..89b58b386b17 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11571,39 +11571,58 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = NULL;
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
-                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * sizeof(target_id), 0);
-                if (!target_grouplist)
+            if (!is_error(ret) && gidsetsize > 0) {
+                target_grouplist = lock_user(VERIFY_WRITE, arg2,
+                                             gidsetsize * sizeof(target_id), 0);
+                if (!target_grouplist) {
                     return -TARGET_EFAULT;
-                for(i = 0;i < ret; i++)
+                }
+                for (i = 0; i < ret; i++) {
                     target_grouplist[i] = tswapid(high2lowgid(grouplist[i]));
-                unlock_user(target_grouplist, arg2, gidsetsize * sizeof(target_id));
+                }
+                unlock_user(target_grouplist, arg2,
+                            gidsetsize * sizeof(target_id));
             }
+            return ret;
         }
-        return ret;
     case TARGET_NR_setgroups:
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist = NULL;
+            g_autofree gid_t *grouplist = NULL;
             int i;
-            if (gidsetsize) {
-                grouplist = alloca(gidsetsize * sizeof(gid_t));
-                target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * sizeof(target_id), 1);
+
+            if (gidsetsize > NGROUPS_MAX || gidsetsize < 0) {
+                return -TARGET_EINVAL;
+            }
+            if (gidsetsize > 0) {
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
+                target_grouplist = lock_user(VERIFY_READ, arg2,
+                                             gidsetsize * sizeof(target_id), 1);
                 if (!target_grouplist) {
                     return -TARGET_EFAULT;
                 }
                 for (i = 0; i < gidsetsize; i++) {
                     grouplist[i] = low2highgid(tswapid(target_grouplist[i]));
                 }
-                unlock_user(target_grouplist, arg2, 0);
+                unlock_user(target_grouplist, arg2,
+                            gidsetsize * sizeof(target_id));
             }
             return get_errno(setgroups(gidsetsize, grouplist));
         }
@@ -11888,41 +11907,59 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = NULL;
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
-                target_grouplist = lock_user(VERIFY_WRITE, arg2, gidsetsize * 4, 0);
+            if (!is_error(ret) && gidsetsize > 0) {
+                target_grouplist = lock_user(VERIFY_WRITE, arg2,
+                                             gidsetsize * 4, 0);
                 if (!target_grouplist) {
                     return -TARGET_EFAULT;
                 }
-                for(i = 0;i < ret; i++)
+                for (i = 0; i < ret; i++) {
                     target_grouplist[i] = tswap32(grouplist[i]);
+                }
                 unlock_user(target_grouplist, arg2, gidsetsize * 4);
             }
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
+            g_autofree gid_t *grouplist = NULL;
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
+                target_grouplist = lock_user(VERIFY_READ, arg2,
+                                             gidsetsize * 4, 1);
+                if (!target_grouplist) {
+                    return -TARGET_EFAULT;
+                }
+                for (i = 0; i < gidsetsize; i++) {
+                    grouplist[i] = tswap32(target_grouplist[i]);
+                }
+                unlock_user(target_grouplist, arg2, 0);
             }
-            for(i = 0;i < gidsetsize; i++)
-                grouplist[i] = tswap32(target_grouplist[i]);
-            unlock_user(target_grouplist, arg2, 0);
             return get_errno(setgroups(gidsetsize, grouplist));
         }
 #endif
-- 
2.40.1


