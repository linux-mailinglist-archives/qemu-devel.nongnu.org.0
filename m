Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B7640CC08
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:55:20 +0200 (CEST)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ7v-00009O-QD
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6B-0005YL-EP
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ68-0006M8-5S
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nJoyOt3XCEys/6FJOHc9A0/TJWtjz849euL84GZ8UA=;
 b=EsHLsfvvIu3JDpiNxii0quRyegTtdUekFZ0zn9/p+mEcw5S0EQh2wAN1jQ40k6n9MAJ5cc
 Q2yucjPpoUPOWLvp3idQLja7RLQnla63ho4wSkXCXeur2tj/RXCaQcs9lt9DeY2LfgpNDb
 WteFFIW43GZMF8zJvEw39gEYeYzUZNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-DQw785tvNZSKh97fLyQvCg-1; Wed, 15 Sep 2021 13:53:24 -0400
X-MC-Unique: DQw785tvNZSKh97fLyQvCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDEE84A5E1;
 Wed, 15 Sep 2021 17:53:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99F4C604CC;
 Wed, 15 Sep 2021 17:53:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/32] gluster: Align block-status tail
Date: Wed, 15 Sep 2021 19:52:47 +0200
Message-Id: <20210915175318.853225-2-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

gluster's block-status implementation is basically a copy of that in
block/file-posix.c, there is only one thing missing, and that is
aligning trailing data extents to the request alignment (as added by
commit 9c3db310ff0).

Note that 9c3db310ff0 mentions that "there seems to be no other block
driver that sets request_alignment and [...]", but while block/gluster.c
does indeed not set request_alignment, block/io.c's
bdrv_refresh_limits() will still default to an alignment of 512 because
block/gluster.c does not provide a byte-aligned read function.
Therefore, unaligned tails can conceivably occur, and so we should apply
the change from 9c3db310ff0 to gluster's block-status implementation.

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210805143603.59503-1-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/gluster.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/block/gluster.c b/block/gluster.c
index e8ee14c8e9..48a04417cf 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1477,6 +1477,8 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
     off_t data = 0, hole = 0;
     int ret = -EINVAL;
 
+    assert(QEMU_IS_ALIGNED(offset | bytes, bs->bl.request_alignment));
+
     if (!s->fd) {
         return ret;
     }
@@ -1501,6 +1503,20 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
         /* On a data extent, compute bytes to the end of the extent,
          * possibly including a partial sector at EOF. */
         *pnum = MIN(bytes, hole - offset);
+
+        /*
+         * We are not allowed to return partial sectors, though, so
+         * round up if necessary.
+         */
+        if (!QEMU_IS_ALIGNED(*pnum, bs->bl.request_alignment)) {
+            int64_t file_length = qemu_gluster_getlength(bs);
+            if (file_length > 0) {
+                /* Ignore errors, this is just a safeguard */
+                assert(hole == file_length);
+            }
+            *pnum = ROUND_UP(*pnum, bs->bl.request_alignment);
+        }
+
         ret = BDRV_BLOCK_DATA;
     } else {
         /* On a hole, compute bytes to the beginning of the next extent.  */
-- 
2.31.1


