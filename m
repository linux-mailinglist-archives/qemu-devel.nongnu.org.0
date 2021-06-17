Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C803AB812
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:59:27 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuQQ-0001do-Eu
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuKC-0005Zx-5t
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuKA-0001Gw-CM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623945177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYqtM2qJIAUaOJRMjffIELPUPqFhJKPW2pkh7BPmLGM=;
 b=QvJRON0ujA6BMGwJB55q6Czcd/9ZYYavTEIY4sh2xJ/9bm+hcMWMNipUFx9tNcDMqPAY1b
 aaa2FHyffRpGoRaeYOwo96YVAQZ9Le44c880fIQc8V33SDN4FecFlUfIL8egnPlo83D5Af
 eAN91w0GQXNrwC9IH7UgX61PLGEtJW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-QN2FDTjNOTypZYUHyuK7HQ-1; Thu, 17 Jun 2021 11:52:56 -0400
X-MC-Unique: QN2FDTjNOTypZYUHyuK7HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CCD28042B7;
 Thu, 17 Jun 2021 15:52:55 +0000 (UTC)
Received: from localhost (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0827860875;
 Thu, 17 Jun 2021 15:52:54 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/6] block/file-posix: Do not force-cap *pnum
Date: Thu, 17 Jun 2021 17:52:44 +0200
Message-Id: <20210617155247.442150-4-mreitz@redhat.com>
In-Reply-To: <20210617155247.442150-1-mreitz@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b3fbb9bd63..aeb370d5bb 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2689,7 +2689,8 @@ static int find_allocation(BlockDriverState *bs, off_t start,
  * the specified offset) that are known to be in the same
  * allocated/unallocated state.
  *
- * 'bytes' is the max value 'pnum' should be set to.
+ * 'bytes' is a soft cap for 'pnum'.  If the information is free, 'pnum' may
+ * well exceed it.
  */
 static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
                                             bool want_zero,
@@ -2727,7 +2728,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     } else if (data == offset) {
         /* On a data extent, compute bytes to the end of the extent,
          * possibly including a partial sector at EOF. */
-        *pnum = MIN(bytes, hole - offset);
+        *pnum = hole - offset;
 
         /*
          * We are not allowed to return partial sectors, though, so
@@ -2746,7 +2747,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
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


