Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B44AB1ED
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:10:49 +0100 (CET)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnrx-0003hM-EZ
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp2-000109-QI
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:46 -0500
Received: from [2607:f8b0:4864:20::835] (port=37853
 helo=mail-qt1-x835.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp0-0001P0-QF
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:44 -0500
Received: by mail-qt1-x835.google.com with SMTP id k25so10416438qtp.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJyODe9ehnMtKfd0wxTheYqR+Y6NpRJnSCt+IuPoDHE=;
 b=gpEPYa+PDercGaP89q5QsOhBpsuDhFmlhSGy5nY4FpQWiW7/wlwWFYd21sy/dBvC1c
 QRJ60ZJoPDDQGpk194JR5Mdsele81pWWp3nSPlCA/tkmC+LhACPSaA0vx2UULBrdZeWc
 73/MDPrLxebSw1a3aso1LNJXqGlg/W3PFUCAv2RQrz+IhwDH3VBGhRPHjezTrkk+KnCn
 ntBtZNL4lDPcPAI+Xnmv3iQ0TOsMljNURdJnXHbNl7f0+2SYU+xOT6vdKin23HskJ9J7
 zaq17zKCKQR25cKAVjY7lFWnlavzlB3x6qN9ZIy+TvXt5UgklJoApjTgBH6OKfrMLoIZ
 7pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJyODe9ehnMtKfd0wxTheYqR+Y6NpRJnSCt+IuPoDHE=;
 b=HIhnDKFMvdhpAViv17ih6kYbJMa4nenk4aWYR8pe8LXujO64gK1SAF26LB6PQ1yTBz
 e2BC+IsQis6k8o58ja3QmVWlBT/oElRsSYZgRNjcpNEYOpzs0UNrmdn2Gxm531CP/A1Y
 a4IladbbUe/MdIWrna9cmqz9lPGzz0IWebeGmJk+245NBr2+s2ietK4wVpeqVqZjMqZf
 QdXHWC9ujTrGqAYNlImaVoxzUrYIn9Woa3lhPRBdzxcDltLW049mURXmQqY/QtQtb3qq
 JxJQiX/B0RuhfMeB7lwrryeLjbkgQcv2u7jq9XCho1nGBsbTtLnUYXYhkB9OFq2BN0wu
 xEYw==
X-Gm-Message-State: AOAM530uD4+rMrkjTaJy92uTLvkH8RcQWqYQhJFhVae3kTILCjIaQ3dO
 FBgqWEP0a5G4/PxP8VGF8XddZ9Vfce1YiQ==
X-Google-Smtp-Source: ABdhPJw8Vy1jqKThWDgmOmBSEC8PDI3rSajo/4Eyjz7kY25rFt9DyCBKPZkegzDhEtNYcVOnV9N9sg==
X-Received: by 2002:ac8:7c43:: with SMTP id o3mr5955051qtv.103.1644178061663; 
 Sun, 06 Feb 2022 12:07:41 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:41 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
Date: Sun,  6 Feb 2022 15:07:12 -0500
Message-Id: <20220206200719.74464-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::835
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x835.google.com
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
[Will Cohen: - Ensure that telldir error handling uses
               signed int]
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c |  9 +++++++++
 hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
 hw/9pfs/9p-synth.c |  4 ++++
 hw/9pfs/9p-util.h  | 17 +++++++++++++++++
 hw/9pfs/9p.c       | 15 +++++++++++++--
 hw/9pfs/codir.c    |  7 +++++++
 6 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 1a5e3eed73..7137a28109 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 
 again:
     entry = readdir(fs->dir.stream);
+#ifdef CONFIG_DARWIN
+    int td;
+    td = telldir(fs->dir.stream);
+    /* If telldir fails, fail the entire readdir call */
+    if (td < 0) {
+        return NULL;
+    }
+    entry->d_seekoff = td;
+#endif
     if (!entry) {
         return NULL;
     }
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
index 546f46dc7d..accbec9987 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
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
+
+inline off_t qemu_dirent_off(struct dirent *dent)
+{
+#ifdef CONFIG_DARWIN
+    return dent->d_seekoff;
+#else
+    return dent->d_off;
+#endif
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 1563d7b7c6..cf694da354 100644
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
@@ -2281,7 +2282,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = qemu_dirent_off(dent);
+        if (saved_dir_pos < 0) {
+            err = saved_dir_pos;
+            break;
+        }
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsString name;
     int len, err = 0;
     int32_t count = 0;
+    off_t off;
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
@@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+        off = qemu_dirent_off(dent);
+        if (off < 0) {
+            err = off;
+            break;
+        }
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
-                          &qid, dent->d_off,
+                          &qid, off,
                           dent->d_type, &name);
 
         v9fs_string_free(&name);
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 032cce04c4..fac6759a64 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
+        /* This conditional statement is identical in
+         * function to qemu_dirent_off, described in 9p-util.h,
+         * since that header cannot be included here. */
+#ifdef CONFIG_DARWIN
+        saved_dir_pos = dent->d_seekoff;
+#else
         saved_dir_pos = dent->d_off;
+#endif
     }
 
     /* restore (last) saved position */
-- 
2.32.0 (Apple Git-132)


