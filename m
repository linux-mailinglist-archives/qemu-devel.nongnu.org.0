Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED554B0996
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:34:04 +0100 (CET)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5py-0007Jk-JC
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nI5lR-0005da-M1
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nI5lO-0000jL-9s
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644485357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApW13J2cgJYxsBpJ+emX8kvSW9P6FtraWiC2lmejYOo=;
 b=Ame81k1aBBIn827+B2a7PjqaKFqcSNupxjSxWYezulRHIBbIGXmt7E3F7Zg/1g8/HF21dl
 0n9wEV1XQlXz7JEEkBVB++OsncsaKC4Sa5AyEQeXf8ILpGX8qXp6MNhpURSuJoctI1PBpm
 8vCTzc1DNYvTZQvwVPwHn3x17CDZ7IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-JpF2bMz0Oi-_kAlYrD2TZA-1; Thu, 10 Feb 2022 04:29:14 -0500
X-MC-Unique: JpF2bMz0Oi-_kAlYrD2TZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E988519E0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-134.pek2.redhat.com
 [10.72.12.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21C366D037;
 Thu, 10 Feb 2022 09:28:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 2/2] intel-iommu: block output address in interrupt address
 range
Date: Thu, 10 Feb 2022 17:28:15 +0800
Message-Id: <20220210092815.45174-2-jasowang@redhat.com>
In-Reply-To: <20220210092815.45174-1-jasowang@redhat.com>
References: <20220210092815.45174-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to vtd spec v3.3 3.14:

"""
Software must not program paging-structure entries to remap any
address to the interrupt address range. Untranslated requests and
translation requests that result in an address in the interrupt range
will be blocked with condition code LGN.4 or SGN.8.
"""

This patch blocks the request that result in interrupt address range.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 27 ++++++++++++++++++++++++++-
 hw/i386/intel_iommu_internal.h |  4 ++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 55281ee1b4..5ef48271d8 100644
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
@@ -1620,10 +1643,12 @@ static const bool vtd_qualified_faults[] = {
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
 
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index d0bb43ae87..730e1b97d6 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -288,6 +288,8 @@ typedef enum VTDFaultReason {
      * context-entry.
      */
     VTD_FR_CONTEXT_ENTRY_TT,
+    /* Output address in the interrupt address range */
+    VTD_FR_INTERRUPT_ADDR = 0xE,
 
     /* Interrupt remapping transition faults */
     VTD_FR_IR_REQ_RSVD = 0x20, /* One or more IR request reserved
@@ -303,6 +305,8 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
+    /* Output address in the interrupt address range for scalable mode */
+    VTD_FR_SM_INTERRUPT_ADDR = 0x87,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
-- 
2.25.1


