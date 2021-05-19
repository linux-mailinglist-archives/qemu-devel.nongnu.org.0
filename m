Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A838942E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:53:49 +0200 (CEST)
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPS8-0007hY-Np
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP7B-0006Ov-Fe
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP72-00062D-7U
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uP4UtvtAVqjJFYeWJ8J8gGnTPjK6WSRqP+XvyKxXAtY=;
 b=dio4liD2o2WwwhJKk7Ub+RtXB2TwgES1trRkYHhR5beaKQg7PINuyX8wKhrvymwBORu00p
 Kpzqh4odqhqSaw0NsaHJNCFzk6tGfQ419xNVQGA46KVzf6YwRkUCzWvGDDRBG6UM5dLGlY
 q3ZicqdEmJ/YnbluEGYDHHoXf7/fGEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-pXOuTORTNKqDLRTZ1BdAgA-1; Wed, 19 May 2021 12:31:56 -0400
X-MC-Unique: pXOuTORTNKqDLRTZ1BdAgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E030107ACC7;
 Wed, 19 May 2021 16:31:54 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C43F5D6AC;
 Wed, 19 May 2021 16:31:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 22/29] vhost: Add iova_rev_maps_find_iova to IOVAReverseMaps
Date: Wed, 19 May 2021 18:28:56 +0200
Message-Id: <20210519162903.1172366-23-eperezma@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

Shadow virtqueue can translate addresses from guest's address to it's
own address space this way. It duplicates the array so it can search
efficiently both directions, and it will signal overlap if iova or the
translated address is present in it's each array.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h | 10 +++++++-
 hw/virtio/vhost-iova-tree.c | 49 ++++++++++++++++++++++++++++++++++---
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
index 2a44af8b3a..589e86bd91 100644
--- a/hw/virtio/vhost-iova-tree.h
+++ b/hw/virtio/vhost-iova-tree.h
@@ -30,18 +30,26 @@ typedef enum VhostDMAMapNewRC {
 /**
  * VhostIOVATree
  *
- * Store and search IOVA -> Translated mappings.
+ * Store and search IOVA -> Translated mappings and the reverse, from
+ * translated address to IOVA.
  *
  * Note that it cannot remove nodes.
  */
 typedef struct VhostIOVATree {
     /* Ordered array of reverse translations, IOVA address to qemu memory. */
     GArray *iova_taddr_map;
+
+    /*
+     * Ordered array of translations from qemu virtual memory address to iova
+     */
+    GArray *taddr_iova_map;
 } VhostIOVATree;
 
 void vhost_iova_tree_new(VhostIOVATree *iova_rm);
 void vhost_iova_tree_destroy(VhostIOVATree *iova_rm);
 
+const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_rm,
+                                             const VhostDMAMap *map);
 const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *iova_rm,
                                               const VhostDMAMap *map);
 VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *iova_rm,
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index dfd7e448b5..2900390a1e 100644
--- a/hw/virtio/vhost-iova-tree.c
+++ b/hw/virtio/vhost-iova-tree.c
@@ -39,6 +39,22 @@ static void vhost_iova_tree_insert_after(GArray *array,
     g_array_insert_val(array, pos, *map);
 }
 
+static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b)
+{
+    const VhostDMAMap *m1 = a, *m2 = b;
+
+    if (m1->translated_addr > m2->translated_addr + m2->size) {
+        return 1;
+    }
+
+    if (m1->translated_addr + m1->size < m2->translated_addr) {
+        return -1;
+    }
+
+    /* Overlapped */
+    return 0;
+}
+
 static gint vhost_iova_tree_cmp_iova(gconstpointer a, gconstpointer b)
 {
     const VhostDMAMap *m1 = a, *m2 = b;
@@ -106,6 +122,9 @@ void vhost_iova_tree_new(VhostIOVATree *tree)
     tree->iova_taddr_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
                                        G_ARRAY_NOT_CLEAR_ON_ALLOC,
                                        sizeof(VhostDMAMap));
+    tree->taddr_iova_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
+                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
+                                       sizeof(VhostDMAMap));
 }
 
 /**
@@ -116,6 +135,7 @@ void vhost_iova_tree_new(VhostIOVATree *tree)
 void vhost_iova_tree_destroy(VhostIOVATree *tree)
 {
     g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
+    g_array_unref(g_steal_pointer(&tree->taddr_iova_map));
 }
 
 /**
@@ -137,6 +157,21 @@ static const VhostDMAMap *vhost_iova_tree_bsearch(const GArray *array,
     return bsearch(map, array->data, array->len, sizeof(*map), compare_func);
 }
 
+/**
+ * Find the IOVA address stored from a memory address
+ *
+ * @tree     The iova tree
+ * @map      The map with the memory address
+ *
+ * Return the stored mapping, or NULL if not found.
+ */
+const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
+                                             const VhostDMAMap *map)
+{
+    return vhost_iova_tree_bsearch(tree->taddr_iova_map, map,
+                                   vhost_iova_tree_cmp_taddr);
+}
+
 /**
  * Find the translated address stored from a IOVA address
  *
@@ -167,7 +202,7 @@ const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tree,
 VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
                                         VhostDMAMap *map)
 {
-    const VhostDMAMap *prev;
+    const VhostDMAMap *qemu_prev, *iova_prev;
     int find_prev_rc;
 
     if (map->translated_addr + map->size < map->translated_addr ||
@@ -178,11 +213,19 @@ VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
     /* Check for duplicates, and save position for insertion */
     find_prev_rc = vhost_iova_tree_find_prev(tree->iova_taddr_map,
                                              vhost_iova_tree_cmp_iova, map,
-                                             &prev);
+                                             &iova_prev);
+    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
+        return VHOST_DMA_MAP_OVERLAP;
+    }
+
+    find_prev_rc = vhost_iova_tree_find_prev(tree->taddr_iova_map,
+                                             vhost_iova_tree_cmp_taddr, map,
+                                             &qemu_prev);
     if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
         return VHOST_DMA_MAP_OVERLAP;
     }
 
-    vhost_iova_tree_insert_after(tree->iova_taddr_map, prev, map);
+    vhost_iova_tree_insert_after(tree->iova_taddr_map, iova_prev, map);
+    vhost_iova_tree_insert_after(tree->taddr_iova_map, qemu_prev, map);
     return VHOST_DMA_MAP_OK;
 }
-- 
2.27.0


