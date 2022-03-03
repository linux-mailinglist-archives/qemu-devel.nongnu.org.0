Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE24CC1A7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:40:45 +0100 (CET)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnZK-00022n-S8
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEP-0007JA-Qu
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEM-0006g0-GN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqVFzmq0ZHC+pp0JQEY8Wj7IJxjIXqANLTddneIUflk=;
 b=Qolr4t4ftZRHrlSWcc4hvuirRiH9lc+xbCL7Y0/VMS464TOdmbQl68KpTYv4sT58JpZH5d
 RXlTavyXdrjdDSlvsd2T+R6cyFKE3QQvlD7vXALu4uQj7rgASxE+NEh4Kbsx8lPJL/7JiO
 4enDM9pQ+69IHBW73PEpzzJ0fNBmxXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-EOGZMVlyOK6KLg2j2jyAvw-1; Thu, 03 Mar 2022 10:19:00 -0500
X-MC-Unique: EOGZMVlyOK6KLg2j2jyAvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74998801AAD;
 Thu,  3 Mar 2022 15:18:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 380917C030;
 Thu,  3 Mar 2022 15:18:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 24/31] block/coroutines: I/O and "I/O or GS" API
Date: Thu,  3 Mar 2022 10:16:09 -0500
Message-Id: <20220303151616.325444-25-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block coroutines functions run in different aiocontext, and are
not protected by the BQL. Therefore are I/O.

On the other side, generated_co_wrapper functions use BDRV_POLL_WHILE,
meaning the caller can either be the main loop or a specific iothread.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               |  2 ++
 block/block-backend.c |  6 ++++
 block/coroutines.h    | 81 +++++++++++++++++++++++++++----------------
 block/io.c            |  3 ++
 block/nbd.c           |  1 +
 5 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index 7224053f8b..4a3447b2a0 100644
--- a/block.c
+++ b/block.c
@@ -5454,6 +5454,7 @@ fail:
 int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix)
 {
+    IO_CODE();
     if (bs->drv == NULL) {
         return -ENOMEDIUM;
     }
@@ -6663,6 +6664,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     Error *local_err = NULL;
+    IO_CODE();
 
     assert(!(bs->open_flags & BDRV_O_INACTIVE));
 
diff --git a/block/block-backend.c b/block/block-backend.c
index bf77c4a8fa..e0e1aff4b1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1290,6 +1290,7 @@ blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
 {
     int ret;
     BlockDriverState *bs;
+    IO_CODE();
 
     blk_wait_while_drained(blk);
 
@@ -1337,6 +1338,7 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
 {
     int ret;
     BlockDriverState *bs;
+    IO_CODE();
 
     blk_wait_while_drained(blk);
 
@@ -1656,6 +1658,8 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
+    IO_CODE();
+
     blk_wait_while_drained(blk);
 
     if (!blk_is_available(blk)) {
@@ -1699,6 +1703,7 @@ int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
+    IO_CODE();
 
     blk_wait_while_drained(blk);
 
@@ -1757,6 +1762,7 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
+    IO_CODE();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
diff --git a/block/coroutines.h b/block/coroutines.h
index c8c14a29c8..b293e943c8 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -30,17 +30,17 @@
 /* For blk_bs() in generated block/block-gen.c */
 #include "sysemu/block-backend.h"
 
+/*
+ * I/O API functions. These functions are thread-safe.
+ *
+ * See include/block/block-io.h for more information about
+ * the I/O API.
+ */
+
 int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix);
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
 
-int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
-            QEMUIOVector *qiov, BdrvRequestFlags flags);
-int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
-             QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int coroutine_fn
 bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   BlockDriverState *base,
@@ -52,6 +52,51 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   int64_t *map,
                                   BlockDriverState **file,
                                   int *depth);
+
+int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
+                                       QEMUIOVector *qiov, int64_t pos);
+int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
+                                        QEMUIOVector *qiov, int64_t pos);
+
+int coroutine_fn
+nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
+
+
+int coroutine_fn
+blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags);
+
+
+int coroutine_fn
+blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset,
+                       BdrvRequestFlags flags);
+
+int coroutine_fn
+blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+
+int coroutine_fn
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+
+int coroutine_fn blk_co_do_flush(BlockBackend *blk);
+
+
+/*
+ * "I/O or GS" API functions. These functions can run without
+ * the BQL, but only in one specific iothread/main loop.
+ *
+ * See include/block/block-io.h for more information about
+ * the "I/O or GS" API.
+ */
+
+int generated_co_wrapper
+bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
+            QEMUIOVector *qiov, BdrvRequestFlags flags);
+
+int generated_co_wrapper
+bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
+             QEMUIOVector *qiov, BdrvRequestFlags flags);
+
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
@@ -63,46 +108,24 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                int64_t *map,
                                BlockDriverState **file,
                                int *depth);
-
-int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
-                                       QEMUIOVector *qiov, int64_t pos);
-int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
-                                        QEMUIOVector *qiov, int64_t pos);
-
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
-int coroutine_fn
-nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
-
 
 int generated_co_wrapper
 blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
               QEMUIOVector *qiov, BdrvRequestFlags flags);
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 
 int generated_co_wrapper
 blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
                     BdrvRequestFlags flags);
-int coroutine_fn
-blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                       QEMUIOVector *qiov, size_t qiov_offset,
-                       BdrvRequestFlags flags);
 
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-int coroutine_fn
-blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
 int generated_co_wrapper
 blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
-int coroutine_fn blk_co_do_flush(BlockBackend *blk);
 
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/io.c b/block/io.c
index 6a0bad10a3..4b1d97c7da 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2678,6 +2678,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     BlockDriverState *p;
     int64_t eof = 0;
     int dummy;
+    IO_CODE();
 
     assert(!include_base || base); /* Can't include NULL base */
 
@@ -2867,6 +2868,7 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
+    IO_CODE();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
@@ -2898,6 +2900,7 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
+    IO_CODE();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
diff --git a/block/nbd.c b/block/nbd.c
index 5853d85d60..146d25660e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -313,6 +313,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
     bool blocking = nbd_client_connecting_wait(s);
+    IO_CODE();
 
     assert(!s->ioc);
 
-- 
2.31.1


