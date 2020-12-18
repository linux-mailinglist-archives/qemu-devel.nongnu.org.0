Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA542DE66B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:21:56 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHZr-0002v2-T2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRj-0002LK-LA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRU-0005Kr-Op
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIRyURj/PxrjA5uLEl5KoZWL4j+HjoCqB151bcjtbWE=;
 b=MR5XdjWc8FazzJJKO//wif4fK92Goo9izmkjGyRgOxI0kqR0hH5by+rxrU2XAVKjOViPSz
 ZQ9d4rAd+DUOYRLPYvjoPJ3M2jeQfc0AZ/3SxwCT6r9xurScHiEZ8BxHA9/xP8nKXfNmv7
 /+yO7/97J0+nhWXDBO5Tt0KZRjt1kIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-QgsQfkVGMjeCoaa2i44S1w-1; Fri, 18 Dec 2020 10:13:13 -0500
X-MC-Unique: QgsQfkVGMjeCoaa2i44S1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7AD8107ACE3;
 Fri, 18 Dec 2020 15:13:12 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A87B5D9E4;
 Fri, 18 Dec 2020 15:13:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/30] block: bdrv_mark_request_serialising: split non-waiting
 function
Date: Fri, 18 Dec 2020 16:12:28 +0100
Message-Id: <20201218151249.715731-10-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We'll need a separate function, which will only "mark" request
serialising with specified align but not wait for conflicting
requests. So, it will be like old bdrv_mark_request_serialising(),
before merging bdrv_wait_serialising_requests_locked() into it.

To reduce the possible mess, let's do the following:

Public function that does both marking and waiting will be called
bdrv_make_request_serialising, and private function which will only
"mark" will be called tracked_request_set_serialising().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201021145859.11201-6-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  3 ++-
 block/file-posix.c        |  2 +-
 block/io.c                | 35 +++++++++++++++++++++++------------
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 1eeafc118c..b9ef61fe4d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1060,7 +1060,8 @@ extern unsigned int bdrv_drain_all_count;
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent);
 void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent);
 
-bool coroutine_fn bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align);
+bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
+                                                uint64_t align);
 BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs);
 
 int get_tmp_filename(char *filename, int size);
diff --git a/block/file-posix.c b/block/file-posix.c
index 9804681d5c..00cdaaa2d4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2953,7 +2953,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
         assert(bdrv_check_request(req->offset, req->bytes) == 0);
 
-        bdrv_mark_request_serialising(req, bs->bl.request_alignment);
+        bdrv_make_request_serialising(req, bs->bl.request_alignment);
     }
 #endif
 
diff --git a/block/io.c b/block/io.c
index d7015378a3..fadfed3ab8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -805,15 +805,14 @@ bdrv_wait_serialising_requests_locked(BdrvTrackedRequest *self)
     return waited;
 }
 
-bool bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align)
+/* Called with req->bs->reqs_lock held */
+static void tracked_request_set_serialising(BdrvTrackedRequest *req,
+                                            uint64_t align)
 {
-    BlockDriverState *bs = req->bs;
     int64_t overlap_offset = req->offset & ~(align - 1);
     uint64_t overlap_bytes = ROUND_UP(req->offset + req->bytes, align)
                                - overlap_offset;
-    bool waited;
 
-    qemu_co_mutex_lock(&bs->reqs_lock);
     if (!req->serialising) {
         qatomic_inc(&req->bs->serialising_in_flight);
         req->serialising = true;
@@ -821,9 +820,6 @@ bool bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align)
 
     req->overlap_offset = MIN(req->overlap_offset, overlap_offset);
     req->overlap_bytes = MAX(req->overlap_bytes, overlap_bytes);
-    waited = bdrv_wait_serialising_requests_locked(req);
-    qemu_co_mutex_unlock(&bs->reqs_lock);
-    return waited;
 }
 
 /**
@@ -909,6 +905,21 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
+bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
+                                                uint64_t align)
+{
+    bool waited;
+
+    qemu_co_mutex_lock(&req->bs->reqs_lock);
+
+    tracked_request_set_serialising(req, align);
+    waited = bdrv_wait_serialising_requests_locked(req);
+
+    qemu_co_mutex_unlock(&req->bs->reqs_lock);
+
+    return waited;
+}
+
 int bdrv_check_request(int64_t offset, int64_t bytes)
 {
     if (offset < 0 || bytes < 0) {
@@ -1434,7 +1445,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
          * with each other for the same cluster.  For example, in copy-on-read
          * it ensures that the CoR read and write operations are atomic and
          * guest writes cannot interleave between them. */
-        bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
+        bdrv_make_request_serialising(req, bdrv_get_cluster_size(bs));
     } else {
         bdrv_wait_serialising_requests(req);
     }
@@ -1849,7 +1860,7 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
     assert(!(flags & ~BDRV_REQ_MASK));
 
     if (flags & BDRV_REQ_SERIALISING) {
-        bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
+        bdrv_make_request_serialising(req, bdrv_get_cluster_size(bs));
     } else {
         bdrv_wait_serialising_requests(req);
     }
@@ -2015,7 +2026,7 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
 
     padding = bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
-        bdrv_mark_request_serialising(req, align);
+        bdrv_make_request_serialising(req, align);
 
         bdrv_padding_rmw_read(child, req, &pad, true);
 
@@ -2129,7 +2140,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     }
 
     if (bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad)) {
-        bdrv_mark_request_serialising(&req, align);
+        bdrv_make_request_serialising(&req, align);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
 
@@ -3250,7 +3261,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
      * new area, we need to make sure that no write requests are made to it
      * concurrently or they might be overwritten by preallocation. */
     if (new_bytes) {
-        bdrv_mark_request_serialising(&req, 1);
+        bdrv_make_request_serialising(&req, 1);
     }
     if (bs->read_only) {
         error_setg(errp, "Image is read-only");
-- 
2.29.2


