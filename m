Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFF6AF72A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeUI-0008AB-01; Tue, 07 Mar 2023 16:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeUG-00089C-Jl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZeUF-0002ik-8X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678223082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zdrikkYKWNCa5NfWeDK+tnGc1+1unoquqmdlo8eEg4=;
 b=ZyOlLdpVXHIeqCXOQx6jXQ4w661z1reg1LgtqJ3512hlW7NBnELNH6M2svKqrxW/DRmUUM
 BOvkXCC2bY4fa83M0ngrHTX/qH2R4maHaAYcLOPeYBbT7YmANv63B7Jj4Iz7g9gK62tlwG
 PhHU1k7ZpTZ/59k2q2emW3hN20QVD4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-Uans5qCvMjSEBNT5Eh9mww-1; Tue, 07 Mar 2023 16:04:35 -0500
X-MC-Unique: Uans5qCvMjSEBNT5Eh9mww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9329F185A7A4;
 Tue,  7 Mar 2023 21:04:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7B7140EBF4;
 Tue,  7 Mar 2023 21:04:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Date: Tue,  7 Mar 2023 16:04:26 -0500
Message-Id: <20230307210427.269214-3-stefanha@redhat.com>
In-Reply-To: <20230307210427.269214-1-stefanha@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

This field is accessed by multiple threads without a lock. Use explicit
qatomic_read()/qatomic_set() calls. There is no need for acquire/release
because blk_set_disable_request_queuing() doesn't provide any
guarantees (it helps that it's used at BlockBackend creation time and
not when there is I/O in flight).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
---
 block/block-backend.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 68807be32b..0cba4add20 100644
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
2.39.2


