Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6C81EC28D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 21:17:33 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgCPk-0008Bk-8x
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 15:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jgCOI-0006mx-F7
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 15:16:02 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jgCOG-0002fu-Hs
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 15:16:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed6a5170000>; Tue, 02 Jun 2020 12:14:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 02 Jun 2020 12:15:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 02 Jun 2020 12:15:58 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 19:15:48 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 2 Jun 2020 19:15:42 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH 1/2] vfio iommu: Use shift operation for 64-bit integer
 division
Date: Wed, 3 Jun 2020 00:12:36 +0530
Message-ID: <1591123357-18297-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591125272; bh=INqjvK9GUaUbxLFgl48meRA1JF55U/PN28DUQip5ODw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=nf74jj68gnc1+aFA7sAwgGRbx3LNaY4TeBPQ1iQ1fiuq9oVC/sks0FPkmP+OyAIDg
 mDBylHAUaDeLLJWJaT+T/w1mlGOAYUcUVbLyyZONgunbPm5OxHOQFN8hsbxq3VVZl8
 kejWb3rY4ofxOVluebAJ6mIUrmj3/Yw45riyYNfTztWXhaW+lY/zqfzuOiT480sMMR
 JLqCRdeTwg+SlA5lNU4T3HZdzjVyTqnSmWFysk3AZJvrxccXJL8G4dE7NmPckvKQ2h
 G9hfHMsBEYBNmbnC6llVX/h8/nyWDtBMIMPXE3KCCTpWa2O4U2KxiowhZGGAGlgo66
 IhQaq+EFYFKmw==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 15:15:59
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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

Fixes compilation error with ARCH=i386.

Error fixed by this commit:
ld: drivers/vfio/vfio_iommu_type1.o: in function `vfio_dma_populate_bitmap':
>> vfio_iommu_type1.c:(.text+0x666): undefined reference to `__udivdi3'

Fixes: d6a4c185660c (vfio iommu: Implementation of ioctl for dirty pages tracking)

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 97a29bc04d5d..9d9c8709a24c 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -227,11 +227,12 @@ static void vfio_dma_bitmap_free(struct vfio_dma *dma)
 static void vfio_dma_populate_bitmap(struct vfio_dma *dma, size_t pgsize)
 {
 	struct rb_node *p;
+	unsigned long pgshift = __ffs(pgsize);
 
 	for (p = rb_first(&dma->pfn_list); p; p = rb_next(p)) {
 		struct vfio_pfn *vpfn = rb_entry(p, struct vfio_pfn, node);
 
-		bitmap_set(dma->bitmap, (vpfn->iova - dma->iova) / pgsize, 1);
+		bitmap_set(dma->bitmap, (vpfn->iova - dma->iova) >> pgshift, 1);
 	}
 }
 
-- 
2.7.0


