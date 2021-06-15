Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28273A8A9E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:07:04 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGH1-0002Dj-Jh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyz-0002Pf-4t
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyw-000186-RR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uh9cBHhUyG1PktDZmCD1K73GPQPiY9MUtvcCA3NkEk=;
 b=hvIZcxFmtWyEEpGIaW3naacI1UZVP4+IjNY7eq3ZiIRVna4VZ2TarbEMnv6oa6HB0PeadF
 xS2qi++1wxH5W/o7B0BSvbBGjQBAzsnvNebjKjJiHru2nl8K2xwbumkoDrH7W0hmgb6K0O
 7SGuUWu1CZ4unLdrEg5y5pXPp5iJL3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-rpEqD-pBMqaZDlrPT5m7Ig-1; Tue, 15 Jun 2021 16:48:20 -0400
X-MC-Unique: rpEqD-pBMqaZDlrPT5m7Ig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21F28030CF;
 Tue, 15 Jun 2021 20:48:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 697D55D9CA;
 Tue, 15 Jun 2021 20:48:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/34] block/nbd: make nbd_co_establish_connection_cancel()
 bs-independent
Date: Tue, 15 Jun 2021 15:47:37 -0500
Message-Id: <20210615204756.281505-16-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

nbd_co_establish_connection_cancel() actually needs only pointer to
NBDConnectThread. So, make it clean.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-14-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 15b569a899fd..bee615e5c4c1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -132,7 +132,7 @@ static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
 nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);

@@ -295,7 +295,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);

-    nbd_co_establish_connection_cancel(bs);
+    nbd_co_establish_connection_cancel(s->connect_thread);

     reconnect_delay_timer_del(s);

@@ -333,7 +333,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(bs);
+        nbd_co_establish_connection_cancel(s->connect_thread);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -488,13 +488,14 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)

 /*
  * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
- * allow drained section to begin.
+ * Cancel nbd_co_establish_connection() asynchronously.
+ *
+ * Note that this function neither directly stops the thread nor closes the
+ * socket, but rather safely wakes nbd_co_establish_connection() which is
+ * sleeping in yield()
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
 {
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
     Coroutine *wait_co;

     qemu_mutex_lock(&thr->mutex);
-- 
2.31.1


