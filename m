Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CB5AA865
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:57:12 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0c3-0002BG-Dd
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NR-0007Cc-VN
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NQ-0004m5-Ck
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpL+WzmcRefiHk4+5YNb2+iLVYt8rr8sZxmtKMXuM+4=;
 b=XLqS5eGiTBRUPBOxePoa0sKOUMlIGc+HXG9PkUzxcx/POYzWm2e5HJbphjj6MR6D1qFb7E
 7t9h8pjVpkwdT7FNDM4spL8kAc70nJX2pzhVjgfBwrXQBi3g7KroRaDeqAzUiXP8E+buDY
 +8kq1JTc2gqrFjNkjUnkX0NjerY8e80=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-8GZvU4BdOiGao3uRixSSCg-1; Fri, 02 Sep 2022 02:42:00 -0400
X-MC-Unique: 8GZvU4BdOiGao3uRixSSCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E8283810796;
 Fri,  2 Sep 2022 06:42:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3D11415137;
 Fri,  2 Sep 2022 06:41:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/21] vdpa: Make SVQ vring unmapping return void
Date: Fri,  2 Sep 2022 14:41:22 +0800
Message-Id: <20220902064138.56468-6-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

Nothing actually reads the return value, but an error in cleaning some
entries could cause device stop to abort, making a restart impossible.
Better ignore explicitely the return value.

Reported-by: Lei Yang <leiyang@redhat.com>
Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e16e0e2..e208dd0 100644
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
2.7.4


