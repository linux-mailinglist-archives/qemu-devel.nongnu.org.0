Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E53A8ABC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:10:17 +0200 (CEST)
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGK8-0001ac-Nb
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzH-0003EO-1D
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001FL-TX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7l0HnqUP75YyQpyHHpODAXaw6TqXMN5/iCEhnn2PUg=;
 b=WmfrCBFdd0UXzgZgJXpq5zaB9A49GxF3sGwVJOP4WFx7nphqDsRzyx1TgwEvWehzZ2Iewo
 u+U8yQzikuRmDJ01yBO9UHNhqcUwFQN8/a5KD5FLYodc9+eUn38u76cRZtLBEv6iaSEPJs
 gLULnEFchKfoD3qbGOiT5S0Oisqcb6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-oKjZu9JaMdyiluWyjZfeSg-1; Tue, 15 Jun 2021 16:48:32 -0400
X-MC-Unique: oKjZu9JaMdyiluWyjZfeSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5486680ED9D;
 Tue, 15 Jun 2021 20:48:31 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E275D9CA;
 Tue, 15 Jun 2021 20:48:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/34] block/nbd: split nbd_co_do_establish_connection out of
 nbd_reconnect_attempt
Date: Tue, 15 Jun 2021 15:47:52 -0500
Message-Id: <20210615204756.281505-31-eblake@redhat.com>
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

Split out the part that we want to reuse for nbd_open().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-29-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 82 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 411435c1559e..8caeafc8d351 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -356,11 +356,50 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }

+static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
+                                                       Error **errp)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    int ret;
+
+    assert(!s->ioc);
+
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, errp);
+    if (!s->ioc) {
+        return -ECONNREFUSED;
+    }
+
+    ret = nbd_handle_updated_info(s->bs, NULL);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };
+
+        nbd_send_request(s->ioc, &request);
+
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return ret;
+    }
+
+    qio_channel_set_blocking(s->ioc, false, NULL);
+    qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
+
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           bs);
+
+    /* successfully connected */
+    s->state = NBD_CLIENT_CONNECTED;
+    qemu_co_queue_restart_all(&s->free_sema);
+
+    return 0;
+}
+
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    int ret;
-    AioContext *aio_context = bdrv_get_aio_context(s->bs);
-
     if (!nbd_client_connecting(s)) {
         return;
     }
@@ -398,42 +437,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
-    if (!s->ioc) {
-        ret = -ECONNREFUSED;
-        goto out;
-    }
-
-    qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
-
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
-                           s->bs);
-
-    ret = nbd_handle_updated_info(s->bs, NULL);
-    if (ret < 0) {
-        /*
-         * We have connected, but must fail for other reasons.
-         * Send NBD_CMD_DISC as a courtesy to the server.
-         */
-        NBDRequest request = { .type = NBD_CMD_DISC };
-
-        nbd_send_request(s->ioc, &request);
-
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-
-        return;
-    }
-
-out:
-    if (ret >= 0) {
-        /* successfully connected */
-        s->state = NBD_CLIENT_CONNECTED;
-        qemu_co_queue_restart_all(&s->free_sema);
-    }
+    nbd_co_do_establish_connection(s->bs, NULL);
 }

 static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
-- 
2.31.1


