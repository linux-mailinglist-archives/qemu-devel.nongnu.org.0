Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F364F9B94
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:23:20 +0200 (CEST)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsKN-0004kC-Oe
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs8C-0005vc-1H
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:45 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs85-0006lD-SG
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:42 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r66so8306578pgr.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhBEF88/eH0HgmSGtXD0aiwXoy55u3P2umDA+GZ9AQI=;
 b=llbGVPvKXfD1naR/MFeg9eI8wHsxkRWf52RNMUKdMf2K9ojdDWMDUTg+ulhD93lcRf
 xIwrXveoh4vRA2zPBECTYPIgxxIbIBTUDruChhvKctdT6BeZEmKkjJQEQAKdJ0LRAcZZ
 Juj/R2JPDYapsnTHIuxTdpSUdt45nfr0/pVoyoHd4hnmshsf5zjKhVd3M1agl65oHqdM
 xiMBsb1n1J9zeuKEXORIbWdQLF4Is+l/p8V9pE4rX85eXB/B6JDPUbfzQ9eu00MRgMTu
 vGIsd37ubBcWlSoWHevgXKv8tx9JqJ0cdNcjFTRgrLHzJRfVSHRIUUy5sV5lj6KEJvaL
 HTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KhBEF88/eH0HgmSGtXD0aiwXoy55u3P2umDA+GZ9AQI=;
 b=mGBQIXRCmxp3mlGNdvwTsOnuCrH7PyrUx7fL3EyQabU1hkIvnmdPYxD69EqafWLDp1
 +XZ7qxQJ6rmmODb4fYu3JOgOxcRAx+DQ7ZQbL3liYJB6lGhc+c7Q4AmX8h1jwHdfrPtb
 OiW5D0ukBC4m9DkujhYdEYCci/5U4XxkVvBg8mjAt9GtU9GEc906abIqB9HRdo+JU5zu
 FcbTFP3Tlzt8LUYhLh7VCv0CFFjqgn+Qr5QNjgxOUn90NO3CAsLUU3jtUGfMKzhgQj/c
 S6oEOPAujO72cQQ5UXF3C5+kuELI47BjFknBJJ0cFjzvYCdVhB67N+QYDrns/UTs6YzQ
 vRzQ==
X-Gm-Message-State: AOAM532eXJRqAvm49cTnm6iWdOaloSlztCyqOIb0pZ3Zx1Fe0+aMto5g
 CZ1fx+IQjzkYLnqhg+0r5kI=
X-Google-Smtp-Source: ABdhPJxozZQTQxSRyow6qHXmswHmK0QpJf/r70z/HN7d/gRyVFzHGxcB8yWkeia+4ynANPOzUbC6Cw==
X-Received: by 2002:a05:6a00:4199:b0:505:7a19:c0d with SMTP id
 ca25-20020a056a00419900b005057a190c0dmr5017211pfb.49.1649437827488; 
 Fri, 08 Apr 2022 10:10:27 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm22263494pgp.3.2022.04.08.10.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:10:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] hw/9pfs: Update 'local' file system backend driver to
 support Windows
Date: Sat,  9 Apr 2022 01:10:11 +0800
Message-Id: <20220408171013.912436-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408171013.912436-1-bmeng.cn@gmail.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Extend the 9p local file system backend driver to support Windows,
including open, read, write, close, rename, remove, etc.

Symbolic link, link, chmod, renameat, unlinkat and extended attribute
are not supported due to limitations on Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h   |   4 +
 hw/9pfs/9p.h        |  22 ++++
 hw/9pfs/9p-local.c  | 273 +++++++++++++++++++++++++++++++++++++++++++-
 hw/9pfs/9p.c        |  85 +++++++++++++-
 hw/9pfs/codir.c     |  17 +++
 hw/9pfs/meson.build |  10 +-
 6 files changed, 408 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 97e681e167..44c584c9ef 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -43,6 +43,7 @@ static inline void close_preserve_errno(int fd)
     errno = serrno;
 }
 
