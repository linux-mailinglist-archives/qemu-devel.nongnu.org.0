Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9823E170E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:37:34 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeV3-0003wh-3L
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBeTn-0002TW-CV
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBeTj-0002Vo-66
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628174169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=son3BuHXemgf1Y8QHXku2T9pYceLfBHdReDz9XE5jAc=;
 b=RUnnMtqro1+FF61q23QCSsxkvl6ClwZPbzxg30DlUvnhuzNFC7qD0+rtplYYeXbSvPgADa
 DKKNF3as5KmezKwk75buIP7110fDq7KQzYs1Xs8tn1iM680YwqQw36CyzNOX5FWbNM59DM
 kA1QNCRD5f/Us0kOpYgm+R72K4jnoVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-txjiXDt0MIauKNcJa3CpUA-1; Thu, 05 Aug 2021 10:36:06 -0400
X-MC-Unique: txjiXDt0MIauKNcJa3CpUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EF3887D54C;
 Thu,  5 Aug 2021 14:36:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195EF1346F;
 Thu,  5 Aug 2021 14:36:04 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] gluster: Align block-status tail
Date: Thu,  5 Aug 2021 16:36:03 +0200
Message-Id: <20210805143603.59503-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


