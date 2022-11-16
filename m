Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B333A62C0A6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ52-0000wp-HV; Wed, 16 Nov 2022 09:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4s-0000l6-Om
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00068C-1N
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofv4pS8f2mCmUoMSq24yvD4pA5jOYOOMvJoBvadaHDk=;
 b=TWojiLY4YU6pZrXLOuBNRPOQEnRYScuXhRNo1t+Cajqqx9gfOZrw/km82YPXpUSherMgqT
 WVXYkkuEQkdnpUwQ1PJavV/gw9TNb7lm8P6+nnzUa4dWHiiEXXqBB2D3kAkv4hwIxJcUKk
 V0NvFRRB7RXO2XDpG65UunSRgE2gHSo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-nQCHXKHoPtyrVf3x2v9Zkg-1; Wed, 16 Nov 2022 09:07:39 -0500
X-MC-Unique: nQCHXKHoPtyrVf3x2v9Zkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 365B63810D3B;
 Wed, 16 Nov 2022 14:07:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A64BC1908A;
 Wed, 16 Nov 2022 14:07:37 +0000 (UTC)
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
Subject: [PATCH 06/15] block: convert bdrv_get_allocated_file_size in
 generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 09:07:21 -0500
Message-Id: <20221116140730.3056048-7-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

BlockDriver->bdrv_get_allocated_file_size  is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

Therefore use generated_co_wrapper_simple to automatically
create a wrapper with the same name that will take care of
always calling the function in a coroutine.
This is a generated_co_wrapper_simple callback, which means
it assumes that bdrv_get_allocated_file_size  is never caled in a coroutine
context.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 7 ++++---
 block/qcow2-refcount.c           | 2 +-
 include/block/block-io.h         | 5 ++++-
 include/block/block_int-common.h | 3 ++-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index c7b32ba17a..5650d6fe63 100644
--- a/block.c
+++ b/block.c
@@ -5708,7 +5708,7 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED))
         {
-            child_size = bdrv_get_allocated_file_size(child->bs);
+            child_size = bdrv_co_get_allocated_file_size(child->bs);
             if (child_size < 0) {
                 return child_size;
             }
@@ -5723,10 +5723,11 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
  * Length of a allocated file in bytes. Sparse files are counted by actual
  * allocated space. Return < 0 if error or unknown.
  */
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -5744,7 +5745,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
         return -ENOTSUP;
     } else if (drv->is_filter) {
         /* Filter drivers default to the size of their filtered child */
-        return bdrv_get_allocated_file_size(bdrv_filter_bs(bs));
+        return bdrv_co_get_allocated_file_size(bdrv_filter_bs(bs));
     } else {
         /* Other drivers default to summing their children's sizes */
         return bdrv_sum_allocated_file_size(bs);
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 81264740f0..487681d85e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3719,7 +3719,7 @@ int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
         return file_length;
     }
 
-    real_allocation = bdrv_get_allocated_file_size(bs->file->bs);
+    real_allocation = bdrv_co_get_allocated_file_size(bs->file->bs);
     if (real_allocation < 0) {
         return real_allocation;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 4fb95e9b7a..ac509c461f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -74,7 +74,10 @@ int64_t generated_co_wrapper bdrv_nb_sectors(BlockDriverState *bs);
 int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs);
 int64_t generated_co_wrapper bdrv_getlength(BlockDriverState *bs);
 
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
+int64_t generated_co_wrapper_simple bdrv_get_allocated_file_size(
+                                                        BlockDriverState *bs);
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs);
+
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d1cf52d4f7..42daf86c65 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -725,7 +725,8 @@ struct BlockDriver {
                                          BdrvRequestFlags flags, Error **errp);
     /* Called with graph rdlock held. */
     int64_t coroutine_fn (*bdrv_getlength)(BlockDriverState *bs);
-    int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
+    /* Called with graph rdlock held. */
+    int64_t coroutine_fn (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
 
     /* Does not need graph rdlock, since it does not traverse the graph */
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
-- 
2.31.1


