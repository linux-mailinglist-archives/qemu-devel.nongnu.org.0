Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4D33AB6F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:11:38 +0100 (CET)
Received: from localhost ([::1]:43428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgS0-0006XY-OI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMx-00017Q-Dt; Mon, 15 Mar 2021 02:06:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:47560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMs-0004cY-6w; Mon, 15 Mar 2021 02:06:23 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id A8B1F2E14C4;
 Mon, 15 Mar 2021 09:06:14 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 zPBywE1Vnh-6EYOjHpB; Mon, 15 Mar 2021 09:06:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788374; bh=xl3BXy0Fo1E+ViyIcbQolDDdibk1njkqm+tk2h+xMyE=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=xnMLTJAEIsaH8JA8pJqpKp6/1WtodjAVMZLujd7DzRoVtbTgnq7WksAi1UXWTOFpz
 7HcTTZajiQ+wkkAYdzTFuSYpNfYSBSnek7sO95E91Dx1tuS+7EmR5k4FYvpI2konu+
 AlEDGK98moa8A2q1bUXmfqkYQ5LvLU66FPP5H8KM=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Dn01PpF; Mon, 15 Mar 2021 09:06:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] block/nbd: use uniformly nbd_client_connecting_wait
Date: Mon, 15 Mar 2021 09:06:06 +0300
Message-Id: <20210315060611.2989049-3-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Use nbd_client_connecting_wait uniformly all over the block/nbd.c.

While at this, drop the redundant check for nbd_client_connecting_wait
in reconnect_delay_timer_init, as all its callsites do this check too.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 447d176b76..1d8edb5b21 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -165,6 +165,18 @@ static void nbd_clear_bdrvstate(BDRVNBDState *s)
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
@@ -205,7 +217,7 @@ static void reconnect_delay_timer_cb(void *opaque)
 {
     BDRVNBDState *s = opaque;
 
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
+    if (nbd_client_connecting_wait(s)) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         while (qemu_co_enter_next(&s->free_sema, NULL)) {
             /* Resume all queued requests */
@@ -217,10 +229,6 @@ static void reconnect_delay_timer_cb(void *opaque)
 
 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 {
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
-        return;
-    }
-
     assert(!s->reconnect_delay_timer);
     s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
                                              QEMU_CLOCK_REALTIME,
@@ -346,18 +354,6 @@ static void nbd_teardown_connection(BlockDriverState *bs)
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
@@ -667,7 +663,7 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
     uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
     uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
 
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
+    if (nbd_client_connecting_wait(s)) {
         reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
                                    s->reconnect_delay * NANOSECONDS_PER_SECOND);
     }
@@ -2473,7 +2469,7 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
 
     reconnect_delay_timer_del(s);
 
-    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+    if (nbd_client_connecting_wait(s)) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         qemu_co_queue_restart_all(&s->free_sema);
     }
-- 
2.30.2


