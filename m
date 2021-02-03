Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDC30DCD0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:33:57 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JEC-0007HI-Iy
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J60-0005jH-RE
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5n-0000Ia-Kb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LqlTTJLqWWej5geJxZq0+mUC/xpTfRvfcUtmMrQ1uU=;
 b=FlpNioEqS/rgu3UtYlBDz1M77YSaJOy3dyr/k0TXdi3lzEcIkMMz7fu8ajm/trDpG8gqjP
 Gh3U9mdiPTc5HuowXOWXH39A23mkovfk1WOcr8PGaJzOI4065liClgte03hQ9XSYa+HhCR
 fH4tFYEhWS8Hivm04a0/ZqcC8iSJrOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-hqWpEj3mPhaTX1oQopbOkw-1; Wed, 03 Feb 2021 09:25:11 -0500
X-MC-Unique: hqWpEj3mPhaTX1oQopbOkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA321107ACE8;
 Wed,  3 Feb 2021 14:25:09 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A15819C59;
 Wed,  3 Feb 2021 14:25:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/20] block/io: support int64_t bytes in
 bdrv_aligned_pwritev()
Date: Wed,  3 Feb 2021 08:24:28 -0600
Message-Id: <20210203142436.703098-13-eblake@redhat.com>
In-Reply-To: <20210203142436.703098-1-eblake@redhat.com>
References: <20210203142436.703098-1-eblake@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_aligned_pwritev() now and convert the dependencies:
bdrv_co_write_req_prepare() and bdrv_co_write_req_finish() to signed
type bytes.

Conversion of bdrv_co_write_req_prepare() and
bdrv_co_write_req_finish() is definitely safe, as all requests in
block/io must not overflow BDRV_MAX_LENGTH. Still add assertions.

For bdrv_aligned_pwritev() 'bytes' type is widened, so callers are
safe. Let's check usage of the parameter inside the function.

Passing to bdrv_co_write_req_prepare() and bdrv_co_write_req_finish()
is OK.

Passing to qemu_iovec_* is OK after new assertion. All other callees
are already updated to int64_t.

Checking alignment is not changed, offset + bytes and qiov_offset +
bytes calculations are safe (thanks to new assertions).

max_transfer is kept to be int for now. It has a default of INT_MAX
here, and some drivers may rely on it. It's to be refactored later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-12-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/block/io.c b/block/io.c
index 98d9f5bdf48a..59ae0a110da1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1932,11 +1932,12 @@ fail:
 }

 static inline int coroutine_fn
-bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
+bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
                           BdrvTrackedRequest *req, int flags)
 {
     BlockDriverState *bs = child->bs;
-    int64_t end_sector = DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE);
+
+    bdrv_check_request(offset, bytes, &error_abort);

     if (bs->read_only) {
         return -EPERM;
@@ -1963,7 +1964,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,

     assert(req->overlap_offset <= offset);
     assert(offset + bytes <= req->overlap_offset + req->overlap_bytes);
-    assert(end_sector <= bs->total_sectors || child->perm & BLK_PERM_RESIZE);
+    assert(offset + bytes <= bs->total_sectors * BDRV_SECTOR_SIZE ||
+           child->perm & BLK_PERM_RESIZE);

     switch (req->type) {
     case BDRV_TRACKED_WRITE:
@@ -1984,12 +1986,14 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
 }

 static inline void coroutine_fn
-bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, uint64_t bytes,
+bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
                          BdrvTrackedRequest *req, int ret)
 {
     int64_t end_sector = DIV_ROUND_UP(offset + bytes, BDRV_SECTOR_SIZE);
     BlockDriverState *bs = child->bs;

+    bdrv_check_request(offset, bytes, &error_abort);
+
     qatomic_inc(&bs->write_gen);

     /*
@@ -2026,16 +2030,18 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, uint64_t bytes,
  * after possibly fragmenting it.
  */
 static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, unsigned int bytes,
+    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
     int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
     BlockDriver *drv = bs->drv;
     int ret;

-    uint64_t bytes_remaining = bytes;
+    int64_t bytes_remaining = bytes;
     int max_transfer;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -2047,7 +2053,6 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     assert(is_power_of_2(align));
     assert((offset & (align - 1)) == 0);
     assert((bytes & (align - 1)) == 0);
-    assert(!qiov || qiov_offset + bytes <= qiov->size);
     max_transfer = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_transfer, INT_MAX),
                                    align);

@@ -2146,7 +2151,7 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
     assert(!bytes || (offset & (align - 1)) == 0);
     if (bytes >= align) {
         /* Write the aligned part in the middle. */
-        uint64_t aligned_bytes = bytes & ~(align - 1);
+        int64_t aligned_bytes = bytes & ~(align - 1);
         ret = bdrv_aligned_pwritev(child, req, offset, aligned_bytes, align,
                                    NULL, 0, flags);
         if (ret < 0) {
-- 
2.30.0


