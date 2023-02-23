Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93AE6A0305
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5a7-0007Vc-DG; Thu, 23 Feb 2023 01:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5a5-0007Tw-Gk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5a3-0007zT-RE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCuTi4UphobknUO5bPPv7X7Xkm80hrUItoZQ0qd+gdE=;
 b=MFL9pdNKo9W8oMG3dkBDGiVls4gBniU03tqFraLsQgyiLYkF4SRZu4CdJs6bPYUZI//Sfr
 LWF/oKyquvZQzOqWjHvCoiByPklpxjmSFhqX12ZzQ4Ibkq7PTyqWlHSPOEh1aT04v8an7C
 50gp8TZ8Yo72ILd/oIrrYrpjSs9QaUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-Nvah_j4zPCeqwltrJpxQaw-1; Thu, 23 Feb 2023 01:59:48 -0500
X-MC-Unique: Nvah_j4zPCeqwltrJpxQaw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2745D85CCE0;
 Thu, 23 Feb 2023 06:59:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-177.pek2.redhat.com
 [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A54E492C14;
 Thu, 23 Feb 2023 06:59:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 lvivier@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V2 5/5] intel-iommu: send UNMAP notifications for domain or
 global inv desc
Date: Thu, 23 Feb 2023 14:59:24 +0800
Message-Id: <20230223065924.42503-6-jasowang@redhat.com>
In-Reply-To: <20230223065924.42503-1-jasowang@redhat.com>
References: <20230223065924.42503-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

From: Peter Xu <peterx@redhat.com>

We don't send UNMAP notification upon domain or global invalidation
which will lead the notifier can't work correctly. One example is to
use vhost remote IOTLB without enabling device IOTLB.

Fixing this by sending UNMAP notification.

Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f006fa6031..a62896759c 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1530,13 +1530,17 @@ static int vtd_sync_shadow_page_table_range(VTDAddressSpace *vtd_as,
     return vtd_page_walk(s, ce, addr, addr + size, &info, vtd_as->pasid);
 }
 
-static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
+static int vtd_address_space_sync(VTDAddressSpace *vtd_as)
 {
     int ret;
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
-    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+    /* If no MAP notifier registered, we simply invalidate all the cache */
+    if (!vtd_as_has_map_notifier(vtd_as)) {
+        IOMMU_NOTIFIER_FOREACH(n, &vtd_as->iommu) {
+            memory_region_unmap_iommu_notifier_range(n);
+        }
         return 0;
     }
 
@@ -2000,7 +2004,7 @@ static void vtd_iommu_replay_all(IntelIOMMUState *s)
     VTDAddressSpace *vtd_as;
 
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
-        vtd_sync_shadow_page_table(vtd_as);
+        vtd_address_space_sync(vtd_as);
     }
 }
 
@@ -2082,7 +2086,7 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
              * framework will skip MAP notifications if that
              * happened.
              */
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
@@ -2140,7 +2144,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
             domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
-- 
2.25.1


