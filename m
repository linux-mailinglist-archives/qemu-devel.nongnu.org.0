Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A294B1361
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:48:13 +0100 (CET)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICc7-0005BC-Na
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WW-000328-PV
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:12 -0500
Received: from [2607:f8b0:4864:20::72a] (port=45772
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WT-0004G0-3t
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:12 -0500
Received: by mail-qk1-x72a.google.com with SMTP id b22so4732198qkk.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usoXj/aS1VhYctCFHSsTirdJcm/7xjAPuTTAm7+v4eQ=;
 b=DsMkQ4rbrqdtWewZyUEhE/4IdM+NMO39Tnl3yAcNxuV0bb9++n2iUX1ubVMzsppbuE
 XhYGuaWoxFlYbeYjO27yiST3t86i2mtkdYzqnM52JKEpNcxwnNnCnSIMqnfARec7Eyaq
 CZWRB4ofcEGOmfdQVnQmJgBtLBXxR+kWcvoGqzGDkkrM9+mn1HlDvEl+H5R5BkOqtBB/
 gmL4Ir/M7Tk5Kvk+x918v7Va0afunxpbza3frv4oHuZS3DZNHDXH/ilpm6sZ5PeoMn3o
 D2JHkk90htY8gutc68oqU856ij44HxJWB+MeFhryLA7XQDCh3KiEaI3nFBGioJMjlwOj
 xcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usoXj/aS1VhYctCFHSsTirdJcm/7xjAPuTTAm7+v4eQ=;
 b=5rhpBTevZuhBPUeA+sncQzjQ4t0Hf8LKUms6nkgLEvi57WvLYdbyCAtqjFcwx7c7xG
 Tg+CRW4tFWxgTUHXPxMx06rr+S4p3Ekz3/n7/I28N/QyMD+YOUOsl/XAdwR+8G4LXM2G
 q4GNv5YSomXO1fK6RECwm+g3wpBKMM6imzD7ORCatAsXx+jW3LrhNi2eA1QIKXj3v2Z1
 tMULbmhWdf2FSXmizuL9+hG1YvUnLN5vk5zjfPDDQifCT4gp31a87nMx+545NHu/sIaw
 IeELy7pAAplZDb+SgjKSZmhNAXuySwwvhVTPEsiz9GB7hD5rHQXMH9El9iyJEQY2nTx6
 o0KQ==
X-Gm-Message-State: AOAM533iUtnUovq08r7B32Pt8/XTRctxzywKutOByjqz/4hntXIHluvs
 evH+SLQP9AnBRIW7fVeXZgEkabTX5Wbxww==
X-Google-Smtp-Source: ABdhPJzeDf/+YYxZOkh0wUoN9OELDmMeRmnMsiAVTOSgDdxpnEdql9CvEVhIvZMd5+ujwq5bnnx5Cg==
X-Received: by 2002:a05:620a:74e:: with SMTP id
 i14mr3708166qki.674.1644499806083; 
 Thu, 10 Feb 2022 05:30:06 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:05 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/11] 9p: darwin: Handle struct dirent differences
Date: Thu, 10 Feb 2022 08:29:39 -0500
Message-Id: <20220210132946.2303-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72a.google.com
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
2.34.1


