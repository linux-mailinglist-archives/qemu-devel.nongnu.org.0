Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E306B6AF287
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcQx-0002r4-IB; Tue, 07 Mar 2023 13:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQv-0002qg-Dm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQt-0002V4-SM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TFV2gewErDB/rs/5Hn2jPe4NJtuvDYjYPFLxyPJ/c8=;
 b=bjqPbWkLE3aadmV6zmW8TSNbJy6SNTpI4wsH+kUsHLDJbp6YjMJZ2EiUW6S/rqfmOtZoJM
 ztFfkhQrh9JBJkMW4gaDtlsXwGHLK/FK4JzRMiAePpWClTPVVTGHxF+wRGS/yfFtOi2wH/
 ySV+Rbh5UvWmosHyAtQd317a/6//T2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-JzZIq0-tNt6OfViemb_3SQ-1; Tue, 07 Mar 2023 13:53:05 -0500
X-MC-Unique: JzZIq0-tNt6OfViemb_3SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A4708828C1;
 Tue,  7 Mar 2023 18:53:05 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8D042026D4B;
 Tue,  7 Mar 2023 18:53:04 +0000 (UTC)
Subject: [PULL 08/17] vfio/common: Add helper to consolidate iova/end
 calculation
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:04 -0700
Message-ID: <167821518431.619792.12932302611023643451.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

From: Joao Martins <joao.m.martins@oracle.com>

In preparation to be used in device dirty tracking, move the code that
calculate a iova/end range from the container/section.  This avoids
duplication on the common checks across listener callbacks.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20230307125450.62409-9-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d38b7c1969b9..63831eab78a1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -962,6 +962,31 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section,
     return true;
 }
 
+static bool vfio_get_section_iova_range(VFIOContainer *container,
+                                        MemoryRegionSection *section,
+                                        hwaddr *out_iova, hwaddr *out_end,
+                                        Int128 *out_llend)
+{
+    Int128 llend;
+    hwaddr iova;
+
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return false;
+    }
+
+    *out_iova = iova;
+    *out_end = int128_get64(int128_sub(llend, int128_one()));
+    if (out_llend) {
+        *out_llend = llend;
+    }
+    return true;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -977,12 +1002,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
-
-    if (int128_ge(int128_make64(iova), llend)) {
+    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
         if (memory_region_is_ram_device(section->mr)) {
             trace_vfio_listener_region_add_no_dma_map(
                 memory_region_name(section->mr),
@@ -992,7 +1012,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
         return;
     }
-    end = int128_get64(int128_sub(llend, int128_one()));
 
     if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
         hwaddr pgsize = 0;
@@ -1219,15 +1238,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
-
-    if (int128_ge(int128_make64(iova), llend)) {
+    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
         return;
     }
-    end = int128_get64(int128_sub(llend, int128_one()));
 
     llsize = int128_sub(llend, int128_make64(iova));
 



