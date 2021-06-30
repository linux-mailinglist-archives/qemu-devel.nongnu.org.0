Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82D3B8702
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:24:56 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyd1D-0001hn-Bu
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycg3-00033N-Fc
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfj-000787-IR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lY+CR9DyqRcBSb40dZwh7LYxoBtVR7xXUAS+jL4NECA=;
 b=Qw/Gl1U9l34zfH0z3cT9DZwcEsjgfEgDGM9nYeuFIBWUkt1VrB6dtfcFqYg/AQXFyG3o5d
 uUYdM6wZlIR5oESEmGtk5+7PlPdvonagdsFduiV2lfzjypIjdAQLNQohRThPLqa9BXjgAA
 HudrW8o98ZmDJJQbD8PqdfxBin4c+dE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-dIwABHB4McWUHZgDcQ1rug-1; Wed, 30 Jun 2021 12:02:37 -0400
X-MC-Unique: dIwABHB4McWUHZgDcQ1rug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52AC110C1ADC;
 Wed, 30 Jun 2021 16:02:36 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ED52604CD;
 Wed, 30 Jun 2021 16:02:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/24] vhost: Return 0/-errno in vhost_dev_init()
Date: Wed, 30 Jun 2021 18:02:02 +0200
Message-Id: <20210630160206.276439-21-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of just returning 0/-1 and letting the caller make up a
meaningless error message, switch to 0/-errno so that different kinds of
errors can be distinguished in the caller.

This involves changing a few more callbacks in VhostOps to return
0/-errno: .vhost_set_owner(), .vhost_get_features() and
.vhost_virtqueue_set_busyloop_timeout(). The implementations of these
functions are trivial as they generally just send a message to the
backend.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210609154658.350308-4-kwolf@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/virtio/vhost-backend.c |  4 +++-
 hw/virtio/vhost-user.c    | 10 +++++++---
 hw/virtio/vhost-vdpa.c    |  4 +++-
 hw/virtio/vhost.c         |  8 ++++----
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index f4f71cf58a..594d770b75 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -24,10 +24,12 @@ static int vhost_kernel_call(struct vhost_dev *dev, unsigned long int request,
                              void *arg)
 {
     int fd = (uintptr_t) dev->opaque;
+    int ret;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_KERNEL);
 
-    return ioctl(fd, request, arg);
+    ret = ioctl(fd, request, arg);
+    return ret < 0 ? -errno : ret;
 }
 
 static int vhost_kernel_init(struct vhost_dev *dev, void *opaque, Error **errp)
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 024cb201bb..889559d86a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1353,7 +1353,11 @@ static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 
 static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
 {
-    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
+    if (vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features) < 0) {
+        return -EPROTO;
+    }
+
+    return 0;
 }
 
 static int vhost_user_set_owner(struct vhost_dev *dev)
@@ -1364,7 +1368,7 @@ static int vhost_user_set_owner(struct vhost_dev *dev)
     };
 
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+        return -EPROTO;
     }
 
     return 0;
@@ -1872,7 +1876,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
 
     err = vhost_user_get_features(dev, &features);
     if (err < 0) {
-        return -EPROTO;
+        return err;
     }
 
     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 80827ee040..0f469f1823 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -245,10 +245,12 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
 {
     struct vhost_vdpa *v = dev->opaque;
     int fd = v->device_fd;
+    int ret;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
 
-    return ioctl(fd, request, arg);
+    ret = ioctl(fd, request, arg);
+    return ret < 0 ? -errno : ret;
 }
 
 static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index fd13135706..c7f9d8bb06 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1309,13 +1309,13 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 
     r = hdev->vhost_ops->vhost_set_owner(hdev);
     if (r < 0) {
-        error_setg(errp, "vhost_set_owner failed");
+        error_setg_errno(errp, -r, "vhost_set_owner failed");
         goto fail;
     }
 
     r = hdev->vhost_ops->vhost_get_features(hdev, &features);
     if (r < 0) {
-        error_setg(errp, "vhost_get_features failed");
+        error_setg_errno(errp, -r, "vhost_get_features failed");
         goto fail;
     }
 
@@ -1332,7 +1332,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
             r = vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i,
                                                      busyloop_timeout);
             if (r < 0) {
-                error_setg(errp, "Failed to set busyloop timeout");
+                error_setg_errno(errp, -r, "Failed to set busyloop timeout");
                 goto fail_busyloop;
             }
         }
@@ -1391,7 +1391,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
         error_setg(errp, "vhost backend memory slots limit is less"
                    " than current number of present memory slots");
-        r = -1;
+        r = -EINVAL;
         goto fail_busyloop;
     }
 
-- 
2.31.1


