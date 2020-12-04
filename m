Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999F2CF270
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 17:56:44 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klENv-0008A5-4Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 11:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1klEMa-0006a7-CV
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1klEMX-0001yH-LJ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607100916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNfLft+qEO0/QSENBFs6kf+nDhrUag7Kjx4pbElV6m4=;
 b=anS7dPiu3B2O53mVwVPdLbOMwSXq664Z+5cZ89PP+6TcZeYlJ5lwpraAclDyjT/6SAA8wS
 HGTJM+nZHGhbgxnnMardbZx02SKvYU4Vi2U+yF7EvJ41RTRgxRRd2kpd5N8RIwd4hTXX7S
 2gzMGi6eFaaHCARKZjckZRS+i66SQf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-NHwkNklKNtGFJyCUKlWnHA-1; Fri, 04 Dec 2020 11:54:05 -0500
X-MC-Unique: NHwkNklKNtGFJyCUKlWnHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1921C1922960;
 Fri,  4 Dec 2020 16:54:04 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-216.rdu2.redhat.com
 [10.10.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2549F60C04;
 Fri,  4 Dec 2020 16:53:59 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] nbd/server: Quiesce coroutines on context switch
Date: Fri,  4 Dec 2020 17:53:47 +0100
Message-Id: <20201204165347.73542-3-slp@redhat.com>
In-Reply-To: <20201204165347.73542-1-slp@redhat.com>
References: <20201204165347.73542-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching between AIO contexts we need to me make sure that both
recv_coroutine and send_coroutine are not scheduled to run. Otherwise,
QEMU may crash while attaching the new context with an error like
this one:

aio_co_schedule: Co-routine was already scheduled in 'aio_co_schedule'

To achieve this we need a local implementation of
'qio_channel_readv_all_eof' named 'nbd_read_eof' (a trick already done
by 'nbd/client.c') that allows us to interrupt the operation and to
know when recv_coroutine is yielding.

With this in place, we delegate detaching the AIO context to the
owning context with a BH ('nbd_aio_detach_bh') scheduled using
'aio_wait_bh_oneshot'. This BH signals that we need to quiesce the
channel by setting 'client->quiescing' to 'true', and either waits for
the coroutine to finish using AIO_WAIT_WHILE or, if it's yielding in
'nbd_read_eof', actively enters the coroutine to interrupt it.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900326
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 nbd/server.c | 120 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 14 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 613ed2634a..7229f487d2 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -132,6 +132,9 @@ struct NBDClient {
     CoMutex send_lock;
     Coroutine *send_coroutine;
 
+    bool read_yielding;
+    bool quiescing;
+
     QTAILQ_ENTRY(NBDClient) next;
     int nb_requests;
     bool closing;
@@ -1352,14 +1355,60 @@ static coroutine_fn int nbd_negotiate(NBDClient *client, Error **errp)
     return 0;
 }
 
