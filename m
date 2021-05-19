Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADE389416
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:51:07 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPPV-0001FB-AD
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6C-0004kC-N0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6B-0005h2-2E
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDk6ORb0CFQX0SjnjEy5Mjgwnx7Of5HDLZ0WqbSxD4w=;
 b=c9qJE3yIss8CfECwZSLXDq4OEY8M2KTVbfziJFGOTR0jDne8v41O0fn/HjVLvg1LDIphYm
 95WVYwm8kMqAtsIR/2LC9oaJACN8Ze9bR9ugmftCD7/7BPUBUSaw4WdpPmAkNAAzU0omGX
 pxCaFJPd01B0F9crQ0Jx7WV6gFWuEAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-OB_nGhGKP5y1vWnP045JCA-1; Wed, 19 May 2021 12:31:03 -0400
X-MC-Unique: OB_nGhGKP5y1vWnP045JCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72BFE108BD0C;
 Wed, 19 May 2021 16:31:02 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 859ED5D6D5;
 Wed, 19 May 2021 16:30:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 14/29] vhost: add vhost_has_limited_iova_range
Date: Wed, 19 May 2021 18:28:48 +0200
Message-Id: <20210519162903.1172366-15-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  5 +++++
 hw/virtio/vhost.c         | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 67cedf83da..c97a4c0017 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -88,6 +88,10 @@ struct vhost_dev {
     bool log_enabled;
     bool shadow_vqs_enabled;
     uint64_t log_size;
+    struct {
+        hwaddr first;
+        hwaddr last;
+    } iova_range;
     VhostShadowVirtqueue **shadow_vqs;
     Error *migration_blocker;
     const VhostOps *vhost_ops;
@@ -129,6 +133,7 @@ uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
                         uint64_t features);
 bool vhost_has_free_slot(void);
+bool vhost_has_limited_iova_range(const struct vhost_dev *hdev);
 
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 9c9c63345b..333877ca3b 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1386,6 +1386,18 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         goto fail;
     }
 
+    if (hdev->vhost_ops->vhost_get_iova_range) {
+        r = hdev->vhost_ops->vhost_get_iova_range(hdev,
+                                                 &hdev->iova_range.first,
+                                                 &hdev->iova_range.last);
+        if (unlikely(r != 0)) {
+            error_report("Can't request IOVA range");
+            goto fail;
+        }
+    } else {
+        hdev->iova_range.last = (hwaddr)-1;
+    }
+
     for (i = 0; i < hdev->nvqs; ++i, ++n_initialized_vqs) {
         r = vhost_virtqueue_init(hdev, hdev->vqs + i, hdev->vq_index + i);
         if (r < 0) {
@@ -1622,6 +1634,11 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     }
 }
 
+bool vhost_has_limited_iova_range(const struct vhost_dev *hdev)
+{
+    return hdev->iova_range.first || hdev->iova_range.last != HWADDR_MAX;
+}
+
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
 {
-- 
2.27.0


