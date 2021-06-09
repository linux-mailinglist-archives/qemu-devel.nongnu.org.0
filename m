Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9633A1A3A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:55:03 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Xm-00007r-GE
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QO-0007Dn-6o
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QK-0003Ws-DG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jf6IwMWyNVTUnSBHgtlV4DtEob3+rpzWaDyNe4htD5g=;
 b=KM4o029cj3rUEXoyk0Hu+YpptBYtCI+6fkO+XyzpmUpOJ0ie4tn5l/do0cDj/Oq3V28CvN
 IsYeN2/HffZaGH1ehFrGmuPnXPPXALXoLzUFIQrecNza0/Dci9JwaLg4kTePJ4lHRMHYLO
 ULwlp5M0LaNSLerilHd+bLxG8IyeqCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-TkYEZD0jP72DXhsLIzv2JQ-1; Wed, 09 Jun 2021 11:47:16 -0400
X-MC-Unique: TkYEZD0jP72DXhsLIzv2JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 883341922962;
 Wed,  9 Jun 2021 15:47:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71F4A60E3A;
 Wed,  9 Jun 2021 15:47:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] vhost: Distinguish errors in vhost_backend_init()
Date: Wed,  9 Jun 2021 17:46:53 +0200
Message-Id: <20210609154658.350308-3-kwolf@redhat.com>
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

Instead of just returning 0/-1 and letting the caller make up a
meaningless error message, add an Error parameter to allow reporting the
real error and switch to 0/-errno so that different kind of errors can
be distinguished in the caller.

Specifically, in vhost-user, EPROTO is used for all errors that relate
to the connection itself, whereas other error codes are used for errors
relating to the content of the connection. This will allow us later to
automatically reconnect when the connection goes away, without ending up
in an endless loop if it's a permanent error in the configuration.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  3 ++-
 hw/virtio/vhost-backend.c         |  2 +-
 hw/virtio/vhost-user.c            | 41 ++++++++++++++++---------------
 hw/virtio/vhost-vdpa.c            |  2 +-
 hw/virtio/vhost.c                 | 13 +++++-----
 5 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..728ebb0ed9 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -37,7 +37,8 @@ struct vhost_scsi_target;
 struct vhost_iotlb_msg;
 struct vhost_virtqueue;
 
-typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque);
+typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque,
+                                  Error **errp);
 typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
 typedef int (*vhost_backend_memslots_limit)(struct vhost_dev *dev);
 
diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 31b33bde37..f4f71cf58a 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -30,7 +30,7 @@ static int vhost_kernel_call(struct vhost_dev *dev, unsigned long int request,
     return ioctl(fd, request, arg);
 }
 
-static int vhost_kernel_init(struct vhost_dev *dev, void *opaque)
+static int vhost_kernel_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_KERNEL);
 
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe045..024cb201bb 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1856,7 +1856,8 @@ static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
     return 0;
 }
 
-static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
+static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
+                                   Error **errp)
 {
     uint64_t features, protocol_features, ram_slots;
     struct vhost_user *u;
@@ -1871,7 +1872,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
 
     err = vhost_user_get_features(dev, &features);
     if (err < 0) {
-        return err;
+        return -EPROTO;
     }
 
     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
@@ -1880,7 +1881,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
         err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
                                  &protocol_features);
         if (err < 0) {
-            return err;
+            return -EPROTO;
         }
 
         dev->protocol_features =
@@ -1891,14 +1892,14 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
             dev->protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
         } else if (!(protocol_features &
                     (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
-            error_report("Device expects VHOST_USER_PROTOCOL_F_CONFIG "
-                    "but backend does not support it.");
-            return -1;
+            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
+                       "but backend does not support it.");
+            return -EINVAL;
         }
 
         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
         if (err < 0) {
-            return err;
+            return -EPROTO;
         }
 
         /* query the max queues we support if backend supports Multiple Queue */
@@ -1906,12 +1907,12 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
             err = vhost_user_get_u64(dev, VHOST_USER_GET_QUEUE_NUM,
                                      &dev->max_queues);
             if (err < 0) {
-                return err;
+                return -EPROTO;
             }
         }
         if (dev->num_queues && dev->max_queues < dev->num_queues) {
-            error_report("The maximum number of queues supported by the "
-                         "backend is %" PRIu64, dev->max_queues);
+            error_setg(errp, "The maximum number of queues supported by the "
+                       "backend is %" PRIu64, dev->max_queues);
             return -EINVAL;
         }
 
@@ -1920,9 +1921,9 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
                     VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
                  virtio_has_feature(dev->protocol_features,
                     VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
-            error_report("IOMMU support requires reply-ack and "
-                         "slave-req protocol features.");
-            return -1;
+            error_setg(errp, "IOMMU support requires reply-ack and "
+                       "slave-req protocol features.");
+            return -EINVAL;
         }
 
         /* get max memory regions if backend supports configurable RAM slots */
@@ -1932,15 +1933,15 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
         } else {
             err = vhost_user_get_max_memslots(dev, &ram_slots);
             if (err < 0) {
-                return err;
+                return -EPROTO;
             }
 
             if (ram_slots < u->user->memory_slots) {
-                error_report("The backend specified a max ram slots limit "
-                             "of %" PRIu64", when the prior validated limit was %d. "
-                             "This limit should never decrease.", ram_slots,
-                             u->user->memory_slots);
-                return -1;
+                error_setg(errp, "The backend specified a max ram slots limit "
+                           "of %" PRIu64", when the prior validated limit was "
+                           "%d. This limit should never decrease.", ram_slots,
+                           u->user->memory_slots);
+                return -EINVAL;
             }
 
             u->user->memory_slots = MIN(ram_slots, VHOST_USER_MAX_RAM_SLOTS);
@@ -1958,7 +1959,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
     if (dev->vq_index == 0) {
         err = vhost_setup_slave_channel(dev);
         if (err < 0) {
-            return err;
+            return -EPROTO;
         }
     }
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ee51863d28..c2aadb57cb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -273,7 +273,7 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
 }
 
-static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
+static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
     uint64_t features;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 991c67ddcd..fd13135706 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1289,9 +1289,9 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type, uint32_t busyloop_timeout,
                    Error **errp)
 {
+    ERRP_GUARD();
     uint64_t features;
     int i, r, n_initialized_vqs = 0;
-    Error *local_err = NULL;
 
     hdev->vdev = NULL;
     hdev->migration_blocker = NULL;
@@ -1299,9 +1299,11 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     r = vhost_set_backend_type(hdev, backend_type);
     assert(r >= 0);
 
-    r = hdev->vhost_ops->vhost_backend_init(hdev, opaque);
+    r = hdev->vhost_ops->vhost_backend_init(hdev, opaque, errp);
     if (r < 0) {
-        error_setg(errp, "vhost_backend_init failed");
+        if (!*errp) {
+            error_setg_errno(errp, -r, "vhost_backend_init failed");
+        }
         goto fail;
     }
 
@@ -1369,9 +1371,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     }
 
     if (hdev->migration_blocker != NULL) {
-        r = migrate_add_blocker(hdev->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        r = migrate_add_blocker(hdev->migration_blocker, errp);
+        if (*errp) {
             error_free(hdev->migration_blocker);
             goto fail_busyloop;
         }
-- 
2.30.2


