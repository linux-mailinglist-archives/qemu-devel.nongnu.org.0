Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28024ACC2E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:43:44 +0100 (CET)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCjX-0006ze-LR
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCge-0003yE-3E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:44 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=42749
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgb-0005j5-5l
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:43 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id k9so12607614qvv.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvnPEGx9iqV8W0nDvi4JEWZEM9Qvo0QihLOjBamLuVQ=;
 b=LF8Je+PsVsMKRmEcObOt6PDHPVMMwysq+HoaVvGiuejR9cy5r6S4v3qS+PQoHn3mMo
 7yNfEvyfrU7eMlZ92g5q0Vdhmu2EDzw73fP3XACJSmrEyX7hMyFQwElQRR8BLRku2Cfj
 DVvFuHEBpQAjiTxUqEhQKpEo/h936AwtarUttV7VQh5Rj+JjqF0Vkhhid+Vq5D+Lvcs2
 wsu/pmFpo/AV7fBSWpASCilcA0UbFUF/IyVJCzqVz7gevgXzLtQYKeUDwJSUMrTizsUZ
 hE2j3NfYNvawb0gVbE8gd54h17BT8kGtlDFB3nQKkI3X43/oizqqJcTSGRgHZYoMfWpx
 2M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvnPEGx9iqV8W0nDvi4JEWZEM9Qvo0QihLOjBamLuVQ=;
 b=IpI6VGeL1NLM6/DtO3OSji40S7YdzZOLZ/jpQZ1H0v9CPaMiLTI01cygUSKRRU2xqH
 EjaRyLHG/YdXYVbMWeLc/EJfl7RSdVtAWsagiq31Ut6R+N50jBZZ0DIpJqBTKypU6hP/
 LF8OIXy9ZyGpQw+ygP3dLTUq3DfovVrCAXFlea999qGsmQLE4LMYXFC4btsYiS6lBmsk
 aOvGSRFlqJUekz92oI5u6gmaWMv+oQhuWiAV2ytUZ7BdxPvndRGSxiT1+5VcP78PzGWW
 Qt2uNJyqfJMLUpMqCrxQrCOZR3SG/1i4VlOKJSPIYmfVkANlxQlRxZLHS9ipEVPEj8ll
 XvAQ==
X-Gm-Message-State: AOAM532TYO/GgsoaNoNXaQxqbL7xgZotVItTLDhFH+JR1v4I2a3BECWy
 8rngLv0zstqGYGOUBeoQhPH+e6sVRBdBjA==
X-Google-Smtp-Source: ABdhPJxZ+DbF1nMD9KVIdj22UnG8dCU3MoN6JirHMiCVfBeSO3wRPYzHs9QFg8+jNsCWp+oSgwN9pw==
X-Received: by 2002:a05:6214:20af:: with SMTP id
 15mr1234558qvd.105.1644273638595; 
 Mon, 07 Feb 2022 14:40:38 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:38 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon,  7 Feb 2022 17:40:22 -0500
Message-Id: <20220207224024.87745-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2f.google.com
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
meson in a patch later in tihs series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style
             - Replace clang references with gcc
             - Note radar filed with Apple for missing syscall
             - Replace direct syscall with pthread_fchdir_np and
               adjust patch notes accordingly
             - Move qemu_mknodat from 9p-util to osdep and os-posix]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c   |  4 ++--
 include/qemu/osdep.h | 10 ++++++++++
 os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 2 deletions(-)

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
index d1660d67fa..f3a8367ece 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -810,3 +810,13 @@ static inline int platform_does_not_support_system(const char *command)
 #endif
 
 #endif
+
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed. qemu_mknodat is defined in
+ * os-posix.c
+ */
+#ifdef CONFIG_DARWIN
+int pthread_fchdir_np(int fd);
+#endif
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..95c1607065 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <os/availability.h>
 #include <sys/wait.h>
 #include <pwd.h>
 #include <grp.h>
@@ -332,3 +333,36 @@ int os_mlock(void)
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
+int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    int preserved_errno, err;
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
2.32.0 (Apple Git-132)


