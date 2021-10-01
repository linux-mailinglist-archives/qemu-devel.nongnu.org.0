Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6841E854
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:29:23 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCyw-00022b-Ed
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjP-0005X5-6p
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjN-0005st-35
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CByrwRYklfGYjTqDhPlmZaxXos/A5kFvAs3larfYmKM=;
 b=F83HZQEAypW3SjLyz2UX9Ty0PMEmVdb/C+XWq4EV+cnExofdpEjf+6ogIiGjD7cInzWY1D
 G5Ai8n+RP3xwi/IGVy+WcPyiogyb3MA+xHuKdzVWSAKlRzxzt5ebfm2fPSSIjcZ7+GHNkc
 rTg9wZelaFKSK1EuuLCUMbcDTKaEMzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-yHXUKOIZPlKfNCnM_MbwFw-1; Fri, 01 Oct 2021 03:13:15 -0400
X-MC-Unique: yHXUKOIZPlKfNCnM_MbwFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EB7F100C630;
 Fri,  1 Oct 2021 07:13:14 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C1BB652B8;
 Fri,  1 Oct 2021 07:13:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
Date: Fri,  1 Oct 2021 09:06:01 +0200
Message-Id: <20211001070603.307037-19-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tree is able to look for a translated address from an IOVA address.

At first glance is similar to util/iova-tree. However, SVQ working on
devices with limited IOVA space need more capabilities, like allocating
IOVA chunks or perform reverse translations (qemu addresses to iova).

The allocation capability, as "assign a free IOVA address to this chunk
of memory in qemu's address space" allows shadow virtqueue to create a
new address space that is not restricted by guest's addressable one, so
we can allocate shadow vqs vrings outside of its reachability, nor
qemu's one. At the moment, the allocation is just done growing, not
allowing deletion.

A different name could be used, but ordered searchable array is a
little bit long though.

It duplicates the array so it can search efficiently both directions,
and it will signal overlap if iova or the translated address is
present in it's each array.

