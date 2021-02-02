Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447830CF90
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:03:00 +0100 (CET)
Received: from localhost ([::1]:60976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74hH-0002R4-CB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qy-0007jY-Tu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qj-0005za-53
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttmJMKkubjAG2HSgdFPyBz0FScO3J80o4ZpOhaIhSIQ=;
 b=Csgc2X3Fu4po99Z1N4eLukA8TqiePbUguCImApE1sOtV5AGJj0kJjq1KPCTQ8CHJJTht9a
 kJ3Q17r2NZ3/q66hmpymyB6sE0cHXKtyVI2SuObvGFwHddnusOZB2GwXMuQ1+XsI5ERVYo
 g1bspqb1LPMhA/wJvTQLPzG3FVu24dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542--lo3kyuUM5aCh9CP-MRRyg-1; Tue, 02 Feb 2021 17:45:48 -0500
X-MC-Unique: -lo3kyuUM5aCh9CP-MRRyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB3DE107ACE4;
 Tue,  2 Feb 2021 22:45:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA1A10016F5;
 Tue,  2 Feb 2021 22:45:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] block/io: support int64_t bytes in bdrv_co_p{read,
 write}v_part()
Date: Tue,  2 Feb 2021 16:45:24 -0600
Message-Id: <20210202224529.642055-16-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

So, prepare bdrv_co_preadv_part() and bdrv_co_pwritev_part() and their
remaining dependencies now.

bdrv_pad_request() is updated simultaneously, as pointer to bytes passed
to it both from bdrv_co_pwritev_part() and bdrv_co_preadv_part().

So, all callers of bdrv_pad_request() are updated to pass 64bit bytes.
bdrv_pad_request() is already good for 64bit requests, add
corresponding assertion.

Look at bdrv_co_preadv_part() and bdrv_co_pwritev_part().
Type is widening, so callers are safe. Let's look inside the functions.

In bdrv_co_preadv_part() and bdrv_aligned_pwritev() we only pass bytes
to other already int64_t interfaces (and some obviously safe
calculations), it's OK.

In bdrv_co_do_zero_pwritev() aligned_bytes may become large now, still
it's passed to bdrv_aligned_pwritev which supports int64_t bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-15-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  4 ++--
 block/io.c                | 14 ++++++++------
 block/trace-events        |  4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 7f41f0990cc0..f2ad8aa771c3 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1035,13 +1035,13 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);

 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
diff --git a/block/io.c b/block/io.c
index cef284e3a189..7b6b0027bc4c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1725,11 +1725,13 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
  */
 static int bdrv_pad_request(BlockDriverState *bs,
                             QEMUIOVector **qiov, size_t *qiov_offset,
-                            int64_t *offset, unsigned int *bytes,
+                            int64_t *offset, int64_t *bytes,
                             BdrvRequestPadding *pad, bool *padded)
 {
     int ret;

+    bdrv_check_qiov_request(*offset, *bytes, *qiov, *qiov_offset, &error_abort);
+
     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
         if (padded) {
             *padded = false;
@@ -1764,7 +1766,7 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
 }

 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset,
     BdrvRequestFlags flags)
 {
@@ -1773,7 +1775,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     BdrvRequestPadding pad;
     int ret;

-    trace_bdrv_co_preadv(bs, offset, bytes, flags);
+    trace_bdrv_co_preadv_part(bs, offset, bytes, flags);

     if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
@@ -2117,7 +2119,7 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,

 static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
                                                 int64_t offset,
-                                                unsigned int bytes,
+                                                int64_t bytes,
                                                 BdrvRequestFlags flags,
                                                 BdrvTrackedRequest *req)
 {
@@ -2191,7 +2193,7 @@ int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
 }

 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov, size_t qiov_offset,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
     BdrvRequestFlags flags)
 {
     BlockDriverState *bs = child->bs;
@@ -2201,7 +2203,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     int ret;
     bool padded = false;

-    trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
+    trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);

     if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
diff --git a/block/trace-events b/block/trace-events
index 82b5dd7cb619..b252457d8e1a 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -11,8 +11,8 @@ blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"

 # io.c
-bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
-bdrv_co_pwritev(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
+bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
+bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-- 
2.30.0


