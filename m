Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF2B4D034E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:48:26 +0100 (CET)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFaz-0002MF-7F
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFPk-0002zm-1u
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFPh-0003wZ-VU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxPi2fPx+64+N8297zyErTQMkeZm6NhAqzZoFy9kXc0=;
 b=Ux+SmR3EaJ7P7EUBxH80LrK8/Lp7Qb199als2UWfGiPaLYBrM49xv92fRSlEyRJzY1UXxt
 r8pg2FIB05U3hDO/fLivuF0NCtDXki6ht13J2qeSUZsf3ywur09WVdajPzJAYlkm4T+M0J
 8i/h51Zaj/7aN8GodHkIvHcnlQzCS5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-IdxlCMEXMDGWLGtM752fyg-1; Mon, 07 Mar 2022 10:36:44 -0500
X-MC-Unique: IdxlCMEXMDGWLGtM752fyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2381006AA9;
 Mon,  7 Mar 2022 15:36:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2927D3D2;
 Mon,  7 Mar 2022 15:36:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/15] util: add iova_tree_find_iova
Date: Mon,  7 Mar 2022 16:33:28 +0100
Message-Id: <20220307153334.3854134-10-eperezma@redhat.com>
In-Reply-To: <20220307153334.3854134-1-eperezma@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function does the reverse operation of iova_tree_find: To look for
a mapping that match a translated address so we can do the reverse.

This have linear complexity instead of logarithmic, but it supports
overlapping HVA. Future developments could reduce it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/qemu/iova-tree.h | 20 +++++++++++++++++++-
 util/iova-tree.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index d066400f09..c938fb0793 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -83,7 +83,7 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map);
  * @tree: the iova tree to search from
  * @map: the mapping to search
  *
- * Search for a mapping in the iova tree that overlaps with the
+ * Search for a mapping in the iova tree that iova overlaps with the
  * mapping range specified.  Only the first found mapping will be
  * returned.
  *
@@ -95,6 +95,24 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map);
  */
 const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map);
 
+/**
+ * iova_tree_find_iova:
+ *
+ * @tree: the iova tree to search from
+ * @map: the mapping to search
+ *
+ * Search for a mapping in the iova tree that translated_addr overlaps with the
+ * mapping range specified.  Only the first found mapping will be
+ * returned.
+ *
+ * Return: DMAMap pointer if found, or NULL if not found.  Note that
+ * the returned DMAMap pointer is maintained internally.  User should
+ * only read the content but never modify or free the content.  Also,
+ * user is responsible to make sure the pointer is valid (say, no
+ * concurrent deletion in progress).
+ */
+const DMAMap *iova_tree_find_iova(const IOVATree *tree, const DMAMap *map);
+
 /**
  * iova_tree_find_address:
  *
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 3160c50d3b..f015598977 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -37,6 +37,11 @@ struct IOVATreeAllocArgs {
     bool iova_found;
 };
 
+typedef struct IOVATreeFindIOVAArgs {
+    const DMAMap *needle;
+    const DMAMap *result;
+} IOVATreeFindIOVAArgs;
+
 /**
  * Iterate args to the next hole
  *
@@ -80,6 +85,35 @@ const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
     return g_tree_lookup(tree->tree, map);
 }
 
+static gboolean iova_tree_find_address_iterator(gpointer key, gpointer value,
+                                                gpointer data)
+{
+    const DMAMap *map = key;
+    IOVATreeFindIOVAArgs *args = data;
+    const DMAMap *needle;
+
+    g_assert(key == value);
+
+    needle = args->needle;
+    if (map->translated_addr + map->size < needle->translated_addr ||
+        needle->translated_addr + needle->size < map->translated_addr) {
+        return false;
+    }
+
+    args->result = map;
+    return true;
+}
+
+const DMAMap *iova_tree_find_iova(const IOVATree *tree, const DMAMap *map)
+{
+    IOVATreeFindIOVAArgs args = {
+        .needle = map,
+    };
+
+    g_tree_foreach(tree->tree, iova_tree_find_address_iterator, &args);
+    return args.result;
+}
+
 const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
 {
     const DMAMap map = { .iova = iova, .size = 0 };
-- 
2.27.0


