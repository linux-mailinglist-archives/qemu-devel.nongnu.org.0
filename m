Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF357D210
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:57:09 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZU4-000610-8G
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZHM-0002Aw-Dv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZHJ-0000Zm-TR
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUjqvKfBp+q+/hoAuGtccOAUnm9KuzXgnGroh9qasNA=;
 b=AZANrPdTNzwCTnxu0yfHi85pd/ZovReKllsKfi7JAzSEGIsjIUR7CZfnPWejN5EIo+MQs1
 cQ+2IP3UgCNtxFD70rzauV+7D4RsfkpKryaWOIOO5zLKqrf/QZrfrK0YwjpvhFLZFEzTa+
 iMETnhM+tGshQdVMsVlXelUdhQ/RuSU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-hBY4UZa0MOCSpO7QRTdamA-1; Thu, 21 Jul 2022 12:43:45 -0400
X-MC-Unique: hBY4UZa0MOCSpO7QRTdamA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834EE185A7B2;
 Thu, 21 Jul 2022 16:43:44 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 086E540D2962;
 Thu, 21 Jul 2022 16:43:41 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 3/6] vdpa: Allocate SVQ unconditionally
Date: Thu, 21 Jul 2022 18:43:28 +0200
Message-Id: <20220721164331.3328625-4-eperezma@redhat.com>
In-Reply-To: <20220721164331.3328625-1-eperezma@redhat.com>
References: <20220721164331.3328625-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SVQ may run or not in a device depending on runtime conditions (for
example, if the device can move CVQ to its own group or not).

Allocate the resources unconditionally, and decide later if to use them
or not.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 29f8262e29..95014d3736 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -400,6 +400,21 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     int r;
     bool ok;
 
+    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
+    for (unsigned n = 0; n < hdev->nvqs; ++n) {
+        g_autoptr(VhostShadowVirtqueue) svq;
+
+        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
+                            v->shadow_vq_ops_opaque);
+        if (unlikely(!svq)) {
+            error_setg(errp, "Cannot create svq %u", n);
+            return -1;
+        }
+        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
+    }
+
+    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
+
     if (!v->shadow_vqs_enabled) {
         return 0;
     }
@@ -416,20 +431,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
         return -1;
     }
 
-    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
-    for (unsigned n = 0; n < hdev->nvqs; ++n) {
-        g_autoptr(VhostShadowVirtqueue) svq;
-
-        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
-                            v->shadow_vq_ops_opaque);
-        if (unlikely(!svq)) {
-            error_setg(errp, "Cannot create svq %u", n);
-            return -1;
-        }
-        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
-    }
-
-    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
     return 0;
 }
 
@@ -570,10 +571,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
     struct vhost_vdpa *v = dev->opaque;
     size_t idx;
 
-    if (!v->shadow_vqs) {
-        return;
-    }
-
     for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
         vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
     }
-- 
2.31.1


