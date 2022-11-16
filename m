Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC362C09B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ56-0001GM-UW; Wed, 16 Nov 2022 09:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4x-0000qi-5V
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00068Y-Sq
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKjbvCBHfWczLtZ4W4XK4ekyG4Mj/cWzo96rN1QJT1s=;
 b=J5fO2ItC7JXiE7uTgXY8brNMoKNejz42LG3TmteWx5FXa3UXmSpGQ2MxBmWH+aIlHnXUnv
 K3jVw+z1a6t3b4jtQJSTZ11LreZNH30BB6eY7HVbPagzcV+SJMf2udULbPXcCK8LNI/wAc
 Gk+axM6SAzkX+TMuoSFfpjtAfcvEOw0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-E5c26S8FNRmq5zSBQzvMqg-1; Wed, 16 Nov 2022 09:07:36 -0500
X-MC-Unique: E5c26S8FNRmq5zSBQzvMqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A421C087A2;
 Wed, 16 Nov 2022 14:07:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D643FC2C8C5;
 Wed, 16 Nov 2022 14:07:34 +0000 (UTC)
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
Subject: [PATCH 02/15] block: rename refresh_total_sectors in
 bdrv_refresh_total_sectors
Date: Wed, 16 Nov 2022 09:07:17 -0500
Message-Id: <20221116140730.3056048-3-eesposit@redhat.com>
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

Name is not right, since we are going to convert this in
a generated_co_wrapper.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                      | 8 ++++----
 block/io.c                   | 8 +++++---
 include/block/block_int-io.h | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 1a6ae08879..ba4bbb42aa 100644
--- a/block.c
+++ b/block.c
@@ -1044,7 +1044,7 @@ static int find_image_format(BlockBackend *file, const char *filename,
  * Set the current 'total_sectors' value
  * Return 0 on success, -errno on error.
  */
-int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
+int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -1662,7 +1662,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->supported_read_flags |= BDRV_REQ_REGISTERED_BUF;
     bs->supported_write_flags |= BDRV_REQ_REGISTERED_BUF;
 
-    ret = refresh_total_sectors(bs, bs->total_sectors);
+    ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
         return ret;
@@ -5783,7 +5783,7 @@ int64_t bdrv_nb_sectors(BlockDriverState *bs)
         return -ENOMEDIUM;
 
     if (drv->has_variable_length) {
-        int ret = refresh_total_sectors(bs, bs->total_sectors);
+        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             return ret;
         }
@@ -6565,7 +6565,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
             bdrv_dirty_bitmap_skip_store(bm, false);
         }
 
-        ret = refresh_total_sectors(bs, bs->total_sectors);
+        ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             error_setg_errno(errp, -ret, "Could not refresh total sector count");
diff --git a/block/io.c b/block/io.c
index 7d1d0c48b0..99867fe148 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3411,15 +3411,17 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
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
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index ac6ad3b3ff..453855e651 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -122,7 +122,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags);
 
-int refresh_total_sectors(BlockDriverState *bs, int64_t hint);
+int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
-- 
2.31.1


