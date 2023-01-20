Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1F675489
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:32:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTt-0002VF-MQ; Fri, 20 Jan 2023 07:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTp-0002Rd-Sh
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTn-0000Hl-G6
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG4nb0aJyMEIhD89kW/MjVzdkVSKBz/osiNHW0Ha6Rk=;
 b=F+wdkQiMgg+gouNFz8nAYnN+Wec8Ujue+dzoR9fJ2uG5M/0Y7AIRKNSh4zr4JLCYqO6Dyi
 UiYbsul0KBXsZrmows5UZOVVHG5ouffnTKqyoRoX5LVLGmFpDcqjn8Knukyhk2tRZ5OM4g
 9bHNF8iaHQ5XWp6LG2tP2h6Knk24VTI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-mPfZ93n1O-a1WDB3P1j9vQ-1; Fri, 20 Jan 2023 07:26:45 -0500
X-MC-Unique: mPfZ93n1O-a1WDB3P1j9vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F3C92801E52;
 Fri, 20 Jan 2023 12:26:45 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84B4440C6EC4;
 Fri, 20 Jan 2023 12:26:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/38] block: remove bdrv_coroutine_enter
Date: Fri, 20 Jan 2023 13:26:02 +0100
Message-Id: <20230120122633.84983-8-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

It has only one caller---inline it and remove the function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221215130225.476477-2-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h | 5 -----
 block.c                  | 6 ------
 block/block-backend.c    | 2 +-
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 2ed6214909..1fa717a545 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -210,11 +210,6 @@ AioContext *coroutine_fn bdrv_co_enter(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
-/**
- * Transfer control to @co in the aio context of @bs
- */
-void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co);
-
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 void bdrv_io_plug(BlockDriverState *bs);
diff --git a/block.c b/block.c
index 9c2ac757e4..3f2bd12857 100644
--- a/block.c
+++ b/block.c
@@ -7177,12 +7177,6 @@ void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
     }
 }
 
-void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
-{
-    IO_CODE();
-    aio_co_enter(bdrv_get_aio_context(bs), co);
-}
-
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
     GLOBAL_STATE_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index ba7bf1d6bc..8fbb787f41 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1555,7 +1555,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     acb->has_returned = false;
 
     co = qemu_coroutine_create(co_entry, acb);
-    bdrv_coroutine_enter(blk_bs(blk), co);
+    aio_co_enter(blk_get_aio_context(blk), co);
 
     acb->has_returned = true;
     if (acb->rwco.ret != NOT_DONE) {
-- 
2.38.1


