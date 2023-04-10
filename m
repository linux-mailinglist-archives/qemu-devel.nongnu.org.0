Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCB6DC2F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 05:33:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pliGW-0002lW-7g; Sun, 09 Apr 2023 23:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pliGT-0002l5-PX
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pliGR-00052V-VD
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681097538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PLwc+iDDEGKkZtFO74LYR/ABdvFaHt9ybAlqIFQ+uWk=;
 b=SAfC4waG7VthWtsWCVJlCijFK+Oz4FRgvQGAYdJcR9uwYt6V2IJ3oR8eMwXxJUKE+EAIT7
 Ic4tphaglVHqOS7Y4KcDGPjaOHGUaEPqhZPimvSA0y7GXVxhlxIgJJ/jn5omqSoBxYX2rZ
 S4R2sa9+HXErdOvCcq2QE/bDwLvY2dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-pOtbZx3tO7WwNc9crybK4A-1; Sun, 09 Apr 2023 23:32:14 -0400
X-MC-Unique: pOtbZx3tO7WwNc9crybK4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B94F85A5B1;
 Mon, 10 Apr 2023 03:32:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-104.pek2.redhat.com
 [10.72.13.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5EC02166B30;
 Mon, 10 Apr 2023 03:32:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
Date: Mon, 10 Apr 2023 11:32:08 +0800
Message-Id: <20230410033208.54663-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
account when calculating iotlb hash like:

static guint vtd_iotlb_hash(gconstpointer v)
{
    const struct vtd_iotlb_key *key = v;

    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
           (key->level) << VTD_IOTLB_LVL_SHIFT |
           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
}

This turns out to be problematic since:

- the shift will lose bits if not converting to uint64_t
- level should be off by one in order to fit into 2 bits
- VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
  some bits

So this patch fixes them by

- converting the keys into uint64_t before doing the shift
- off level by one to make it fit into two bits
- change the sid, lvl and pasid shift to 26, 42 and 44 in order to
  take the full width of uint64_t if possible

Fixes: Coverity CID 1508100
Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 8 ++++----
 hw/i386/intel_iommu_internal.h | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a62896759c..d394976e9b 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -64,8 +64,8 @@ struct vtd_as_key {
 struct vtd_iotlb_key {
     uint64_t gfn;
     uint32_t pasid;
-    uint32_t level;
     uint16_t sid;
+    uint8_t level;
 };
 
 static void vtd_address_space_refresh_all(IntelIOMMUState *s);
@@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
 {
     const struct vtd_iotlb_key *key = v;
 
-    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
-           (key->level) << VTD_IOTLB_LVL_SHIFT |
-           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
+    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
+        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
+        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
 }
 
 static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index f090e61e11..2e61eec2f5 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -114,9 +114,9 @@
                                      VTD_INTERRUPT_ADDR_FIRST + 1)
 
 /* The shift of source_id in the key of IOTLB hash table */
-#define VTD_IOTLB_SID_SHIFT         20
-#define VTD_IOTLB_LVL_SHIFT         28
-#define VTD_IOTLB_PASID_SHIFT       30
+#define VTD_IOTLB_SID_SHIFT         26
+#define VTD_IOTLB_LVL_SHIFT         42
+#define VTD_IOTLB_PASID_SHIFT       44
 #define VTD_IOTLB_MAX_SIZE          1024    /* Max size of the hash table */
 
 /* IOTLB_REG */
-- 
2.25.1


