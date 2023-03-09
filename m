Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234C6B2341
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEcw-00044H-Jm; Thu, 09 Mar 2023 06:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcu-000434-3t
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcs-0005HK-1M
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678362001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHD+LpsAMPSAM74dci7d5XP4xo8SJC4qIIV26M0o5a4=;
 b=WRXbFk1X0GdDCiYLrI0r5lHQ7BRpCfqlUmoqcPegegoLc6JywKfeplEFgiNArPE0DglupJ
 w6jN5L5P2pXgX1yCFxTgjAfXclhyzqCYDrLUcmDf2V/MsvllFglA4WgFwa5Ahif65+Mv7i
 nXA29YAsasT8EZD2PpWbXdnvKEY4l6I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ou9KMIRcMI20mPC9F3JrZQ-1; Thu, 09 Mar 2023 06:39:59 -0500
X-MC-Unique: ou9KMIRcMI20mPC9F3JrZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78E0C1C02D48;
 Thu,  9 Mar 2023 11:39:59 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 906CF40B40E4;
 Thu,  9 Mar 2023 11:39:58 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH nbd 4/4] nbd: Enable multi-conn using round-robin
Date: Thu,  9 Mar 2023 11:39:46 +0000
Message-Id: <20230309113946.1528247-5-rjones@redhat.com>
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Enable NBD multi-conn by spreading operations across multiple
connections.

(XXX) This uses a naive round-robin approach which could be improved.
For example we could look at how many requests are in flight and
assign operations to the connections with fewest.  Or we could try to
estimate (based on size of requests outstanding) the load on each
connection.  But this implementation doesn't do any of that.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/nbd.c | 67 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 4c99c3f865..df32ba67ed 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1232,6 +1232,26 @@ static int coroutine_fn nbd_co_request(NBDConnState *cs, NBDRequest *request,
     return ret ? ret : request_ret;
 }
 
+/*
+ * If multi-conn, choose a connection for this operation.
+ */
+static NBDConnState *choose_connection(BDRVNBDState *s)
+{
+    static size_t next;
+    size_t i;
+
+    if (s->multi_conn <= 1) {
+        return s->conns[0];
+    }
+
+    /* XXX Stupid simple round robin. */
+    i = qatomic_fetch_inc(&next);
+    i %= s->multi_conn;
+
+    assert(s->conns[i] != NULL);
+    return s->conns[i];
+}
+
 static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
                                              int64_t bytes, QEMUIOVector *qiov,
                                              BdrvRequestFlags flags)
@@ -1244,7 +1264,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
         .from = offset,
         .len = bytes,
     };
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     assert(bytes <= NBD_MAX_BUFFER_SIZE);
 
@@ -1301,7 +1321,7 @@ static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offs
         .from = offset,
         .len = bytes,
     };
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     assert(!(cs->info.flags & NBD_FLAG_READ_ONLY));
     if (flags & BDRV_REQ_FUA) {
@@ -1326,7 +1346,7 @@ static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_
         .from = offset,
         .len = bytes,  /* .len is uint32_t actually */
     };
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     assert(bytes <= UINT32_MAX); /* rely on max_pwrite_zeroes */
 
@@ -1357,7 +1377,13 @@ static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_FLUSH };
-    NBDConnState * const cs = s->conns[0];
+
+    /*
+     * Multi-conn (if used) guarantees that flushing on any connection
+     * flushes caches on all connections, so we can perform this
+     * operation on any.
+     */
+    NBDConnState * const cs = choose_connection(s);
 
     if (!(cs->info.flags & NBD_FLAG_SEND_FLUSH)) {
         return 0;
@@ -1378,7 +1404,7 @@ static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t off
         .from = offset,
         .len = bytes, /* len is uint32_t */
     };
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
 
@@ -1398,7 +1424,7 @@ static int coroutine_fn nbd_client_co_block_status(
     NBDExtent extent = { 0 };
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     NBDRequest request = {
         .type = NBD_CMD_BLOCK_STATUS,
@@ -2027,7 +2053,7 @@ static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
 static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
     uint32_t min = cs->info.min_block;
     uint32_t max = MIN_NON_ZERO(NBD_MAX_BUFFER_SIZE, cs->info.max_block);
 
@@ -2085,7 +2111,7 @@ static int coroutine_fn nbd_co_truncate(BlockDriverState *bs, int64_t offset,
                                         BdrvRequestFlags flags, Error **errp)
 {
     BDRVNBDState *s = bs->opaque;
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     if (offset != cs->info.size && exact) {
         error_setg(errp, "Cannot resize NBD nodes");
@@ -2168,24 +2194,29 @@ static const char *const nbd_strong_runtime_opts[] = {
 static void nbd_cancel_in_flight(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDConnState * const cs = s->conns[0];
+    size_t i;
+    NBDConnState *cs;
 
-    reconnect_delay_timer_del(cs);
+    for (i = 0; i < MAX_MULTI_CONN; ++i) {
+        cs = s->conns[i];
 
-    qemu_mutex_lock(&cs->requests_lock);
-    if (cs->state == NBD_CLIENT_CONNECTING_WAIT) {
-        cs->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        reconnect_delay_timer_del(cs);
+
+        qemu_mutex_lock(&cs->requests_lock);
+        if (cs->state == NBD_CLIENT_CONNECTING_WAIT) {
+            cs->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        }
+        qemu_mutex_unlock(&cs->requests_lock);
+
+        nbd_co_establish_connection_cancel(cs->conn);
     }
-    qemu_mutex_unlock(&cs->requests_lock);
-
-    nbd_co_establish_connection_cancel(cs->conn);
 }
 
 static void nbd_attach_aio_context(BlockDriverState *bs,
                                    AioContext *new_context)
 {
     BDRVNBDState *s = bs->opaque;
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     /* The open_timer is used only during nbd_open() */
     assert(!cs->open_timer);
@@ -2209,7 +2240,7 @@ static void nbd_attach_aio_context(BlockDriverState *bs,
 static void nbd_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
-    NBDConnState * const cs = s->conns[0];
+    NBDConnState * const cs = choose_connection(s);
 
     assert(!cs->open_timer);
     assert(!cs->reconnect_delay_timer);
-- 
2.39.2


