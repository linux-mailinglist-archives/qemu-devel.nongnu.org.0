Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4840E42FD5C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:21:57 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUeK-0001Gw-Ar
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTO-0007aN-AI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTE-0000hR-NR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mbrlpaxa+fsepZP8Sd2ad1SK8hBiQxNFeMbrGNsih8o=;
 b=hD8FwiQA8E06ZPM4PmpwHXadf03o9kaeNH20oc0pgV2avLwFI3oRpf5di4gLB2fv971aZV
 CZOfm6GJ96gtgwLW/sPvxnL3/4spJlzc846Xh41nH7ic1k8pBE4BnJOTnJAs7JgDnYmObE
 FovzDUGwR9pgvYD/PYwLRfjWn7YGqDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-cHl2a-6EMf-pQTKWrihC9A-1; Fri, 15 Oct 2021 17:10:21 -0400
X-MC-Unique: cHl2a-6EMf-pQTKWrihC9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D694310A8E04;
 Fri, 15 Oct 2021 21:10:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C62E19739;
 Fri, 15 Oct 2021 21:10:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] block-backend: convert blk_foo wrappers to use int64_t
 bytes parameter
Date: Fri, 15 Oct 2021 16:10:04 -0500
Message-Id: <20211015211011.1272011-10-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Convert blk_pdiscard, blk_pwrite_compressed, blk_pwrite_zeroes.
These are just wrappers for functions with int64_t argument, so allow
passing int64_t as well. Parameter type becomes wider so all callers
should be OK with it.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Note also that we don't (and are not going to) convert blk_pwrite and
blk_pread: these functions return number of bytes on success, so to
update them, we should change return type to int64_t as well, which
will lead to investigating and updating all callers which is too much.

So, blk_pread and blk_pwrite remain unchanged.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-9-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweaks]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h |  6 +++---
 block/block-backend.c          | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 3efa0256395f..3294d1b07a33 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -155,7 +155,7 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
 }

 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int bytes, BdrvRequestFlags flags);
+                      int64_t bytes, BdrvRequestFlags flags);
 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                   int bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque);
@@ -246,10 +246,10 @@ void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int bytes);
+                          int64_t bytes);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size);
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
diff --git a/block/block-backend.c b/block/block-backend.c
index 2e6ccce7ef2d..ee20ae5f0f28 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1330,7 +1330,7 @@ typedef struct BlkRwCo {
 } BlkRwCo;

 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int bytes, BdrvRequestFlags flags)
+                      int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_pwritev_part(blk, offset, bytes, NULL, 0,
                             flags | BDRV_REQ_ZERO_WRITE);
@@ -1637,7 +1637,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }

-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;

@@ -2186,10 +2186,10 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 }

 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int count)
+                          int64_t bytes)
 {
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
-    return blk_pwritev_part(blk, offset, count, &qiov, 0,
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
                             BDRV_REQ_WRITE_COMPRESSED);
 }

-- 
2.31.1


