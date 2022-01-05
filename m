Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7298B484D0F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:22:57 +0100 (CET)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xpA-0006gV-Jp
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmU-00041v-Gu
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmQ-0002ab-VM
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641356406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCsShkGNTOHYe/jzI4mAbQV4tOhTyhlj3BBfbJymxV8=;
 b=ZKkS04IdCOYhdLknE94Dk+AGwwfYH0JSZqvY5C4dGLaLwTxqJcEtJakq6N9qnb/Ue2uaIA
 eiIgUw36xTATnDteS88HIKhiObNdOvpwEYZENgg0VB1xeG7iyKj3g8TQ36lWCwmz9jakzi
 NX8F1BcdoWpLt1J92LSeN0vncsZH1LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-QENUZUKhPM68ThBNBKDIlw-1; Tue, 04 Jan 2022 23:20:04 -0500
X-MC-Unique: QENUZUKhPM68ThBNBKDIlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03F0A1006AA6;
 Wed,  5 Jan 2022 04:20:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C72D16ABB6;
 Wed,  5 Jan 2022 04:19:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH] intel-iommu: correctly check passthrough during translation
Date: Wed,  5 Jan 2022 12:19:42 +0800
Message-Id: <20220105041945.13459-2-jasowang@redhat.com>
In-Reply-To: <20220105041945.13459-1-jasowang@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When scsalable mode is enabled, the passthrough more is not determined
by the context entry but PASID entry, so switch to use the logic of
vtd_dev_pt_enabled() to determine the passthrough mode in
vtd_do_iommu_translate().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f584449d8d..f346a82652 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1512,11 +1512,29 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
  * 1st-level translation or 2nd-level translation, it depends
  * on PGTT setting.
  */
-static bool vtd_dev_pt_enabled(VTDAddressSpace *as)
+static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
+{
+    VTDPASIDEntry pe;
+    int ret;
+
+    if (s->root_scalable) {
+        ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        if (ret) {
+            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
+                              __func__, ret);
+            return false;
+        }
+        return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
+    }
+
+    return (vtd_ce_get_type(ce) == VTD_CONTEXT_TT_PASS_THROUGH);
+
+}
+
+static bool vtd_as_pt_enabled(VTDAddressSpace *as)
 {
     IntelIOMMUState *s;
     VTDContextEntry ce;
-    VTDPASIDEntry pe;
     int ret;
 
     assert(as);
@@ -1534,17 +1552,7 @@ static bool vtd_dev_pt_enabled(VTDAddressSpace *as)
         return false;
     }
 
-    if (s->root_scalable) {
-        ret = vtd_ce_get_rid2pasid_entry(s, &ce, &pe);
-        if (ret) {
-            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
-                              __func__, ret);
-            return false;
-        }
-        return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
-    }
-
-    return (vtd_ce_get_type(&ce) == VTD_CONTEXT_TT_PASS_THROUGH);
+    return vtd_dev_pt_enabled(s, &ce);
 }
 
 /* Return whether the device is using IOMMU translation. */
@@ -1556,7 +1564,7 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
 
     assert(as);
 
-    use_iommu = as->iommu_state->dmar_enabled && !vtd_dev_pt_enabled(as);
+    use_iommu = as->iommu_state->dmar_enabled && !vtd_as_pt_enabled(as);
 
     trace_vtd_switch_address_space(pci_bus_num(as->bus),
                                    VTD_PCI_SLOT(as->devfn),
@@ -1749,7 +1757,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
      * We don't need to translate for pass-through context entries.
      * Also, let's ignore IOTLB caching as well for PT devices.
      */
-    if (vtd_ce_get_type(&ce) == VTD_CONTEXT_TT_PASS_THROUGH) {
+    if (vtd_dev_pt_enabled(s, &ce)) {
         entry->iova = addr & VTD_PAGE_MASK_4K;
         entry->translated_addr = entry->iova;
         entry->addr_mask = ~VTD_PAGE_MASK_4K;
-- 
2.25.1