+#ifndef CONFIG_WIN32
 static inline int openat_dir(int dirfd, const char *name)
 {
     return openat(dirfd, name,
@@ -89,6 +90,7 @@ again:
     errno = serrno;
     return fd;
 }
+#endif /* !CONFIG_WIN32 */
 
 ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
                              void *value, size_t size);
@@ -99,6 +101,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
+#ifndef CONFIG_WIN32
 /*
  * Darwin has d_seekoff, which appears to function similarly to d_off.
  * However, it does not appear to be supported on all file systems,
@@ -113,6 +116,7 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
     return dent->d_off;
 #endif
 }
+#endif /* !CONFIG_WIN32 */
 
 /**
  * qemu_dirent_dup() - Duplicate directory entry @dent.
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..171b907832 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -3,12 +3,34 @@
 
 #include <dirent.h>
 #include <utime.h>
+#ifndef CONFIG_WIN32
 #include <sys/resource.h>
+#endif
 #include "fsdev/file-op-9p.h"
 #include "fsdev/9p-iov-marshal.h"
 #include "qemu/thread.h"
 #include "qemu/coroutine.h"
 #include "qemu/qht.h"
+#ifdef CONFIG_WIN32
+
+#define O_NOCTTY            0
+#define O_NDELAY            0
+#define O_NONBLOCK          0
+#define O_DSYNC             0
+#define O_DIRECT            0
+#define O_NOFOLLOW          0
+#define O_NOATIME           0
+#define O_SYNC              0
+#define O_ASYNC             0
+#define O_DIRECTORY         02000000
+
+#define FASYNC              0
+
+#define AT_REMOVEDIR        1
+
+#define NAME_MAX            260
+
+#endif
 
 enum {
     P9_TLERROR = 6,
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..acc62d5fb9 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -18,15 +18,22 @@
 #include "qemu/osdep.h"
 #include "9p.h"
 #include "9p-local.h"
+#ifndef CONFIG_WIN32
 #include "9p-xattr.h"
+#endif
 #include "9p-util.h"
 #include "fsdev/qemu-fsdev.h"   /* local_ops */
+#ifndef CONFIG_WIN32
 #include <arpa/inet.h>
 #include <pwd.h>
 #include <grp.h>
 #include <sys/socket.h>
 #include <sys/un.h>
 #include "qemu/xattr.h"
+#else
+#include <dirent.h>
+#endif
+
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
@@ -38,7 +45,9 @@
 #include <linux/magic.h>
 #endif
 #endif
+#ifndef CONFIG_WIN32
 #include <sys/ioctl.h>
+#endif
 
 #ifndef XFS_SUPER_MAGIC
 #define XFS_SUPER_MAGIC  0x58465342
@@ -57,9 +66,68 @@ typedef struct {
     int mountfd;
 } LocalData;
 
+#ifdef CONFIG_WIN32
+static inline char *merge_fs_path(const char *path1, const char *path2)
+{
+    char *full_fs_path;
+    size_t full_fs_path_len;
+
+    full_fs_path_len = strlen(path1) + strlen(path2) +  2;
+    full_fs_path = g_malloc(full_fs_path_len);
+
+    strcpy(full_fs_path, path1);
+    strcat(full_fs_path, "\\");
+    strcat(full_fs_path, path2);
+
+    return full_fs_path;
+}
+
+static inline int opendir_with_ctx(FsContext *fs_ctx, const char *name)
+{
+    /* Windows do not support open a directory by open() */
+    return -1;
+}
+
+static inline int openfile_with_ctx(FsContext *fs_ctx, const char *name,
+                                    int flags, mode_t mode)
+{
+    char *full_fs_path;
+    int fd;
+
+    full_fs_path = merge_fs_path(fs_ctx->fs_root, name);
+    fd = open(full_fs_path, flags, mode);
+    g_free(full_fs_path);
+
+    return fd;
+}
+
+static inline int mkdir_with_ctx(FsContext *fs_ctx, const char *name)
+{
+    char *full_fs_path;
+    int fd;
+
+    full_fs_path = merge_fs_path(fs_ctx->fs_root, name);
+    fd = mkdir(full_fs_path);
+    g_free(full_fs_path);
+
+    return fd;
+}
+#endif
+
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode)
 {
+#ifdef CONFIG_WIN32
+    int fd;
+
+    if (path[strlen(path) - 1] == '/' || (flags & O_DIRECTORY) != 0) {
+        fd = opendir_with_ctx(fs_ctx, path);
+    } else {
+        fd = openfile_with_ctx(fs_ctx, path, flags, mode);
+    }
+
+    return fd;
+#else
     LocalData *data = fs_ctx->private;
     int fd = data->mountfd;
 
@@ -92,6 +160,7 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
 
     assert(fd != data->mountfd);
     return fd;
+#endif
 }
 
 int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
