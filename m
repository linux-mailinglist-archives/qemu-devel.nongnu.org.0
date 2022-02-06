Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65A4AB1F0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:11:10 +0100 (CET)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnsI-0003oj-Kv
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:11:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp9-00011F-Lx
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:51 -0500
Received: from [2607:f8b0:4864:20::f32] (port=37679
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp7-0001RG-VK
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:51 -0500
Received: by mail-qv1-xf32.google.com with SMTP id a19so3179395qvm.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8lMcBD/VnfwG9BkRPxYEUbTKuDoWhdtD4gEpoOssSE=;
 b=e6GvmrAsyuzuF0pvaJNE++qqAmSahj0pte0kM3hq/AlvkbrYrQzcMv6HLopeiTnWWF
 O2j+fRjU/km6BwyxZTYBcOCxxz3cP/400RMJeSf8+Ocqz3hu53OzfpNVvb2rMITCjBpp
 E4/fw7RPSzJfU4XWbDnbIEj6gE1wsFlEjCH8281mHsHcRrVXuvbsNAVO8+4jnj27iMSJ
 BF1tFCjewbN683+eVYLGkqBPMgBXGuzPBdSlCXPQryQ7aOnhNK0QdwBMwJHBYqa11MQU
 wRGgXOFg142LlgVjD52Z/RpVwyiP6rOdGEhPUkxmXdadu+pUUOU5VLUMM5Phn5IdEwBx
 RHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8lMcBD/VnfwG9BkRPxYEUbTKuDoWhdtD4gEpoOssSE=;
 b=Ete3JeMPLH5rblV8dAgmPsmATotAHovlpQN2h5mOsbgkU9ZMolw19BTECiRYNo4mhE
 i/w2AsdWGtDha6JN5BPyvj9xlxXSsk98gWJW43FI8lt1c76CcuAiclqwhLpK/nEavlLu
 jiLGeku6Z4eOiQUtHvWgl3yZEJTKGCNi2dTWsym7VRDkRfg0Ns0OC+uw2x+BLNpCO56w
 REH7epiO/2LwXimNmIN9jZPCJ86KGHuW9e6d00wWomr8dBtCTaBCZgb6NE+y40BkpQ1i
 QFHAxon9j7GS0cNV5/LQHY7QVR3LirL/9ULcBfDAuCfYv93+63ohKPvBNikLrjEAYGIe
 aOqQ==
X-Gm-Message-State: AOAM533Q6fH+lxXsMcB9JjSlzzjZsLI4+blKzwgskev7um/Dre9fjhPL
 xRe6rk+qnrfmkRTzI0M+I9LBMq9ZorNJ7g==
X-Google-Smtp-Source: ABdhPJzKyHXJVmD/cSAV4Fx5Y/6+02u/Wnj3e/Vbz9y0EDzGDyWFKpTRBdc8/viACcMFDph6R6R4+g==
X-Received: by 2002:ad4:5ca4:: with SMTP id q4mr8516147qvh.64.1644178068775;
 Sun, 06 Feb 2022 12:07:48 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:48 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Sun,  6 Feb 2022 15:07:17 -0500
Message-Id: <20220206200719.74464-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf32.google.com
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
               adjust patch notes accordingly]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c       |  5 +++--
 hw/9pfs/9p-util-darwin.c | 27 +++++++++++++++++++++++++++
 hw/9pfs/9p-util-linux.c  |  5 +++++
 hw/9pfs/9p-util.h        |  2 ++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index ea3ded5fca..0569a8b4de 100644
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
@@ -710,6 +710,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
 
 err_end:
     unlinkat_preserve_errno(dirfd, name, 0);
+
 out:
     close_preserve_errno(dirfd);
     return err;
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index cdb4c9e24c..128b6d87e8 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -5,6 +5,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include <os/availability.h>
 #include "qemu/osdep.h"
 #include "qemu/xattr.h"
 #include "9p-util.h"
@@ -62,3 +63,29 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
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
index 8e610ad224..f6fed963bf 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -97,6 +97,8 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+
 #endif
 
 
-- 
2.32.0 (Apple Git-132)


