Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733006EE297
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:15:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVE-0006Mq-7O; Tue, 25 Apr 2023 09:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUo-0006FD-0D
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUm-0006XD-Eh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nShfLOl8CclmcnUxnQ0bFrxy8Xke8kt4MSTLZqnK6MA=;
 b=hmmaYpmRtWFaoaqqF+Ao4qBOs/+KFuGEV8nesphLJFgkLvO6x4iwutKYatqKrk3iMLGHgZ
 38zFByYl2LBUhCp3pPnD4wIUU5Kt7Uq/j2bHJrgAICQ4OSx1DY8bX/VD4Y7x8dvdxcSQJH
 2upP9itCCj8bMZ37sEHPbyEKKBnGRf4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-1m8eqFn2MbSvT4Dc_9SpKg-1; Tue, 25 Apr 2023 09:14:07 -0400
X-MC-Unique: 1m8eqFn2MbSvT4Dc_9SpKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A7C38221C4;
 Tue, 25 Apr 2023 13:14:07 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB98540C2064;
 Tue, 25 Apr 2023 13:14:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/25] block: protect BlockBackend->queued_requests with a lock
Date: Tue, 25 Apr 2023 15:13:37 +0200
Message-Id: <20230425131359.259007-4-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

The CoQueue API offers thread-safety via the lock argument that
qemu_co_queue_wait() and qemu_co_enter_next() take. BlockBackend
currently does not make use of the lock argument. This means that
multiple threads submitting I/O requests can corrupt the CoQueue's
QSIMPLEQ.

Add a QemuMutex and pass it to CoQueue APIs so that the queue is
protected. While we're at it, also assert that the queue is empty when
the BlockBackend is deleted.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Message-Id: <20230307210427.269214-4-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 8552b6dfd0..47e006c645 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -81,6 +81,7 @@ struct BlockBackend {
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
     int quiesce_counter; /* atomic: written under BQL, read by other threads */
+    QemuMutex queued_requests_lock; /* protects queued_requests */
     CoQueue queued_requests;
     bool disable_request_queuing; /* atomic */
 
@@ -368,6 +369,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
 
     block_acct_init(&blk->stats);
 
+    qemu_mutex_init(&blk->queued_requests_lock);
     qemu_co_queue_init(&blk->queued_requests);
     notifier_list_init(&blk->remove_bs_notifiers);
     notifier_list_init(&blk->insert_bs_notifiers);
@@ -485,6 +487,8 @@ static void blk_delete(BlockBackend *blk)
     assert(QLIST_EMPTY(&blk->remove_bs_notifiers.notifiers));
     assert(QLIST_EMPTY(&blk->insert_bs_notifiers.notifiers));
     assert(QLIST_EMPTY(&blk->aio_notifiers));
+    assert(qemu_co_queue_empty(&blk->queued_requests));
+    qemu_mutex_destroy(&blk->queued_requests_lock);
     QTAILQ_REMOVE(&block_backends, blk, link);
     drive_info_del(blk->legacy_dinfo);
     block_acct_cleanup(&blk->stats);
@@ -1273,9 +1277,16 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 
     if (qatomic_read(&blk->quiesce_counter) &&
         !qatomic_read(&blk->disable_request_queuing)) {
+        /*
+         * Take lock before decrementing in flight counter so main loop thread
+         * waits for us to enqueue ourselves before it can leave the drained
+         * section.
+         */
+        qemu_mutex_lock(&blk->queued_requests_lock);
         blk_dec_in_flight(blk);
-        qemu_co_queue_wait(&blk->queued_requests, NULL);
+        qemu_co_queue_wait(&blk->queued_requests, &blk->queued_requests_lock);
         blk_inc_in_flight(blk);
+        qemu_mutex_unlock(&blk->queued_requests_lock);
     }
 }
 
@@ -2634,9 +2645,12 @@ static void blk_root_drained_end(BdrvChild *child)
         if (blk->dev_ops && blk->dev_ops->drained_end) {
             blk->dev_ops->drained_end(blk->dev_opaque);
         }
-        while (qemu_co_enter_next(&blk->queued_requests, NULL)) {
+        qemu_mutex_lock(&blk->queued_requests_lock);
+        while (qemu_co_enter_next(&blk->queued_requests,
+                                  &blk->queued_requests_lock)) {
             /* Resume all queued requests */
         }
+        qemu_mutex_unlock(&blk->queued_requests_lock);
     }
 }
 
-- 
2.40.0


