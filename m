Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87749D41E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:07:49 +0100 (CET)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpW8-0001Dq-Pq
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nCosS-0008Lq-6f
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:26:48 -0500
Received: from nowt.default.pbrook.uk0.bigv.io ([213.138.114.50]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nCosP-0007Zx-Sf
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:26:47 -0500
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.ecobee.com)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nCosJ-0006Pv-6z; Wed, 26 Jan 2022 20:26:39 +0000
From: Paul Brook <paul@nowt.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix inotify on aarch64
Date: Wed, 26 Jan 2022 20:26:36 +0000
Message-Id: <20220126202636.655289-1-paul@nowt.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=213.138.114.50; envelope-from=paul@nowt.org;
 helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 Jan 2022 16:01:55 -0500
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
Cc: Laurent Vivier <laurent@vivier.eu>, Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The inotify implementation originally called the raw host syscalls.
Commit 3b3f24add0 changed this to use the glibc wrappers. However ifdefs
in syscall.c still test for presence of the raw syscalls.

This causes a problem on e.g. aarch64 hosts which never had the
inotify_init syscall - it had been obsoleted by inotify_init1 before
aarch64 was invented! However it does have a perfectly good glibc
implementation of inotify_wait.

Fix this by removing all the raw __NR_inotify_* tests, and instead check
CONFIG_INOTIFY, which already tests for the glibc functionality we use.

Also remove the now-pointless sys_inotify* wrappers.

Tested using x86-64 inotifywatch on aarch64 host, and vice-versa

Signed-off-by: Paul Brook <paul@nowt.org>
---
 linux-user/fd-trans.c |  5 ++---
 linux-user/syscall.c  | 50 +++++++++----------------------------------
 2 files changed, 12 insertions(+), 43 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 6941089959..30e7b49112 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1460,9 +1460,8 @@ TargetFdTrans target_eventfd_trans = {
     .target_to_host_data = swap_data_eventfd,
 };
 
-#if (defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)) || \
-    (defined(CONFIG_INOTIFY1) && defined(TARGET_NR_inotify_init1) && \
-     defined(__NR_inotify_init1))
+#if defined(CONFIG_INOTIFY) && (defined(TARGET_NR_inotify_init) || \
+        defined(TARGET_NR_inotify_init1))
 static abi_long host_to_target_data_inotify(void *buf, size_t len)
 {
     struct inotify_event *ev;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3e17183..17cc38fe34 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -272,9 +272,6 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
 #if defined(__NR_futex_time64)
 # define __NR_sys_futex_time64 __NR_futex_time64
 #endif
-#define __NR_sys_inotify_init __NR_inotify_init
-#define __NR_sys_inotify_add_watch __NR_inotify_add_watch
-#define __NR_sys_inotify_rm_watch __NR_inotify_rm_watch
 #define __NR_sys_statx __NR_statx
 
 #if defined(__alpha__) || defined(__x86_64__) || defined(__s390x__)
@@ -447,33 +444,6 @@ static int sys_renameat2(int oldfd, const char *old,
 
 #ifdef CONFIG_INOTIFY
 #include <sys/inotify.h>
-
-#if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
-static int sys_inotify_init(void)
-{
-  return (inotify_init());
-}
-#endif
-#if defined(TARGET_NR_inotify_add_watch) && defined(__NR_inotify_add_watch)
-static int sys_inotify_add_watch(int fd,const char *pathname, int32_t mask)
-{
-  return (inotify_add_watch(fd, pathname, mask));
-}
-#endif
-#if defined(TARGET_NR_inotify_rm_watch) && defined(__NR_inotify_rm_watch)
-static int sys_inotify_rm_watch(int fd, int32_t wd)
-{
-  return (inotify_rm_watch(fd, wd));
-}
-#endif
-#ifdef CONFIG_INOTIFY1
-#if defined(TARGET_NR_inotify_init1) && defined(__NR_inotify_init1)
-static int sys_inotify_init1(int flags)
-{
-  return (inotify_init1(flags));
-}
-#endif
-#endif
 #else
 /* Userspace can usually survive runtime without inotify */
 #undef TARGET_NR_inotify_init
@@ -12263,35 +12233,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_futex_time64:
         return do_futex_time64(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
-#if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
+#ifdef CONFIG_INOTIFY
+#if defined(TARGET_NR_inotify_init)
     case TARGET_NR_inotify_init:
-        ret = get_errno(sys_inotify_init());
+        ret = get_errno(inotify_init());
         if (ret >= 0) {
             fd_trans_register(ret, &target_inotify_trans);
         }
         return ret;
 #endif
-#ifdef CONFIG_INOTIFY1
-#if defined(TARGET_NR_inotify_init1) && defined(__NR_inotify_init1)
+#if defined(TARGET_NR_inotify_init1) && defined(CONFIG_INOTIFY1)
     case TARGET_NR_inotify_init1:
-        ret = get_errno(sys_inotify_init1(target_to_host_bitmask(arg1,
+        ret = get_errno(inotify_init1(target_to_host_bitmask(arg1,
                                           fcntl_flags_tbl)));
         if (ret >= 0) {
             fd_trans_register(ret, &target_inotify_trans);
         }
         return ret;
 #endif
-#endif
-#if defined(TARGET_NR_inotify_add_watch) && defined(__NR_inotify_add_watch)
+#if defined(TARGET_NR_inotify_add_watch)
     case TARGET_NR_inotify_add_watch:
         p = lock_user_string(arg2);
-        ret = get_errno(sys_inotify_add_watch(arg1, path(p), arg3));
+        ret = get_errno(inotify_add_watch(arg1, path(p), arg3));
         unlock_user(p, arg2, 0);
         return ret;
 #endif
-#if defined(TARGET_NR_inotify_rm_watch) && defined(__NR_inotify_rm_watch)
+#if defined(TARGET_NR_inotify_rm_watch)
     case TARGET_NR_inotify_rm_watch:
-        return get_errno(sys_inotify_rm_watch(arg1, arg2));
+        return get_errno(inotify_rm_watch(arg1, arg2));
+#endif
 #endif
 
 #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
-- 
2.34.1


