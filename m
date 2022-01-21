Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064234966BC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:03:09 +0100 (CET)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB13r-00062L-LP
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cQ-0000NN-UG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cO-00056N-VD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVcCjMEA5sXXHxOLlAezD5eoMZnDS2qYR31Nbhq9Sns=;
 b=SMI4hPBvi1ku+yKc/YJa4IB2dRlD5ykXGlduBdedGCHCcOOvZikOgE0Ff/bpIdq7EoZmXh
 haUPviVLbvbyCMWKA7ufuPzT/BqeNWphErsZxuCvNETn2OJh9ygDdjqIEG8pjSISQhQshb
 36/UnAfVJg+ZF6QXTRJt6JGGV/CIMXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-4F9Qnma4PGKTPtd6TFfZ9g-1; Fri, 21 Jan 2022 15:34:41 -0500
X-MC-Unique: 4F9Qnma4PGKTPtd6TFfZ9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347E646861;
 Fri, 21 Jan 2022 20:34:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 413F916A31;
 Fri, 21 Jan 2022 20:34:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/31] vhost: Add VhostIOVATree
Date: Fri, 21 Jan 2022 21:27:24 +0100
Message-Id: <20220121202733.404989-23-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

It duplicates the tree so it can search efficiently both directions,
and it will signal overlap if iova or the translated address is
present in any tree.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h |  27 +++++++
 hw/virtio/vhost-iova-tree.c | 157 ++++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build       |   2 +-
 3 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-iova-tree.c

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
new file mode 100644
index 0000000000..610394eaf1
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.h
@@ -0,0 +1,27 @@
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
index 0000000000..0021dbaf54
--- /dev/null
+++ b/hw/virtio/vhost-iova-tree.c
@@ -0,0 +1,157 @@
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
+#include "qemu/iova-tree.h"
+#include "vhost-iova-tree.h"
+
+#define iova_min_addr qemu_real_host_page_size
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
+    /* First addresable iova address in the device */
+    uint64_t iova_first;
+
+    /* Last addressable iova address in the device */
+    uint64_t iova_last;
+
+    /* IOVA address to qemu memory maps. */
+    IOVATree *iova_taddr_map;
+
+    /* QEMU virtual memory address to iova maps */
+    GTree *taddr_iova_map;
+};
+
+static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b,
+                                      gpointer data)
+{
+    const DMAMap *m1 = a, *m2 = b;
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
+ * Create a new IOVA tree
+ *
+ * Returns the new IOVA tree
+ */
+VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
+{
+    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
+
+    /* Some devices does not like 0 addresses */
+    tree->iova_first = MAX(iova_first, iova_min_addr);
+    tree->iova_last = iova_last;
+
+    tree->iova_taddr_map = iova_tree_new();
+    tree->taddr_iova_map = g_tree_new_full(vhost_iova_tree_cmp_taddr, NULL,
+                                           NULL, g_free);
+    return tree;
+}
+
+/**
+ * Delete an iova tree
+ */
+void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
+{
+    iova_tree_destroy(iova_tree->iova_taddr_map);
+    g_tree_unref(iova_tree->taddr_iova_map);
+    g_free(iova_tree);
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
+const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
+                                        const DMAMap *map)
+{
+    return g_tree_lookup(tree->taddr_iova_map, map);
+}
+
+/**
+ * Allocate a new mapping
+ *
+ * @tree  The iova tree
+ * @map   The iova map
+ *
+ * Returns:
+ * - IOVA_OK if the map fits in the container
+ * - IOVA_ERR_INVALID if the map does not make sense (like size overflow)
+ * - IOVA_ERR_OVERLAP if the tree already contains that map
+ * - IOVA_ERR_NOMEM if tree cannot allocate more space.
+ *
+ * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
+ */
+int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
+{
+    /* Some vhost devices does not like addr 0. Skip first page */
+    hwaddr iova_first = tree->iova_first ?: qemu_real_host_page_size;
+    DMAMap *new;
+    int r;
+
+    if (map->translated_addr + map->size < map->translated_addr ||
+        map->perm == IOMMU_NONE) {
+        return IOVA_ERR_INVALID;
+    }
+
+    /* Check for collisions in translated addresses */
+    if (vhost_iova_tree_find_iova(tree, map)) {
+        return IOVA_ERR_OVERLAP;
+    }
+
+    /* Allocate a node in IOVA address */
+    r = iova_tree_alloc(tree->iova_taddr_map, map, iova_first,
+                        tree->iova_last);
+    if (r != IOVA_OK) {
+        return r;
+    }
+
+    /* Allocate node in qemu -> iova translations */
+    new = g_malloc(sizeof(*new));
+    memcpy(new, map, sizeof(*new));
+    g_tree_insert(tree->taddr_iova_map, new, new);
+    return IOVA_OK;
+}
+
+/**
+ * Remove existing mappings from iova tree
+ *
+ * @param  iova_tree  The vhost iova tree
+ * @param  map        The map to remove
+ */
+void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map)
+{
+    const DMAMap *overlap;
+
+    iova_tree_remove(iova_tree->iova_taddr_map, map);
+    while ((overlap = vhost_iova_tree_find_iova(iova_tree, map))) {
+        g_tree_remove(iova_tree->taddr_iova_map, overlap);
+    }
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


