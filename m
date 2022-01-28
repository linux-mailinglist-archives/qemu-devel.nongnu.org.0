Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF349F075
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:19:50 +0100 (CET)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFvX-0001XQ-Ck
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZR-0003dt-Bq
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:57 -0500
Received: from [2607:f8b0:4864:20::f36] (port=45951
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZL-0005NX-0f
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: by mail-qv1-xf36.google.com with SMTP id i19so4409751qvx.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zp+EMGVpVNmgWiSPGrSsPSWTihkyvGY1vKyISKW41I=;
 b=lBlOuz7yKBI4YFBFmcN7BJNctDrGOM38o3CsJQyRg3u9U/FIICunO0rAN/BZe2sZhx
 P21d6pCRiRGuxBzcHLXfspDZGxKzvMoc7wzpSxjlNd2k6lndgbLZHWuxkrSQOFFq8RhX
 eVFa9ccBIHgUSFpfquY2xwIaj/4mjtMRbdIxbDZINGJJEsn/7fj3e8wd8Yoz9YDfz1od
 odfEzlPH3PsyTIs+lshC15S8LoS/vgtX+tQRlCAHdJFNSGWHvynfo2GVe9/r92wSJFvh
 SYUgtwTx2QsC+BPwM+uNYRsnVBHLMdfJznAN4itvxieSbSuME82i3+7RHJMY0uFfWvOh
 0GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zp+EMGVpVNmgWiSPGrSsPSWTihkyvGY1vKyISKW41I=;
 b=q4anctcQYggI36wCuQI1Jlbkxd0SjVTx0Nm/1Oom4WATNySwyRSOTijbuX6/hIgS8J
 lTlwWdkfizpM89dSvyV2xB2yanM33CifVXwlHvzQNFi9KSMLRAsceYbODGUJ4b7OxOeQ
 0w8sJ/R4zV1GQ12X4837U2UrZeubdbDCFoqhkXjzb9pVIMDlMbfTKbWdBsvVY5lyrXyQ
 Mrs00Xfrm1fIRgPYY6ubE9RGXdDga3h3/YvJry567AU1uJShqH5L6gKuoOuJdg4z+0TD
 NxtIP+2qJxI12+3n0hCWw8lAxVOuKTuvMCUjdx9a6Rxf5xpyD1vU1HkLUa0OfDGFzOtu
 tNbw==
X-Gm-Message-State: AOAM53231YomPqHH7X4KQ2CmCOzwJ75D7XKGIPDm+R/BT2NIOjct2GsP
 5+7Qde1bKpC2v13Q+QN68ycdz+wKeg8T+A==
X-Google-Smtp-Source: ABdhPJyWLi4vvgjrWztSVHP5V3l1nEh9JP6V712nJvKjmOpiNStR3jDXl0a4ebnhuL66Neu519dLBg==
X-Received: by 2002:ad4:5763:: with SMTP id r3mr5597307qvx.72.1643331388712;
 Thu, 27 Jan 2022 16:56:28 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:28 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/11] 9p: darwin: Handle struct dirent differences
Date: Thu, 27 Jan 2022 19:56:04 -0500
Message-Id: <20220128005611.87185-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf36.google.com
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
 Will Cohen <wwcohen@gmail.com>, Fabian Franz <github@fabian-franz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin d_seekoff exists, but is optional and does not seem to
be commonly used by file systems. Use `telldir` instead to obtain
the seek offset.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust to pass testing]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Signed-off-by: Fabian Franz <github@fabian-franz.de>
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
index 1563d7b7c6..7851f85f8f 100644
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
+    return v9fs_co_telldir(pdu, fidp);
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
index 032cce04c4..c1b5694f3f 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -167,7 +167,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
+#ifdef CONFIG_DARWIN
+        saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
+#else
         saved_dir_pos = dent->d_off;
+#endif
     }
 
     /* restore (last) saved position */
-- 
2.34.1


