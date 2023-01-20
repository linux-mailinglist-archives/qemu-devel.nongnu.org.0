Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05011675462
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUK-0003IS-31; Fri, 20 Jan 2023 07:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUF-0003Dy-Ia
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUD-0000Sr-JW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6b1JANbkH8iVZvv9ZvbFlZtrOBC/CaDN4zj/fU2rT38=;
 b=KGrFAsKkzPi33XU8lZhDza6fmHZYHP83sgHQq4jRUfvxZabKVvwXNnUfp3go5Jh+FDkNKh
 BD7dnUX5qrra9k7pfe8Dums7HaWf8EizgB/R8+sxXRiiSsgZRHcAi2VvcG3YQfmLpxyh9E
 MHy3cUzycAkC4GOOQPxvuFKgtOcPNWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-ocx_TR5xNPmuf4H1U2Hxvw-1; Fri, 20 Jan 2023 07:27:09 -0500
X-MC-Unique: ocx_TR5xNPmuf4H1U2Hxvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A8186C165;
 Fri, 20 Jan 2023 12:27:09 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D2D040C6EC4;
 Fri, 20 Jan 2023 12:27:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 30/38] block: Split BlockNodeInfo off of ImageInfo
Date: Fri, 20 Jan 2023 13:26:25 +0100
Message-Id: <20230120122633.84983-31-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

ImageInfo sometimes contains flat information, and sometimes it does
not.  Split off a BlockNodeInfo struct, which only contains information
about a single node and has no link to the backing image.

We do this so we can extend BlockNodeInfo to a BlockGraphInfo struct,
which has links to all child nodes, not just the backing node.  It would
be strange to base BlockGraphInfo on ImageInfo, because then this
extended struct would have two links to the backing node (one in
BlockGraphInfo as one of all the child links, and one in ImageInfo).

Furthermore, it is quite common to ignore the backing-image field
altogether: bdrv_query_image_info() does not set it, and
bdrv_image_info_dump() does not evaluate it.  That signals that we
should have different structs for describing a single node and one that
has a link to the backing image.

Still, bdrv_query_image_info() and bdrv_image_info_dump() are not
changed too much in this patch.  Follow-up patches will handle them.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-5-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 24 +++++++++----
 include/block/qapi.h |  3 ++
 block/qapi.c         | 86 ++++++++++++++++++++++++++++++++------------
 3 files changed, 85 insertions(+), 28 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4b9365167f..7720da0498 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -251,7 +251,7 @@
   } }
 
 ##
-# @ImageInfo:
+# @BlockNodeInfo:
 #
 # Information about a QEMU image file
 #
@@ -279,22 +279,34 @@
 #
 # @snapshots: list of VM snapshots
 #
-# @backing-image: info of the backing image (since 1.6)
-#
 # @format-specific: structure supplying additional format-specific
 #                   information (since 1.7)
 #
-# Since: 1.3
+# Since: 8.0
 ##
-{ 'struct': 'ImageInfo',
+{ 'struct': 'BlockNodeInfo',
   'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
            '*actual-size': 'int', 'virtual-size': 'int',
            '*cluster-size': 'int', '*encrypted': 'bool', '*compressed': 'bool',
            '*backing-filename': 'str', '*full-backing-filename': 'str',
            '*backing-filename-format': 'str', '*snapshots': ['SnapshotInfo'],
-           '*backing-image': 'ImageInfo',
            '*format-specific': 'ImageInfoSpecific' } }
 
+##
+# @ImageInfo:
+#
+# Information about a QEMU image file, and potentially its backing image
+#
+# @backing-image: info of the backing image
+#
+# Since: 1.3
+##
+{ 'struct': 'ImageInfo',
+  'base': 'BlockNodeInfo',
+  'data': {
+      '*backing-image': 'ImageInfo'
+  } }
+
 ##
 # @ImageCheck:
 #
diff --git a/include/block/qapi.h b/include/block/qapi.h
index c09859ea78..c7de4e3fa9 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -35,6 +35,9 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
 int bdrv_query_snapshot_info_list(BlockDriverState *bs,
                                   SnapshotInfoList **p_list,
                                   Error **errp);
+void bdrv_query_block_node_info(BlockDriverState *bs,
+                                BlockNodeInfo **p_info,
+                                Error **errp);
 void bdrv_query_image_info(BlockDriverState *bs,
                            ImageInfo **p_info,
                            Error **errp);
