Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32B67546D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUH-0003El-8h; Fri, 20 Jan 2023 07:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU7-0002t3-OH
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU3-0000O0-FY
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YskayoiZaOulaEvRS+L8Hy+X9nmCPEYpxLHLS3QPfU=;
 b=hMMoJ7E+zheGY30UvXVBEc+FKim1rAivlnvL2XV7ABvvmXEAB3TqSk5mBKnkwQOLNdWOmJ
 0xC28R+F9YMsxmiVkAlfzVg6pLYOs+AEVjt1SBs6DycceBSEfkOuEQviS60DmuVAiiJs4i
 X7axtNMwPpPG8X8a72e/Sct/cVRImns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-26wXfqtfPv60Lyc5lxHqGw-1; Fri, 20 Jan 2023 07:27:01 -0500
X-MC-Unique: 26wXfqtfPv60Lyc5lxHqGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147F6811E6E;
 Fri, 20 Jan 2023 12:27:01 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AAB840C6EC4;
 Fri, 20 Jan 2023 12:27:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 22/38] block: Convert bdrv_eject() to co_wrapper
Date: Fri, 20 Jan 2023 13:26:17 +0100
Message-Id: <20230120122633.84983-23-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Message-Id: <20230113204212.359076-12-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
index 3a01923a0b..f84d2b7238 100644
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
index 907239c267..1092ac26d1 100644
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
index b4a8d259cf..7eaafc85b1 100644
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
index 2d7c2cbdd7..cfa614fea2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3764,7 +3764,7 @@ static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
     return ret == CDS_DISC_OK;
 }
 
-static void cdrom_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3822,7 +3822,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     /* removable device support */
     .bdrv_co_is_inserted    = cdrom_co_is_inserted,
-    .bdrv_eject         = cdrom_eject,
+    .bdrv_co_eject          = cdrom_co_eject,
     .bdrv_lock_medium   = cdrom_lock_medium,
 
     /* generic scsi device */
@@ -3885,7 +3885,7 @@ static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
     return raw_co_getlength(bs) > 0;
 }
 
-static void cdrom_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn cdrom_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -3951,7 +3951,7 @@ static BlockDriver bdrv_host_cdrom = {
 
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


