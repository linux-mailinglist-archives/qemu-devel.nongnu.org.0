Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F66EE2AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIUt-0006GH-7Z; Tue, 25 Apr 2023 09:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUm-0006EC-Bk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUj-0006WQ-PW
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fdb+zGGiOB4lQ4ROZ95omYLZPOSQoHCyg1PVyv+9TK4=;
 b=Kv8NbDqDVc28IX0paQxxWODIx5pjcX+zeka7CSS7nE2lip6wk1rNcSSv73kBOGsvIM13iP
 Zy95wxOczPiQqborPUXiYWyvU04BcD2Db3O2HGDX+KO2RUvGyI08So5AgQYcNMH0vN1K1W
 Sb37Xu/YNNLKpXBRq37RzntCD17ukLw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-B0LD_EMgNXmIydyRHYGIuA-1; Tue, 25 Apr 2023 09:14:05 -0400
X-MC-Unique: B0LD_EMgNXmIydyRHYGIuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F42128135AA;
 Tue, 25 Apr 2023 13:14:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D3F40C2064;
 Tue, 25 Apr 2023 13:14:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/25] block: make BlockBackend->quiesce_counter atomic
Date: Tue, 25 Apr 2023 15:13:35 +0200
Message-Id: <20230425131359.259007-2-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230307210427.269214-2-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5566ea059d..2ae768f24d 100644
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
@@ -2595,7 +2595,7 @@ static void blk_root_drained_begin(BdrvChild *child)
     BlockBackend *blk = child->opaque;
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
 
-    if (++blk->quiesce_counter == 1) {
+    if (qatomic_fetch_inc(&blk->quiesce_counter) == 0) {
         if (blk->dev_ops && blk->dev_ops->drained_begin) {
             blk->dev_ops->drained_begin(blk->dev_opaque);
         }
@@ -2613,7 +2613,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     bool busy = false;
-    assert(blk->quiesce_counter);
+    assert(qatomic_read(&blk->quiesce_counter));
 
     if (blk->dev_ops && blk->dev_ops->drained_poll) {
         busy = blk->dev_ops->drained_poll(blk->dev_opaque);
@@ -2624,12 +2624,12 @@ static bool blk_root_drained_poll(BdrvChild *child)
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
2.40.0


