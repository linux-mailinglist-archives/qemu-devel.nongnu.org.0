Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A74CC582
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:58:19 +0100 (CET)
Received: from localhost ([::1]:42350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqeY-0004ke-MW
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqaP-0005e8-G1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqaN-0000l5-T9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646333639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F76VF33U9aNuTvsqTZiiHD4W5TqCriqu2nRCtZXPgt8=;
 b=Z9feXFi+8dTGOqnucBEy+rCIG7vFueAxqdZK7oZ8jFuy9Bh9IpWiAhaRWFA3e08iDRcvl8
 zlSVmqMJScMj//6M7NXRanwGTdqMctU8yZMIa7DFYG+zMv4HlCONd1X+4Ht4d4UuB7p4Qa
 DcmWVb/5zhb9UBD79x5PT5uYJudf0DI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-p9qImeCwPyS8Y8BV7A8oTw-1; Thu, 03 Mar 2022 13:53:56 -0500
X-MC-Unique: p9qImeCwPyS8Y8BV7A8oTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6FB1854E2A;
 Thu,  3 Mar 2022 18:53:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF6FE80FC8;
 Thu,  3 Mar 2022 18:53:26 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/14] vhost: Add vhost_svq_valid_features to shadow vq
Date: Thu,  3 Mar 2022 19:51:37 +0100
Message-Id: <20220303185147.3605350-5-eperezma@redhat.com>
In-Reply-To: <20220303185147.3605350-1-eperezma@redhat.com>
References: <20220303185147.3605350-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
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
 hw/virtio/vhost-shadow-virtqueue.c | 44 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c             | 15 ++++++++++
 3 files changed, 61 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index cbc5213579..9e12f77201 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -33,6 +33,8 @@ typedef struct VhostShadowVirtqueue {
     EventNotifier svq_call;
 } VhostShadowVirtqueue;
 
+bool vhost_svq_valid_features(uint64_t features, Error **errp);
+
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5c1e09be5d..ba3cc0f428 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -11,9 +11,53 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "linux-headers/linux/vhost.h"
 
+/**
+ * Validate the transport device features that both guests can use with the SVQ
+ * and SVQs can use with the device.
+ *
+ * @dev_features: The features
+ * @errp: Error pointer
+ */
+bool vhost_svq_valid_features(uint64_t features, Error **errp)
+{
+    bool ok = true;
+    uint64_t svq_features = features;
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
+            if (!(svq_features & BIT_ULL(b))) {
+                set_bit(b, &svq_features);
+                ok = false;
+            }
+            continue;
+
+        default:
+            if (svq_features & BIT_ULL(b)) {
+                clear_bit(b, &svq_features);
+                ok = false;
+            }
+        }
+    }
+
+    if (ok) {
+        error_setg(errp, "SVQ Invalid device feature flags, offer: 0x%"PRIx64
+                         ", ok: 0x%"PRIx64, features, svq_features);
+    }
+    return ok;
+}
+
 /**
  * Forward guest notifications.
  *
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index d5865a5d77..77ad56e06c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -348,11 +348,26 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
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
+    ok = vhost_svq_valid_features(svq_features, errp);
+    if (unlikely(!ok)) {
+        return -1;
+    }
+
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
         g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();
-- 
2.27.0


