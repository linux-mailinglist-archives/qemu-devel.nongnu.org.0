Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AD4D3F56
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:47:07 +0100 (CET)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8pW-000073-H2
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8ia-000487-H7
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8iY-00043U-Rf
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gF9LcZBCbJobxcFmMEEE9EcBDqtd4kAEVJV9zw2lvU0=;
 b=IZNQbRE4LRbLp7dgkFJBT2kam7dYkRFT48fbmzW5jOz/UVBypoP9xDBAr7uhyDrq7ttO+q
 U9pLTheo6ZSgFnV6/9R6KKzTvwPnB7Buw490FQEgguQ4mATd0iSjfPKEuDX5GVTw2gSGA+
 jZFpXmE/YdOC1z+fdSX5dgHcupHtXhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-13cFdI-MNV-YY48qccppPw-1; Wed, 09 Mar 2022 21:39:53 -0500
X-MC-Unique: 13cFdI-MNV-YY48qccppPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C6A6801AEB;
 Thu, 10 Mar 2022 02:39:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE38B1078676;
 Thu, 10 Mar 2022 02:39:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 06/15] virtio: Add vhost_svq_get_vring_addr
Date: Thu, 10 Mar 2022 10:38:58 +0800
Message-Id: <20220310023907.2443-7-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
References: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

It reports the shadow virtqueue address from qemu virtual address space.

Since this will be different from the guest's vaddr, but the device can
access it, SVQ takes special care about its alignment & lack of garbage
data. It assumes that IOMMU will work in host_page_size ranges for that.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 29 +++++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  9 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 280736e..b44759e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -108,6 +108,35 @@ void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)
 }
 
 /**
+ * Get the shadow vq vring address.
+ * @svq: Shadow virtqueue
+ * @addr: Destination to store address
+ */
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr)
+{
+    addr->desc_user_addr = (uint64_t)svq->vring.desc;
+    addr->avail_user_addr = (uint64_t)svq->vring.avail;
+    addr->used_user_addr = (uint64_t)svq->vring.used;
+}
+
+size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
+{
+    size_t desc_size = sizeof(vring_desc_t) * svq->vring.num;
+    size_t avail_size = offsetof(vring_avail_t, ring) +
+                                             sizeof(uint16_t) * svq->vring.num;
+
+    return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size);
+}
+
+size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq)
+{
+    size_t used_size = offsetof(vring_used_t, ring) +
+                                    sizeof(vring_used_elem_t) * svq->vring.num;
+    return ROUND_UP(used_size, qemu_real_host_page_size);
+}
+
+/**
  * Set a new file descriptor for the guest to kick the SVQ and notify for avail
  *
  * @svq: The svq
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 9e12f77..82cea1c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -11,9 +11,14 @@
 #define VHOST_SHADOW_VIRTQUEUE_H
 
 #include "qemu/event_notifier.h"
+#include "hw/virtio/virtio.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Shadow virtqueue to relay notifications */
 typedef struct VhostShadowVirtqueue {
+    /* Shadow vring */
+    struct vring vring;
+
     /* Shadow kick notifier, sent to vhost */
     EventNotifier hdev_kick;
     /* Shadow call notifier, sent to vhost */
@@ -37,6 +42,10 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr);
+size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
+size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
 
 void vhost_svq_stop(VhostShadowVirtqueue *svq);
 
-- 
2.7.4


