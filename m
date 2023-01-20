Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0567548F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:32:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUQ-0003RQ-2Y; Fri, 20 Jan 2023 07:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUH-0003H2-Tp
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUG-0000U0-B2
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2kGYoVYd/3AP7RQaNDW9UQkb+fKSGYO/80MeIGdqvU=;
 b=Jy7DNrECqMgjl6MOAKJRh4OIXe21Ihjmu0u3ra3bm7YAmcgq1lZa8n8heHTbO8TfZ0X+7s
 hsyjB/bFcILH2LZQ9HRqZKw24n6AuGmxxTtoUKddJPrJtenPjv8D3z4heUt7sVb4rjqttJ
 kEOETlr3i8AFX2NpH3/EHaiatRuUjYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-Rb1_BmuFN2iGvqariv2Izg-1; Fri, 20 Jan 2023 07:27:11 -0500
X-MC-Unique: Rb1_BmuFN2iGvqariv2Izg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF78811E6E;
 Fri, 20 Jan 2023 12:27:11 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0F2840C6EC4;
 Fri, 20 Jan 2023 12:27:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 32/38] block/qapi: Let bdrv_query_image_info() recurse
Date: Fri, 20 Jan 2023 13:26:27 +0100
Message-Id: <20230120122633.84983-33-kwolf@redhat.com>
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

There is no real reason why bdrv_query_image_info() should generally not
recurse.  The ImageInfo struct has a pointer to the backing image, so it
should generally be filled, unless the caller explicitly opts out.

This moves the recursing code from bdrv_block_device_info() into
bdrv_query_image_info().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-7-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/qapi.h |  2 +
 block/qapi.c         | 92 +++++++++++++++++++++++++++-----------------
 2 files changed, 58 insertions(+), 36 deletions(-)

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
index 21ef684a1c..fa8bbc3fc7 100644
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
@@ -146,37 +148,21 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
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
@@ -354,19 +340,28 @@ void bdrv_query_block_node_info(BlockDriverState *bs,
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
@@ -375,11 +370,36 @@ void bdrv_query_image_info(BlockDriverState *bs,
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
2.38.1


