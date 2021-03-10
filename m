Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7A3338EB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:37:16 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvHH-0004OL-Dz
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lJvD0-0000XS-GH; Wed, 10 Mar 2021 04:32:50 -0500
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:59506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lJvCv-0000AT-Hd; Wed, 10 Mar 2021 04:32:49 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 311032E1555;
 Wed, 10 Mar 2021 12:32:34 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HnJ4JUYbfD-WXKOJaJ9; Wed, 10 Mar 2021 12:32:34 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615368754; bh=s/3/5VPscsbTLxqh5HxRk6YBz0RzzaiKwDqRLCVEq/U=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=JuhvsN+j7eUQwnJe3nVMoXwYepH3gy1doIobW67nhRLYK99lpYCzahZlFbT0vv778
 L2dvlVFSTQWLoFzxHBdjrrpFH7sglfLgcFkeg/9SdB3Cq1ZLbQdAGiXM+nDLjN0Xkr
 7YchAkiQcrYYctABCXMAuR+r1osCuo4+TOIksCQU=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:7210::1:12])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ynDaBzDdI0-WXnGafVq; Wed, 10 Mar 2021 12:32:33 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [RFC] nbd: decouple reconnect from drain
Date: Wed, 10 Mar 2021 12:32:32 +0300
Message-Id: <20210310093232.519585-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBD connect coroutine takes an extra in_flight reference as if it's a
request handler.  This prevents drain from completion until the
connection coroutine is releases the reference.

When NBD is configured to reconnect, however, this appears to be fatal
to the reconnection idea: the drain procedure wants the reconnection to
be suspended, but this is only possible if the in-flight requests are
canceled.

Fix this by making the connection coroutine stop messing with the
in-flight counter.  Instead, certain care is taken to properly move the
reconnection stuff from one aio_context to another in
.bdrv_{attach,detach}_aio_context callbacks.

Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
This patch passes the regular make check but fails some extra iotests,
in particular 277.  It obviously lacks more robust interaction with the
connection thread (which in general is fairly complex and hard to reason
about), and perhaps has some other drawbacks, so I'll work on this
further, but I'd appreciate some feedback on whether the idea is sound.

 block/nbd.c  | 134 ++++++++++++++++-----------------------------------
 nbd/client.c |   2 -
 2 files changed, 41 insertions(+), 95 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..5319e543ab 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -117,8 +117,6 @@ typedef struct BDRVNBDState {
     Coroutine *connection_co;
     Coroutine *teardown_co;
     QemuCoSleepState *connection_co_sleep_ns_state;
-    bool drained;
-    bool wait_drained_end;
     int in_flight;
     NBDClientState state;
     int connect_status;
@@ -126,6 +124,7 @@ typedef struct BDRVNBDState {
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
+    int64_t reconnect_expire_time_ns;
 
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
@@ -165,6 +164,18 @@ static void nbd_clear_bdrvstate(BDRVNBDState *s)
     s->x_dirty_bitmap = NULL;
 }
 
+static bool nbd_client_connecting(BDRVNBDState *s)
+{
+    NBDClientState state = qatomic_load_acquire(&s->state);
+    return state == NBD_CLIENT_CONNECTING_WAIT ||
+        state == NBD_CLIENT_CONNECTING_NOWAIT;
+}
+
+static bool nbd_client_connecting_wait(BDRVNBDState *s)
+{
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
@@ -217,10 +228,6 @@ static void reconnect_delay_timer_cb(void *opaque)
 
 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 {
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
-        return;
-    }
-
     assert(!s->reconnect_delay_timer);
     s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
                                              QEMU_CLOCK_REALTIME,
@@ -233,8 +240,20 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    /* Timer is deleted in nbd_client_co_drain_begin() */
-    assert(!s->reconnect_delay_timer);
+    /*
+     * This runs in the (old, about to be detached) aio context of the @bs so
+     * accessing the stuff on @s is concurrency-free.
+     */
+    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
+
+    /*
+     * Preserve the expiration time of the reconnect_delay_timer in order to
+     * resume it on the new aio context.
+     */
+    s->reconnect_expire_time_ns = s->reconnect_delay_timer ?
+        timer_expire_time_ns(s->reconnect_delay_timer) : -1;
+    reconnect_delay_timer_del(s);
+
     /*
      * If reconnect is in progress we may have no ->ioc.  It will be
      * re-instantiated in the proper aio context once the connection is
@@ -250,6 +269,16 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
+    /*
+     * This runs in the (new, just attached) aio context of the @bs so
+     * accessing the stuff on @s is concurrency-free.
+     */
+    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
+
+    if (nbd_client_connecting_wait(s) && s->reconnect_expire_time_ns >= 0) {
+        reconnect_delay_timer_init(s, s->reconnect_expire_time_ns);
+    }
+
     if (s->connection_co) {
         /*
          * The node is still drained, so we know the coroutine has yielded in
@@ -259,7 +288,6 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
          */
         qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
     }
-    bdrv_dec_in_flight(bs);
 }
 
 static void nbd_client_attach_aio_context(BlockDriverState *bs,
@@ -275,7 +303,6 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }
 
-    bdrv_inc_in_flight(bs);
 
     /*
      * Need to wait here for the BH to run because the BH must run while the
@@ -284,37 +311,6 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
     aio_wait_bh_oneshot(new_context, nbd_client_attach_aio_context_bh, bs);
 }
 
-static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = true;
-    if (s->connection_co_sleep_ns_state) {
-        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
-    }
-
-    nbd_co_establish_connection_cancel(bs, false);
-
-    reconnect_delay_timer_del(s);
-
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
-    }
-}
-
-static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = false;
-    if (s->wait_drained_end) {
-        s->wait_drained_end = false;
-        aio_co_wake(s->connection_co);
-    }
-}
-
-
 static void nbd_teardown_connection(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
@@ -346,18 +342,6 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     assert(!s->connection_co);
 }
 
-static bool nbd_client_connecting(BDRVNBDState *s)
-{
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
-}
-
-static bool nbd_client_connecting_wait(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
-}
-
 static void connect_bh(void *opaque)
 {
     BDRVNBDState *state = opaque;
@@ -624,21 +608,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         goto out;
     }
 
-    bdrv_dec_in_flight(s->bs);
 
     ret = nbd_client_handshake(s->bs, &local_err);
 
-    if (s->drained) {
-        s->wait_drained_end = true;
-        while (s->drained) {
-            /*
-             * We may be entered once from nbd_client_attach_aio_context_bh
-             * and then from nbd_client_co_drain_end. So here is a loop.
-             */
-            qemu_coroutine_yield();
-        }
-    }
-    bdrv_inc_in_flight(s->bs);
 
 out:
     s->connect_status = ret;
