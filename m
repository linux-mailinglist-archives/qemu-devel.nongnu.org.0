Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D542D168D7F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:07:52 +0100 (CET)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5PpH-0002Uo-U7
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1j5Pjm-0002Bb-Hs
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1j5Pjj-00083j-Sh
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:49238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1j5Pjj-0007tq-If
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:02:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 00:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,471,1574150400"; d="scan'208";a="240547714"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2020 00:01:57 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org,
	alex.williamson@redhat.com,
	peterx@redhat.com
Subject: [RFC v3.1 21/22] intel_iommu: process PASID-based Device-TLB
 invalidation
Date: Sat, 22 Feb 2020 00:07:22 -0800
Message-Id: <1582358843-51931-22-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582358843-51931-1-git-send-email-yi.l.liu@intel.com>
References: <1582358843-51931-1-git-send-email-yi.l.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 Richard Henderson <rth@twiddle.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds an empty handling for PASID-based Device-TLB
invalidation. For now it is enough as it is not necessary to
propagate it to host for passthru device and also there is no
emulated device has device tlb.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c          | 18 ++++++++++++++++++
 hw/i386/intel_iommu_internal.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index e6326ef..f5faa75 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3354,6 +3354,17 @@ static bool vtd_process_inv_iec_desc(IntelIOMMUState *s,
     return true;
 }
 
+static bool vtd_process_device_piotlb_desc(IntelIOMMUState *s,
+                                           VTDInvDesc *inv_desc)
+{
+    /*
+     * no need to handle it for passthru device, for emulated
+     * devices with device tlb, it may be required, but for now,
+     * return is enough
+     */
+    return true;
+}
+
 static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
                                           VTDInvDesc *inv_desc)
 {
@@ -3475,6 +3486,13 @@ static bool vtd_process_inv_desc(IntelIOMMUState *s)
         }
         break;
 
+    case VTD_INV_DESC_DEV_PIOTLB:
+        trace_vtd_inv_desc("device-piotlb", inv_desc.hi, inv_desc.lo);
+        if (!vtd_process_device_piotlb_desc(s, &inv_desc)) {
+            return false;
+        }
+        break;
+
     case VTD_INV_DESC_DEVICE:
         trace_vtd_inv_desc("device", inv_desc.hi, inv_desc.lo);
         if (!vtd_process_device_iotlb_desc(s, &inv_desc)) {
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index bd241cb..dfb54fc 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -386,6 +386,7 @@ typedef union VTDInvDesc VTDInvDesc;
 #define VTD_INV_DESC_WAIT               0x5 /* Invalidation Wait Descriptor */
 #define VTD_INV_DESC_PIOTLB             0x6 /* PASID-IOTLB Invalidate Desc */
 #define VTD_INV_DESC_PC                 0x7 /* PASID-cache Invalidate Desc */
+#define VTD_INV_DESC_DEV_PIOTLB         0x8 /* PASID-based-DIOTLB inv_desc*/
 #define VTD_INV_DESC_NONE               0   /* Not an Invalidate Descriptor */
 
 /* Masks for Invalidation Wait Descriptor*/
-- 
2.7.4


