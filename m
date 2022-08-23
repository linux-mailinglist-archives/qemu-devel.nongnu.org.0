Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6B59EB02
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:29:37 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYee-0007Xh-EL
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVv-0005Hr-FX
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVn-00032s-0j
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVAI0XQR71Qx+C2I4r1Zdev0VxbN2Lha6UU6sZcicsk=;
 b=NFMWexMeUEZR1eeDzc5D6QqyInIHwls+uAzq8IwXAdhrA+CTs+Ky3Vj8Jjcwfkl8Ad02qs
 kc/76RCPezVZHjIvKcLDJ6813BWtIEYH22z8DHerXd2TNw0ZLy+4p+n50XZdKy4Jpx4ZVJ
 Fk8GjE3JkjoG6nVNkW7R8MHm3rNbJcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-wgJcY9HzOPKo5LZBjqaP8Q-1; Tue, 23 Aug 2022 14:20:19 -0400
X-MC-Unique: wgJcY9HzOPKo5LZBjqaP8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D6C0811E83;
 Tue, 23 Aug 2022 18:20:18 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE5CB40D2830;
 Tue, 23 Aug 2022 18:20:16 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 3/7] util: accept iova_tree_remove_parameter by value
Date: Tue, 23 Aug 2022 20:20:04 +0200
Message-Id: <20220823182008.97141-4-eperezma@redhat.com>
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

It's convenient to call iova_tree_remove from a map returned from
iova_tree_find or iova_tree_find_iova. With the current code this is not
possible, since we will free it, and then we will try to search for it
again.

Fix it making accepting the map by value, forcing a copy of the
argument. Not applying a fixes tag, since there is no use like that at
the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v2: Accept map parameter by value instead of make a copy
---
 hw/virtio/vhost-iova-tree.h | 2 +-
 include/qemu/iova-tree.h    | 2 +-
 hw/i386/intel_iommu.c       | 6 +++---
 hw/virtio/vhost-iova-tree.c | 2 +-
 hw/virtio/vhost-vdpa.c      | 6 +++---
 net/vhost-vdpa.c            | 4 ++--
 util/iova-tree.c            | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
index 6a4f24e0f9..4adfd79ff0 100644
--- a/hw/virtio/vhost-iova-tree.h
+++ b/hw/virtio/vhost-iova-tree.h
@@ -22,6 +22,6 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
 const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
                                         const DMAMap *map);
 int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
-void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map);
+void vhost_iova_tree_remove(VhostIOVATree *iova_tree, DMAMap map);
 
 #endif
diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 16bbfdf5f8..8528e5c98f 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -73,7 +73,7 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map);
  * all the mappings that are included in the provided range will be
  * removed from the tree.  Here map->translated_addr is meaningless.
  */
-void iova_tree_remove(IOVATree *tree, const DMAMap *map);
+void iova_tree_remove(IOVATree *tree, DMAMap map);
 
 /**
  * iova_tree_find:
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 2162394e08..05d53a1aa9 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1187,7 +1187,7 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
                     return ret;
                 }
                 /* Drop any existing mapping */
-                iova_tree_remove(as->iova_tree, &target);
+                iova_tree_remove(as->iova_tree, target);
                 /* Recover the correct type */
                 event->type = IOMMU_NOTIFIER_MAP;
                 entry->perm = cache_perm;
@@ -1200,7 +1200,7 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
             trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
             return 0;
         }
-        iova_tree_remove(as->iova_tree, &target);
+        iova_tree_remove(as->iova_tree, target);
     }
 
     trace_vtd_page_walk_one(info->domain_id, entry->iova,
@@ -3563,7 +3563,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
     map.iova = n->start;
     map.size = size;
-    iova_tree_remove(as->iova_tree, &map);
+    iova_tree_remove(as->iova_tree, map);
 }
 
 static void vtd_address_space_unmap_all(IntelIOMMUState *s)
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index 67bf6d57ab..3d03395a77 100644
--- a/hw/virtio/vhost-iova-tree.c
+++ b/hw/virtio/vhost-iova-tree.c
@@ -104,7 +104,7 @@ int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
  * @iova_tree: The vhost iova tree
  * @map: The map to remove
  */
-void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map)
+void vhost_iova_tree_remove(VhostIOVATree *iova_tree, DMAMap map)
 {
     iova_tree_remove(iova_tree->iova_taddr_map, map);
 }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7e28d2f674..87e0ad393f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -240,7 +240,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
 
 fail_map:
     if (v->shadow_vqs_enabled) {
-        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+        vhost_iova_tree_remove(v->iova_tree, mem_region);
     }
 
 fail:
@@ -300,7 +300,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
             return;
         }
         iova = result->iova;
-        vhost_iova_tree_remove(v->iova_tree, result);
+        vhost_iova_tree_remove(v->iova_tree, *result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
@@ -944,7 +944,7 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
                            needle->perm == IOMMU_RO);
     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Cannot map region to device");
-        vhost_iova_tree_remove(v->iova_tree, needle);
+        vhost_iova_tree_remove(v->iova_tree, *needle);
     }
 
     return r == 0;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 303447a68e..a49e7e649d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -244,7 +244,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
         error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
     }
 
-    vhost_iova_tree_remove(tree, map);
+    vhost_iova_tree_remove(tree, *map);
 }
 
 static size_t vhost_vdpa_net_cvq_cmd_len(void)
@@ -297,7 +297,7 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
     return true;
 
 dma_map_err:
-    vhost_iova_tree_remove(v->iova_tree, &map);
+    vhost_iova_tree_remove(v->iova_tree, map);
     return false;
 }
 
diff --git a/util/iova-tree.c b/util/iova-tree.c
index fee530a579..536789797e 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -164,11 +164,11 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }
 
-void iova_tree_remove(IOVATree *tree, const DMAMap *map)
+void iova_tree_remove(IOVATree *tree, DMAMap map)
 {
     const DMAMap *overlap;
 
-    while ((overlap = iova_tree_find(tree, map))) {
+    while ((overlap = iova_tree_find(tree, &map))) {
         g_tree_remove(tree->tree, overlap);
     }
 }
-- 
2.31.1