@@ -99,6 +168,7 @@ int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
 
+#ifndef CONFIG_WIN32
 static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
                                     const char *npath)
 {
@@ -181,12 +251,15 @@ static void local_mapped_file_attr(int dirfd, const char *name,
     }
     fclose(fp);
 }
+#endif /* !CONFIG_WIN32 */
 
 static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
 {
     int err = -1;
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
+
+#ifndef CONFIG_WIN32
     int dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
@@ -195,9 +268,21 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
     }
 
     err = fstatat(dirfd, name, stbuf, AT_SYMLINK_NOFOLLOW);
+#else
+    char *full_fs_path1, *full_fs_path2;
+
+    full_fs_path1 = merge_fs_path(fs_ctx->fs_root, dirpath);
+    full_fs_path2 = merge_fs_path(full_fs_path1, name);
+    err = stat(full_fs_path2, stbuf);
+
+    g_free(full_fs_path1);
+    g_free(full_fs_path2);
+#endif
     if (err) {
         goto err_out;
     }
+
+#ifndef CONFIG_WIN32
     if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
         /* Actual credentials are part of extended attrs */
         uid_t tmp_uid;
@@ -224,15 +309,19 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         local_mapped_file_attr(dirfd, name, stbuf);
     }
+#endif
 
 err_out:
+#ifndef CONFIG_WIN32
     close_preserve_errno(dirfd);
 out:
+#endif
     g_free(name);
     g_free(dirpath);
     return err;
 }
 
+#ifndef CONFIG_WIN32
 static int local_set_mapped_file_attrat(int dirfd, const char *name,
                                         FsCred *credp)
 {
@@ -456,10 +545,14 @@ static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
 
     return fchmodat_nofollow(dirfd, name, credp->fc_mode & 07777);
 }
+#endif /* !CONFIG_WIN32 */
 
 static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                               char *buf, size_t bufsz)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     ssize_t tsize = -1;
 
     if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
@@ -492,6 +585,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
         g_free(dirpath);
     }
     return tsize;
+#endif
 }
 
 static int local_close(FsContext *ctx, V9fsFidOpenState *fs)
@@ -520,9 +614,21 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
 static int local_opendir(FsContext *ctx,
                          V9fsPath *fs_path, V9fsFidOpenState *fs)
 {
-    int dirfd;
     DIR *stream;
 
+#ifdef CONFIG_WIN32
+    char *full_fs_path;
+
+    full_fs_path = merge_fs_path(ctx->fs_root, fs_path->data);
+    stream = opendir(full_fs_path);
+    g_free(full_fs_path);
+
+    if (!stream) {
+        return -1;
+    }
+#else
+    int dirfd;
+
     dirfd = local_opendir_nofollow(ctx, fs_path->data);
     if (dirfd == -1) {
         return -1;
@@ -533,6 +639,7 @@ static int local_opendir(FsContext *ctx,
         close(dirfd);
         return -1;
     }
+#endif
     fs->dir.stream = stream;
     return 0;
 }
@@ -547,17 +654,21 @@ static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
     return telldir(fs->dir.stream);
 }
 
