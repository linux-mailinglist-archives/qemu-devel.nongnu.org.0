Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC191587E48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:42:27 +0200 (CEST)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIt6I-0003XU-I3
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIt3H-0001Wx-KN
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIt3E-0008OJ-Ck
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659451153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pq81qrcxaVOSuZOc9tmAKRqIwfuk/zneM3W8NVnQJUU=;
 b=H+5cCnYxd/ce9youDQXG3HJzBaPYAxYzGom4MX5tCdVEI0lDPNPsu6+XeVdMgEfv2vMo2K
 xAJ71RzM+a6IzwSVis1DWmN4jX26PqjHwfB9yNAFUr52Yg/T9ubznpv2lECV4fzEjdK5KN
 sPPvj5j6RogeIPbiow3re2bFLTTT2UE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-6MuN4OfGN3SFvl4cpOOeUw-1; Tue, 02 Aug 2022 10:39:11 -0400
X-MC-Unique: 6MuN4OfGN3SFvl4cpOOeUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3735801231
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 14:39:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF8C82166B26;
 Tue,  2 Aug 2022 14:39:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vdpa: do not save failed dma maps in SVQ iova tree
Date: Tue,  2 Aug 2022 16:39:08 +0200
Message-Id: <20220802143908.274364-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

If a map fails for whatever reason, it must not be saved in the tree.
Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.

Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3ff9ce3501..e44c23dce5 100644
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


