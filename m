Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2642FD68
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:28:13 +0200 (CEST)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUkO-0003Ra-FC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTQ-0007gK-4e
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTE-0000if-Nw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBT9uB3qbPJkUocElNEeP64tz+p/4K62VVgzBaQzizk=;
 b=VseAcIEq1bzxqeFjYAOaqN0Wp0T1iGCayuUHvGGA8MKZRtZ0sPV2DfJWu3zXv2xpl0RI/E
 9r77XylPRFTuWN/zQXZQUBo+gfxt8PTq6Sm2R4/Y5hffazY9sZeJB1eUAGFAwNJfCQ7Ana
 cpR/mvBxLoX7lwH3L2QAbpUqetm85Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Fr5c025qN8K7yEG7KwnqEg-1; Fri, 15 Oct 2021 17:10:23 -0400
X-MC-Unique: Fr5c025qN8K7yEG7KwnqEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AFF8801AFC;
 Fri, 15 Oct 2021 21:10:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1F0F1973B;
 Fri, 15 Oct 2021 21:10:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] block-backend: convert blk_aio_ functions to int64_t
 bytes paramter
Date: Fri, 15 Oct 2021 16:10:06 -0500
Message-Id: <20211015211011.1272011-12-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

1. Convert bytes in BlkAioEmAIOCB:
  aio->bytes is only passed to already int64_t interfaces, and set in
  blk_aio_prwv, which is updated here.

2. For all updated functions the parameter type becomes wider so callers
   are safe.

3. In blk_aio_prwv we only store bytes to BlkAioEmAIOCB, which is
   updated here.

4. Other updated functions are wrappers on blk_aio_prwv.

Note that blk_aio_preadv and blk_aio_pwritev become safer: before this
commit, it's theoretically possible to pass qiov with size exceeding
INT_MAX, which than converted to int argument of blk_aio_prwv. Now it's
converted to int64_t which is a lot better. Still add assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-11-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: tweak assertion and grammar]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h |  4 ++--
 block/block-backend.c          | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ccf9f1a8025..b5409a6b4553 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -157,7 +157,7 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int bytes, BdrvRequestFlags flags,
+                                  int64_t bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque);
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
 int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
@@ -174,7 +174,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_flush(BlockBackend *blk,
                           BlockCompletionFunc *cb, void *opaque);
-BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int bytes,
+BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel(BlockAIOCB *acb);
 void blk_aio_cancel_async(BlockAIOCB *acb);
diff --git a/block/block-backend.c b/block/block-backend.c
index 0746be89842b..c889d0f97c45 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1380,7 +1380,7 @@ BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
 typedef struct BlkAioEmAIOCB {
     BlockAIOCB common;
     BlkRwCo rwco;
-    int bytes;
+    int64_t bytes;
     bool has_returned;
 } BlkAioEmAIOCB;

@@ -1412,7 +1412,8 @@ static void blk_aio_complete_bh(void *opaque)
     blk_aio_complete(acb);
 }

-static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset, int bytes,
+static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
+                                int64_t bytes,
                                 void *iobuf, CoroutineEntry co_entry,
                                 BdrvRequestFlags flags,
                                 BlockCompletionFunc *cb, void *opaque)
@@ -1469,10 +1470,10 @@ static void blk_aio_write_entry(void *opaque)
 }

 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int count, BdrvRequestFlags flags,
+                                  int64_t bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
-    return blk_aio_prwv(blk, offset, count, NULL, blk_aio_write_entry,
+    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_write_entry,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }

@@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
                            QEMUIOVector *qiov, BdrvRequestFlags flags,
                            BlockCompletionFunc *cb, void *opaque)
 {
+    assert((uint64_t)qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_read_entry, flags, cb, opaque);
 }
@@ -1538,6 +1540,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             QEMUIOVector *qiov, BdrvRequestFlags flags,
                             BlockCompletionFunc *cb, void *opaque)
 {
+    assert(qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_write_entry, flags, cb, opaque);
 }
@@ -1618,7 +1621,7 @@ static void blk_aio_pdiscard_entry(void *opaque)
 }

 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
-                             int64_t offset, int bytes,
+                             int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque)
 {
     return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, 0,
-- 
2.31.1


