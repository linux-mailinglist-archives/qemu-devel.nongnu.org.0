Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F12D7CC0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:25:20 +0100 (CET)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmAR-0006Be-RC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluS-0003hw-0m
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluD-00026j-SQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfF+1ARM+6LlPmXbPh/K0dVaF34q6yc83sQISbGQHi4=;
 b=gI1+RyldLtZti06vhBiO2E86oN93CrxX+4O/mxqLyGH3ERsClBNiS4AljGpH4kHVxHVlI8
 L5jKgsJdk5AJHV/Za3F9zj+xqK8bdsVj9aNQLW6bATUe5fU5g8KTp1Y3GR3E5ITAVabwIj
 rArNE+yD2gaQbBbzKhqpkDfT9Yx/tCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-d4RFxrLTMciCXTcALK8gXw-1; Fri, 11 Dec 2020 12:08:30 -0500
X-MC-Unique: d4RFxrLTMciCXTcALK8gXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74359107ACE8;
 Fri, 11 Dec 2020 17:08:29 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F015D735;
 Fri, 11 Dec 2020 17:08:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/34] fuse: Allow growable exports
Date: Fri, 11 Dec 2020 18:07:46 +0100
Message-Id: <20201211170812.228643-9-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

These will behave more like normal files in that writes beyond the EOF
will automatically grow the export size.

As an optimization, keep the RESIZE permission for growable exports so
we do not have to take it for every post-EOF write.  (This permission is
not released when the export is destroyed, because at that point the
BlockBackend is destroyed altogether anyway.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-5-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json |  6 +++++-
 block/export/fuse.c    | 44 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 430bc69f35..e819e70cac 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -129,10 +129,14 @@
 # @mountpoint: Path on which to export the block device via FUSE.
 #              This must point to an existing regular file.
 #
+# @growable: Whether writes beyond the EOF should grow the block node
+#            accordingly. (default: false)
+#
 # Since: 6.0
 ##
 { 'struct': 'BlockExportOptionsFuse',
-  'data': { 'mountpoint': 'str' },
+  'data': { 'mountpoint': 'str',
+            '*growable': 'bool' },
   'if': 'defined(CONFIG_FUSE)' }
 
 ##
diff --git a/block/export/fuse.c b/block/export/fuse.c
index d995829ab7..92d2f50bcc 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -45,6 +45,7 @@ typedef struct FuseExport {
 
     char *mountpoint;
     bool writable;
+    bool growable;
 } FuseExport;
 
 static GHashTable *exports;
@@ -72,6 +73,19 @@ static int fuse_export_create(BlockExport *blk_exp,
 
     assert(blk_exp_args->type == BLOCK_EXPORT_TYPE_FUSE);
 
+    /* For growable exports, take the RESIZE permission */
+    if (args->growable) {
+        uint64_t blk_perm, blk_shared_perm;
+
+        blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
+
+        ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
+                           blk_shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     init_exports_table();
 
     /*
@@ -102,6 +116,7 @@ static int fuse_export_create(BlockExport *blk_exp,
 
     exp->mountpoint = g_strdup(args->mountpoint);
     exp->writable = blk_exp_args->writable;
+    exp->growable = args->growable;
 
     ret = setup_fuse_export(exp, args->mountpoint, errp);
     if (ret < 0) {
@@ -349,19 +364,24 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
         truncate_flags |= BDRV_REQ_ZERO_WRITE;
     }
 
-    blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
+    /* Growable exports have a permanent RESIZE permission */
+    if (!exp->growable) {
+        blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
 
-    ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
-                       blk_shared_perm, NULL);
-    if (ret < 0) {
-        return ret;
+        ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
+                           blk_shared_perm, NULL);
+        if (ret < 0) {
+            return ret;
+        }
     }
 
     ret = blk_truncate(exp->common.blk, size, true, prealloc,
                        truncate_flags, NULL);
 
-    /* Must succeed, because we are only giving up the RESIZE permission */
-    blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
+    if (!exp->growable) {
+        /* Must succeed, because we are only giving up the RESIZE permission */
+        blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
+    }
 
     return ret;
 }
@@ -482,7 +502,15 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
     }
 
     if (offset + size > length) {
-        size = length - offset;
+        if (exp->growable) {
+            ret = fuse_do_truncate(exp, offset + size, true, PREALLOC_MODE_OFF);
+            if (ret < 0) {
+                fuse_reply_err(req, -ret);
+                return;
+            }
+        } else {
+            size = length - offset;
+        }
     }
 
     ret = blk_pwrite(exp->common.blk, offset, buf, size, 0);
-- 
2.29.2


