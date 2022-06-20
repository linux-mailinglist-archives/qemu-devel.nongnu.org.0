Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17B552256
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:33:55 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KLa-0007GF-92
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFK-0005jx-7b
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFH-0005Lb-HO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnNcy7us2A1nC5/F++kD1Vlw6UlMQtk1NBGLuz6NJ8s=;
 b=Eab653Oe1Zdhvc1ZnLskntsYp0iys0tmrRmRz+rznVYa0yksTR9UtZ6OXy4AKVFDHSCgQR
 IcssTLH3vSr0isswxpHIw8gWGBUHaVb7+5qJxKWyTM4AwTVEvGBMJzICy8uW08pplr79hT
 EI5UrqQedhTV/UJmMSdnXu00OCVb9mI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-n-bVl1TfNvqzXZw9poHLVw-1; Mon, 20 Jun 2022 12:27:16 -0400
X-MC-Unique: n-bVl1TfNvqzXZw9poHLVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67B31C00AC5;
 Mon, 20 Jun 2022 16:27:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA802026D64;
 Mon, 20 Jun 2022 16:27:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 06/12] block/qapi: Let bdrv_query_image_info() recurse
Date: Mon, 20 Jun 2022 18:26:58 +0200
Message-Id: <20220620162704.80987-7-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

There is no real reason why bdrv_query_image_info() should generally not
recurse.  The ImageInfo struct has a pointer to the backing image, so it
should generally be filled, unless the caller explicitly opts out.

This moves the recursing code from bdrv_block_device_info() into
bdrv_query_image_info().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/qapi.h |  2 +
 block/qapi.c         | 94 +++++++++++++++++++++++++++-----------------
 2 files changed, 59 insertions(+), 37 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 22198dcd0c..2174bf8fa2 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -40,6 +40,8 @@ void bdrv_query_block_node_info(BlockDriverState *bs,
                                 Error **errp);
 void bdrv_query_image_info(BlockDriverState *bs,
                            ImageInfo **p_info,
+                           bool flat,
+                           bool skip_implicit_filters,
                            Error **errp);
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
diff --git a/block/qapi.c b/block/qapi.c
index ad88bf9b38..5d0a8d2ce3 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -47,8 +47,10 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         Error **errp)
 {
     ImageInfo **p_image_info;
+    ImageInfo *backing_info;
     BlockDriverState *bs0, *backing;
     BlockDeviceInfo *info;
+    ERRP_GUARD();
 
     if (!bs->drv) {
         error_setg(errp, "Block device %s is ejected", bs->node_name);
@@ -149,38 +151,21 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
     bs0 = bs;
     p_image_info = &info->image;
     info->backing_file_depth = 0;
-    while (1) {
-        Error *local_err = NULL;
-        bdrv_query_image_info(bs0, p_image_info, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            qapi_free_BlockDeviceInfo(info);
-            return NULL;
-        }
-
-        /* stop gathering data for flat output */
-        if (flat) {
-            break;
-        }
 
-        if (bs0->drv && bdrv_filter_or_cow_child(bs0)) {
-            /*
-             * Put any filtered child here (for backwards compatibility to when
-             * we put bs0->backing here, which might be any filtered child).
-             */
-            info->backing_file_depth++;
-            bs0 = bdrv_filter_or_cow_bs(bs0);
-            (*p_image_info)->has_backing_image = true;
-            p_image_info = &((*p_image_info)->backing_image);
-        } else {
-            break;
-        }
+    /*
+     * Skip automatically inserted nodes that the user isn't aware of for
+     * query-block (blk != NULL), but not for query-named-block-nodes
+     */
+    bdrv_query_image_info(bs0, p_image_info, flat, blk != NULL, errp);
+    if (*errp) {
+        qapi_free_BlockDeviceInfo(info);
+        return NULL;
+    }
 
-        /* Skip automatically inserted nodes that the user isn't aware of for
-         * query-block (blk != NULL), but not for query-named-block-nodes */
-        if (blk) {
-            bs0 = bdrv_skip_implicit_filters(bs0);
-        }
+    backing_info = info->image->backing_image;
+    while (backing_info) {
+        info->backing_file_depth++;
+        backing_info = backing_info->backing_image;
     }
 
     return info;
@@ -363,19 +348,28 @@ void bdrv_query_block_node_info(BlockDriverState *bs,
  * bdrv_query_image_info:
  * @bs: block node to examine
  * @p_info: location to store image information
+ * @flat: skip backing node information
+ * @skip_implicit_filters: skip implicit filters in the backing chain
  * @errp: location to store error information
  *
- * Store "flat" image information in @p_info.
+ * Store image information in @p_info, potentially recursively covering the
+ * backing chain.
  *
- * "Flat" means it does *not* query backing image information,
- * i.e. (*pinfo)->has_backing_image will be set to false and
- * (*pinfo)->backing_image to NULL even when the image does in fact have
- * a backing image.
+ * If @flat is true, do not query backing image information, i.e.
+ * (*p_info)->has_backing_image will be set to false and
+ * (*p_info)->backing_image to NULL even when the image does in fact have a
+ * backing image.
+ *
+ * If @skip_implicit_filters is true, implicit filter nodes in the backing chain
+ * will be skipped when querying backing image information.
+ * (@skip_implicit_filters is ignored when @flat is true.)
  *
  * @p_info will be set only on success. On error, store error in @errp.
  */
 void bdrv_query_image_info(BlockDriverState *bs,
                            ImageInfo **p_info,
+                           bool flat,
+                           bool skip_implicit_filters,
                            Error **errp)
 {
     ImageInfo *info;
@@ -384,11 +378,37 @@ void bdrv_query_image_info(BlockDriverState *bs,
     info = g_new0(ImageInfo, 1);
     bdrv_do_query_node_info(bs, qapi_ImageInfo_base(info), errp);
     if (*errp) {
-        qapi_free_ImageInfo(info);
-        return;
+        goto fail;
+    }
+
+    if (!flat) {
+        BlockDriverState *backing;
+
+        /*
+         * Use any filtered child here (for backwards compatibility to when
+         * we always took bs->backing, which might be any filtered child).
+         */
+        backing = bdrv_filter_or_cow_bs(bs);
+        if (skip_implicit_filters) {
+            backing = bdrv_skip_implicit_filters(backing);
+        }
+
+        if (backing) {
+            bdrv_query_image_info(backing, &info->backing_image, false,
+                                  skip_implicit_filters, errp);
+            if (*errp) {
+                goto fail;
+            }
+            info->has_backing_image = true;
+        }
     }
 
     *p_info = info;
+    return;
+
+fail:
+    assert(*errp);
+    qapi_free_ImageInfo(info);
 }
 
 /* @p_info will be set only on success. */
-- 
2.35.3


