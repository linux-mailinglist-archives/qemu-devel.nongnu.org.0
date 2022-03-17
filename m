Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E34DCBFE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:04:27 +0100 (CET)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtY1-0001eB-67
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:04:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRi-0004Jb-NA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUtRg-0000qI-R6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647536272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrt5xCpsHsXyF4aibbvu8F9rUHZ0K4Ocz25SmQKacTo=;
 b=cctePJeUJBxCEcijm2oMyIP10VElBNx9xLN9U4tyuSV+1qKDiV88WBTN02qNVVJYe8rXyy
 T2tKXaTqB9VOx7jAgkQZ0H0I23GaAD+C63Ep8Yw15bpals+4e807ubtQIX2Jxj5VTqU5Ql
 oz351HZrfBjelOUbISLrD776QLpolaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-sezWAAU7OGWmkvhESN4otQ-1; Thu, 17 Mar 2022 12:57:48 -0400
X-MC-Unique: sezWAAU7OGWmkvhESN4otQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 571BA101A54C;
 Thu, 17 Mar 2022 16:57:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E6F61454548;
 Thu, 17 Mar 2022 16:57:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-7.0 2/2] aio-posix: fix spurious ->poll_ready() callbacks
 in main loop
Date: Thu, 17 Mar 2022 16:57:43 +0000
Message-Id: <20220317165743.238662-3-stefanha@redhat.com>
In-Reply-To: <20220317165743.238662-1-stefanha@redhat.com>
References: <20220317165743.238662-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ->poll() succeeds the AioHandler is placed on the ready list with
revents set to the magic value 0. This magic value causes
aio_dispatch_handler() to invoke ->poll_ready() instead of ->io_read()
for G_IO_IN or ->io_write() for G_IO_OUT.

This magic value 0 hack works for the IOThread where AioHandlers are
placed on ->ready_list and processed by aio_dispatch_ready_handlers().
It does not work for the main loop where all AioHandlers are processed
by aio_dispatch_handlers(), even those that are not ready and have a
revents value of 0.

As a result the main loop invokes ->poll_ready() on AioHandlers that are
not ready. These spurious ->poll_ready() calls waste CPU cycles and
could lead to crashes if the code assumes ->poll() must have succeeded
before ->poll_ready() is called (a reasonable asumption but I haven't
seen it in practice).

Stop using revents to track whether ->poll_ready() will be called on an
AioHandler. Introduce a separate AioHandler->poll_ready field instead.
This eliminates spurious ->poll_ready() calls in the main loop.

Fixes: 826cc32423db2a99d184dbf4f507c737d7e7a4ae ("aio-posix: split poll check from ready handler")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reported-by: Jason Wang <jasowang@redhat.com>
Tested-by: Jason Wang <jasowang@redhat.com>
Message-id: 20220223155703.136833-1-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/aio-posix.h |  1 +
 util/aio-posix.c | 32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/util/aio-posix.h b/util/aio-posix.h
index 7f2c37a684..80b927c7f4 100644
--- a/util/aio-posix.h
+++ b/util/aio-posix.h
@@ -37,6 +37,7 @@ struct AioHandler {
     unsigned flags; /* see fdmon-io_uring.c */
 #endif
     int64_t poll_idle_timeout; /* when to stop userspace polling */
+    bool poll_ready; /* has polling detected an event? */
     bool is_external;
 };
 
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 7b9f629218..be0182a3c6 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -23,15 +23,6 @@
 #include "trace.h"
 #include "aio-posix.h"
 
-/*
- * G_IO_IN and G_IO_OUT are not appropriate revents values for polling, since
- * the handler may not need to access the file descriptor. For example, the
- * handler doesn't need to read from an EventNotifier if it polled a memory
- * location and a read syscall would be slow. Define our own unique revents
- * value to indicate that polling determined this AioHandler is ready.
- */
-#define REVENTS_POLL_READY 0
-
 /* Stop userspace polling on a handler if it isn't active for some time */
 #define POLL_IDLE_INTERVAL_NS (7 * NANOSECONDS_PER_SECOND)
 
@@ -49,6 +40,14 @@ void aio_add_ready_handler(AioHandlerList *ready_list,
     QLIST_INSERT_HEAD(ready_list, node, node_ready);
 }
 
+static void aio_add_poll_ready_handler(AioHandlerList *ready_list,
+                                       AioHandler *node)
+{
+    QLIST_SAFE_REMOVE(node, node_ready); /* remove from nested parent's list */
+    node->poll_ready = true;
+    QLIST_INSERT_HEAD(ready_list, node, node_ready);
+}
+
 static AioHandler *find_aio_handler(AioContext *ctx, int fd)
 {
     AioHandler *node;
@@ -76,6 +75,7 @@ static bool aio_remove_fd_handler(AioContext *ctx, AioHandler *node)
     }
 
     node->pfd.revents = 0;
+    node->poll_ready = false;
 
     /* If the fd monitor has already marked it deleted, leave it alone */
     if (QLIST_IS_INSERTED(node, node_deleted)) {
@@ -247,7 +247,7 @@ static bool poll_set_started(AioContext *ctx, AioHandlerList *ready_list,
 
         /* Poll one last time in case ->io_poll_end() raced with the event */
         if (!started && node->io_poll(node->opaque)) {
-            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
+            aio_add_poll_ready_handler(ready_list, node);
             progress = true;
         }
     }
@@ -282,6 +282,7 @@ bool aio_pending(AioContext *ctx)
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
         int revents;
 
+        /* TODO should this check poll ready? */
         revents = node->pfd.revents & node->pfd.events;
         if (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR) && node->io_read &&
             aio_node_check(ctx, node->is_external)) {
@@ -323,11 +324,15 @@ static void aio_free_deleted_handlers(AioContext *ctx)
 static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
 {
     bool progress = false;
+    bool poll_ready;
     int revents;
 
     revents = node->pfd.revents & node->pfd.events;
     node->pfd.revents = 0;
 
+    poll_ready = node->poll_ready;
+    node->poll_ready = false;
+
     /*
      * Start polling AioHandlers when they become ready because activity is
      * likely to continue.  Note that starvation is theoretically possible when
@@ -344,7 +349,7 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
         QLIST_INSERT_HEAD(&ctx->poll_aio_handlers, node, node_poll);
     }
     if (!QLIST_IS_INSERTED(node, node_deleted) &&
-        revents == 0 &&
+        poll_ready && revents == 0 &&
         aio_node_check(ctx, node->is_external) &&
         node->io_poll_ready) {
         node->io_poll_ready(node->opaque);
@@ -432,7 +437,7 @@ static bool run_poll_handlers_once(AioContext *ctx,
     QLIST_FOREACH_SAFE(node, &ctx->poll_aio_handlers, node_poll, tmp) {
         if (aio_node_check(ctx, node->is_external) &&
             node->io_poll(node->opaque)) {
-            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
+            aio_add_poll_ready_handler(ready_list, node);
 
             node->poll_idle_timeout = now + POLL_IDLE_INTERVAL_NS;
 
@@ -491,8 +496,7 @@ static bool remove_idle_poll_handlers(AioContext *ctx,
                  * this causes progress.
                  */
                 if (node->io_poll(node->opaque)) {
-                    aio_add_ready_handler(ready_list, node,
-                                          REVENTS_POLL_READY);
+                    aio_add_poll_ready_handler(ready_list, node);
                     progress = true;
                 }
             }
-- 
2.35.1


