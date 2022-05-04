Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532651A247
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:34:26 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG5B-0007OZ-KX
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwj-0000t8-Ga
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwg-0007GD-6g
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLXSn/nyPMG0gDDfnhgpYQX85htiZ5wnoZj7/jcHbL4=;
 b=eFX5A9Ur7S0I8UjwtOwAiYQ8+8RyJrWEqdyDRZkXyRpKtSykBB4KJPbIYAVDGTo7VUpWKq
 sJFL2y/kkxMic/ZfpltuosfyuWXt9NTM7e2p6JwUDvdgjk7asch97/eo4dZF5GuRHPIcdY
 BqRVoEpzV0GwZc5UnslzoGJUfHUcEc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-QHsH3zQ5N5OG7uF10SA22g-1; Wed, 04 May 2022 10:25:34 -0400
X-MC-Unique: QHsH3zQ5N5OG7uF10SA22g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11AC318E004B;
 Wed,  4 May 2022 14:25:34 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 863BC4021A2;
 Wed,  4 May 2022 14:25:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 06/13] qcow2: Do not reopen data_file in invalidate_cache
Date: Wed,  4 May 2022 16:25:15 +0200
Message-Id: <20220504142522.167506-7-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

qcow2_co_invalidate_cache() closes and opens the qcow2 file, by calling
qcow2_close() and qcow2_do_open().  These two functions must thus be
usable from both a global-state and an I/O context.

As they are, they are not safe to call in an I/O context, because they
use bdrv_unref_child() and bdrv_open_child() to close/open the data_file
child, respectively, both of which are global-state functions.  When
used from qcow2_co_invalidate_cache(), we do not need to close/open the
data_file child, though (we do not do this for bs->file or bs->backing
either), and so we should skip it in the qcow2_co_invalidate_cache()
path.

To do so, add a parameter to qcow2_do_open() and qcow2_close() to make
them skip handling s->data_file, and have qcow2_co_invalidate_cache()
exempt it from the memset() on the BDRVQcow2State.

(Note that the QED driver similarly closes/opens the QED image by
invoking bdrv_qed_close()+bdrv_qed_do_open(), but both functions seem
safe to use in an I/O context.)

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/945
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220427114057.36651-3-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 104 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 42 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index b5c47931ef..4f5e6440fb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1296,7 +1296,8 @@ static int validate_compression_type(BDRVQcow2State *s, Error **errp)
 
 /* Called with s->lock held.  */
 static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
-                                      int flags, Error **errp)
+                                      int flags, bool open_data_file,
+                                      Error **errp)
 {
     ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
@@ -1614,50 +1615,52 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
         goto fail;
     }
 
-    /* Open external data file */
-    s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
-                                   &child_of_bds, BDRV_CHILD_DATA,
-                                   true, errp);
-    if (*errp) {
-        ret = -EINVAL;
-        goto fail;
-    }
+    if (open_data_file) {
+        /* Open external data file */
+        s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
+                                       &child_of_bds, BDRV_CHILD_DATA,
+                                       true, errp);
+        if (*errp) {
+            ret = -EINVAL;
+            goto fail;
+        }
 
-    if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
-        if (!s->data_file && s->image_data_file) {
-            s->data_file = bdrv_open_child(s->image_data_file, options,
-                                           "data-file", bs, &child_of_bds,
-                                           BDRV_CHILD_DATA, false, errp);
+        if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
+            if (!s->data_file && s->image_data_file) {
+                s->data_file = bdrv_open_child(s->image_data_file, options,
+                                               "data-file", bs, &child_of_bds,
+                                               BDRV_CHILD_DATA, false, errp);
+                if (!s->data_file) {
+                    ret = -EINVAL;
+                    goto fail;
+                }
+            }
             if (!s->data_file) {
+                error_setg(errp, "'data-file' is required for this image");
                 ret = -EINVAL;
                 goto fail;
             }
-        }
-        if (!s->data_file) {
-            error_setg(errp, "'data-file' is required for this image");
-            ret = -EINVAL;
-            goto fail;
-        }
 
