Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8464C5B6A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 14:51:26 +0100 (CET)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOJxN-0001HL-Ub
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 08:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJsM-0006kN-U1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:46:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJsK-00008X-Mk
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645969572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uNIzho57hIwgkOLFZvuQiJWSAKhoptPkGji/wt9br0=;
 b=PFfXRub1BL4m2cAnfwGC+L246gUjibfNU4XwNcX9HzdF1pfy/O4bUnApPAaHXtbgHZrgsL
 jDIBcVYlGF8pc/d6lhofyMseYGwXxVgFGYTYIqRKFPmt5huG7gT9A9VyRFQVCdCi4QSmX6
 V1xAX0a2Az6RqH5LpkiEWFSaLfyzpTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-fkJmsKFsPRiOiZnLDCuW1w-1; Sun, 27 Feb 2022 08:46:10 -0500
X-MC-Unique: fkJmsKFsPRiOiZnLDCuW1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F056E51DF;
 Sun, 27 Feb 2022 13:46:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7199684978;
 Sun, 27 Feb 2022 13:44:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/14] vhost: Add vhost_svq_valid_features to shadow vq
Date: Sun, 27 Feb 2022 14:41:01 +0100
Message-Id: <20220227134111.3254066-5-eperezma@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows SVQ to negotiate features with the guest and the device. For
the device, SVQ is a driver. While this function bypasses all
non-transport features, it needs to disable the features that SVQ does
not support when forwarding buffers. This includes packed vq layout,
indirect descriptors or event idx.

Future changes can add support to offer more features to the guest,
since the use of VirtQueue gives this for free. This is left out at the
moment for simplicity.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 39 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c             | 18 ++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 1d4c160d0a..84747655ad 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -33,6 +33,8 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier svq_call;
 } VhostShadowVirtqueue;
 
+bool vhost_svq_valid_features(uint64_t *features);
+
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 54c701a196..34354aea2c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -14,6 +14,45 @@
 #include "qemu/main-loop.h"
 #include "linux-headers/linux/vhost.h"
 
+/**
+ * Validate the transport device features that both guests can use with the SVQ
+ * and SVQs can use with the device.
+ *
+ * @dev_features  The features. If success, the acknowledged features. If
+ *                failure, the minimal set from it.
+ *
+ * Returns true if SVQ can go with a subset of these, false otherwise.
+ */
+bool vhost_svq_valid_features(uint64_t *features)
+{
+    bool r = true;
+
+    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END;
+         ++b) {
+        switch (b) {
+        case VIRTIO_F_ANY_LAYOUT:
+            continue;
+
+        case VIRTIO_F_ACCESS_PLATFORM:
+            /* SVQ trust in the host's IOMMU to translate addresses */
+        case VIRTIO_F_VERSION_1:
+            /* SVQ trust that the guest vring is little endian */
+            if (!(*features & BIT_ULL(b))) {
+                set_bit(b, features);
+                r = false;
+            }
+            continue;
+
+        default:
+            if (*features & BIT_ULL(b)) {
+                clear_bit(b, features);
+            }
+        }
+    }
+
+    return r;
+}
+
 /** Forward guest notifications */
 static void vhost_handle_guest_kick(EventNotifier *n)
 {
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c73215751d..d614c435f3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -348,11 +348,29 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
                                Error **errp)
 {
     g_autoptr(GPtrArray) shadow_vqs = NULL;
+    uint64_t dev_features, svq_features;
+    int r;
+    bool ok;
 
     if (!v->shadow_vqs_enabled) {
         return 0;
     }
 
+    r = hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
+    if (r != 0) {
+        error_setg_errno(errp, -r, "Can't get vdpa device features");
+        return r;
+    }
+
+    svq_features = dev_features;
+    ok = vhost_svq_valid_features(&svq_features);
+    if (unlikely(!ok)) {
+        error_setg(errp,
+            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok: 0x%"PRIx64,
+            dev_features, svq_features);
+        return -1;
+    }
+
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();
-- 
2.27.0


