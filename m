Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388371D10C3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:12:41 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpJY-0002R3-9h
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDK-0001Ep-0l
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42246
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDH-0003Nh-J4
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtWfznVJLxHtCzQkfc9vyJGmqbnFPdK/k6Zjk/Zfujs=;
 b=e2Jsx3pK4MFrYinJ50a6X5JOurUH3Tis1qZFA7SxqQtGrapEwlPsPmOGxyXeY0vvhl9pY/
 UA2usLSgNpbEHYErN8ujngbFavOL3R/IM+jmvxpmtIjlvptGs8l1uNJd4KEa+YiQyfBt8J
 72fMM5zN6FmtGzJjfpCkpt5SgB1QdTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-tekOPRhUNoCnnQopNE88cQ-1; Wed, 13 May 2020 07:06:08 -0400
X-MC-Unique: tekOPRhUNoCnnQopNE88cQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2BD58014D7;
 Wed, 13 May 2020 11:06:07 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2698638D;
 Wed, 13 May 2020 11:06:06 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/34] block: Pass BdrvChildRole to .inherit_options()
Date: Wed, 13 May 2020 13:05:17 +0200
Message-Id: <20200513110544.176672-8-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now, all callers (effectively) pass 0 and no callee evaluates thie
value.  Later patches will change both.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  3 ++-
 block.c                   | 40 +++++++++++++++++++++++----------------
 block/block-backend.c     |  3 ++-
 block/vvfat.c             |  3 ++-
 4 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dc4bc486d6..8c1160a577 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -677,7 +677,8 @@ struct BdrvChildClass {
      * non-BDS parents. */
     bool parent_is_bds;
 
-    void (*inherit_options)(int *child_flags, QDict *child_options,
+    void (*inherit_options)(BdrvChildRole role,
+                            int *child_flags, QDict *child_options,
                             int parent_flags, QDict *parent_options);
 
     void (*change_media)(BdrvChild *child, bool load);
diff --git a/block.c b/block.c
index 5d9a331f5b..40db0b78b9 100644
--- a/block.c
+++ b/block.c
@@ -77,6 +77,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            QDict *options, int flags,
                                            BlockDriverState *parent,
                                            const BdrvChildClass *child_class,
+                                           BdrvChildRole child_role,
                                            Error **errp);
 
 /* If non-zero, use only whitelisted block drivers */
@@ -1153,7 +1154,8 @@ static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
  * Returns the options and flags that bs->file should get if a protocol driver
  * is expected, based on the given options and flags for the parent BDS
  */
-static void bdrv_inherited_options(int *child_flags, QDict *child_options,
+static void bdrv_inherited_options(BdrvChildRole role,
+                                   int *child_flags, QDict *child_options,
                                    int parent_flags, QDict *parent_options)
 {
     int flags = parent_flags;
@@ -1202,10 +1204,11 @@ const BdrvChildClass child_file = {
  * (and not only protocols) is permitted for it, based on the given options and
  * flags for the parent BDS
  */
-static void bdrv_inherited_fmt_options(int *child_flags, QDict *child_options,
+static void bdrv_inherited_fmt_options(BdrvChildRole role,
+                                       int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
-    child_file.inherit_options(child_flags, child_options,
+    child_file.inherit_options(role, child_flags, child_options,
                                parent_flags, parent_options);
 
     *child_flags &= ~(BDRV_O_PROTOCOL | BDRV_O_NO_IO);
@@ -1286,7 +1289,8 @@ static void bdrv_backing_detach(BdrvChild *c)
  * Returns the options and flags that bs->backing should get, based on the
  * given options and flags for the parent BDS
  */
-static void bdrv_backing_options(int *child_flags, QDict *child_options,
+static void bdrv_backing_options(BdrvChildRole role,
+                                 int *child_flags, QDict *child_options,
                                  int parent_flags, QDict *parent_options)
 {
     int flags = parent_flags;
@@ -2876,7 +2880,7 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
     }
 
     backing_hd = bdrv_open_inherit(backing_filename, reference, options, 0, bs,
-                                   &child_backing, errp);
+                                   &child_backing, 0, errp);
     if (!backing_hd) {
         bs->open_flags |= BDRV_O_NO_BACKING;
         error_prepend(errp, "Could not open backing file: ");
@@ -2911,7 +2915,7 @@ free_exit:
 static BlockDriverState *
 bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
                    BlockDriverState *parent, const BdrvChildClass *child_class,
-                   bool allow_none, Error **errp)
+                   BdrvChildRole child_role, bool allow_none, Error **errp)
 {
     BlockDriverState *bs = NULL;
     QDict *image_options;
@@ -2942,7 +2946,7 @@ bdrv_open_child_bs(const char *filename, QDict *options, const char *bdref_key,
     }
 
     bs = bdrv_open_inherit(filename, reference, image_options, 0,
-                           parent, child_class, errp);
+                           parent, child_class, child_role, errp);
     if (!bs) {
         goto done;
     }
@@ -2976,7 +2980,7 @@ BdrvChild *bdrv_open_child(const char *filename,
     BlockDriverState *bs;
 
     bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
-                            allow_none, errp);
+                            child_role, allow_none, errp);
     if (bs == NULL) {
         return NULL;
     }
@@ -3020,7 +3024,7 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
 
     }
 
-    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, errp);
+    bs = bdrv_open_inherit(NULL, reference, qdict, 0, NULL, NULL, 0, errp);
     obj = NULL;
     qobject_unref(obj);
     visit_free(v);
@@ -3117,6 +3121,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            QDict *options, int flags,
                                            BlockDriverState *parent,
                                            const BdrvChildClass *child_class,
+                                           BdrvChildRole child_role,
                                            Error **errp)
 {
     int ret;
@@ -3169,7 +3174,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
     if (child_class) {
         bs->inherits_from = parent;
-        child_class->inherit_options(&flags, options,
+        child_class->inherit_options(child_role, &flags, options,
                                      parent->open_flags, parent->options);
     }
 
@@ -3198,7 +3203,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                    flags, options);
         /* Let bdrv_backing_options() override "read-only" */
         qdict_del(options, BDRV_OPT_READ_ONLY);
-        bdrv_backing_options(&flags, options, flags, options);
+        bdrv_backing_options(0, &flags, options, flags, options);
     }
 
     bs->open_flags = flags;
@@ -3240,7 +3245,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
         BlockDriverState *file_bs;
 
         file_bs = bdrv_open_child_bs(filename, options, "file", bs,
-                                     &child_file, true, &local_err);
+                                     &child_file, 0, true, &local_err);
         if (local_err) {
             goto fail;
         }
@@ -3385,7 +3390,7 @@ BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
     return bdrv_open_inherit(filename, reference, options, flags, NULL,
-                             NULL, errp);
+                             NULL, 0, errp);
 }
 
 /* Return true if the NULL-terminated @list contains @str */
