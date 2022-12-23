Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E466D654F89
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzs-0007hE-Di; Fri, 23 Dec 2022 06:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com>)
 id 1p8fzq-0007gz-LM
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:50 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com>)
 id 1p8fzo-0007eb-OC
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=lqC9lEIA5RFx7eEW6LF74zK/StDZFYQEnrEcY+FkB4Y=; b=CXhCH
 UE6T9gPpE/IbA/LJOOuh4m1OFlEQm10bPge6dEgMz3e2yuzTKAq+/Sy33hVwRba8IiKSFw4a2DaCK
 plLLz7W7gQi0N91W/5kpurTD6q5auUs9mKRaND7Wkx9f6/+KymjjSpXPSxd+hMaWjbM6/cJrCKU84
 vQTABLMcCwq9KSskUq8Biw4fphufzAHkXE0GJSAY4Y8+u95gDRb7i8vtbnGRCTatE1e8qjpm3zqzD
 +qUHFwHapHEYv/9mSVQzM82x8SY3SnZ14+vWv1XV6DcYEz9Yp8kU4XC4dshVjXgWfT4Zuaj0Tpu+Y
 3bHfl7LVvB3c44WlGi+8umYriKDmQ==;
Message-Id: <6ca60cd7a388a776d72739e5a404e65c19460511.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 5/5] hw/9pfs: Replace the direct call to xxxat() APIs with a
 wrapper
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Bin Meng <bin.meng@windriver.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

xxxat() APIs are only available on POSIX platforms. For future
extension to Windows, let's replace the direct call to xxxat()
APIs with a wrapper.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221219102022.2167736-4-bin.meng@windriver.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-local.c | 32 ++++++++++++++++----------------
 hw/9pfs/9p-util.h  | 15 +++++++++++----
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..d2246a3d7e 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -103,14 +103,14 @@ static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
                                     const char *npath)
 {
     int serrno = errno;
-    renameat(odirfd, opath, ndirfd, npath);
+    qemu_renameat(odirfd, opath, ndirfd, npath);
     errno = serrno;
 }
 
 static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
 {
     int serrno = errno;
-    unlinkat(dirfd, path, flags);
+    qemu_unlinkat(dirfd, path, flags);
     errno = serrno;
 }
 
@@ -194,7 +194,7 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
         goto out;
     }
 
-    err = fstatat(dirfd, name, stbuf, AT_SYMLINK_NOFOLLOW);
+    err = qemu_fstatat(dirfd, name, stbuf, AT_SYMLINK_NOFOLLOW);
     if (err) {
         goto err_out;
     }
@@ -253,7 +253,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
             }
         }
     } else {
-        ret = mkdirat(dirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(dirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             return -1;
         }
@@ -349,7 +349,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
      */
 
      /* First, we clear non-racing symlinks out of the way. */
-    if (fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW)) {
+    if (qemu_fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW)) {
         return -1;
     }
     if (S_ISLNK(stbuf.st_mode)) {
@@ -734,7 +734,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        err = mkdirat(dirfd, name, fs_ctx->dmode);
+        err = qemu_mkdirat(dirfd, name, fs_ctx->dmode);
         if (err == -1) {
             goto out;
         }
@@ -750,7 +750,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
-        err = mkdirat(dirfd, name, credp->fc_mode);
+        err = qemu_mkdirat(dirfd, name, credp->fc_mode);
         if (err == -1) {
             goto out;
         }
@@ -990,7 +990,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         int omap_dirfd, nmap_dirfd;
 
-        ret = mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             goto err_undo_link;
         }
@@ -1085,7 +1085,7 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
         goto out;
     }
 
-    ret = utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
+    ret = qemu_utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
     close_preserve_errno(dirfd);
 out:
     g_free(dirpath);
@@ -1116,7 +1116,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
             if (fd == -1) {
                 return -1;
             }
-            ret = unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
+            ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
             close_preserve_errno(fd);
             if (ret < 0 && errno != ENOENT) {
                 return -1;
@@ -1124,7 +1124,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
         }
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
         if (map_dirfd != -1) {
-            ret = unlinkat(map_dirfd, name, 0);
+            ret = qemu_unlinkat(map_dirfd, name, 0);
             close_preserve_errno(map_dirfd);
             if (ret < 0 && errno != ENOENT) {
                 return -1;
@@ -1134,7 +1134,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
         }
     }
 
-    return unlinkat(dirfd, name, flags);
+    return qemu_unlinkat(dirfd, name, flags);
 }
 
 static int local_remove(FsContext *ctx, const char *path)
@@ -1151,7 +1151,7 @@ static int local_remove(FsContext *ctx, const char *path)
         goto out;
     }
 
-    if (fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW) < 0) {
+    if (qemu_fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW) < 0) {
         goto err_out;
     }
 
@@ -1296,7 +1296,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         return -1;
     }
 
-    ret = renameat(odirfd, old_name, ndirfd, new_name);
+    ret = qemu_renameat(odirfd, old_name, ndirfd, new_name);
     if (ret < 0) {
         goto out;
     }
@@ -1304,7 +1304,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         int omap_dirfd, nmap_dirfd;
 
-        ret = mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             goto err_undo_rename;
         }
@@ -1321,7 +1321,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         }
 
         /* rename the .virtfs_metadata files */
-        ret = renameat(omap_dirfd, old_name, nmap_dirfd, new_name);
+        ret = qemu_renameat(omap_dirfd, old_name, nmap_dirfd, new_name);
         close_preserve_errno(nmap_dirfd);
         close_preserve_errno(omap_dirfd);
         if (ret < 0 && errno != ENOENT) {
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index ccfc8b1cb3..c314cf381d 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -94,6 +94,13 @@ static inline int errno_to_dotl(int err) {
 #define qemu_fgetxattr fgetxattr
 #endif
 
+#define qemu_openat     openat
+#define qemu_fstatat    fstatat
+#define qemu_mkdirat    mkdirat
+#define qemu_renameat   renameat
+#define qemu_utimensat  utimensat
+#define qemu_unlinkat   unlinkat
+
 static inline void close_preserve_errno(int fd)
 {
     int serrno = errno;
@@ -103,8 +110,8 @@ static inline void close_preserve_errno(int fd)
 
 static inline int openat_dir(int dirfd, const char *name)
 {
-    return openat(dirfd, name,
-                  O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
+    return qemu_openat(dirfd, name,
+                       O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
 }
 
 static inline int openat_file(int dirfd, const char *name, int flags,
@@ -115,8 +122,8 @@ static inline int openat_file(int dirfd, const char *name, int flags,
 #ifndef CONFIG_DARWIN
 again:
 #endif
-    fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
-                mode);
+    fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
+                     mode);
     if (fd == -1) {
 #ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
-- 
2.30.2


