Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB764D8AE8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:37:47 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTode-0000JS-D9
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:37:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobN-0005l7-P6
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobI-0007fa-Hp
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BknqXWrmLkkz7oLRe8+EL4KF0342SkeEtELRBYQHio4=;
 b=Nxnl0VoOdLUVI1F7ggUvQ2YNGrJU4AOoaZc/wzq7CskQXMPWGOhNtm40spJpOCfkawPONi
 oyLPDM3JIifxME0oFVtS9A5fGBgfg3/NEOKhwE1Cb/UIrVa8KNXOu8gztJ1riQxmeicMMf
 44mLz5I29PBcaA/0TXiWQfhW7E7BbOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-W9VZALz3MCmfAcIAmaZX9w-1; Mon, 14 Mar 2022 13:35:05 -0400
X-MC-Unique: W9VZALz3MCmfAcIAmaZX9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C64D3811E9B
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:35:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C964492C14;
 Mon, 14 Mar 2022 17:35:03 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/15] virtio: Add vhost_svq_get_vring_addr
Date: Mon, 14 Mar 2022 18:34:45 +0100
Message-Id: <20220314173455.200342-6-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-1-eperezma@redhat.com>
References: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It reports the shadow virtqueue address from qemu virtual address space.

Since this will be different from the guest's vaddr, but the device can
access it, SVQ takes special care about its alignment & lack of garbage
data. It assumes that IOMMU will work in host_page_size ranges for that.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  9 +++++++++
 hw/virtio/vhost-shadow-virtqueue.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 9e12f77201..82cea1c3fa 100644
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
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 519328445c..573ac0d9cf 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -106,6 +106,35 @@ void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)
     }
 }
 
+/**
+ * Get the shadow vq vring address.
+ * @svq: Shadow virtqueue
+ * @addr: Destination to store address
+ */
+void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
+                              struct vhost_vring_addr *addr)
+{
+    addr->desc_user_addr = (uint64_t)(intptr_t)svq->vring.desc;
+    addr->avail_user_addr = (uint64_t)(intptr_t)svq->vring.avail;
+    addr->used_user_addr = (uint64_t)(intptr_t)svq->vring.used;
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
 /**
  * Set a new file descriptor for the guest to kick the SVQ and notify for avail
  *
-- 
2.27.0


