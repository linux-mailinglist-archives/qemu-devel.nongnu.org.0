Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80750396D1A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 08:00:57 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnxSS-0004YG-KQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 02:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPP-0008Ae-L8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPN-00023i-Ex
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622527064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/O6nN7HyWGO9hGQpiIgOSJ/l5K5+rWXv4rWS9qdlYJI=;
 b=YcHMISx7fSfJbgjv+aETbkfqVgMiBH5WIGZiuxAl/ee5bI+mLQE9wUkL3y40EQ1fx6ISPx
 6aqk292vXNnc66jzxu8lVmg6DEW/7NngTqM3QOe89aH1k4Pe+t40uQxHREkJ8+SsQQDf9p
 7/Ngy1DuyfkWPPPx8Lw8r4u0PmSqvck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-rXbLyQ_aPX--9izAQt0OTA-1; Tue, 01 Jun 2021 01:57:42 -0400
X-MC-Unique: rXbLyQ_aPX--9izAQt0OTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82D5800D55;
 Tue,  1 Jun 2021 05:57:41 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1208369FA4;
 Tue,  1 Jun 2021 05:57:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the server
Date: Tue,  1 Jun 2021 07:57:28 +0200
Message-Id: <20210601055728.90849-3-slp@redhat.com>
In-Reply-To: <20210601055728.90849-1-slp@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before switching between AioContexts we need to make sure that we're
fully quiesced ("nb_requests == 0" for every client) when entering the
drained section.

To do this, we set "quiescing = true" for every client on
".drained_begin" to prevent new coroutines to be created, and check if
"nb_requests == 0" on ".drained_poll". Finally, once we're exiting the
drained section, on ".drained_end" we set "quiescing = false" and
call "nbd_client_receive_next_request()" to resume the processing of
new requests.

With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
reverted to be as simple as they were before f148ae7d36.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 nbd/server.c | 99 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 75 insertions(+), 24 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 86a44a9b41..33e55479d7 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -132,7 +132,7 @@ struct NBDClient {
     CoMutex send_lock;
     Coroutine *send_coroutine;
 
-    bool read_yielding;
+    GSList *yield_co_list; /* List of coroutines yielding on nbd_read_eof */
     bool quiescing;
 
     QTAILQ_ENTRY(NBDClient) next;
@@ -1367,6 +1367,7 @@ static inline int coroutine_fn
 nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
 {
     bool partial = false;
+    Coroutine *co;
 
     assert(size);
     while (size > 0) {
@@ -1375,9 +1376,12 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
 
         len = qio_channel_readv(client->ioc, &iov, 1, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
-            client->read_yielding = true;
+            co = qemu_coroutine_self();
+
+            client->yield_co_list = g_slist_prepend(client->yield_co_list, co);
             qio_channel_yield(client->ioc, G_IO_IN);
-            client->read_yielding = false;
+            client->yield_co_list = g_slist_remove(client->yield_co_list, co);
+
             if (client->quiescing) {
                 return -EAGAIN;
             }
@@ -1513,6 +1517,11 @@ static void nbd_request_put(NBDRequestData *req)
     g_free(req);
 
     client->nb_requests--;
+
+    if (client->quiescing && client->nb_requests == 0) {
+        aio_wait_kick();
+    }
+
     nbd_client_receive_next_request(client);
 
     nbd_client_put(client);
@@ -1530,49 +1539,75 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
     QTAILQ_FOREACH(client, &exp->clients, next) {
         qio_channel_attach_aio_context(client->ioc, ctx);
 
+        assert(client->nb_requests == 0);
         assert(client->recv_coroutine == NULL);
         assert(client->send_coroutine == NULL);
-
-        if (client->quiescing) {
-            client->quiescing = false;
-            nbd_client_receive_next_request(client);
-        }
     }
 }
 
-static void nbd_aio_detach_bh(void *opaque)
+static void blk_aio_detach(void *opaque)
 {
     NBDExport *exp = opaque;
     NBDClient *client;
 
+    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
+
     QTAILQ_FOREACH(client, &exp->clients, next) {
         qio_channel_detach_aio_context(client->ioc);
+    }
+
+    exp->common.ctx = NULL;
+}
+
+static void nbd_drained_begin(void *opaque)
+{
+    NBDExport *exp = opaque;
+    NBDClient *client;
+
+    QTAILQ_FOREACH(client, &exp->clients, next) {
         client->quiescing = true;
+    }
+}
 
-        if (client->recv_coroutine) {
-            if (client->read_yielding) {
-                qemu_aio_coroutine_enter(exp->common.ctx,
-                                         client->recv_coroutine);
-            } else {
-                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
-            }
-        }
+static void nbd_drained_end(void *opaque)
+{
+    NBDExport *exp = opaque;
+    NBDClient *client;
 
-        if (client->send_coroutine) {
-            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
-        }
+    QTAILQ_FOREACH(client, &exp->clients, next) {
+        client->quiescing = false;
+        nbd_client_receive_next_request(client);
     }
 }
 
-static void blk_aio_detach(void *opaque)
+static bool nbd_drained_poll(void *opaque)
 {
     NBDExport *exp = opaque;
+    NBDClient *client;
+    Coroutine *co;
+    GSList *entry;
+    GSList *coroutine_list;
 
-    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
+    QTAILQ_FOREACH(client, &exp->clients, next) {
+        if (client->nb_requests != 0) {
+            /*
+             * Enter coroutines waiting for new requests on nbd_read_eof(), so
+             * we don't depend on the client to wake us up.
+             */
+            coroutine_list = g_slist_copy(client->yield_co_list);
+            for (entry = coroutine_list;
+                 entry != NULL;
+                 entry = g_slist_next(entry)) {
+                co = entry->data;
+                qemu_aio_coroutine_enter(exp->common.ctx, co);
+            }
+            g_slist_free(coroutine_list);
 
-    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
+            return 1;
+        }
+    }
 
-    exp->common.ctx = NULL;
+    return 0;
 }
 
 static void nbd_eject_notifier(Notifier *n, void *data)
@@ -1594,6 +1629,12 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
     blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
 }
 
+static const BlockDevOps nbd_block_ops = {
+    .drained_begin = nbd_drained_begin,
+    .drained_end = nbd_drained_end,
+    .drained_poll = nbd_drained_poll,
+};
+
 static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
                              Error **errp)
 {
@@ -1715,8 +1756,17 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
 
     exp->allocation_depth = arg->allocation_depth;
 
+    /*
+     * We need to inhibit request queuing in the block layer to ensure we can
+     * be properly quiesced when entering a drained section, as our coroutines
+     * servicing pending requests might enter blk_pread().
+     */
+    blk_set_disable_request_queuing(blk, true);
+
     blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
 
+    blk_set_dev_ops(blk, &nbd_block_ops, exp);
+
     QTAILQ_INSERT_TAIL(&exports, exp, next);
 
     return 0;
@@ -1788,6 +1838,7 @@ static void nbd_export_delete(BlockExport *blk_exp)
         }
         blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
                                         blk_aio_detach, exp);
+        blk_set_disable_request_queuing(exp->common.blk, false);
     }
 
     for (i = 0; i < exp->nr_export_bitmaps; i++) {
-- 
2.26.2


