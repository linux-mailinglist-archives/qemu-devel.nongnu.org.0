Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986DE62FBE1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Mv-00068w-28; Fri, 18 Nov 2022 12:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mt-00067v-Em
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Ms-0002V4-3t
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dp7wRWXAEvYDLGWwQmVYkAEDSvbZ+N3Rnty6nekWdq0=;
 b=JxCdY4BCBhESPAIfi4N02b+VmzdRkrfdaswAsrtL4J3+3WbNbg5hZA+EWKBR6Yl98xJJkz
 ulUL+o6tgSe6Da6sr3TTUqKObzQZOUARU/33Tcip0+T4rOKaqD7RBZASBdhmU7RuQa5O7I
 Myx+kKXdwGE33GB7t2MYIY3gB2Sfhbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-ctAkAd3GNnKLRLLbjLUb3g-1; Fri, 18 Nov 2022 12:41:29 -0500
X-MC-Unique: ctAkAd3GNnKLRLLbjLUb3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84FBB185A792;
 Fri, 18 Nov 2022 17:41:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4814C492B04;
 Fri, 18 Nov 2022 17:41:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] block: Inline bdrv_drain_invoke()
Date: Fri, 18 Nov 2022 18:41:00 +0100
Message-Id: <20221118174110.55183-6-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

bdrv_drain_invoke() has now two entirely separate cases that share no
code any more and are selected depending on a bool parameter. Each case
has only one caller. Just inline the function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/io.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/block/io.c b/block/io.c
index f4ca62b034..a25103be6f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -242,21 +242,6 @@ typedef struct {
     bool ignore_bds_parents;
 } BdrvCoDrainData;
 
-/* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
-static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
-{
-    if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
-            (!begin && !bs->drv->bdrv_drain_end)) {
-        return;
-    }
-
-    if (begin) {
-        bs->drv->bdrv_drain_begin(bs);
-    } else {
-        bs->drv->bdrv_drain_end(bs);
-    }
-}
-
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
 bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
                      BdrvChild *ignore_parent, bool ignore_bds_parents)
@@ -390,7 +375,9 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
     }
 
     bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
-    bdrv_drain_invoke(bs, true);
+    if (bs->drv && bs->drv->bdrv_drain_begin) {
+        bs->drv->bdrv_drain_begin(bs);
+    }
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
@@ -461,7 +448,9 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
-    bdrv_drain_invoke(bs, false);
+    if (bs->drv && bs->drv->bdrv_drain_end) {
+        bs->drv->bdrv_drain_end(bs);
+    }
     bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
 
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
-- 
2.38.1


