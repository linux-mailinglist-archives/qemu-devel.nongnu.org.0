Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F185162AF8A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 00:38:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov5U6-0003Yz-H3; Tue, 15 Nov 2022 18:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ov5U0-0003YT-GO
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ov5Ty-0008QU-Bo
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668555405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyN7tk/7vvWthHf1fdnewgAgYJSFnJeOiecRsQUDAcY=;
 b=igwIxg57LnMnbmXd8N7C44MoVTrRYEDBY6ap8KLeoELukBhPixQaBI8mCObHnrCPjWA0BV
 VkeSvQNhwn19o9Sktb6Di3Yas48W8VmgswfcC4/UoPXlBRVChbu9XByaKJuf8zBXVDSgI9
 FdmF7qvlkrrBqYh3YzaN+S26/Kz5/cI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-gM8eXHhGPkOFGmgxT4Auew-1; Tue, 15 Nov 2022 18:36:43 -0500
X-MC-Unique: gM8eXHhGPkOFGmgxT4Auew-1
Received: by mail-io1-f70.google.com with SMTP id
 c23-20020a6b4e17000000b006db1063fc9aso7956159iob.14
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 15:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyN7tk/7vvWthHf1fdnewgAgYJSFnJeOiecRsQUDAcY=;
 b=U45rXozXEcTLufPZig7KrXUkH5438SfuGnZ9UEQmImlGrkd860f227pZ5+H1oS1fO8
 VrjZvg2FYBXDvmIHSL9nBjsLroqjk0P9H93kEzSNW6cFMalLfzCSWowqYO6IxeJrTQS/
 /ACm3X5FgVJ25hGz3vmUyXU4R2OBkPLKhlp06LViKa0iISlBUEULVeb+jt53yKJ67ihf
 tyNdf/07B8cpWJSsWhSb/oQKvieuZJ+6iC3mQMzfZQVRcgLaQMuCliS2L9TK+sf71M7b
 +YXkP9C0TL2Lkgi2dI5LuQNF6lXejnTcwwZp2jLPjGzOLGj91iGvY8QGx3Lnc9sIqWpM
 UNhg==
X-Gm-Message-State: ANoB5pllcfy781xV3TtsO/v5Ib3jeePLS9tfq/TU0JQKqNvZUNLqlEz1
 PZkslAfXO90khN1HrJHOG7i4u3a/HbfGy7Q9lsdur1gdWFJfYKrcmFxJaJThHJljf5kibiYTbSA
 6Nb+EQu0GXhFQznc=
X-Received: by 2002:a6b:bf04:0:b0:6c6:fbb8:f86c with SMTP id
 p4-20020a6bbf04000000b006c6fbb8f86cmr9131790iof.36.1668555402576; 
 Tue, 15 Nov 2022 15:36:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qiOwCaCtqOUHhtrzPYcN03LvaUO1Bjvw6ygLG5587qicWTYNnq+8ACXBzY3wX6KIpNK8A1A==
X-Received: by 2002:a6b:bf04:0:b0:6c6:fbb8:f86c with SMTP id
 p4-20020a6bbf04000000b006c6fbb8f86cmr9131764iof.36.1668555402226; 
 Tue, 15 Nov 2022 15:36:42 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o10-20020a92d38a000000b0030258f9670bsm3223588ilo.13.2022.11.15.15.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 15:36:41 -0800 (PST)
Date: Tue, 15 Nov 2022 16:36:37 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Shay Drory
 <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 07/17] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Message-ID: <20221115163637.710c3d70.alex.williamson@redhat.com>
In-Reply-To: <20221103161620.13120-8-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-8-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 3 Nov 2022 18:16:10 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked. This is because a DMA-able VFIO device
> can dirty RAM pages without updating QEMU about it, thus breaking the
> migration.
> 
> However, this doesn't mean that migration can't be done at all.
> In such case, allow migration and let QEMU VFIO code mark the entire
> bitmap dirty.
> 
> This guarantees that all pages that might have gotten dirty are reported
> back, and thus guarantees a valid migration even without VFIO IOMMU
> dirty tracking support.
> 
> The motivation for this patch is the future introduction of iommufd [1].
> iommufd will directly implement the /dev/vfio/vfio container IOCTLs by
> mapping them into its internal ops, allowing the usage of these IOCTLs
> over iommufd. However, VFIO IOMMU dirty tracking will not be supported
> by this VFIO compatibility API.
> 
> This patch will allow migration by hosts that use the VFIO compatibility
> API and prevent migration regressions caused by the lack of VFIO IOMMU
> dirty tracking support.
> 
> [1] https://lore.kernel.org/kvm/0-v2-f9436d0bde78+4bb-iommufd_jgg@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c    | 84 +++++++++++++++++++++++++++++++++++++--------
>  hw/vfio/migration.c |  3 +-
>  2 files changed, 70 insertions(+), 17 deletions(-)

