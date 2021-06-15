Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6F3A8A90
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:04:13 +0200 (CEST)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGEG-0004lq-1z
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyx-0002Hu-6R
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyu-00015Z-Pl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnoAj/nEtKG/XNToof+6cgt1XTN3w6Q5uG8xvQhE1oc=;
 b=Q90VOlZazypSumAdmT4B9oNH/WmD/XUvaW+UhpTm+IGcj+t5317tiRG5q/LQVOL0hGFz7A
 TWMCuIOGL0xh6AHTPHOeAZWAVzy6vKc6VZOJwBmePt6hFoaEA563uVcj//22Vpj9cxoO8g
 sE6kkEntAvE0hXELCHVVxiTzwiwOv0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-JeO1yeX4M-etTCMyCbJq4Q-1; Tue, 15 Jun 2021 16:48:18 -0400
X-MC-Unique: JeO1yeX4M-etTCMyCbJq4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847F280ED91;
 Tue, 15 Jun 2021 20:48:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21CFE5D9CA;
 Tue, 15 Jun 2021 20:48:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/34] block/nbd: drop thr->state
Date: Tue, 15 Jun 2021 15:47:35 -0500
Message-Id: <20210615204756.281505-14-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We don't need all these states. The code refactored to use two boolean
variables looks simpler.

While moving the comment in nbd_co_establish_connection() rework it to
give better information. Also, we are going to move the connection code
to separate file and mentioning drained section would be confusing.

Improve also the comment in NBDConnectThread, while dropping removed
state names from it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-12-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: comment tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 148 +++++++++++++++++-----------------------------------
 1 file changed, 49 insertions(+), 99 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 653af629408d..f2d5b47026a3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,38 +66,25 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;

-typedef enum NBDConnectThreadState {
-    /* No thread, no pending results */
-    CONNECT_THREAD_NONE,
-
-    /* Thread is running, no results for now */
-    CONNECT_THREAD_RUNNING,
-
-    /*
-     * Thread is running, but requestor exited. Thread should close
-     * the new socket and free the connect state on exit.
-     */
-    CONNECT_THREAD_RUNNING_DETACHED,
-
-    /* Thread finished, results are stored in a state */
-    CONNECT_THREAD_FAIL,
-    CONNECT_THREAD_SUCCESS
-} NBDConnectThreadState;
-
 typedef struct NBDConnectThread {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */

-    /*
-     * Result of last attempt. Valid in FAIL and SUCCESS states.
-     * If you want to steal error, don't forget to set pointer to NULL.
-     */
-    QIOChannelSocket *sioc;
-    Error *err;
-
     QemuMutex mutex;
-    /* All further fields are protected by mutex */
-    NBDConnectThreadState state; /* current state of the thread */
+
+    /*
+     * @sioc and @err represent a connection attempt.  While running
+     * is true, they are only used by the connection thread, and mutex
+     * locking is not needed.  Once the thread finishes,
+     * nbd_co_establish_connection then steals these pointers while
+     * under the mutex.
+     */
+    QIOChannelSocket *sioc;
+    Error *err;
+
+    /* All further fields are accessed only under mutex */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */

     /*
      * wait_co: if non-NULL, which coroutine to wake in
@@ -152,17 +139,19 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool thr_running;
+    bool do_free = false;

     qemu_mutex_lock(&thr->mutex);
-    thr_running = thr->state == CONNECT_THREAD_RUNNING;
-    if (thr_running) {
-        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+    assert(!thr->detached);
+    if (thr->running) {
+        thr->detached = true;
+    } else {
+        do_free = true;
     }
     qemu_mutex_unlock(&thr->mutex);

     /* the runaway thread will clean up itself */
-    if (!thr_running) {
+    if (do_free) {
         nbd_free_connect_thread(thr);
     }

@@ -374,7 +363,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)

     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
-        .state = CONNECT_THREAD_NONE,
     };

     qemu_mutex_init(&s->connect_thread->mutex);
