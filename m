Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33AC3A1A2E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:51:26 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0UH-0004vQ-VA
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QM-00078K-QY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QJ-0003Wa-Dz
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsRenvlp3nKG96CwCi8OsCLbPvu0maTogj4ozGKWBqA=;
 b=W+SJVIduHf5dRK74PA5UJ0tPLG5NbbdZBTMFmg2JVfoX9f/BIJwLuun1SCXl8IaK1d02Oz
 SBSVkD03Y1BsaPm4Gr/wqOgeRE2lMCGfDAewTs2Ap57oRI5SQltZkxzqBVBXtNhFXchEYm
 l4HPkm3hIsvo4WrNNvbTdZxrFr9cJCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Ewwj0n-cMSWBJ2JCN2oN2A-1; Wed, 09 Jun 2021 11:47:15 -0400
X-MC-Unique: Ewwj0n-cMSWBJ2JCN2oN2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D2B800C60;
 Wed,  9 Jun 2021 15:47:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E164360C04;
 Wed,  9 Jun 2021 15:47:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/7] vhost: Add Error parameter to vhost_dev_init()
Date: Wed,  9 Jun 2021 17:46:52 +0200
Message-Id: <20210609154658.350308-2-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-1-kwolf@redhat.com>
References: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows callers to return better error messages instead of making
one up while the real error ends up on stderr. Most callers can
immediately make use of this because they already have an Error
parameter themselves. The others just keep printing the error with
error_report_err().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/virtio/vhost.h    |  2 +-
 backends/cryptodev-vhost.c   |  5 ++++-
 backends/vhost-user.c        |  4 ++--
 hw/block/vhost-user-blk.c    |  4 ++--
 hw/net/vhost_net.c           |  6 +++++-
 hw/scsi/vhost-scsi.c         |  4 +---
 hw/scsi/vhost-user-scsi.c    |  4 +---
 hw/virtio/vhost-user-fs.c    |  3 +--
 hw/virtio/vhost-user-vsock.c |  3 +--
 hw/virtio/vhost-vsock.c      |  3 +--
 hw/virtio/vhost.c            | 16 ++++++++++------
 11 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 21a9a52088..2d7aaad67b 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -104,7 +104,7 @@ struct vhost_net {
 
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type,
-                   uint32_t busyloop_timeout);
+                   uint32_t busyloop_timeout, Error **errp);
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
index 8231e7f1bc..bc13e466b4 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -52,6 +52,7 @@ cryptodev_vhost_init(
 {
     int r;
     CryptoDevBackendVhost *crypto;
+    Error *local_err = NULL;
 
     crypto = g_new(CryptoDevBackendVhost, 1);
     crypto->dev.max_queues = 1;
@@ -66,8 +67,10 @@ cryptodev_vhost_init(
     /* vhost-user needs vq_index to initiate a specific queue pair */
     crypto->dev.vq_index = crypto->cc->queue_index * crypto->dev.nvqs;
 
-    r = vhost_dev_init(&crypto->dev, options->opaque, options->backend_type, 0);
+    r = vhost_dev_init(&crypto->dev, options->opaque, options->backend_type, 0,
+                       &local_err);
     if (r < 0) {
+        error_report_err(local_err);
         goto fail;
     }
 
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index b366610e16..10b39992d2 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -48,9 +48,9 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
     b->dev.nvqs = nvqs;
     b->dev.vqs = g_new0(struct vhost_virtqueue, nvqs);
 
-    ret = vhost_dev_init(&b->dev, &b->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
+    ret = vhost_dev_init(&b->dev, &b->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
+                         errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "vhost initialization failed");
         return -1;
     }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index c6210fad0c..0cb56baefb 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -332,9 +332,9 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 
     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
 
-    ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
+    ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
+                         errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "vhost initialization failed");
         return ret;
     }
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 44c1ed92dc..447b119f85 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -22,6 +22,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-net.h"
 #include "net/vhost_net.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
@@ -157,6 +158,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
     bool backend_kernel = options->backend_type == VHOST_BACKEND_TYPE_KERNEL;
     struct vhost_net *net = g_new0(struct vhost_net, 1);
     uint64_t features = 0;
+    Error *local_err = NULL;
 
     if (!options->net_backend) {
         fprintf(stderr, "vhost-net requires net backend to be setup\n");
@@ -187,8 +189,10 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
     }
 
     r = vhost_dev_init(&net->dev, options->opaque,
-                       options->backend_type, options->busyloop_timeout);
+                       options->backend_type, options->busyloop_timeout,
+                       &local_err);
     if (r < 0) {
+        error_report_err(local_err);
         goto fail;
     }
     if (backend_kernel) {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 4d70fa036b..8c611bfd2d 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -219,10 +219,8 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.backend_features = 0;
 
     ret = vhost_dev_init(&vsc->dev, (void *)(uintptr_t)vhostfd,
-                         VHOST_BACKEND_TYPE_KERNEL, 0);
+                         VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
-        error_setg(errp, "vhost-scsi: vhost initialization failed: %s",
-                   strerror(-ret));
         goto free_vqs;
     }
 
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 4666019442..1b2f7eed98 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -122,10 +122,8 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vqs = vsc->dev.vqs;
 
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
-                         VHOST_BACKEND_TYPE_USER, 0);
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
-        error_setg(errp, "vhost-user-scsi: vhost initialization failed: %s",
-                   strerror(-ret));
         goto free_vhost;
     }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 6f7f91533d..c595957983 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -235,9 +235,8 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
     fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
     fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
