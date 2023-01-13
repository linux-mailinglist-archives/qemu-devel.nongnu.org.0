Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800466A43C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:43:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQt9-0000CQ-Kn; Fri, 13 Jan 2023 15:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt5-0000Ac-5b
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt3-0006EG-Br
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0Fw5S4R8JiKyy7j8E2+vB0YDvtiKDgJJa2hopxF7E4=;
 b=gzIjOcs1HSTHqneNsGozkz/rJqEyEqTHWBk6a6kw+mpOf2N2vOWyohlw6IYM3ztynisfH9
 Opod4frLU+d1kcJ7ZD3VSJ/42hhUNtcuyQD06Mm0ldg/ES1Ed8DLh7PCl1W+em4N8O42d7
 eYJy8Mnj8Sd70CMYqgbsdrOvdF7MRP0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-SkM0-DIfPkegPnYHstBGEg-1; Fri, 13 Jan 2023 15:42:49 -0500
X-MC-Unique: SkM0-DIfPkegPnYHstBGEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C1BD380671C;
 Fri, 13 Jan 2023 20:42:48 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F4FC2026D68;
 Fri, 13 Jan 2023 20:42:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 12/14] block: Convert bdrv_lock_medium() to co_wrapper
Date: Fri, 13 Jan 2023 21:42:10 +0100
Message-Id: <20230113204212.359076-13-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
 block.c                           | 6 +++---
 block/block-backend.c             | 4 ++--
 block/copy-on-read.c              | 6 +++---
 block/file-posix.c                | 8 ++++----
 block/filter-compress.c           | 7 ++++---
 block/raw-format.c                | 6 +++---
 9 files changed, 24 insertions(+), 21 deletions(-)

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
index 1631a26427..1174f13a2f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -713,7 +713,7 @@ struct BlockDriver {
     /* removable device specific */
     bool coroutine_fn (*bdrv_co_is_inserted)(BlockDriverState *bs);
     void coroutine_fn (*bdrv_co_eject)(BlockDriverState *bs, bool eject_flag);
-    void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
+    void coroutine_fn (*bdrv_co_lock_medium)(BlockDriverState *bs, bool locked);
 
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
index d8415c9519..b7ccb44184 100644
--- a/block.c
+++ b/block.c
@@ -6834,14 +6834,14 @@ void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
  * Lock or unlock the media (if it is locked, the user won't be able
  * to eject it manually).
  */
-void bdrv_lock_medium(BlockDriverState *bs, bool locked)
+void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
     trace_bdrv_lock_medium(bs, locked);
 
-    if (drv && drv->bdrv_lock_medium) {
-        drv->bdrv_lock_medium(bs, locked);
+    if (drv && drv->bdrv_co_lock_medium) {
+        drv->bdrv_co_lock_medium(bs, locked);
     }
 }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 7320081814..11e46ecb51 100644
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
index 43f09514dc..5032b78efc 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -222,9 +222,9 @@ static void coroutine_fn cor_co_eject(BlockDriverState *bs, bool eject_flag)
 }
 
 
-static void cor_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn cor_co_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 
@@ -258,7 +258,7 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
 
     .bdrv_co_eject                      = cor_co_eject,
-    .bdrv_lock_medium                   = cor_lock_medium,
+    .bdrv_co_lock_medium                = cor_co_lock_medium,
 
     .has_variable_length                = true,
     .is_filter                          = true,
diff --git a/block/file-posix.c b/block/file-posix.c
index 21f49f9782..0dc4546740 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3782,7 +3782,7 @@ static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
     }
 }
 
-static void cdrom_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn cdrom_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3828,7 +3828,7 @@ static BlockDriver bdrv_host_cdrom = {
     /* removable device support */
     .bdrv_co_is_inserted    = cdrom_co_is_inserted,
     .bdrv_co_eject          = cdrom_co_eject,
-    .bdrv_lock_medium   = cdrom_lock_medium,
+    .bdrv_co_lock_medium    = cdrom_co_lock_medium,
 
     /* generic scsi device */
     .bdrv_co_ioctl      = hdev_co_ioctl,
@@ -3910,7 +3910,7 @@ static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
     cdrom_reopen(bs);
 }
 
-static void cdrom_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn cdrom_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3957,7 +3957,7 @@ static BlockDriver bdrv_host_cdrom = {
     /* removable device support */
     .bdrv_co_is_inserted     = cdrom_co_is_inserted,
     .bdrv_co_eject           = cdrom_co_eject,
-    .bdrv_lock_medium   = cdrom_lock_medium,
+    .bdrv_co_lock_medium     = cdrom_co_lock_medium,
 };
 #endif /* __FreeBSD__ */
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 97adb3de19..a4e7b191bd 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -123,9 +123,10 @@ compress_co_eject(BlockDriverState *bs, bool eject_flag)
 }
 
 
-static void compress_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn
+compress_co_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 
@@ -144,7 +145,7 @@ static BlockDriver bdrv_compress = {
     .bdrv_refresh_limits                = compress_refresh_limits,
 
     .bdrv_co_eject                      = compress_co_eject,
-    .bdrv_lock_medium                   = compress_lock_medium,
+    .bdrv_co_lock_medium                = compress_co_lock_medium,
 
     .has_variable_length                = true,
     .is_filter                          = true,
diff --git a/block/raw-format.c b/block/raw-format.c
index 2585e9ef96..44d2e8a727 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -409,9 +409,9 @@ static void coroutine_fn raw_co_eject(BlockDriverState *bs, bool eject_flag)
     bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
-static void raw_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn raw_co_lock_medium(BlockDriverState *bs, bool locked)
 {
-    bdrv_lock_medium(bs->file->bs, locked);
+    bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
 static int coroutine_fn raw_co_ioctl(BlockDriverState *bs,
@@ -631,7 +631,7 @@ BlockDriver bdrv_raw = {
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
     .bdrv_co_eject        = &raw_co_eject,
-    .bdrv_lock_medium     = &raw_lock_medium,
+    .bdrv_co_lock_medium  = &raw_co_lock_medium,
     .bdrv_co_ioctl        = &raw_co_ioctl,
     .create_opts          = &raw_create_opts,
     .bdrv_has_zero_init   = &raw_has_zero_init,
-- 
2.38.1


