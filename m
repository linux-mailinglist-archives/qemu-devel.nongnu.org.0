Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07F66A44D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQt7-0000BG-NX; Fri, 13 Jan 2023 15:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt4-0000AG-T0
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt3-0006EB-3W
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTXs2E+DeFR5RLPG0BVqzc8EWRfjlpGIVmG7TBaJ6qk=;
 b=N3lAl4UGhucj4AlbEZx+OY9GLPVs2mS32/3zr9mCLB3imQtK6IO2byBpealJxiDgcrOEAe
 qOLvZi2MOacIiJd5mClQZ13B9a3Ei3D5L6HPnyx26vq5/ofaznjNSeHbitjYR44xifjZuS
 +gCDmgzM8M9mI7w8vHFkK0nJ69qMUWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ld1fco6PN_WrW_NpzuR56w-1; Fri, 13 Jan 2023 15:42:47 -0500
X-MC-Unique: ld1fco6PN_WrW_NpzuR56w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 311BE858F09;
 Fri, 13 Jan 2023 20:42:47 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 078332026D68;
 Fri, 13 Jan 2023 20:42:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] block: Convert bdrv_eject() to co_wrapper
Date: Fri, 13 Jan 2023 21:42:09 +0100
Message-Id: <20230113204212.359076-12-kwolf@redhat.com>
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

bdrv_eject() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

The only caller of this function is blk_eject(). Therefore make
blk_eject() a co_wrapper, so that it always creates a new coroutine, and
then make bdrv_eject() coroutine_fn where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          | 3 ++-
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 block.c                           | 6 +++---
 block/block-backend.c             | 4 ++--
 block/copy-on-read.c              | 6 +++---
 block/file-posix.c                | 8 ++++----
 block/filter-compress.c           | 7 ++++---
 block/raw-format.c                | 6 +++---
 9 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index e27dc9787b..f3d49ea05f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -144,7 +144,8 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
 bool co_wrapper bdrv_is_inserted(BlockDriverState *bs);
 
 void bdrv_lock_medium(BlockDriverState *bs, bool locked);
-void bdrv_eject(BlockDriverState *bs, bool eject_flag);
+void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
+
 const char *bdrv_get_format_name(BlockDriverState *bs);
 
 bool bdrv_supports_compressed_writes(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index a6ac8afd5b..1631a26427 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -712,7 +712,7 @@ struct BlockDriver {
 
     /* removable device specific */
     bool coroutine_fn (*bdrv_co_is_inserted)(BlockDriverState *bs);
-    void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
+    void coroutine_fn (*bdrv_co_eject)(BlockDriverState *bs, bool eject_flag);
     void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index a1eac6c00a..00209625e1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -59,7 +59,9 @@ bool co_wrapper_mixed blk_is_inserted(BlockBackend *blk);
 
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
-void blk_eject(BlockBackend *blk, bool eject_flag);
+
+void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag);
+void co_wrapper blk_eject(BlockBackend *blk, bool eject_flag);
 
 int64_t coroutine_fn blk_co_getlength(BlockBackend *blk);
 int64_t co_wrapper_mixed blk_getlength(BlockBackend *blk);
diff --git a/block.c b/block.c
index 2707069ab6..d8415c9519 100644
--- a/block.c
+++ b/block.c
@@ -6820,13 +6820,13 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
 /**
  * If eject_flag is TRUE, eject the media. Otherwise, close the tray
  */
-void bdrv_eject(BlockDriverState *bs, bool eject_flag)
+void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
 
-    if (drv && drv->bdrv_eject) {
-        drv->bdrv_eject(bs, eject_flag);
+    if (drv && drv->bdrv_co_eject) {
+        drv->bdrv_co_eject(bs, eject_flag);
     }
 }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index fc08400544..7320081814 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2009,14 +2009,14 @@ void blk_lock_medium(BlockBackend *blk, bool locked)
     }
 }
 
-void blk_eject(BlockBackend *blk, bool eject_flag)
+void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag)
 {
     BlockDriverState *bs = blk_bs(blk);
     char *id;
     IO_CODE();
 
     if (bs) {
-        bdrv_eject(bs, eject_flag);
+        bdrv_co_eject(bs, eject_flag);
     }
 
     /* Whether or not we ejected on the backend,
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 41777b87a4..43f09514dc 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -216,9 +216,9 @@ static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
 }
 
 
-static void cor_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn cor_co_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
@@ -257,7 +257,7 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_co_pdiscard                   = cor_co_pdiscard,
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
 
-    .bdrv_eject                         = cor_eject,
+    .bdrv_co_eject                      = cor_co_eject,
     .bdrv_lock_medium                   = cor_lock_medium,
 
     .has_variable_length                = true,
diff --git a/block/file-posix.c b/block/file-posix.c
index f128071231..21f49f9782 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3769,7 +3769,7 @@ static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
     return ret == CDS_DISC_OK;
 }
 
-static void cdrom_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3827,7 +3827,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     /* removable device support */
     .bdrv_co_is_inserted    = cdrom_co_is_inserted,
-    .bdrv_eject         = cdrom_eject,
+    .bdrv_co_eject          = cdrom_co_eject,
     .bdrv_lock_medium   = cdrom_lock_medium,
 
     /* generic scsi device */
@@ -3890,7 +3890,7 @@ static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
     return raw_co_getlength(bs) > 0;
 }
 
-static void cdrom_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3956,7 +3956,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     /* removable device support */
     .bdrv_co_is_inserted     = cdrom_co_is_inserted,
-    .bdrv_eject         = cdrom_eject,
+    .bdrv_co_eject           = cdrom_co_eject,
     .bdrv_lock_medium   = cdrom_lock_medium,
 };
 #endif /* __FreeBSD__ */
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 1515fe5103..97adb3de19 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -116,9 +116,10 @@ static void compress_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 
-static void compress_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn
+compress_co_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
@@ -142,7 +143,7 @@ static BlockDriver bdrv_compress = {
     .bdrv_co_pdiscard                   = compress_co_pdiscard,
     .bdrv_refresh_limits                = compress_refresh_limits,
 
-    .bdrv_eject                         = compress_eject,
+    .bdrv_co_eject                      = compress_co_eject,
     .bdrv_lock_medium                   = compress_lock_medium,
 
     .has_variable_length                = true,
diff --git a/block/raw-format.c b/block/raw-format.c
index 08f5c74838..2585e9ef96 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -404,9 +404,9 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
     return bdrv_co_truncate(bs->file, offset, exact, prealloc, flags, errp);
 }
 
-static void raw_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn raw_co_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 static void raw_lock_medium(BlockDriverState *bs, bool locked)
@@ -630,7 +630,7 @@ BlockDriver bdrv_raw = {
     .bdrv_refresh_limits  = &raw_refresh_limits,
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
-    .bdrv_eject           = &raw_eject,
+    .bdrv_co_eject        = &raw_co_eject,
     .bdrv_lock_medium     = &raw_lock_medium,
     .bdrv_co_ioctl        = &raw_co_ioctl,
     .create_opts          = &raw_create_opts,
-- 
2.38.1


