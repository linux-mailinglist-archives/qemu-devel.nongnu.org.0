Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060ED6EE6A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:29:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMSI-00070S-SA; Tue, 25 Apr 2023 13:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSG-0006zb-9S
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSE-0003AC-Kh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pr0VKOkDxuZ5hinADqgnbKz4Kufrp9KJiNLqpg8yv3Q=;
 b=Rv9M99Qpr5DwHsLB8T4wPXK9uvKR3iRihkvl5t4BT+UU80R1nOgjCYhGstxY80SPAe8ng7
 VEafA9DY3ZRXqggJ8ZSLwrynM7TLKuu0liyxtBosPlmO130eldjpkbsunXY2sDZUrtvv9B
 S9azZ+XjHD/5q7va4ob9mqo2Ue6iysI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-_LlzPYThP92zuiCljAn7kw-1; Tue, 25 Apr 2023 13:27:45 -0400
X-MC-Unique: _LlzPYThP92zuiCljAn7kw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A638828082A8;
 Tue, 25 Apr 2023 17:27:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D82492B10;
 Tue, 25 Apr 2023 17:27:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Lieven <pl@kamp.de>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 11/20] xen-block: implement BlockDevOps->drained_begin()
Date: Tue, 25 Apr 2023 13:27:07 -0400
Message-Id: <20230425172716.1033562-12-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Detach event channels during drained sections to stop I/O submission
from the ring. xen-block is no longer reliant on aio_disable_external()
after this patch. This will allow us to remove the
aio_disable_external() API once all other code that relies on it is
converted.

Extend xen_device_set_event_channel_context() to allow ctx=NULL. The
event channel still exists but the event loop does not monitor the file
descriptor. Event channel processing can resume by calling
xen_device_set_event_channel_context() with a non-NULL ctx.

Factor out xen_device_set_event_channel_context() calls in
hw/block/dataplane/xen-block.c into attach/detach helper functions.
Incidentally, these don't require the AioContext lock because
aio_set_fd_handler() is thread-safe.

It's safer to register BlockDevOps after the dataplane instance has been
created. The BlockDevOps .drained_begin/end() callbacks depend on the
dataplane instance, so move the blk_set_dev_ops() call after
xen_block_dataplane_create().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/xen-block.h |  2 ++
 hw/block/dataplane/xen-block.c | 42 +++++++++++++++++++++++++---------
 hw/block/xen-block.c           | 24 ++++++++++++++++---
 hw/xen/xen-bus.c               |  7 ++++--
 4 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/hw/block/dataplane/xen-block.h b/hw/block/dataplane/xen-block.h
index 76dcd51c3d..7b8e9df09f 100644
--- a/hw/block/dataplane/xen-block.h
+++ b/hw/block/dataplane/xen-block.h
@@ -26,5 +26,7 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
                                unsigned int protocol,
                                Error **errp);
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane);
+void xen_block_dataplane_attach(XenBlockDataPlane *dataplane);
+void xen_block_dataplane_detach(XenBlockDataPlane *dataplane);
 
 #endif /* HW_BLOCK_DATAPLANE_XEN_BLOCK_H */
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 734da42ea7..02e0fd6115 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -663,6 +663,30 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
     g_free(dataplane);
 }
 
+void xen_block_dataplane_detach(XenBlockDataPlane *dataplane)
+{
+    if (!dataplane || !dataplane->event_channel) {
+        return;
+    }
+
+    /* Only reason for failure is a NULL channel */
+    xen_device_set_event_channel_context(dataplane->xendev,
+                                         dataplane->event_channel,
+                                         NULL, &error_abort);
+}
+
+void xen_block_dataplane_attach(XenBlockDataPlane *dataplane)
+{
+    if (!dataplane || !dataplane->event_channel) {
+        return;
+    }
+
+    /* Only reason for failure is a NULL channel */
+    xen_device_set_event_channel_context(dataplane->xendev,
+                                         dataplane->event_channel,
+                                         dataplane->ctx, &error_abort);
+}
+
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 {
     XenDevice *xendev;
@@ -673,13 +697,11 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 
     xendev = dataplane->xendev;
 
-    aio_context_acquire(dataplane->ctx);
-    if (dataplane->event_channel) {
-        /* Only reason for failure is a NULL channel */
-        xen_device_set_event_channel_context(xendev, dataplane->event_channel,
-                                             qemu_get_aio_context(),
-                                             &error_abort);
+    if (!blk_in_drain(dataplane->blk)) {
+        xen_block_dataplane_detach(dataplane);
     }
+
+    aio_context_acquire(dataplane->ctx);
     /* Xen doesn't have multiple users for nodes, so this can't fail */
     blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(dataplane->ctx);
@@ -818,11 +840,9 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
     aio_context_release(old_context);
 
-    /* Only reason for failure is a NULL channel */
-    aio_context_acquire(dataplane->ctx);
-    xen_device_set_event_channel_context(xendev, dataplane->event_channel,
-                                         dataplane->ctx, &error_abort);
-    aio_context_release(dataplane->ctx);
+    if (!blk_in_drain(dataplane->blk)) {
+        xen_block_dataplane_attach(dataplane);
+    }
 
     return;
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index f5a744589d..f099914831 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -189,8 +189,26 @@ static void xen_block_resize_cb(void *opaque)
     xen_device_backend_printf(xendev, "state", "%u", state);
 }
 
+/* Suspend request handling */
+static void xen_block_drained_begin(void *opaque)
+{
+    XenBlockDevice *blockdev = opaque;
+
+    xen_block_dataplane_detach(blockdev->dataplane);
+}
+
+/* Resume request handling */
+static void xen_block_drained_end(void *opaque)
+{
+    XenBlockDevice *blockdev = opaque;
+
+    xen_block_dataplane_attach(blockdev->dataplane);
+}
+
 static const BlockDevOps xen_block_dev_ops = {
-    .resize_cb = xen_block_resize_cb,
+    .resize_cb     = xen_block_resize_cb,
+    .drained_begin = xen_block_drained_begin,
+    .drained_end   = xen_block_drained_end,
 };
 
 static void xen_block_realize(XenDevice *xendev, Error **errp)
@@ -242,8 +260,6 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
         return;
     }
 
-    blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
-
     if (conf->discard_granularity == -1) {
         conf->discard_granularity = conf->physical_block_size;
     }
@@ -277,6 +293,8 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     blockdev->dataplane =
         xen_block_dataplane_create(xendev, blk, conf->logical_block_size,
                                    blockdev->props.iothread);
+
+    blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
 }
 
 static void xen_block_frontend_changed(XenDevice *xendev,
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index c59850b1de..b8f408c9ed 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -846,8 +846,11 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
-                       xen_device_event, NULL, xen_device_poll, NULL, channel);
+    if (ctx) {
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
+                           true, xen_device_event, NULL, xen_device_poll, NULL,
+                           channel);
+    }
 }
 
 XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
-- 
2.39.2


