Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC14ACC54
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:53:08 +0100 (CET)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCsd-0005LY-4x
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgc-0003vh-98
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:42 -0500
Received: from [2607:f8b0:4864:20::f33] (port=47013
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgW-0005hF-2H
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:39 -0500
Received: by mail-qv1-xf33.google.com with SMTP id n6so4327241qvk.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VM+D5+8bfRcQGTxMKpUe4iAtT0t/ScN/DEvPWxFfthw=;
 b=qOzRYUY6FbXF1ptpkMf0cM7ZrJFhihd9NdNCEwfBS3bFNcDHpY83bd2UzPK9tuq5Ir
 AZ2UoEXrEUDnzJW9Xh2ZxsABc9u87iNmZ9a5PT4EZyj2G0b5Dm+c9uoHAwXEneChyUqJ
 2VulODqRLx7UdpFgtLgDW2TZrE9yKzeoQi1WXFQpK4xS+lSCU2BKVp2/bb9TxtFGkqKp
 WierJ0zxTCLkSR2YojlTHj2kbcQV2uV53LCVa1yrUB3dUKNHxH5moT/0rty+xjSjrJe8
 d4IO89iXxmzrjL9CivTJw7sj8Qhczm+ER/HAG1cR6rtOjJlwi2rvxELAurmg+fGsy8Nh
 t5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VM+D5+8bfRcQGTxMKpUe4iAtT0t/ScN/DEvPWxFfthw=;
 b=ieDlGrXv6idMRxvossfHvOTGsx0HNtS7cCZUeX1dgVk4byI2jdoKzBbeJ/xhEYmACa
 9jt2syUjReumOucP++RtPT4Hmc22F05Z+nXyKWhRAgugRpJB2XMYXCdxFkFX0sNgulQ3
 N57Qv1oZ5/mDjCC/cAoc2m+IWdK2BvGdZ3l2D+KhFqAvYvsZl8SqaiMHijUmIrTdcO2I
 5I/J6QMcq8sweQfRhHuoKIOSlGzgURViqL+DrHOGK1O3KozaYO63jepUeJvk7f8ex9zx
 3DOOtW6TJl8sB/SaGSIcGClxTS/sdkQc0Ea3G3aaW8YfMXtJpKbTaposwyRPvC2M0nQa
 KB8g==
X-Gm-Message-State: AOAM533j6qHIe0jx1UT9wqLUt/FIvLOeLQrJ6iLpkQmxSq7BBqY/aueC
 KDX6VsPE6PFk/hq8OyT/EaiMvgSTiqLyuA==
X-Google-Smtp-Source: ABdhPJxCI06K0s7pknY8XxPnRLSjiyS4LOS38Iaeam2xaQ2pCD8zA3+iyRa+j+DnnBTCgTOmElzn2A==
X-Received: by 2002:a05:6214:2a8e:: with SMTP id
 jr14mr1239957qvb.74.1644273632139; 
 Mon, 07 Feb 2022 14:40:32 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:31 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/11] 9p: darwin: Handle struct dirent differences
Date: Mon,  7 Feb 2022 17:40:17 -0500
Message-Id: <20220207224024.87745-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf33.google.com
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
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin d_seekoff exists, but is optional and does not seem to
be commonly used by file systems. Use `telldir` instead to obtain
the seek offset and inject it into d_seekoff, and create a
qemu_dirent_off helper to call it appropriately when appropriate.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust to pass testing
             - Ensure that d_seekoff is filled using telldir
               on darwin, and create qemu_dirent_off helper
               to decide which to access]
[Fabian Franz: - Add telldir error handling for darwin]
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - Ensure that telldir error handling uses
               signed int
             - Cleanup of telldir error handling
             - Remove superfluous error handling for
               qemu_dirent_off
             - Adjust formatting
             - Use qemu_dirent_off in codir.c]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c |  9 +++++++++
 hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
 hw/9pfs/9p-synth.c |  4 ++++
 hw/9pfs/9p-util.h  | 16 ++++++++++++++++
 hw/9pfs/9p.c       |  7 +++++--
 hw/9pfs/codir.c    |  4 +++-
 6 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 1a5e3eed73..f3272f0b43 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -562,6 +562,15 @@ again:
     if (!entry) {
         return NULL;
     }
+#ifdef CONFIG_DARWIN
+    int off;
+    off = telldir(fs->dir.stream);
+    /* If telldir fails, fail the entire readdir call */
+    if (off < 0) {
+        return NULL;
+    }
+    entry->d_seekoff = off;
+#endif
 
     if (ctx->export_flags & V9FS_SM_MAPPED) {
         entry->d_type = DT_UNKNOWN;
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index b1664080d8..8b4b5cf7dc 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx, V9fsFidOpenState *fs)
 
 static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return readdir(fs->dir.stream);
+    struct dirent *entry;
+    entry = readdir(fs->dir.stream);
+#ifdef CONFIG_DARWIN
+    if (!entry) {
+        return NULL;
+    }
+    int td;
+    td = telldir(fs->dir.stream);
+    /* If telldir fails, fail the entire readdir call */
+    if (td < 0) {
+        return NULL;
+    }
+    entry->d_seekoff = td;
+#endif
+    return entry;
 }
 
 static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 4a4a776d06..e264a03eef 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
 {
     strcpy(entry->d_name, node->name);
     entry->d_ino = node->attr->inode;
+#ifdef CONFIG_DARWIN
+    entry->d_seekoff = off + 1;
+#else
     entry->d_off = off + 1;
+#endif
 }
 
 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 546f46dc7d..d41f37f085 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -79,3 +79,19 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
 #endif
+
+
+/**
+ * Darwin has d_seekoff, which appears to function similarly to d_off.
+ * However, it does not appear to be supported on all file systems,
+ * so ensure it is manually injected earlier and call here when
+ * needed.
+ */
+inline off_t qemu_dirent_off(struct dirent *dent)
+{
+#ifdef CONFIG_DARWIN
+    return dent->d_seekoff;
+#else
+    return dent->d_off;
+#endif
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 1563d7b7c6..caf3b240fe 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -27,6 +27,7 @@
 #include "virtio-9p.h"
 #include "fsdev/qemu-fsdev.h"
 #include "9p-xattr.h"
+#include "9p-util.h"
 #include "coth.h"
 #include "trace.h"
 #include "migration/blocker.h"
@@ -2281,7 +2282,7 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = qemu_dirent_off(dent);
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2420,6 +2421,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsString name;
     int len, err = 0;
     int32_t count = 0;
+    off_t off;
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
@@ -2480,12 +2482,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+        off = qemu_dirent_off(dent);
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
-                          &qid, dent->d_off,
+                          &qid, off,
                           dent->d_type, &name);
 
         v9fs_string_free(&name);
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 032cce04c4..8e66205d9d 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -22,6 +22,8 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
+#include "9p-xattr.h"
+#include "9p-util.h"
 
 /*
  * Intended to be called from bottom-half (e.g. background I/O thread)
@@ -167,7 +169,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = qemu_dirent_off(dent);
     }
 
     /* restore (last) saved position */
-- 
2.32.0 (Apple Git-132)


