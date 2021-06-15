Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3A3A8A79
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:54:33 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG4u-0004ak-Dv
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyy-0002Mb-JB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyv-00015x-F9
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zhs7WliC/s9wT00d6baGraMoKIff72akb6ljKk4x0Ig=;
 b=aYg4u4yHFMrdPlRBQlwuJJYSmwhAu0Lltgw5xAkVXUfGTpPOtJuvnNXR1321iGEmFjpRlK
 x1+610sgeQ7qr6M1acKQoHW4QJdICBd/mYEeqtjTxS6HlyBfM+htR0iEgUJuxfPylx68Eu
 VclOzeaB7nkNn5oeb2T/CAS1Y1izu3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-z01qVJQlNyeDbGF0UiNsYg-1; Tue, 15 Jun 2021 16:48:19 -0400
X-MC-Unique: z01qVJQlNyeDbGF0UiNsYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BB58100C620;
 Tue, 15 Jun 2021 20:48:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36245D9CA;
 Tue, 15 Jun 2021 20:48:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/34] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
Date: Tue, 15 Jun 2021 15:47:36 -0500
Message-Id: <20210615204756.281505-15-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to split connection code to a separate file. Now we are
ready to give nbd_co_establish_connection() clean and bs-independent
interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-13-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 50 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f2d5b47026a3..15b569a899fd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -130,7 +130,8 @@ typedef struct BDRVNBDState {
 static void nbd_free_connect_thread(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
@@ -416,22 +417,37 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }

-static int coroutine_fn
-nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
+/*
+ * Get a new connection in context of @thr:
+ *   if the thread is running, wait for completion
+ *   if the thread already succeeded in the background, and user didn't get the
+ *     result, just return it now
+ *   otherwise the thread is not running, so start a thread and wait for
+ *     completion
+ */
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 {
+    QIOChannelSocket *sioc = NULL;
     QemuThread thread;
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
-
-    assert(!s->sioc);

     qemu_mutex_lock(&thr->mutex);

+    /*
+     * Don't call nbd_co_establish_connection() in several coroutines in
+     * parallel. Only one call at once is supported.
+     */
+    assert(!thr->wait_co);
+
     if (!thr->running) {
         if (thr->sioc) {
             /* Previous attempt finally succeeded in background */
-            goto out;
+            sioc = g_steal_pointer(&thr->sioc);
+            qemu_mutex_unlock(&thr->mutex);
+
+            return sioc;
         }
+
         thr->running = true;
         error_free(thr->err);
         thr->err = NULL;
@@ -445,13 +461,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)

     /*
      * We are going to wait for connect-thread finish, but
-     * nbd_client_co_drain_begin() can interrupt.
+     * nbd_co_establish_connection_cancel() can interrupt.
      */
     qemu_coroutine_yield();

     qemu_mutex_lock(&thr->mutex);

-out:
     if (thr->running) {
         /*
          * The connection attempt was canceled and the coroutine resumed
@@ -463,17 +478,12 @@ out:
     } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        if (s->sioc) {
-            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                   nbd_yank, bs);
-        }
+        sioc = g_steal_pointer(&thr->sioc);
     }

     qemu_mutex_unlock(&thr->mutex);

-    return s->sioc ? 0 : -1;
+    return sioc;
 }

 /*
@@ -541,11 +551,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
+    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }

+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           s->bs);
+
     bdrv_dec_in_flight(s->bs);

     ret = nbd_client_handshake(s->bs, NULL);
-- 
2.31.1


