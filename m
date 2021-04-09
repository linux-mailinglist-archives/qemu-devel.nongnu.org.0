Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D76635A2BD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:12:36 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtkJ-0002KN-AU
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUtcV-0001n0-Bo; Fri, 09 Apr 2021 12:04:31 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:52858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUtcF-0006Ig-6S; Fri, 09 Apr 2021 12:04:31 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5A1892E1AA8;
 Fri,  9 Apr 2021 19:04:09 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 mdBZILfQ2X-490KlTwQ; Fri, 09 Apr 2021 19:04:09 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617984249; bh=CAE/t9u5Q78GmpaAw3gIOVLp+C2NgXWIkRKdb2x0B8o=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=lXnYUOVGcIhnD03GPjSfEOVEA8Xfy/2Kfko0U8eoB6Oj8hNWPdwl7XOrcJ0rYLUbs
 W50zCv8O3rVONZwIpzEwToYdDZXSxSitP/FGMeXW6MeWy7P+r6fxSZkZCtYoaRqP+U
 WbQ9wYz0Hh/rsV3qujlUPeXixzTU+rJ71WmngsHg=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 QZcMcvrvJz-48oSrJU4; Fri, 09 Apr 2021 19:04:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] block/nbd: ensure ->connection_thread is always
 valid
Date: Fri,  9 Apr 2021 19:04:06 +0300
Message-Id: <20210409160406.1800272-3-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify lifetime management of BDRVNBDState->connection_thread by
delaying the possible cleanup of it until the BDRVNBDState itself goes
away.

This also fixes possible use-after-free in nbd_co_establish_connection
when it races with nbd_co_establish_connection_cancel.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
This is a more future-proof version of the fix for use-after-free but
less intrusive than Vladimir's series so that it can go in 6.0.

 block/nbd.c | 58 ++++++++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index d86df3afcb..6e3879c0c5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -144,16 +144,31 @@ typedef struct BDRVNBDState {
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
 
 static void nbd_clear_bdrvstate(BDRVNBDState *s)
 {
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
+    /* the runaway thread will clean it up itself */
+    if (!thr_running) {
+        nbd_free_connect_thread(thr);
+    }
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -293,7 +308,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(bs, false);
+    nbd_co_establish_connection_cancel(bs);
 
     reconnect_delay_timer_del(s);
 
@@ -333,7 +348,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(bs, true);
+        nbd_co_establish_connection_cancel(bs);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -534,18 +549,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
 
@@ -556,21 +565,10 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
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
@@ -2294,31 +2292,33 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         return -EEXIST;
     }
 
+    nbd_init_connect_thread(s);
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
     if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        return -ECONNREFUSED;
+        ret = -ECONNREFUSED;
+        goto fail;
     }
 
     ret = nbd_client_handshake(bs, errp);
     if (ret < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        nbd_clear_bdrvstate(s);
-        return ret;
+        goto fail;
     }
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
 
-    nbd_init_connect_thread(s);
-
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
     return 0;
+fail:
+    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
+    nbd_clear_bdrvstate(s);
+    return ret;
 }
 
 static int nbd_co_flush(BlockDriverState *bs)
-- 
2.30.2