+#ifndef CONFIG_WIN32
 static bool local_is_mapped_file_metadata(FsContext *fs_ctx, const char *name)
 {
     return
         !strcmp(name, VIRTFS_META_DIR) || !strcmp(name, VIRTFS_META_ROOT_FILE);
 }
+#endif
 
 static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 {
     struct dirent *entry;
 
+#ifndef CONFIG_WIN32
 again:
+#endif
     entry = readdir(fs->dir.stream);
     if (!entry) {
         return NULL;
@@ -572,6 +683,7 @@ again:
     entry->d_seekoff = off;
 #endif
 
+#ifndef CONFIG_WIN32
     if (ctx->export_flags & V9FS_SM_MAPPED) {
         entry->d_type = DT_UNKNOWN;
     } else if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
@@ -581,6 +693,7 @@ again:
         }
         entry->d_type = DT_UNKNOWN;
     }
+#endif
 
     return entry;
 }
@@ -637,6 +750,9 @@ static ssize_t local_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
 
 static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
@@ -661,11 +777,15 @@ out:
     g_free(dirpath);
     g_free(name);
     return ret;
+#endif
 }
 
 static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     int err = -1;
     int dirfd;
 
@@ -713,12 +833,14 @@ err_end:
 out:
     close_preserve_errno(dirfd);
     return err;
+#endif
 }
 
 static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
     int err = -1;
+#ifndef CONFIG_WIN32
     int dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
@@ -759,13 +881,25 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
             goto err_end;
         }
     }
+#else
+    char *full_fs_path;
+
+    full_fs_path = merge_fs_path(dir_path->data, name);
+    err = mkdir_with_ctx(fs_ctx, full_fs_path);
+    g_free(full_fs_path);
+#endif
     goto out;
 
+#ifndef CONFIG_WIN32
 err_end:
     unlinkat_preserve_errno(dirfd, name, AT_REMOVEDIR);
 out:
     close_preserve_errno(dirfd);
     return err;
+#else
+out:
+    return err;
+#endif
 }
 
 static int local_fstat(FsContext *fs_ctx, int fid_type,
@@ -774,7 +908,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
     int err, fd;
 
     if (fid_type == P9_FID_DIR) {
+#ifndef CONFIG_WIN32
         fd = dirfd(fs->dir.stream);
+#endif
     } else {
         fd = fs->fd;
     }
@@ -783,6 +919,7 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
     if (err) {
         return err;
     }
+#ifndef CONFIG_WIN32
     if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
         /* Actual credentials are part of extended attrs */
         uid_t tmp_uid;
@@ -810,6 +947,8 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
         errno = EOPNOTSUPP;
         return -1;
     }
+#endif
+
     return err;
 }
 
@@ -818,6 +957,8 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
 {
     int fd = -1;
     int err = -1;
+
+#ifndef CONFIG_WIN32
     int dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
@@ -864,16 +1005,27 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
             goto err_end;
         }
     }
+#else
+    char *full_fs_path;
+
+    full_fs_path = merge_fs_path(dir_path->data, name);
+    fd = openfile_with_ctx(fs_ctx, full_fs_path, flags, credp->fc_mode);
+    g_free(full_fs_path);
+#endif
     err = fd;
     fs->fd = fd;
     goto out;
 
+#ifndef CONFIG_WIN32
 err_end:
     unlinkat_preserve_errno(dirfd, name,
                             flags & O_DIRECTORY ? AT_REMOVEDIR : 0);
+#endif
     close_preserve_errno(fd);
 out:
+#ifndef CONFIG_WIN32
     close_preserve_errno(dirfd);
+#endif
     return err;
 }
 
@@ -881,6 +1033,9 @@ out:
 static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                          V9fsPath *dir_path, const char *name, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     int err = -1;
     int dirfd;
 
