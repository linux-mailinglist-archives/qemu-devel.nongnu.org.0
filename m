Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C345B42D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:06:32 +0100 (CET)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mplQN-0005Qz-Fc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mplNU-0003sK-T2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mplNQ-00075P-Di
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637733806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PuP65qlCbuT/WPdMUuBhtIakSiBIpLC60haT3hvGqhQ=;
 b=ezVISTZEDfUZcQkOVYbtUf/RonY1EVXRm17Am/ArmN2ef8stZFYsR7pjxlu07SlfTlI+fT
 G9mSZmbRtL/yPceFMMTcfX0bAS67jAl32ewDAQvBdME9Kwn10Yn2Mr1Yiqy9LqaPV73n5C
 nI8b5teJjyAILt8cT/QHAbqv/zvwX6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-535-0iFqZjBJM2WeOw56zuAiEQ-1; Wed, 24 Nov 2021 01:03:23 -0500
X-MC-Unique: 0iFqZjBJM2WeOw56zuAiEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B151DDE3;
 Wed, 24 Nov 2021 06:03:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-249.pek2.redhat.com
 [10.72.13.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 676605DF2B;
 Wed, 24 Nov 2021 06:03:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Date: Wed, 24 Nov 2021 14:03:09 +0800
Message-Id: <20211124060309.6872-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 yi.y.sun@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When booting with scalable mode, I hit this error:

qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve non-zero iova=0xfffff002, level=0x1slpte=0x102681803)
qemu-system-x86_64: vtd_iommu_translate: detected translation failure (dev=01:00:00, iova=0xfffff002)
qemu-system-x86_64: New fault is not recorded due to compression of faults

This is because the SNP bit is set since Linux kernel commit
6c00612d0cba1 ("iommu/vt-d: Report right snoop capability when using
FL for IOVA") where SNP bit is set if scalable mode is on though this
seems to be an violation on the spec which said the SNP bit is
considered to be reserved if SC is not supported.

To unbreak the guest, ignore the SNP bit for scalable mode first. In
the future we may consider to add SC support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 18 ++++++++++++------
 hw/i386/intel_iommu_internal.h |  2 ++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 294499ee20..3bcac56c3e 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -969,7 +969,8 @@ static dma_addr_t vtd_get_iova_pgtbl_base(IntelIOMMUState *s,
 static uint64_t vtd_spte_rsvd[5];
 static uint64_t vtd_spte_rsvd_large[5];
 
-static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
+static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
+                                   uint64_t slpte, uint32_t level)
 {
     uint64_t rsvd_mask = vtd_spte_rsvd[level];
 
@@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
         rsvd_mask = vtd_spte_rsvd_large[level];
     }
 
+    if (s->scalable_mode) {
+        rsvd_mask &= ~VTD_SPTE_SNP;
+    }
+
     return slpte & rsvd_mask;
 }
 
@@ -1054,7 +1059,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
                               iova, level, slpte, is_write);
             return is_write ? -VTD_FR_WRITE : -VTD_FR_READ;
         }
-        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
+        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
             error_report_once("%s: detected splte reserve non-zero "
                               "iova=0x%" PRIx64 ", level=0x%" PRIx32
                               "slpte=0x%" PRIx64 ")", __func__, iova,
@@ -1185,7 +1190,8 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
  * @write: whether parent level has write permission
  * @info: constant information for the page walk
  */
-static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
+static int vtd_page_walk_level(IntelIOMMUState *s,
+                               dma_addr_t addr, uint64_t start,
                                uint64_t end, uint32_t level, bool read,
                                bool write, vtd_page_walk_info *info)
 {
@@ -1214,7 +1220,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
             goto next;
         }
 
-        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
+        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
             trace_vtd_page_walk_skip_reserve(iova, iova_next);
             goto next;
         }
@@ -1235,7 +1241,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
              * This is a valid PDE (or even bigger than PDE).  We need
              * to walk one further level.
              */
-            ret = vtd_page_walk_level(vtd_get_slpte_addr(slpte, info->aw),
+            ret = vtd_page_walk_level(s, vtd_get_slpte_addr(slpte, info->aw),
                                       iova, MIN(iova_next, end), level - 1,
                                       read_cur, write_cur, info);
         } else {
@@ -1294,7 +1300,7 @@ static int vtd_page_walk(IntelIOMMUState *s, VTDContextEntry *ce,
         end = vtd_iova_limit(s, ce, info->aw);
     }
 
-    return vtd_page_walk_level(addr, start, end, level, true, true, info);
+    return vtd_page_walk_level(s, addr, start, end, level, true, true, info);
 }
 
 static int vtd_root_entry_rsvd_bits_check(IntelIOMMUState *s,
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 3d5487fe2c..a6c788049b 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -388,6 +388,8 @@ typedef union VTDInvDesc VTDInvDesc;
 #define VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO 0xffff0000ffe0fff8
 
 /* Rsvd field masks for spte */
+#define VTD_SPTE_SNP 0x800ULL
+
 #define VTD_SPTE_PAGE_L1_RSVD_MASK(aw, dt_supported) \
         dt_supported ? \
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
-- 
2.25.1


