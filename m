Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0151598D0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 12:53:07 +0200 (CEST)
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgoV8-0006FJ-KT
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 06:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hgoMG-0006wk-M1
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hgoME-0000HD-MZ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:43:56 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:46549 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hgoME-0000GJ-Bm
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:43:54 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4ABBF1A2453;
 Fri, 28 Jun 2019 12:43:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 297851A2015;
 Fri, 28 Jun 2019 12:43:52 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 28 Jun 2019 12:43:34 +0200
Message-Id: <1561718618-20218-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561718618-20218-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561718618-20218-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v16 1/5] linux-user: Add support for
 translation of statx() syscall
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Rikalo <arikalo@wavecomp.com>

Implement support for translation of system call statx().

The implementation is based on "best effort" approach: if host
is capable of executing statx(), host statx() is used. If not,
the implementation includes invoking a more mature system call
fstatat() on the host side to achieve as close as possible
functionality.

Support for statx() in kernel and glibc was, however, introduced
at different points of time (the difference is more than a year):

  - kernel: Linux 4.11 (30 April 2017)
  - glibc: glibc 2.28 (1 Aug 2018)

In this patch, the availability of statx() support is established
via __NR_statx (if it is defined, statx() is considered available).
This coincedes with statx() introduction in kernel.

However, the structure statx definition may not be available in
any header for hosts with glibc older than 2.28 (and it is, by
design, to be defined in one of glibc headers), even though the
full statx() functionality may be supported in kernel. Hence, a
structure "target_statx" is defined in this patch, to remove that
dependency on glibc headers, and to use statx() functionality as
soon as the host kernel is capable of supporting it. Such statx
structure definition is used for both target and host structures
statx (of course, this doesn't mean the endian arrangement is
the same on target and host - the endian conversion is done in
all necessary cases).

Signed-off-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 115 +++++++++++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h |  37 +++++++++++++++
 2 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b187c12..eeca802 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -237,6 +237,7 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
 #define __NR_sys_inotify_init __NR_inotify_init
 #define __NR_sys_inotify_add_watch __NR_inotify_add_watch
 #define __NR_sys_inotify_rm_watch __NR_inotify_rm_watch
+#define __NR_sys_statx __NR_statx
 
 #if defined(__alpha__) || defined(__x86_64__) || defined(__s390x__)
 #define __NR__llseek __NR_lseek
@@ -315,6 +316,14 @@ _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
           unsigned long, idx1, unsigned long, idx2)
 #endif
 