@@ -954,11 +1109,15 @@ err_end:
 out:
     close_preserve_errno(dirfd);
     return err;
+#endif
 }
 
 static int local_link(FsContext *ctx, V9fsPath *oldpath,
                       V9fsPath *dirpath, const char *name)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *odirpath = g_path_get_dirname(oldpath->data);
     char *oname = g_path_get_basename(oldpath->data);
     int ret = -1;
@@ -1028,6 +1187,7 @@ out:
     g_free(oname);
     g_free(odirpath);
     return ret;
+#endif
 }
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
@@ -1045,6 +1205,9 @@ static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
 
 static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
@@ -1071,11 +1234,26 @@ out:
     g_free(name);
     g_free(dirpath);
     return ret;
+#endif
 }
 
 static int local_utimensat(FsContext *s, V9fsPath *fs_path,
                            const struct timespec *buf)
 {
+#ifdef CONFIG_WIN32
+    struct utimbuf tm;
+    char *full_fs_path;
+    int err;
+
+    tm.actime = buf[0].tv_sec;
+    tm.modtime = buf[1].tv_sec;
+
+    full_fs_path = merge_fs_path(s->fs_root, fs_path->data);
+    err = utime(full_fs_path, &tm);
+    g_free(full_fs_path);
+
+    return err;
+#else
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int dirfd, ret = -1;
@@ -1091,8 +1269,10 @@ out:
     g_free(dirpath);
     g_free(name);
     return ret;
+#endif
 }
 
+#ifndef CONFIG_WIN32
 static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
                                  int flags)
 {
@@ -1136,9 +1316,27 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
 
     return unlinkat(dirfd, name, flags);
 }
+#endif /* !CONFIG_WIN32 */
 
 static int local_remove(FsContext *ctx, const char *path)
 {
+#ifdef CONFIG_WIN32
+    int err;
+    DIR *stream;
+    char *full_fs_path;
+
+    full_fs_path = merge_fs_path(ctx->fs_root, path);
+    stream = opendir(full_fs_path);
+    if (stream == NULL) {
+        err = remove(full_fs_path);
+    } else {
+        closedir(stream);
+        err = rmdir(full_fs_path);
+    }
+
+    g_free(full_fs_path);
+    return err;
+#else
     struct stat stbuf;
     char *dirpath = g_path_get_dirname(path);
     char *name = g_path_get_basename(path);
@@ -1166,11 +1364,15 @@ out:
     g_free(name);
     g_free(dirpath);
     return err;
+#endif
 }
 
 static int local_fsync(FsContext *ctx, int fid_type,
                        V9fsFidOpenState *fs, int datasync)
 {
+#ifdef CONFIG_WIN32
+    return 0;
+#else
     int fd;
 
     if (fid_type == P9_FID_DIR) {
@@ -1184,10 +1386,14 @@ static int local_fsync(FsContext *ctx, int fid_type,
     } else {
         return fsync(fd);
     }
+#endif
 }
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     int fd, ret;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
@@ -1197,48 +1403,67 @@ static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
     ret = fstatfs(fd, stbuf);
     close_preserve_errno(fd);
     return ret;
+#endif
 }
 
 static ssize_t local_lgetxattr(FsContext *ctx, V9fsPath *fs_path,
                                const char *name, void *value, size_t size)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_get_xattr(ctx, path, name, value, size);
+#endif
 }
 
 static ssize_t local_llistxattr(FsContext *ctx, V9fsPath *fs_path,
                                 void *value, size_t size)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_list_xattr(ctx, path, value, size);
+#endif
 }
 
 static int local_lsetxattr(FsContext *ctx, V9fsPath *fs_path, const char *name,
                            void *value, size_t size, int flags)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_set_xattr(ctx, path, name, value, size, flags);
+#endif
 }
 
 static int local_lremovexattr(FsContext *ctx, V9fsPath *fs_path,
                               const char *name)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_remove_xattr(ctx, path, name);
