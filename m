Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759754966A6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:52:16 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0tL-0002DG-Fo
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0aW-0007Jv-1R
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0aO-0003le-Gm
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jgARwVIGJsOLSejZ82BTrsFR4MjPE//QjHyrl1Conw=;
 b=ZjDG9wWdHe/hOQkBEr70YWWFXqsoHmzSecG8fCVRp6TCTe0hVwwmvixn4N5j/d4nFljWVl
 2JoQ1kw+7ZdDhcqifQYOqmoNKD1zw6RtQxRqe0iKXvkR+4YcgYbxaZRLMJ2RQp53kE9MS9
 Beg4H1uNDc/Kx0iteURjGkCCgIjnVqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-WMWkOhbYOm6jex1YxIEusg-1; Fri, 21 Jan 2022 15:32:35 -0500
X-MC-Unique: WMWkOhbYOm6jex1YxIEusg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5A9814243;
 Fri, 21 Jan 2022 20:32:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB1DF167A7;
 Fri, 21 Jan 2022 20:32:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to shadow vq
Date: Fri, 21 Jan 2022 21:27:13 +0100
Message-Id: <20220121202733.404989-12-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows SVQ to negotiate features with the device. For the device,
SVQ is a driver. While this function needs to bypass all non-transport
features, it needs to disable the features that SVQ does not support
when forwarding buffers. This includes packed vq layout, indirect
descriptors or event idx.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 44 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c             | 21 ++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index c9ffa11fce..d963867a04 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,6 +15,8 @@
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
+bool vhost_svq_valid_device_features(uint64_t *features);
+
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
 const EventNotifier *vhost_svq_get_dev_kick_notifier(
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 9619c8082c..51442b3dbf 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
     return &svq->hdev_kick;
 }
 
+/**
+ * Validate the transport device features that SVQ can use with the device
+ *
+ * @dev_features  The device features. If success, the acknowledged features.
+ *
+ * Returns true if SVQ can go with a subset of these, false otherwise.
+ */
+bool vhost_svq_valid_device_features(uint64_t *dev_features)
+{
+    bool r = true;
+
+    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END;
+         ++b) {
+        switch (b) {
+        case VIRTIO_F_NOTIFY_ON_EMPTY:
+        case VIRTIO_F_ANY_LAYOUT:
+            continue;
+
+        case VIRTIO_F_ACCESS_PLATFORM:
+            /* SVQ does not know how to translate addresses */
+            if (*dev_features & BIT_ULL(b)) {
+                clear_bit(b, dev_features);
+                r = false;
+            }
+            break;
+
+        case VIRTIO_F_VERSION_1:
+            /* SVQ trust that guest vring is little endian */
+            if (!(*dev_features & BIT_ULL(b))) {
+                set_bit(b, dev_features);
+                r = false;
+            }
+            continue;
+
+        default:
+            if (*dev_features & BIT_ULL(b)) {
+                clear_bit(b, dev_features);
+            }
+        }
+    }
+
+    return r;
+}
+
 /* Forward guest notifications */
 static void vhost_handle_guest_kick(EventNotifier *n)
 {
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bdb45c8808..9d801cf907 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -855,10 +855,31 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     size_t n_svqs = v->shadow_vqs_enabled ? hdev->nvqs : 0;
     g_autoptr(GPtrArray) shadow_vqs = g_ptr_array_new_full(n_svqs,
                                                            vhost_psvq_free);
+    uint64_t dev_features;
+    uint64_t svq_features;
+    int r;
+    bool ok;
+
     if (!v->shadow_vqs_enabled) {
         goto out;
     }
 
+    r = vhost_vdpa_get_features(hdev, &dev_features);
+    if (r != 0) {
+        error_setg(errp, "Can't get vdpa device features, got (%d)", r);
+        return r;
+    }
+
+    svq_features = dev_features;
+    ok = vhost_svq_valid_device_features(&svq_features);
+    if (unlikely(!ok)) {
+        error_setg(errp,
+            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok: 0x%"PRIx64,
+            hdev->features, svq_features);
+        return -1;
+    }
+
+    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         VhostShadowVirtqueue *svq = vhost_svq_new();
 
-- 
2.27.0


