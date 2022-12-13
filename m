Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4BD64B1D9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:04:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5131-0006TB-1W; Tue, 13 Dec 2022 03:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512p-0006LF-SW
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512n-0002zu-LI
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJCgakwC0FuKF/QQXUJqdhYyrwEbk0YhblkFzIp+hTI=;
 b=dgtE3/tTbth62CNAifSzl/25TQDk3dR2rEoet/NVWGfe7gSNxBBzBIsbF74mDYq/rCJLD3
 fx5gVjNFlOsp43Jvrb2n6JulKeUVXTrQWMjdrZ/5LrD3NtnqXLL8vt4jR6ZHs/Sw86+bJ6
 hfrOBBe8S0o1QKpbZeJc70OJ4E+zj18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-DZFmYB3GPlarpiS-Ff8hUg-1; Tue, 13 Dec 2022 03:53:43 -0500
X-MC-Unique: DZFmYB3GPlarpiS-Ff8hUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E58C2932491;
 Tue, 13 Dec 2022 08:53:43 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12D3E492C14;
 Tue, 13 Dec 2022 08:53:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 09/14] block: Convert bdrv_get_info() to co_wrapper_mixed
Date: Tue, 13 Dec 2022 09:53:15 +0100
Message-Id: <20221213085320.95673-10-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

bdrv_get_info() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 5 ++++-
 include/block/block_int-common.h | 3 ++-
 block.c                          | 4 ++--
 block/crypto.c                   | 2 +-
 block/io.c                       | 8 ++++----
 block/mirror.c                   | 2 +-
 block/raw-format.c               | 2 +-
 7 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index b1c6abee7b..1d6748463c 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -148,7 +148,10 @@ bool bdrv_supports_compressed_writes(BlockDriverState *bs);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
 const char *bdrv_get_device_name(const BlockDriverState *bs);
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs);
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+int co_wrapper_mixed bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
                                           Error **errp);
 BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 7b324c3bfc..2c190c6d75 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -696,7 +696,8 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset);
 
-    int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
+    int coroutine_fn (*bdrv_get_info)(BlockDriverState *bs,
+                                      BlockDriverInfo *bdi);
 
     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
                                                  Error **errp);
diff --git a/block.c b/block.c
index f3d6693113..7694879a54 100644
--- a/block.c
+++ b/block.c
@@ -6300,7 +6300,7 @@ void bdrv_get_backing_filename(BlockDriverState *bs,
     pstrcpy(filename, filename_size, bs->backing_file);
 }
 
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     int ret;
     BlockDriver *drv = bs->drv;
@@ -6312,7 +6312,7 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     if (!drv->bdrv_get_info) {
         BlockDriverState *filtered = bdrv_filter_bs(bs);
         if (filtered) {
-            return bdrv_get_info(filtered, bdi);
+            return bdrv_co_get_info(filtered, bdi);
         }
         return -ENOTSUP;
     }
diff --git a/block/crypto.c b/block/crypto.c
index bbeb9f437c..1b4a9eb8e7 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -743,7 +743,7 @@ static int block_crypto_get_info_luks(BlockDriverState *bs,
     BlockDriverInfo subbdi;
     int ret;
 
-    ret = bdrv_get_info(bs->file->bs, &subbdi);
+    ret = bdrv_co_get_info(bs->file->bs, &subbdi);
     if (ret != 0) {
         return ret;
     }
diff --git a/block/io.c b/block/io.c
index aef0929202..f988e42f26 100644
--- a/block/io.c
+++ b/block/io.c
@@ -712,14 +712,14 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
 /**
  * Round a region to cluster boundaries
  */
-void bdrv_round_to_clusters(BlockDriverState *bs,
+void coroutine_fn bdrv_round_to_clusters(BlockDriverState *bs,
                             int64_t offset, int64_t bytes,
                             int64_t *cluster_offset,
                             int64_t *cluster_bytes)
 {
     BlockDriverInfo bdi;
     IO_CODE();
-    if (bdrv_get_info(bs, &bdi) < 0 || bdi.cluster_size == 0) {
+    if (bdrv_co_get_info(bs, &bdi) < 0 || bdi.cluster_size == 0) {
         *cluster_offset = offset;
         *cluster_bytes = bytes;
     } else {
@@ -729,12 +729,12 @@ void bdrv_round_to_clusters(BlockDriverState *bs,
     }
 }
 
-static int bdrv_get_cluster_size(BlockDriverState *bs)
+static coroutine_fn int bdrv_get_cluster_size(BlockDriverState *bs)
 {
     BlockDriverInfo bdi;
     int ret;
 
-    ret = bdrv_get_info(bs, &bdi);
+    ret = bdrv_co_get_info(bs, &bdi);
     if (ret < 0 || bdi.cluster_size == 0) {
         return bs->bl.request_alignment;
     } else {
diff --git a/block/mirror.c b/block/mirror.c
index c7d7ce2f8f..26db3ad0d7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -956,7 +956,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
      */
     bdrv_get_backing_filename(target_bs, backing_filename,
                               sizeof(backing_filename));
-    if (!bdrv_get_info(target_bs, &bdi) && bdi.cluster_size) {
+    if (!bdrv_co_get_info(target_bs, &bdi) && bdi.cluster_size) {
         s->target_cluster_size = bdi.cluster_size;
     } else {
         s->target_cluster_size = BDRV_SECTOR_SIZE;
diff --git a/block/raw-format.c b/block/raw-format.c
index 28905b09ee..39a2f20df1 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,7 +369,7 @@ static BlockMeasureInfo *raw_measure(QemuOpts *opts, BlockDriverState *in_bs,
 
 static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
-    return bdrv_get_info(bs->file->bs, bdi);
+    return bdrv_co_get_info(bs->file->bs, bdi);
 }
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
-- 
2.38.1


