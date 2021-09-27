Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EA41A1A5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 23:58:51 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyeA-0007N3-Sb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 17:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybi-0002hR-4J
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybd-0002wF-GU
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xq5R/IEFf+WSLrp1HO4kNmCEVBlv23Tmmn2Mi5BJVbA=;
 b=YXxnsCCmrpiL4r1bRZkY71ibIY2bo1NQ1auOLbtVrWtx57h1MdYbkHyZB/KAIhgWIP9ofu
 iGCF0WIA7zYlZPCzTuVIA6hkuskLHo+GDQ/2iIPM2pQXtliKkVkh2yIuzNyrsxVWOQiQgm
 l4t7suUD5y2c4Cakfrm3Q7fd+Rt3iD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-mAYTR6Z6M7SlHW945MfH_w-1; Mon, 27 Sep 2021 17:56:09 -0400
X-MC-Unique: mAYTR6Z6M7SlHW945MfH_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7937E5074B;
 Mon, 27 Sep 2021 21:56:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E41F317B5B;
 Mon, 27 Sep 2021 21:56:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] block/io: allow 64bit write-zeroes requests
Date: Mon, 27 Sep 2021 16:55:34 -0500
Message-Id: <20210927215545.3930309-10-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now that all drivers are updated by previous commit, we can drop two
last limiters on write-zeroes path: INT_MAX in
bdrv_co_do_pwrite_zeroes() and bdrv_check_request32() in
bdrv_co_pwritev_part().

Now everything is prepared for implementing incredibly cool and fast
big-write-zeroes in NBD and qcow2. And any other driver which wants it
of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-9-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0090224603f5..e40462742ea1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1869,7 +1869,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;

-    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
+                                            INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
@@ -2248,7 +2249,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }

-    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    if (flags & BDRV_REQ_ZERO_WRITE) {
+        ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
+    } else {
+        ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    }
     if (ret < 0) {
         return ret;
     }
-- 
2.31.1


