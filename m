Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E74A8635
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:31:16 +0100 (CET)
Received: from localhost ([::1]:36950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd8l-0004Jm-Bu
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckE-0000UO-VW
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckA-000199-Gu
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNIIx5bnYIe2+xQgP81ty3J53p9+6qvD7fR1pIeUhAM=;
 b=ImpOU1vXTMWmsH5uwfnaintDAQDZqL0wcRF8crFfzq9jjdSDQ5rUCDqD1mEYbU0CkuFjZz
 w45PEFed6FYvwd/CEUD4foXabWicgFooFrC67BIz6RIQxNWr8WtuQ6KnoSSS4JsHu4lIU5
 2w57+5A3XM9vBxwGvE+ZbHRFnfQwQG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-x11a0uMWNdSAzWqRMQsiZA-1; Thu, 03 Feb 2022 09:05:44 -0500
X-MC-Unique: x11a0uMWNdSAzWqRMQsiZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F751091DA2;
 Thu,  3 Feb 2022 14:05:43 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C00B11086488;
 Thu,  3 Feb 2022 14:05:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block: Lock AioContext for drain_end in blockdev-reopen
Date: Thu,  3 Feb 2022 15:05:33 +0100
Message-Id: <20220203140534.36522-2-kwolf@redhat.com>
In-Reply-To: <20220203140534.36522-1-kwolf@redhat.com>
References: <20220203140534.36522-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@virtuozzo.com,
 qinwang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_subtree_drained_end() requires the caller to hold the AioContext
lock for the drained node. Not doing this for nodes outside of the main
AioContext leads to crashes when AIO_WAIT_WHILE() needs to wait and
tries to temporarily release the lock.

Fixes: 3908b7a8994fa5ef7a89aa58cd5a02fc58141592
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2046659
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 8197165bb5..42e098b458 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3530,6 +3530,7 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
     BlockReopenQueue *queue = NULL;
     GSList *drained = NULL;
+    GSList *p;
 
     /* Add each one of the BDS that we want to reopen to the queue */
     for (; reopen_list != NULL; reopen_list = reopen_list->next) {
@@ -3579,7 +3580,15 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 
 fail:
     bdrv_reopen_queue_free(queue);
-    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
+    for (p = drained; p; p = p->next) {
+        BlockDriverState *bs = p->data;
+        AioContext *ctx = bdrv_get_aio_context(bs);
+
+        aio_context_acquire(ctx);
+        bdrv_subtree_drained_end(bs);
+        aio_context_release(ctx);
+    }
+    g_slist_free(drained);
 }
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
-- 
2.31.1


