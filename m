Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CE4D8B17
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:51:00 +0100 (CET)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToqQ-0003qi-PX
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:50:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobL-0005jC-LG
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobI-0007g1-2U
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuncSNL5cIyNNFVX3t8rQOhlPMrP64lBXXUP9IMPAtI=;
 b=AKah9W5IsuMKSxbKqUjsxZXqoupuFU8D99J8XppoRJXe+t/vKJfpAWOniff5yuQ5uHkhCv
 xJn6EbMVeYVdXnP6Qmmn2tlhFFF4p3LfT2csTdmtH5khvZOz5OFuAlLwWvMkcXySBFMxnV
 Y1xULLHpeFfP9h0rLrX8oIh5/DFdRhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-7SHymmQ_MTGqiPnP2zL-ug-1; Mon, 14 Mar 2022 13:35:10 -0400
X-MC-Unique: 7SHymmQ_MTGqiPnP2zL-ug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2899B833962
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:35:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87F34401E40;
 Mon, 14 Mar 2022 17:35:09 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/15] vhost: Add VhostIOVATree
Date: Mon, 14 Mar 2022 18:34:50 +0100
Message-Id: <20220314173455.200342-11-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-1-eperezma@redhat.com>
References: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tree is able to look for a translated address from an IOVA address.

At first glance it is similar to util/iova-tree. However, SVQ working on
devices with limited IOVA space need more capabilities, like allocating
IOVA chunks or performing reverse translations (qemu addresses to iova).

The allocation capability, as "assign a free IOVA address to this chunk
of memory in qemu's address space" allows shadow virtqueue to create a
new address space that is not restricted by guest's addressable one, so
we can allocate shadow vqs vrings outside of it.

It duplicates the tree so it can search efficiently in both directions,
and it will signal overlap if iova or the translated address is present
in any tree.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h |  27 +++++++++
 hw/virtio/vhost-iova-tree.c | 110 ++++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build       |   2 +-
 3 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-iova-tree.c

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
new file mode 100644
index 0000000000..6a4f24e0f9
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.h
@@ -0,0 +1,27 @@
+/*
+ * vhost software live migration iova tree
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
+#include "qemu/iova-tree.h"
+#include "exec/memory.h"
+
+typedef struct VhostIOVATree VhostIOVATree;
+
+VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
+void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
+
+const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
+                                        const DMAMap *map);
+int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
+void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map);
+
+#endif
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
new file mode 100644
index 0000000000..55fed1fefb
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.c
@@ -0,0 +1,110 @@
+/*
+ * vhost software live migration iova tree
+ *
+ * SPDX-FileCopyrightText: Red Hat, Inc. 2021
+ * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/iova-tree.h"
+#include "vhost-iova-tree.h"
+
+#define iova_min_addr qemu_real_host_page_size
+
+/**
+ * VhostIOVATree, able to:
+ * - Translate iova address
+ * - Reverse translate iova address (from translated to iova)
+ * - Allocate IOVA regions for translated range (linear operation)
+ */
+struct VhostIOVATree {
+    /* First addressable iova address in the device */
+    uint64_t iova_first;
+
+    /* Last addressable iova address in the device */
+    uint64_t iova_last;
+
+    /* IOVA address to qemu memory maps. */
+    IOVATree *iova_taddr_map;
+};
+
+/**
+ * Create a new IOVA tree
+ *
+ * Returns the new IOVA tree
+ */
+VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
+{
+    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
+
+    /* Some devices do not like 0 addresses */
+    tree->iova_first = MAX(iova_first, iova_min_addr);
+    tree->iova_last = iova_last;
+
+    tree->iova_taddr_map = iova_tree_new();
+    return tree;
+}
+
+/**
+ * Delete an iova tree
+ */
+void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
+{
+    iova_tree_destroy(iova_tree->iova_taddr_map);
+    g_free(iova_tree);
+}
+
+/**
+ * Find the IOVA address stored from a memory address
+ *
+ * @tree: The iova tree
+ * @map: The map with the memory address
+ *
+ * Return the stored mapping, or NULL if not found.
+ */
+const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
+                                        const DMAMap *map)
+{
+    return iova_tree_find_iova(tree->iova_taddr_map, map);
+}
+
+/**
+ * Allocate a new mapping
+ *
+ * @tree: The iova tree
+ * @map: The iova map
+ *
+ * Returns:
+ * - IOVA_OK if the map fits in the container
+ * - IOVA_ERR_INVALID if the map does not make sense (like size overflow)
+ * - IOVA_ERR_NOMEM if tree cannot allocate more space.
+ *
+ * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
+ */
+int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
+{
+    /* Some vhost devices do not like addr 0. Skip first page */
+    hwaddr iova_first = tree->iova_first ?: qemu_real_host_page_size;
+
+    if (map->translated_addr + map->size < map->translated_addr ||
+        map->perm == IOMMU_NONE) {
+        return IOVA_ERR_INVALID;
+    }
+
+    /* Allocate a node in IOVA address */
+    return iova_tree_alloc_map(tree->iova_taddr_map, map, iova_first,
+                               tree->iova_last);
+}
+
+/**
+ * Remove existing mappings from iova tree
+ *
+ * @iova_tree: The vhost iova tree
+ * @map: The map to remove
+ */
+void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map)
+{
+    iova_tree_remove(iova_tree->iova_taddr_map, map);
+}
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 2dc87613bc..6047670804 100644
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


