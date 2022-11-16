Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C271362C018
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIn9-0000vb-N0; Wed, 16 Nov 2022 08:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImw-0000kl-Dp
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-00081v-7z
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05S0MrrbIh+OBWpI7z5ExyTAe4OPZXPHZsDvNzgylxE=;
 b=WGc1+b+EnKn6cWWMSU6gEWegsmGTD874ee2cnRPFm1O4Ls9XXJGwj/0iHtpmiSoBhPFpIe
 agnlDiLVkdS2JsHMwxgOgfrC6sp6JhUjeK23T80O3NM7/hRJ83c9NKHugfuZ0kpWn/C02/
 HwNG8zg78ou/X+tN7b2W/Utubhb1nQo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-Hc8eFjYVM--ZTcw0lfKLOw-1; Wed, 16 Nov 2022 08:48:59 -0500
X-MC-Unique: Hc8eFjYVM--ZTcw0lfKLOw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADDCB3C01DED;
 Wed, 16 Nov 2022 13:48:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA2D74A9266;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 17/20] block-gen: assert that bdrv_co_pdiscard is always
 called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:47 -0500
Message-Id: <20221116134850.3051419-18-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

This function, in addition to be called by a generated_co_wrapper,
is also called by the blk_* API.
The strategy is to always take the lock at the function called
when the coroutine is created, to avoid recursive locking.

Protecting bdrv_co_pdiscard{_snapshot}() implies that the following BlockDriver
callbacks always called with graph rdlock taken:
- bdrv_co_pdiscard
- bdrv_aio_pdiscard
- bdrv_co_pdiscard_snapshot

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 1 +
 block/io.c                       | 2 ++
 include/block/block_int-common.h | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index d660772375..211a813523 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1716,6 +1716,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     ret = blk_check_byte_request(blk, offset, bytes);
     if (ret < 0) {
diff --git a/block/io.c b/block/io.c
index c9b451fecd..bc9f47538c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2885,6 +2885,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     int head, tail, align;
     BlockDriverState *bs = child->bs;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
@@ -3488,6 +3489,7 @@ bdrv_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 568c2d3092..7c34a8e40f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -486,6 +486,7 @@ struct BlockDriver {
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_flush)(BlockDriverState *bs,
         BlockCompletionFunc *cb, void *opaque);
+    /* Called with graph rdlock taken. */
     BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
         int64_t offset, int bytes,
         BlockCompletionFunc *cb, void *opaque);
@@ -559,6 +560,7 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
         int64_t offset, int64_t bytes);
 
@@ -647,6 +649,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_pdiscard_snapshot)(BlockDriverState *bs,
         int64_t offset, int64_t bytes);
 
-- 
2.31.1


