Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4362C0A3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ54-0001CK-VE; Wed, 16 Nov 2022 09:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4z-0000uC-BE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4s-0006AC-FU
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lm915XGX6fwpz7RDWuUK1Yqycg+7SVAnupnJpMzlUx8=;
 b=cWm1hVToNC06CnGnJc9iTWwPJYJl+vrBM/MuOxdFOxXKkp8bxEYkTbGT6vm9uW/qsSN2Ga
 zdCGWUzbt9qOk8UH/UukaWLRs0cR+KrR+SxSlZkQSXaSVKzRwiTL2jyGglHuk2+nGUqNFC
 FllM165GPWogRmOy6+zYx6F+5UgqIHM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-q5oWUr1GMGeIYJb2Oziz6w-1; Wed, 16 Nov 2022 09:07:42 -0500
X-MC-Unique: q5oWUr1GMGeIYJb2Oziz6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6853D3C10148;
 Wed, 16 Nov 2022 14:07:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAA24C2C8D2;
 Wed, 16 Nov 2022 14:07:40 +0000 (UTC)
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
Subject: [PATCH 11/15] block: convert bdrv_lock_medium in
 generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 09:07:26 -0500
Message-Id: <20221116140730.3056048-12-eesposit@redhat.com>
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

BlockDriver->bdrv_lock_medium is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

The only caller of this function is blk_lock_medium, therefore
make blk_lock_medium a generated_co_wrapper_simple, so that
it always creates a new coroutine, and then make bdrv_lock_medium
coroutine_fn.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                           | 3 ++-
 block/block-backend.c             | 5 +++--
 block/copy-on-read.c              | 2 +-
 block/filter-compress.c           | 2 +-
 block/raw-format.c                | 2 +-
 include/block/block-io.h          | 2 +-
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 5 ++++-
 8 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index ffbb8c602f..afc5735b82 100644
--- a/block.c
+++ b/block.c
@@ -6817,10 +6817,11 @@ void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
  * Lock or unlock the media (if it is locked, the user won't be able
  * to eject it manually).
  */
-void bdrv_lock_medium(BlockDriverState *bs, bool locked)
+void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
     trace_bdrv_lock_medium(bs, locked);
 
     if (drv && drv->bdrv_lock_medium) {
diff --git a/block/block-backend.c b/block/block-backend.c
index 308dd2070a..75e2f2124f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2009,13 +2009,14 @@ bool blk_is_available(BlockBackend *blk)
     return blk_is_inserted(blk) && !blk_dev_is_tray_open(blk);
 }
 
-void blk_lock_medium(BlockBackend *blk, bool locked)
+void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (bs) {
-        bdrv_lock_medium(bs, locked);
+        bdrv_co_lock_medium(bs, locked);
     }
 }
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 76f884a6ae..ccc767f37b 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -224,7 +224,7 @@ static void cor_eject(BlockDriverState *bs, bool eject_flag)
 
 static void cor_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 571e4684dd..e10312c225 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -124,7 +124,7 @@ static void compress_eject(BlockDriverState *bs, bool eject_flag)
 
 static void compress_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 
diff --git a/block/raw-format.c b/block/raw-format.c
index 9b23cf17bb..96a9b33384 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -410,7 +410,7 @@ static void raw_eject(BlockDriverState *bs, bool eject_flag)
 
 static void raw_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 static int coroutine_fn raw_co_ioctl(BlockDriverState *bs,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 204adeb701..497580fc28 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -124,7 +124,7 @@ int bdrv_get_flags(BlockDriverState *bs);
 bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
 bool generated_co_wrapper_simple bdrv_is_inserted(BlockDriverState *bs);
 
-void bdrv_lock_medium(BlockDriverState *bs, bool locked);
+void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked);
 void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
 
 const char *bdrv_get_format_name(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d01b3d44f5..3e1eba518c 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -762,7 +762,7 @@ struct BlockDriver {
     /* removable device specific. Called with graph rdlock held. */
     bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
     void coroutine_fn (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
-    void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
+    void coroutine_fn (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices. Called with graph rdlock taken. */
     BlockAIOCB *coroutine_fn (*bdrv_aio_ioctl)(BlockDriverState *bs,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index cc706c03d8..dd8566ee69 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -58,7 +58,10 @@ bool coroutine_fn blk_co_is_inserted(BlockBackend *blk);
 bool generated_co_wrapper blk_is_inserted(BlockBackend *blk);
 
 bool blk_is_available(BlockBackend *blk);
-void blk_lock_medium(BlockBackend *blk, bool locked);
+
+void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked);
+void generated_co_wrapper_simple blk_lock_medium(BlockBackend *blk,
+                                                 bool locked);
 
 void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag);
 void generated_co_wrapper_simple blk_eject(BlockBackend *blk, bool eject_flag);
-- 
2.31.1


