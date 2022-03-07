Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513334CFE28
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:22:59 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCOA-00045x-CG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <029ed1bd9defa33a80bb40cdcd003699299af8db@lizzy.crudebyte.com>)
 id 1nRCHg-0002jm-Kr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:16:16 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <029ed1bd9defa33a80bb40cdcd003699299af8db@lizzy.crudebyte.com>)
 id 1nRCHe-0007a4-M1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=MSuNWzMRc8KYD7UTwnKgKBQ7UJltx57Fx3duo5Tg36A=; b=Kj7oB
 1tRxT9Zo6AAF4fYBINqvDSn26D1XbsrMGDDBLUQvsAMkvQiEoTp4W+QQ4FOKRaN3jQFUfJN38mII3
 jubsI+LEw6ppdK7DpXE08PRnzdlbpXH+L6e1Kkkt4L1vcscWw2IVm4gxJT97kgTHcMV0VD0ydWSIM
 uGNyn2xDvZlNnaXHnOUaN1Ub9QqT6watpdqff0BSVlas07iN7Hucn5PewTl6DgLK2xf/SOeKCBgMk
 KKCYWXW8iqPiXUS4etEkd8YeEvzoH1RELt9Cs05x0hz/1jydxY14rRWneEDye4HRa19gz8AGh5KUV
 MO+lg/6sXGmlLVUH0DxNagd9OMjRg==;
Message-Id: <029ed1bd9defa33a80bb40cdcd003699299af8db.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 09/19] 9p: darwin: Implement compatibility for mknodat
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=029ed1bd9defa33a80bb40cdcd003699299af8db@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin does not support mknodat. However, to avoid race conditions
with later setting the permissions, we must avoid using mknod on
the full path instead. We could try to fchdir, but that would cause
problems if multiple threads try to call mknodat at the same time.
However, luckily there is a solution: Darwin includes a function
that sets the cwd for the current thread only.
This should suffice to use mknod safely.

This function (pthread_fchdir_np) is protected by a check in
meson in a patch later in this series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style
             - Replace clang references with gcc
             - Note radar filed with Apple for missing syscall
             - Replace direct syscall with pthread_fchdir_np and
               adjust patch notes accordingly
             - Declare pthread_fchdir_np with
             - __attribute__((weak_import)) to allow checking for
               its presence before usage
             - Move declarations above cplusplus guard
             - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
               presence in 9p-util
             - Rebase to apply cleanly on top of the 2022-02-10
               changes to 9pfs
             - Fix line over 90 characters formatting error]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Message-Id: <20220227223522.91937-10-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-local.c       |  4 ++--
 hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util-linux.c  |  6 ++++++
 hw/9pfs/9p-util.h        | 11 +++++++++++
 meson.build              |  1 +
 5 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index a0d08e5216..d42ce6d8b8 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
+        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
         if (err == -1) {
             goto out;
         }
@@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
-        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
+        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
         if (err == -1) {
             goto out;
         }
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index cdb4c9e24c..bec0253474 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -7,6 +7,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu/xattr.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "9p-util.h"
 
 ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
@@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     close_preserve_errno(fd);
     return ret;
 }
+
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed.
+ *
+ * Radar filed with Apple for implementing mknodat:
+ * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
+ */
+#if defined CONFIG_PTHREAD_FCHDIR_NP
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    int preserved_errno, err;
+    if (!pthread_fchdir_np) {
+        error_report_once("pthread_fchdir_np() not available on this version of macOS");
+        return -ENOTSUP;
+    }
+    if (pthread_fchdir_np(dirfd) < 0) {
+        return -1;
+    }
+    err = mknod(filename, mode, dev);
+    preserved_errno = errno;
+    /* Stop using the thread-local cwd */
+    pthread_fchdir_np(-1);
+    if (err < 0) {
+        errno = preserved_errno;
+    }
+    return err;
+}
+
+#endif
diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
index 398614a5d0..db451b0784 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -61,4 +61,10 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     ret = lsetxattr(proc_path, name, value, size, flags);
     g_free(proc_path);
     return ret;
+
+}
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return mknodat(dirfd, filename, mode, dev);
 }
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index be8dc1a43a..73b08c5561 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -114,5 +114,16 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
 #endif
 }
 
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed. qemu_mknodat is defined in
+ * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
+ * in case it disappears in future macOS versions, because it is
+ * is a private API.
+ */
+#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
+int pthread_fchdir_np(int fd) __attribute__((weak_import));
+#endif
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
 
 #endif
diff --git a/meson.build b/meson.build
index 038502714a..40598630e6 100644
--- a/meson.build
+++ b/meson.build
@@ -1622,6 +1622,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP', cc.has_function('pthread_fchdir_np'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
-- 
2.20.1


