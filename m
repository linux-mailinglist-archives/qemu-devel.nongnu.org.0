Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762A42CFCE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:06:13 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapCG-0001Yj-5V
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIo-0004A7-DC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:50 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIm-0005CP-HN
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:49 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id d20so2704840qvm.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iK7VkZJP7Xh1BP8SXElMLoZneEkphjNP/5mpdr4DGzo=;
 b=gZURG3wmxGpjrT6hI46r0aVOg7fgnsDn3+li92IbhVGgRf9RJshBnmWeBnlyINyCNW
 oPBZ3/LcZtdIitfBUzZwkmtu+QKL83uGOO1O71mZiPXYlzUKs3Ay87k/I2CmIal33VKd
 2+Lk7bLeVaNQnMrQkYwlWGgXLz2yIUXs3OuAvjB5Y/2R+hiViMehOeyD5aS6lT/5lb1H
 +dJWLTo5OXyRZSwloCCE3Ophfx5iWlDWBLaT4rYZjEYtjXOjhVsigersg1aQI/ZG//3e
 lqFsJuDCuXBWFdlQVXRP1ZnCKe2yevwmABRQ1FwTj8FCfrEiqho+kqWQfHofHtZLL7ib
 N/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iK7VkZJP7Xh1BP8SXElMLoZneEkphjNP/5mpdr4DGzo=;
 b=08GuNFc8Bv57fkjB29iZn+6kQ2O9WOcoKnVC7eqeqEYw59xlsxRlZKiuuyfKTZ+lpW
 jeTGjVvKOLbU52WD7Thrb5X2138aocRCZ/5F/nEimoNTdfQpbR1t+yPIISVm+ZiYPpmP
 cDzBBgTL4J/RwdApebF83FA41JmJNsBCzxy5f5YYP/lQ3ENuAoPGqOCaH/ywnOZHee7M
 F1Ypr2aFxu8Cr6v1rOvtoqiojHy1zwoGz0w620oKW6aEP3Y6C+4gjsvTS0PzhVbcTxGo
 o1mwTOZ7VKZziq11h35jzXbXRTYJfpwXAnxrWZG2STMhdhxF3ytBjwfJyhAzNA+lEwF6
 a8bQ==
X-Gm-Message-State: AOAM532A+qVMMoGA5lIl2GS6wervWf/JEm/jrzWD/050lRlJj4GJZhV6
 3+9j0P67gFVaeEE5ksfhDRR8G8HkUOgg8A==
X-Google-Smtp-Source: ABdhPJzakJi9xnwM7Hb51j236z2NRNLE/QUhXAac08gvG+wW4lCqkXovzga+xskmj78YX0nJdeaBCg==
X-Received: by 2002:a05:6214:2b4:: with SMTP id
 m20mr2075033qvv.54.1634166286202; 
 Wed, 13 Oct 2021 16:04:46 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:46 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] 9p: darwin: Implement compatibility for mknodat
Date: Wed, 13 Oct 2021 19:04:04 -0400
Message-Id: <20211013230405.32170-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>, Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin does not support mknodat. However, to avoid race conditions
with later setting the permissions, we must avoid using mknod on
the full path instead. We could try to fchdir, but that would cause
problems if multiple threads try to call mknodat at the same time.
However, luckily there is a solution: Darwin as an (unexposed in the
C library) system call that sets the cwd for the current thread only.
This should suffice to use mknod safely.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c       |  5 +++--
 hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util-linux.c  |  5 +++++
 hw/9pfs/9p-util.h        |  2 ++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 4268703d05..42b65e143b 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
+        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
         if (err == -1) {
             goto out;
         }
@@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
-        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
+        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
         if (err == -1) {
             goto out;
         }
@@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
 
 err_end:
     unlinkat_preserve_errno(dirfd, name, 0);
+
 out:
     close_preserve_errno(dirfd);
     return err;
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index ac414bcbfd..25e67d5067 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -158,3 +158,36 @@ done:
     close_preserve_errno(fd);
     return ret;
 }
+
+#ifndef SYS___pthread_fchdir
+# define SYS___pthread_fchdir 349
+#endif
+
+/*
+ * This is an undocumented OS X syscall. It would be best to avoid it,
+ * but there doesn't seem to be another safe way to implement mknodat.
+ * Dear Apple, please implement mknodat before you remove this syscall.
+ */
+static int fchdir_thread_local(int fd)
+{
+#pragma clang diagnostic push
+#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+    return syscall(SYS___pthread_fchdir, fd);
+#pragma clang diagnostic pop
+}
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    int preserved_errno, err;
+    if (fchdir_thread_local(dirfd) < 0) {
+        return -1;
+    }
+    err = mknod(filename, mode, dev);
+    preserved_errno = errno;
+    /* Stop using the thread-local cwd */
+    fchdir_thread_local(-1);
+    if (err < 0) {
+        errno = preserved_errno;
+    }
+    return err;
+}
diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
index d54bf57a59..4f57d8c047 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char *filename,
 {
     return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
 }
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return mknodat(dirfd, filename, mode, dev);
+}
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 1c477a0e66..cac682d335 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
 int utimensat_nofollow(int dirfd, const char *filename,
                        const struct timespec times[2]);
 
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+
 #endif
-- 
2.33.0


