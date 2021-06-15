Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706E3A8A80
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:57:58 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG8D-0001Q4-Il
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFys-0001xJ-9Y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyp-00012F-9i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLxngiSXkoMyw8lK/cB6aeauM/90I+KZKJ2nfxpLQSk=;
 b=UNzy6Fbd2QA1oKNIEmIIydbOsorCHDyMwZgJEKubwQQhtZMrDhHgU20cxpfrFVBpLoLLAQ
 qMntlIlVnzosNuINeKbFHr8E7vTts0ucRJrikm1oz8NtZ8/4rhn/mGhdwv86t3A5XZEO38
 YGqQzTHfPros+WUyhLicgn03ugqgLEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-IcB2MjQiNAWLSSG0IUP6WA-1; Tue, 15 Jun 2021 16:48:12 -0400
X-MC-Unique: IcB2MjQiNAWLSSG0IUP6WA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E53925211;
 Tue, 15 Jun 2021 20:48:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 684EA5D9CA;
 Tue, 15 Jun 2021 20:48:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/34] block/nbd: ensure ->connection_thread is always valid
Date: Tue, 15 Jun 2021 15:47:31 -0500
Message-Id: <20210615204756.281505-10-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Roman Kagan <rvkagan@yandex-team.ru>

Simplify lifetime management of BDRVNBDState->connect_thread by
delaying the possible cleanup of it until the BDRVNBDState itself goes
away.

This also reverts
 0267101af6 "block/nbd: fix possible use after free of s->connect_thread"
as now s->connect_thread can't be cleared until the very end.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
 [vsementsov: rebase, revert 0267101af6 changes]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 [eblake: tweak comment]
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-8-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 56 ++++++++++++++++++++---------------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1c99654ef7e5..08ae47d83c07 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -144,17 +144,31 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;

+static void nbd_free_connect_thread(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
-                                               bool detach);
+static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);

 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnectThread *thr = s->connect_thread;
+    bool thr_running;
+
+    qemu_mutex_lock(&thr->mutex);
+    thr_running = thr->state == CONNECT_THREAD_RUNNING;
+    if (thr_running) {
+        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+    }
+    qemu_mutex_unlock(&thr->mutex);
+
+    /* the runaway thread will clean up itself */
+    if (!thr_running) {
+        nbd_free_connect_thread(thr);
+    }

     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));

@@ -295,7 +309,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);

-    nbd_co_establish_connection_cancel(bs, false);
+    nbd_co_establish_connection_cancel(bs);

     reconnect_delay_timer_del(s);

@@ -333,7 +347,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(bs, true);
+        nbd_co_establish_connection_cancel(bs);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -446,11 +460,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;

-    if (!thr) {
-        /* detached */
-        return -1;
-    }
-
     qemu_mutex_lock(&thr->mutex);

     switch (thr->state) {
@@ -494,12 +503,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();

-    if (!s->connect_thread) {
-        /* detached */
-        return -1;
-    }
-    assert(thr == s->connect_thread);
-
     qemu_mutex_lock(&thr->mutex);

     switch (thr->state) {
@@ -547,18 +550,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
  * nbd_co_establish_connection_cancel
  * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
  * allow drained section to begin.
- *
- * If detach is true, also cleanup the state (or if thread is running, move it
- * to CONNECT_THREAD_RUNNING_DETACHED state). s->connect_thread becomes NULL if
- * detach is true.
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
-                                               bool detach)
+static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
     bool wake = false;
-    bool do_free = false;

     qemu_mutex_lock(&thr->mutex);

@@ -569,21 +566,10 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
             s->wait_connect = false;
             wake = true;
         }
-        if (detach) {
-            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
-            s->connect_thread = NULL;
-        }
-    } else if (detach) {
-        do_free = true;
     }

     qemu_mutex_unlock(&thr->mutex);

-    if (do_free) {
-        nbd_free_connect_thread(thr);
-        s->connect_thread = NULL;
-    }
-
     if (wake) {
         aio_co_wake(s->connection_co);
     }
@@ -2310,6 +2296,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }

+    nbd_init_connect_thread(s);
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
@@ -2326,8 +2314,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;

-    nbd_init_connect_thread(s);
-
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
-- 
2.31.1


