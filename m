Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBA63BB44
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvhw-000774-Qb; Tue, 29 Nov 2022 03:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhq-00073M-BK
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvho-0006na-Lz
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669709463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUfxQqg8TFMX4egp9trm2YuRl4bblDSTOMx4I99SrE0=;
 b=QbnvkgywZjrwXp9rjvCHhMsVfvpWxQz0PnkNE8ww0bIytSZfCdsrCWpzQoeh1lCAtoX+/B
 hNuS9AY65kkULZWC285c3R+u6Wk+ZEu57xLStmvlVh5XYYi/pBgPqtAOdOI/oEmwPUi13b
 H5p1IqcD+6LCPno008gZi98p8VdDEJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-pAzT2quMOHWchU4TaUy1CQ-1; Tue, 29 Nov 2022 03:11:01 -0500
X-MC-Unique: pAzT2quMOHWchU4TaUy1CQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03FE5811E7A;
 Tue, 29 Nov 2022 08:11:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-181.pek2.redhat.com
 [10.72.13.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30223C15BBD;
 Tue, 29 Nov 2022 08:10:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Date: Tue, 29 Nov 2022 16:10:37 +0800
Message-Id: <20221129081037.12099-4-jasowang@redhat.com>
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
References: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

The IOVA tree is only built during page walk this breaks the device
that tries to use UNMAP notifier only. One example is vhost-net, it
tries to use UNMAP notifier when vIOMMU doesn't support DEVIOTLB_UNMAP
notifier (e.g when dt mode is not enabled). The interesting part is
that it doesn't use MAP since it can query the IOMMU translation by
itself upon a IOTLB miss.

This doesn't work since Qemu doesn't build IOVA tree in IOMMU
translation which means the UNMAP notifier won't be triggered during
the page walk since Qemu think it is never mapped. This could be
noticed when vIOMMU is used with vhost_net but dt is disabled.

Fixing this by build the iova tree during IOMMU translation, this
makes sure the UNMAP notifier event could be identified during page
walk. And we need to walk page table not only for UNMAP notifier but
for MAP notifier during PSI.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index d025ef2873..edeb62f4b2 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1834,6 +1834,8 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
     uint8_t access_flags;
     bool rid2pasid = (pasid == PCI_NO_PASID) && s->root_scalable;
     VTDIOTLBEntry *iotlb_entry;
+    const DMAMap *mapped;
+    DMAMap target;
 
     /*
      * We have standalone memory region for interrupt addresses, we
@@ -1954,6 +1956,21 @@ out:
     entry->translated_addr = vtd_get_slpte_addr(slpte, s->aw_bits) & page_mask;
     entry->addr_mask = ~page_mask;
     entry->perm = access_flags;
+
+    target.iova = entry->iova;
+    target.size = entry->addr_mask;
+    target.translated_addr = entry->translated_addr;
+    target.perm = entry->perm;
+
+    mapped = iova_tree_find(vtd_as->iova_tree, &target);
+    if (!mapped) {
+        /* To make UNMAP notifier work, we need build iova tree here
+         * in order to have the UNMAP iommu notifier to be triggered
+         * during the page walk.
+         */
+        iova_tree_insert(vtd_as->iova_tree, &target);
+    }
+
     return true;
 
 error:
@@ -2161,31 +2178,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
         ret = vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                        vtd_as->devfn, &ce);
         if (!ret && domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
-            if (vtd_as_has_map_notifier(vtd_as)) {
-                /*
-                 * As long as we have MAP notifications registered in
-                 * any of our IOMMU notifiers, we need to sync the
-                 * shadow page table.
-                 */
-                vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
-            } else {
-                /*
-                 * For UNMAP-only notifiers, we don't need to walk the
-                 * page tables.  We just deliver the PSI down to
-                 * invalidate caches.
-                 */
-                IOMMUTLBEvent event = {
-                    .type = IOMMU_NOTIFIER_UNMAP,
-                    .entry = {
-                        .target_as = &address_space_memory,
-                        .iova = addr,
-                        .translated_addr = 0,
-                        .addr_mask = size - 1,
-                        .perm = IOMMU_NONE,
-                    },
-                };
-                memory_region_notify_iommu(&vtd_as->iommu, 0, event);
-            }
+            vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
         }
     }
 }
-- 
2.25.1


