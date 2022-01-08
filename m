Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B14880B3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:51:57 +0100 (CET)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60tg-0004cq-LA
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:51:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BE-0005cM-Ck
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BC-0002mB-PK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ZXDQGGu0GtQDGXbNWl1ocN1Tqho3+nSq7/StQ09538=;
 b=AaMjepXGXdaUMZ7cSUg2xnlI8fADpTuMGHBURoEmPWf+MJtnhg+cc/OIl4FXy8xUZcBgyj
 2jM8EMwsEkQsUehpTk3asAdmXNyzJo3D94q19GWbkil8nsmgDKRMm9r45b87za5FT7eIDH
 JXKdRksqKSY4AMAqeGiU0X74A7KQBLs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-QMhkAie9O7iipMXFrip1pQ-1; Fri, 07 Jan 2022 20:05:57 -0500
X-MC-Unique: QMhkAie9O7iipMXFrip1pQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so2501056wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ZXDQGGu0GtQDGXbNWl1ocN1Tqho3+nSq7/StQ09538=;
 b=v/iiGYzxPJI73W+QobJOnwZXk9JmsKcXMS4Rl6M/Dcomt6rIl5dzyfqmsjj2duPm9y
 HpC/mCo//OxgPfU+R7xo2UibB/m4eOoUSfbiaLr4C85tF0Gpw9fO+Wq++HaQjmjQ87br
 MhD7bgLTTRVR6cmz1LgbpNr34u7DCq7U9uIPOn6xMXLImle4AENx0ipzyNCa830rqYz8
 mQqFhtsXL8df41aM/pmJQHqYGAthEBq4ENxkR+vQxu3lrUJVmKhxDSaR2aToXzWin4so
 YsE1IsDr3U75WmhfUyKjQSrV5OmNS0LhGn2lP66kM3Q5qLXsN+d6zocfU8+HWDST1MG4
 OzRQ==
X-Gm-Message-State: AOAM531jWFRx5OkKHYbvFexFgjVVNnIbN94gEHV4zimZPfVy5TBOTDUa
 ahRypN+nWrKJAfeGr5YgRgXWQ6/ChTpohzdURMmcky8BCdAPLu5EIp/dA6egyKAWYw5mHIjbr4P
 6F/OEwYEit6mqyNcKUK22hAeA8efmVDXp/wyueK4jRuwktZxdYwf0jKFF7NVz
X-Received: by 2002:adf:f40e:: with SMTP id g14mr2564303wro.515.1641603954681; 
 Fri, 07 Jan 2022 17:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI72KYkd8wzumBSpwbapsLBzR1G6vE5PKvmewv2jWumsEkMwwVEvmzVrVyVXvGFy45MdaqCw==
X-Received: by 2002:adf:f40e:: with SMTP id g14mr2564284wro.515.1641603954435; 
 Fri, 07 Jan 2022 17:05:54 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id l10sm86655wmq.7.2022.01.07.17.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:53 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 42/55] intel-iommu: correctly check passthrough during
 translation
Message-ID: <20220108003423.15830-43-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

When scalable mode is enabled, the passthrough more is not determined
by the context entry but PASID entry, so switch to use the logic of
vtd_dev_pt_enabled() to determine the passthrough mode in
vtd_do_iommu_translate().

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220105041945.13459-2-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5b865ac08c..4c6c016388 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1516,11 +1516,29 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
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
@@ -1538,17 +1556,7 @@ static bool vtd_dev_pt_enabled(VTDAddressSpace *as)
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
@@ -1560,7 +1568,7 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
 
     assert(as);
 
-    use_iommu = as->iommu_state->dmar_enabled && !vtd_dev_pt_enabled(as);
+    use_iommu = as->iommu_state->dmar_enabled && !vtd_as_pt_enabled(as);
 
     trace_vtd_switch_address_space(pci_bus_num(as->bus),
                                    VTD_PCI_SLOT(as->devfn),
@@ -1753,7 +1761,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
      * We don't need to translate for pass-through context entries.
      * Also, let's ignore IOTLB caching as well for PT devices.
      */
-    if (vtd_ce_get_type(&ce) == VTD_CONTEXT_TT_PASS_THROUGH) {
+    if (vtd_dev_pt_enabled(s, &ce)) {
         entry->iova = addr & VTD_PAGE_MASK_4K;
         entry->translated_addr = entry->iova;
         entry->addr_mask = ~VTD_PAGE_MASK_4K;
-- 
MST


