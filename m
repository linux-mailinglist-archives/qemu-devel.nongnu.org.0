Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA862C088
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:08:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ57-0001Gd-0B; Wed, 16 Nov 2022 09:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4z-0000uL-KL
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00069H-Po
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hwngj/ABa/x3wWMfoUyD4dyNgWdM0OqY2IrBe1CnYOo=;
 b=b4LXxP2KLBDXbF4Bz+1QMbjnAlG22LgrNDdOhDp1qS2Vv2aVV3B4ZZ5Vu2//EP0Lugo2/V
 5UqHlIVUoFLXpWi5FMr6Qd/lEzUTUraEZdsqdYYYs6Xs4QUMnEJB3oQtxAEXaNcKPN7uZh
 51QjLoBFTkb5+VjY7XfQSsciUbbehm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-9rHptg98Mgi-ImvoAFtazw-1; Wed, 16 Nov 2022 09:07:40 -0500
X-MC-Unique: 9rHptg98Mgi-ImvoAFtazw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D107286F132;
 Wed, 16 Nov 2022 14:07:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4026CC1908A;
 Wed, 16 Nov 2022 14:07:38 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 07/15] block: convert bdrv_get_info in generated_co_wrapper
Date: Wed, 16 Nov 2022 09:07:22 -0500
Message-Id: <20221116140730.3056048-8-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

BlockDriver->bdrv_get_info is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

Therefore use generated_co_wrapper to automatically
create a wrapper with the same name.
Unfortunately we cannot use a generated_co_wrapper_simple,
because the function is called by mixed functions that run both
in coroutine and non-coroutine context (for example block_load
in migration/block.c).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          |  6 ++++--
 block/crypto.c                   |  2 +-
 block/io.c                       |  8 ++++----
 block/mirror.c                   | 10 +++++++---
 block/raw-format.c               |  2 +-
 block/stream.c                   |  4 +++-
 include/block/block-io.h         |  6 +++++-
 include/block/block_int-common.h |  4 +++-
 8 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 5650d6fe63..2cdede9c01 100644
--- a/block.c
+++ b/block.c
@@ -6279,11 +6279,13 @@ void bdrv_get_backing_filename(BlockDriverState *bs,
     pstrcpy(filename, filename_size, bs->backing_file);
 }
 
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     int ret;
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
         return -ENOMEDIUM;
@@ -6291,7 +6293,7 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     if (!drv->bdrv_get_info) {
         BlockDriverState *filtered = bdrv_filter_bs(bs);
         if (filtered) {
-            return bdrv_get_info(filtered, bdi);
+            return bdrv_co_get_info(filtered, bdi);
         }
         return -ENOTSUP;
     }
diff --git a/block/crypto.c b/block/crypto.c
index 2fb8add458..12a84dd1cd 100644
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
index 3f65c57f82..99ef9a8cb9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -694,14 +694,14 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
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
@@ -711,12 +711,12 @@ void bdrv_round_to_clusters(BlockDriverState *bs,
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
index aecc895b73..8dc136ebbe 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -576,8 +576,10 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlockJob *s)
         } else if (ret >= 0 && !(ret & BDRV_BLOCK_DATA)) {
             int64_t target_offset;
             int64_t target_bytes;
-            bdrv_round_to_clusters(blk_bs(s->target), offset, io_bytes,
-                                   &target_offset, &target_bytes);
+            WITH_GRAPH_RDLOCK_GUARD() {
+                bdrv_round_to_clusters(blk_bs(s->target), offset, io_bytes,
+                                       &target_offset, &target_bytes);
+            }
             if (target_offset == offset &&
                 target_bytes == io_bytes) {
                 mirror_method = ret & BDRV_BLOCK_ZERO ?
@@ -965,11 +967,13 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
      */
     bdrv_get_backing_filename(target_bs, backing_filename,
                               sizeof(backing_filename));
-    if (!bdrv_get_info(target_bs, &bdi) && bdi.cluster_size) {
+    bdrv_graph_co_rdlock();
+    if (!bdrv_co_get_info(target_bs, &bdi) && bdi.cluster_size) {
         s->target_cluster_size = bdi.cluster_size;
     } else {
         s->target_cluster_size = BDRV_SECTOR_SIZE;
     }
+    bdrv_graph_co_rdunlock();
     if (backing_filename[0] && !bdrv_backing_chain_next(target_bs) &&
         s->granularity < s->target_cluster_size) {
         s->buf_size = MAX(s->buf_size, s->target_cluster_size);
diff --git a/block/raw-format.c b/block/raw-format.c
index a68014ef0b..4773bf9cda 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,7 +369,7 @@ static BlockMeasureInfo *raw_measure(QemuOpts *opts, BlockDriverState *in_bs,
 
 static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
-    return bdrv_get_info(bs->file->bs, bdi);
+    return bdrv_co_get_info(bs->file->bs, bdi);
 }
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
diff --git a/block/stream.c b/block/stream.c
index 22368ce186..6c9d0eefd1 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -141,7 +141,9 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(s->target_bs);
+    WITH_GRAPH_RDLOCK_GUARD() {
+        len = bdrv_getlength(s->target_bs);
+    }
     if (len < 0) {
         return len;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index ac509c461f..ba60ffa43b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -129,7 +129,11 @@ bool bdrv_supports_compressed_writes(BlockDriverState *bs);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
 const char *bdrv_get_device_name(const BlockDriverState *bs);
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs);
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+int generated_co_wrapper bdrv_get_info(BlockDriverState *bs,
+                                       BlockDriverInfo *bdi);
+
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
                                           Error **errp);
 BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 42daf86c65..5874531617 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -740,7 +740,9 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset);
 
-    int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
+    /* Called with graph rdlock held. */
+    int coroutine_fn (*bdrv_get_info)(BlockDriverState *bs,
+                                      BlockDriverInfo *bdi);
 
     /* Does not need graph rdlock, since it does not traverse the graph */
     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
-- 
2.31.1


