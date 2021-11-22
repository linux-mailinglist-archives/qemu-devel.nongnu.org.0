Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F375458782
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:53:18 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxa9-0003qz-Fc
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWZ-0004Ez-78
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:35 -0500
Received: from [2607:f8b0:4864:20::82b] (port=38581
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWX-0000y2-9T
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:34 -0500
Received: by mail-qt1-x82b.google.com with SMTP id 8so15110829qtx.5
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OppviOV0ENXWhcHY3INrgnTZBqYXRIokhy4By5SCg1Y=;
 b=MS83UT5+I5MW5elJkEpF7rdB6pRY+YeS5xNFlTNAL3IWgH/BU/9sDLS2Xa1+T+0SJV
 CpPcqo4wC4zBJccS4L03r6thqG2HnQBqpWMD49WIqT/cMMfn9dInezN6Jodft3UxVkjp
 IDX4TqpDHBTBMStC/cbPOrVDD3ppfXlb2Xm2RoOgUvxCcGtTQhpeVTbKuWU/Y9szPxgY
 JGwnzQ+NT/GyQ1NleWcuE50hTI+CFILzwaU2udBqp5jH0QVYtxr8rFlnj82DLRKmfXD2
 vJ5rtg2XmrxKYv74Ovz5vCP9vwOqjxdpl427HOgBCMfxWZ2qwNZAcv0opmKdDg3eo05x
 Er8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OppviOV0ENXWhcHY3INrgnTZBqYXRIokhy4By5SCg1Y=;
 b=MAtxo6fMFDKgHnLNoI7Pp1qejaYY4b8X4LWeUzJevb/NJPkB51yZ235CCfk9IADTbu
 hAkPQ5QFLFN+0nee2LcV0vqdPuc48nQ6f5VZdZlGiwqdj2+1PdYERlvcvOHM19XMY9wr
 QqsELqp2o8JhAzLH8BjFsPA1hH2TU5Tuayuf1gPEVDUZ9UfTSBntR93NoeZ5S361llOG
 ZMh/prUw9romw0wIkmxd/djryFslqmtnw+vXW9gnTBxXFC61YYTstpei+qryCYvZhbOH
 lOuse0Cg1i5JJKkW8quS1+35aKYZXIRdNf2iFkCejBfswjWOEOfuXc/SFMIDYH/p+Ef/
 /GQA==
X-Gm-Message-State: AOAM533ZLFzxl9nNJ1GWR345yyD5AhsW+F438sSsQ/M4LWZxGVEh35i7
 alazMjSdt905vW+YG0gDspd4YnuLvrpEDQ==
X-Google-Smtp-Source: ABdhPJyZkdwa3kBOMGnRk+NmjYhwzKE3WcPbwkH2LipF+b+bj5y16M0kTdsNYeVB94uQAwhI9zFUMw==
X-Received: by 2002:ac8:7f85:: with SMTP id z5mr26400402qtj.171.1637542172132; 
 Sun, 21 Nov 2021 16:49:32 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:31 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
Date: Sun, 21 Nov 2021 19:49:12 -0500
Message-Id: <20211122004913.20052-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
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
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
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
2.34.0