diff --git a/block/qapi.c b/block/qapi.c
index b2584f8740..b3f812a071 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -237,30 +237,18 @@ int bdrv_query_snapshot_info_list(BlockDriverState *bs,
 }
 
 /**
- * bdrv_query_image_info:
- * @bs: block device to examine
- * @p_info: location to store image information
- * @errp: location to store error information
- *
- * Store "flat" image information in @p_info.
- *
- * "Flat" means it does *not* query backing image information,
- * i.e. (*pinfo)->has_backing_image will be set to false and
- * (*pinfo)->backing_image to NULL even when the image does in fact have
- * a backing image.
- *
- * @p_info will be set only on success. On error, store error in @errp.
+ * Helper function for other query info functions.  Store information about @bs
+ * in @info, setting @errp on error.
  */
-void bdrv_query_image_info(BlockDriverState *bs,
-                           ImageInfo **p_info,
-                           Error **errp)
+static void bdrv_do_query_node_info(BlockDriverState *bs,
+                                    BlockNodeInfo *info,
+                                    Error **errp)
 {
     int64_t size;
     const char *backing_filename;
     BlockDriverInfo bdi;
     int ret;
     Error *err = NULL;
-    ImageInfo *info;
 
     aio_context_acquire(bdrv_get_aio_context(bs));
 
@@ -273,7 +261,6 @@ void bdrv_query_image_info(BlockDriverState *bs,
 
     bdrv_refresh_filename(bs);
 
-    info = g_new0(ImageInfo, 1);
     info->filename        = g_strdup(bs->filename);
     info->format          = g_strdup(bdrv_get_format_name(bs));
     info->virtual_size    = size;
@@ -294,7 +281,6 @@ void bdrv_query_image_info(BlockDriverState *bs,
     info->format_specific = bdrv_get_specific_info(bs, &err);
     if (err) {
         error_propagate(errp, err);
-        qapi_free_ImageInfo(info);
         goto out;
     }
     backing_filename = bs->backing_file;
@@ -330,16 +316,72 @@ void bdrv_query_image_info(BlockDriverState *bs,
         break;
     default:
         error_propagate(errp, err);
-        qapi_free_ImageInfo(info);
         goto out;
     }
 
-    *p_info = info;
-
 out:
     aio_context_release(bdrv_get_aio_context(bs));
 }
 
+/**
+ * bdrv_query_block_node_info:
+ * @bs: block node to examine
+ * @p_info: location to store node information
+ * @errp: location to store error information
+ *
+ * Store image information about @bs in @p_info.
+ *
+ * @p_info will be set only on success. On error, store error in @errp.
+ */
+void bdrv_query_block_node_info(BlockDriverState *bs,
+                                BlockNodeInfo **p_info,
+                                Error **errp)
+{
+    BlockNodeInfo *info;
+    ERRP_GUARD();
+
+    info = g_new0(BlockNodeInfo, 1);
+    bdrv_do_query_node_info(bs, info, errp);
+    if (*errp) {
+        qapi_free_BlockNodeInfo(info);
+        return;
+    }
+
+    *p_info = info;
+}
+
+/**
+ * bdrv_query_image_info:
+ * @bs: block node to examine
+ * @p_info: location to store image information
+ * @errp: location to store error information
+ *
+ * Store "flat" image information in @p_info.
+ *
+ * "Flat" means it does *not* query backing image information,
+ * i.e. (*pinfo)->has_backing_image will be set to false and
+ * (*pinfo)->backing_image to NULL even when the image does in fact have
+ * a backing image.
+ *
+ * @p_info will be set only on success. On error, store error in @errp.
+ */
+void bdrv_query_image_info(BlockDriverState *bs,
+                           ImageInfo **p_info,
+                           Error **errp)
+{
+    ImageInfo *info;
+    ERRP_GUARD();
+
+    info = g_new0(ImageInfo, 1);
+    bdrv_do_query_node_info(bs, qapi_ImageInfo_base(info), errp);
+    if (*errp) {
+        qapi_free_ImageInfo(info);
+        return;
+    }
+
+    *p_info = info;
+}
+
 /* @p_info will be set only on success. */
 static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
                             Error **errp)
-- 
2.38.1


