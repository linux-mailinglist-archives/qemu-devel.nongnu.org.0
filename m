Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DCA1DBD33
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 20:45:51 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbTiw-0001aS-RA
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 14:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTer-0004Tj-H9
 for qemu-devel@nongnu.org; Wed, 20 May 2020 14:41:37 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTeq-00017d-JT
 for qemu-devel@nongnu.org; Wed, 20 May 2020 14:41:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec579d20000>; Wed, 20 May 2020 11:41:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 May 2020 11:41:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 May 2020 11:41:34 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 18:41:34 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 18:41:26 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH Kernel v23 2/8] vfio iommu: Remove atomicity of ref_count of
 pinned pages
Date: Wed, 20 May 2020 23:38:02 +0530
Message-ID: <1589998088-3250-3-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589998088-3250-1-git-send-email-kwankhede@nvidia.com>
References: <1589998088-3250-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590000082; bh=uUgKJVCFdD4Zp7du3o0u/sQDLu1K2BjFd3xLP7hSugs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=la09jXbpudPr9126Oh+OdwQYCdvHmXHITTXtLWeCBR8kDU0d1cSfnOl8NwlG8vGIN
 vk54ptLpQ97slshXPgxoZ6hBllUjFPIeWO5FZKIQ/G6o5bxl4oeVZpcbdSRDv2unkx
 x+yFZIRYQg/yoRmC9iFJirRMDuucwjcQ/zBlrN9r6T7UNv0SgPLCfuQOyyds7FBXNw
 C7q6dWkgE15CjCP9U7s6dCEhB9ftedCSkYNsGRyfeuJW1Tn03zj4Rke1YT1z4+MElh
 FIivVICX8zTLUKE1f+PLBTx7WsvRRy6/DnroK3G0F+hOdCJ5sbFJ5oH52kyak9Mpuw
 45XIDt6HifsRQ==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 14:41:35
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

vfio_pfn.ref_count is always updated while holding iommu->lock, using
atomic variable is overkill.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 drivers/vfio/vfio_iommu_type1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a0c60f895b24..fa735047b04d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -112,7 +112,7 @@ struct vfio_pfn {
 	struct rb_node		node;
 	dma_addr_t		iova;		/* Device address */
 	unsigned long		pfn;		/* Host pfn */
-	atomic_t		ref_count;
+	unsigned int		ref_count;
 };
 
 struct vfio_regions {
@@ -233,7 +233,7 @@ static int vfio_add_to_pfn_list(struct vfio_dma *dma, dma_addr_t iova,
 
 	vpfn->iova = iova;
 	vpfn->pfn = pfn;
-	atomic_set(&vpfn->ref_count, 1);
+	vpfn->ref_count = 1;
 	vfio_link_pfn(dma, vpfn);
 	return 0;
 }
@@ -251,7 +251,7 @@ static struct vfio_pfn *vfio_iova_get_vfio_pfn(struct vfio_dma *dma,
 	struct vfio_pfn *vpfn = vfio_find_vpfn(dma, iova);
 
 	if (vpfn)
-		atomic_inc(&vpfn->ref_count);
+		vpfn->ref_count++;
 	return vpfn;
 }
 
@@ -259,7 +259,8 @@ static int vfio_iova_put_vfio_pfn(struct vfio_dma *dma, struct vfio_pfn *vpfn)
 {
 	int ret = 0;
 
-	if (atomic_dec_and_test(&vpfn->ref_count)) {
+	vpfn->ref_count--;
+	if (!vpfn->ref_count) {
 		ret = put_pfn(vpfn->pfn, dma->prot);
 		vfio_remove_from_pfn_list(dma, vpfn);
 	}
-- 
2.7.0


