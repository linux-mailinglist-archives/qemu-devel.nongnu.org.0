Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999764CBA1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5j-0005Xl-5D; Wed, 14 Dec 2022 08:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4l-0004Nt-V2
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4h-0003Vt-OH
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlxlzvziCj5y413L5kPGBdFFCV1HuqVlh/9fRnCF8TE=;
 b=DnhxujwTU7qQpNqJNs8bVL2vwntwS/4hJfN4uQ/5n69iCZcqOTgfqA4hbqctorFhBl0tGg
 6XPC2W6vkhdS/AEM99GyjkdFP3b+lTFyAf4tGyHlAGnL35gnm1rBBZCbz7WeyybxKk/42w
 rm5TRneAt3aDaaUDcAPuh1j5fAnHu3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-Ajh1aNNrN4mqs46LLuICbQ-1; Wed, 14 Dec 2022 08:45:26 -0500
X-MC-Unique: Ajh1aNNrN4mqs46LLuICbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A419038173C7;
 Wed, 14 Dec 2022 13:45:25 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E402014171BE;
 Wed, 14 Dec 2022 13:45:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/51] block: Drop out of coroutine in
 bdrv_do_drained_begin_quiesce()
Date: Wed, 14 Dec 2022 14:44:19 +0100
Message-Id: <20221214134453.31665-18-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Message-Id: <20221118174110.55183-14-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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