-static int nbd_receive_request(QIOChannel *ioc, NBDRequest *request,
+/* nbd_read_eof
+ * Tries to read @size bytes from @ioc. This is a local implementation of
+ * qio_channel_readv_all_eof. We have it here because we need it to be
+ * interruptible and to know when the coroutine is yielding.
+ * Returns 1 on success
+ *         0 on eof, when no data was read (errp is not set)
+ *         negative errno on failure (errp is set)
+ */
+static inline int coroutine_fn
+nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
+{
+    bool partial = false;
+
+    assert(size);
+    while (size > 0) {
+        struct iovec iov = { .iov_base = buffer, .iov_len = size };
+        ssize_t len;
+
+        len = qio_channel_readv(client->ioc, &iov, 1, errp);
+        if (len == QIO_CHANNEL_ERR_BLOCK) {
+            client->read_yielding = true;
+            qio_channel_yield(client->ioc, G_IO_IN);
+            client->read_yielding = false;
+            if (client->quiescing) {
+                return -EAGAIN;
+            }
+            continue;
+        } else if (len < 0) {
+            return -EIO;
+        } else if (len == 0) {
+            if (partial) {
+                error_setg(errp,
+                           "Unexpected end-of-file before all bytes were read");
+                return -EIO;
+            } else {
+                return 0;
+            }
+        }
+
+        partial = true;
+        size -= len;
+        buffer = (uint8_t *) buffer + len;
+    }
+    return 1;
+}
+
+static int nbd_receive_request(NBDClient *client, NBDRequest *request,
                                Error **errp)
 {
     uint8_t buf[NBD_REQUEST_SIZE];
     uint32_t magic;
     int ret;
 
-    ret = nbd_read(ioc, buf, sizeof(buf), "request", errp);
+    ret = nbd_read_eof(client, buf, sizeof(buf), errp);
     if (ret < 0) {
         return ret;
     }
@@ -1480,11 +1529,37 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
 
     QTAILQ_FOREACH(client, &exp->clients, next) {
         qio_channel_attach_aio_context(client->ioc, ctx);
+
+        assert(client->recv_coroutine == NULL);
+        assert(client->send_coroutine == NULL);
+
+        if (client->quiescing) {
+            client->quiescing = false;
+            nbd_client_receive_next_request(client);
+        }
+    }
+}
+
+static void nbd_aio_detach_bh(void *opaque)
+{
+    NBDExport *exp = opaque;
+    NBDClient *client;
+
+    QTAILQ_FOREACH(client, &exp->clients, next) {
+        qio_channel_detach_aio_context(client->ioc);
+        client->quiescing = true;
+
         if (client->recv_coroutine) {
-            aio_co_schedule(ctx, client->recv_coroutine);
+            if (client->read_yielding) {
+                qemu_aio_coroutine_enter(exp->common.ctx,
+                                         client->recv_coroutine);
+            } else {
+                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
+            }
         }
+
         if (client->send_coroutine) {
-            aio_co_schedule(ctx, client->send_coroutine);
+            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
         }
     }
 }
@@ -1492,13 +1567,10 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
 static void blk_aio_detach(void *opaque)
 {
     NBDExport *exp = opaque;
-    NBDClient *client;
 
     trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
 
-    QTAILQ_FOREACH(client, &exp->clients, next) {
-        qio_channel_detach_aio_context(client->ioc);
-    }
+    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
 
     exp->common.ctx = NULL;
 }
@@ -2151,20 +2223,23 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
 
 /* nbd_co_receive_request
  * Collect a client request. Return 0 if request looks valid, -EIO to drop
- * connection right away, and any other negative value to report an error to
- * the client (although the caller may still need to disconnect after reporting
- * the error).
+ * connection right away, -EAGAIN to indicate we were interrupted and the
+ * channel should be quiesced, and any other negative value to report an error
+ * to the client (although the caller may still need to disconnect after
+ * reporting the error).
  */
 static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
                                   Error **errp)
 {
     NBDClient *client = req->client;
     int valid_flags;
+    int ret;
 
     g_assert(qemu_in_coroutine());
     assert(client->recv_coroutine == qemu_coroutine_self());
-    if (nbd_receive_request(client->ioc, request, errp) < 0) {
-        return -EIO;
+    ret = nbd_receive_request(client, request, errp);
+    if (ret < 0) {
+        return  ret;
     }
 
     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2507,6 +2582,17 @@ static coroutine_fn void nbd_trip(void *opaque)
         return;
     }
 
+    if (client->quiescing) {
+        /*
+         * We're switching between AIO contexts. Don't attempt to receive a new
+         * request and kick the main context which may be waiting for us.
+         */
+        nbd_client_put(client);
+        client->recv_coroutine = NULL;
+        aio_wait_kick();
+        return;
+    }
+
     req = nbd_request_get(client);
     ret = nbd_co_receive_request(req, &request, &local_err);
     client->recv_coroutine = NULL;
@@ -2519,6 +2605,11 @@ static coroutine_fn void nbd_trip(void *opaque)
         goto done;
     }
 
+    if (ret == -EAGAIN) {
+        assert(client->quiescing);
+        goto done;
+    }
+
     nbd_client_receive_next_request(client);
     if (ret == -EIO) {
         goto disconnect;
@@ -2565,7 +2656,8 @@ disconnect:
 
 static void nbd_client_receive_next_request(NBDClient *client)
 {
-    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS) {
+    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS &&
+        !client->quiescing) {
         nbd_client_get(client);
         client->recv_coroutine = qemu_coroutine_create(nbd_trip, client);
         aio_co_schedule(client->exp->common.ctx, client->recv_coroutine);
-- 
2.26.2


