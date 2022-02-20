Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBDF4BD00E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:06:08 +0100 (CET)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpex-0002lb-Lk
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQm-0007sP-9l
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:28 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=44648
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQj-0000E4-OA
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:27 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id p7so26015839qvk.11
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0c1m62r37cps3SE4YtHaNnVH3ko3NP7UbCqOmgH+Bw=;
 b=Z9uy30n5olSE0quZ9vrPXrOXTPcZoLsB6lEZhwawslefIo4ZrLBPa6Fjkv0SXBn+5a
 W+psEM6joyOUcCI97GPBSdxhtTBT11gn6XtqW++J6VDk46ji1pJVsY036x9eVdZUMAbu
 beMwqo5C2YzX1AO7f+fVEDoRVqM3zOx4hUcA4Eh487YXIvVjBSQeW2WcsPASpLKNhk7C
 GHC7uvxeN0XC0Z2zqgYjeG56lirptccM3nQJmnKjo8Lx1CtG7E11mEoCTW2L5rJqzX5i
 3pYyMOyh8ocdvIrxNEmR98e9nkg+1AQrcvijjVYtTHrHOHz02N5nNzcbHJ3B82sHEFEN
 igSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0c1m62r37cps3SE4YtHaNnVH3ko3NP7UbCqOmgH+Bw=;
 b=U3KPgei8MtxPO+so1ehQL07/7uk8i7RozppB43awvGBvzZ+U0QjZ/uAzH94FZf6jhP
 YbKnzQ308lt5jV86IMD5Ah86A8SxdKbZuUizmeeWxI4KYm1sgh1LGe909sjFib/Xd5pw
 cPkpZSBUXe6GcO8FzuSSEMOdgWjsRg4pD5DGnretO/bedjwJXW0eB6hFEEfVnCbdtuYy
 2B38qZFPytFL0K62M9T9B8XAnuBNGoFRHTcEvLofp54Z+mrmXN5ioBW4QW6VHYzaEYnH
 VudaN4MF9/q8FutNirYQsKRGmr0h+TVHu7AU4vsooZcv2ET4BV8lIE6PBIiP2r+Hnlrc
 QDOw==
X-Gm-Message-State: AOAM533fv410Tw/Ry0Q02ICAulX/f5z5tdvYnGUpTh4RXvIOJGqgBVFN
 XzC/chA1P687T2tQG3vxLvCYUWBwWKUloA==
X-Google-Smtp-Source: ABdhPJz3emzztBJ0HqCm/S89SVJD+9mqnokiRu2i7sHG0eALTzOlbC4fXBrwCCrslt3gL9WhwFokRQ==
X-Received: by 2002:a05:6214:21ed:b0:42c:11d1:70cd with SMTP id
 p13-20020a05621421ed00b0042c11d170cdmr12525478qvj.115.1645375884547; 
 Sun, 20 Feb 2022 08:51:24 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:24 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Sun, 20 Feb 2022 11:50:54 -0500
Message-Id: <20220220165056.72289-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
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
             - Move qemu_mknodat from 9p-util to osdep and os-posix
             - Move pthread_fchdir_np declaration only to osdep
             - Declare pthread_fchdir_np with
             - __attribute__((weak_import)) to allow checking for
               its presence before usage
             - Move declarations above cplusplus guard
             - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
               presence in osdep.h and os-posix.c
             - Rebase to apply cleanly on top of the 2022-02-10
               changes to 9pfs]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c   |  4 ++--
 include/qemu/osdep.h | 12 ++++++++++++
 meson.build          |  1 +
 os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 2 deletions(-)

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
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ce12f64853..c0f442d791 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -818,6 +818,18 @@ static inline int platform_does_not_support_system(const char *command)
  */
 struct dirent *qemu_dirent_dup(struct dirent *dent);
 
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
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/meson.build b/meson.build
index ae5f7eec6e..6fdc0281ad 100644
--- a/meson.build
+++ b/meson.build
@@ -1557,6 +1557,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP', cc.has_function('pthread_fchdir_np'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..ccc3d1e9d3 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -332,3 +332,38 @@ int os_mlock(void)
     return -ENOSYS;
 #endif
 }
+
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed.
+ *
+ * Radar filed with Apple for implementing mknodat:
+ * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
+ */
+#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    int preserved_errno, err;
+    if (!pthread_fchdir_np) {
+        error_report_once("pthread_fchdir_np() is not available on this version of macOS");
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
+#else
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return mknodat(dirfd, filename, mode, dev);
+}
+#endif
-- 
2.35.1


