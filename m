Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E109133AB72
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:12:44 +0100 (CET)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgT5-0000ee-Mv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMv-000157-VZ; Mon, 15 Mar 2021 02:06:22 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMs-0004dp-CB; Mon, 15 Mar 2021 02:06:21 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 3A18F2E1531;
 Mon, 15 Mar 2021 09:06:16 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 K2ojkeT6qu-6FCaW8gS; Mon, 15 Mar 2021 09:06:16 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788376; bh=8puCtjf702zr06rnz2Glwa8au2gwVRWqa0tN3lwDyDc=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=DbAMWUgKGYFaZombMp8I62TLUmPmEt7IulepZYMoJzr6DivmI+FfEQnKqwHjiNEQj
 yztuZ6VfZ2NLPLAfBsC5k3Rm9zXS+LF9+EoXb+E7Q2Q0/Z/Er+HeA52JF1sNpaVsTc
 pTsp1hz1MqvrUyAPbMlKOPaBmt/X5EMuUGew1CKA=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Fn0HVJ9; Mon, 15 Mar 2021 09:06:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] block/nbd: transfer reconnection stuff across aio_context
 switch
Date: Mon, 15 Mar 2021 09:06:08 +0300
Message-Id: <20210315060611.2989049-5-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

Make varios pieces of reconnection logic correctly survive the
transition of the BDRVNBDState from one aio_context to another.  In
particular,

- cancel the reconnect_delay_timer and rearm it in the new context;
- cancel the sleep of the connection_co between reconnect attempt so
  that it continues in the new context;
- prevent the connection thread from delivering its status to the old
  context, and retartget it to the new context on attach.

None of these is needed at the moment because the aio_context switch
happens within a drained section and that effectively terminates the
reconnection logic on entry and starts it over on exit.  However, this
patch paves the way to keeping the reconnection process active across
the drained section (in a followup patch).

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 658b827d24..a6d713ba58 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -126,6 +126,7 @@ typedef struct BDRVNBDState {
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
+    int64_t reconnect_expire_time_ns;
 
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
@@ -240,6 +241,7 @@ static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 static void nbd_client_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnectThread *thr = s->connect_thread;
 
     /*
      * This runs in the (old, about to be detached) aio context of the @bs so
@@ -247,8 +249,31 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
      */
     assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
 
-    /* Timer is deleted in nbd_client_co_drain_begin() */
-    assert(!s->reconnect_delay_timer);
+    /*
+     * Make sure the connection thread doesn't try to deliver its status to the
+     * old context.
+     */
+    qemu_mutex_lock(&thr->mutex);
+    thr->bh_ctx = NULL;
+    qemu_mutex_unlock(&thr->mutex);
+
+    /*
+     * Preserve the expiration time of the reconnect_delay_timer in order to
+     * resume it on the new aio context.
+     */
+    s->reconnect_expire_time_ns = s->reconnect_delay_timer ?
+        timer_expire_time_ns(s->reconnect_delay_timer) : -1;
+    reconnect_delay_timer_del(s);
+
+    /*
+     * If the connection coroutine was sleeping between reconnect attempts,
+     * wake it up now and let it continue the process in the new aio context.
+     * This will distort the exponential back-off but that's probably ok.
+     */
+    if (s->connection_co_sleep_ns_state) {
+        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
+    }
+
     /*
      * If reconnect is in progress we may have no ->ioc.  It will be
      * re-instantiated in the proper aio context once the connection is
@@ -263,6 +288,7 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
 {
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnectThread *thr = s->connect_thread;
 
     /*
      * This runs in the (new, just attached) aio context of the @bs so
@@ -270,6 +296,20 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
      */
     assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
 
+    if (nbd_client_connecting_wait(s) && s->reconnect_expire_time_ns >= 0) {
+        reconnect_delay_timer_init(s, s->reconnect_expire_time_ns);
+    }
+
+    /*
+     * If the connection thread hasn't completed connecting yet, make sure it
+     * can deliver its status in the new context.
+     */
+    qemu_mutex_lock(&thr->mutex);
+    if (thr->state == CONNECT_THREAD_RUNNING) {
+        thr->bh_ctx = qemu_get_current_aio_context();
+    }
+    qemu_mutex_unlock(&thr->mutex);
+
     if (s->connection_co) {
         /*
          * The node is still drained, so we know the coroutine has yielded in
-- 
2.30.2


