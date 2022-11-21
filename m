Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B685A632EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:21:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxECe-0002A3-Be; Mon, 21 Nov 2022 16:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxECX-00027z-8I
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxECU-0007Ba-Pl
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669065570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jkloZE2WADCy1fRXSTYkasFd2UOgtFZHIwKHqDTLSzU=;
 b=Zv//REusKZyaCHd+vUfu9TFsZouu59m02XN/Me8y1aH0HKpPn/57J/2FR97z8F6+w9PZ/I
 7jBVwNuQ9ogsrrU27VRdiG45DJCf2Wm3qFw20wAK1Tnnvqf1CpF16oTDEO8IBOoWSgrlUm
 QVfGIyBKOxtRwZByo6ICLGjeURHY6LI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-m9T-wVaHPjyQB-ah1S2E3A-1; Mon, 21 Nov 2022 16:19:28 -0500
X-MC-Unique: m9T-wVaHPjyQB-ah1S2E3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8573829ABA02;
 Mon, 21 Nov 2022 21:19:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B0F04EA47;
 Mon, 21 Nov 2022 21:19:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH for-7.2] block-backend: avoid bdrv_unregister_buf() NULL
 pointer deref
Date: Mon, 21 Nov 2022 16:19:23 -0500
Message-Id: <20221121211923.1993171-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_*() APIs expect a valid BlockDriverState. Calling them with bs=NULL
leads to undefined behavior.

Jonathan Cameron reported this following NULL pointer dereference when a
VM with a virtio-blk device and a memory-backend-file object is
terminated:
1. qemu_cleanup() closes all drives, setting blk->root to NULL
2. qemu_cleanup() calls user_creatable_cleanup(), which results in a RAM
   block notifier callback because the memory-backend-file is destroyed.
3. blk_unregister_buf() is called by virtio-blk's BlockRamRegistrar
   notifier callback and undefined behavior occurs.

Fixes: baf422684d73 ("virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint")
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index b48c91f4e1..d98a96ff37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2576,14 +2576,25 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
 bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    return bdrv_register_buf(blk_bs(blk), host, size, errp);
+
+    if (bs) {
+        return bdrv_register_buf(bs, host, size, errp);
+    }
+    return true;
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    bdrv_unregister_buf(blk_bs(blk), host, size);
+
+    if (bs) {
+        bdrv_unregister_buf(bs, host, size);
+    }
 }
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
-- 
2.38.1


