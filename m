Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F80389424
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:52:48 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPR9-0004mI-4S
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7J-0006qp-50
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7H-000672-8U
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7dtTOJdCmRYBm6EIMcBw+fVvfbwCuQ3tsienHtyc0Y=;
 b=bv3gNVA5GqJwbonOU3h9BctyrWVr5BZMU6KCDxPcNZqBiDaVLkPBnhJHfmwCWEbr0micFS
 zW+vnJQefVSB9UwGZwKcardw/oZPZY1qQZnb8mDT+vX2OaJJBsUTWNA/SOOL6CoZbcdvVG
 FCgOvdFjpQi/PwXVn0B3tIiyrwxyIEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-V6j5Gc9oPmWp9KUswrXCXg-1; Wed, 19 May 2021 12:32:11 -0400
X-MC-Unique: V6j5Gc9oPmWp9KUswrXCXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 136ECC73A0;
 Wed, 19 May 2021 16:32:10 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EFB55D6AC;
 Wed, 19 May 2021 16:32:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 24/29] vhost: Add iova_rev_maps_alloc
Date: Wed, 19 May 2021 18:28:58 +0200
Message-Id: <20210519162903.1172366-25-eperezma@redhat.com>
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

This way the tree can store/map a completely new virtual address space,
in the range the device admits.

It does not limit the range it will allocate, but the IOVA address of
the maps are allocated growing. A range limitation will be need for the
cases where start_addr != 0.

Tools for remove mappings will be needed also.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h | 11 +++---
 hw/virtio/vhost-iova-tree.c | 72 +++++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
index 589e86bd91..92e2d992b3 100644
--- a/hw/virtio/vhost-iova-tree.h
+++ b/hw/virtio/vhost-iova-tree.h
@@ -22,16 +22,17 @@ typedef struct VhostDMAMap {
 } VhostDMAMap;
 
 typedef enum VhostDMAMapNewRC {
+    VHOST_DMA_MAP_NO_SPACE = -3,
     VHOST_DMA_MAP_OVERLAP = -2,
     VHOST_DMA_MAP_INVALID = -1,
     VHOST_DMA_MAP_OK = 0,
 } VhostDMAMapNewRC;
 
 /**
- * VhostIOVATree
- *
- * Store and search IOVA -> Translated mappings and the reverse, from
- * translated address to IOVA.
+ * VhostIOVATree, able to:
+ * - Translate iova address
+ * - Reverse translate iova address (from translated to iova)
+ * - Allocate IOVA regions for translated range (potentially slow operation)
  *
  * Note that it cannot remove nodes.
  */
@@ -54,5 +55,7 @@ const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *iova_rm,
                                               const VhostDMAMap *map);
 VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *iova_rm,
                                         VhostDMAMap *map);
+VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *iova_rm,
+                                       VhostDMAMap *map);
 
 #endif
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index 2900390a1e..7699d96bbb 100644
--- a/hw/virtio/vhost-iova-tree.c
+++ b/hw/virtio/vhost-iova-tree.c
@@ -187,8 +187,30 @@ const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tree,
                                   vhost_iova_tree_cmp_iova);
 }
 
+static bool vhost_iova_tree_find_iova_hole(const GArray *iova_map,
+                                           const VhostDMAMap *map,
+                                           const VhostDMAMap **prev_elem)
+{
+    size_t i;
+    hwaddr iova = 0;
+
+    *prev_elem = NULL;
+    for (i = 0; i < iova_map->len; i++) {
+        const VhostDMAMap *next = &g_array_index(iova_map, typeof(*next), i);
+        hwaddr hole_end = next->iova;
+        if (map->size < hole_end - iova) {
+            return true;
+        }
+
+        iova = next->iova + next->size + 1;
+        *prev_elem = next;
+    }
+
+    return ((hwaddr)-1 - iova) > iova_map->len;
+}
+
 /**
- * Insert a new map
+ * Insert a new map - internal
  *
  * @tree  The iova tree
  * @map   The iova map
@@ -197,10 +219,13 @@ const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tree,
  * - VHOST_DMA_MAP_OK if the map fits in the container
  * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size overflow)
  * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
- * Can query the assignated iova in map.
+ * - VHOST_DMA_MAP_NO_SPACE if iova_rm cannot allocate more space.
+ *
+ * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
  */
-VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
-                                        VhostDMAMap *map)
+static VhostDMAMapNewRC vhost_iova_tree_insert_int(VhostIOVATree *tree,
+                                                   VhostDMAMap *map,
+                                                   bool allocate)
 {
     const VhostDMAMap *qemu_prev, *iova_prev;
     int find_prev_rc;
@@ -210,12 +235,27 @@ VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
         return VHOST_DMA_MAP_INVALID;
     }
 
-    /* Check for duplicates, and save position for insertion */
-    find_prev_rc = vhost_iova_tree_find_prev(tree->iova_taddr_map,
-                                             vhost_iova_tree_cmp_iova, map,
-                                             &iova_prev);
-    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
-        return VHOST_DMA_MAP_OVERLAP;
+    if (allocate) {
+        /* Search for a hole in iova space big enough */
+        bool fit = vhost_iova_tree_find_iova_hole(tree->iova_taddr_map, map,
+                                                &iova_prev);
+        if (!fit) {
+            return VHOST_DMA_MAP_NO_SPACE;
+        }
+
+        map->iova = iova_prev ? (iova_prev->iova + iova_prev->size) + 1 : 0;
+    } else {
+        if (map->iova + map->size < map->iova) {
+            return VHOST_DMA_MAP_INVALID;
+        }
+
+        /* Check for duplicates, and save position for insertion */
+        find_prev_rc = vhost_iova_tree_find_prev(tree->iova_taddr_map,
+                                                 vhost_iova_tree_cmp_iova, map,
+                                                 &iova_prev);
+        if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
+            return VHOST_DMA_MAP_OVERLAP;
+        }
     }
 
     find_prev_rc = vhost_iova_tree_find_prev(tree->taddr_iova_map,
@@ -229,3 +269,15 @@ VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
     vhost_iova_tree_insert_after(tree->taddr_iova_map, qemu_prev, map);
     return VHOST_DMA_MAP_OK;
 }
+
+VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
+                                        VhostDMAMap *map)
+{
+    return vhost_iova_tree_insert_int(tree, map, false);
+}
+
+VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *tree,
+                                       VhostDMAMap *map)
+{
+    return vhost_iova_tree_insert_int(tree, map, true);
+}
-- 
2.27.0


