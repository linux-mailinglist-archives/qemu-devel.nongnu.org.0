Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B42398B47
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:01:25 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRQy-0001S5-O0
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCg-0002Yn-II
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCe-0007Uo-7u
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLFHWJbTkHtI9zWWTquem6lLwku6QK5+Q5XDeWp4x3Q=;
 b=ZOojZxJjJ2S+ZdsX4XapcjPKvtvwYwwpUz2+7Mc6YGFmNpf1Pz5v3aoDw2WTkSRYn9m0rE
 aGFLtAjKlgpS+22g8plkdoC6OIuvMZaiZ9tX6HjeRWstlwrZDsQD1R4a2Vr2/tithrWFRu
 xZ1pssCm4YpoXyir8OwvcvetUOonHPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-FsgVFW8gMNSAJERj63XaYg-1; Wed, 02 Jun 2021 09:46:33 -0400
X-MC-Unique: FsgVFW8gMNSAJERj63XaYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17D191DB7E;
 Wed,  2 Jun 2021 13:45:55 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC67560BD9;
 Wed,  2 Jun 2021 13:45:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/20] nbd/server: Use drained block ops to quiesce the server
Date: Wed,  2 Jun 2021 15:45:26 +0200
Message-Id: <20210602134529.231756-18-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Before switching between AioContexts we need to make sure that we're
fully quiesced ("nb_requests == 0" for every client) when entering the
drained section.

To do this, we set "quiescing = true" for every client on
".drained_begin" to prevent new coroutines from being created, and
check if "nb_requests == 0" on ".drained_poll". Finally, once we're
exiting the drained section, on ".drained_end" we set "quiescing =
false" and call "nbd_client_receive_next_request()" to resume the
processing of new requests.

With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
reverted to be as simple as they were before f148ae7d36.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20210602060552.17433-3-slp@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 nbd/server.c | 82 ++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 86a44a9b41..b60ebc3ab6 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1513,6 +1513,11 @@ static void nbd_request_put(NBDRequestData *req)
     g_free(req);
 
     client->nb_requests--;
+
+    if (client->quiescing && client->nb_requests == 0) {
+        aio_wait_kick();
+    }
+
     nbd_client_receive_next_request(client);
 
     nbd_client_put(client);
@@ -1530,49 +1535,68 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
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
 
-    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
+    QTAILQ_FOREACH(client, &exp->clients, next) {
+        if (client->nb_requests != 0) {
+            /*
+             * If there's a coroutine waiting for a request on nbd_read_eof()
+             * enter it here so we don't depend on the client to wake it up.
+             */
+            if (client->recv_coroutine != NULL && client->read_yielding) {
+                qemu_aio_coroutine_enter(exp->common.ctx,
+                                         client->recv_coroutine);
+            }
 
-    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
+            return true;
+        }
+    }
 
-    exp->common.ctx = NULL;
+    return false;
 }
 
 static void nbd_eject_notifier(Notifier *n, void *data)
@@ -1594,6 +1618,12 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
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
@@ -1715,8 +1745,17 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
 
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
@@ -1788,6 +1827,7 @@ static void nbd_export_delete(BlockExport *blk_exp)
         }
         blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
                                         blk_aio_detach, exp);
+        blk_set_disable_request_queuing(exp->common.blk, false);
     }
 
     for (i = 0; i < exp->nr_export_bitmaps; i++) {
-- 
2.30.2


