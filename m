Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E53F55C9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 04:23:51 +0200 (CEST)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIM6F-0004Rz-KL
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 22:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIM4Q-0002sN-P4; Mon, 23 Aug 2021 22:21:46 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:37479
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIM4P-0000Jm-0P; Mon, 23 Aug 2021 22:21:46 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629771700; h=from:subject:to:date:message-id;
 bh=ajNAGCGzgMc9BX7WW9wqMRqhN83RK0ZWWGaydjpokWU=;
 b=PQoZGU89YzmbVJ7uH1QigzE6DEVdFqkZbWo1Y3vnPody44dPlAVRpQjbaD7edeZUVQnBDCqUz9c
 m2c/OFJM8bP6vWRCPbPWIiJUOWHIwe+6AqcjMccOP2keXDIPmOMPG4kwSDkg/8JYVpdl1QnlEtWjz
 2b73dNFY1rsfwXmlIYw=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 10:21:39 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v3 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Topic: [PATCH v3 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Index: AQHXmIbD3OnG2hCkMEW/KA4QExXdU6uB7Eaw
Date: Tue, 24 Aug 2021 02:21:38 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAB29@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.39]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--2.672200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LCM <chunming.li@verisilicon.com>

"smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe dev=
ices.
So we replace "smmuv3_flush_config" with "g_hash_table_foreach_remove" base=
d on devices SID.

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
 hw/arm/smmuv3.c              | 35 ++++++++++-------------------------
 include/hw/arm/smmu-common.h |  5 ++++-
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 11d7fe842..9f3f13fb8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -613,14 +613,6 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sde=
v, SMMUEventInfo *event)
     return cfg;
 }
=20
-static void smmuv3_flush_config(SMMUDevice *sdev)
-{
-    SMMUv3State *s =3D sdev->smmu;
-    SMMUState *bc =3D &s->smmu_state;
-
-    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
-    g_hash_table_remove(bc->configs, sdev);
-}
=20
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                       IOMMUAccessFlags flag, int iommu_idx=
)
@@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_CD_ALL:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 95cd12a4b..d016455d8 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMU=
AccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
=20
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
=20
 #define SMMU_IOTLB_MAX_SIZE 256
--=20



