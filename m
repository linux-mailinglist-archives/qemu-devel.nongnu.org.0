Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C84BAF3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 16:14:52 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdbMS-0000vB-5f
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 10:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53131)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbK3-0007TM-3N
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbJw-0004KW-Pq
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:12:22 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58878 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdbJt-0003bt-J5
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:12:15 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 57F1E1A4906;
 Wed, 19 Jun 2019 16:11:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2C2551A47BB;
 Wed, 19 Jun 2019 16:11:04 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 16:10:27 +0200
Message-Id: <1560953429-29203-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560953429-29203-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1560953429-29203-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v11 3/5] linux-user: Add support for
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
Cc: lvivier@redhat.com, Aleksandar Rikalo <arikalo@wavecomp.com>,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Rikalo <arikalo@wavecomp.com>

Implement support for translation of system call statx().

The implementation is based on "best effort" approach: if host is
capable of executing statx(), host statx() is used. If not, the
implementation includes invoking other (more mature) system calls
(from the same 'stat' family) on the host side to achieve as close
as possible functionality.

Support for statx() in kernel and glibc was, however, introduced
at different points of time (the difference is more than a year):

  - kernel: Linux 4.11 (30 April 2017)
  - glibc: glibc 2.28 (1 Aug 2018)

In this patch, the availability of statx() support is established
via __NR_statx (if it is defined, statx() is considered available).
This coincedes with statx() introduction in kernel.

However, the structure statx definition may not be available for hosts
with glibc older than 2.28 (it is, by design, to be defined in one of
glibc headers), even though the full statx() functionality may be
supported in kernel, if the kernel is not older than 4.11. Hence,
a structure "target_statx" is defined in this patch, to remove that
dependency on glibc headers, and to use statx() functionality as soon
as the host kernel is capable of supporting it. Such structure statx
definition is used for both target and host structures statx (of
course, this doesn't mean the endian arrangement is the same on
target and host, and endian conversion is done in all necessary
cases).

Signed-off-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c      | 136 +++++++++++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h |  37 +++++++++++++
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d116287..e68a36c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -43,6 +43,7 @@
 #include <sys/times.h>
 #include <sys/shm.h>
 #include <sys/sem.h>
+#include <sys/stat.h>
 #include <sys/statfs.h>
 #include <utime.h>
 #include <sys/sysinfo.h>
@@ -316,6 +317,14 @@ _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
           unsigned long, idx1, unsigned long, idx2)
 #endif
 
+/*
+ * It is assumed that struct statx is architecture independent.
+ */
+#if defined(TARGET_NR_statx) && defined(__NR_statx)
+_syscall5(int, statx, int, dirfd, const char *, pathname, int, flags,
+          unsigned int, mask, struct target_statx *, statxbuf)
+#endif
+
 static bitmask_transtbl fcntl_flags_tbl[] = {
   { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
   { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
@@ -6517,6 +6526,48 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
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
@@ -7095,7 +7146,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 #if defined(TARGET_NR_stat) || defined(TARGET_NR_stat64) \
     || defined(TARGET_NR_lstat) || defined(TARGET_NR_lstat64) \
-    || defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
+    || defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64) \
+    || defined(TARGET_NR_statx)
     struct stat st;
 #endif
 #if defined(TARGET_NR_statfs) || defined(TARGET_NR_statfs64) \
@@ -10173,6 +10225,88 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+                ret = get_errno(statx(dirfd, p, flags, mask, &host_stx));
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
+            if (*((char *)p) == 0) {
+                /*
+                 * By file descriptor
+                 */
+                if (flags & AT_EMPTY_PATH) {
+                    unlock_user(p, arg2, 0);
+                    return -TARGET_ENOENT;
+                }
+                ret = get_errno(fstat(dirfd, &st));
+            } else if (*((char *)p) == '/') {
+                /*
+                 * By absolute pathname
+                 */
+                ret = get_errno(stat(path(p), &st));
+            } else {
+                /*
+                 * By pathname relative to the current working directory
+                 * (if 'dirfd' is AT_FDCWD) or relative to the directory
+                 * referred to by the file descriptor 'dirfd'.
+                 */
+                 ret = get_errno(fstatat(dirfd, path(p), &st, flags));
+            }
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


