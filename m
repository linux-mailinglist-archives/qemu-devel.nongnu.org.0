Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7944CFC7C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:17:09 +0100 (CET)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBMS-0004wH-9G
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjN-0005Ja-Ri
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjM-0008KV-5p
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myF5mtN7LUWMcgCsFvxFKq4vHms4a3d3Zf2Jh0fwCxE=;
 b=Opn25nn0hq4e5zMYVyoBVNQ1Dvc4sly1X6GljN4m16UlARmFlRX4VXRUPOhXJj8OePG70F
 4Ta0WM7YjE4O5kU/ic7xcD+tXUe/KkyKoVDSJlvlthNWJZa9SR6T6w3KW4xWqhfmixC03R
 RcoPLSe+yLAOO30Zx3A23w1hUhcmxAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-CJIgE6UvMgqLMK4-mRhVvw-1; Mon, 07 Mar 2022 05:36:40 -0500
X-MC-Unique: CJIgE6UvMgqLMK4-mRhVvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD77835DE6;
 Mon,  7 Mar 2022 10:36:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 434EF1017CF1;
 Mon,  7 Mar 2022 10:36:39 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/23] block/io: introduce block driver snapshot-access API
Date: Mon,  7 Mar 2022 11:35:43 +0100
Message-Id: <20220307103549.808809-18-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add new block driver handlers and corresponding generic wrappers.
It will be used to allow copy-before-write filter to provide
reach fleecing interface in further commit.

In future this approach may be used to allow reading qcow2 internal
snapshots, for example to export them through NBD.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220303194349.2304213-11-vsementsov@virtuozzo.com>
[hreitz: Rebased on block GS/IO split]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int-common.h | 18 ++++++++
 include/block/block_int-io.h     |  9 ++++
 block/io.c                       | 72 ++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 5a04c778e4..4ba04d0cc6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -597,6 +597,24 @@ struct BlockDriver {
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
 
+    /*
+     * Snapshot-access API.
+     *
+     * Block-driver may provide snapshot-access API: special functions to access
+     * some internal "snapshot". The functions are similar with normal
+     * read/block_status/discard handler, but don't have any specific handling
+     * in generic block-layer: no serializing, no alignment, no tracked
+     * requests. So, block-driver that realizes these APIs is fully responsible
+     * for synchronization between snapshot-access API and normal IO requests.
+     */
+    int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+    int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
+        bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+        int64_t *map, BlockDriverState **file);
+    int coroutine_fn (*bdrv_co_pdiscard_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes);
+
     /*
      * Invalidate any cached meta-data.
      */
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 3da5f01c42..bb454200e5 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -33,6 +33,15 @@
  * the I/O API.
  */
 
+int coroutine_fn bdrv_co_preadv_snapshot(BdrvChild *child,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+int coroutine_fn bdrv_co_snapshot_block_status(BlockDriverState *bs,
+    bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+    int64_t *map, BlockDriverState **file);
+int coroutine_fn bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
+    int64_t offset, int64_t bytes);
+
+
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
diff --git a/block/io.c b/block/io.c
index 8bee484463..f0c8da6b9f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3654,3 +3654,75 @@ void bdrv_cancel_in_flight(BlockDriverState *bs)
         bs->drv->bdrv_cancel_in_flight(bs);
     }
 }
+
+int coroutine_fn
+bdrv_co_preadv_snapshot(BdrvChild *child, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockDriverState *bs = child->bs;
+    BlockDriver *drv = bs->drv;
+    int ret;
+    IO_CODE();
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_preadv_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_preadv_snapshot(bs, offset, bytes, qiov, qiov_offset);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_snapshot_block_status(BlockDriverState *bs,
+                              bool want_zero, int64_t offset, int64_t bytes,
+                              int64_t *pnum, int64_t *map,
+                              BlockDriverState **file)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+    IO_CODE();
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_snapshot_block_status) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_snapshot_block_status(bs, want_zero, offset, bytes,
+                                             pnum, map, file);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+    IO_CODE();
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_pdiscard_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_pdiscard_snapshot(bs, offset, bytes);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
-- 
2.34.1


