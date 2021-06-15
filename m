Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4203A8AA0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:07:59 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGHt-00040K-ND
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzC-0002yE-Hl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001Ec-BO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otXHFzyadtHeroBDsWABx3X+6dlJWcr4p+G+V5rD7sk=;
 b=b0arqWEKR6959n7AG28W0SFPsAeQZ9KH2Fdf8uiJ2sP1vo/7cIUG31gevP2G3HqQWZULPY
 agJGSdgKcobr3pMVgyEum5XtYFWqa5r8yLpkg+3H3o+xiEhTOA2KlRGQbbVZIjjpTbOfhm
 Ef+XDKD6eabFYDZGalGUkLG8PMXheKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-dYlH8bbXNrq_9BZGK-b6gQ-1; Tue, 15 Jun 2021 16:48:29 -0400
X-MC-Unique: dYlH8bbXNrq_9BZGK-b6gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A0C7107ACF6;
 Tue, 15 Jun 2021 20:48:28 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD9B45D9CA;
 Tue, 15 Jun 2021 20:48:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/34] block/nbd: use negotiation of NBDClientConnection
Date: Tue, 15 Jun 2021 15:47:47 -0500
Message-Id: <20210615204756.281505-26-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now that we can opt in to negotiation as part of the client connection
thread, use that to simplify connection_co.  This is another step on
the way to moving all reconnect code into NBDClientConnection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-24-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 240c6e1b3d72..311471644487 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -362,6 +362,7 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
+    AioContext *aio_context = bdrv_get_aio_context(s->bs);

     if (!nbd_client_connecting(s)) {
         return;
@@ -402,30 +403,44 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }

+    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
+    if (s->ioc) {
+        qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
+        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
+    } else {
+        s->ioc = QIO_CHANNEL(s->sioc);
+        object_ref(OBJECT(s->ioc));
+    }
+
     yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
                            s->bs);

-    bdrv_dec_in_flight(s->bs);
+    ret = nbd_handle_updated_info(s->bs, NULL);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };

-    ret = nbd_client_handshake(s->bs, NULL);
+        nbd_send_request(s->ioc, &request);

-    if (s->drained) {
-        s->wait_drained_end = true;
-        while (s->drained) {
-            /*
-             * We may be entered once from nbd_client_attach_aio_context_bh
-             * and then from nbd_client_co_drain_end. So here is a loop.
-             */
-            qemu_coroutine_yield();
-        }
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
+        object_unref(OBJECT(s->sioc));
+        s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return;
     }
-    bdrv_inc_in_flight(s->bs);

 out:
     if (ret >= 0) {
@@ -2051,7 +2066,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }

-    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
+    s->conn = nbd_client_connection_new(s->saddr, true, s->export,
+                                        s->x_dirty_bitmap, s->tlscreds);

     /*
      * establish TCP connection, return error if it fails
-- 
2.31.1


