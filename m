Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B848C49FB1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:51:53 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdCeW-00016r-VH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWX-00041v-AX
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWV-0000Me-4v
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:37 -0400
Received: from relay.sw.ru ([185.231.240.75]:57996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWU-0000Jf-RU; Tue, 18 Jun 2019 07:43:35 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWP-00016b-2t; Tue, 18 Jun 2019 14:43:29 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 14:43:21 +0300
Message-Id: <20190618114328.55249-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190618114328.55249-1-vsementsov@virtuozzo.com>
References: <20190618114328.55249-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 2/9] block/nbd: use non-blocking io channel
 for nbd negotiation
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to use blocking channel for negotiation and we'll benefit in
further reconnect feature, as qio_channel reads and writes will do
qemu_coroutine_yield while waiting for io completion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  3 ++-
 block/nbd.c         | 16 +++++++---------
 nbd/client.c        | 16 +++++++++++-----
 qemu-nbd.c          |  2 +-
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index bb9f5bc021..7b36d672f0 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -304,7 +304,8 @@ struct NBDExportInfo {
 };
 typedef struct NBDExportInfo NBDExportInfo;
 
-int nbd_receive_negotiate(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
+int nbd_receive_negotiate(AioContext *aio_context, QIOChannel *ioc,
+                          QCryptoTLSCreds *tlscreds,
                           const char *hostname, QIOChannel **outioc,
                           NBDExportInfo *info, Error **errp);
 void nbd_free_export_list(NBDExportInfo *info, int count);
diff --git a/block/nbd.c b/block/nbd.c
index 46a1de7220..16a38373fd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1176,6 +1176,7 @@ static int nbd_client_connect(BlockDriverState *bs,
                               Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;
 
     /*
@@ -1190,15 +1191,16 @@ static int nbd_client_connect(BlockDriverState *bs,
 
     /* NBD handshake */
     trace_nbd_client_connect(export);
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), true, NULL);
+    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
 
     s->info.request_sizes = true;
     s->info.structured_reply = true;
     s->info.base_allocation = true;
     s->info.x_dirty_bitmap = g_strdup(x_dirty_bitmap);
     s->info.name = g_strdup(export ?: "");
-    ret = nbd_receive_negotiate(QIO_CHANNEL(sioc), tlscreds, hostname,
-                                &s->ioc, &s->info, errp);
+    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), tlscreds,
+                                hostname, &s->ioc, &s->info, errp);
     g_free(s->info.x_dirty_bitmap);
     g_free(s->info.name);
     if (ret < 0) {
@@ -1232,18 +1234,14 @@ static int nbd_client_connect(BlockDriverState *bs,
         object_ref(OBJECT(s->ioc));
     }
 
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
-    qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
-
     trace_nbd_client_connect_success(export);
 
     return 0;
 
  fail:
     /*
-     * We have connected, but must fail for other reasons. The
-     * connection is still blocking; send NBD_CMD_DISC as a courtesy
-     * to the server.
+     * We have connected, but must fail for other reasons.
+     * Send NBD_CMD_DISC as a courtesy to the server.
      */
     {
         NBDRequest request = { .type = NBD_CMD_DISC };
diff --git a/nbd/client.c b/nbd/client.c
index 4de30630c7..8f524c3e35 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -867,7 +867,8 @@ static int nbd_list_meta_contexts(QIOChannel *ioc,
  *          2: server is newstyle, but lacks structured replies
  *          3: server is newstyle and set up for structured replies
  */
-static int nbd_start_negotiate(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
+static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
+                               QCryptoTLSCreds *tlscreds,
                                const char *hostname, QIOChannel **outioc,
                                bool structured_reply, bool *zeroes,
                                Error **errp)
@@ -934,6 +935,10 @@ static int nbd_start_negotiate(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
                     return -EINVAL;
                 }
                 ioc = *outioc;
+                if (aio_context) {
+                    qio_channel_set_blocking(ioc, false, NULL);
+                    qio_channel_attach_aio_context(ioc, aio_context);
+                }
             } else {
                 error_setg(errp, "Server does not support STARTTLS");
                 return -EINVAL;
@@ -998,7 +1003,8 @@ static int nbd_negotiate_finish_oldstyle(QIOChannel *ioc, NBDExportInfo *info,
  * Returns: negative errno: failure talking to server
  *          0: server is connected
  */
-int nbd_receive_negotiate(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
+int nbd_receive_negotiate(AioContext *aio_context, QIOChannel *ioc,
+                          QCryptoTLSCreds *tlscreds,
                           const char *hostname, QIOChannel **outioc,
                           NBDExportInfo *info, Error **errp)
 {
@@ -1009,7 +1015,7 @@ int nbd_receive_negotiate(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
     assert(info->name);
     trace_nbd_receive_negotiate_name(info->name);
 
-    result = nbd_start_negotiate(ioc, tlscreds, hostname, outioc,
+    result = nbd_start_negotiate(aio_context, ioc, tlscreds, hostname, outioc,
                                  info->structured_reply, &zeroes, errp);
 
     info->structured_reply = false;
@@ -1129,8 +1135,8 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
     QIOChannel *sioc = NULL;
 
     *info = NULL;
-    result = nbd_start_negotiate(ioc, tlscreds, hostname, &sioc, true, NULL,
-                                 errp);
+    result = nbd_start_negotiate(NULL, ioc, tlscreds, hostname, &sioc, true,
+                                 NULL, errp);
     if (tlscreds && sioc) {
         ioc = sioc;
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index a8cb39e510..049645491d 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -362,7 +362,7 @@ static void *nbd_client_thread(void *arg)
         goto out;
     }
 
-    ret = nbd_receive_negotiate(QIO_CHANNEL(sioc),
+    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
                                 NULL, NULL, NULL, &info, &local_error);
     if (ret < 0) {
         if (local_error) {
-- 
2.18.0


