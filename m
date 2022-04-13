Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53944FFB81
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:41:13 +0200 (CEST)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neg3M-0006re-Uw
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefv8-0008Vz-1V
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefv6-0003Cl-Gp
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJJGfS7a2QGiHTpclDDnVCFntqsQI2exWNaE+f6WRqE=;
 b=Y+Dc+RQlPD0hICY/Qzruk8wS8U+kXNeIdcSHvcLCNrrDzLuG4vzNqDw07ZOZE+90oWvdf7
 ycAgPHR4yjBjdpVzHGgXfIUaEk6pvcjWJn89dHG7t8wf+VPNb6e0Gj4hkV5tsYtrMWrorD
 JsxiaEzspi3lFCq9H6XASriPqrtWtCI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-NEFgdhm_Nk2Yo0OZGVR8zw-1; Wed, 13 Apr 2022 12:32:29 -0400
X-MC-Unique: NEFgdhm_Nk2Yo0OZGVR8zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5CB32A59564;
 Wed, 13 Apr 2022 16:32:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E66E145BA5B;
 Wed, 13 Apr 2022 16:32:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 07/25] vhost: Add reference counting to vhost_iova_tree
Date: Wed, 13 Apr 2022 18:31:48 +0200
Message-Id: <20220413163206.1958254-8-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-1-eperezma@redhat.com>
References: <20220413163206.1958254-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that different vqs can have different ASIDs its easier to track them
using reference counters.

QEMU's glib version still does not have them so we've copied g_rc_box,
so the implementation can be converted to glib's one when the minimum
version is raised.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h |  5 +++--
 hw/virtio/vhost-iova-tree.c | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
index 6a4f24e0f9..2fc825d7b1 100644
--- a/hw/virtio/vhost-iova-tree.h
+++ b/hw/virtio/vhost-iova-tree.h
@@ -16,8 +16,9 @@
 typedef struct VhostIOVATree VhostIOVATree;
 
 VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
-void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
+VhostIOVATree *vhost_iova_tree_acquire(VhostIOVATree *iova_tree);
+void vhost_iova_tree_release(VhostIOVATree *iova_tree);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_release);
 
 const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
                                         const DMAMap *map);
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index 55fed1fefb..31445cbdfc 100644
--- a/hw/virtio/vhost-iova-tree.c
+++ b/hw/virtio/vhost-iova-tree.c
@@ -28,6 +28,9 @@ struct VhostIOVATree {
 
     /* IOVA address to qemu memory maps. */
     IOVATree *iova_taddr_map;
+
+    /* Reference count */
+    size_t refcnt;
 };
 
 /**
@@ -44,14 +47,28 @@ VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
     tree->iova_last = iova_last;
 
     tree->iova_taddr_map = iova_tree_new();
+    tree->refcnt = 1;
     return tree;
 }
 
 /**
- * Delete an iova tree
+ * Increases the reference count of the iova tree
+ */
+VhostIOVATree *vhost_iova_tree_acquire(VhostIOVATree *iova_tree)
+{
+    ++iova_tree->refcnt;
+    return iova_tree;
+}
+
+/**
+ * Decrease reference counter of iova tree, freeing if it reaches 0
  */
-void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
+void vhost_iova_tree_release(VhostIOVATree *iova_tree)
 {
+    if (--iova_tree->refcnt) {
+        return;
+    }
+
     iova_tree_destroy(iova_tree->iova_taddr_map);
     g_free(iova_tree);
 }
-- 
2.27.0