+#endif
 }
 
 static int local_name_to_path(FsContext *ctx, V9fsPath *dir_path,
                               const char *name, V9fsPath *target)
 {
+#ifndef CONFIG_WIN32
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
         errno = EINVAL;
         return -1;
     }
+#endif
 
     if (dir_path) {
         if (!strcmp(name, ".")) {
@@ -1275,6 +1500,9 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
                           const char *old_name, V9fsPath *newdir,
                           const char *new_name)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     int ret;
     int odirfd, ndirfd;
 
@@ -1340,18 +1568,34 @@ out:
     close_preserve_errno(ndirfd);
     close_preserve_errno(odirfd);
     return ret;
+#endif
 }
 
+#ifndef CONFIG_WIN32
 static void v9fs_path_init_dirname(V9fsPath *path, const char *str)
 {
     path->data = g_path_get_dirname(str);
     path->size = strlen(path->data) + 1;
 }
+#endif
 
 static int local_rename(FsContext *ctx, const char *oldpath,
                         const char *newpath)
 {
     int err;
+
+#ifdef CONFIG_WIN32
+    char *full_fs_path1;
+    char *full_fs_path2;
+
+    full_fs_path1 = merge_fs_path(ctx->fs_root, oldpath);
+    full_fs_path2 = merge_fs_path(ctx->fs_root, newpath);
+
+    err = rename(full_fs_path1, full_fs_path2);
+
+    g_free(full_fs_path1);
+    g_free(full_fs_path2);
+#else
     char *oname = g_path_get_basename(oldpath);
     char *nname = g_path_get_basename(newpath);
     V9fsPath olddir, newdir;
@@ -1365,6 +1609,7 @@ static int local_rename(FsContext *ctx, const char *oldpath,
     v9fs_path_free(&olddir);
     g_free(nname);
     g_free(oname);
+#endif
 
     return err;
 }
@@ -1372,6 +1617,9 @@ static int local_rename(FsContext *ctx, const char *oldpath,
 static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
                           const char *name, int flags)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     int ret;
     int dirfd;
 
@@ -1389,6 +1637,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     ret = local_unlinkat_common(ctx, dirfd, name, flags);
     close_preserve_errno(dirfd);
     return ret;
+#endif
 }
 
 #ifdef FS_IOC_GETVERSION
@@ -1416,6 +1665,7 @@ static int local_ioc_getversion(FsContext *ctx, V9fsPath *path,
 }
 #endif
 
+#ifndef CONFIG_WIN32
 static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **errp)
 {
 #ifdef FS_IOC_GETVERSION
@@ -1440,9 +1690,29 @@ static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **er
 #endif
     return 0;
 }
+#endif
+
 
 static int local_init(FsContext *ctx, Error **errp)
 {
+#ifdef CONFIG_WIN32
+    LocalData *data = g_malloc(sizeof(*data));
+    struct stat StatBuf;
+
+    if (stat(ctx->fs_root, &StatBuf) != 0) {
+        error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
+        goto err;
+    }
+
+    ctx->export_flags |= V9FS_PATHNAME_FSCONTEXT;
+
+    ctx->private = data;
+    return 0;
+
+err:
+    g_free(data);
+    return -1;
+#else
     LocalData *data = g_malloc(sizeof(*data));
 
     data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
@@ -1477,6 +1747,7 @@ static int local_init(FsContext *ctx, Error **errp)
 err:
     g_free(data);
     return -1;
+#endif
 }
 
 static void local_cleanup(FsContext *ctx)
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 225f31fc31..5c7a53841e 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -31,13 +31,19 @@
 #include "qemu/sockets.h"
 #include "virtio-9p.h"
 #include "fsdev/qemu-fsdev.h"
+#ifndef CONFIG_WIN32
 #include "9p-xattr.h"
