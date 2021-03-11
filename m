Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1373381E3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:50:01 +0100 (CET)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV44-0000PN-DE
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzS-0003Ve-9l
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzP-0003ic-Vo
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1RFMHMot9VQRi+TCvM+qcYlf4xdQtuq7It4W5NtbRk=;
 b=C+bql8boAukQzxwcWmvdZs0b4zqAV4UB6ein0A0j1R1+lQD0JI7qvokclKFyDHrsTs76SV
 XiCV0FAkpLWVTVGahuFPCHFd6DDY69mvVZKL10xJ0K0ozfXx4o7C4ZQHOHIcFf0cN9fB7Q
 +SM+2Ats7r7Vx3nx3vsQUv5kb/YBLJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-DLIk4H4eOuWDlqSuoSjGqA-1; Thu, 11 Mar 2021 18:45:08 -0500
X-MC-Unique: DLIk4H4eOuWDlqSuoSjGqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D5EC8828B5;
 Thu, 11 Mar 2021 23:44:51 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07AC85DAA5;
 Thu, 11 Mar 2021 23:44:50 +0000 (UTC)
Subject: [PULL 09/10] vfio: Support host translation granule size
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:44:50 -0700
Message-ID: <161550629062.21070.3016021071597179654.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kunkun Jiang <jiangkunkun@huawei.com>

The cpu_physical_memory_set_dirty_lebitmap() can quickly deal with
the dirty pages of memory by bitmap-traveling, regardless of whether
the bitmap is aligned correctly or not.

cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
host page size. So it'd better to set bitmap_pgsize to host page size
to support more translation granule sizes.

[aw: The Fixes commit below introduced code to restrict migration
support to configurations where the target page size intersects the
host dirty page support.  For example, a 4K guest on a 4K host.
Due to the above flexibility in bitmap handling, this restriction
unnecessarily prevents mixed target/host pages size that could
otherwise be supported.  Use host page size for dirty bitmap.]

Fixes: 87ea529c502 ("vfio: Get migration capability flags for container")
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Message-Id: <20210304133446.1521-1-jiangkunkun@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 35a41fd05251..ad08dfd729b9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -378,7 +378,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
 {
     struct vfio_iommu_type1_dma_unmap *unmap;
     struct vfio_bitmap *bitmap;
-    uint64_t pages = TARGET_PAGE_ALIGN(size) >> TARGET_PAGE_BITS;
+    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
     int ret;
 
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
@@ -390,12 +390,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
     bitmap = (struct vfio_bitmap *)&unmap->data;
 
     /*
-     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
-     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap_pgsize to
-     * TARGET_PAGE_SIZE.
+     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
+     * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
+     * to qemu_real_host_page_size.
      */
 
-    bitmap->pgsize = TARGET_PAGE_SIZE;
+    bitmap->pgsize = qemu_real_host_page_size;
     bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
                    BITS_PER_BYTE;
 
@@ -674,16 +674,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
-    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
-                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
+    if (unlikely((section->offset_within_address_space &
+                  ~qemu_real_host_page_mask) !=
+                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
         error_report("%s received unaligned region", __func__);
         return;
     }
 
-    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
     llend = int128_make64(section->offset_within_address_space);
     llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
@@ -892,8 +893,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
         return;
     }
 
-    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
-                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
+    if (unlikely((section->offset_within_address_space &
+                  ~qemu_real_host_page_mask) !=
+                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
         error_report("%s received unaligned region", __func__);
         return;
     }
@@ -921,10 +923,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
     llend = int128_make64(section->offset_within_address_space);
     llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
@@ -1004,13 +1006,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     range->size = size;
 
     /*
-     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
-     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap's pgsize to
-     * TARGET_PAGE_SIZE.
+     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
+     * qemu_real_host_page_size to mark those dirty. Hence set bitmap's pgsize
+     * to qemu_real_host_page_size.
      */
-    range->bitmap.pgsize = TARGET_PAGE_SIZE;
+    range->bitmap.pgsize = qemu_real_host_page_size;
 
-    pages = TARGET_PAGE_ALIGN(range->size) >> TARGET_PAGE_BITS;
+    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size;
     range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
                                          BITS_PER_BYTE;
     range->bitmap.data = g_try_malloc0(range->bitmap.size);
@@ -1114,8 +1116,8 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                section->offset_within_region;
 
     return vfio_get_dirty_bitmap(container,
-                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
-                       int128_get64(section->size), ram_addr);
+                   REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
+                   int128_get64(section->size), ram_addr);
 }
 
 static void vfio_listener_log_sync(MemoryListener *listener,
@@ -1655,10 +1657,10 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
                             header);
 
     /*
-     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
-     * TARGET_PAGE_SIZE to mark those dirty.
+     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
+     * qemu_real_host_page_size to mark those dirty.
      */
-    if (cap_mig->pgsize_bitmap & TARGET_PAGE_SIZE) {
+    if (cap_mig->pgsize_bitmap & qemu_real_host_page_size) {
         container->dirty_pages_supported = true;
         container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
         container->dirty_pgsizes = cap_mig->pgsize_bitmap;


