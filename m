Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77F121B66
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 21:59:45 +0100 (CET)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igxSy-0006MH-It
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 15:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1igxKH-0002UR-3g
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 15:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1igxKG-0007KP-1E
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 15:50:44 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1igxKF-0007JK-SH
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 15:50:43 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df7ee070000>; Mon, 16 Dec 2019 12:50:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 12:50:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 12:50:42 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 20:50:41 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 20:50:35 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v10 Kernel 2/5] vfio iommu: Adds flag to indicate dirty pages
 tracking capability support
Date: Tue, 17 Dec 2019 01:51:37 +0530
Message-ID: <1576527700-21805-3-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1576527700-21805-1-git-send-email-kwankhede@nvidia.com>
References: <1576527700-21805-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576529415; bh=UPYFmaFN47EhcHp79NnQF+QfSPH8G2xOgEgl05wOr30=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=CrqJtDjsHuk0X/9bY4qyk9X5shvfKasBWgI4KMZZQKJl18ZOZqc6IXdaoHQ80/OrI
 oCsPRvnik5oqjdzbUAsoHxWwCzGaELpVLVvyvK/fG8siBeqO4bVakyRVTdtP+DmSRx
 3dbK5OoRjhzbDH8AhdBCim1tjOAKQtumQoAxZQLqLdcG4JsIa38gv8LxxVGkO6bEE4
 5s7N+7NdLh5n6CDUff/SIS43mmir+Xrqq/x9/c0t1D3eH/ppa9fEZhtTAcxADTI/hR
 BPdgn3xJdOFDlFxWnQttmgPX7l5IpDj9U3D2hXcN2h40IuHMlkuxdpIHVjJgYwKtoP
 DdLNNMkZNjDvA==
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
 yan.y.zhao@intel.com, kvm@vger.kernel.org, eskultet@redhat.com,
 ziye.yang@intel.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Flag VFIO_IOMMU_INFO_DIRTY_PGS in VFIO_IOMMU_GET_INFO indicates that driver
support dirty pages tracking.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 3 ++-
 include/uapi/linux/vfio.h       | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 2ada8e6cdb88..3f6b04f2334f 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2234,7 +2234,8 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 			info.cap_offset = 0; /* output, no-recopy necessary */
 		}
 
-		info.flags = VFIO_IOMMU_INFO_PGSIZES;
+		info.flags = VFIO_IOMMU_INFO_PGSIZES |
+			     VFIO_IOMMU_INFO_DIRTY_PGS;
 
 		info.iova_pgsizes = vfio_pgsize_bitmap(iommu);
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index a0817ba267c1..81847ed54eb7 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -900,8 +900,9 @@ struct vfio_device_ioeventfd {
 struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
-#define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
-#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
+#define VFIO_IOMMU_INFO_PGSIZES   (1 << 0) /* supported page sizes info */
+#define VFIO_IOMMU_INFO_CAPS      (1 << 1) /* Info supports caps */
+#define VFIO_IOMMU_INFO_DIRTY_PGS (1 << 2) /* supports dirty page tracking */
 	__u64	iova_pgsizes;	/* Bitmap of supported page sizes */
 	__u32   cap_offset;	/* Offset within info struct of first cap */
 };
-- 
2.7.0


