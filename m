Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B573A8A74
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:51:13 +0200 (CEST)
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG1g-0006Hx-Fy
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyu-00026n-DE
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyr-00013K-C3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qw15AXj1YNaf+iLy2ksTn4Zvh/VDMB0WF+Nxw4PTbk=;
 b=fDb5OtPMn2dtXVU0Ru1vmDxFUP+qplzBUzYGkb75Py1UH87bjlv0zq/qEDtMlGsRCrVxsO
 KfaCGvfr5+E/2Y5M5LXoil1OFBQB5rqZFIWTV2mH3CjTYx/ituOut3PoOufu5+YNfTPUIF
 1eVrE/iSLftciwkKI7NpdXePFGwZFfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-cBJXQwFONKKXbCXgIvY21Q-1; Tue, 15 Jun 2021 16:48:15 -0400
X-MC-Unique: cBJXQwFONKKXbCXgIvY21Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9FB100C618;
 Tue, 15 Jun 2021 20:48:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8051E5D9CA;
 Tue, 15 Jun 2021 20:48:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/34] block/nbd: simplify waking of
 nbd_co_establish_connection()
Date: Tue, 15 Jun 2021 15:47:34 -0500
Message-Id: <20210615204756.281505-13-eblake@redhat.com>
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

Instead of managing connect_bh, bh_ctx, and wait_connect fields, we
can use a single link to the waiting coroutine with proper mutex
protection.

So new logic is:

nbd_co_establish_connection() sets wait_co under the mutex, releases
the mutex, then yield()s.  Note that wait_co may be scheduled by the
thread immediately after unlocking the mutex.  Still, the main thread
(or iothread) will not reach the code for entering the coroutine until
the yield(), so we are safe.

connect_thread_func() and nbd_co_establish_connection_cancel() do
the following to handle wait_co:

Under the mutex, if thr->wait_co is not NULL, make it NULL and
schedule it. This way, we avoid scheduling the coroutine twice.

Still scheduling is a bit different:

In connect_thread_func() we can just call aio_co_wake under mutex,
after commit
   [async: the main AioContext is only "current" if under the BQL]
we are sure that aio_co_wake() will not try to acquire the aio context
and do qemu_aio_coroutine_enter() but simply schedule the coroutine by
aio_co_schedule().

nbd_co_establish_connection_cancel() will be called from non-coroutine
context in further patch and will be able to go through
qemu_aio_coroutine_enter() path of aio_co_wake(). So keep current
behavior of waking the coroutine after the critical section.

Also, this commit reduces the dependence of
nbd_co_establish_connection() on the internals of bs (we now use a
generic pointer to the coroutine, instead of direct use of
s->connection_co).  This is a step towards splitting the connection
API out of nbd.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-11-vsementsov@virtuozzo.com>
Reviewied-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 55 +++++++++++++++--------------------------------------
 1 file changed, 15 insertions(+), 40 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index fdfb1ff7a158..653af629408d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -87,12 +87,6 @@ typedef enum NBDConnectThreadState {
 typedef struct NBDConnectThread {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
-    /*
-     * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
-     * NULL
-     */
-    QEMUBHFunc *bh_func;
-    void *bh_opaque;

     /*
      * Result of last attempt. Valid in FAIL and SUCCESS states.
@@ -101,10 +95,15 @@ typedef struct NBDConnectThread {
     QIOChannelSocket *sioc;
     Error *err;

-    /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
+    /* All further fields are protected by mutex */
     NBDConnectThreadState state; /* current state of the thread */
-    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
+
+    /*
+     * wait_co: if non-NULL, which coroutine to wake in
+     * nbd_co_establish_connection() after yield()
+     */
+    Coroutine *wait_co;
 } NBDConnectThread;

 typedef struct BDRVNBDState {
@@ -138,7 +137,6 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;

-    bool wait_connect;
     NBDConnectThread *connect_thread;
 } BDRVNBDState;

@@ -370,15 +368,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }

-static void connect_bh(void *opaque)
-{
-    BDRVNBDState *state = opaque;
-
-    assert(state->wait_connect);
-    state->wait_connect = false;
-    aio_co_wake(state->connection_co);
-}
-
 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
     s->connect_thread = g_new(NBDConnectThread, 1);
@@ -386,8 +375,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
-        .bh_func = connect_bh,
-        .bh_opaque = s,
     };

     qemu_mutex_init(&s->connect_thread->mutex);
@@ -427,11 +414,9 @@ static void *connect_thread_func(void *opaque)
     switch (thr->state) {
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
-
-            /* play safe, don't reuse bh_ctx on further connection attempts */
-            thr->bh_ctx = NULL;
+        if (thr->wait_co) {
+            aio_co_wake(thr->wait_co);
+            thr->wait_co = NULL;
         }
         break;
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -485,20 +470,14 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
         abort();
     }

-    thr->bh_ctx = qemu_get_current_aio_context();
+    thr->wait_co = qemu_coroutine_self();

     qemu_mutex_unlock(&thr->mutex);

-
     /*
      * We are going to wait for connect-thread finish, but
      * nbd_client_co_drain_begin() can interrupt.
-     *
-     * Note that wait_connect variable is not visible for connect-thread. It
-     * doesn't need mutex protection, it used only inside home aio context of
-     * bs.
      */
-    s->wait_connect = true;
     qemu_coroutine_yield();

     qemu_mutex_lock(&thr->mutex);
@@ -553,23 +532,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool wake = false;
+    Coroutine *wait_co = NULL;

     qemu_mutex_lock(&thr->mutex);

     if (thr->state == CONNECT_THREAD_RUNNING) {
         /* We can cancel only in running state, when bh is not yet scheduled */
-        thr->bh_ctx = NULL;
-        if (s->wait_connect) {
-            s->wait_connect = false;
-            wake = true;
-        }
+        wait_co = g_steal_pointer(&thr->wait_co);
     }

     qemu_mutex_unlock(&thr->mutex);

-    if (wake) {
-        aio_co_wake(s->connection_co);
+    if (wait_co) {
+        aio_co_wake(wait_co);
     }
 }

-- 
2.31.1