This duplicates quite a bit of code, I think we can integrate this into
a common flow quite a bit more.  See below, only compile tested. Thanks,

Alex

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6b5d8c0bf694..4117b40fd9b0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -397,17 +397,33 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
                                  IOMMUTLBEntry *iotlb)
 {
     struct vfio_iommu_type1_dma_unmap *unmap;
-    struct vfio_bitmap *bitmap;
+    struct vfio_bitmap *vbitmap;
+    unsigned long *bitmap;
+    uint64_t bitmap_size;
     uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
     int ret;
 
-    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
+    unmap = g_malloc0(sizeof(*unmap) + sizeof(*vbitmap));
 
-    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
+    unmap->argsz = sizeof(*unmap);
     unmap->iova = iova;
     unmap->size = size;
-    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
-    bitmap = (struct vfio_bitmap *)&unmap->data;
+
+    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                  BITS_PER_BYTE;
+    bitmap = g_try_malloc0(bitmap_size);
+    if (!bitmap) {
+        ret = -ENOMEM;
+        goto unmap_exit;
+    }
+
+    if (!container->dirty_pages_supported) {
+        bitmap_set(bitmap, 0, pages);
+        goto do_unmap;
+    }
+
+    unmap->argsz += sizeof(*vbitmap);
+    unmap->flags = VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
 
     /*
      * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
@@ -415,33 +431,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
      * to qemu_real_host_page_size.
      */
 
-    bitmap->pgsize = qemu_real_host_page_size();
-    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                   BITS_PER_BYTE;
+    vbitmap = (struct vfio_bitmap *)&unmap->data;
+    vbitmap->data = (__u64 *)bitmap;
+    vbitmap->pgsize = qemu_real_host_page_size();
+    vbitmap->size = bitmap_size;
 
-    if (bitmap->size > container->max_dirty_bitmap_size) {
-        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
-                     (uint64_t)bitmap->size);
+    if (bitmap_size > container->max_dirty_bitmap_size) {
+        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, bitmap_size);
         ret = -E2BIG;
         goto unmap_exit;
     }
 
-    bitmap->data = g_try_malloc0(bitmap->size);
-    if (!bitmap->data) {
-        ret = -ENOMEM;
-        goto unmap_exit;
-    }
-
+do_unmap:
     ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
     if (!ret) {
-        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
-                iotlb->translated_addr, pages);
+        cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
+                                               pages);
     } else {
         error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
     }
 
-    g_free(bitmap->data);
 unmap_exit:
+    g_free(bitmap);
     g_free(unmap);
     return ret;
 }
@@ -460,8 +471,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
-    if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
@@ -1257,6 +1267,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         .argsz = sizeof(dirty),
     };
 
+    if (!container->dirty_pages_supported) {
+        return;
+    }
+
     if (start) {
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
     } else {
@@ -1287,11 +1301,26 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
-    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
+    struct vfio_iommu_type1_dirty_bitmap *dbitmap = NULL;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
+    unsigned long *bitmap;
+    uint64_t bitmap_size;
     uint64_t pages;
     int ret;
 
+    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                           BITS_PER_BYTE;
+    bitmap = g_try_malloc0(bitmap_size);
+    if (!bitmap) {
+        return -ENOMEM;
+    }
+
+    if (!container->dirty_pages_supported) {
+        bitmap_set(bitmap, 0, pages);
+        goto set_dirty;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1306,15 +1335,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
      * to qemu_real_host_page_size.
      */
     range->bitmap.pgsize = qemu_real_host_page_size();
-
-    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
-    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                                         BITS_PER_BYTE;
-    range->bitmap.data = g_try_malloc0(range->bitmap.size);
-    if (!range->bitmap.data) {
-        ret = -ENOMEM;
-        goto err_out;
-    }
+    range->bitmap.size = bitmap_size;
+    range->bitmap.data = (__u64 *)bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1324,13 +1346,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
-                                            ram_addr, pages);
+set_dirty:
+    cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
 
-    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
-                                range->bitmap.size, ram_addr);
+    trace_vfio_get_dirty_bitmap(container->fd, iova, size,
+                                bitmap_size, ram_addr);
 err_out:
-    g_free(range->bitmap.data);
+    g_free(bitmap);
     g_free(dbitmap);
 
     return ret;
@@ -1465,8 +1487,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    if (vfio_listener_skipped_section(section) ||
-        !container->dirty_pages_supported) {
+    if (vfio_listener_skipped_section(section)) {
         return;
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index f5e72c7ac198..99ffb7578290 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -857,11 +857,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 