-        /* No data here */
-        bs->file->role &= ~BDRV_CHILD_DATA;
+            /* No data here */
+            bs->file->role &= ~BDRV_CHILD_DATA;
 
-        /* Must succeed because we have given up permissions if anything */
-        bdrv_child_refresh_perms(bs, bs->file, &error_abort);
-    } else {
-        if (s->data_file) {
-            error_setg(errp, "'data-file' can only be set for images with an "
-                             "external data file");
-            ret = -EINVAL;
-            goto fail;
-        }
+            /* Must succeed because we have given up permissions if anything */
+            bdrv_child_refresh_perms(bs, bs->file, &error_abort);
+        } else {
+            if (s->data_file) {
+                error_setg(errp, "'data-file' can only be set for images with "
+                                 "an external data file");
+                ret = -EINVAL;
+                goto fail;
+            }
 
-        s->data_file = bs->file;
+            s->data_file = bs->file;
 
-        if (data_file_is_raw(bs)) {
-            error_setg(errp, "data-file-raw requires a data file");
-            ret = -EINVAL;
-            goto fail;
+            if (data_file_is_raw(bs)) {
+                error_setg(errp, "data-file-raw requires a data file");
+                ret = -EINVAL;
+                goto fail;
+            }
         }
     }
 
@@ -1839,7 +1842,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
  fail:
     g_free(s->image_data_file);
-    if (has_data_file(bs)) {
+    if (open_data_file && has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
         s->data_file = NULL;
     }
@@ -1876,7 +1879,8 @@ static void coroutine_fn qcow2_open_entry(void *opaque)
     BDRVQcow2State *s = qoc->bs->opaque;
 
     qemu_co_mutex_lock(&s->lock);
-    qoc->ret = qcow2_do_open(qoc->bs, qoc->options, qoc->flags, qoc->errp);
+    qoc->ret = qcow2_do_open(qoc->bs, qoc->options, qoc->flags, true,
+                             qoc->errp);
     qemu_co_mutex_unlock(&s->lock);
 }
 
@@ -2714,7 +2718,7 @@ static int qcow2_inactivate(BlockDriverState *bs)
     return result;
 }
 
-static void qcow2_close(BlockDriverState *bs)
+static void qcow2_do_close(BlockDriverState *bs, bool close_data_file)
 {
     BDRVQcow2State *s = bs->opaque;
     qemu_vfree(s->l1_table);
@@ -2740,7 +2744,7 @@ static void qcow2_close(BlockDriverState *bs)
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
 
-    if (has_data_file(bs)) {
+    if (close_data_file && has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
         s->data_file = NULL;
     }
@@ -2749,11 +2753,17 @@ static void qcow2_close(BlockDriverState *bs)
     qcow2_free_snapshots(bs);
 }
 
+static void qcow2_close(BlockDriverState *bs)
+{
+    qcow2_do_close(bs, true);
+}
+
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
                                                    Error **errp)
 {
     ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
+    BdrvChild *data_file;
     int flags = s->flags;
     QCryptoBlock *crypto = NULL;
     QDict *options;
@@ -2767,14 +2777,24 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
     crypto = s->crypto;
     s->crypto = NULL;
 
-    qcow2_close(bs);
+    /*
+     * Do not reopen s->data_file (i.e., have qcow2_do_close() not close it,
+     * and then prevent qcow2_do_open() from opening it), because this function
+     * runs in the I/O path and as such we must not invoke global-state
+     * functions like bdrv_unref_child() and bdrv_open_child().
+     */
 
+    qcow2_do_close(bs, false);
+
+    data_file = s->data_file;
     memset(s, 0, sizeof(BDRVQcow2State));
+    s->data_file = data_file;
+
     options = qdict_clone_shallow(bs->options);
 
     flags &= ~BDRV_O_INACTIVE;
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_do_open(bs, options, flags, errp);
+    ret = qcow2_do_open(bs, options, flags, false, errp);
     qemu_co_mutex_unlock(&s->lock);
     qobject_unref(options);
     if (ret < 0) {
-- 
2.35.1


