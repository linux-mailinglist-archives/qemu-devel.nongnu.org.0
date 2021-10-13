Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E342CFCD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:03:57 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapA4-0006HA-C3
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIi-00048e-Hl
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:47 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIa-0004Im-JI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:42 -0400
Received: by mail-qt1-x831.google.com with SMTP id v17so4214812qtp.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vVs/dBq7+SyTYJ14HganCJ9O2Sc24EHmVDkbP22ig4=;
 b=YUtYsRP1Z+CFn8DJ1FPhfUwPW0ynHEaDZ5x1ans6+xNKYqrEVsM6JI2Uw1PLpoTyjI
 3KnYAMekgKxyoz+BiCSIt8J71nwo3DjNgJkjOVKxeF3yldCrfSOWFpOylnVADMGH8260
 hKjPyj596oCKz/BEr+fsbw6xNZ2f3hN9UT9vxsrRKHdKZwLYhCmDfvF/iY5XHo+l6B0v
 coT5Xir5IHXBJTvUw/s9WMCqg8m1gHiBrnQOh7v30QmAPtWUBNxm26QTnAPrddnL5Bn1
 7IwResJNXmgaqFK5f7kWZxUTMe4ZzY+ZUKSOfzl9FzKiMbw0uKgcxNgb2T0RqsLj3ofd
 MbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vVs/dBq7+SyTYJ14HganCJ9O2Sc24EHmVDkbP22ig4=;
 b=EgFJrsBPtYfx0rW4aKPBvRwmKXBpQ/xdT/VX5m1gdax6dkxfuUPqturRPnGx+++Cjc
 OzE1FKhIRi5+lmg37sd3AUlm6uIBb5TUCMEN+c0NvFStO9nHUeF/2+fOp+fr6vZ97iAs
 Yp5PHGMEUGlWxI5BJf5wLIdxDDQ0BZqWA6VBVrMWZFiEnhvQRmfjv2oFAcsQWV4mM2YG
 F5NHkTulETnL9/jUj0VAB86yvYg4+3BQ/Epz2eYzZ/K70APoibxoNnV4vqCLn6q6etrn
 naXdQgcm8wW0PsYpslpxt864uTFDzfYFZXCbfwxoAuTa6gSmfCe+mScj1EoBVZERmQth
 IORQ==
X-Gm-Message-State: AOAM5312ACRwAkN9DGIvH+YiAXREg+YxIlqG31i18xgG+5ob2e5jlVN2
 c8v50JLHMH4Yqqw6rjhRGtHiqySKVsdh3w==
X-Google-Smtp-Source: ABdhPJwgnOEIsokMP37nAFy7iRdcwqF/2Y/KXPRbr404BlOMAQ02YC6hXIkSRdZmxY5FDygCNGsgAA==
X-Received: by 2002:ac8:10a:: with SMTP id e10mr2534314qtg.406.1634166274964; 
 Wed, 13 Oct 2021 16:04:34 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:34 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] 9p: darwin: Handle struct dirent differences
Date: Wed, 13 Oct 2021 19:03:58 -0400
Message-Id: <20211013230405.32170-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin d_seekoff exists, but is optional and does not seem to
be commonly used by file systems. Use `telldir` instead to obtain
the seek offset.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
---
 hw/9pfs/9p-synth.c |  2 ++
 hw/9pfs/9p.c       | 33 +++++++++++++++++++++++++++++++--
 hw/9pfs/codir.c    |  4 ++++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 4a4a776d06..09b9c25288 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -222,7 +222,9 @@ static void synth_direntry(V9fsSynthNode *node,
 {
     strcpy(entry->d_name, node->name);
     entry->d_ino = node->attr->inode;
+#ifndef CONFIG_DARWIN
     entry->d_off = off + 1;
+#endif
 }
 
 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 17b62d72fc..2464ffeb94 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2202,6 +2202,25 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
     return offset;
 }
 
+/**
+ * Get the seek offset of a dirent. If not available from the structure itself,
+ * obtain it by calling telldir.
+ */
+static int v9fs_dent_telldir(V9fsPDU *pdu, V9fsFidState *fidp,
+                             struct dirent *dent)
+{
+#ifdef CONFIG_DARWIN
+    /*
+     * Darwin has d_seekoff, which appears to function similarly to d_off.
+     * However, it does not appear to be supported on all file systems,
+     * so use telldir for correctness.
+     */
+    return telldir(fidp->fs.dir.stream);
+#else
+    return dent->d_off;
+#endif
+}
+
 static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
                                                   V9fsFidState *fidp,
                                                   uint32_t max_count)
@@ -2265,7 +2284,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = v9fs_dent_telldir(pdu, fidp, dent);
+        if (saved_dir_pos < 0) {
+            err = saved_dir_pos;
+            break;
+        }
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2404,6 +2427,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsString name;
     int len, err = 0;
     int32_t count = 0;
+    off_t off;
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
@@ -2464,12 +2488,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+        off = v9fs_dent_telldir(pdu, fidp, dent);
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
index 032cce04c4..78aca1d98b 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -167,7 +167,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
+#ifdef CONFIG_DARWIN
+        saved_dir_pos = telldir(fidp->fs.dir.stream);
+#else
         saved_dir_pos = dent->d_off;
+#endif
     }
 
     /* restore (last) saved position */
-- 
2.33.0


