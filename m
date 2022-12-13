Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9AD64B22C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5130-0006Sg-Ih; Tue, 13 Dec 2022 03:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512p-0006LE-SG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512o-000307-4r
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAUzh+Os3ogDaHUpnfJv1Euz+IEfCB6WHkXw9eTHgeE=;
 b=PFGrCYd+y9YnlmSXIMqbxWD+X5Q4V8I9goLCVLqfooHmqIqiS41H1vA1y5UjTfpi0Gyny4
 mA0IKM1xxd63SvpJ4Kq9XrtpHeVXGsCAsUaVLVnljXx4KtS2vCIqD6SpRy1SMie+3e0I1T
 dxLSLrKZ9R/9uGfHlcYWqu2Z7TjKAQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-6ZPvM6H8OxKxuVRJdXgNpw-1; Tue, 13 Dec 2022 03:53:42 -0500
X-MC-Unique: 6ZPvM6H8OxKxuVRJdXgNpw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9ADE8038E7;
 Tue, 13 Dec 2022 08:53:41 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF0E4492C14;
 Tue, 13 Dec 2022 08:53:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 08/14] block: Convert bdrv_get_allocated_file_size() to
 co_wrapper
Date: Tue, 13 Dec 2022 09:53:14 +0100
Message-Id: <20221213085320.95673-9-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

bdrv_get_allocated_file_size() is categorized as an I/O function, and it
currently doesn't run in a coroutine. We should let it take a graph
rdlock since it traverses the block nodes graph, which however is only
possible in a coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 4 +++-
 include/block/block_int-common.h | 3 ++-
 block.c                          | 6 +++---
 block/qcow2-refcount.c           | 2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index fe1fa339be..b1c6abee7b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -79,7 +79,9 @@ int64_t co_wrapper_mixed bdrv_nb_sectors(BlockDriverState *bs);
 int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs);
 int64_t co_wrapper_mixed bdrv_getlength(BlockDriverState *bs);
 
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs);
+int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
+
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 0e705e08f4..7b324c3bfc 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -685,7 +685,8 @@ struct BlockDriver {
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
     int64_t coroutine_fn (*bdrv_getlength)(BlockDriverState *bs);
-    int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
+
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
 
diff --git a/block.c b/block.c
index e1a8f7af4d..f3d6693113 100644
--- a/block.c
+++ b/block.c
@@ -5732,7 +5732,7 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED))
         {
-            child_size = bdrv_get_allocated_file_size(child->bs);
+            child_size = bdrv_co_get_allocated_file_size(child->bs);
             if (child_size < 0) {
                 return child_size;
             }
@@ -5747,7 +5747,7 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
  * Length of a allocated file in bytes. Sparse files are counted by actual
  * allocated space. Return < 0 if error or unknown.
  */
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -5768,7 +5768,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
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
-- 
2.38.1


