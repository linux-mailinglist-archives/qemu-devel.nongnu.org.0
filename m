Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C384A1D5BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 23:53:50 +0200 (CEST)
Received: from localhost ([::1]:39674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZiH7-0004RU-SS
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 17:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jZiAv-0004ba-Iv
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:47:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jZiAu-0006GW-FQ
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:47:25 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ebf0dde0000>; Fri, 15 May 2020 14:47:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 15 May 2020 14:47:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 15 May 2020 14:47:23 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 May
 2020 21:47:22 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 May 2020 21:47:16 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH Kernel v21 7/8] vfio iommu: Add migration capability to report
 supported features
Date: Sat, 16 May 2020 02:43:22 +0530
Message-ID: <1589577203-20640-8-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589577203-20640-1-git-send-email-kwankhede@nvidia.com>
References: <1589577203-20640-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589579230; bh=DrwPWU+sXftuEFqldJ2ZaKNqfOwMC13dnkFrRvL36DI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=Z7+D9SjMYhcV+iDquZTOrtuqMeIMTjX0HkbOE7DKANyf4/5vOcqE/HbDgZYXNM8Mv
 XxFNodFlex6xt4XWI+vdo2EZKxujzpdqJZX7vNeqSKD46ZyyDEu9K1DM/ZI9g4LfyX
 gfL8PcBKtfLk0jXrMoP7OJvMoawRLzfwwutCIv3SeL6ci1VkXoaDKEFi0g970On3Q6
 BU83TrfxB599pSvlNIZ5zoe0OJZ1ArNCZF3CsAg/dfGj/W+qTU0gBT5ozRa4jMCOzw
 B+z3qCj5lBi4/tfkAFIWipil1tBZL4EkQjkFzBHouGevJLshdmWpa953LCGkIR6R+w
 1ZI4WwfFpy7fw==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 17:46:35
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

Added migration capability in IOMMU info chain.
User application should check IOMMU info chain for migration capability
to use dirty page tracking feature provided by kernel module.
User application must check page sizes supported and maximum dirty
bitmap size returned by this capability structure for ioctls used to get
dirty bitmap.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 23 ++++++++++++++++++++++-
 include/uapi/linux/vfio.h       | 22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index d687794c721c..5c8d20974a2a 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2390,6 +2390,22 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static int vfio_iommu_migration_build_caps(struct vfio_iommu *iommu,
+					   struct vfio_info_cap *caps)
+{
+	struct vfio_iommu_type1_info_cap_migration cap_mig;
+
+	cap_mig.header.id = VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION;
+	cap_mig.header.version = 1;
+
+	cap_mig.flags = 0;
+	/* support minimum pgsize */
+	cap_mig.pgsize_bitmap = (size_t)1 << __ffs(iommu->pgsize_bitmap);
+	cap_mig.max_dirty_bitmap_size = DIRTY_BITMAP_SIZE_MAX;
+
+	return vfio_info_add_capability(caps, &cap_mig.header, sizeof(cap_mig));
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -2436,8 +2452,13 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 
 		info.iova_pgsizes = iommu->pgsize_bitmap;
 
-		ret = vfio_iommu_iova_build_caps(iommu, &caps);
+		ret = vfio_iommu_migration_build_caps(iommu, &caps);
+
+		if (!ret)
+			ret = vfio_iommu_iova_build_caps(iommu, &caps);
+
 		mutex_unlock(&iommu->lock);
+
 		if (ret)
 			return ret;
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index a1dd2150971e..aa8aa9dcf02a 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1013,6 +1013,28 @@ struct vfio_iommu_type1_info_cap_iova_range {
 	struct	vfio_iova_range iova_ranges[];
 };
 
+/*
+ * The migration capability allows to report supported features for migration.
+ *
+ * The structures below define version 1 of this capability.
+ *
+ * The existence of this capability indicates IOMMU kernel driver supports
+ * dirty page tracking.
+ *
+ * pgsize_bitmap: Kernel driver returns supported page sizes bitmap for dirty
+ * page tracking.
+ * max_dirty_bitmap_size: Kernel driver returns maximum supported dirty bitmap
+ * size in bytes to be used by user application for ioctls to get dirty bitmap.
+ */
+#define VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION  1
+
+struct vfio_iommu_type1_info_cap_migration {
+	struct	vfio_info_cap_header header;
+	__u32	flags;
+	__u64	pgsize_bitmap;
+	__u64	max_dirty_bitmap_size;		/* in bytes */
+};
+
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
 
 /**
-- 
2.7.0


