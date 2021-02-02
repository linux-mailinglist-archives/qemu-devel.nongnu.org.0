Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19C30CF7F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:59:55 +0100 (CET)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74eI-0000Iz-7p
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qy-0007jD-Oj
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qj-0005z9-4R
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTxZWc8baHZKOGq/Rh7O1LTMPxE181aZwWtqhMtNLdM=;
 b=V1hqC9td8KW7gJvqpj7ABt3A26qi5AB3ZTa9h3VA98IXer7mu2Pozn9liDjUbuF96jpFd1
 65SXz+TH1nkzxWo9pcd4UAEJFqeQHrFQaW8LCbgdaGKn5dEQLORuERTghBXkhrYC7BV/3o
 Gn3gDpIYi1jmWMvZETqDSwR8XAKPjj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-P-vmgoNjO3eiQMoY9n1AFw-1; Tue, 02 Feb 2021 17:45:49 -0500
X-MC-Unique: P-vmgoNjO3eiQMoY9n1AFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2355191;
 Tue,  2 Feb 2021 22:45:48 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1AB710016F5;
 Tue,  2 Feb 2021 22:45:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] block/io: use int64_t bytes in copy_range
Date: Tue,  2 Feb 2021 16:45:26 -0600
Message-Id: <20210202224529.642055-18-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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

So, convert now copy_range parameters which are already 64bit to signed
type.

It's safe as we don't work with requests overflowing BDRV_MAX_LENGTH
(which is less than INT64_MAX), and do check the requests in
bdrv_co_copy_range_internal() (by bdrv_check_request32(), which calls
bdrv_check_request()).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-17-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block.h     |  6 +++---
 include/block/block_int.h | 12 ++++++------
 block/io.c                | 22 +++++++++++-----------
 block/trace-events        |  4 ++--
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 5f28d0d33f5c..0a9f2c187cdb 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -845,8 +845,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host);
  *
  * Returns: 0 if succeeded; negative error code if failed.
  **/
-int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
-                                    BdrvChild *dst, uint64_t dst_offset,
-                                    uint64_t bytes, BdrvRequestFlags read_flags,
+int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
+                                    BdrvChild *dst, int64_t dst_offset,
+                                    int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
 #endif
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 749d1fb9d049..22a2789d3516 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1357,14 +1357,14 @@ void bdrv_dec_in_flight(BlockDriverState *bs);

 void blockdev_close_all_bdrv_states(void);

-int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
-                                         BdrvChild *dst, uint64_t dst_offset,
-                                         uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
+                                         BdrvChild *dst, int64_t dst_offset,
+                                         int64_t bytes,
                                          BdrvRequestFlags read_flags,
                                          BdrvRequestFlags write_flags);
-int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
-                                       BdrvChild *dst, uint64_t dst_offset,
-                                       uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
+                                       BdrvChild *dst, int64_t dst_offset,
+                                       int64_t bytes,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags);

diff --git a/block/io.c b/block/io.c
index 8817c8496663..b0435ed6707c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3201,8 +3201,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host)
 }

 static int coroutine_fn bdrv_co_copy_range_internal(
-        BdrvChild *src, uint64_t src_offset, BdrvChild *dst,
-        uint64_t dst_offset, uint64_t bytes,
+        BdrvChild *src, int64_t src_offset, BdrvChild *dst,
+        int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags,
         bool recurse_src)
 {
@@ -3280,9 +3280,9 @@ static int coroutine_fn bdrv_co_copy_range_internal(
  *
  * See the comment of bdrv_co_copy_range for the parameter and return value
  * semantics. */
-int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
-                                         BdrvChild *dst, uint64_t dst_offset,
-                                         uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
+                                         BdrvChild *dst, int64_t dst_offset,
+                                         int64_t bytes,
                                          BdrvRequestFlags read_flags,
                                          BdrvRequestFlags write_flags)
 {
@@ -3296,9 +3296,9 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
  *
  * See the comment of bdrv_co_copy_range for the parameter and return value
  * semantics. */
-int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
-                                       BdrvChild *dst, uint64_t dst_offset,
-                                       uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
+                                       BdrvChild *dst, int64_t dst_offset,
+                                       int64_t bytes,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags)
 {
@@ -3308,9 +3308,9 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
                                        bytes, read_flags, write_flags, false);
 }

-int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
-                                    BdrvChild *dst, uint64_t dst_offset,
-                                    uint64_t bytes, BdrvRequestFlags read_flags,
+int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
+                                    BdrvChild *dst, int64_t dst_offset,
+                                    int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_from(src, src_offset,
diff --git a/block/trace-events b/block/trace-events
index a8d3fe94e66d..1a12d634e2e3 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -15,8 +15,8 @@ bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags)
 bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int64_t bytes, int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
-bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
+bdrv_co_copy_range_from(void *src, int64_t src_offset, void *dst, int64_t dst_offset, int64_t bytes, int read_flags, int write_flags) "src %p offset %" PRId64 " dst %p offset %" PRId64 " bytes %" PRId64 " rw flags 0x%x 0x%x"
+bdrv_co_copy_range_to(void *src, int64_t src_offset, void *dst, int64_t dst_offset, int64_t bytes, int read_flags, int write_flags) "src %p offset %" PRId64 " dst %p offset %" PRId64 " bytes %" PRId64 " rw flags 0x%x 0x%x"

 # stream.c
 stream_one_iteration(void *s, int64_t offset, uint64_t bytes, int is_allocated) "s %p offset %" PRId64 " bytes %" PRIu64 " is_allocated %d"
-- 
2.30.0


