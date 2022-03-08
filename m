Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB74D19E2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:59:07 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaMk-00053G-RJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRa1P-00034I-SV
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRa1J-0002OT-C8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646746615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeARyT7EFKu/c1ivwKM/oWnTMrpIwXfXaps8pSBhqig=;
 b=K54+h2q57A93pGb3UL4AY8VOZiFmQr9K/YNVAmK2naE6sEIWCu1RYSyT8JdK83Atqy5oSU
 SHMmmrkfPMtCvrv6XgzlgdtySD1vRden4IG1cmms89/II1GMMA+MDK01eYgAcetIs9VdJz
 QV9W74synlmnoTL3OTxXBeJMmkNJGcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-o91_UYaPPA2jtYWpGIMu8w-1; Tue, 08 Mar 2022 08:36:52 -0500
X-MC-Unique: o91_UYaPPA2jtYWpGIMu8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC3C800050;
 Tue,  8 Mar 2022 13:36:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-181.pek2.redhat.com
 [10.72.12.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C83981F78;
 Tue,  8 Mar 2022 13:36:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 11/15] vhost: Add VhostIOVATree
Date: Tue,  8 Mar 2022 21:34:47 +0800
Message-Id: <20220308133451.25378-12-jasowang@redhat.com>
In-Reply-To: <20220308133451.25378-1-jasowang@redhat.com>
References: <20220308133451.25378-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

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

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/meson.build       |   2 +-
 hw/virtio/vhost-iova-tree.c | 110 ++++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-iova-tree.h |  27 +++++++++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-iova-tree.c
 create mode 100644 hw/virtio/vhost-iova-tree.h

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 2dc8761..6047670 100644
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
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
new file mode 100644
index 0000000..55fed1f
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
diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
new file mode 100644
index 0000000..6a4f24e
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
-- 
2.7.4


