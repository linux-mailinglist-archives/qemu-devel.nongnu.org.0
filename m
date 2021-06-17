Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88BC3AB817
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:02:41 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuTY-0006VP-UW
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuKE-0005ik-Br
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuKC-0001In-1F
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623945179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDX7I1KjPi61ZunKAVKvnIGh+NM6+5nggCp5R/S3BF4=;
 b=Oh9iQdmHBo9qr0LaMCnQ1Ja6ZotrTqvs8V0mcktniaPpnnZxcJR9rbXIdWp9VGVBte+mg0
 nkX/lvSaXSBt5rglHs2NstEp7rdwbNd9/BeUbWIskAUXSOpc+9hxjTcQT29CHRc9PGJYhZ
 cx2GwGGIQZY2Ma2Wy3Cjt5tGznUcj1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-EWSKyhnUNWqO6HThwL_-7Q-1; Thu, 17 Jun 2021 11:52:58 -0400
X-MC-Unique: EWSKyhnUNWqO6HThwL_-7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C2A8797F6;
 Thu, 17 Jun 2021 15:52:57 +0000 (UTC)
Received: from localhost (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED6695D9C6;
 Thu, 17 Jun 2021 15:52:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/6] block/gluster: Do not force-cap *pnum
Date: Thu, 17 Jun 2021 17:52:45 +0200
Message-Id: <20210617155247.442150-5-mreitz@redhat.com>
In-Reply-To: <20210617155247.442150-1-mreitz@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_co_block_status() does it for us, we do not need to do it here.

The advantage of not capping *pnum is that bdrv_co_block_status() can
cache larger data regions than requested by its caller.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/gluster.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index e8ee14c8e9..8ef7bb18d5 100644
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
@@ -1500,12 +1501,12 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
     } else if (data == offset) {
         /* On a data extent, compute bytes to the end of the extent,
          * possibly including a partial sector at EOF. */
-        *pnum = MIN(bytes, hole - offset);
+        *pnum = hole - offset;
         ret = BDRV_BLOCK_DATA;
     } else {
         /* On a hole, compute bytes to the beginning of the next extent.  */
         assert(hole == offset);
-        *pnum = MIN(bytes, data - offset);
+        *pnum = data - offset;
         ret = BDRV_BLOCK_ZERO;
     }
 
-- 
2.31.1


