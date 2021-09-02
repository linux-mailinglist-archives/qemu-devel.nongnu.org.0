Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135863FEA7F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:17:53 +0200 (CEST)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhuy-0005EN-4Y
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mLhsJ-0001jR-MZ; Thu, 02 Sep 2021 04:15:09 -0400
Received: from m12-16.163.com ([220.181.12.16]:52783)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mLhsD-0002jL-Rs; Thu, 02 Sep 2021 04:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=sxT4f
 Ng/5jw852mPUItD0wtKQXXXp9s6gNNw/pABRQs=; b=hNqshChi3TlTe2w4/TBU1
 552gLiqRaMQBGlLzpuWzbukh8rhlF+Flo2Yh6ttkhuxJWnnSpsIWoVYFARXgBI5q
 kM4CSlqEsxzcwlywZx8q0LgyvJrr6hcCgoQ3eKOojH+//wuyiFZM0o6GW9E45gjL
 JdXC+DYoJ54aOYvE8DYjXE=
Received: from lcm-VirtualBox.verisilicon.com (unknown [182.148.13.201])
 by smtp12 (Coremail) with SMTP id EMCowABXMRDmhzBhan7BAQ--.86S6;
 Thu, 02 Sep 2021 16:14:44 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v6 2/4] hw/arm/smmuv3: Update CFGI commands to support non
 PCI/PCIe devices
Date: Thu,  2 Sep 2021 16:14:27 +0800
Message-Id: <20210902081429.140293-3-chunming_li1234@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210902081429.140293-1-chunming_li1234@163.com>
References: <20210902081429.140293-1-chunming_li1234@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABXMRDmhzBhan7BAQ--.86S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW3Aw1kJFyxZr4kKrWktFb_yoW8KrW3pr
 42kFn0gr18Gw1SkrsIyr4I9FZxJ3ZY9F1jgr1UWa93C3WDAryrXryDKw1fJr9rWFW0vr47
 uayrWF45Xr12v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bFEfOUUUUU=
X-Originating-IP: [182.148.13.201]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbivxUCdlWBveQstQAAsK
Received-SPF: pass client-ip=220.181.12.16;
 envelope-from=chunming_li1234@163.com; helo=m12-16.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: chunming <chunming.li@verisilicon.com>

  "smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe devices.
  Look up in the platform device list: peri_sdev_list for non PCI/PCIe devices.

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 29 ++++++++++++++++++-----------
 include/hw/arm/smmu-common.h |  5 ++++-
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 557d24ec6..615a6c904 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -985,14 +985,17 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 break;
             }
 
-            if (!mr) {
-                break;
+            if (mr) {
+                trace_smmuv3_cmdq_cfgi_ste(sid);
+                sdev = container_of(mr, SMMUDevice, iommu);
+                smmuv3_flush_config(sdev);
             }
 
-            trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            sdev = smmu_find_peri_sdev(bs, sid);
+            if (sdev) {
+                trace_smmuv3_cmdq_cfgi_ste(sid);
+                smmuv3_flush_config(sdev);
+            }
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1027,13 +1030,17 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 break;
             }
 
-            if (!mr) {
-                break;
+            if (mr) {
+                trace_smmuv3_cmdq_cfgi_cd(sid);
+                sdev = container_of(mr, SMMUDevice, iommu);
+                smmuv3_flush_config(sdev);
             }
 
-            trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            sdev = smmu_find_peri_sdev(bs, sid);
+            if (sdev) {
+                trace_smmuv3_cmdq_cfgi_cd(sid);
+                smmuv3_flush_config(sdev);
+            }
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 2902eb13c..be12b93c5 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -161,7 +161,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for peripheral device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
-- 
2.30.2



