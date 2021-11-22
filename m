Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B7458780
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:51:45 +0100 (CET)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxYd-0007wq-Tj
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWV-00044m-AO
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:31 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=41631
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWS-0000x0-OE
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:31 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id m17so11306471qvx.8
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ooNc9C+/G+PaEVIqBJRV5jh7i77KYYOu/GB9/LuUlxA=;
 b=kbCGJnl4MEe0FBxsKhNp5c0N91Uvz2Rb9d+0jGJ2ymkLwt7b0jfJI+8FJYz4KFu3ce
 UofQ1SkljAyh0dKoveFQWfzKQo+qW64PDqjxn99iY3+rG3GhXNS7bx+KyFeGpeIzqTMa
 CRadpvMFM7cUxT+ezX1MQhEqz3lZ0hUVOIJ9snBMWWK0UKM4z+f553tzN22SWaP7PNEK
 zR1PSuWTQ2BKvOIggl6R0xQPqoFnuatiQmQE+twy2Ii7WY/Pa0uAp5iev4Z2hnW071Xa
 rB+XGwIcentVUVy4nyse9345kgHHKBMf+x8ufBPoEjUWM8UEfj8CFwX8kNB2cR9vvqQM
 Nw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooNc9C+/G+PaEVIqBJRV5jh7i77KYYOu/GB9/LuUlxA=;
 b=fCetWyr1n/1sRdFmJfSjqbDzSbY/LFFNhooEFgE5pm7pMLKullFTwEniNcY5O/ONdc
 DxMOyv3lMaqwMfayMPeOXn6lykT0900H+SHIcwFQvY1WkoV2fn3+C+LOmh0lLAQGav3L
 a0srCAUaOhAxAILrYPcJ1GMMFUG9phhXEpHyv31rMSOvNQEYIv+eLxGFkpHxyzn3uwdg
 n6ayAIsPZmJkubUJ3WzKyUWNG/2rgwmi2J2v8MpkpDyrlxeerJpGWsDwVJ4yTe9cpjy0
 aWItUaesuWI8onGKALTzp0MSPk9Rh6DNljrWj4s5j9NIvM/9N8meP+RjcAVcKhf4gg2Z
 vJYw==
X-Gm-Message-State: AOAM532hP7V/fS6U7/3ShwyhL1iwdQPxLJ+f/2OXAg6xhSar9tA/lZf7
 s8oU0ChIp2elmWoRLqhlr1Bn50bZep4+zw==
X-Google-Smtp-Source: ABdhPJx2fklUq3Dw9JtudVYe9w0qF7q7bPF2nTkbNnYvdm/ox9QI1W7C5aYgFx+IC8KI+L10l3QmpA==
X-Received: by 2002:ad4:40c6:: with SMTP id x6mr95054211qvp.32.1637542167824; 
 Sun, 21 Nov 2021 16:49:27 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:27 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
Date: Sun, 21 Nov 2021 19:49:06 -0500
Message-Id: <20211122004913.20052-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2b.google.com
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

On darwin d_seekoff exists, but is optional and does not seem to
be commonly used by file systems. Use `telldir` instead to obtain
the seek offset.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
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
index f4f0c200c7..c06e8a85a0 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2218,6 +2218,25 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
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
@@ -2281,7 +2300,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
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
@@ -2420,6 +2443,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsString name;
     int len, err = 0;
     int32_t count = 0;
+    off_t off;
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
@@ -2480,12 +2504,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
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
2.34.0


