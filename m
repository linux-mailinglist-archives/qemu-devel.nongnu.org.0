Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F53DC181
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 01:18:32 +0200 (CEST)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9blv-00083l-8B
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 19:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m9bkc-0006UA-B0; Fri, 30 Jul 2021 19:17:10 -0400
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com
 ([40.107.93.64]:61825 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m9bka-0006lP-07; Fri, 30 Jul 2021 19:17:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4XTPwM5dbfy9uSUqYPmeQPj7dh+PVVpZ7JH2btYVo5yMGoNXMLbQ/wNE7aq2hEyWqksJN1GlGH2BSEOoLXIdPGJssay9UQBFpsQBMfMnkaOYAYUtsmj40opWcHNLWS/xNwRA7p0g+WA8U88zHJSe71ZfzIoYvvT89Nr2Y5vkByqgSRQB1gSOLWug7N5cBmWO5aWKYpkG+A2EhhqFiuWm49Xbf6Vxpu8s1s0gxFSpQ1xsRtemeNiW38jI1AjHO6Wm5ZfHemvAAuwkq+6vGYjXyHm3Omg88itsj58LuxciFE9/eUK1r8uco352oIYYzJHCRCaaKj3Op4u/oR0t+w30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2pWrNBRh8FaPlFfvjIUBmTU0fAgP8ZskTQQ2kya3KU=;
 b=dp6TA/90W6kBKf2GI1ZIFZSdMR/2dBeEVZf6FJxJBBnrA+2yvdocE4UD7sYTbTs7WGtHnD5zB74pp551rGJmfuUYBeYX5aW+zuVYhBUek3qUJL5PjKuCkgFhQhZhGv1pP/iz/0j/KoGfTHWZLOhxvG1l3OAewggJVLLvbvZe06GYV715Snd7hu8IgJ+TOt7xI6I/D/ks4t+NnuDa1mNtsSb0k5XtcQQWd+b+dJpgTd/mkA1RhSaROr9SutmR4AWCV6zyWoJGTkJYqQ0NljRqOjBnOvsDvkwq+e+RVgqxv+R4KZHRdsmpbl2jRs/rDGheMzirKq+ubyz9kaaO526zeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2pWrNBRh8FaPlFfvjIUBmTU0fAgP8ZskTQQ2kya3KU=;
 b=jwVDYrBcLaelUHgX/kU0xf7L2SibsByo8O94vmPPjBwV9KiUGe9fkwKADKn7VhhBsBnXN/qkaRJTEFKrFxOIY+w4D1cTh9Tb39g5pYRK9trVklU+p/vBqyDJMeaISHxFUrZCOLKNJfr1SwnntHZ6xAcK/1jkJtvIh/bS7XBpJLI=
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by BN8PR02MB5972.namprd02.prod.outlook.com (2603:10b6:408:b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 23:17:03 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:126:cafe::6d) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Fri, 30 Jul 2021 23:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 23:17:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 16:17:02 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 30 Jul 2021 16:17:02 -0700
Received: from [172.19.2.32] (port=36936 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m9bkU-0006F4-Q1; Fri, 30 Jul 2021 16:17:02 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] hw/arm/smmu: Add access flag handling
Date: Fri, 30 Jul 2021 16:17:02 -0700
Message-ID: <1627687022-366528-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627687022-366528-1-git-send-email-joe.komlodi@xilinx.com>
References: <1627687022-366528-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ee1f32-4303-4097-874c-08d953b02428
X-MS-TrafficTypeDiagnostic: BN8PR02MB5972:
X-Microsoft-Antispam-PRVS: <BN8PR02MB59726A0F161F6C5498C0FCBDD0EC9@BN8PR02MB5972.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xc07hM6BpP1U7Q8Mgbozd4VumoJlaHgEq0wPP3PPAOEyP5up/Bqbu/tEi0mEISZa6/bRy6hVxG3QzQHb9ovnCSp5LHp4xqXZ7A9wrieWyxqorr7z10VrFg4u7FIa3q3+bLQB8BmwmaTUnDNG18hXvsGhAxSSP36ipUN3hv9Hoq1mJGQf9XjvFS2Kb9uKjlCssEFhTJbxBvusI+Pv2CU2L3A2Vn9Aw0APv6Ht2RoxFLEM9oTAwsyU9yGeI4tKxjFUxUBXwV5tJPbasUpXBVfXU0Svhfhy7u6X8ScNEabdtP6xeUFI/oNZ9z/Wu4Nc31/1lwb0xFm6xXbyxdLlE0YiTNtM3KIj1ryc1OYBhiOwkqpOpTz63Yn1TFrffvm1fI2393ncTH6Q8UnB30BGKZZMKRdcW9XXqio4v6UJS3/KeX+qlNUoAa4+5VgT2IKsX2wmlrHFOm3clfvZ7bgLNcHkzdS5+Uc0JE6IC3KL1NJkw+pGuZqIVvtmMn0UHEcqqg6dxBG5s3xznPUCSqDExqjcqFy3i+ZPLjToJ7z0lW2MlVnHmEOKdunzpztZcA/Umsezv6BI7T63SlIYOHnueuH6YbtgXRfge58VeykNk3aGXus+efGhCmpL09zOTx1tfgfEx1J49jvLZ7BaF7aTVk3GEFHU7jnmeUTrX46Q1xPOOvCdZoMRy1J3qMDse5Kf7JBsgivXvqBslfRyGSJclGOpd+GWKNTcvKPBUDTV9KJuRpc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(47076005)(356005)(36860700001)(44832011)(4326008)(2616005)(70206006)(83380400001)(86362001)(426003)(7696005)(8676002)(70586007)(8936002)(336012)(54906003)(316002)(36756003)(2906002)(36906005)(478600001)(82310400003)(26005)(9786002)(5660300002)(7636003)(186003)(6916009)(82740400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 23:17:03.4831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ee1f32-4303-4097-874c-08d953b02428
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5972
Received-SPF: pass client-ip=40.107.93.64; envelope-from=komlodi@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SMMU should access fault if AF == 0 in a TTD, and if AFFD == 0 in the CD.

Per the spec, an access fault has a higher priority over a permission fault.
For instance, a write to a writable clean (temporarily non-writable) page with
AF == 0 && AFFD == 0 will cause an access fault.
If AF == 1 in this situation, then a permission fault would occur.

Access flag handling is more complicated if HTTU is supported and HA != 0 in
the CD, however we currently do not support HTTU.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 hw/arm/smmu-common.c         | 7 +++++++
 hw/arm/smmu-internal.h       | 8 ++++++++
 hw/arm/smmuv3-internal.h     | 1 +
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 5 files changed, 18 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0459850..0fcc65c 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -305,6 +305,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         uint64_t pte, gpa;
         dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
         uint8_t ap;
+        bool af;
 
         if (get_pte(baseaddr, offset, &pte, info)) {
                 goto error;
@@ -341,6 +342,12 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
                                      pte_addr, pte, iova, gpa,
                                      block_size >> 20);
         }
+        af = PTE_AF(pte);
+        if (is_access_fault(af, perm)) {
+            info->type = SMMU_PTW_ERR_ACCESS;
+            goto error;
+        }
+
         ap = PTE_AP(pte);
         if (is_permission_fault(ap, perm)) {
             info->type = SMMU_PTW_ERR_PERMISSION;
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 2d75b31..9d3b22c 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -58,6 +58,11 @@
     ((level == 3) &&                                                    \
      ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
 
+/* access flag */
+
+#define PTE_AF(pte) \
+    (extract64(pte, 10, 1))
+
 /* access permissions */
 
 #define PTE_AP(pte) \
@@ -66,6 +71,9 @@
 #define PTE_APTABLE(pte) \
     (extract64(pte, 61, 2))
 
+#define is_access_fault(af, cfg) \
+    (!cfg->affd && !af)
+
 /*
  * TODO: At the moment all transactions are considered as privileged (EL1)
  * as IOMMU translation callback does not pass user/priv attributes.
diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d1885ae..0ccad1d 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -587,6 +587,7 @@ static inline int pa_range(STE *ste)
 #define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
 #define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
 #define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
+#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
 #define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
 #define CD_HD(x)         extract32((x)->word[1], 10 , 1)
 #define CD_HA(x)         extract32((x)->word[1], 11 , 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60be..df5a194 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -483,6 +483,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
+    cfg->affd = CD_AFFD(cd);
 
     trace_smmuv3_decode_cd(cfg->oas);
 
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c..b0e82ad 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
     bool disabled;             /* smmu is disabled */
     bool bypassed;             /* translation is bypassed */
     bool aborted;              /* translation is aborted */
+    bool affd;                 /* Access Flag Fault Disabled */
     uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
-- 
2.7.4


