Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374542FD53
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:19:09 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUbc-0003ka-CO
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTK-0007Vf-Ns
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUT8-0000cQ-Hb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXNTvRJafgB5YljR3MZgj7Gw8cq0aduwnj5wNIeMato=;
 b=KyU+xkJWZHNpSmlq463UA48Xl4kWwD7Hh6rbztY0pWdVq7TyzSCs6JB+yrbLbWfwjJQV6Z
 KFxDq8jpQvjXPutE6UNWj4aAUnMePyhBz/0rE0L4Uxo3yIdanmWtTcnW4x89724SwQSiZ1
 vgN7prfX6FJKwf5hpIgGhVDnknycUcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-KIL7VKp7MneA-PBXBryokw-1; Fri, 15 Oct 2021 17:10:18 -0400
X-MC-Unique: KIL7VKp7MneA-PBXBryokw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792DD10A8E00;
 Fri, 15 Oct 2021 21:10:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DF4D1973B;
 Fri, 15 Oct 2021 21:10:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] block-backend: convert blk_co_pwritev_part to int64_t
 bytes
Date: Fri, 15 Oct 2021 16:09:59 -0500
Message-Id: <20211015211011.1272011-5-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We convert blk_do_pwritev_part() and some wrappers:
blk_co_pwritev_part(), blk_co_pwritev(), blk_co_pwrite_zeroes().

All functions are converted so that the parameter type becomes wider, so
all callers should be OK with it.

Look at blk_do_pwritev_part() body:
bytes is passed to:

 - trace_blk_co_pwritev (we update it here)
 - blk_check_byte_request, throttle_group_co_io_limits_intercept,
   bdrv_co_pwritev_part - all already have int64_t argument.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-4-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweaks]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h | 6 +++---
 block/block-backend.c          | 8 ++++----
 block/trace-events             | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 442fd705bb78..91457a081ec1 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -129,11 +129,11 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     unsigned int bytes,
+                                     int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                               unsigned int bytes, QEMUIOVector *qiov,
+                               int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);

 static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
@@ -243,7 +243,7 @@ int blk_get_open_flags_from_root_state(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
                   BlockCompletionFunc *cb, void *opaque);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int bytes, BdrvRequestFlags flags);
+                                      int64_t bytes, BdrvRequestFlags flags);
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
                           int bytes);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/block/block-backend.c b/block/block-backend.c
index 3199f84e96d9..105f0afff970 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1250,7 +1250,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, unsigned int bytes,
+blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
                     BdrvRequestFlags flags)
 {
@@ -1286,7 +1286,7 @@ blk_do_pwritev_part(BlockBackend *blk, int64_t offset, unsigned int bytes,
 }

 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     unsigned int bytes,
+                                     int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags)
 {
@@ -1300,7 +1300,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
 }

 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                                unsigned int bytes, QEMUIOVector *qiov,
+                                int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags)
 {
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
@@ -2214,7 +2214,7 @@ void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
 }

 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int bytes, BdrvRequestFlags flags)
+                                      int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_co_pwritev(blk, offset, bytes, NULL,
                           flags | BDRV_REQ_ZERO_WRITE);
diff --git a/block/trace-events b/block/trace-events
index ff397ffff485..ab56edacb4fc 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -6,7 +6,7 @@ bdrv_lock_medium(void *bs, bool locked) "bs %p locked %d"

 # block-backend.c
 blk_co_preadv(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
-blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
+blk_co_pwritev(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"

-- 
2.31.1


