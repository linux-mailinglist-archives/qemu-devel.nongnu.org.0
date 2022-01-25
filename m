Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22F49B782
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:23:16 +0100 (CET)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNf9-00048I-0t
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nCNX0-0004mj-E1
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nCNWx-0007DQ-Vw
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CjG5ok68EsCtrpCFYYY0HDm9PHPOHptug3abBk71iZk=;
 b=evjKjxmw82aVIzkqLL+/wxaLZ3zdcE4Sq7S7wgz1I5TPv38OFOojQZn8SqOdgwOcnAh3pr
 F2Zy+kmPk3R1fGDxpZAyDWzPhMRtlZP5i3gIdaBMyX8NTy5cuOOEGDNG4F48LaS+A5+lAu
 gBMZw+mVyij7F4z777yrSLYqlCD21jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-PE71rhP_MMyytL-OsinD5g-1; Tue, 25 Jan 2022 10:14:40 -0500
X-MC-Unique: PE71rhP_MMyytL-OsinD5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737A984BA5B;
 Tue, 25 Jan 2022 15:14:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.195.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C6B57DE2B;
 Tue, 25 Jan 2022 15:14:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/export: Fix vhost-user-blk shutdown with requests in
 flight
Date: Tue, 25 Jan 2022 16:14:35 +0100
Message-Id: <20220125151435.48792-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-blk export runs requests asynchronously in their own
coroutine. When the vhost connection goes away and we want to stop the
vhost-user server, we need to wait for these coroutines to stop before
we can unmap the shared memory. Otherwise, they would still access the
unmapped memory and crash.

This introduces a refcount to VuServer which is increased when spawning
a new request coroutine and decreased before the coroutine exits. The
memory is only unmapped when the refcount reaches zero.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/vhost-user-server.h     |  5 +++++
 block/export/vhost-user-blk-server.c |  5 +++++
 util/vhost-user-server.c             | 22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index 121ea1dedf..cd43193b80 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -42,6 +42,8 @@ typedef struct {
     const VuDevIface *vu_iface;
 
     /* Protected by ctx lock */
+    unsigned int refcount;
+    bool wait_idle;
     VuDev vu_dev;
     QIOChannel *ioc; /* The I/O channel with the client */
     QIOChannelSocket *sioc; /* The underlying data channel with the client */
@@ -59,6 +61,9 @@ bool vhost_user_server_start(VuServer *server,
 
 void vhost_user_server_stop(VuServer *server);
 
+void vhost_user_server_ref(VuServer *server);
+void vhost_user_server_unref(VuServer *server);
+
 void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
 void vhost_user_server_detach_aio_context(VuServer *server);
 
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 1862563336..a129204c44 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -172,6 +172,7 @@ vu_blk_discard_write_zeroes(VuBlkExport *vexp, struct iovec *iov,
     return VIRTIO_BLK_S_IOERR;
 }
 
+/* Called with server refcount increased, must decrease before returning */
 static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
 {
     VuBlkReq *req = opaque;
@@ -286,10 +287,12 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
     }
 
     vu_blk_req_complete(req);
+    vhost_user_server_unref(server);
     return;
 
 err:
     free(req);
+    vhost_user_server_unref(server);
 }
 
 static void vu_blk_process_vq(VuDev *vu_dev, int idx)
@@ -310,6 +313,8 @@ static void vu_blk_process_vq(VuDev *vu_dev, int idx)
 
         Coroutine *co =
             qemu_coroutine_create(vu_blk_virtio_process_req, req);
+
+        vhost_user_server_ref(server);
         qemu_coroutine_enter(co);
     }
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index f68287e811..f66fbba710 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -74,6 +74,20 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
     error_report("vu_panic: %s", buf);
 }
 
+void vhost_user_server_ref(VuServer *server)
+{
+    assert(!server->wait_idle);
+    server->refcount++;
+}
+
+void vhost_user_server_unref(VuServer *server)
+{
+    server->refcount--;
+    if (server->wait_idle && !server->refcount) {
+        aio_co_wake(server->co_trip);
+    }
+}
+
 static bool coroutine_fn
 vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
 {
@@ -177,6 +191,14 @@ static coroutine_fn void vu_client_trip(void *opaque)
         /* Keep running */
     }
 
+    if (server->refcount) {
+        /* Wait for requests to complete before we can unmap the memory */
+        server->wait_idle = true;
+        qemu_coroutine_yield();
+        server->wait_idle = false;
+    }
+    assert(server->refcount == 0);
+
     vu_deinit(vu_dev);
 
     /* vu_deinit() should have called remove_watch() */
-- 
2.31.1


