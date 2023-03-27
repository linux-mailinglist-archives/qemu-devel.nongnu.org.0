Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF86CA2A7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:42:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglDH-0003Sy-Mc; Mon, 27 Mar 2023 07:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pglDB-0003SF-Af
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pglD8-0004md-Jq
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679917224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=04jb2mEuGMYCu2cDIuynYzdYP2L58gnXOJT1cPTez8c=;
 b=VqufBrObZKIUlOa2u0efvVPLMFMb94cSVEjY8z1cSgi3udMM6Kle/xdc33LoNVegqL5nmG
 6QObxs4F35Bkog8FOMILw5ah2bnBxFeH5REcAdOHQil5bT827ELQ80eJxqEYoEqWoVmNGr
 lBErbNYJaU06VriuIUh+KS5EPKlfNoI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-_3-H9O1uM5ec8Xk3hk3ILg-1; Mon, 27 Mar 2023 07:40:23 -0400
X-MC-Unique: _3-H9O1uM5ec8Xk3hk3ILg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02AC73C025CE;
 Mon, 27 Mar 2023 11:40:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B275406AA66;
 Mon, 27 Mar 2023 11:40:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 ldoktor@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH for-8.0] block/export: Fix graph locking in blk_get_geometry()
 call
Date: Mon, 27 Mar 2023 13:39:59 +0200
Message-Id: <20230327113959.60071-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

blk_get_geometry() eventually calls bdrv_nb_sectors(), which is a
co_wrapper_mixed_bdrv_rdlock. This means that when it is called from
coroutine context, it already assume to have the graph locked.

However, virtio_blk_sect_range_ok() in block/export/virtio-blk-handler.c
(used by vhost-user-blk and VDUSE exports) runs in a coroutine, but
doesn't take the graph lock - blk_*() functions are generally expected
to do that internally. This causes an assertion failure when accessing
an export for the first time if it runs in an iothread.

This is an example of the crash:

$ ./storage-daemon/qemu-storage-daemon --object iothread,id=th0 --blockdev file,filename=/home/kwolf/images/hd.img,node-name=disk --export vhost-user-blk,addr.type=unix,addr.path=/tmp/vhost.sock,node-name=disk,id=exp0,iothread=th0
qemu-storage-daemon: ../block/graph-lock.c:268: void assert_bdrv_graph_readable(void): Assertion `qemu_in_main_thread() || reader_count()' failed.

(gdb) bt

Fix this by creating a new blk_co_get_geometry() that takes the lock,
and changing blk_get_geometry() to be a co_wrapper_mixed around it.

To make the resulting code cleaner, virtio-blk-handler.c can directly
call the coroutine version now (though that wouldn't be necessary for
fixing the bug, taking the lock in blk_co_get_geometry() is what fixes
it).

Fixes: 8ab8140a04cf771d63e9754d6ba6c1e676bfe507
Reported-by: Lukáš Doktor <ldoktor@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          | 4 +++-
 include/sysemu/block-backend-io.h | 5 ++++-
 block.c                           | 5 +++--
 block/block-backend.c             | 7 +++++--
 block/export/virtio-blk-handler.c | 7 ++++---
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5da99d4d60..dbc034b728 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -89,7 +89,9 @@ int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
 
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
-void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
+
+void coroutine_fn GRAPH_RDLOCK
+bdrv_co_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 40ab178719..c672b77247 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -70,7 +70,10 @@ void co_wrapper blk_eject(BlockBackend *blk, bool eject_flag);
 int64_t coroutine_fn blk_co_getlength(BlockBackend *blk);
 int64_t co_wrapper_mixed blk_getlength(BlockBackend *blk);
 
-void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
+void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
+                                      uint64_t *nb_sectors_ptr);
+void co_wrapper_mixed blk_get_geometry(BlockBackend *blk,
+                                       uint64_t *nb_sectors_ptr);
 
 int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk);
 int64_t co_wrapper_mixed blk_nb_sectors(BlockBackend *blk);
diff --git a/block.c b/block.c
index 0dd604d0f6..e0c6c648b1 100644
--- a/block.c
+++ b/block.c
@@ -5879,9 +5879,10 @@ int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
 }
 
 /* return 0 as number of sectors if no device present or error */
-void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr)
+void coroutine_fn bdrv_co_get_geometry(BlockDriverState *bs,
+                                       uint64_t *nb_sectors_ptr)
 {
-    int64_t nb_sectors = bdrv_nb_sectors(bs);
+    int64_t nb_sectors = bdrv_co_nb_sectors(bs);
     IO_CODE();
 
     *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
diff --git a/block/block-backend.c b/block/block-backend.c
index 278b04ce69..2ee39229e4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1615,13 +1615,16 @@ int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
     return bdrv_co_getlength(blk_bs(blk));
 }
 
-void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
+void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
+                                      uint64_t *nb_sectors_ptr)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
+
     if (!blk_bs(blk)) {
         *nb_sectors_ptr = 0;
     } else {
-        bdrv_get_geometry(blk_bs(blk), nb_sectors_ptr);
+        bdrv_co_get_geometry(blk_bs(blk), nb_sectors_ptr);
     }
 }
 
diff --git a/block/export/virtio-blk-handler.c b/block/export/virtio-blk-handler.c
index 313666e8ab..bc1cec6757 100644
--- a/block/export/virtio-blk-handler.c
+++ b/block/export/virtio-blk-handler.c
@@ -22,8 +22,9 @@ struct virtio_blk_inhdr {
     unsigned char status;
 };
 
-static bool virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
-                                     uint64_t sector, size_t size)
+static bool coroutine_fn
+virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
+                         uint64_t sector, size_t size)
 {
     uint64_t nb_sectors;
     uint64_t total_sectors;
@@ -41,7 +42,7 @@ static bool virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
     if ((sector << VIRTIO_BLK_SECTOR_BITS) % block_size) {
         return false;
     }
-    blk_get_geometry(blk, &total_sectors);
+    blk_co_get_geometry(blk, &total_sectors);
     if (sector > total_sectors || nb_sectors > total_sectors - sector) {
         return false;
     }
-- 
2.39.2


