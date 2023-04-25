Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC936EE299
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:15:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIUt-0006Jb-PI; Tue, 25 Apr 2023 09:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUn-0006F5-Ip
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUl-0006Ws-M4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phTlyt1Zifgy1Lq/4J4gJlUYJ7MjcBmXuKb6aHZq4kM=;
 b=d1g/USAJ3n/xnCPCreWNCmzDs3Q+UmdWyXCN5wcN0zoXKxJK7giEkd+pDcNyhILHke4Y8h
 c8ITw7f2HTaJToZCrcULd8F042/HfsEn40vwM1+eUzY4AjWmACIbVDDfgvFHavUKMmhVFV
 7WVOnlSaWMf9Gkg+ZJgwDBPZjGUfToQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-tG3p4wBUO424H20seJ4CLg-1; Tue, 25 Apr 2023 09:14:08 -0400
X-MC-Unique: tG3p4wBUO424H20seJ4CLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FFC438221DD;
 Tue, 25 Apr 2023 13:14:06 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B592D40C2064;
 Tue, 25 Apr 2023 13:14:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/25] block: make BlockBackend->disable_request_queuing atomic
Date: Tue, 25 Apr 2023 15:13:36 +0200
Message-Id: <20230425131359.259007-3-kwolf@redhat.com>
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

This field is accessed by multiple threads without a lock. Use explicit
qatomic_read()/qatomic_set() calls. There is no need for acquire/release
because blk_set_disable_request_queuing() doesn't provide any
guarantees (it helps that it's used at BlockBackend creation time and
not when there is I/O in flight).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Message-Id: <20230307210427.269214-3-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 2ae768f24d..8552b6dfd0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -82,7 +82,7 @@ struct BlockBackend {
 
     int quiesce_counter; /* atomic: written under BQL, read by other threads */
     CoQueue queued_requests;
-    bool disable_request_queuing;
+    bool disable_request_queuing; /* atomic */
 
     VMChangeStateEntry *vmsh;
     bool force_allow_inactivate;
@@ -1232,7 +1232,7 @@ void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow)
 void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
 {
     IO_CODE();
-    blk->disable_request_queuing = disable;
+    qatomic_set(&blk->disable_request_queuing, disable);
 }
 
 static int coroutine_fn GRAPH_RDLOCK
@@ -1271,7 +1271,8 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
     assert(blk->in_flight > 0);
 
-    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
+    if (qatomic_read(&blk->quiesce_counter) &&
+        !qatomic_read(&blk->disable_request_queuing)) {
         blk_dec_in_flight(blk);
         qemu_co_queue_wait(&blk->queued_requests, NULL);
         blk_inc_in_flight(blk);
-- 
2.40.0


