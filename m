Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7517006AA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:23:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrL-00061q-VD; Fri, 12 May 2023 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrJ-0005zt-5M
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:49 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrH-0002Om-52
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MlsWZ-1qfG4N2waJ-00iyZG; Fri, 12
 May 2023 13:22:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 9/9] linux-user: fix getgroups/setgroups allocations
Date: Fri, 12 May 2023 13:22:38 +0200
Message-Id: <20230512112238.85272-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iRJlWj3Gcwv32sYb+8bRrL7E6Z7BK0F/lJCUdcrclFucul2udKF
 YA2Goa9O3gbUAIYaLy3Vm9NvoNUhIlHO+PgGUGsVCWc3WbMx/jgApJCs6WTqT+HzEbkUj1e
 j9BOBm8GYZjhy5vuMwzg+FPLCP89BW0Aj0UndEKai8X/ncqdP4aLi1S1sr4CklBgbuJZQjN
 aOPlBEK2PSU16bQDLamTA==
UI-OutboundReport: notjunk:1;M01:P0:pJQgYKHQdis=;nwUO9pwLQzc8LIN4INzbxIODITf
 zVqTn62hnKRapSA55MASZ4s0b6h8Yx5oV8nnCsc9yQre+8rYVLUk0wpJpq0ZeG2m22cSk9ebJ
 A7G8mAsESZhArzJ3aV2LHa9EhpII7cPil9MsTqb8EbVfIW5X02c1uAgKa+Ybma1DVdh1y9LcF
 ZXismGvZvq+GOJihOvRU8rwPdYJRButOT3wMi2luLV9JqN8yLhnlpBeZabnDKpeXJ4Q4av9Au
 1oTcstdkX0/cHy0sCydAyCg8HbRzkwf1vzaR9O/A51kaYV/wdR1dDxFvtHB1zREUUwdkKPbhz
 n8/VGG8tpp1JBzyG1vqNTIN4V3N1c8FmOJTZ7BYyb3Q3zPO7xm+k8vlCJgPxCL1ygQNwJGoJH
 qJyIZedfcMRBZy3BU90XuVMJ8eVUtdkDNJS9ezeTWqjuKiXTJWWBd6b4Bk45b7B8kx7UDTD33
 FcqDQjKl6KtzMohTW3Q6S7rix0ujR1d8HnK44X0RDPI+Hp1/KnniOdh1tu0PQ9BCJGH04o9yp
 j1TswZqrJY7CDbWh+4KzhGhqjkYyNcy6y9DNPifEqiLXZfdJFkydI9ddWy7cY7edMOtx2jm/u
 uF5xLSgIifNTiG6EdBvEBuTpIbde17epVBV6wa8u2fgSlEzBZozdwfuak4rlh6MqHS7Mz5Kvz
 jgaMJXfq41DPfJ7YODtyR4VYvUodmLgDuzfZgScDqA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
index 7170332041ca..f49fbd0529d9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11559,39 +11559,58 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
@@ -11876,41 +11895,59 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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


