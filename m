Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B04F67CF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:48:28 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9la-0003GH-K8
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gf-0000Ma-FI; Wed, 06 Apr 2022 13:43:22 -0400
Received: from mail-bn8nam11on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::616]:25664
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gb-0004Rv-I8; Wed, 06 Apr 2022 13:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuVJlDtgkXD2VhSj8GfO3iEogMo/PlOPaEAIjlh/zS4+u+MdPQDTFaD3nKvMnFaISJ0wIXGFUGxata1zfpwC5FsEkTzdm9XX/o1ag/pY3p04gL1xDzBTeDWun1zx4lyd2G2n5+UuJdiTWbJ/LiIvGh2XyGKl1DXhIppd88svuHEcsIl8Oc2HFKPRfkK8ZIkI6X8o5Fc4fXhcodS7aSOfaR0jgZwN0TsGF4v4K800y10anNJPz8jDpVwHavZhHzxadtFNUBrfPxPS2xX+2kvJ3Vw+RAef8uaqvIet4ygrZo+MW/M6UZuR0iRp4a6nxP+1j3VYvG/0HosB67dOsGiQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCGecnt5MiZEeQM860zBTr/QeRzMhxN2s9sDE/Racqo=;
 b=nUzyMTa7jBnd3pWAEzzJcEo59/mqkN1fxVnr5iCSF8O7xpD8S9e/jvsqFDIHE7HMQPXmDpIlNcXQ86s6gUr4+mbheLX3H/cVNKmX7gKqhCmMEQqv/r5GmQFTPSWitZ2S/AGC3XhBGiQCBLqiUpAzYE4dkcnB75skdzEEPh3q42TT7ejKF7vxsunXMOmZ/gaZt22WbpznjFhc9FaYNFskeJfDBxJv9Y/hzdb0nDqbMxiXIErCkXF3x0MpTAghLncQ3aS6zse+Hr00ZcTTXqWk7Csro8n9/xjDUxz3E1X2DP1lasf82wNybAp2Evd2A+u6yAaDLH2OxHIIoMJ/MxDb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCGecnt5MiZEeQM860zBTr/QeRzMhxN2s9sDE/Racqo=;
 b=ThaWsnULTZT/M5XNF7HyrzF6d3YOIhNUoXaRgnxVOQ7chj32t6Bo5UQCfU/K57kilF8QPBfynurYtZ7pAYGIpNzo2uh/zuuuR01QkEREMHyp2JY7JAXRXDJ8qSxB6dDFAzW9yEpRjOgmzy2LXKGEse7YNggaMTu2wUSAbwAtvS0=
Received: from SA9PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:6e::33)
 by DM6PR02MB6012.namprd02.prod.outlook.com (2603:10b6:5:155::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:43:08 +0000
Received: from SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::4) by SA9PR11CA0028.outlook.office365.com
 (2603:10b6:806:6e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 17:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0012.mail.protection.outlook.com (10.97.4.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 17:43:06 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 18:43:04 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 18:43:04 +0100
Received: from [172.21.132.222] (port=48486 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nc9gO-0005RC-Lp; Wed, 06 Apr 2022 18:43:04 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/4] hw/arm: versal: Create an APU CPU Cluster
Date: Wed, 6 Apr 2022 18:43:00 +0100
Message-ID: <20220406174303.2022038-2-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ab8ee1-5ca1-4e87-5182-08da17f4e8ae
X-MS-TrafficTypeDiagnostic: DM6PR02MB6012:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB601264AE3A4B8AE70FDC8515ABE79@DM6PR02MB6012.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYuiWrPbZvBNpBVkU6pwQFx9egEo+Xdb4WfWthTWUUSPlcjM7pFOueKww8M+6gX7Bzn9YdXbkJlaT+yeOOSpIPRjRc5a/BfhgMSnB5OYbhtAHM2/Ox0/VZTI6l1IUi9u5UYGwGqIusPeyUxp8rGF4l829oe3qcxKjy7cPb8c8NcEFCT+DyzDNpYBmzzWKycFF6TpOb5Nd9T0HKTuifBMtyniLeDahZzqN1qDU7RoXZDWNG/GgTWKiowVp+/eOX7fyz4qm9YSPGvf3tv31bhHcJw8AGl9d09o2C03RWiAWGRzWk3cOzBgBnn4eg09/vyMtCPp0ZXREuQ/dxR/uCn7OS6XTi1ZNe0+EifbiO7/O/qvBmruykNqUPKBWVrcpTdfx8x0GBl1U0eBTilN6djiM9fN+HbV2xFDuGUITIKA0H8QRMHXWHGgTnDKnFrj9YtMGAOyPgQg0InDDE3FAVOTOE7oZuMLmBnH0hAv3EhHODK+co13zLGMFsqte/+T0/j1upbKcw3s4ZPSCXNFBmpsIhJ6O7gta4FqcA+PT8Z/1be+JXeGITtQgWipWS1bMRuUiqHB6L8YA1EDS+8+rS5U4szgXsnGbFnR08bvZEr/c7WvQ7Yi5V3uQpxhPaYNPrxL22FlHsAtpk7T7BJi/uzldwEwOItEnE4qG92lGTkH6ZOSDIHDOeofL6Qebiv4V2Nm
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(426003)(54906003)(47076005)(36756003)(336012)(83380400001)(26005)(70206006)(4326008)(8676002)(316002)(1076003)(6916009)(70586007)(40460700003)(5660300002)(2906002)(508600001)(6666004)(2616005)(82310400005)(8936002)(356005)(7636003)(36860700001)(9786002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:43:06.6731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ab8ee1-5ca1-4e87-5182-08da17f4e8ae
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6012
Received-SPF: pass client-ip=2a01:111:f400:7eae::616;
 envelope-from=edgari@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 fkonrad@xilinx.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Create an APU CPU Cluster. This is in preparation to add the RPU.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xlnx-versal.c         | 9 ++++++++-
 include/hw/arm/xlnx-versal.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 2551dfc22d..4415ee413f 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -34,10 +34,15 @@ static void versal_create_apu_cpus(Versal *s)
 {
     int i;
 
+    object_initialize_child(OBJECT(s), "apu-cluster", &s->fpd.apu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->fpd.apu.cluster), "cluster-id", 0);
+
     for (i = 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
         Object *obj;
 
-        object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
+        object_initialize_child(OBJECT(&s->fpd.apu.cluster),
+                                "apu-cpu[*]", &s->fpd.apu.cpu[i],
                                 XLNX_VERSAL_ACPU_TYPE);
         obj = OBJECT(&s->fpd.apu.cpu[i]);
         if (i) {
@@ -52,6 +57,8 @@ static void versal_create_apu_cpus(Versal *s)
                                  &error_abort);
         qdev_realize(DEVICE(obj), NULL, &error_fatal);
     }
+
+    qdev_realize(DEVICE(&s->fpd.apu.cluster), NULL, &error_fatal);
 }
 
 static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 0728316ec7..d2d3028e18 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -14,6 +14,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
+#include "hw/cpu/cluster.h"
 #include "hw/or-irq.h"
 #include "hw/sd/sdhci.h"
 #include "hw/intc/arm_gicv3.h"
@@ -49,6 +50,7 @@ struct Versal {
     struct {
         struct {
             MemoryRegion mr;
+            CPUClusterState cluster;
             ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
             GICv3State gic;
         } apu;
-- 
2.25.1


