Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB512D3045
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:56:17 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgHg-0004J6-NB
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmg2w-0005nW-Eh
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:41:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmg2r-0005RP-DJ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607445656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dv4EV+SDbfGk1p9gX/1Rzy+G5AYzBfNqtKyh+tTurpA=;
 b=PeZ9VdYKtPMIZQ8y+xxMG34N7BG66pOQctdw1uUYRPETixX0mChp6yK8LLvYPc1E9j/DH5
 ct5aI4nQ39IjnNH90PLQXec9LtHJKQ6QENmMIgwJ0/Dh0nUhuk2rC7qSNv2QzifN/86PHi
 vJIuGrV6/u5E/2JheiXemb7AorfuXqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-E4pkazX7Mz-Ku6wHD356fA-1; Tue, 08 Dec 2020 11:40:54 -0500
X-MC-Unique: E4pkazX7Mz-Ku6wHD356fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD0FBBEE0;
 Tue,  8 Dec 2020 16:40:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C85E25D6AB;
 Tue,  8 Dec 2020 16:40:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/10] vfio: Query and store the maximum number of DMA
 mappings
Date: Tue,  8 Dec 2020 17:39:44 +0100
Message-Id: <20201208163950.29617-5-david@redhat.com>
In-Reply-To: <20201208163950.29617-1-david@redhat.com>
References: <20201208163950.29617-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's query the maximum number of DMA mappings by querying the available
mappings when creating the container.

In addition, count the number of DMA mappings and warn when we would
exceed it. This is a preparation for RamDiscardMgr which might
create quite some DMA mappings over time, and we at least want to warn
early that the QEMU setup might be problematic. Use "reserved"
terminology, so we can use this to reserve mappings before they are
actually created.

Note: don't reserve vIOMMU DMA mappings - using the vIOMMU region size
divided by the mapping page size might be a bad indication of what will
happen in practice - we might end up warning all the time.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c              | 34 ++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..5ad88d476f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -288,6 +288,26 @@ const MemoryRegionOps vfio_region_ops = {
     },
 };
 
+static void vfio_container_dma_reserve(VFIOContainer *container,
+                                       unsigned long dma_mappings)
+{
+    bool warned = container->dma_reserved > container->dma_max;
+
+    container->dma_reserved += dma_mappings;
+    if (!warned && container->dma_max &&
+        container->dma_reserved > container->dma_max) {
+        warn_report("%s: possibly running out of DMA mappings. "
+                    " Maximum number of DMA mappings: %d", __func__,
+                    container->dma_max);
+    }
+}
+
+static void vfio_container_dma_unreserve(VFIOContainer *container,
+                                         unsigned long dma_mappings)
+{
+    container->dma_reserved -= dma_mappings;
+}
+
 /*
  * Device state interfaces
  */
@@ -835,6 +855,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
+    /* We'll need one DMA mapping. */
+    vfio_container_dma_reserve(container, 1);
+
     ret = vfio_dma_map(container, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
@@ -879,6 +902,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    bool unreserve_on_unmap = true;
     hwaddr iova, end;
     Int128 llend, llsize;
     int ret;
@@ -919,6 +943,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
          * based IOMMU where a big unmap flattens a large range of IO-PTEs.
          * That may not be true for all IOMMU types.
          */
+        unreserve_on_unmap = false;
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
@@ -970,6 +995,11 @@ static void vfio_listener_region_del(MemoryListener *listener,
                          "0x%"HWADDR_PRIx") = %d (%m)",
                          container, iova, int128_get64(llsize), ret);
         }
+
+        /* We previously reserved one DMA mapping. */
+        if (unreserve_on_unmap) {
+            vfio_container_dma_unreserve(container, 1);
+        }
     }
 
     memory_region_unref(section->mr);
@@ -1735,6 +1765,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->fd = fd;
     container->error = NULL;
     container->dirty_pages_supported = false;
+    container->dma_max = 0;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
@@ -1765,7 +1796,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
         container->pgsizes = info->iova_pgsizes;
 
+        /* The default in the kernel ("dma_entry_limit") is 65535. */
+        container->dma_max = 65535;
         if (!ret) {
+            vfio_get_info_dma_avail(info, &container->dma_max);
             vfio_get_iommu_info_migration(container, info);
         }
         g_free(info);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7a..fed0e85f66 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -88,6 +88,8 @@ typedef struct VFIOContainer {
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
+    unsigned int dma_max;
+    unsigned long dma_reserved;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
-- 
2.28.0


