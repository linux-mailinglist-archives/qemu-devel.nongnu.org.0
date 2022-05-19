Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084152DDD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:31:43 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrls5-0007qP-Qd
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlbC-0005iF-26
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlbA-0006SS-7Q
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Jgq2TsrWzUgTQ5q2pts3SpmrlwBh6lTORD9NNR6VG4=;
 b=jIDpzA+uU2Trfxa3QCpTum5ekCYLDuez26ztr5Dko7NTm7r5pR8fqphU7S9bqnhwNUj9YE
 2cjnuM80/4r3WwArKBdOCc2+KUEB/2T5qnjzaBSq8ojaSkWapLSbs6QAu9R3KAlVPYnHwD
 WEhpzxqmavLRoOWa5E2DIgvZi85todI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-loSv90j7OK-FZzp0sQZGCA-1; Thu, 19 May 2022 15:14:06 -0400
X-MC-Unique: loSv90j7OK-FZzp0sQZGCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBABA3C025C3;
 Thu, 19 May 2022 19:14:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37C0B2026D6A;
 Thu, 19 May 2022 19:14:03 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 19/21] vhost: Add reference counting to vhost_iova_tree
Date: Thu, 19 May 2022 21:13:04 +0200
Message-Id: <20220519191306.821774-20-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
index 1ffcdc5b57..bacd17d99c 100644
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
 
 const DMAMap *vhost_iova_tree_find(const VhostIOVATree *iova_tree,
                                    const DMAMap *map);
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index 1a59894385..208476b3db 100644
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


