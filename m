Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7940CC1C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:59:00 +0200 (CEST)
Received: from localhost ([::1]:57420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZBT-0006t4-4Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6J-0005wP-40
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6H-0006Wf-E5
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3OEWBgbx1FlL+tgX3YVs4AuUhVFeFNXIkziX9jmhqY=;
 b=LIjPsNcJm6nY1n8448FB3r64481qYarInl2hiVj6lpf+hvfUu78+tZBVVj5e0pvT3IJO4e
 4etlbPugnlXW3ZRbR1qW9B5aWF0CgT3boy5n3siZ/S8NHb1zju1vYcirZ5fwYizH8jmRhk
 pSh9dr07D7GpbPlem2yfThpoPEJGHME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-Y_8_xzGdPYyObgPJ8CJqdQ-1; Wed, 15 Sep 2021 13:53:35 -0400
X-MC-Unique: Y_8_xzGdPYyObgPJ8CJqdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F0384A5E6;
 Wed, 15 Sep 2021 17:53:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EAD460C2B;
 Wed, 15 Sep 2021 17:53:33 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/32] block/gluster: Do not force-cap *pnum
Date: Wed, 15 Sep 2021 19:52:52 +0200
Message-Id: <20210915175318.853225-7-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210812084148.14458-6-hreitz@redhat.com>
---
 block/gluster.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 48a04417cf..d51938e447 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1461,7 +1461,8 @@ exit:
  * the specified offset) that are known to be in the same
  * allocated/unallocated state.
  *
- * 'bytes' is the max value 'pnum' should be set to.
+ * 'bytes' is a soft cap for 'pnum'.  If the information is free, 'pnum' may
+ * well exceed it.
  *
  * (Based on raw_co_block_status() from file-posix.c.)
  */
@@ -1502,7 +1503,7 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
     } else if (data == offset) {
         /* On a data extent, compute bytes to the end of the extent,
          * possibly including a partial sector at EOF. */
-        *pnum = MIN(bytes, hole - offset);
+        *pnum = hole - offset;
 
         /*
          * We are not allowed to return partial sectors, though, so
@@ -1521,7 +1522,7 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
     } else {
         /* On a hole, compute bytes to the beginning of the next extent.  */
         assert(hole == offset);
-        *pnum = MIN(bytes, data - offset);
+        *pnum = data - offset;
         ret = BDRV_BLOCK_ZERO;
     }
 
-- 
2.31.1


