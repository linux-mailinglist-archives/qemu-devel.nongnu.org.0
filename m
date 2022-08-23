Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B7459EAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:25:16 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYaR-0002Mq-Oh
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYW3-0005Js-KZ
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVs-00033B-Cn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/ysaHEg4wLVJ9cVvql+QZB8JlJSjwXw/DATO27gCZY=;
 b=PzDGs6k2Bi+cdeiT6YPO60mvPOOk8XXExUc91YAIEEq7141WXb5at5tqcamaEmgcy17miJ
 0i8r9qVJuIgNU25k2+Dwvs+eI1XnlzVTBob+CaMWiZtTCyznCLVsEfQQyJJC8HJHOWnBMH
 kWHJOXIsDu59PdJ7rlo2Fdwhx1TTvZc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-8Cso2PujNfy2-JABWIrP2g-1; Tue, 23 Aug 2022 14:20:23 -0400
X-MC-Unique: 8Cso2PujNfy2-JABWIrP2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF75B80A0AE;
 Tue, 23 Aug 2022 18:20:22 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08C0C40D2830;
 Tue, 23 Aug 2022 18:20:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 5/7] vdpa: Make SVQ vring unmapping return void
Date: Tue, 23 Aug 2022 20:20:06 +0200
Message-Id: <20220823182008.97141-6-eperezma@redhat.com>
In-Reply-To: <20220823182008.97141-1-eperezma@redhat.com>
References: <20220823182008.97141-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Nothing actually reads the return value, but an error in cleaning some
entries could cause device stop to abort, making a restart impossible.
Better ignore explicitely the return value.

Reported-by: Lei Yang <leiyang@redhat.com>
Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e16e0e222e..e208dd000e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -884,7 +884,7 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
 /**
  * Unmap a SVQ area in the device
  */
-static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
+static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
                                       const DMAMap *needle)
 {
     const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
@@ -893,38 +893,33 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
 
     if (unlikely(!result)) {
         error_report("Unable to find SVQ address to unmap");
-        return false;
+        return;
     }
 
     size = ROUND_UP(result->size, qemu_real_host_page_size());
     r = vhost_vdpa_dma_unmap(v, result->iova, size);
     if (unlikely(r < 0)) {
         error_report("Unable to unmap SVQ vring: %s (%d)", g_strerror(-r), -r);
-        return false;
+        return;
     }
 
     vhost_iova_tree_remove(v->iova_tree, *result);
-    return r == 0;
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
@@ -1095,26 +1090,22 @@ err:
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
 
     if (v->migration_blocker) {
         migrate_del_blocker(v->migration_blocker);
     }
-    return true;
 }
 
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
@@ -1131,10 +1122,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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


