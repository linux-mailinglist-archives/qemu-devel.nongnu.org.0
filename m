Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52153F7597
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:07:51 +0200 (CEST)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsdC-0000z1-QM
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mIoDL-0003vr-62; Wed, 25 Aug 2021 04:24:51 -0400
Received: from m12-13.163.com ([220.181.12.13]:48194)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mIoDH-00042H-VD; Wed, 25 Aug 2021 04:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Hv+OoWC7Sexfnl1JdO
 2e84SRRthOhXXfF007eFefhFk=; b=A8Md/xx02R6uhlSxwCOfKREhgKIKn4B46p
 bNBLZO8Csi4sXuHMivLJyzfAfDzMRnMs97Fd4SzkjT8LFzOvmEFIZu2PRXQMR48o
 ZxK/JHCusoCBvpyTMhr2waH7w1N2GJxdwR8dONhtnVpIVRyGN4vJ6Fnxd15hKNhG
 XhYDgTja4=
Received: from localhost.localdomain (unknown [180.169.130.89])
 by smtp9 (Coremail) with SMTP id DcCowABnCwWL+iVhtO7SAQ--.38418S5;
 Wed, 25 Aug 2021 16:08:50 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of CFGI commands
 based on device SID
Date: Wed, 25 Aug 2021 16:08:40 +0800
Message-Id: <1629878922-173270-3-git-send-email-chunming_li1234@163.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
X-CM-TRANSID: DcCowABnCwWL+iVhtO7SAQ--.38418S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF17GFW7ur47AFykKw45KFg_yoW5Cr1kpa
 nrGr90gw4rCF1SyrnxKrW2krnIq34qgF10qryUWa9akw1UAryrXFWDK3Wrt34DJrW0yF47
 ua4rWFs8XF17Z3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bTrcfUUUUU=
X-Originating-IP: [180.169.130.89]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/xtbBrRL5dl75bWkJFwAAsN
Received-SPF: pass client-ip=220.181.12.13;
 envelope-from=chunming_li1234@163.com; helo=m12-13.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:24 -0400
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

Replace "smmuv3_flush_config" with "g_hash_table_foreach_remove".
"smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe devices.

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 35 ++++++++++-------------------------
 include/hw/arm/smmu-common.h |  5 ++++-
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 11d7fe8423..9f3f13fb8e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -613,14 +613,6 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
     return cfg;
 }
 
-static void smmuv3_flush_config(SMMUDevice *sdev)
-{
-    SMMUv3State *s = sdev->smmu;
-    SMMUState *bc = &s->smmu_state;
-
-    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
-    g_hash_table_remove(bc->configs, sdev);
-}
 
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                       IOMMUAccessFlags flag, int iommu_idx)
@@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid = CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
 
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start = sid;
+            sid_range.end = sid;
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_CD_ALL:
         {
             uint32_t sid = CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
 
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start = sid;
+            sid_range.end = sid;
             trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 95cd12a4b5..d016455d80 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
-- 
2.30.2



