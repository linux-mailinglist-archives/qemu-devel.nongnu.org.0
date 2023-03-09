Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEE6B233E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEcu-00042n-DA; Thu, 09 Mar 2023 06:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcs-00042W-I3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcq-0005Gx-Ov
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678362000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4dIHTQt2rp8GL4b0sTdeNiK8gCv2bfc0f0dlTChfQc=;
 b=b0xUred88y0TEzASpNsGldDHhXowj7F9QLVP4H2Gj7rnxm8rBrogzncasFP1NosAtLCoca
 msbYt97NKiKtK/wx4y8a0bqvJvMNyifrCxdNIZ33kK0re6XJZIly7GFQC3ht3IKINgAqqr
 HgFL/LYsx9l43UJ/5BGED5+Qr2/Yf2k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-g83GtlX4OTSFHtsqROhdlw-1; Thu, 09 Mar 2023 06:39:58 -0500
X-MC-Unique: g83GtlX4OTSFHtsqROhdlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C8221C02D4A;
 Thu,  9 Mar 2023 11:39:58 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F5E40CF8ED;
 Thu,  9 Mar 2023 11:39:57 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH nbd 3/4] nbd: Open multiple NBD connections if multi-conn is
 set
Date: Thu,  9 Mar 2023 11:39:45 +0000
Message-Id: <20230309113946.1528247-4-rjones@redhat.com>
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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

If the user opts in to multi-conn and the server advertises it, open
multiple NBD connections.  They are opened with the same parameters as
the initial connection.  Similarly on the close path the connections
are closed.

However only the zeroth connection is used, so this commit does not
actually enable multi-conn capabilities.

(XXX) The strategy here is very naive.  Firstly if you were going to
open them, you'd probably want to open them in parallel.  Secondly it
would make sense to delay opening until multiple parallel requests are
seen (perhaps above some threshold), so that simple or shortlived NBD
operations do not require multiple connections to be made.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/nbd.c | 128 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 38 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 84e8a1add0..4c99c3f865 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -124,18 +124,23 @@ static void nbd_yank(void *opaque);
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    size_t i;
 
-    nbd_client_connection_release(s->conns[0]->conn);
-    s->conns[0]->conn = NULL;
+    for (i = 0; i < MAX_MULTI_CONN; ++i) {
+        if (s->conns[i]) {
+            nbd_client_connection_release(s->conns[i]->conn);
+            s->conns[i]->conn = NULL;
+
+            /* Must not leave timers behind that would access freed data */
+            assert(!s->conns[i]->reconnect_delay_timer);
+            assert(!s->conns[i]->open_timer);
+
+            g_free(s->conns[i]);
+        }
+    }
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
-    /* Must not leave timers behind that would access freed data */
-    assert(!s->conns[0]->reconnect_delay_timer);
-    assert(!s->conns[0]->open_timer);
-
-    g_free(s->conns[0]);
-
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -1905,43 +1910,39 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     return ret;
 }
 
-static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
-                    Error **errp)
+static NBDConnState *init_conn_state(BDRVNBDState *s)
 {
+    NBDConnState *cs;
+
+    cs = g_new0(NBDConnState, 1);
+    cs->s = s;
+    qemu_mutex_init(&cs->requests_lock);
+    qemu_co_queue_init(&cs->free_sema);
+    qemu_co_mutex_init(&cs->send_mutex);
+    qemu_co_mutex_init(&cs->receive_mutex);
+
+    return cs;
+}
+
+static int conn_state_connect(BlockDriverState *bs, NBDConnState *cs,
+                              Error **errp)
+{
+    BDRVNBDState *s = cs->s;
     int ret;
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    s->bs = bs;
-
-    s->conns[0] = g_new0(NBDConnState, 1);
-    s->conns[0]->s = s;
-    qemu_mutex_init(&s->conns[0]->requests_lock);
-    qemu_co_queue_init(&s->conns[0]->free_sema);
-    qemu_co_mutex_init(&s->conns[0]->send_mutex);
-    qemu_co_mutex_init(&s->conns[0]->receive_mutex);
-
-    if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
-        return -EEXIST;
-    }
-
-    ret = nbd_process_options(bs, options, errp);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    s->conns[0]->conn =
+    cs->conn =
         nbd_client_connection_new(s->saddr, true, s->export,
                                   s->x_dirty_bitmap, s->tlscreds,
                                   s->tlshostname);
 
     if (s->open_timeout) {
-        nbd_client_connection_enable_retry(s->conns[0]->conn);
-        open_timer_init(s->conns[0], qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+        nbd_client_connection_enable_retry(cs->conn);
+        open_timer_init(cs, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
                         s->open_timeout * NANOSECONDS_PER_SECOND);
     }
 
-    s->conns[0]->state = NBD_CLIENT_CONNECTING_WAIT;
-    ret = nbd_do_establish_connection(bs, s->conns[0], true, errp);
+    cs->state = NBD_CLIENT_CONNECTING_WAIT;
+    ret = nbd_do_establish_connection(bs, cs, true, errp);
     if (ret < 0) {
         goto fail;
     }
@@ -1951,9 +1952,44 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      * Delete it, because we do not want it to be around when this node
      * is drained or closed.
      */
-    open_timer_del(s->conns[0]);
+    open_timer_del(cs);
 
-    nbd_client_connection_enable_retry(s->conns[0]->conn);
+    nbd_client_connection_enable_retry(cs->conn);
+
+    return 0;
+
+fail:
+    open_timer_del(cs);
+    return ret;
+}
+
+static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
+                    Error **errp)
+{
+    int ret;
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    size_t i;
+
+    s->bs = bs;
+
+    if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
+        return -EEXIST;
+    }
+
+    ret = nbd_process_options(bs, options, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    /*
+     * Open the first NBD connection.
+     */
+    s->conns[0] = init_conn_state(s);
+
+    ret = conn_state_connect(bs, s->conns[0], errp);
+    if (ret < 0) {
+        goto fail;
+    }
 
     /*
      * We set s->multi_conn in nbd_process_options above, but now that
@@ -1964,10 +2000,21 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         s->multi_conn = 1;
     }
 
+    /*
+     * Open remaining multi-conn NBD connections (if any).
+     */
+    for (i = 1; i < s->multi_conn; ++i) {
+        s->conns[i] = init_conn_state(s);
+
+        ret = conn_state_connect(bs, s->conns[i], errp);
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
     return 0;
 
 fail:
-    open_timer_del(s->conns[0]);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
@@ -2015,8 +2062,13 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 static void nbd_close(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    size_t i;
 
-    nbd_client_close(s->conns[0]);
+    for (i = 0; i < MAX_MULTI_CONN; ++i) {
+        if (s->conns[i]) {
+            nbd_client_close(s->conns[i]);
+        }
+    }
     nbd_clear_bdrvstate(bs);
 }
 
-- 
2.39.2