+/*
+ * It is assumed that struct statx is architecture independent.
+ */
+#if defined(TARGET_NR_statx) && defined(__NR_statx)
+_syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
+          unsigned int, mask, struct target_statx *, statxbuf)
+#endif
+
 static bitmask_transtbl fcntl_flags_tbl[] = {
   { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
   { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
@@ -6467,6 +6476,48 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
 }
 #endif
 
+#if defined(TARGET_NR_statx) && defined(__NR_statx)
+static inline abi_long host_to_target_statx(struct target_statx *host_stx,
+                                            abi_ulong target_addr)
+{
+    struct target_statx *target_stx;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_stx, target_addr,  0)) {
+        return -TARGET_EFAULT;
+    }
+    memset(target_stx, 0, sizeof(*target_stx));
+
+    __put_user(host_stx->stx_mask, &target_stx->stx_mask);
+    __put_user(host_stx->stx_blksize, &target_stx->stx_blksize);
+    __put_user(host_stx->stx_attributes, &target_stx->stx_attributes);
+    __put_user(host_stx->stx_nlink, &target_stx->stx_nlink);
+    __put_user(host_stx->stx_uid, &target_stx->stx_uid);
+    __put_user(host_stx->stx_gid, &target_stx->stx_gid);
+    __put_user(host_stx->stx_mode, &target_stx->stx_mode);
+    __put_user(host_stx->stx_ino, &target_stx->stx_ino);
+    __put_user(host_stx->stx_size, &target_stx->stx_size);
+    __put_user(host_stx->stx_blocks, &target_stx->stx_blocks);
+    __put_user(host_stx->stx_attributes_mask, &target_stx->stx_attributes_mask);
+    __put_user(host_stx->stx_atime.tv_sec, &target_stx->stx_atime.tv_sec);
+    __put_user(host_stx->stx_atime.tv_nsec, &target_stx->stx_atime.tv_nsec);
+    __put_user(host_stx->stx_btime.tv_sec, &target_stx->stx_atime.tv_sec);
+    __put_user(host_stx->stx_btime.tv_nsec, &target_stx->stx_atime.tv_nsec);
+    __put_user(host_stx->stx_ctime.tv_sec, &target_stx->stx_atime.tv_sec);
+    __put_user(host_stx->stx_ctime.tv_nsec, &target_stx->stx_atime.tv_nsec);
+    __put_user(host_stx->stx_mtime.tv_sec, &target_stx->stx_atime.tv_sec);
+    __put_user(host_stx->stx_mtime.tv_nsec, &target_stx->stx_atime.tv_nsec);
+    __put_user(host_stx->stx_rdev_major, &target_stx->stx_rdev_major);
+    __put_user(host_stx->stx_rdev_minor, &target_stx->stx_rdev_minor);
+    __put_user(host_stx->stx_dev_major, &target_stx->stx_dev_major);
+    __put_user(host_stx->stx_dev_minor, &target_stx->stx_dev_minor);
+
+    unlock_user_struct(target_stx, target_addr, 1);
+
+    return 0;
+}
+#endif
+
+
 /* ??? Using host futex calls even when target atomic operations
    are not really atomic probably breaks things.  However implementing
    futexes locally would make futexes shared between multiple processes
@@ -7045,7 +7096,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 #if defined(TARGET_NR_stat) || defined(TARGET_NR_stat64) \
     || defined(TARGET_NR_lstat) || defined(TARGET_NR_lstat64) \
-    || defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
+    || defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64) \
+    || defined(TARGET_NR_statx)
     struct stat st;
 #endif
 #if defined(TARGET_NR_statfs) || defined(TARGET_NR_statfs64) \
@@ -10123,6 +10175,67 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             ret = host_to_target_stat64(cpu_env, arg3, &st);
         return ret;
 #endif
+#if defined(TARGET_NR_statx)
+    case TARGET_NR_statx:
+        {
+            struct target_statx *target_stx;
+            int dirfd = arg1;
+            int flags = arg3;
+
+            p = lock_user_string(arg2);
+            if (p == NULL) {
+                return -TARGET_EFAULT;
+            }
+#if defined(__NR_statx)
+            {
+                /*
+                 * It is assumed that struct statx is architecture independent.
+                 */
+                struct target_statx host_stx;
+                int mask = arg4;
+
+                ret = get_errno(sys_statx(dirfd, p, flags, mask, &host_stx));
+                if (!is_error(ret)) {
+                    if (host_to_target_statx(&host_stx, arg5) != 0) {
+                        unlock_user(p, arg2, 0);
+                        return -TARGET_EFAULT;
+                    }
+                }
+
+                if (ret != -TARGET_ENOSYS) {
+                    unlock_user(p, arg2, 0);
+                    return ret;
+                }
+            }
+#endif
+            ret = get_errno(fstatat(dirfd, path(p), &st, flags));
+            unlock_user(p, arg2, 0);
+
+            if (!is_error(ret)) {
+                if (!lock_user_struct(VERIFY_WRITE, target_stx, arg5, 0)) {
+                    return -TARGET_EFAULT;
+                }
+                memset(target_stx, 0, sizeof(*target_stx));
+                __put_user(major(st.st_dev), &target_stx->stx_dev_major);
+                __put_user(minor(st.st_dev), &target_stx->stx_dev_minor);
+                __put_user(st.st_ino, &target_stx->stx_ino);
+                __put_user(st.st_mode, &target_stx->stx_mode);
+                __put_user(st.st_uid, &target_stx->stx_uid);
+                __put_user(st.st_gid, &target_stx->stx_gid);
+                __put_user(st.st_nlink, &target_stx->stx_nlink);
+                __put_user(major(st.st_rdev), &target_stx->stx_rdev_major);
+                __put_user(minor(st.st_rdev), &target_stx->stx_rdev_minor);
+                __put_user(st.st_size, &target_stx->stx_size);
+                __put_user(st.st_blksize, &target_stx->stx_blksize);
+                __put_user(st.st_blocks, &target_stx->stx_blocks);
+                __put_user(st.st_atime, &target_stx->stx_atime.tv_sec);
+                __put_user(st.st_mtime, &target_stx->stx_mtime.tv_sec);
+                __put_user(st.st_ctime, &target_stx->stx_ctime.tv_sec);
+                unlock_user_struct(target_stx, arg5, 1);
+            }
+        }
+        return ret;
+#endif
 #ifdef TARGET_NR_lchown
     case TARGET_NR_lchown:
         if (!(p = lock_user_string(arg1)))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 7f141f6..170c4dd 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2536,4 +2536,41 @@ struct target_user_cap_data {
 /* Return size of the log buffer */
 #define TARGET_SYSLOG_ACTION_SIZE_BUFFER   10
 
+struct target_statx_timestamp {
+   int64_t tv_sec;
+   uint32_t tv_nsec;
+   int32_t __reserved;
+};
+
+struct target_statx {
+   /* 0x00 */
+   uint32_t stx_mask;       /* What results were written [uncond] */
+   uint32_t stx_blksize;    /* Preferred general I/O size [uncond] */
+   uint64_t stx_attributes; /* Flags conveying information about the file */
+   /* 0x10 */
+   uint32_t stx_nlink;      /* Number of hard links */
+   uint32_t stx_uid;        /* User ID of owner */
+   uint32_t stx_gid;        /* Group ID of owner */
+   uint16_t stx_mode;       /* File mode */
+   uint16_t __spare0[1];
+   /* 0x20 */
+   uint64_t stx_ino;        /* Inode number */
+   uint64_t stx_size;       /* File size */
+   uint64_t stx_blocks;     /* Number of 512-byte blocks allocated */
+   uint64_t stx_attributes_mask; /* Mask to show what is supported */
+   /* 0x40 */
+   struct target_statx_timestamp  stx_atime;  /* Last access time */
+   struct target_statx_timestamp  stx_btime;  /* File creation time */
+   struct target_statx_timestamp  stx_ctime;  /* Last attribute change time */
+   struct target_statx_timestamp  stx_mtime;  /* Last data modification time */
+   /* 0x80 */
+   uint32_t stx_rdev_major;   /* Device ID of special file [if bdev/cdev] */
+   uint32_t stx_rdev_minor;
+   uint32_t stx_dev_major; /* ID of device containing file [uncond] */
+   uint32_t stx_dev_minor;
+   /* 0x90 */
+   uint64_t __spare2[14];  /* Spare space for future expansion */
+   /* 0x100 */
+};
+
 #endif
-- 
2.7.4


