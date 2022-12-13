Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F364E64B243
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:23:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p512x-0006Ps-Gw; Tue, 13 Dec 2022 03:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512t-0006N1-GM
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512r-00031G-K2
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDIT5R8xLa5n0OX6Q2beZjyG+PsX1tFuVapUyb7CGoI=;
 b=NtEECSa+Rv+WX2SF630YAkfpA49lQKsOV+H3sPX/T2jEF4LKlsAB/TYHWukX04vULUmF/F
 at2wvMVzh8LJN1rU+ZnNdAKpUDl4LdXTFDBdr4tiSOkzHQ32p20euCBkAxRuO28F3O6acB
 AyV7HkNfcLI+vegR/FoUUswGZY12VXY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-P4rglM8ZPaayNTLiUfhnjQ-1; Tue, 13 Dec 2022 03:53:47 -0500
X-MC-Unique: P4rglM8ZPaayNTLiUfhnjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 392592932491;
 Tue, 13 Dec 2022 08:53:47 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20239492C1B;
 Tue, 13 Dec 2022 08:53:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 12/14] block: convert bdrv_lock_medium in co_wrapper
Date: Tue, 13 Dec 2022 09:53:18 +0100
Message-Id: <20221213085320.95673-13-kwolf@redhat.com>
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

bdrv_lock_medium() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

The only caller of this function is blk_lock_medium(). Therefore make
blk_lock_medium() a co_wrapper, so that it always creates a new
coroutine, and then make bdrv_lock_medium() a coroutine_fn where the
lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          | 2 +-
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 block.c                           | 2 +-
 block/block-backend.c             | 4 ++--
 block/copy-on-read.c              | 2 +-
 block/filter-compress.c           | 2 +-
 block/raw-format.c                | 2 +-
 8 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index f3d49ea05f..7e76bb647a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -143,7 +143,7 @@ int bdrv_get_flags(BlockDriverState *bs);
 bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
 bool co_wrapper bdrv_is_inserted(BlockDriverState *bs);
 
-void bdrv_lock_medium(BlockDriverState *bs, bool locked);
+void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked);
 void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
 
 const char *bdrv_get_format_name(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index fd31b37567..0de99682e2 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -712,7 +712,7 @@ struct BlockDriver {
     /* removable device specific */
     bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
     void coroutine_fn (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
-    void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
+    void coroutine_fn (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices */
     BlockAIOCB *(*bdrv_aio_ioctl)(BlockDriverState *bs,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 00209625e1..780c1e5f77 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -58,7 +58,9 @@ bool coroutine_fn blk_co_is_inserted(BlockBackend *blk);
 bool co_wrapper_mixed blk_is_inserted(BlockBackend *blk);
 
 bool blk_is_available(BlockBackend *blk);
-void blk_lock_medium(BlockBackend *blk, bool locked);
+
+void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked);
+void co_wrapper blk_lock_medium(BlockBackend *blk, bool locked);
 
 void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag);
 void co_wrapper blk_eject(BlockBackend *blk, bool eject_flag);
diff --git a/block.c b/block.c
index 11647e49db..d5e660bc9d 100644
--- a/block.c
+++ b/block.c
@@ -6834,7 +6834,7 @@ void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
  * Lock or unlock the media (if it is locked, the user won't be able
  * to eject it manually).
  */
-void bdrv_lock_medium(BlockDriverState *bs, bool locked)
+void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index 233ce6d05a..fcc9ede031 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1999,13 +1999,13 @@ bool blk_is_available(BlockBackend *blk)
     return blk_is_inserted(blk) && !blk_dev_is_tray_open(blk);
 }
 
-void blk_lock_medium(BlockBackend *blk, bool locked)
+void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
 
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
index efe1ef0265..adc766bf79 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -410,7 +410,7 @@ static void raw_eject(BlockDriverState *bs, bool eject_flag)
 
 static void raw_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 static int coroutine_fn raw_co_ioctl(BlockDriverState *bs,
-- 
2.38.1


