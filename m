Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F74B74C8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:46:22 +0100 (CET)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3mH-0001JG-HD
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38E-00011b-PV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:58 -0500
Received: from [2607:f8b0:4864:20::836] (port=42544
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38C-0002lT-FP
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:58 -0500
Received: by mail-qt1-x836.google.com with SMTP id s1so19503043qtw.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EB8tJkFyv0t4GdFE0KqllcD+blasxRu406yEHevMwSc=;
 b=cR9+tPRN4rtlc4IOX949GROCSX81Q1ESQclGgB1057mo8lX0CGipzdM1mlRqJvsViX
 No6ztMx35bQ5jDsxXxsPnUW8u0EMwS6ne5zuxaG+Ob+F7e6W/zfdQlNWBnwmROXpgMDL
 SGsv9opE3PVr4rQJLxYn/BgqVEzFuvpHxgCWu+bWzO0ayhGnrcyfqee92qFM5tOiDqJB
 FFeklC21/oDEUu6yiY3dkoLKZ6yhKLHw1tOhHbsc+W0XqaUhNbi0ZShbSuQOpAkQSTBV
 48dROSpspM3/sc76wr7wEwzOdv3VpkxG51MFbYMyq161/trB/CWgyy48dOHsvpSTbI5D
 jbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EB8tJkFyv0t4GdFE0KqllcD+blasxRu406yEHevMwSc=;
 b=wxBs1kv811JxQBWXIf3qUeXXNM31gPxFpQnhkqW6z/KsbpBW0ojpzmYy0FoXLxOUv0
 TilpwtCEz6liEeqaOhH69JcqSzGp182T6oTdjEb84+Ne70uWn+JO9pT1GOKRYYYHTI4z
 LXPuBnoy5ud6X74mCFb+BjVauS23yiQKhViZFcqdgAJEA/ilBmA85EdZbAwDMUNI8OPI
 dEBbqQhGyI931JZI+U7hiXG/Sn1RZ78RUG5sc5SVzPNLbZPohMsx7dkVB5XbeTA1re/E
 iCkV4P180UIo/lpWCa0no0nyDXrhSpNh/UiIlELjsIapx5sbem/6HWT+QDP+jkd7o9XB
 f8PQ==
X-Gm-Message-State: AOAM532CzBxNZZanc0WyFZZJe/1JrVT+O2CwVV3xjX+4Q7pG8RLaZ3vA
 gYPBj/Q4/OwhrvWLfdNTqkcA9UYsTghRqg==
X-Google-Smtp-Source: ABdhPJxahFa2X5PiQzx/B2DlgzY6vd416+XNAYqbBbHgjpdI0LPRTKJwp1lqj4WlOAKcyD3H6fKIrw==
X-Received: by 2002:a05:622a:249:: with SMTP id
 c9mr414794qtx.109.1644951895192; 
 Tue, 15 Feb 2022 11:04:55 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:54 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Tue, 15 Feb 2022 14:04:24 -0500
Message-Id: <20220215190426.56130-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
               presence in osdep.h and os-posix.c]
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
index d1660d67fa..fb25cafcc4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -805,6 +805,18 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
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
2.34.1


