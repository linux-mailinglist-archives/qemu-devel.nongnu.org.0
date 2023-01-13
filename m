Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917966A44B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQsv-0008Uj-Pc; Fri, 13 Jan 2023 15:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsu-0008U4-2r
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQss-0006Ae-EY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIbV6Io5SFMWMIK2saSNjq+6vb91PnROYlgpMfje74o=;
 b=F4YH12oeFinRETreedUhFpow/uMA6HKMU6VrIANEfT2PWCwCdIVgRIniuKJBYht79Yb7M3
 DKrLRXYZTQymz92UL9YvqIS53aN/zowpxZg2T6Xczf4YSJ/LVOuUf15BADaHEG2GGvQoTm
 +n/xY3rQbyb3L/Ue7ZLMz6UWimG8Mf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-38ZMUdYAPZKZUK4ExjxRzQ-1; Fri, 13 Jan 2023 15:42:38 -0500
X-MC-Unique: 38ZMUdYAPZKZUK4ExjxRzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 523CC811E6E;
 Fri, 13 Jan 2023 20:42:38 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2546A2026D68;
 Fri, 13 Jan 2023 20:42:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 05/14] block: Rename refresh_total_sectors to
 bdrv_refresh_total_sectors
Date: Fri, 13 Jan 2023 21:42:03 +0100
Message-Id: <20230113204212.359076-6-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The name is not good, not the least because we are going to convert this
to a generated co_wrapper, which adds a _co infix after the first part
of the name.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-io.h | 2 +-
 block.c                      | 8 ++++----
 block/io.c                   | 8 +++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 8bc061ebb8..6b285fb520 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -120,7 +120,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags);
 
-int refresh_total_sectors(BlockDriverState *bs, int64_t hint);
+int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
diff --git a/block.c b/block.c
index e89844557b..7c279fc0e6 100644
--- a/block.c
+++ b/block.c
@@ -1034,7 +1034,7 @@ static int find_image_format(BlockBackend *file, const char *filename,
  * Set the current 'total_sectors' value
  * Return 0 on success, -errno on error.
  */
-int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
+int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -1651,7 +1651,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->supported_read_flags |= BDRV_REQ_REGISTERED_BUF;
     bs->supported_write_flags |= BDRV_REQ_REGISTERED_BUF;
 
-    ret = refresh_total_sectors(bs, bs->total_sectors);
+    ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
         return ret;
@@ -5808,7 +5808,7 @@ int64_t bdrv_nb_sectors(BlockDriverState *bs)
         return -ENOMEDIUM;
 
     if (drv->has_variable_length) {
-        int ret = refresh_total_sectors(bs, bs->total_sectors);
+        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             return ret;
         }
@@ -6590,7 +6590,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
             bdrv_dirty_bitmap_skip_store(bm, false);
         }
 
-        ret = refresh_total_sectors(bs, bs->total_sectors);
+        ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             error_setg_errno(errp, -ret, "Could not refresh total sector count");
diff --git a/block/io.c b/block/io.c
index 03becd32d2..e5e51563a5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3473,15 +3473,17 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         goto out;
     }
 
-    ret = refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
+    ret = bdrv_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
     } else {
         offset = bs->total_sectors * BDRV_SECTOR_SIZE;
     }
-    /* It's possible that truncation succeeded but refresh_total_sectors
+    /*
+     * It's possible that truncation succeeded but bdrv_refresh_total_sectors
      * failed, but the latter doesn't affect how we should finish the request.
-     * Pass 0 as the last parameter so that dirty bitmaps etc. are handled. */
+     * Pass 0 as the last parameter so that dirty bitmaps etc. are handled.
+     */
     bdrv_co_write_req_finish(child, offset - new_bytes, new_bytes, &req, 0);
 
 out:
-- 
2.38.1


