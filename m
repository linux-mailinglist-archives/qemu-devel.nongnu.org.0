Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44714CC5DF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:18:08 +0100 (CET)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqxj-0002ZG-N5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqcu-00033w-6o
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:56:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqcr-0004Ar-EQ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646333792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/e0o6p4l3xb+Xy+qhqmF3duRsJ+itiKiXLZLnF0hC8=;
 b=VKy+B5lW5wGmRpp7ec49hMUw2Xqoss52C4N2EMIcb8aQcnLRl31+keESGI0XUvW68kjELZ
 vxrfHdFMUGXfG6cVAkfd8Hmu9IEM7TK4oEfM30l1LJFnP7xLXGbj9J03u6rZFN4Yx7Qp0q
 klbH4bWmIEpmqWyRZNCv9DZ6sKqsDO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-YGYBCHN6NKOfqHkOxzFINg-1; Thu, 03 Mar 2022 13:56:30 -0500
X-MC-Unique: YGYBCHN6NKOfqHkOxzFINg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0565B801AB2;
 Thu,  3 Mar 2022 18:56:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 741A580FCD;
 Thu,  3 Mar 2022 18:56:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/14] vdpa: Expose VHOST_F_LOG_ALL on SVQ
Date: Thu,  3 Mar 2022 19:51:46 +0100
Message-Id: <20220303185147.3605350-14-eperezma@redhat.com>
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
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SVQ is able to log the dirty bits by itself, so let's use it to not
block migration.

Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
enabled. Even if the device supports it, the reports would be nonsense
because SVQ memory is in the qemu region.

The log region is still allocated. Future changes might skip that, but
this series is already long enough.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 39 ++++++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index ee8e939ad0..a29dbb3f53 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -30,6 +30,7 @@ typedef struct vhost_vdpa {
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
+    uint64_t acked_features;
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 5470566ce2..8dedab4450 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -373,6 +373,16 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
     return v->index != 0;
 }
 
+static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
+                                       uint64_t *features)
+{
+    int ret;
+
+    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
+    trace_vhost_vdpa_get_features(dev, *features);
+    return ret;
+}
+
 static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
                                Error **errp)
 {
@@ -385,7 +395,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
         return 0;
     }
 
-    r = hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
+    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
     if (r != 0) {
         error_setg_errno(errp, -r, "Can't get vdpa device features");
         return r;
@@ -609,12 +619,29 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
 static int vhost_vdpa_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
 
     if (vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
 
+    if (v->shadow_vqs_enabled) {
+        if ((v->acked_features ^ features) == BIT_ULL(VHOST_F_LOG_ALL)) {
+            /*
+             * QEMU is just trying to enable or disable logging. SVQ handles
+             * this sepparately, so no need to forward this.
+             */
+            v->acked_features = features;
+            return 0;
+        }
+
+        v->acked_features = features;
+
+        /* We must not ack _F_LOG if SVQ is enabled */
+        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
+    }
+
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
     if (ret) {
@@ -1202,10 +1229,14 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    int ret;
+    struct vhost_vdpa *v = dev->opaque;
+    int ret = vhost_vdpa_get_dev_features(dev, features);
+
+    if (ret == 0 && v->shadow_vqs_enabled) {
+        /* Add SVQ logging capabilities */
+        *features |= BIT_ULL(VHOST_F_LOG_ALL);
+    }
 
-    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
-    trace_vhost_vdpa_get_features(dev, *features);
     return ret;
 }
 
-- 
2.27.0


