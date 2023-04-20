Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42596E9331
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:44:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppShg-0006sF-Gr; Thu, 20 Apr 2023 07:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppSdf-0008Gn-PP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppSdU-0001cY-Fv
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681990716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rd8h2e2Z0uhjua/p0PDxA8jGvK3/DbHaZUIqG5W/DmA=;
 b=TaaCHHuRaMt0zjVVCHT/PAV6cAJ2Wo245lKDFUQZWSk+Pab/dR07E2lynj6YabnFqqH2xD
 jHHaF/tJ7VLVEGga6ahMnmvD2RADkOESWuqngXgWiortkzivJV/m3OlhnN6vcI4sEKmGBH
 2m8Trf4KCD9yVQAvFar/P5h1e6XlTzw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-Vrel_1NgP6-pdSb2HQrVtQ-1; Thu, 20 Apr 2023 07:38:32 -0400
X-MC-Unique: Vrel_1NgP6-pdSb2HQrVtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA82B1C08976;
 Thu, 20 Apr 2023 11:38:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC2C40C2064;
 Thu, 20 Apr 2023 11:38:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 07/20] block/export: stop using is_external in
 vhost-user-blk server
Date: Thu, 20 Apr 2023 07:37:19 -0400
Message-Id: <20230420113732.336620-8-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

vhost-user activity must be suspended during bdrv_drained_begin/end().
This prevents new requests from interfering with whatever is happening
in the drained section.

Previously this was done using aio_set_fd_handler()'s is_external
argument. In a multi-queue block layer world the aio_disable_external()
API cannot be used since multiple AioContext may be processing I/O, not
just one.

Switch to BlockDevOps->drained_begin/end() callbacks.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
 util/vhost-user-server.c             | 10 +++----
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index dbf5207162..6e1bc196fb 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -207,22 +207,6 @@ static const VuDevIface vu_blk_iface = {
     .process_msg           = vu_blk_process_msg,
 };
 
-static void blk_aio_attached(AioContext *ctx, void *opaque)
-{
-    VuBlkExport *vexp = opaque;
-
-    vexp->export.ctx = ctx;
-    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
-}
-
-static void blk_aio_detach(void *opaque)
-{
-    VuBlkExport *vexp = opaque;
-
-    vhost_user_server_detach_aio_context(&vexp->vu_server);
-    vexp->export.ctx = NULL;
-}
-
 static void
 vu_blk_initialize_config(BlockDriverState *bs,
                          struct virtio_blk_config *config,
@@ -254,6 +238,25 @@ static void vu_blk_exp_request_shutdown(BlockExport *exp)
     vhost_user_server_stop(&vexp->vu_server);
 }
 
+/* Called with vexp->export.ctx acquired */
+static void vu_blk_drained_begin(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    vhost_user_server_detach_aio_context(&vexp->vu_server);
+}
+
+/* Called with vexp->export.blk AioContext acquired */
+static void vu_blk_drained_end(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    /* Refresh AioContext in case it changed */
+    vexp->export.ctx = blk_get_aio_context(vexp->export.blk);
+
+    vhost_user_server_attach_aio_context(&vexp->vu_server, vexp->export.ctx);
+}
+
 /*
  * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
  *
@@ -267,6 +270,8 @@ static bool vu_blk_drained_poll(void *opaque)
 }
 
 static const BlockDevOps vu_blk_dev_ops = {
+    .drained_begin = vu_blk_drained_begin,
+    .drained_end   = vu_blk_drained_end,
     .drained_poll  = vu_blk_drained_poll,
 };
 
@@ -309,13 +314,9 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                              logical_block_size, num_queues);
 
     blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
-    blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
-                                 vexp);
 
     if (!vhost_user_server_start(&vexp->vu_server, vu_opts->addr, exp->ctx,
                                  num_queues, &vu_blk_iface, errp)) {
-        blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
-                                        blk_aio_detach, vexp);
         blk_set_dev_ops(exp->blk, NULL, NULL);
         g_free(vexp->handler.serial);
         return -EADDRNOTAVAIL;
@@ -328,8 +329,6 @@ static void vu_blk_exp_delete(BlockExport *exp)
 {
     VuBlkExport *vexp = container_of(exp, VuBlkExport, export);
 
-    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
-                                    vexp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
     g_free(vexp->handler.serial);
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 2e6b640050..332aea9306 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -278,7 +278,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
         vu_fd_watch->fd = fd;
         vu_fd_watch->cb = cb;
         qemu_socket_set_nonblock(fd);
-        aio_set_fd_handler(server->ioc->ctx, fd, true, kick_handler,
+        aio_set_fd_handler(server->ioc->ctx, fd, false, kick_handler,
                            NULL, NULL, NULL, vu_fd_watch);
         vu_fd_watch->vu_dev = vu_dev;
         vu_fd_watch->pvt = pvt;
@@ -299,7 +299,7 @@ static void remove_watch(VuDev *vu_dev, int fd)
     if (!vu_fd_watch) {
         return;
     }
-    aio_set_fd_handler(server->ioc->ctx, fd, true,
+    aio_set_fd_handler(server->ioc->ctx, fd, false,
                        NULL, NULL, NULL, NULL, NULL);
 
     QTAILQ_REMOVE(&server->vu_fd_watches, vu_fd_watch, next);
@@ -362,7 +362,7 @@ void vhost_user_server_stop(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
@@ -403,7 +403,7 @@ void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx)
     qio_channel_attach_aio_context(server->ioc, ctx);
 
     QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-        aio_set_fd_handler(ctx, vu_fd_watch->fd, true, kick_handler, NULL,
+        aio_set_fd_handler(ctx, vu_fd_watch->fd, false, kick_handler, NULL,
                            NULL, NULL, vu_fd_watch);
     }
 
@@ -417,7 +417,7 @@ void vhost_user_server_detach_aio_context(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
-- 
2.39.2


