Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A64C5F83
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:43:16 +0100 (CET)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSG3-0002zw-TB
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS90-0006UV-JE
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:58 -0500
Received: from [2607:f8b0:4864:20::f30] (port=40692
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8y-000346-Qh
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:58 -0500
Received: by mail-qv1-xf30.google.com with SMTP id fc19so11024058qvb.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHiQ7cPhOTC7ZJN/pt7YZwNKBlBpq71we+N9cKrG0TI=;
 b=g0BzJ9ZlX15SSa0f6waeE2gHfFrcl7an8u00F3/6v712+J+wm91UOc5fn1XQqmkLej
 3uXql76HVJfCFknLbHebOcpe/1m8ZwOmcUnvIcTsXz+skxWN024ETXkfyMnJeCBNepJe
 9HAHo1ARrFGnm2JR9Xvrf8k/nD8y5jxwl8Z//lwPqiOStgDJq7xZwX6yVyBNQEsmdEG/
 c03nzlOzA3Voy72u6Icv3VSdXcmvHD7ydYHOcRm37DL2rIGvLE6HWiUo3g89pHrOcnfV
 hrAm1E+s70qUb7JDAJlOTCs5meA/yZkoJOJmZJqIh59vi4xsjNVfzcpYlbnatbUuswZ8
 1AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHiQ7cPhOTC7ZJN/pt7YZwNKBlBpq71we+N9cKrG0TI=;
 b=WvG/h9pMj7A22VpdSbcUMogtSG8pngL6trkRBR4NZJ4b8jMYefthrP4KhpTLDcnRhE
 KYaIw0VjClFeV4E7y7N509qhzC5Ov0P2XU4+/xb6sSsZA8HYr8AQom2jLKKu8qC8Xt3F
 HFrD3QFU/voWfj9il05x2zYPBak4WO+kovx/5g6Ch/nkxF+VTnrRlZNnn9EqW6ltCbCx
 tobCcz/Pwp6CJh4N1ZYo8J6UO35nFAcGPoU4VAfVOTbaHHUQoilnh1jBKPZDWLwOuAn9
 k59blQiVCh3u6sAZwaljFjwOfj3a2hZ6jYyk7+I0QWfofUet/Zi/apcxqLNvK2rWh8JY
 RpZg==
X-Gm-Message-State: AOAM533YN0+UbOts6cwrNQKormcVBe7Ri92lXv7vALK+usf2fPaNf43x
 K1nyO39hjwR1lSp/6Kxbrb4K4v50D4MJkw==
X-Google-Smtp-Source: ABdhPJxik1HV6cWXaVzWfXzyjOlX6sf95R5vH3eVIvesObPokZhGH1Cnr8FvwLMAcm3xvBpxDfN0mQ==
X-Received: by 2002:a05:6214:c4d:b0:432:91ff:ddc3 with SMTP id
 r13-20020a0562140c4d00b0043291ffddc3mr11842041qvj.9.1646001355502; 
 Sun, 27 Feb 2022 14:35:55 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:54 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Sun, 27 Feb 2022 17:35:20 -0500
Message-Id: <20220227223522.91937-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf30.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
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
index 9abff79884..1f74d37558 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -112,5 +112,16 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
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
index 8df40bfac4..3f8dca2c7a 100644
--- a/meson.build
+++ b/meson.build
@@ -1609,6 +1609,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP', cc.has_function('pthread_fchdir_np'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
-- 
2.35.1


