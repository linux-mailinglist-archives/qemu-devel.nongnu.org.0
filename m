Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45937F9765
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 18:41:42 +0100 (CET)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUaAf-0003rr-6R
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 12:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1iUa8p-0002PH-2f
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 12:39:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1iUa8n-0005ux-5a
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 12:39:46 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1iUa8m-0005uP-Ng
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 12:39:45 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcaed2f0000>; Tue, 12 Nov 2019 09:34:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 09:34:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 09:34:36 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 17:34:35 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Nov 2019 17:34:30 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v9 QEMU 02/15] vfio iommu: Add ioctl defination to get dirty
 pages bitmap.
Date: Tue, 12 Nov 2019 22:35:11 +0530
Message-ID: <1573578324-8389-3-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1573578324-8389-1-git-send-email-kwankhede@nvidia.com>
References: <1573578324-8389-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573580079; bh=VGevCBZwPqAu8fmC6VNF9iPQRZ2n6SeKBEqK0QnWDRQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=aK+1jm3I6HMnHWMIK/QGs5SDrYpnm6aSpSL2EI4o/ZtZpPq4pA6VtCn9yyKZtDFuF
 Qzxtv6lLTj6pgFj9Y9LS9HjIIxtsTxAvZHoI6GaIvn/4DPyLKBUCHyNbCJnh0WzWFb
 3LGN1OGBiKVAV0wiPoPg/aQMaqZCIVWLRoZUUty5rcn5OsR65gG055x8NH5023IMHr
 usX4Bq71tVwchA04A9P421GraVukeJhqxvsR1M6GLrDb2aCaR2NKuw8SG7dTZGChlZ
 zojQ5fXm14BtfZPx3c0iRlV/oxLZrq8Ctm6u7AGNlVLa22q5bIOVJVflDJMKPbyRVH
 g+GJ6b0qHxJXA==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 216.228.121.143
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All pages pinned by vendor driver through vfio_pin_pages API should be
considered as dirty during migration. IOMMU container maintains a list of
all such pinned pages. Added an ioctl defination to get bitmap of such
pinned pages for requested IO virtual address range.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 linux-headers/linux/vfio.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 597b3d4bf45e..2b00c732f313 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -902,6 +902,29 @@ struct vfio_iommu_type1_dma_unmap {
 #define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
 #define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
 
+/**
+ * VFIO_IOMMU_GET_DIRTY_BITMAP - _IOWR(VFIO_TYPE, VFIO_BASE + 17,
+ *                                     struct vfio_iommu_type1_dirty_bitmap)
+ *
+ * IOCTL to get dirty pages bitmap for IOMMU container during migration.
+ * Get dirty pages bitmap of given IO virtual addresses range using
+ * struct vfio_iommu_type1_dirty_bitmap. Caller sets argsz, which is size of
+ * struct vfio_iommu_type1_dirty_bitmap. User should allocate memory to get
+ * bitmap and should set size of allocated memory in bitmap_size field.
+ * One bit is used to represent per page consecutively starting from iova
+ * offset. Bit set indicates page at that offset from iova is dirty.
+ */
+struct vfio_iommu_type1_dirty_bitmap {
+	__u32        argsz;
+	__u32        flags;
+	__u64        iova;                      /* IO virtual address */
+	__u64        size;                      /* Size of iova range */
+	__u64        bitmap_size;               /* in bytes */
+	void        *bitmap;                    /* one bit per page */
+};
+
+#define VFIO_IOMMU_GET_DIRTY_BITMAP             _IO(VFIO_TYPE, VFIO_BASE + 17)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.7.0


