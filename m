Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73BA62FBDD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5N8-0006Sx-5n; Fri, 18 Nov 2022 12:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N4-0006Ky-W6
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N2-0002XP-DO
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epQl9x6Ra2x59TCwnccQGvNo994d8CcQSjKCQ5Y4hlg=;
 b=MAdrCZcCDcMWCHr8STSEeCT9wylYFDPCLy8+7Xk1zI9SKgTT8FJY3tyXxwyBIsXxhu7tHQ
 ssf0GN2sWo9oSp6AGy9Ac0edIvbhjwWkAT9bxRCltCPZheVkcypghujStCfo4MjdX2b1UK
 l/XQbfLGnoZvBG0fdDEPz7A8H5DqBo0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97--ng2xuS6PQmRv1deOtY5hA-1; Fri, 18 Nov 2022 12:41:42 -0500
X-MC-Unique: -ng2xuS6PQmRv1deOtY5hA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6FA238173CE;
 Fri, 18 Nov 2022 17:41:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC0F492B04;
 Fri, 18 Nov 2022 17:41:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] block: Drop out of coroutine in
 bdrv_do_drained_begin_quiesce()
Date: Fri, 18 Nov 2022 18:41:08 +0100
Message-Id: <20221118174110.55183-14-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The next patch adds a parent drain to bdrv_attach_child_common(), which
shouldn't be, but is currently called from coroutines in some cases (e.g.
.bdrv_co_create implementations generally open new nodes). Therefore,
the assertion that we're not in a coroutine doesn't hold true any more.

We could just remove the assertion because there is nothing in the
function that should be in conflict with running in a coroutine, but
just to be on the safe side, we can reverse the caller relationship
between bdrv_do_drained_begin() and bdrv_do_drained_begin_quiesce() so
that the latter also just drops out of coroutine context and we can
still be certain in the future that any drain code doesn't run in
coroutines.

As a nice side effect, the structure of bdrv_do_drained_begin() is now
symmetrical with bdrv_do_drained_end().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/block/io.c b/block/io.c
index 2e9503df6a..5e9150d92c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -346,10 +346,15 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
+static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
+                                  bool poll)
 {
     IO_OR_GS_CODE();
-    assert(!qemu_in_coroutine());
+
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain(bs, true, parent, poll);
+        return;
+    }
 
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
@@ -359,17 +364,6 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
             bs->drv->bdrv_drain_begin(bs);
         }
     }
-}
-
-static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool poll)
-{
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, true, parent, poll);
-        return;
-    }
-
-    bdrv_do_drained_begin_quiesce(bs, parent);
 
     /*
      * Wait for drained requests to finish.
@@ -385,6 +379,11 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
     }
 }
 
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
+{
+    bdrv_do_drained_begin(bs, parent, false);
+}
+
 void bdrv_drained_begin(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-- 
2.38.1


