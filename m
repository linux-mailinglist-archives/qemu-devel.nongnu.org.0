Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582541E842
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:22:10 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCrw-0003ED-HS
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWChq-0001Qs-Gz
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCho-0004eV-RF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2JUZbCJP9MWb2hD4MtOi5qn59JQrKiwOlPWFUeqOe4=;
 b=YlY9x4kRJjN1PSOBE3/eIw7kL09viEv6MseXNCo5G7nXUbeFI6A/1PRShz98eBdU4UYyc0
 6ONvSWBxnen1WVjy+wZdOyUEex2fSKmU6fKlFW4pl8AcyQ4iKrgQxFlbiaUAu9Z1dYpj6R
 hHnDCTY11y1pLHJlnJioEaEOOr9PzKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-8RVtreyTM0iKYNvTSX8e-g-1; Fri, 01 Oct 2021 03:11:39 -0400
X-MC-Unique: 8RVtreyTM0iKYNvTSX8e-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B58E7801E72;
 Fri,  1 Oct 2021 07:11:37 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ABAC652A3;
 Fri,  1 Oct 2021 07:11:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 13/20] vdpa: Save host and guest features
Date: Fri,  1 Oct 2021 09:05:56 +0200
Message-Id: <20211001070603.307037-14-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Those are needed for SVQ: Host ones are needed to check if SVQ knows
how to talk with the device and for feature negotiation, and guest ones
to know if SVQ can talk with it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  2 ++
 hw/virtio/vhost-vdpa.c         | 31 ++++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index fddac248b3..9044ae694b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -26,6 +26,8 @@ typedef struct vhost_vdpa {
     int device_fd;
     uint32_t msg_type;
     MemoryListener listener;
+    uint64_t host_features;
+    uint64_t guest_features;
     bool shadow_vqs_enabled;
     GPtrArray *shadow_vqs;
     struct vhost_dev *dev;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6c5f4c98b8..a057e8277d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -439,10 +439,19 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
-static int vhost_vdpa_set_features(struct vhost_dev *dev,
-                                   uint64_t features)
+/**
+ * Internal set_features() that follows vhost/VirtIO protocol for that
+ */
+static int vhost_vdpa_backend_set_features(struct vhost_dev *dev,
+                                           uint64_t features)
 {
+    struct vhost_vdpa *v = dev->opaque;
+
     int ret;
+    if (v->host_features & BIT_ULL(VIRTIO_F_QUEUE_STATE)) {
+        features |= BIT_ULL(VIRTIO_F_QUEUE_STATE);
+    }
+
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
     uint8_t status = 0;
@@ -455,6 +464,17 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
 }
 
+/**
+ * Exposed vhost set features
+ */
+static int vhost_vdpa_set_features(struct vhost_dev *dev,
+                                   uint64_t features)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    v->guest_features = features;
+    return vhost_vdpa_backend_set_features(dev, features);
+}
+
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
@@ -673,12 +693,17 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 }
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
-                                     uint64_t *features)
+                                   uint64_t *features)
 {
     int ret;
 
     ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
     trace_vhost_vdpa_get_features(dev, *features);
+
+    if (ret == 0) {
+        struct vhost_vdpa *v = dev->opaque;
+        v->host_features = *features;
+    }
     return ret;
 }
 
-- 
2.27.0


