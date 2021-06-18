Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52B3AD136
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:34:38 +0200 (CEST)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIO5-0007qH-VH
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luIMO-0006Jq-Cd
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luIMM-0003jM-Eo
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624037569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULGTgZ8Mukg1mQ67QJJxsLXD2pBp/1Rk7boMisUYdk0=;
 b=MmjO0Hyc9/+Z+wtYW5Y546kGmleOmR4aqvuNNr27p8DdoHDeIbvz1/wex4I4X4YgWm3XJo
 507qGXahELl5W/8JG2c6w5dsfNjK8AtwP3VAnZQMC+cvSLy3z7vf6hO2BxmaKS1Bm1FuVO
 QXlDBSB/jw0iOC7ph7+gdA4wM2h9QXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-gdHqEmGWOsax6SuobHOpaQ-1; Fri, 18 Jun 2021 13:32:47 -0400
X-MC-Unique: gdHqEmGWOsax6SuobHOpaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2CEC1835AC4;
 Fri, 18 Jun 2021 17:32:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33AE45C225;
 Fri, 18 Jun 2021 17:32:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/34] nbd/client-connection: return only one io channel
Date: Fri, 18 Jun 2021 12:31:54 -0500
Message-Id: <20210618173200.596368-29-eblake@redhat.com>
In-Reply-To: <20210618173200.596368-1-eblake@redhat.com>
References: <20210618173200.596368-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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

block/nbd doesn't need underlying sioc channel anymore. So, we can
update nbd/client-connection interface to return only one top-most io
channel, which is more straight forward.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-27-vsementsov@virtuozzo.com>
[eblake: squash in Vladimir's fixes for uninit usage caught by clang]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |  4 ++--
 block/nbd.c             | 13 ++-----------
 nbd/client-connection.c | 36 ++++++++++++++++++++++++++++--------
 3 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5bb54d831c8a..10c8a0bcca80 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -418,9 +418,9 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                QCryptoTLSCreds *tlscreds);
 void nbd_client_connection_release(NBDClientConnection *conn);

-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp);
+                            Error **errp);

 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);

diff --git a/block/nbd.c b/block/nbd.c
index 9f193d130bcd..411435c1559e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -360,7 +360,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
-    QIOChannelSocket *sioc;

     if (!nbd_client_connecting(s)) {
         return;
@@ -399,20 +398,12 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
-    if (!sioc) {
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
+    if (!s->ioc) {
         ret = -ECONNREFUSED;
         goto out;
     }

-    if (s->ioc) {
-        /* sioc is referenced by s->ioc */
-        object_unref(OBJECT(sioc));
-    } else {
-        s->ioc = QIO_CHANNEL(sioc);
-    }
-    sioc = NULL;
-
     qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
     qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 883f9cf158cb..955edafb7ca4 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -272,15 +272,14 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
  * include/block/nbd.h).
  */
-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp)
+                            Error **errp)
 {
     QemuThread thread;

     if (conn->do_negotiation) {
         assert(info);
-        assert(ioc);
     }

     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
@@ -294,10 +293,19 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
                 if (conn->do_negotiation) {
-                    *ioc = g_steal_pointer(&conn->ioc);
                     memcpy(info, &conn->updated_info, sizeof(*info));
+                    if (conn->ioc) {
+                        /* TLS channel now has own reference to parent */
+                        object_unref(OBJECT(conn->sioc));
+                        conn->sioc = NULL;
+
+                        return g_steal_pointer(&conn->ioc);
+                    }
                 }
-                return g_steal_pointer(&conn->sioc);
+
+                assert(!conn->ioc);
+
+                return QIO_CHANNEL(g_steal_pointer(&conn->sioc));
             }

             conn->running = true;
@@ -329,11 +337,23 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
-            if (conn->sioc && conn->do_negotiation) {
-                *ioc = g_steal_pointer(&conn->ioc);
+            if (!conn->sioc) {
+                return NULL;
+            }
+            if (conn->do_negotiation) {
                 memcpy(info, &conn->updated_info, sizeof(*info));
+                if (conn->ioc) {
+                    /* TLS channel now has own reference to parent */
+                    object_unref(OBJECT(conn->sioc));
+                    conn->sioc = NULL;
+
+                    return g_steal_pointer(&conn->ioc);
+                }
             }
-            return g_steal_pointer(&conn->sioc);
+
+            assert(!conn->ioc);
+
+            return QIO_CHANNEL(g_steal_pointer(&conn->sioc));
         }
     }

-- 
2.31.1


