Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E34C5B9D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 14:53:20 +0100 (CET)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOJzD-0005UP-AR
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 08:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJtV-0000Ln-Cg
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:47:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJtS-0000Ic-VK
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645969642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDXU6UpHl0/oI7MgBQAtPBVnIgiTgkadVXrOkqkv12k=;
 b=CyuBgmz06wSCp2J4AfckwLIHG/zHYfvXTZ3aZE9tFWYal/XUAGTxpl4rZheVlIYnv2v5CE
 m66mPnPrsPEbx3yu5GDErJC1qz6J8IQ1Yj3NhxuKLsi00RAI7wMG0SUfBAkn0l7Cn8W7bm
 TxxsLF+Ks4hb0JWIDTkMTFaNIEE13co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-4lDy7s0AO3iW3Us8WOp6gw-1; Sun, 27 Feb 2022 08:47:19 -0500
X-MC-Unique: 4lDy7s0AO3iW3Us8WOp6gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD0A100C609;
 Sun, 27 Feb 2022 13:47:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6E1B84974;
 Sun, 27 Feb 2022 13:46:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/14] vdpa: adapt vhost_ops callbacks to svq
Date: Sun, 27 Feb 2022 14:41:03 +0100
Message-Id: <20220227134111.3254066-7-eperezma@redhat.com>
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

First half of the buffers forwarding part, preparing vhost-vdpa
callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
this is effectively dead code at the moment, but it helps to reduce
patch size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index d614c435f3..b2c4e92fcf 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -344,6 +344,16 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
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
@@ -356,7 +366,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
         return 0;
     }
 
-    r = hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
+    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
     if (r != 0) {
         error_setg_errno(errp, -r, "Can't get vdpa device features");
         return r;
@@ -583,12 +593,26 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
 static int vhost_vdpa_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
 
     if (vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
 
+    if (v->shadow_vqs_enabled) {
+        uint64_t features_ok = features;
+        bool ok;
+
+        ok = vhost_svq_valid_features(&features_ok);
+        if (unlikely(!ok)) {
+            error_report(
+                "Invalid guest acked feature flag, acked: 0x%"
+                PRIx64", ok: 0x%"PRIx64, features, features_ok);
+            return -EINVAL;
+        }
+    }
+
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
     if (ret) {
@@ -735,6 +759,13 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     return ret;
  }
 
+static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
+                                         struct vhost_vring_state *ring)
+{
+    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
+}
+
 static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
                                          struct vhost_vring_file *file)
 {
@@ -749,6 +780,18 @@ static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+static int vhost_vdpa_set_vring_dev_addr(struct vhost_dev *dev,
+                                         struct vhost_vring_addr *addr)
+{
+    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
+                                addr->desc_user_addr, addr->used_user_addr,
+                                addr->avail_user_addr,
+                                addr->log_guest_addr);
+
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
+
+}
+
 /**
  * Set the shadow virtqueue descriptors to the device
  *
@@ -859,11 +902,17 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
 static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
                                        struct vhost_vring_addr *addr)
 {
-    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
-                                    addr->desc_user_addr, addr->used_user_addr,
-                                    addr->avail_user_addr,
-                                    addr->log_guest_addr);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (v->shadow_vqs_enabled) {
+        /*
+         * Device vring addr was set at device start. SVQ base is handled by
+         * VirtQueue code.
+         */
+        return 0;
+    }
+
+    return vhost_vdpa_set_vring_dev_addr(dev, addr);
 }
 
 static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
@@ -876,8 +925,17 @@ static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
 static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
-    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (v->shadow_vqs_enabled) {
+        /*
+         * Device vring base was set at device start. SVQ base is handled by
+         * VirtQueue code.
+         */
+        return 0;
+    }
+
+    return vhost_vdpa_set_dev_vring_base(dev, ring);
 }
 
 static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
@@ -924,10 +982,14 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    int ret;
+    struct vhost_vdpa *v = dev->opaque;
+    int ret = vhost_vdpa_get_dev_features(dev, features);
+
+    if (ret == 0 && v->shadow_vqs_enabled) {
+        /* Filter only features that SVQ can offer to guest */
+        vhost_svq_valid_features(features);
+    }
 
-    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
-    trace_vhost_vdpa_get_features(dev, *features);
     return ret;
 }
 
-- 
2.27.0


