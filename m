Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664664B196
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p513B-0006We-QN; Tue, 13 Dec 2022 03:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5139-0006WK-0b
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5136-00033A-5K
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1MyXY1A7pp7cXRZYDLe74ELqzddIS8QBrGppTpmCno=;
 b=HqdQbslJZvQG9YLyJ5elR4QG4vCCjZsspDzkCt/BgWv58KlPKdzLJ3mI45PTwFLb8Lenme
 b2/Ma/U9q34oTtpn9L4SyBmphLAvAg0+1MM4mlRg15U+3NPl3LlL7EbyAn7yUhQ7xE3TEr
 ckkgQmj/zh6vKY5Kpptwsbty4HTlq64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-IdxvcOJLP56Jt0Y56KNqWA-1; Tue, 13 Dec 2022 03:53:46 -0500
X-MC-Unique: IdxvcOJLP56Jt0Y56KNqWA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9E2A801231;
 Tue, 13 Dec 2022 08:53:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7CA492C18;
 Tue, 13 Dec 2022 08:53:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 11/14] block: Convert bdrv_eject() to co_wrapper
Date: Tue, 13 Dec 2022 09:53:17 +0100
Message-Id: <20221213085320.95673-12-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=kwolf@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
 block.c                           | 2 +-
 block/block-backend.c             | 4 ++--
 block/copy-on-read.c              | 2 +-
 block/filter-compress.c           | 2 +-
 block/raw-format.c                | 2 +-
 8 files changed, 12 insertions(+), 9 deletions(-)

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
index b954b3cb36..fd31b37567 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -711,7 +711,7 @@ struct BlockDriver {
 
     /* removable device specific */
     bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
-    void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
+    void coroutine_fn (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
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
index a7b9da6a7e..11647e49db 100644
--- a/block.c
+++ b/block.c
@@ -6820,7 +6820,7 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
 /**
  * If eject_flag is TRUE, eject the media. Otherwise, close the tray
  */
-void bdrv_eject(BlockDriverState *bs, bool eject_flag)
+void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index e4b54f7b0c..233ce6d05a 100644
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
index 74f7727a02..76f884a6ae 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -218,7 +218,7 @@ static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
 
 static void cor_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 305716c86c..571e4684dd 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -118,7 +118,7 @@ static void compress_refresh_limits(BlockDriverState *bs, Error **errp)
 
 static void compress_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
diff --git a/block/raw-format.c b/block/raw-format.c
index 39a2f20df1..efe1ef0265 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -405,7 +405,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
 
 static void raw_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 static void raw_lock_medium(BlockDriverState *bs, bool locked)
-- 
2.38.1


