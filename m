Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C15230D17
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 17:10:10 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0RF3-0006ER-1p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 11:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0R9b-0006OV-Hz
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:04:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47816
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0R9Y-0006uy-MF
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595948667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SB4Hc2q6uuPHOSGYKf6pIASqeyKKgufXtcN8atc9kFs=;
 b=VZ5bPJInfSNvdu2EIvAi1E6SdN/wzte/sdqDfS8q/OujeQAyfsnpE+GwK8RyVm+zI1r+Av
 NDAW5seWmuGK+nerPh9QbJxjQKTB3IsUdIZoiz6jFmxHFIJkpqt4bdI4p28kblaem6RYPx
 PmeQnV02PPKslrU8uocV39n1zpIE59s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-QrHGTC0FONunJbziWCHV0g-1; Tue, 28 Jul 2020 11:04:23 -0400
X-MC-Unique: QrHGTC0FONunJbziWCHV0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB9A18A1DFE;
 Tue, 28 Jul 2020 15:04:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-118-248.rdu2.redhat.com [10.10.118.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EA0E19C71;
 Tue, 28 Jul 2020 15:04:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] block/nbd: on shutdown terminate connection attempt
Date: Tue, 28 Jul 2020 10:04:06 -0500
Message-Id: <20200728150408.291299-9-eblake@redhat.com>
In-Reply-To: <20200728150408.291299-1-eblake@redhat.com>
References: <20200728150408.291299-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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

On shutdown nbd driver may be in a connecting state. We should shutdown
it as well, otherwise we may hang in
nbd_teardown_connection, waiting for conneciton_co to finish in
BDRV_POLL_WHILE(bs, s->connection_co) loop if remote server is down.

How to reproduce the dead lock:

1. Create nbd-fault-injector.conf with the following contents:

[inject-error "mega1"]
event=data
io=readwrite
when=before

2. In one terminal run nbd-fault-injector in a loop, like this:

n=1; while true; do
    echo $n; ((n++));
    ./nbd-fault-injector.py 127.0.0.1:10000 nbd-fault-injector.conf;
done

3. In another terminal run qemu-io in a loop, like this:

n=1; while true; do
    echo $n; ((n++));
    ./qemu-io -c 'read 0 512' nbd://127.0.0.1:10000;
done

After some time, qemu-io will hang. Note, that this hang may be
triggered by another bug, so the whole case is fixed only together with
commit "block/nbd: allow drain during reconnect attempt".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200727184751.15704-4-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ee9ab7512b65..620c97be6ba2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -209,11 +209,15 @@ static void nbd_teardown_connection(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

-    if (s->state == NBD_CLIENT_CONNECTED) {
+    if (s->ioc) {
         /* finish any pending coroutines */
-        assert(s->ioc);
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    } else if (s->sioc) {
+        /* abort negotiation */
+        qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH,
+                             NULL);
     }
+
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         if (s->connection_co_sleep_ns_state) {
@@ -1459,6 +1463,9 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
     int ret;

     trace_nbd_client_handshake(s->export);
+
+    s->sioc = sioc;
+
     qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
     qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);

@@ -1473,6 +1480,7 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
     g_free(s->info.name);
     if (ret < 0) {
         object_unref(OBJECT(sioc));
+        s->sioc = NULL;
         return ret;
     }
     if (s->x_dirty_bitmap && !s->info.base_allocation) {
@@ -1498,8 +1506,6 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
         }
     }

-    s->sioc = sioc;
-
     if (!s->ioc) {
         s->ioc = QIO_CHANNEL(sioc);
         object_ref(OBJECT(s->ioc));
@@ -1520,6 +1526,7 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
         nbd_send_request(s->ioc ?: QIO_CHANNEL(sioc), &request);

         object_unref(OBJECT(sioc));
+        s->sioc = NULL;

         return ret;
     }
-- 
2.27.0


