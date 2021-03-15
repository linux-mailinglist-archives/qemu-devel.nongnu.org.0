Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB433AB6A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:09:03 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgPW-0002r2-Cj
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMw-00015B-1n; Mon, 15 Mar 2021 02:06:22 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:49200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMt-0004eP-O7; Mon, 15 Mar 2021 02:06:21 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8050C2E1522;
 Mon, 15 Mar 2021 09:06:17 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XNHX0MVvMQ-6HCWuf56; Mon, 15 Mar 2021 09:06:17 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788377; bh=lSf6LB0Vf7XGUeUux2+g4MvHc7uITHz4QyRCM6OV388=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=ieyk/xMiPEqsFgP0oFHKshl3eExZMz0r7KlrqF5N2jAYcTsLr+XYNh5Yv3ZJpVcLO
 WWDD7+QhDJupXLj1PEr5tpOKjvsisS+TOM+Uwf8XwI1ZhTO291YUYguL3+uf8YtOPM
 Xtvsu9cKQJgt4r2bb53/cDnKarWk00Tlj6BJPNEs=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Hn0Lu4v; Mon, 15 Mar 2021 09:06:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] block/nbd: decouple reconnect from drain
Date: Mon, 15 Mar 2021 09:06:10 +0300
Message-Id: <20210315060611.2989049-7-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
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

The reconnection logic doesn't need to stop while in a drained section.
Moreover it has to be active during the drained section, as the requests
that were caught in-flight with the connection to the server broken can
only usefully get drained if the connection is restored.  Otherwise such
requests can only either stall resulting in a deadlock (before
8c517de24a), or be aborted defeating the purpose of the reconnection
machinery (after 8c517de24a).

Since the pieces of the reconnection logic are now properly migrated
from one aio_context to another, it appears safe to just stop messing
with the drained section in the reconnection code.

Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
Fixes: 8c517de24a ("block/nbd: fix drain dead-lock because of nbd reconnect-delay")
Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 79 +++--------------------------------------------------
 1 file changed, 4 insertions(+), 75 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a3eb9b9079..a5a9e4aca5 100644
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
@@ -311,12 +309,6 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
     qemu_mutex_unlock(&thr->mutex);
 
     if (s->connection_co) {
-        /*
-         * The node is still drained, so we know the coroutine has yielded in
-         * nbd_read_eof(), the only place where bs->in_flight can reach 0, or
-         * it is entered for the first time. Both places are safe for entering
-         * the coroutine.
-         */
         qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
     }
     bdrv_dec_in_flight(bs);
@@ -344,37 +336,6 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
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
@@ -686,16 +647,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
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
     bdrv_inc_in_flight(s->bs);
 
 out:
@@ -724,26 +675,10 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
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
@@ -2548,8 +2483,6 @@ static BlockDriver bdrv_nbd = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2577,8 +2510,6 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2606,8 +2537,6 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_getlength             = nbd_getlength,
     .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
     .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
-- 
2.30.2