+#endif
 #include "9p-util.h"
 #include "coth.h"
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
+#ifdef CONFIG_WIN32
+#define UTIME_NOW   ((1l << 30) - 1l)
+#define UTIME_OMIT  ((1l << 30) - 2l)
+#endif
 
 int open_fd_hw;
 int total_open_fd;
@@ -986,9 +992,11 @@ static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
     if (S_ISDIR(stbuf->st_mode)) {
         qidp->type |= P9_QID_TYPE_DIR;
     }
+#ifndef CONFIG_WIN32
     if (S_ISLNK(stbuf->st_mode)) {
         qidp->type |= P9_QID_TYPE_SYMLINK;
     }
+#endif
 
     return 0;
 }
@@ -1095,6 +1103,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
         ret |= S_IFDIR;
     }
 
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SYMLINK) {
         ret |= S_IFLNK;
     }
@@ -1104,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_NAMED_PIPE) {
         ret |= S_IFIFO;
     }
+#endif
     if (mode & P9_STAT_MODE_DEVICE) {
         if (extension->size && extension->data[0] == 'c') {
             ret |= S_IFCHR;
@@ -1116,6 +1126,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
         ret |= S_IFREG;
     }
 
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SETUID) {
         ret |= S_ISUID;
     }
@@ -1125,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_SETVTX) {
         ret |= S_ISVTX;
     }
+#endif
 
     return ret;
 }
@@ -1180,6 +1192,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_DIR;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISLNK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SYMLINK;
     }
@@ -1191,11 +1204,13 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
     }
 
+#ifndef CONFIG_WIN32
     if (stbuf->st_mode & S_ISUID) {
         mode |= P9_STAT_MODE_SETUID;
     }
@@ -1207,6 +1222,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (stbuf->st_mode & S_ISVTX) {
         mode |= P9_STAT_MODE_SETVTX;
     }
+#endif
 
     return mode;
 }
@@ -1245,9 +1261,16 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
             return err;
         }
     } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
+#ifndef CONFIG_WIN32
         v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
                 S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
                 major(stbuf->st_rdev), minor(stbuf->st_rdev));
+#else
+        v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
+                S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
+                0, 0);
+#endif
+
     } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
         v9fs_string_sprintf(&v9stat->extension, "%s %lu",
                 "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
@@ -1315,7 +1338,11 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
 static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 {
+#ifndef CONFIG_WIN32
     return blksize_to_iounit(pdu, stbuf->st_blksize);
+#else
+    return blksize_to_iounit(pdu, 0);
+#endif
 }
 
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
@@ -1329,6 +1356,14 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_gid = stbuf->st_gid;
     v9lstat->st_rdev = stbuf->st_rdev;
     v9lstat->st_size = stbuf->st_size;
+
+#ifdef CONFIG_WIN32
+    v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
+    v9lstat->st_blocks = 0;
+    v9lstat->st_atime_sec = stbuf->st_atime;
+    v9lstat->st_mtime_sec = stbuf->st_mtime;
+    v9lstat->st_ctime_sec = stbuf->st_ctime;
+#else /* !CONFIG_WIN32 */
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
     v9lstat->st_atime_sec = stbuf->st_atime;
@@ -1343,6 +1378,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
 #endif
+#endif /* CONFIG_WIN32 */
+
     /* Currently we only support BASIC fields in stat */
     v9lstat->st_result_mask = P9_STATS_BASIC;
 
@@ -2300,7 +2337,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
+#ifndef CONFIG_WIN32
         saved_dir_pos = qemu_dirent_off(dent);
+#else
+        saved_dir_pos = v9fs_co_telldir(pdu, fidp);
+#endif
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2501,14 +2542,28 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+#ifdef CONFIG_WIN32
+        /*
+         * Windows does not have dent->d_off, get offset by calling telldir()
+         * manually.
+         */
+        off = v9fs_co_telldir(pdu, fidp);
+#else
         off = qemu_dirent_off(dent);
+#endif
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
+#ifdef CONFIG_WIN32
+        len = pdu_marshal(pdu, 11 + count, "Qqbs",
+                          &qid, off,
+                          0, &name);
+#else
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
                           &qid, off,
                           dent->d_type, &name);