@@ -666,26 +638,10 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
     nbd_reconnect_attempt(s);
 
     while (nbd_client_connecting(s)) {
-        if (s->drained) {
-            bdrv_dec_in_flight(s->bs);
-            s->wait_drained_end = true;
-            while (s->drained) {
-                /*
-                 * We may be entered once from nbd_client_attach_aio_context_bh
-                 * and then from nbd_client_co_drain_end. So here is a loop.
-                 */
-                qemu_coroutine_yield();
-            }
-            bdrv_inc_in_flight(s->bs);
-        } else {
-            qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, timeout,
-                                      &s->connection_co_sleep_ns_state);
-            if (s->drained) {
-                continue;
-            }
-            if (timeout < max_timeout) {
-                timeout *= 2;
-            }
+        qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, timeout,
+                                  &s->connection_co_sleep_ns_state);
+        if (timeout < max_timeout) {
+            timeout *= 2;
         }
 
         nbd_reconnect_attempt(s);
@@ -766,7 +722,6 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
 
     qemu_co_queue_restart_all(&s->free_sema);
     nbd_recv_coroutines_wake_all(s);
-    bdrv_dec_in_flight(s->bs);
 
     s->connection_co = NULL;
     if (s->ioc) {
@@ -2314,7 +2269,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     nbd_init_connect_thread(s);
 
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
-    bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
     return 0;
@@ -2490,8 +2444,6 @@ static BlockDriver bdrv_nbd = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2519,8 +2471,6 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2548,8 +2498,6 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
diff --git a/nbd/client.c b/nbd/client.c
index 0c2db4bcba..30d5383cb1 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1434,9 +1434,7 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,
 
         len = qio_channel_readv(ioc, &iov, 1, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
-            bdrv_dec_in_flight(bs);
             qio_channel_yield(ioc, G_IO_IN);
-            bdrv_inc_in_flight(bs);
             continue;
         } else if (len < 0) {
             return -EIO;
-- 
2.29.2


