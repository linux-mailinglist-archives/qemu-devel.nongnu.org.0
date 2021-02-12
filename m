Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BA31A604
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:27:18 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf25-0008N0-29
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerm-0004FD-9D
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAeri-0003s6-51
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzo3lQNYriI3VlYsQNKoiRYoeY31ThbC7dAulCBY7k4=;
 b=TPXmUpA0g0mDx8Mm3sZUjSqgqUpZB76anJpO/Nel0l3g1CExeAi0bMz4rAjpMIX58JQBE3
 YD8MYflMKxYqL7lhmaYpHmBzRnvudkxzejQqKs5yZ14wX1XWsh3OAeXrmvExX0Qwf/OpfM
 BS6vPKgvWZRIntnfh8tB1/zX5N697Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-GhO37UVYN2WfEozXQ3KnKg-1; Fri, 12 Feb 2021 15:16:30 -0500
X-MC-Unique: GhO37UVYN2WfEozXQ3KnKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 772A9801994;
 Fri, 12 Feb 2021 20:16:29 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E57437A8DD;
 Fri, 12 Feb 2021 20:16:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] block: add new BlockDriver handler: bdrv_cancel_in_flight
Date: Fri, 12 Feb 2021 14:16:10 -0600
Message-Id: <20210212201619.1388255-6-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It will be used to stop retrying NBD requests on mirror cancel.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-2-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block.h     |  3 +++
 include/block/block_int.h |  9 +++++++++
 block/io.c                | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 0a9f2c187cdb..2f2698074e30 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -849,4 +849,7 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     BdrvChild *dst, int64_t dst_offset,
                                     int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
+
+void bdrv_cancel_in_flight(BlockDriverState *bs);
+
 #endif
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 22a2789d3516..88e411193981 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -352,6 +352,15 @@ struct BlockDriver {
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);

+    /*
+     * This informs the driver that we are no longer interested in the result
+     * of in-flight requests, so don't waste the time if possible.
+     *
+     * One example usage is to avoid waiting for an nbd target node reconnect
+     * timeout during job-cancel.
+     */
+    void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
+
     /*
      * Invalidate any cached meta-data.
      */
diff --git a/block/io.c b/block/io.c
index b0435ed6707c..ca2dca30070e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3460,3 +3460,14 @@ out:

     return ret;
 }
+
+void bdrv_cancel_in_flight(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return;
+    }
+
+    if (bs->drv->bdrv_cancel_in_flight) {
+        bs->drv->bdrv_cancel_in_flight(bs);
+    }
+}
-- 
2.30.1


