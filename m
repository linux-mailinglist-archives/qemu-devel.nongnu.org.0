Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705A510A6A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:27:31 +0200 (CEST)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRmU-0004iP-LF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRax-0008N4-2D
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRat-0007jL-JP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWch65AAn5FCUVVxi7O5NhviMDz1oKCf0ABoHZW7fLo=;
 b=a4dMAxH1Ql0QvCDOp1DVxz+KMdyt/dL9d5x9I3Ll5GJQCLJU1AjaqyK6h3Q87E/fNIGbK3
 grPh+pddl/UZsgXsZKkI43GfsM8YHfcaFaoqeG7nIqXsJvPoReVR+dxCjRUiwBMwK9x7+Q
 mFj7pLrX9PhHoqoVXs7c0iL6wDJrzAw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-wWsY7k_VN6OGu7zJ4mDFbw-1; Tue, 26 Apr 2022 16:15:27 -0400
X-MC-Unique: wWsY7k_VN6OGu7zJ4mDFbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D61299E777;
 Tue, 26 Apr 2022 20:15:27 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59DD3556200;
 Tue, 26 Apr 2022 20:15:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] nbd: move s->state under requests_lock
Date: Tue, 26 Apr 2022 15:15:11 -0500
Message-Id: <20220426201514.170410-11-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Remove the confusing, and most likely wrong, atomics.  The only function
that used to be somewhat in a hot path was nbd_client_connected(),
but it is not anymore after the previous patches.

The same logic is used both to check if a request had to be reissued
and also in nbd_reconnecting_attempt().  The former cases are outside
requests_lock, while nbd_reconnecting_attempt() does have the lock,
therefore the two have been separated in the previous commit.
nbd_client_will_reconnect() can simply take s->requests_lock, while
nbd_reconnecting_attempt() can inline the access now that no
complicated atomics are involved.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-8-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 76 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3cba874b1cf5..a5c690cef76b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -35,7 +35,6 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
-#include "qemu/atomic.h"

 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qmp/qstring.h"
@@ -72,10 +71,11 @@ typedef struct BDRVNBDState {
     NBDExportInfo info;

     /*
-     * Protects free_sema, in_flight, requests[].coroutine,
+     * Protects state, free_sema, in_flight, requests[].coroutine,
      * reconnect_delay_timer.
      */
     QemuMutex requests_lock;
+    NBDClientState state;
     CoQueue free_sema;
     int in_flight;
     NBDClientRequest requests[MAX_NBD_REQUESTS];
@@ -83,7 +83,6 @@ typedef struct BDRVNBDState {

     CoMutex send_mutex;
     CoMutex receive_mutex;
-    NBDClientState state;

     QEMUTimer *open_timer;

@@ -132,11 +131,6 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }

-static bool nbd_client_connected(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
-}
-
 static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
@@ -159,14 +153,15 @@ static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
     }
 }

-static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
+/* Called with s->requests_lock held.  */
+static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
 {
-    if (nbd_client_connected(s)) {
+    if (s->state == NBD_CLIENT_CONNECTED) {
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
     }

     if (ret == -EIO) {
-        if (nbd_client_connected(s)) {
+        if (s->state == NBD_CLIENT_CONNECTED) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
@@ -177,6 +172,12 @@ static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
     nbd_recv_coroutines_wake(s, true);
 }

+static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
+{
+    QEMU_LOCK_GUARD(&s->requests_lock);
+    nbd_channel_error_locked(s, ret);
+}
+
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
@@ -189,20 +190,18 @@ static void reconnect_delay_timer_cb(void *opaque)
 {
     BDRVNBDState *s = opaque;

-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
+    reconnect_delay_timer_del(s);
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        if (s->state != NBD_CLIENT_CONNECTING_WAIT) {
+            return;
+        }
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        nbd_co_establish_connection_cancel(s->conn);
     }
-
-    reconnect_delay_timer_del(s);
+    nbd_co_establish_connection_cancel(s->conn);
 }

 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 {
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
-        return;
-    }
-
     assert(!s->reconnect_delay_timer);
     s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
                                              QEMU_CLOCK_REALTIME,
@@ -225,7 +224,9 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         s->ioc = NULL;
     }

-    s->state = NBD_CLIENT_QUIT;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_QUIT;
+    }
 }

 static void open_timer_del(BDRVNBDState *s)
@@ -254,15 +255,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->open_timer, expire_time_ns);
 }

-static bool nbd_client_connecting_wait(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
-}
-
 static bool nbd_client_will_reconnect(BDRVNBDState *s)
 {
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+    /*
+     * Called only after a socket error, so this is not performance sensitive.
+     */
+    QEMU_LOCK_GUARD(&s->requests_lock);
+    return s->state == NBD_CLIENT_CONNECTING_WAIT;
 }
+
 /*
  * Update @bs with information learned during a completed negotiation process.
  * Return failure if the server's advertised options are incompatible with the
@@ -347,22 +348,24 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));

     /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_CONNECTED;
+    }

     return 0;
 }

+/* Called with s->requests_lock held.  */
 static bool nbd_client_connecting(BDRVNBDState *s)
 {
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
+    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
+        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
 }

 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    bool blocking = nbd_client_connecting_wait(s);
+    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;

     /*
      * Now we are sure that nobody is accessing the channel, and no one will
@@ -477,17 +480,17 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,

     qemu_mutex_lock(&s->requests_lock);
     while (s->in_flight == MAX_NBD_REQUESTS ||
-           (!nbd_client_connected(s) && s->in_flight > 0)) {
+           (s->state != NBD_CLIENT_CONNECTED && s->in_flight > 0)) {
         qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
     }

     s->in_flight++;
-    if (!nbd_client_connected(s)) {
+    if (s->state != NBD_CLIENT_CONNECTED) {
         if (nbd_client_connecting(s)) {
             nbd_reconnect_attempt(s);
             qemu_co_queue_restart_all(&s->free_sema);
         }
-        if (!nbd_client_connected(s)) {
+        if (s->state != NBD_CLIENT_CONNECTED) {
             rc = -EIO;
             goto err;
         }
@@ -530,7 +533,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (rc < 0) {
         qemu_mutex_lock(&s->requests_lock);
 err:
-        nbd_channel_error(s, rc);
+        nbd_channel_error_locked(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
         }
@@ -1443,8 +1446,9 @@ static void nbd_yank(void *opaque)
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

-    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
+    QEMU_LOCK_GUARD(&s->requests_lock);
     qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    s->state = NBD_CLIENT_QUIT;
 }

 static void nbd_client_close(BlockDriverState *bs)
-- 
2.35.1