Use of array will be changed to util-iova-tree in future series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h |  40 +++++++
 hw/virtio/vhost-iova-tree.c | 230 ++++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build       |   2 +-
 3 files changed, 271 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-iova-tree.c

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
new file mode 100644
index 0000000000..d163a88905
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.h
@@ -0,0 +1,40 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
+#define HW_VIRTIO_VHOST_IOVA_TREE_H
+
+#include "exec/memory.h"
+
+typedef struct VhostDMAMap {
+    void *translated_addr;
+    hwaddr iova;
+    hwaddr size;                /* Inclusive */
+    IOMMUAccessFlags perm;
+} VhostDMAMap;
+
+typedef enum VhostDMAMapNewRC {
+    VHOST_DMA_MAP_NO_SPACE = -3,
+    VHOST_DMA_MAP_OVERLAP = -2,
+    VHOST_DMA_MAP_INVALID = -1,
+    VHOST_DMA_MAP_OK = 0,
+} VhostDMAMapNewRC;
+
+typedef struct VhostIOVATree VhostIOVATree;
+
+VhostIOVATree *vhost_iova_tree_new(void);
+void vhost_iova_tree_unref(VhostIOVATree *iova_rm);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_unref);
+
+const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_rm,
+                                             const VhostDMAMap *map);
+VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *iova_rm,
+                                       VhostDMAMap *map);
+
+#endif
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
new file mode 100644
index 0000000000..c284e27607
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.c
@@ -0,0 +1,230 @@
+/*
+ * vhost software live migration ring
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "vhost-iova-tree.h"
+
+#define G_ARRAY_NOT_ZERO_TERMINATED false
+#define G_ARRAY_NOT_CLEAR_ON_ALLOC false
+
+#define iova_min qemu_real_host_page_size
+
+/**
+ * VhostIOVATree, able to:
+ * - Translate iova address
+ * - Reverse translate iova address (from translated to iova)
+ * - Allocate IOVA regions for translated range (potentially slow operation)
+ *
+ * Note that it cannot remove nodes.
+ */
+struct VhostIOVATree {
+    /* Ordered array of reverse translations, IOVA address to qemu memory. */
+    GArray *iova_taddr_map;
+
+    /*
+     * Ordered array of translations from qemu virtual memory address to iova
+     */
+    GArray *taddr_iova_map;
+};
+
+/**
+ * Inserts an element after an existing one in garray.
+ *
+ * @array      The array
+ * @prev_elem  The previous element of array of NULL if prepending
+ * @map        The DMA map
+ *
+ * It provides the aditional advantage of being type safe over
+ * g_array_insert_val, which accepts a reference pointer instead of a value
+ * with no complains.
+ */
+static void vhost_iova_tree_insert_after(GArray *array,
+                                         const VhostDMAMap *prev_elem,
+                                         const VhostDMAMap *map)
+{
+    size_t pos;
+
+    if (!prev_elem) {
+        pos = 0;
+    } else {
+        pos = prev_elem - &g_array_index(array, typeof(*prev_elem), 0) + 1;
+    }
+
+    g_array_insert_val(array, pos, *map);
+}
+
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
+/**
+ * Find the previous node to a given iova
+ *
+ * @array  The ascending ordered-by-translated-addr array of VhostDMAMap
+ * @map    The map to insert
+ * @prev   Returned location of the previous map
+ *
+ * Return VHOST_DMA_MAP_OK if everything went well, or VHOST_DMA_MAP_OVERLAP if
+ * it already exists. It is ok to use this function to check if a given range
+ * exists, but it will use a linear search.
+ *
+ * TODO: We can use bsearch to locate the entry if we save the state in the
+ * needle, knowing that the needle is always the first argument to
+ * compare_func.
+ */
+static VhostDMAMapNewRC vhost_iova_tree_find_prev(const GArray *array,
+                                                  GCompareFunc compare_func,
+                                                  const VhostDMAMap *map,
+                                                  const VhostDMAMap **prev)
+{
+    size_t i;
+    int r;
+
+    *prev = NULL;
+    for (i = 0; i < array->len; ++i) {
+        r = compare_func(map, &g_array_index(array, typeof(*map), i));
+        if (r == 0) {
+            return VHOST_DMA_MAP_OVERLAP;
+        }
+        if (r < 0) {
+            return VHOST_DMA_MAP_OK;
+        }
+
+        *prev = &g_array_index(array, typeof(**prev), i);
+    }
+
+    return VHOST_DMA_MAP_OK;
+}
+
+/**
+ * Create a new IOVA tree
+ *
+ * Returns the new IOVA tree
+ */
+VhostIOVATree *vhost_iova_tree_new(void)
+{
+    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
+    tree->iova_taddr_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
+                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
+                                       sizeof(VhostDMAMap));
+    tree->taddr_iova_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
+                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
+                                       sizeof(VhostDMAMap));
+    return tree;
+}
+
+/**
+ * Destroy an IOVA tree
+ *
+ * @tree  The iova tree
+ */
+void vhost_iova_tree_unref(VhostIOVATree *tree)
+{
+    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
+    g_array_unref(g_steal_pointer(&tree->taddr_iova_map));
+}
+
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
+    /*
+     * This can be replaced with g_array_binary_search (Since glib 2.62) when
+     * that version become common enough.
+     */
+    return bsearch(map, tree->taddr_iova_map->data, tree->taddr_iova_map->len,
+                   sizeof(*map), vhost_iova_tree_cmp_taddr);
+}
+
+static bool vhost_iova_tree_find_iova_hole(const GArray *iova_map,
+                                           const VhostDMAMap *map,
+                                           const VhostDMAMap **prev_elem)
+{
+    size_t i;
+    hwaddr iova = iova_min;
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
+/**
+ * Allocate a new mapping
+ *
+ * @tree  The iova tree
+ * @map   The iova map
+ *
+ * Returns:
+ * - VHOST_DMA_MAP_OK if the map fits in the container
+ * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size overflow)
+ * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
+ * - VHOST_DMA_MAP_NO_SPACE if iova_rm cannot allocate more space.
+ *
+ * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
+ */
+VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *tree,
+                                       VhostDMAMap *map)
+{
+    const VhostDMAMap *qemu_prev, *iova_prev;
+    int find_prev_rc;
+    bool fit;
+
+    if (map->translated_addr + map->size < map->translated_addr ||
+        map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
+        return VHOST_DMA_MAP_INVALID;
+    }
+
+    /* Search for a hole in iova space big enough */
+    fit = vhost_iova_tree_find_iova_hole(tree->iova_taddr_map, map,
+                                         &iova_prev);
+    if (!fit) {
+        return VHOST_DMA_MAP_NO_SPACE;
+    }
+
+    map->iova = iova_prev ? (iova_prev->iova + iova_prev->size) + 1 : iova_min;
+    find_prev_rc = vhost_iova_tree_find_prev(tree->taddr_iova_map,
+                                             vhost_iova_tree_cmp_taddr, map,
+                                             &qemu_prev);
+    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
+        return VHOST_DMA_MAP_OVERLAP;
+    }
+
+    vhost_iova_tree_insert_after(tree->iova_taddr_map, iova_prev, map);
+    vhost_iova_tree_insert_after(tree->taddr_iova_map, qemu_prev, map);
+    return VHOST_DMA_MAP_OK;
+}
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 8b5a0225fe..cb306b83c6 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
+virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
-- 
2.27.0


