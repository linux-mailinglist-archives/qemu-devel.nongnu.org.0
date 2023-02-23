Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC06A0FD0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhJ-0006ml-Dn; Thu, 23 Feb 2023 13:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhG-0006lS-Vs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhE-0002v4-HJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFkd+Z22RrEnNXMI5Wod+NzsDY3BkYb9SJg3xZPB1Aw=;
 b=VbGdmWGwwBzZ4JuMecx6Adu/lPDgYp8PalkAzb+p1iwTOyVspv/dZtB42A9SnF3DEzk9ZN
 hYQKpLO6tOSjUo0v25lpyaPJTlkHTudUc6aM+V4gDguZO3cB01n3a+eSm3O427klcPOPsM
 tjMjvF7kJ2Ac3D8tZkPAqwJc2Y4sFAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-a3JWAbUSODWaIDGn3VZthQ-1; Thu, 23 Feb 2023 13:51:56 -0500
X-MC-Unique: a3JWAbUSODWaIDGn3VZthQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6C1280048D;
 Thu, 23 Feb 2023 18:51:56 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A78B1121314;
 Thu, 23 Feb 2023 18:51:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 05/29] block: Mark bdrv_co_ioctl() and callers GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:22 +0100
Message-Id: <20230223185146.306454-6-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_ioctl() need to hold a reader lock for the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-6-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 3 ++-
 include/block/block_int-common.h | 9 +++++----
 block/block-backend.c            | 1 +
 block/io.c                       | 1 +
 block/raw-format.c               | 4 ++--
 5 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 6303501b0f..3f42c76f23 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -97,7 +97,8 @@ void bdrv_aio_cancel(BlockAIOCB *acb);
 void bdrv_aio_cancel_async(BlockAIOCB *acb);
 
 /* sg packet commands */
-int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 5f0104a1af..64700daf38 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -714,11 +714,12 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices */
-    BlockAIOCB *(*bdrv_aio_ioctl)(BlockDriverState *bs,
-        unsigned long int req, void *buf,
+    BlockAIOCB *coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_aio_ioctl)(
+        BlockDriverState *bs, unsigned long int req, void *buf,
         BlockCompletionFunc *cb, void *opaque);
-    int coroutine_fn (*bdrv_co_ioctl)(BlockDriverState *bs,
-                                      unsigned long int req, void *buf);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_ioctl)(
+        BlockDriverState *bs, unsigned long int req, void *buf);
 
     /*
      * Returns 0 for completed check, -errno for internal errors.
diff --git a/block/block-backend.c b/block/block-backend.c
index f5d9e3e269..5c731a1c6c 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1672,6 +1672,7 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
diff --git a/block/io.c b/block/io.c
index a0f8efc9a1..c03233ae94 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3083,6 +3083,7 @@ int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
     };
     BlockAIOCB *acb;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     bdrv_inc_in_flight(bs);
     if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
diff --git a/block/raw-format.c b/block/raw-format.c
index f39e1f502b..202acb1232 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -415,8 +415,8 @@ static void coroutine_fn raw_co_lock_medium(BlockDriverState *bs, bool locked)
     bdrv_co_lock_medium(bs->file->bs, locked);
 }
 
-static int coroutine_fn raw_co_ioctl(BlockDriverState *bs,
-                                     unsigned long int req, void *buf)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 {
     BDRVRawState *s = bs->opaque;
     if (s->offset || s->has_size) {
-- 
2.39.2


