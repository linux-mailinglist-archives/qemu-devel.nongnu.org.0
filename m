Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9706AF289
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcRR-0003vw-2C; Tue, 07 Mar 2023 13:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRF-0003jv-Mv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRD-0002Wi-MV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsAHSnk/Sup+qHKSIirZCju4D1BaxnDxUtXlubQjKFs=;
 b=cWRhBC2wD+PAebg9tWiySaEo/+koSxjtFDILHXMx59h7BsNskqlZZp8bVOMbuA/JGDwHf9
 CIsuTW1txhW4Cx9hfs1s9V9xeI8pA4Jb3Mh1qULmPWuZULckM/QfQpRk73nPLcv+sDCgjC
 G3CRMQtLE7Ta0Pm/QiZKf53zPrysMUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-jVdWnyuvPFCvdW_EOH1sHg-1; Tue, 07 Mar 2023 13:53:23 -0500
X-MC-Unique: jVdWnyuvPFCvdW_EOH1sHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCC65185A794;
 Tue,  7 Mar 2023 18:53:22 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 529A7C15BA0;
 Tue,  7 Mar 2023 18:53:22 +0000 (UTC)
Subject: [PULL 11/17] vfio/common: Extract code from vfio_get_dirty_bitmap()
 to new function
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:21 -0700
Message-ID: <167821520195.619792.3703667989541181823.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Avihai Horon <avihaih@nvidia.com>

Extract the VFIO_IOMMU_DIRTY_PAGES ioctl code in vfio_get_dirty_bitmap()
to its own function.

This will help the code to be more readable after next patch will add
device dirty page bitmap sync functionality.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20230307125450.62409-12-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   57 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 55498afeb255..ae81af6d3269 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1595,26 +1595,13 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     }
 }
 
-static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
-                                 uint64_t size, ram_addr_t ram_addr)
+static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
+                                   hwaddr iova, hwaddr size)
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    VFIOBitmap vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
-        cpu_physical_memory_set_dirty_range(ram_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
-        return 0;
-    }
-
-    ret = vfio_bitmap_alloc(&vbmap, size);
-    if (ret) {
-        return ret;
-    }
-
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1629,8 +1616,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
      * to qemu_real_host_page_size.
      */
     range->bitmap.pgsize = qemu_real_host_page_size();
-    range->bitmap.size = vbmap.size;
-    range->bitmap.data = (__u64 *)vbmap.bitmap;
+    range->bitmap.size = vbmap->size;
+    range->bitmap.data = (__u64 *)vbmap->bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1638,16 +1625,42 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
                 (uint64_t)range->size, errno);
-        goto err_out;
+    }
+
+    g_free(dbitmap);
+
+    return ret;
+}
+
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr)
+{
+    VFIOBitmap vbmap;
+    int ret;
+
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
+    ret = vfio_bitmap_alloc(&vbmap, size);
+    if (ret) {
+        return ret;
+    }
+
+    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
+    if (ret) {
+        goto out;
     }
 
     cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
                                            vbmap.pages);
 
-    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
-                                range->bitmap.size, ram_addr);
-err_out:
-    g_free(dbitmap);
+    trace_vfio_get_dirty_bitmap(container->fd, iova, size, vbmap.size,
+                                ram_addr);
+out:
     g_free(vbmap.bitmap);
 
     return ret;



