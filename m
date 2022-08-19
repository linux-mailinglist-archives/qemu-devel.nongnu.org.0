Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A259A2B5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:58:22 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5K9-0003xD-J7
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5GJ-0006dD-Hg
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5GD-0000Zm-I8
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGKCrHfWyk+48LQ4AbcCYbjB5Buw/lbISq6Ne0M6TtM=;
 b=AP44tCkIr8qETK6JHXR2TvNfyMO7A/OBYUssklRopuT7QKigTo6aFC7t9j7dTb260/3inf
 f+6I5uSTYGOKepAAS/MTBRfm/I3Kgq9t7OwZoaXQ6Scp0RW9O7VicbhkS8xZxCZV+eYiP2
 jDs6zGTXL4SAgquoSPbhlMjPGxl31HY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-hanN21knP3y4isPBmNrXlg-1; Fri, 19 Aug 2022 12:54:09 -0400
X-MC-Unique: hanN21knP3y4isPBmNrXlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B12CC3C025B2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 16:54:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DE6E2026D4C;
 Fri, 19 Aug 2022 16:54:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 5/7] vdpa: Make SVQ vring unmapping return void
Date: Fri, 19 Aug 2022 18:53:55 +0200
Message-Id: <20220819165357.3591965-6-eperezma@redhat.com>
In-Reply-To: <20220819165357.3591965-1-eperezma@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
---
 hw/virtio/vhost-vdpa.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 943799c17c..07d00f5284 100644
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
@@ -893,37 +893,32 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
 
     if (unlikely(!result)) {
         error_report("Unable to find SVQ address to unmap");
-        return false;
+        return;
     }
 
     size = ROUND_UP(result->size, qemu_real_host_page_size());
     r = vhost_vdpa_dma_unmap(v, result->iova, size);
     if (unlikely(r < 0)) {
-        return false;
+        return;
     }
 
     vhost_iova_tree_remove(v->iova_tree, result);
-    return 0;
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
@@ -1094,26 +1089,22 @@ err:
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
@@ -1130,10 +1121,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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