@@ -395,7 +383,7 @@ static void *connect_thread_func(void *opaque)
 {
     NBDConnectThread *thr = opaque;
     int ret;
-    bool do_free = false;
+    bool do_free;

     thr->sioc = qio_channel_socket_new();

@@ -411,20 +399,13 @@ static void *connect_thread_func(void *opaque)

     qemu_mutex_lock(&thr->mutex);

-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->wait_co) {
-            aio_co_wake(thr->wait_co);
-            thr->wait_co = NULL;
-        }
-        break;
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        do_free = true;
-        break;
-    default:
-        abort();
+    assert(thr->running);
+    thr->running = false;
+    if (thr->wait_co) {
+        aio_co_wake(thr->wait_co);
+        thr->wait_co = NULL;
     }
+    do_free = thr->detached;

     qemu_mutex_unlock(&thr->mutex);

@@ -438,36 +419,24 @@ static void *connect_thread_func(void *opaque)
 static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 {
-    int ret;
     QemuThread thread;
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;

+    assert(!s->sioc);
+
     qemu_mutex_lock(&thr->mutex);

-    switch (thr->state) {
-    case CONNECT_THREAD_FAIL:
-    case CONNECT_THREAD_NONE:
+    if (!thr->running) {
+        if (thr->sioc) {
+            /* Previous attempt finally succeeded in background */
+            goto out;
+        }
+        thr->running = true;
         error_free(thr->err);
         thr->err = NULL;
-        thr->state = CONNECT_THREAD_RUNNING;
         qemu_thread_create(&thread, "nbd-connect",
                            connect_thread_func, thr, QEMU_THREAD_DETACHED);
-        break;
-    case CONNECT_THREAD_SUCCESS:
-        /* Previous attempt finally succeeded in background */
-        thr->state = CONNECT_THREAD_NONE;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                               nbd_yank, bs);
-        qemu_mutex_unlock(&thr->mutex);
-        return 0;
-    case CONNECT_THREAD_RUNNING:
-        /* Already running, will wait */
-        break;
-    default:
-        abort();
     }

     thr->wait_co = qemu_coroutine_self();
@@ -482,10 +451,16 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)

     qemu_mutex_lock(&thr->mutex);

-    switch (thr->state) {
-    case CONNECT_THREAD_SUCCESS:
-    case CONNECT_THREAD_FAIL:
-        thr->state = CONNECT_THREAD_NONE;
+out:
+    if (thr->running) {
+        /*
+         * The connection attempt was canceled and the coroutine resumed
+         * before the connection thread finished its job.  Report the
+         * attempt as failed, but leave the connection thread running,
+         * to reuse it for the next connection attempt.
+         */
+        error_setg(errp, "Connection attempt cancelled by other operation");
+    } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
         s->sioc = thr->sioc;
@@ -494,33 +469,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
             yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                    nbd_yank, bs);
         }
-        ret = (s->sioc ? 0 : -1);
-        break;
-    case CONNECT_THREAD_RUNNING:
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        ret = -1;
-        error_setg(errp, "Connection attempt cancelled by other operation");
-        break;
-
-    case CONNECT_THREAD_NONE:
-        /*
-         * Impossible. We've seen this thread running. So it should be
-         * running or at least give some results.
-         */
-        abort();
-
-    default:
-        abort();
     }

     qemu_mutex_unlock(&thr->mutex);

-    return ret;
+    return s->sioc ? 0 : -1;
 }

 /*
@@ -532,14 +485,11 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    Coroutine *wait_co = NULL;
+    Coroutine *wait_co;

     qemu_mutex_lock(&thr->mutex);

-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        wait_co = g_steal_pointer(&thr->wait_co);
-    }
+    wait_co = g_steal_pointer(&thr->wait_co);

     qemu_mutex_unlock(&thr->mutex);

-- 
2.31.1


