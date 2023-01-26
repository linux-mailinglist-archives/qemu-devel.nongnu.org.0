Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74F67D318
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5zx-0005ko-Fw; Thu, 26 Jan 2023 12:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zp-0005i3-7Z
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zk-0006KR-Vw
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674753904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1BDqv1R23MIjrTbhID7QmN61W7wB8wuMHTM5FPawH0=;
 b=Ykd6C/Ubue+cfrPQEszSsynpzCJ0EyPEUES9pqFn1sTp5Sygpx1ujXfPYy2RUpaY0ViEKK
 5i7sSdlhitK2vtA8Szkt8RfTfgcekxRv9Drx7Rs2sc8SWnDRcEt2N00uGUd53Zpq8vZWyq
 ji36xJzCqCIMhEwptfDyAeW2A19ESBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-lrxjTivJMZuBsy3sc4tM-A-1; Thu, 26 Jan 2023 12:25:01 -0500
X-MC-Unique: lrxjTivJMZuBsy3sc4tM-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A7780B3DD;
 Thu, 26 Jan 2023 17:25:00 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79FE8492C14;
 Thu, 26 Jan 2023 17:24:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 10/13] vmdk: Fix .bdrv_co_create(_opts) to open images with
 no_co_wrapper
Date: Thu, 26 Jan 2023 18:24:29 +0100
Message-Id: <20230126172432.436111-11-kwolf@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

.bdrv_co_create implementations run in a coroutine. Therefore they are
not allowed to open images directly. Fix the calls to use the
corresponding no_co_wrappers instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 5b0eae877e..171c9272ca 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2299,9 +2299,9 @@ static int coroutine_fn vmdk_create_extent(const char *filename,
         goto exit;
     }
 
-    blk = blk_new_open(filename, NULL, NULL,
-                       BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL,
-                       errp);
+    blk = blk_co_new_open(filename, NULL, NULL,
+                          BDRV_O_RDWR | BDRV_O_RESIZE | BDRV_O_PROTOCOL,
+                          errp);
     if (blk == NULL) {
         ret = -EIO;
         goto exit;
@@ -2518,8 +2518,8 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         }
         assert(full_backing);
 
-        backing = blk_new_open(full_backing, NULL, NULL,
-                               BDRV_O_NO_BACKING, errp);
+        backing = blk_co_new_open(full_backing, NULL, NULL,
+                                  BDRV_O_NO_BACKING, errp);
         g_free(full_backing);
         if (backing == NULL) {
             ret = -EIO;
@@ -2781,7 +2781,7 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
     BlockdevCreateOptionsVmdk *opts = opaque;
 
     if (idx == 0) {
-        bs = bdrv_open_blockdev_ref(opts->file, errp);
+        bs = bdrv_co_open_blockdev_ref(opts->file, errp);
     } else {
         int i;
         BlockdevRefList *list = opts->extents;
@@ -2796,14 +2796,16 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
             error_setg(errp, "Extent [%d] not specified", idx - 1);
             return NULL;
         }
-        bs = bdrv_open_blockdev_ref(list->value, errp);
+        bs = bdrv_co_open_blockdev_ref(list->value, errp);
     }
     if (!bs) {
         return NULL;
     }
-    blk = blk_new_with_bs(bs,
-                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE | BLK_PERM_RESIZE,
-                          BLK_PERM_ALL, errp);
+    blk = blk_co_new_with_bs(bs,
+                             BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE |
+                                BLK_PERM_RESIZE,
+                             BLK_PERM_ALL,
+                             errp);
     if (!blk) {
         return NULL;
     }
-- 
2.38.1


