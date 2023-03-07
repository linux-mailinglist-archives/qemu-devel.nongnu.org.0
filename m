Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8B6AF72C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeUG-00088g-3i; Tue, 07 Mar 2023 16:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeUC-00087s-27
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeU8-0002hD-EF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678223074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nR0EVX41VM86kg5849QDlLjUDoJ/9wiGw9aZDX6pxBk=;
 b=aIp+Fe2JAubq7MkI04sVCB/Ntc6xAPCdOlDORJShJQ+abTT73DgrQmC3llKgPw//rLljUS
 vH0wTIhVVw6uLf0befq2dsUHLsPNs7X5vpcncKwV8ioeGY+LFXcfqUqduWVeSY0fB4BDew
 /9wbzaoGRdAbSgsIWYSj44l15RDXuM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Af-xbui9Obq4I6K90Y2sug-1; Tue, 07 Mar 2023 16:04:33 -0500
X-MC-Unique: Af-xbui9Obq4I6K90Y2sug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7E91C0A589;
 Tue,  7 Mar 2023 21:04:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A1BD44002;
 Tue,  7 Mar 2023 21:04:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 1/3] block: make BlockBackend->quiesce_counter atomic
Date: Tue,  7 Mar 2023 16:04:25 -0500
Message-Id: <20230307210427.269214-2-stefanha@redhat.com>
In-Reply-To: <20230307210427.269214-1-stefanha@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
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

The main loop thread increments/decrements BlockBackend->quiesce_counter
when drained sections begin/end. The counter is read in the I/O code
path. Therefore this field is used to communicate between threads
without a lock.

Acquire/release are not necessary because the BlockBackend->in_flight
counter already uses sequentially consistent accesses and running I/O
requests hold that counter when blk_wait_while_drained() is called.
qatomic_read() can be used.

Use qatomic_fetch_inc()/qatomic_fetch_dec() for modifications even
though sequentially consistent atomic accesses are not strictly required
here. They are, however, nicer to read than multiple calls to
qatomic_read() and qatomic_set(). Since beginning and ending drain is
not a hot path the extra cost doesn't matter.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 278b04ce69..68807be32b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -80,7 +80,7 @@ struct BlockBackend {
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
-    int quiesce_counter;
+    int quiesce_counter; /* atomic: written under BQL, read by other threads */
     CoQueue queued_requests;
     bool disable_request_queuing;
 
@@ -1057,7 +1057,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops && ops->drained_begin) {
+    if (qatomic_read(&blk->quiesce_counter) && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
@@ -1271,7 +1271,7 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
     assert(blk->in_flight > 0);
 
-    if (blk->quiesce_counter && !blk->disable_request_queuing) {
+    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
         blk_dec_in_flight(blk);
         qemu_co_queue_wait(&blk->queued_requests, NULL);
         blk_inc_in_flight(blk);
@@ -2568,7 +2568,7 @@ static void blk_root_drained_begin(BdrvChild *child)
     BlockBackend *blk = child->opaque;
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
 
-    if (++blk->quiesce_counter == 1) {
+    if (qatomic_fetch_inc(&blk->quiesce_counter) == 0) {
         if (blk->dev_ops && blk->dev_ops->drained_begin) {
             blk->dev_ops->drained_begin(blk->dev_opaque);
         }
@@ -2586,7 +2586,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     bool busy = false;
-    assert(blk->quiesce_counter);
+    assert(qatomic_read(&blk->quiesce_counter));
 
     if (blk->dev_ops && blk->dev_ops->drained_poll) {
         busy = blk->dev_ops->drained_poll(blk->dev_opaque);
@@ -2597,12 +2597,12 @@ static bool blk_root_drained_poll(BdrvChild *child)
 static void blk_root_drained_end(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
-    assert(blk->quiesce_counter);
+    assert(qatomic_read(&blk->quiesce_counter));
 
     assert(blk->public.throttle_group_member.io_limits_disabled);
     qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
 
-    if (--blk->quiesce_counter == 0) {
+    if (qatomic_fetch_dec(&blk->quiesce_counter) == 1) {
         if (blk->dev_ops && blk->dev_ops->drained_end) {
             blk->dev_ops->drained_end(blk->dev_opaque);
         }
-- 
2.39.2


