Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D4589F02
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:59:02 +0200 (CEST)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdFU-0007Gy-5r
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJdBb-0002o2-SS
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJdBT-0003XR-U5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659628491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zibunRhm+sIi3pljgeMpXElkFB9p0aIg/cGjDGnEIdM=;
 b=Ze7IuV4I76USeaHj5aFQK+9G5/MeOYs7EU6HX0zPTpXpGArxdz1frBC7q1VXaPeGRxArVn
 hvG515ZnLamzc7+BROQKgL2O3bFVl1OH8wZ3OFbLkAWDgtRd/09s+yxnQQfOIjufWQYwCU
 a801d019EQW8xAWTLAeJP64paRbZe2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-CdJuAT0NMAGwD8DJWGfNHw-1; Thu, 04 Aug 2022 11:54:49 -0400
X-MC-Unique: CdJuAT0NMAGwD8DJWGfNHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B06C185A79C
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 15:54:49 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4586A909FF;
 Thu,  4 Aug 2022 15:54:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 2/2] vdpa: do not save failed dma maps in SVQ iova tree
Date: Thu,  4 Aug 2022 17:54:43 +0200
Message-Id: <20220804155443.671136-3-eperezma@redhat.com>
In-Reply-To: <20220804155443.671136-1-eperezma@redhat.com>
References: <20220804155443.671136-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If a map fails for whatever reason, it must not be saved in the tree.
Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.

Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 983d3697b0..7e28d2f674 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                            MemoryRegionSection *section)
 {
+    DMAMap mem_region = {};
     struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
     hwaddr iova;
     Int128 llend, llsize;
@@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,

     llsize = int128_sub(llend, int128_make64(iova));
     if (v->shadow_vqs_enabled) {
-        DMAMap mem_region = {
-            .translated_addr = (hwaddr)(uintptr_t)vaddr,
-            .size = int128_get64(llsize) - 1,
-            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
-        };
+        int r;

-        int r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
+        mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
+        mem_region.size = int128_get64(llsize) - 1,
+        mem_region.perm = IOMMU_ACCESS_FLAG(true, section->readonly),
+
+        r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
         if (unlikely(r != IOVA_OK)) {
             error_report("Can't allocate a mapping (%d)", r);
             goto fail;
@@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                              vaddr, section->readonly);
     if (ret) {
         error_report("vhost vdpa map fail!");
-        goto fail;
+        goto fail_map;
     }

     return;

+fail_map:
+    if (v->shadow_vqs_enabled) {
+        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+    }
+
 fail:
     /*
      * On the initfn path, store the first error in the container so we
--
2.31.1


