Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F454ECCF2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:08:41 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdgP-00048Y-3T
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:08:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd74-0006lU-T4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd73-0006ZN-8O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648665128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHzOVhbuDAldunZ9QcAku48EC7FHmGMGuqGVYEMagSk=;
 b=Yz6fYtmqL0MPMDjM4FyruNl561OpXtzpA9NHRLjHLo1XtSo4VYOREtPekyo/gQ8w/foilm
 fodjfOozIC9pu8gQwK8bpysa217migHKPkfrZ6D2AlCC4AMVp45Lxdd5oN83SoU4jp+e6X
 8bq65VsPyJIqRbnl1xj0V89+Uz/GGp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-ICGdRUjJMfOK0x3TmpICSg-1; Wed, 30 Mar 2022 14:32:05 -0400
X-MC-Unique: ICGdRUjJMfOK0x3TmpICSg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4255811E90;
 Wed, 30 Mar 2022 18:32:04 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26ED957ECED;
 Wed, 30 Mar 2022 18:32:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 12/19] vhost: Add vhost_iova_tree_find
Date: Wed, 30 Mar 2022 20:31:09 +0200
Message-Id: <20220330183116.358598-13-eperezma@redhat.com>
In-Reply-To: <20220330183116.358598-1-eperezma@redhat.com>
References: <20220330183116.358598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just a simple wrapper so we can find DMAMap entries based on iova

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-iova-tree.h |  2 ++
 hw/virtio/vhost-iova-tree.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
index 6a4f24e0f9..1ffcdc5b57 100644
--- a/hw/virtio/vhost-iova-tree.h
+++ b/hw/virtio/vhost-iova-tree.h
@@ -19,6 +19,8 @@ VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
 void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
 
+const DMAMap *vhost_iova_tree_find(const VhostIOVATree *iova_tree,
+                                   const DMAMap *map);
 const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
                                         const DMAMap *map);
 int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
index 55fed1fefb..7d4e8ac499 100644
--- a/hw/virtio/vhost-iova-tree.c
+++ b/hw/virtio/vhost-iova-tree.c
@@ -56,6 +56,20 @@ void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
     g_free(iova_tree);
 }
 
+/**
+ * Find a mapping in the tree that matches map
+ *
+ * @iova_tree  The iova tree
+ * @map        The map
+ *
+ * Return a matching map that contains argument map or NULL
+ */
+const DMAMap *vhost_iova_tree_find(const VhostIOVATree *iova_tree,
+                                   const DMAMap *map)
+{
+    return iova_tree_find(iova_tree->iova_taddr_map, map);
+}
+
 /**
  * Find the IOVA address stored from a memory address
  *
-- 
2.27.0


