Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71416A0309
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5a6-0007UG-GN; Thu, 23 Feb 2023 01:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5a3-0007RO-V5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5a2-0007yf-HT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UTsANcpPIyRjgl7LVIOwBXF4w6EWQImdRn6AA4l/RY=;
 b=gTRE6tL5CbktwfKGyExUU9lEdvEXzubBbBvClKai9g86J+B6uGaw6sa19CtqGfRKwnsl7n
 JCmvfMp86X++C4y0v0vlhzWwpGF4JKG8JtPpRWyHv2xzIVoMc3w3oSTo9+W08GoQxxvL0k
 XyTmh6wXw9TFnOrtCP+FGOPLCrKfEEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-edcH5h6qOI2f3B_YLIf_Xg-1; Thu, 23 Feb 2023 01:59:44 -0500
X-MC-Unique: edcH5h6qOI2f3B_YLIf_Xg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EFA7802C18;
 Thu, 23 Feb 2023 06:59:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-177.pek2.redhat.com
 [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44047492C14;
 Thu, 23 Feb 2023 06:59:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 lvivier@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V2 4/5] smmu: switch to use
 memory_region_unmap_iommu_notifier_range()
Date: Thu, 23 Feb 2023 14:59:23 +0800
Message-Id: <20230223065924.42503-5-jasowang@redhat.com>
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

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/arm/smmu-common.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 733c964778..5e2847d511 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -467,20 +467,6 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     return NULL;
 }
 
-/* Unmap the whole notifier's range */
-static void smmu_unmap_notifier_range(IOMMUNotifier *n)
-{
-    IOMMUTLBEvent event;
-
-    event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
-    event.entry.iova = n->start;
-    event.entry.perm = IOMMU_NONE;
-    event.entry.addr_mask = n->end - n->start;
-
-    memory_region_notify_iommu_one(n, &event);
-}
-
 /* Unmap all notifiers attached to @mr */
 static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
@@ -488,7 +474,7 @@ static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 
     trace_smmu_inv_notifiers_mr(mr->parent_obj.name);
     IOMMU_NOTIFIER_FOREACH(n, mr) {
-        smmu_unmap_notifier_range(n);
+        memory_region_unmap_iommu_notifier_range(n);
     }
 }
 
-- 
2.25.1


