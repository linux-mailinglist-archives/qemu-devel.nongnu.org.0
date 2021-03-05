Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04032F0B5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:08:06 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDvp-00042W-I3
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkR-00075q-EU
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007FD-3X
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1IcRM5y+74Od8lqtTk4yL9GcZ7XhiSUdItwkOJcgY4=;
 b=WuXqy94vgnF115tOl9ii8AAgAYROLt6JPUz7hCAQPbXrHI3XzMXnG+ROYFj2hY2pJcdN5R
 uuG2ZlnYHoXtENhrfok9ihKZSBPWJz/B4PzdsjG6SsFkREyWngP5NqN8tb52/jQUzuIgjv
 gQizt0osy1qiIe9uwgSdXuulsdKS3NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-HbcxL6SnNkuwtAG9C3EyAw-1; Fri, 05 Mar 2021 11:55:54 -0500
X-MC-Unique: HbcxL6SnNkuwtAG9C3EyAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50F5E4964;
 Fri,  5 Mar 2021 16:55:40 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94E9F60BF3;
 Fri,  5 Mar 2021 16:55:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/31] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
Date: Fri,  5 Mar 2021 17:54:47 +0100
Message-Id: <20210305165454.356840-25-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename bytes_covered_by_bitmap_cluster() to
bdrv_dirty_bitmap_serialization_coverage() and make it public.
It is needed as we are going to share it with bitmap loading in
parallels format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Message-Id: <20210224104707.88430-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/dirty-bitmap.h |  2 ++
 block/dirty-bitmap.c         | 13 +++++++++++++
 block/qcow2-bitmap.c         | 16 ++--------------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 36e8da4fc2..f581cf9fd7 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -57,6 +57,8 @@ void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
 uint64_t bdrv_dirty_bitmap_serialization_size(const BdrvDirtyBitmap *bitmap,
                                               uint64_t offset, uint64_t bytes);
 uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap);
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+        const BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 9b9cd71238..a0eaa28785 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -726,6 +726,19 @@ uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap)
     return hbitmap_serialization_align(bitmap->bitmap);
 }
 
+/* Return the disk size covered by a chunk of serialized bitmap data. */
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+                                                  const BdrvDirtyBitmap *bitmap)
+{
+    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
+    uint64_t limit = granularity * (serialized_chunk_size << 3);
+
+    assert(QEMU_IS_ALIGNED(limit,
+                           bdrv_dirty_bitmap_serialization_align(bitmap)));
+    return limit;
+}
+
+
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes)
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 5eef82fa55..42d81c44cd 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -278,18 +278,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
     return 0;
 }
 
-/* Return the disk size covered by a single qcow2 cluster of bitmap data. */
-static uint64_t bytes_covered_by_bitmap_cluster(const BDRVQcow2State *s,
-                                                const BdrvDirtyBitmap *bitmap)
-{
-    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
-    uint64_t limit = granularity * (s->cluster_size << 3);
-
-    assert(QEMU_IS_ALIGNED(limit,
-                           bdrv_dirty_bitmap_serialization_align(bitmap)));
-    return limit;
-}
-
 /* load_bitmap_data
  * @bitmap_table entries must satisfy specification constraints.
  * @bitmap must be cleared */
@@ -312,7 +300,7 @@ static int load_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
         uint64_t count = MIN(bm_size - offset, limit);
         uint64_t entry = bitmap_table[i];
@@ -1303,7 +1291,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
 
     offset = 0;
-- 
2.29.2


