Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E862C09C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ57-0001GK-Q6; Wed, 16 Nov 2022 09:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4z-0000uE-EB
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4s-0006BK-R5
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1Mhe59cZBIrC6wBos2WnPNqvOkMJGGwmExzv0mvbrI=;
 b=X5958vpjEfLLnitAtBdSVgsUZ9RLe+F5KP+IhTwHRQg9UQ/w5j4t3GzXDAzK8BDUXtGrDu
 xepTeq3K78aIu6QSAPdCBSzV0GnM00FyxH6kbu8H2Q/HpSbN54AmuOK/AQp82+Mg3Ed8Pb
 6h0FabDPuJ/irAkZBpfyp6qEViXYR6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-mMQNCoqFN_GL4JdnT91jOw-1; Wed, 16 Nov 2022 09:07:41 -0500
X-MC-Unique: mMQNCoqFN_GL4JdnT91jOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3DD48582B9;
 Wed, 16 Nov 2022 14:07:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D319C2C7D9;
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
Subject: [PATCH 10/15] block: convert bdrv_eject in generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 09:07:25 -0500
Message-Id: <20221116140730.3056048-11-eesposit@redhat.com>
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

BlockDriver->bdrv_eject is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

The only caller of this function is blk_eject, therefore
make blk_eject a generated_co_wrapper_simple, so that
it always creates a new coroutine, and then make bdrv_eject
coroutine_fn.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                           | 3 ++-
 block/block-backend.c             | 5 +++--
 block/copy-on-read.c              | 2 +-
 block/filter-compress.c           | 2 +-
 block/raw-format.c                | 2 +-
 include/block/block-io.h          | 3 ++-
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 8 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 4205735308..ffbb8c602f 100644
--- a/block.c
+++ b/block.c
@@ -6802,10 +6802,11 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
 /**
  * If eject_flag is TRUE, eject the media. Otherwise, close the tray
  */
-void bdrv_eject(BlockDriverState *bs, bool eject_flag)
+void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (drv && drv->bdrv_eject) {
         drv->bdrv_eject(bs, eject_flag);
diff --git a/block/block-backend.c b/block/block-backend.c
index 9a500fdde3..308dd2070a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2019,14 +2019,15 @@ void blk_lock_medium(BlockBackend *blk, bool locked)
     }
 }
 
-void blk_eject(BlockBackend *blk, bool eject_flag)
+void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag)
 {
     BlockDriverState *bs = blk_bs(blk);
     char *id;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
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
index 4773bf9cda..9b23cf17bb 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -405,7 +405,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
 
 static void raw_eject(BlockDriverState *bs, bool eject_flag)
 {
-    bdrv_eject(bs->file->bs, eject_flag);
+    bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 static void raw_lock_medium(BlockDriverState *bs, bool locked)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 3432e6ad3e..204adeb701 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -125,7 +125,8 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
 bool generated_co_wrapper_simple bdrv_is_inserted(BlockDriverState *bs);
 
 void bdrv_lock_medium(BlockDriverState *bs, bool locked);
-void bdrv_eject(BlockDriverState *bs, bool eject_flag);
+void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
+
 const char *bdrv_get_format_name(BlockDriverState *bs);
 
 bool bdrv_supports_compressed_writes(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4cad48b2ad..d01b3d44f5 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -761,7 +761,7 @@ struct BlockDriver {
 
     /* removable device specific. Called with graph rdlock held. */
     bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
-    void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
+    void coroutine_fn (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
     void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices. Called with graph rdlock taken. */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index bf88f7699e..cc706c03d8 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -59,7 +59,9 @@ bool generated_co_wrapper blk_is_inserted(BlockBackend *blk);
 
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
-void blk_eject(BlockBackend *blk, bool eject_flag);
+
+void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag);
+void generated_co_wrapper_simple blk_eject(BlockBackend *blk, bool eject_flag);
 
 int64_t coroutine_fn blk_co_getlength(BlockBackend *blk);
 int64_t generated_co_wrapper_blk blk_getlength(BlockBackend *blk);
-- 
2.31.1


