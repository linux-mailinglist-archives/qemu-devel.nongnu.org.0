Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC6440303
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:17:31 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXNZ-0006QS-Dp
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrc-0006L7-Nm
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrZ-000333-Vk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmpsxTCBP+d2avOUHGb/1dqBrc0CAXZvJu7ixmkfDMU=;
 b=M4TmJvmvb0Uisx6O5dDYI57AO6TuKRIthbrX54OWFXW+q5BCaafvaiqIjoDu03MDrf3HDw
 bPryOSGw63Q+rjpfMQ5mVwbIDk7NcjP8hEDVRU/ZOYFqGbOLxDdJkJyGS5WW52gE0egvJE
 4uyCTrJmno6l9UrjHw7GD7h4uOJEf/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-RVA87etoMtSukjQ8bYGsdA-1; Fri, 29 Oct 2021 14:44:22 -0400
X-MC-Unique: RVA87etoMtSukjQ8bYGsdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2E3106B7DC;
 Fri, 29 Oct 2021 18:44:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0AC65D6CF;
 Fri, 29 Oct 2021 18:44:16 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 24/26] vhost: Add VhostIOVATree
Date: Fri, 29 Oct 2021 20:35:23 +0200
Message-Id: <20211029183525.1776416-25-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
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

It duplicates the tree so it can search efficiently both directions,
and it will signal overlap if iova or the translated address is
present in it's each array.

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
index 0000000000..56652e7d2b
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
+void vhost_iova_tree_unref(VhostIOVATree *iova_rm);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_unref);
+
+const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_rm,
+                                        const DMAMap *map);
+int vhost_iova_tree_map_alloc(VhostIOVATree *iova_rm, DMAMap *map);
+void vhost_iova_tree_remove(VhostIOVATree *iova_rm, const DMAMap *map);
+
+#endif
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
new file mode 100644
index 0000000000..021779cfd5
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
+ * Destroy an IOVA tree
+ *
+ * @tree  The iova tree
+ */
+void vhost_iova_tree_unref(VhostIOVATree *tree)
+{
+    iova_tree_destroy(tree->iova_taddr_map);
+    g_tree_unref(tree->taddr_iova_map);
+    g_free(tree);
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
+    r = iova_tree_alloc(tree->iova_taddr_map, map, tree->iova_first,
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
+ * @param  iova_rm  The vhost iova tree
+ * @param  map      The map to remove
+ */
+void vhost_iova_tree_remove(VhostIOVATree *iova_rm, const DMAMap *map)
+{
+    const DMAMap *overlap;
+
+    iova_tree_remove(iova_rm->iova_taddr_map, map);
+    while ((overlap = vhost_iova_tree_find_iova(iova_rm, map))) {
+        g_tree_remove(iova_rm->taddr_iova_map, overlap);
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


