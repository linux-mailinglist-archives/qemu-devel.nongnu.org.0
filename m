Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B96162C0A2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ5B-0001Yx-Rm; Wed, 16 Nov 2022 09:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ55-0001Fb-Sq
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ51-0006Ez-VD
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LShO/uGsC8MvfXvuAy3Z4R8eneqVZb89nHc5ckNve1A=;
 b=MhVWa+8PIDksjMwLCEbKIgZXk9q8+fIzrpIa8wY/Gw+fZNNvVPdg07l8OHQq9E9ADNO1OV
 uIq0V1pydNbkPZqVFE3LcgpUBjk4QJa9JL5zxYAz6x167g2jkkjo4PNxkPD9d8TUfJGZSH
 OVKSWTkuZfukZQmwP8ZIIZUKPtXkIco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-wuejGfBGP4mN9Qsk90D3tA-1; Wed, 16 Nov 2022 09:07:44 -0500
X-MC-Unique: wuejGfBGP4mN9Qsk90D3tA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 521FA3810D36;
 Wed, 16 Nov 2022 14:07:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4941C2C7E6;
 Wed, 16 Nov 2022 14:07:42 +0000 (UTC)
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
Subject: [PATCH 14/15] block: convert bdrv_io_unplug in
 generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 09:07:29 -0500
Message-Id: <20221116140730.3056048-15-eesposit@redhat.com>
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

BlockDriver->bdrv_io_unplug is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

The only caller of this function is blk_unplug, therefore
make blk_unplug a generated_co_wrapper_simple, so that
it always creates a new coroutine, and then make bdrv_unplug
coroutine_fn.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c             | 5 +++--
 block/io.c                        | 5 +++--
 include/block/block-io.h          | 3 +--
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 826a936beb..3b10e35ea4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2340,13 +2340,14 @@ void coroutine_fn blk_co_io_plug(BlockBackend *blk)
     }
 }
 
-void blk_io_unplug(BlockBackend *blk)
+void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (bs) {
-        bdrv_io_unplug(bs);
+        bdrv_co_io_unplug(bs);
     }
 }
 
diff --git a/block/io.c b/block/io.c
index d3b8c1e4b2..48a94dd384 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3086,10 +3086,11 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
     }
 }
 
-void bdrv_io_unplug(BlockDriverState *bs)
+void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
@@ -3100,7 +3101,7 @@ void bdrv_io_unplug(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_io_unplug(child->bs);
+        bdrv_co_io_unplug(child->bs);
     }
 }
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index a045643b26..f93357681a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -216,8 +216,7 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co);
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
-
-void bdrv_io_unplug(BlockDriverState *bs);
+void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
                                                      const char *name,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index ed96bc3241..3ab3fa45a2 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -787,7 +787,7 @@ struct BlockDriver {
 
     /* io queue for linux-aio. Called with graph rdlock taken. */
     void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
-    void (*bdrv_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_io_unplug)(BlockDriverState *bs);
 
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 703fcc3ac5..c8df7320f7 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -90,7 +90,9 @@ int blk_get_max_hw_iov(BlockBackend *blk);
 void coroutine_fn blk_co_io_plug(BlockBackend *blk);
 void generated_co_wrapper_simple blk_io_plug(BlockBackend *blk);
 
-void blk_io_unplug(BlockBackend *blk);
+void coroutine_fn blk_co_io_unplug(BlockBackend *blk);
+void generated_co_wrapper_simple blk_io_unplug(BlockBackend *blk);
+
 AioContext *blk_get_aio_context(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
-- 
2.31.1


