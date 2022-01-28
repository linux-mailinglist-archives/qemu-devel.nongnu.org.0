Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E381449F04F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:04:46 +0100 (CET)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFgz-0001Vn-OA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZP-0003aB-8h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: from [2607:f8b0:4864:20::834] (port=44815
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005O4-RG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: by mail-qt1-x834.google.com with SMTP id b5so3963638qtq.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBECTmjM2onpbZnXU8iCbFT2QFZXJu7p1kfYnJYBjXQ=;
 b=XE5w4GQ0jGFRBB5r1Ir4zhn0vj7fq7L6dh7iNvZSfqbn1DSGtHLSzsQ9fZhpdtGucB
 hAjiaHRDajL5Ujb7TJEIcoaTyWgJISvgLp01ED8EfHv8WpGsRRshbxng2yY5lIrlWmgA
 93uUDtbYwM0Wdp1EaDz7oyg+5SmvKhBD1qYKeQkZEqkT7NOQWvjUST+FSD8OPnZA7US8
 5YUFqJNV08wjjoQRDX/Ne/OT8LEX9yxe5WvaJDylGRKK9UHlNpEAcS421IBYTK6QpKHo
 kdFoVOidwKiz9432N18cvMtZknmw/IY6GZvWvLZ4vh7JgA1vIteBmYHokjtRnyCe1+sH
 BKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBECTmjM2onpbZnXU8iCbFT2QFZXJu7p1kfYnJYBjXQ=;
 b=vW/509vQoeDn9JGTTMJWm9t2JX4aHU/hmNyqee0qVb6hx+3D12BXIrbCX/DwVCJeMh
 QM+XBiIN4eM8OStu7XfWUnxHbMHn8GWfhSiyfJb1S+uHwYOe319nhQChPZcX39lBP+3Q
 TLABLyQhiHObqbhlb/qpcz1n8iHgN3v5ZTbWJFTz7u4+zeriB0mtQ/F/F4E5qiTh1JOI
 /N42DtqR4uxV7Z8A3s5NpDv6zFeKUUVhgdyrue5UCawosdG66vEAGc9G7NMsTki+ZOSt
 LPEAMx6zA3AfDZmuW1HGHa/vvvu+nDvLuOkr0jWVTOvSgrTGiMkDy7RBd4QAqV5TPBXC
 n5JQ==
X-Gm-Message-State: AOAM532Vap5lDt7knyFe3L6lQOBdbazFUjodQ5MHYAfojWwvJOj/2tU+
 yIPSNilgGy3n3/YFdIrzMqGgMefyjyo+fA==
X-Google-Smtp-Source: ABdhPJxkZVGSHsGzeGfYIPIDhAvDbo0Uv+/5BRIXIMcJQzlSr3QgMY1c7nAW5rxC/wP3axBNatgVSA==
X-Received: by 2002:ac8:7caa:: with SMTP id z10mr4796982qtv.356.1643331395366; 
 Thu, 27 Jan 2022 16:56:35 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:34 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Thu, 27 Jan 2022 19:56:09 -0500
Message-Id: <20220128005611.87185-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
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
However, luckily there is a solution: Darwin as an (unexposed in the
C library) system call that sets the cwd for the current thread only.
This should suffice to use mknod safely.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style
             - Replace clang references with gcc]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c       |  5 +++--
 hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util-linux.c  |  5 +++++
 hw/9pfs/9p-util.h        |  2 ++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 2bfff79b12..3a8bdf05d5 100644
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
index cdb4c9e24c..62a88ce4f9 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -62,3 +62,36 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
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
+#pragma gcc diagnostic push
+#pragma gcc diagnostic ignored "-Wdeprecated-declarations"
+    return syscall(SYS___pthread_fchdir, fd);
+#pragma gcc diagnostic pop
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
index 398614a5d0..66e0ab1865 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -62,3 +62,8 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     g_free(proc_path);
     return ret;
 }
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return mknodat(dirfd, filename, mode, dev);
+}
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 38ef8b289d..bff9b3022c 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -97,4 +97,6 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+
 #endif
-- 
2.34.1


