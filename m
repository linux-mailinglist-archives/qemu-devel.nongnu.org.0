Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFC3EA0E0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:45:56 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6Lb-0004ag-2E
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Ht-0004ig-A8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hr-0004lL-UG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7OBgZ5Pa9IACALRG26Pb/1nfqyFwvc0iacl8KZexbA=;
 b=Z/h7cpQJifnZk7eqJQjc6A1WhNLd3hKn86JqmyuC3FsMlntdfOk+2cfEqnmWjKWchVbPIn
 UEJXmmNHpwvjr61pUiEtB5ZSVfqc1EquA2SL8Ihigpgv+DmpWYvjH47qt+iRuCL0BVMvOA
 TKg/p1WL5DbJptFoUp8zXMsCtP0nrfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-ChQVl_Z5Pu6MYiyroT5HUA-1; Thu, 12 Aug 2021 04:42:00 -0400
X-MC-Unique: ChQVl_Z5Pu6MYiyroT5HUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E37B687D542;
 Thu, 12 Aug 2021 08:41:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC845C23A;
 Thu, 12 Aug 2021 08:41:58 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/6] block/file-posix: Do not force-cap *pnum
Date: Thu, 12 Aug 2021 10:41:46 +0200
Message-Id: <20210812084148.14458-5-hreitz@redhat.com>
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index cb9bffe047..9f35e5631a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2744,7 +2744,8 @@ static int find_allocation(BlockDriverState *bs, off_t start,
  * the specified offset) that are known to be in the same
  * allocated/unallocated state.
  *
- * 'bytes' is the max value 'pnum' should be set to.
+ * 'bytes' is a soft cap for 'pnum'.  If the information is free, 'pnum' may
+ * well exceed it.
  */
 static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
                                             bool want_zero,
@@ -2782,7 +2783,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     } else if (data == offset) {
         /* On a data extent, compute bytes to the end of the extent,
          * possibly including a partial sector at EOF. */
-        *pnum = MIN(bytes, hole - offset);
+        *pnum = hole - offset;
 
         /*
          * We are not allowed to return partial sectors, though, so
@@ -2801,7 +2802,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     } else {
         /* On a hole, compute bytes to the beginning of the next extent.  */
         assert(hole == offset);
-        *pnum = MIN(bytes, data - offset);
+        *pnum = data - offset;
         ret = BDRV_BLOCK_ZERO;
     }
     *map = offset;
-- 
2.31.1


