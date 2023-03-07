Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A06AF72D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:06:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeUH-0008A1-SX; Tue, 07 Mar 2023 16:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeUF-00088k-Gt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeUE-0002iW-1B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678223081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKMFNjldcTsU810HycL2cuA/XyZV0C4BwRQGkbOqxBw=;
 b=ecAnkXkS9lPDjEVweATHeBhi675nFaEDrzNgn3Glc13KeXjlJgWadCMlxT0IOmAKnLCVlp
 aK266FZ6iZT2+Z25VraROAAefUYEaovgh8X9dZqcJPJoqDRpknXFvH5I8+HFkpN4WzDCLd
 1OA7UXtDmEbXGJCIJKK4D5JtJDJBfkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-mOFH2HVqOMGfzyMLtFLm4w-1; Tue, 07 Mar 2023 16:04:38 -0500
X-MC-Unique: mOFH2HVqOMGfzyMLtFLm4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA170802D38;
 Tue,  7 Mar 2023 21:04:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50F2C2026D4B;
 Tue,  7 Mar 2023 21:04:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 3/3] block: protect BlockBackend->queued_requests with a
 lock
Date: Tue,  7 Mar 2023 16:04:27 -0500
Message-Id: <20230307210427.269214-4-stefanha@redhat.com>
In-Reply-To: <20230307210427.269214-1-stefanha@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
---
 block/block-backend.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 0cba4add20..8c90d19bf1 100644
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
 
@@ -2607,9 +2618,12 @@ static void blk_root_drained_end(BdrvChild *child)
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
2.39.2