+#endif
 
         v9fs_string_free(&name);
 
@@ -2838,8 +2893,14 @@ static void coroutine_fn v9fs_create(void *opaque)
         }
 
         nmode |= perm & 0777;
+
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             makedev(major, minor), nmode, &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
+
         if (err < 0) {
             goto out;
         }
@@ -2864,8 +2925,12 @@ static void coroutine_fn v9fs_create(void *opaque)
         v9fs_path_copy(&fidp->path, &path);
         v9fs_path_unlock(s);
     } else if (perm & P9_STAT_MODE_SOCKET) {
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             0, S_IFSOCK | (perm & 0777), &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
         if (err < 0) {
             goto out;
         }
@@ -3600,6 +3665,7 @@ out_nofid:
 static void coroutine_fn v9fs_mknod(void *opaque)
 {
 
+#ifndef CONFIG_WIN32
     int mode;
     gid_t gid;
     int32_t fid;
@@ -3656,6 +3722,11 @@ out:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    V9fsPDU *pdu = opaque;
+
+    pdu_complete(pdu, -1);
+#endif
 }
 
 /*
@@ -3928,7 +3999,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -3945,6 +4016,7 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4006,10 +4078,15 @@ out_put_fid:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    V9fsPDU *pdu = opaque;
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static void coroutine_fn v9fs_readlink(void *opaque)
 {
+#ifndef CONFIG_WIN32
     V9fsPDU *pdu = opaque;
     size_t offset = 7;
     V9fsString target;
@@ -4045,6 +4122,10 @@ out:
     put_fid(pdu, fidp);
 out_nofid:
     pdu_complete(pdu, err);
+#else
+    V9fsPDU *pdu = opaque;
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static CoroutineEntry *pdu_co_handlers[] = {
@@ -4306,6 +4387,7 @@ void v9fs_reset(V9fsState *s)
 
 static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
 {
+#ifndef CONFIG_WIN32
     struct rlimit rlim;
     if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
         error_report("Failed to get the resource limit");
@@ -4313,4 +4395,5 @@ static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
     }
     open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
     open_fd_rc = rlim.rlim_cur / 2;
+#endif
 }
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 93ba44fb75..e75a9892eb 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -22,7 +22,9 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
+#ifndef CONFIG_WIN32
 #include "9p-xattr.h"
+#endif
 #include "9p-util.h"
 
 /*
@@ -78,6 +80,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
     int len, err = 0;
     int32_t size = 0;
     off_t saved_dir_pos;
+#ifdef CONFIG_WIN32
+    off_t next_dir_pos;
+#endif
     struct dirent *dent;
     struct V9fsDirEnt *e = NULL;
     V9fsPath path;
@@ -124,6 +129,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
             break;
         }
 
+#ifdef CONFIG_WIN32
+        next_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
+        if (next_dir_pos < 0) {
+            err = next_dir_pos;
+            goto out;
+        }
+#endif
+
         /*
          * stop this loop as soon as it would exceed the allowed maximum
          * response message size for the directory entries collected so far,
@@ -168,7 +181,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
+#ifndef CONFIG_WIN32
         saved_dir_pos = qemu_dirent_off(dent);
+#else
+        saved_dir_pos = next_dir_pos;
+#endif
     }
 
     /* restore (last) saved position */
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..fd15e1fd6b 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -1,5 +1,13 @@
 fs_ss = ss.source_set()
-fs_ss.add(files(
+fs_ss.add(when: 'CONFIG_WIN32', if_true: files(
+  '9p-local.c',
+  '9p.c',
+  'codir.c',
+  'cofile.c',
+  'cofs.c',
+  'coth.c',
+  'coxattr.c',
+), if_false: files(
   '9p-local.c',
   '9p-posix-acl.c',
   '9p-proxy.c',
-- 
2.25.1