-                         VHOST_BACKEND_TYPE_USER, 0);
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "vhost_dev_init failed");
         goto err_virtio;
     }
 
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index a6f08c26b9..b6a4a25ea1 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -108,9 +108,8 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
     ret = vhost_dev_init(&vvc->vhost_dev, &vsock->vhost_user,
-                         VHOST_BACKEND_TYPE_USER, 0);
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "vhost_dev_init failed");
         goto err_virtio;
     }
 
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 8ddfb9abfe..777cafe70d 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -170,9 +170,8 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     vhost_vsock_common_realize(vdev, "vhost-vsock");
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
-                         VHOST_BACKEND_TYPE_KERNEL, 0);
+                         VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "vhost-vsock: vhost_dev_init failed");
         goto err_virtio;
     }
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b7bde7657..991c67ddcd 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1286,7 +1286,8 @@ static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
 }
 
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
-                   VhostBackendType backend_type, uint32_t busyloop_timeout)
+                   VhostBackendType backend_type, uint32_t busyloop_timeout,
+                   Error **errp)
 {
     uint64_t features;
     int i, r, n_initialized_vqs = 0;
@@ -1300,24 +1301,26 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 
     r = hdev->vhost_ops->vhost_backend_init(hdev, opaque);
     if (r < 0) {
+        error_setg(errp, "vhost_backend_init failed");
         goto fail;
     }
 
     r = hdev->vhost_ops->vhost_set_owner(hdev);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_set_owner failed");
+        error_setg(errp, "vhost_set_owner failed");
         goto fail;
     }
 
     r = hdev->vhost_ops->vhost_get_features(hdev, &features);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost_get_features failed");
+        error_setg(errp, "vhost_get_features failed");
         goto fail;
     }
 
     for (i = 0; i < hdev->nvqs; ++i, ++n_initialized_vqs) {
         r = vhost_virtqueue_init(hdev, hdev->vqs + i, hdev->vq_index + i);
         if (r < 0) {
+            error_setg_errno(errp, -r, "Failed to initialize virtqueue %d", i);
             goto fail;
         }
     }
@@ -1327,6 +1330,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
             r = vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i,
                                                      busyloop_timeout);
             if (r < 0) {
+                error_setg(errp, "Failed to set busyloop timeout");
                 goto fail_busyloop;
             }
         }
@@ -1367,7 +1371,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     if (hdev->migration_blocker != NULL) {
         r = migrate_add_blocker(hdev->migration_blocker, &local_err);
         if (local_err) {
-            error_report_err(local_err);
+            error_propagate(errp, local_err);
             error_free(hdev->migration_blocker);
             goto fail_busyloop;
         }
@@ -1384,8 +1388,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
 
     if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
-        error_report("vhost backend memory slots limit is less"
-                " than current number of present memory slots");
+        error_setg(errp, "vhost backend memory slots limit is less"
+                   " than current number of present memory slots");
         r = -1;
         goto fail_busyloop;
     }
-- 
2.30.2


