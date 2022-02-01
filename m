Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA24A62C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:44:00 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExCA-00013x-MH
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyK-0002gv-MP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyF-0003wf-GW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KNhrpHA2uQehtchXYrKv9YNhwAWxV+KYNzidQRvHu4=;
 b=adnmvnei1lkqF7jaoKRT29oeD3yBH2wHf/GkXBMDB0h84G8DF31oOjSiLTNwYTQegtmUzR
 8LThZRvMorimmplBZua3kFPIZSWTUaV0blbef0lErMsO3ElzL9UdTZLCiVma5QAJtZ/nGz
 uZo/A0xOT/zSbUNape7s3DkOBZWnpqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-_zpFPkHkM5CQdL5FLUDiwg-1; Tue, 01 Feb 2022 10:21:22 -0500
X-MC-Unique: _zpFPkHkM5CQdL5FLUDiwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B070951082;
 Tue,  1 Feb 2022 15:21:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAD7874E98;
 Tue,  1 Feb 2022 15:21:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/10] block/export: Fix vhost-user-blk shutdown with requests
 in flight
Date: Tue,  1 Feb 2022 16:21:01 +0100
Message-Id: <20220201152108.171898-4-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20220125151435.48792-1-kwolf@redhat.com>
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


