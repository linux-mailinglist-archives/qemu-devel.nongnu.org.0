Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D272B1D10F1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:16:00 +0200 (CEST)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpMl-0000Gz-QQ
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDN-0001Na-KE
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDK-0003OV-3W
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5FTDNvzskUdvLca6t1YeOfaP3bb8dS3qzGCT+k6x+s=;
 b=dvxR7VkXvD6MN/D+co2YTtPt8S4pU47HDUK+pZpuwNcWQBEtH8q1rx0znG6MfR9IYzJi2/
 9HTEA2F0VyqDkDohH2gU0+xsjpkAZPV8r6J+oKfhMxGyM8Dvh7BPMekIOHvH9io3AovPkt
 TXgaMeQCa9bJacYUbCfyY0Xy6I40m/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-0Iwk6ZVVOdaLoEe0340UWA-1; Wed, 13 May 2020 07:06:11 -0400
X-MC-Unique: 0Iwk6ZVVOdaLoEe0340UWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94AF71009600;
 Wed, 13 May 2020 11:06:10 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB61960C05;
 Wed, 13 May 2020 11:06:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/34] block: Pass parent_is_format to .inherit_options()
Date: Wed, 13 May 2020 13:05:18 +0200
Message-Id: <20200513110544.176672-9-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 04:17:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

We plan to unify the generic .inherit_options() functions.  The
resulting common function will need to decide whether to force-enable
format probing, force-disable it, or leave it as-is.  To make this
decision, it will need to know whether the parent node is a format node
or not (because we never want format probing if the parent is a format
node already (except for the backing chain)).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  2 +-
 block.c                   | 37 +++++++++++++++++++++++++++----------
 block/block-backend.c     |  2 +-
 block/vvfat.c             |  2 +-
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 8c1160a577..6245d8a18d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -677,7 +677,7 @@ struct BdrvChildClass {
      * non-BDS parents. */
     bool parent_is_bds;
 
-    void (*inherit_options)(BdrvChildRole role,
+    void (*inherit_options)(BdrvChildRole role, bool parent_is_format,
                             int *child_flags, QDict *child_options,
                             int parent_flags, QDict *parent_options);
 
diff --git a/block.c b/block.c
index 40db0b78b9..b78e2dc141 100644
--- a/block.c
+++ b/block.c
@@ -1154,7 +1154,7 @@ static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
  * Returns the options and flags that bs->file should get if a protocol driver
  * is expected, based on the given options and flags for the parent BDS
  */
-static void bdrv_inherited_options(BdrvChildRole role,
+static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
                                    int *child_flags, QDict *child_options,
                                    int parent_flags, QDict *parent_options)
 {
@@ -1205,10 +1205,12 @@ const BdrvChildClass child_file = {
  * flags for the parent BDS
  */
 static void bdrv_inherited_fmt_options(BdrvChildRole role,
+                                       bool parent_is_format,
                                        int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
-    child_file.inherit_options(role, child_flags, child_options,
+    child_file.inherit_options(role, parent_is_format,
+                               child_flags, child_options,
                                parent_flags, parent_options);
 
     *child_flags &= ~(BDRV_O_PROTOCOL | BDRV_O_NO_IO);
@@ -1289,7 +1291,7 @@ static void bdrv_backing_detach(BdrvChild *c)
  * Returns the options and flags that bs->backing should get, based on the
  * given options and flags for the parent BDS
  */
-static void bdrv_backing_options(BdrvChildRole role,
+static void bdrv_backing_options(BdrvChildRole role, bool parent_is_format,
                                  int *child_flags, QDict *child_options,
                                  int parent_flags, QDict *parent_options)
 {
@@ -3173,8 +3175,22 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     bs->explicit_options = qdict_clone_shallow(options);
 
     if (child_class) {
+        bool parent_is_format;
+
+        if (parent->drv) {
+            parent_is_format = parent->drv->is_format;
+        } else {
+            /*
+             * parent->drv is not set yet because this node is opened for
+             * (potential) format probing.  That means that @parent is going
+             * to be a format node.
+             */
+            parent_is_format = true;
+        }
+
         bs->inherits_from = parent;
-        child_class->inherit_options(child_role, &flags, options,
+        child_class->inherit_options(child_role, parent_is_format,
+                                     &flags, options,
                                      parent->open_flags, parent->options);
     }
 
@@ -3203,7 +3219,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                    flags, options);
         /* Let bdrv_backing_options() override "read-only" */
         qdict_del(options, BDRV_OPT_READ_ONLY);
-        bdrv_backing_options(0, &flags, options, flags, options);
+        bdrv_backing_options(0, true, &flags, options, flags, options);
     }
 
     bs->open_flags = flags;
@@ -3488,6 +3504,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
                                                  QDict *options,
                                                  const BdrvChildClass *klass,
                                                  BdrvChildRole role,
+                                                 bool parent_is_format,
                                                  QDict *parent_options,
                                                  int parent_flags,
                                                  bool keep_old_opts)
@@ -3543,7 +3560,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     /* Inherit from parent node */
     if (parent_options) {
         flags = 0;
-        klass->inherit_options(role, &flags, options,
+        klass->inherit_options(role, parent_is_format, &flags, options,
                                parent_flags, parent_options);
     } else {
         flags = bdrv_get_flags(bs);
@@ -3635,8 +3652,8 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
         }
 
         bdrv_reopen_queue_child(bs_queue, child->bs, new_child_options,
-                                child->klass, child->role, options, flags,
-                                child_keep_old);
+                                child->klass, child->role, bs->drv->is_format,
+                                options, flags, child_keep_old);
     }
 
     return bs_queue;
@@ -3646,8 +3663,8 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
 {
-    return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, 0, NULL, 0,
-                                   keep_old_opts);
+    return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, 0, false,
+                                   NULL, 0, keep_old_opts);
 }
 
 /*
diff --git a/block/block-backend.c b/block/block-backend.c
index 5539ca8816..f2e81af27d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -120,7 +120,7 @@ static QTAILQ_HEAD(, BlockBackend) block_backends =
 static QTAILQ_HEAD(, BlockBackend) monitor_block_backends =
     QTAILQ_HEAD_INITIALIZER(monitor_block_backends);
 
-static void blk_root_inherit_options(BdrvChildRole role,
+static void blk_root_inherit_options(BdrvChildRole role, bool parent_is_format,
                                      int *child_flags, QDict *child_options,
                                      int parent_flags, QDict *parent_options)
 {
diff --git a/block/vvfat.c b/block/vvfat.c
index 4033e4f369..b4c8417dbd 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3128,7 +3128,7 @@ static BlockDriver vvfat_write_target = {
     .bdrv_co_pwritev    = write_target_commit,
 };
 
-static void vvfat_qcow_options(BdrvChildRole role,
+static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
                                int *child_flags, QDict *child_options,
                                int parent_flags, QDict *parent_options)
 {
-- 
2.26.2


