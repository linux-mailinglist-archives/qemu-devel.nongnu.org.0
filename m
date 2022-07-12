Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344A57130E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:25:45 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAH9-0003i2-Qf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBA7J-0005sC-Tu
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBA7H-0006FH-NI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rwjfjExn+wG1ucbjx3Vn2878/88Fyf5V5axZfvfWapU=;
 b=HZNeaZgRKnz8jVADjE5KvmrMJ/b4ZVZ3z8kvZVuHAyVmMDBKS7lqm6vX2+3bECErT/wHVc
 l28JfgLnRuoH+q5rTNYsqR8ztbTzY6yQ8FlsiO8XcMbMws99h116TN2dcRio1fFUy8jqrV
 hOoJB1FIit0NtInO1/CHImMGduAl9i8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-AzknjKfuPwucrh47q0WHbA-1; Tue, 12 Jul 2022 03:15:28 -0400
X-MC-Unique: AzknjKfuPwucrh47q0WHbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6C6D1C06ECE;
 Tue, 12 Jul 2022 07:15:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D5940D2827;
 Tue, 12 Jul 2022 07:15:26 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Subject: [PATCH] vdpa: Clean vhost_vdpa_dev_start(dev, false)
Date: Tue, 12 Jul 2022 09:15:24 +0200
Message-Id: <20220712071524.2144723-1-eperezma@redhat.com>
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

Return value is never checked and is a clean path, so assume success

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 66f054a12c..d6ba4a492a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -872,41 +872,35 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
 /**
  * Unmap a SVQ area in the device
  */
-static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
+static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
                                       const DMAMap *needle)
 {
     const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
     hwaddr size;
-    int r;
 
     if (unlikely(!result)) {
         error_report("Unable to find SVQ address to unmap");
-        return false;
+        return;
     }
 
     size = ROUND_UP(result->size, qemu_real_host_page_size());
-    r = vhost_vdpa_dma_unmap(v, result->iova, size);
-    return r == 0;
+    vhost_vdpa_dma_unmap(v, result->iova, size);
 }
 
-static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
+static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
                                        const VhostShadowVirtqueue *svq)
 {
     DMAMap needle = {};
     struct vhost_vdpa *v = dev->opaque;
     struct vhost_vring_addr svq_addr;
-    bool ok;
 
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
     needle.translated_addr = svq_addr.desc_user_addr;
-    ok = vhost_vdpa_svq_unmap_ring(v, &needle);
-    if (unlikely(!ok)) {
-        return false;
-    }
+    vhost_vdpa_svq_unmap_ring(v, &needle);
 
     needle.translated_addr = svq_addr.used_user_addr;
-    return vhost_vdpa_svq_unmap_ring(v, &needle);
+    vhost_vdpa_svq_unmap_ring(v, &needle);
 }
 
 /**
@@ -1066,23 +1060,19 @@ err:
     return false;
 }
 
-static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
+static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
     if (!v->shadow_vqs) {
-        return true;
+        return;
     }
 
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
-        bool ok = vhost_vdpa_svq_unmap_rings(dev, svq);
-        if (unlikely(!ok)) {
-            return false;
-        }
+        vhost_vdpa_svq_unmap_rings(dev, svq);
     }
 
-    return true;
 }
 
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
@@ -1099,10 +1089,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         }
         vhost_vdpa_set_vring_ready(dev);
     } else {
-        ok = vhost_vdpa_svqs_stop(dev);
-        if (unlikely(!ok)) {
-            return -1;
-        }
+        vhost_vdpa_svqs_stop(dev);
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-- 
2.31.1


