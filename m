Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39063FDECA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:38:15 +0200 (CEST)
Received: from localhost ([::1]:42578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSJa-0004E4-NB
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzh-0005cI-Db
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRza-0003xX-Tn
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWI7HfOc4ZaN7Ip2VvLJzPpi6fGTcUvJwalJHHSt93k=;
 b=UnkYmCgYM7LSdvKbUq8i0Rc+tV4iqSmc1MqM34Fpu23GT/b0gunphDRqOeauMjeBXoQ00P
 QGXyIMdIN3hz9g0Qr9BxR3EVSf91/pEHQCYXmLboWTyc34jOlNrDGfEDOHKyUNsdmT2ZX3
 Kx3tqnW6oboqRFvMEJSLCKai+CCB120=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-loDVQI27OwmBw3WGAAbB0A-1; Wed, 01 Sep 2021 11:17:32 -0400
X-MC-Unique: loDVQI27OwmBw3WGAAbB0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0280CFC81;
 Wed,  1 Sep 2021 15:17:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB2760C05;
 Wed,  1 Sep 2021 15:17:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 32/56] block/copy-before-write: use file child instead of
 backing
Date: Wed,  1 Sep 2021 17:15:55 +0200
Message-Id: <20210901151619.689075-33-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-13-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.31.1


