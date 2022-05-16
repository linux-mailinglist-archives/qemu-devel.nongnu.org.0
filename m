Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80831529319
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:45:30 +0200 (CEST)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiWv-0003jm-HV
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjE-0000cR-8v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjB-0006gk-7n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTVq5T8b7EGxCTH+Nf30xApsBAleE4GqyWpyK43o+XY=;
 b=QuP2j8jkzqBq1SH9zMb9ffhty+nX4xb2QKjDGe12a2hDEICiTExT7bOCd+gFyggsn5ot5V
 Bj7t38CswtkKojjdzmSWkhMUUawKu5IcbQnugofNfX8IgRUy02xfw4yYAiHx9EsTWhv96R
 ULCzuMoDlJx6w+ARDK/B7zhPL1GPr3s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-_RCxLxezNAyCxTkrVCZxwQ-1; Mon, 16 May 2022 16:53:57 -0400
X-MC-Unique: _RCxLxezNAyCxTkrVCZxwQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7d789000000b0042ab9d77febso1711639edq.16
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VTVq5T8b7EGxCTH+Nf30xApsBAleE4GqyWpyK43o+XY=;
 b=USM+kko1Xzb8SgSB+KthDltVtrtiklE81m3gUSTzeBVzaAxznhlI+LEtdUEqVjBpXq
 hQw5CCG8Rqc42QtU83Zv9rIWtinycHjp60OVyiRIPcWRfNuSsZ1s1w98VPpgzKKNPQml
 kBK8JwPzXbJNZbNN2CcRYpjwBleVcF2aCk0tJOcImIzrgZ3Kw3brua28qc7j5UiuTbyI
 V7udT6aDvnys3VlsFthF+3DCCsKhMVKB70YhXybme2/YRyAkt9Ex9gFvRgQUlB5oH8xi
 cXCoDjGcBeV4FFNMNuuHhIhravyJks3v1GBt32X6xZtUrAoA32tz2Cx6kIO4+6yr+f++
 d80w==
X-Gm-Message-State: AOAM530nkZIlZNkLOVqg92N6+qUp0ZrRtRO+mLr+lbe/n3/w80cYuzCp
 IVhCN2L5ObMbD5IwOXxfTRJ8n5cRtdgu+prGGS3r41cdMtq3Plsp7ZXyYULdo0pFElyq6BKOVYz
 3hDNzALYGtaBvIPcvAJVpNtOcV1mUXtq47TDPmuROVULzJvmBs86rwY4+keWo
X-Received: by 2002:a05:6402:1257:b0:42a:aae6:d5b2 with SMTP id
 l23-20020a056402125700b0042aaae6d5b2mr9910015edw.297.1652734436250; 
 Mon, 16 May 2022 13:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpFrbxmwSgbib+VDcY5vsv2jc7VaRHIwu7NPoET5L2U47uYf6H0rsyAgZQuKq6/hsjIrVRig==
X-Received: by 2002:a05:6402:1257:b0:42a:aae6:d5b2 with SMTP id
 l23-20020a056402125700b0042aaae6d5b2mr9909978edw.297.1652734435933; 
 Mon, 16 May 2022 13:53:55 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 sd30-20020a1709076e1e00b006f52dbc192bsm177895ejc.37.2022.05.16.13.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:55 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 54/86] intel-iommu: block output address in interrupt
 address range
Message-ID: <20220516204913.542894-55-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

According to vtd spec v3.3 3.14:

"""
Software must not program paging-structure entries to remap any
address to the interrupt address range. Untranslated requests and
translation requests that result in an address in the interrupt range
will be blocked with condition code LGN.4 or SGN.8.
"""

This patch blocks the request that result in interrupt address range.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220210092815.45174-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h |  4 ++++
 hw/i386/intel_iommu.c          | 27 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index b6a2da8e83..930ce61feb 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -289,6 +289,8 @@ typedef enum VTDFaultReason {
      * context-entry.
      */
     VTD_FR_CONTEXT_ENTRY_TT,
+    /* Output address in the interrupt address range */
+    VTD_FR_INTERRUPT_ADDR = 0xE,
 
     /* Interrupt remapping transition faults */
     VTD_FR_IR_REQ_RSVD = 0x20, /* One or more IR request reserved
@@ -304,6 +306,8 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
+    /* Output address in the interrupt address range for scalable mode */
+    VTD_FR_SM_INTERRUPT_ADDR = 0x87,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 8af2e39151..695dd51dc3 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1020,6 +1020,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
     uint32_t offset;
     uint64_t slpte;
     uint64_t access_right_check;
+    uint64_t xlat, size;
 
     if (!vtd_iova_range_check(s, iova, ce, aw_bits)) {
         error_report_once("%s: detected IOVA overflow (iova=0x%" PRIx64 ")",
@@ -1064,11 +1065,33 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
         if (vtd_is_last_slpte(slpte, level)) {
             *slptep = slpte;
             *slpte_level = level;
-            return 0;
+            break;
         }
         addr = vtd_get_slpte_addr(slpte, aw_bits);
         level--;
     }
+
+    xlat = vtd_get_slpte_addr(*slptep, aw_bits);
+    size = ~vtd_slpt_level_page_mask(level) + 1;
+
+    /*
+     * From VT-d spec 3.14: Untranslated requests and translation
+     * requests that result in an address in the interrupt range will be
+     * blocked with condition code LGN.4 or SGN.8.
+     */
+    if ((xlat > VTD_INTERRUPT_ADDR_LAST ||
+         xlat + size - 1 < VTD_INTERRUPT_ADDR_FIRST)) {
+        return 0;
+    } else {
+        error_report_once("%s: xlat address is in interrupt range "
+                          "(iova=0x%" PRIx64 ", level=0x%" PRIx32 ", "
+                          "slpte=0x%" PRIx64 ", write=%d, "
+                          "xlat=0x%" PRIx64 ", size=0x%" PRIx64 ")",
+                          __func__, iova, level, slpte, is_write,
+                          xlat, size);
+        return s->scalable_mode ? -VTD_FR_SM_INTERRUPT_ADDR :
+                                  -VTD_FR_INTERRUPT_ADDR;
+    }
 }
 
 typedef int (*vtd_page_walk_hook)(IOMMUTLBEvent *event, void *private);
@@ -1628,10 +1651,12 @@ static const bool vtd_qualified_faults[] = {
     [VTD_FR_PAGING_ENTRY_INV] = true,
     [VTD_FR_ROOT_TABLE_INV] = false,
     [VTD_FR_CONTEXT_TABLE_INV] = false,
+    [VTD_FR_INTERRUPT_ADDR] = true,
     [VTD_FR_ROOT_ENTRY_RSVD] = false,
     [VTD_FR_PAGING_ENTRY_RSVD] = true,
     [VTD_FR_CONTEXT_ENTRY_TT] = true,
     [VTD_FR_PASID_TABLE_INV] = false,
+    [VTD_FR_SM_INTERRUPT_ADDR] = true,
     [VTD_FR_MAX] = false,
 };
 
-- 
MST


