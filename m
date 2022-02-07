Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BC4AB77A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:27:09 +0100 (CET)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Id-0006lz-ID
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00064J-Li
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-00079O-4V
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:07 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8hMt-1nLeCp1p9V-004nHs; Mon, 07
 Feb 2022 09:28:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] linux-user: Fix inotify on aarch64
Date: Mon,  7 Feb 2022 09:27:54 +0100
Message-Id: <20220207082759.180431-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aDxuC56Ae2yHsgEEFWcmtqbqr0Cs0bv9WP0MXBBSC3jCL5wuqBn
 +YzCPlDuj0Xqo8KLyjcjM3BwOtXzsBh3NOZyCOaqDTjTd/vEYxOUByRTGHp0PBF4OkZ/wF9
 wvOvYqc675jD9vK4OYIfuGqv3EunZCzJXNg8cCpSHddnJp478QK2gbsX6uN9u26IBAg48kw
 BIKWUtQPKs8ZB8MErXeSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lxvyslDvC34=:7WbOu8N7CX6rTjBZ1vy4Eg
 WOOg+9t4Z5EFbIKRX3FeERQ5oxu9xR8Wmu9HojS8ZmcTnPkV7g7HxkJzkyxc0Ec4Pg0obc1Pi
 qqf4arwCzRhg1GaCQeNHnAE3gZosZvYJqdiScwueJnAxRiv0a9Z3vnwzgLBlnplkAF+CCy4S/
 W5oZI8nh+1rjbXE9ynBQ37XY8G1Zp6SklI4mjxnJDnawtihMhlQ9fK44jrRwSLF2v7oh7vwa7
 FJliyjDYxFeLQhp1DzAb6KeaCKkjDT4kK8zfndpsedMsG+ohWVjyH1G4B6au2ASUu7lCEOi5A
 uyCvs0xuJe1zg5lIVu++olmYc08pPeIZ451AT+me9y0/1VLw2wmTt8J0NQE8DxTmZXlTfJNkg
 MQjBdOcA43+k357h8nnAcMrnsCnvF0n6pfwApsmohDhlP99ts8dPBPubjaheG7PnkeI9QrSgE
 6Hl5iauyyyl2QlXrFhUaUKd9UZZW74v0bDLLPGPjBQMBbRQinuGNgHiLAh0TJ4JUlYEdafknA
 EAw/889nQ7k/ZTpO0jWe+p5r28gNRq0rx0PpW1afYFEkYNM53fj6FBSjmGZB7PMGA2kXFVMiu
 nvRiFux6DW7q98jSTpHFYx7hRFtal6Wq6T6vzohKDBHDz0jGtesHOhvpTlk0m2D3umlQ4YVYD
 o+oRbnbdHF6s94iQJG1ZBgj9W8WKS+OwFIuxUkONp8y1JIO/C3olbeAkzSboaxPi7YGs=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Brook <paul@nowt.org>

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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220126202636.655289-1-paul@nowt.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c |  5 ++---
 linux-user/syscall.c  | 50 +++++++++----------------------------------
 2 files changed, 12 insertions(+), 43 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index a17d05c07923..7b25468d0208 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1644,9 +1644,8 @@ TargetFdTrans target_eventfd_trans = {
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
index 5950222a77e0..2ca0f086dbfc 100644
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
@@ -477,33 +474,6 @@ static int sys_renameat2(int oldfd, const char *old,
 
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
@@ -12341,35 +12311,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