@@ -3482,6 +3487,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
                                                  BlockDriverState *bs,
                                                  QDict *options,
                                                  const BdrvChildClass *klass,
+                                                 BdrvChildRole role,
                                                  QDict *parent_options,
                                                  int parent_flags,
                                                  bool keep_old_opts)
@@ -3537,7 +3543,8 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     /* Inherit from parent node */
     if (parent_options) {
         flags = 0;
-        klass->inherit_options(&flags, options, parent_flags, parent_options);
+        klass->inherit_options(role, &flags, options,
+                               parent_flags, parent_options);
     } else {
         flags = bdrv_get_flags(bs);
     }
@@ -3628,7 +3635,8 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
         }
 
         bdrv_reopen_queue_child(bs_queue, child->bs, new_child_options,
-                                child->klass, options, flags, child_keep_old);
+                                child->klass, child->role, options, flags,
+                                child_keep_old);
     }
 
     return bs_queue;
@@ -3638,7 +3646,7 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
 {
-    return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, NULL, 0,
+    return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, 0, NULL, 0,
                                    keep_old_opts);
 }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index efc7acb3d8..5539ca8816 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -120,7 +120,8 @@ static QTAILQ_HEAD(, BlockBackend) block_backends =
 static QTAILQ_HEAD(, BlockBackend) monitor_block_backends =
     QTAILQ_HEAD_INITIALIZER(monitor_block_backends);
 
-static void blk_root_inherit_options(int *child_flags, QDict *child_options,
+static void blk_root_inherit_options(BdrvChildRole role,
+                                     int *child_flags, QDict *child_options,
                                      int parent_flags, QDict *parent_options)
 {
     /* We're not supposed to call this function for root nodes */
diff --git a/block/vvfat.c b/block/vvfat.c
index 6cf3c74fe3..4033e4f369 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3128,7 +3128,8 @@ static BlockDriver vvfat_write_target = {
     .bdrv_co_pwritev    = write_target_commit,
 };
 
-static void vvfat_qcow_options(int *child_flags, QDict *child_options,
+static void vvfat_qcow_options(BdrvChildRole role,
+                               int *child_flags, QDict *child_options,
                                int parent_flags, QDict *parent_options)
 {
     qdict_set_default_str(child_options, BDRV_OPT_READ_ONLY, "off");
-- 
2.26.2


