Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C74CFD7E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:56:53 +0100 (CET)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRByu-0005l5-AP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAin-0004qk-6H
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAil-0008CR-96
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FZM4eXp8IiufRWDwYlg6LzzFomygkymmGQdsh6Xj7w=;
 b=gixr/CGLqQarC6KhRYKJd/YRNpi6o0oNrWK28rMPcUbiZCbSQOoQq1XPwKUupUbvo6/Pml
 O/Hy4hL2K5v9la0jXxvVOMTLJQOOF4ZOAVoyJuRDtFnPSlE2tMPuY3M/0u3Z68qmrx8FMe
 MTcQFWZyCWe5A4gAV5UfzfnzAc9YVrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-dp7GWzbnMcWDJvjX1cnAPA-1; Mon, 07 Mar 2022 05:36:04 -0500
X-MC-Unique: dp7GWzbnMcWDJvjX1cnAPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E3B108088A;
 Mon,  7 Mar 2022 10:36:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5AA721D4;
 Mon,  7 Mar 2022 10:36:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/23] block: fix preallocate filter: don't do unaligned
 preallocate requests
Date: Mon,  7 Mar 2022 11:35:30 +0100
Message-Id: <20220307103549.808809-5-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

There is a bug in handling BDRV_REQ_NO_WAIT flag: we still may wait in
wait_serialising_requests() if request is unaligned. And this is
possible for the only user of this flag (preallocate filter) if
underlying file is unaligned to its request_alignment on start.

So, we have to fix preallocate filter to do only aligned preallocate
requests.

Next, we should fix generic block/io.c somehow. Keeping in mind that
preallocate is the only user of BDRV_REQ_NO_WAIT and that we have to
fix its behavior now, it seems more safe to just assert that we never
use BDRV_REQ_NO_WAIT with unaligned requests and add corresponding
comment. Let's do so.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Message-Id: <20220215121609.38570-1-vsementsov@virtuozzo.com>
[hreitz: Rebased on block GS/IO split]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-common.h |  3 ++-
 block/io.c                   |  4 ++++
 block/preallocate.c          | 15 ++++++++++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 0c5dc4a86a..fdb7306e78 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -112,7 +112,8 @@ typedef enum {
 
     /*
      * If we need to wait for other requests, just fail immediately. Used
-     * only together with BDRV_REQ_SERIALISING.
+     * only together with BDRV_REQ_SERIALISING. Used only with requests aligned
+     * to request_alignment (corresponding assertions are in block/io.c).
      */
     BDRV_REQ_NO_WAIT = 0x400,
 
diff --git a/block/io.c b/block/io.c
index efc011ce65..8bee484463 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2203,6 +2203,7 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
 
     padding = bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
+        assert(!(flags & BDRV_REQ_NO_WAIT));
         bdrv_make_request_serialising(req, align);
 
         bdrv_padding_rmw_read(child, req, &pad, true);
@@ -2339,6 +2340,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
          * serialize the request to prevent interactions of the
          * widened region with other transactions.
          */
+        assert(!(flags & BDRV_REQ_NO_WAIT));
         bdrv_make_request_serialising(&req, align);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
@@ -3387,6 +3389,8 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     /* TODO We can support BDRV_REQ_NO_FALLBACK here */
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
     assert(!(write_flags & BDRV_REQ_NO_FALLBACK));
+    assert(!(read_flags & BDRV_REQ_NO_WAIT));
+    assert(!(write_flags & BDRV_REQ_NO_WAIT));
 
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
diff --git a/block/preallocate.c b/block/preallocate.c
index 1d4233f730..e15cb8c74a 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -276,6 +276,10 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
     int64_t end = offset + bytes;
     int64_t prealloc_start, prealloc_end;
     int ret;
+    uint32_t file_align = bs->file->bs->bl.request_alignment;
+    uint32_t prealloc_align = MAX(s->opts.prealloc_align, file_align);
+
+    assert(QEMU_IS_ALIGNED(prealloc_align, file_align));
 
     if (!has_prealloc_perms(bs)) {
         /* We don't have state neither should try to recover it */
@@ -320,9 +324,14 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
 
     /* Now we want new preallocation, as request writes beyond s->file_end. */
 
-    prealloc_start = want_merge_zero ? MIN(offset, s->file_end) : s->file_end;
-    prealloc_end = QEMU_ALIGN_UP(end + s->opts.prealloc_size,
-                                 s->opts.prealloc_align);
+    prealloc_start = QEMU_ALIGN_UP(
+            want_merge_zero ? MIN(offset, s->file_end) : s->file_end,
+            file_align);
+    prealloc_end = QEMU_ALIGN_UP(
+            MAX(prealloc_start, end) + s->opts.prealloc_size,
+            prealloc_align);
+
+    want_merge_zero = want_merge_zero && (prealloc_start <= offset);
 
     ret = bdrv_co_pwrite_zeroes(
             bs->file, prealloc_start, prealloc_end - prealloc_start,
-- 
2.34.1


