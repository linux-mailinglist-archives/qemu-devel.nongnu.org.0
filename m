Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785CF6F7574
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:57:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puf1h-0005uz-Ix; Thu, 04 May 2023 15:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puf1c-0005qw-3b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puf1Y-0006SQ-Nb
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683230036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqVEulc+YKH8du/OTtIOC0bNRzxnvgw0ufD9riF8H3c=;
 b=Y7XOxKoB6GFtvMRcp29j3FocopnLm4ekUeUaEJrpCsOnyVJ+OkBQX9rK8mRRNz6ubwbxP7
 dnc6iBTT/sJv2GFLVqVhHooYEx6U0FwG2ExA9+34tu+3uinwCc4BinlZ6/cEIMSSGM7GnR
 SwQgx8Tj49QVy4JizuIUC9tJiyBfa2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-tNtDfOKSMVq3AQX3nRbV7g-1; Thu, 04 May 2023 15:53:50 -0400
X-MC-Unique: tNtDfOKSMVq3AQX3nRbV7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36B9A101A550;
 Thu,  4 May 2023 19:53:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931081121339;
 Thu,  4 May 2023 19:53:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 xen-devel@lists.xenproject.org, eesposit@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 07/21] block/export: wait for vhost-user-blk requests when
 draining
Date: Thu,  4 May 2023 15:53:13 -0400
Message-Id: <20230504195327.695107-8-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Each vhost-user-blk request runs in a coroutine. When the BlockBackend
enters a drained section we need to enter a quiescent state. Currently
any in-flight requests race with bdrv_drained_begin() because it is
unaware of vhost-user-blk requests.

When blk_co_preadv/pwritev()/etc returns it wakes the
bdrv_drained_begin() thread but vhost-user-blk request processing has
not yet finished. The request coroutine continues executing while the
main loop thread thinks it is in a drained section.

One example where this is unsafe is for blk_set_aio_context() where
bdrv_drained_begin() is called before .aio_context_detached() and
.aio_context_attach(). If request coroutines are still running after
bdrv_drained_begin(), then the AioContext could change underneath them
and they race with new requests processed in the new AioContext. This
could lead to virtqueue corruption, for example.

(This example is theoretical, I came across this while reading the
code and have not tried to reproduce it.)

It's easy to make bdrv_drained_begin() wait for in-flight requests: add
a .drained_poll() callback that checks the VuServer's in-flight counter.
VuServer just needs an API that returns true when there are requests in
flight. The in-flight counter needs to be atomic.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v5:
- Use atomic accesses for in_flight counter in vhost-user-server.c [Kevin]
---
 include/qemu/vhost-user-server.h     |  4 +++-
 block/export/vhost-user-blk-server.c | 13 +++++++++++++
 util/vhost-user-server.c             | 18 ++++++++++++------
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index bc0ac9ddb6..b1c1cda886 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -40,8 +40,9 @@ typedef struct {
     int max_queues;
     const VuDevIface *vu_iface;
 
+    unsigned int in_flight; /* atomic */
+
     /* Protected by ctx lock */
-    unsigned int in_flight;
     bool wait_idle;
     VuDev vu_dev;
     QIOChannel *ioc; /* The I/O channel with the client */
@@ -62,6 +63,7 @@ void vhost_user_server_stop(VuServer *server);
 
 void vhost_user_server_inc_in_flight(VuServer *server);
 void vhost_user_server_dec_in_flight(VuServer *server);
+bool vhost_user_server_has_in_flight(VuServer *server);
 
 void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
 void vhost_user_server_detach_aio_context(VuServer *server);
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 841acb36e3..f51a36a14f 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -272,7 +272,20 @@ static void vu_blk_exp_resize(void *opaque)
     vu_config_change_msg(&vexp->vu_server.vu_dev);
 }
 
+/*
+ * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
+ *
+ * Called with vexp->export.ctx acquired.
+ */
+static bool vu_blk_drained_poll(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    return vhost_user_server_has_in_flight(&vexp->vu_server);
+}
+
 static const BlockDevOps vu_blk_dev_ops = {
+    .drained_poll  = vu_blk_drained_poll,
     .resize_cb = vu_blk_exp_resize,
 };
 
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 1622f8cfb3..68c3bf162f 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -78,17 +78,23 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
 void vhost_user_server_inc_in_flight(VuServer *server)
 {
     assert(!server->wait_idle);
-    server->in_flight++;
+    qatomic_inc(&server->in_flight);
 }
 
 void vhost_user_server_dec_in_flight(VuServer *server)
 {
-    server->in_flight--;
-    if (server->wait_idle && !server->in_flight) {
-        aio_co_wake(server->co_trip);
+    if (qatomic_fetch_dec(&server->in_flight) == 1) {
+        if (server->wait_idle) {
+            aio_co_wake(server->co_trip);
+        }
     }
 }
 
+bool vhost_user_server_has_in_flight(VuServer *server)
+{
+    return qatomic_load_acquire(&server->in_flight) > 0;
+}
+
 static bool coroutine_fn
 vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
 {
@@ -192,13 +198,13 @@ static coroutine_fn void vu_client_trip(void *opaque)
         /* Keep running */
     }
 
-    if (server->in_flight) {
+    if (vhost_user_server_has_in_flight(server)) {
         /* Wait for requests to complete before we can unmap the memory */
         server->wait_idle = true;
         qemu_coroutine_yield();
         server->wait_idle = false;
     }
-    assert(server->in_flight == 0);
+    assert(!vhost_user_server_has_in_flight(server));
 
     vu_deinit(vu_dev);
 
-- 
2.40.1


