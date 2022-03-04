Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DFC4CDD61
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:40:27 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDms-0006lZ-BR
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:40:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjD-0002qm-FS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjB-0004JM-5d
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjzMWKvkstPJ2CUK+5o5zVRJIR46gKG045r/c21Hmhk=;
 b=LjFMUfBRzUlDdZlEqW8ofJ7dltY9d282qkgDpV3Vr0qJQg6ysyY7zpfgIp9/DBTyX5R9EW
 3Gc8+CA0Gi9emHhl9CT6xNWI5ZkNQsmPAN8/YFNU+33fjuKKCKuw8j6QyShfTorKYDc6RQ
 /A6TgV8WBkXAqSLztAjeALxHwchXQbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-4nFKdfDzOV653TcS2pduAw-1; Fri, 04 Mar 2022 14:36:31 -0500
X-MC-Unique: 4nFKdfDzOV653TcS2pduAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D29F180A08B;
 Fri,  4 Mar 2022 19:36:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A99BF5DF21;
 Fri,  4 Mar 2022 19:36:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] block: pass desired TLS hostname through from block
 driver client
Date: Fri,  4 Mar 2022 19:36:00 +0000
Message-Id: <20220304193610.3293146-3-berrange@redhat.com>
In-Reply-To: <20220304193610.3293146-1-berrange@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In

  commit a71d597b989fd701b923f09b3c20ac4fcaa55e81
  Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Date:   Thu Jun 10 13:08:00 2021 +0300

    block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()

the use of the 'hostname' field from the BDRVNBDState struct was
lost, and 'nbd_connect' just hardcoded it to match the IP socket
address. This was a harmless bug at the time since we block use
with anything other than IP sockets.

Shortly though, we want to allow the caller to override the hostname
used in the TLS certificate checks. This is to allow for TLS
when doing port forwarding or tunneling. Thus we need to reinstate
the passing along of the 'hostname'.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/nbd.c             |  7 ++++---
 include/block/nbd.h     |  3 ++-
 nbd/client-connection.c | 12 +++++++++---
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5853d85d60..dd43929207 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -92,7 +92,7 @@ typedef struct BDRVNBDState {
     SocketAddress *saddr;
     char *export, *tlscredsid;
     QCryptoTLSCreds *tlscreds;
-    const char *hostname;
+    const char *tlshostname;
     char *x_dirty_bitmap;
     bool alloc_depth;
 
@@ -1835,7 +1835,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
             error_setg(errp, "TLS only supported over IP sockets");
             goto error;
         }
-        s->hostname = s->saddr->u.inet.host;
+        s->tlshostname = s->saddr->u.inet.host;
     }
 
     s->x_dirty_bitmap = g_strdup(qemu_opt_get(opts, "x-dirty-bitmap"));
@@ -1875,7 +1875,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->conn = nbd_client_connection_new(s->saddr, true, s->export,
-                                        s->x_dirty_bitmap, s->tlscreds);
+                                        s->x_dirty_bitmap, s->tlscreds,
+                                        s->tlshostname);
 
     if (s->open_timeout) {
         nbd_client_connection_enable_retry(s->conn);
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b774..a98eb665da 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -415,7 +415,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
                                                const char *x_dirty_bitmap,
-                                               QCryptoTLSCreds *tlscreds);
+                                               QCryptoTLSCreds *tlscreds,
+                                               const char *tlshostname);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannel *coroutine_fn
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 2bda42641d..2a632931c3 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -33,6 +33,7 @@ struct NBDClientConnection {
     /* Initialization constants, never change */
     SocketAddress *saddr; /* address to connect to */
     QCryptoTLSCreds *tlscreds;
+    char *tlshostname;
     NBDExportInfo initial_info;
     bool do_negotiation;
     bool do_retry;
@@ -77,7 +78,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
                                                const char *x_dirty_bitmap,
-                                               QCryptoTLSCreds *tlscreds)
+                                               QCryptoTLSCreds *tlscreds,
+                                               const char *tlshostname)
 {
     NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
@@ -85,6 +87,7 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
     *conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, saddr),
         .tlscreds = tlscreds,
+        .tlshostname = g_strdup(tlshostname),
         .do_negotiation = do_negotiation,
 
         .initial_info.request_sizes = true,
@@ -107,6 +110,7 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
     }
     error_free(conn->err);
     qapi_free_SocketAddress(conn->saddr);
+    g_free(conn->tlshostname);
     object_unref(OBJECT(conn->tlscreds));
     g_free(conn->initial_info.x_dirty_bitmap);
     g_free(conn->initial_info.name);
@@ -120,6 +124,7 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
  */
 static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
                        NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
+                       const char *tlshostname,
                        QIOChannel **outioc, Error **errp)
 {
     int ret;
@@ -140,7 +145,7 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
     }
 
     ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
-                                tlscreds ? addr->u.inet.host : NULL,
+                                tlshostname,
                                 outioc, info, errp);
     if (ret < 0) {
         /*
@@ -183,7 +188,8 @@ static void *connect_thread_func(void *opaque)
 
         ret = nbd_connect(conn->sioc, conn->saddr,
                           conn->do_negotiation ? &conn->updated_info : NULL,
-                          conn->tlscreds, &conn->ioc, &local_err);
+                          conn->tlscreds, conn->tlshostname,
+                          &conn->ioc, &local_err);
 
         /*
          * conn->updated_info will finally be returned to the user. Clear the
-- 
2.34.1


