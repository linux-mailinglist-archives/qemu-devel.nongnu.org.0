Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCA4B13E8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:11:33 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICyh-0008W3-Ek
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9XG-0003E7-2D
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:59 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=35531
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9X7-0004X9-O1
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:51 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id d7so4936633qvk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzjbpO9p8KRoVB5z+ohlhfny2IOfDnlQXdIOA6h5zXA=;
 b=YDG+FR0m8RCvCfUTaV9Msj5LJBxKDvZNEgdTdHouCzbaKPjtZYiR+XFS/ZBWGwg0g9
 YSYTvURpSLkVXaE1Jl3NbsM05fXWSkzFJLfyh2OdfKlwWeGRm0LdrGbkCWVEEZOgYZg+
 dj8gaBVX/tJWvBbX5l6YDh/lH5SsJ2HBC0KGdB2teWmO8bcoykC3nmsww23HAylGRHGc
 r2iwOIyTzlTnbogVNwpjjRzzlUxGp25ZwtRPQmK93Lw7Jjc7Q+twxmRUjxzsPnwRlmek
 IT5w+GnhUKErA5CbgsAm36W6LOptl66kkRJTNZJI4295zY1e8A6PgpoQ8YjkALwkIk6Y
 nS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzjbpO9p8KRoVB5z+ohlhfny2IOfDnlQXdIOA6h5zXA=;
 b=s6sybpyH+HarKQO/cfLH6sNtx9qKAumDWI8eBHbUuKxEU/n2rsgpTc1P5oMotHRCjA
 Q0GmHm1Z6jxqFiATwapYYByHDqKJ5kgeLF8nus6qn0ixKDjA0aCngjniHaiP5l3pS1QW
 wax4Bc/xMF35dIu6s3juYX9BzEkLrDoWJlcfns2e0arRN0/uaxQh3alsYarzAjCH14yu
 1WgwOJdhrHcsUaZDesMqdRMvpE+14WQ1pPRjnV3YSFAX2X/DhpSLq5yhtK2VJPKCiv58
 AsCh30R5jFlwCS1gInWLkka3RylNEd3uzQ/HdCeJG6rmXU7QqVD/hClCwC/vIBANfN70
 vCvw==
X-Gm-Message-State: AOAM532XTO5nWhuGxYIGg6wzgbVze6I0cx4bHoQ2yjKNoGnyKsjDF7lg
 Bck3tRTqLA9LcLvumn0KSMg7bJncpG3mqw==
X-Google-Smtp-Source: ABdhPJy5/e0UmscFhHwUxLOxNr7aaHPpf2ARtHQZaUsTY8qZwVcvxsmRXMJYS4esU3ZW4gAspSu56g==
X-Received: by 2002:a05:6214:238a:: with SMTP id
 fw10mr4829662qvb.15.1644499821320; 
 Thu, 10 Feb 2022 05:30:21 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:20 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Thu, 10 Feb 2022 08:29:44 -0500
Message-Id: <20220210132946.2303-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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
             - Move declarations above cplusplus guard]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c   |  4 ++--
 include/qemu/osdep.h | 12 ++++++++++++
 os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 2 deletions(-)

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
index d1660d67fa..d8cc7240ed 100644
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
+#ifdef CONFIG_DARWIN
+int pthread_fchdir_np(int fd) __attribute__((weak_import));
+#endif
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..28a294b8b3 100644
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
+#ifdef CONFIG_DARWIN
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


