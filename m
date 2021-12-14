Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CA474161
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:20:56 +0100 (CET)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5rb-0004VR-1V
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:20:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bc-0007jH-54
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:27 -0500
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com
 ([40.107.237.50]:12833 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5ba-00071B-7a
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTm+ibyEVTKWgpP/dlWmhsBfXnhaWbMOr1/hAqb3Tn+X1SgozyV6H8u8sTNtXbiDrC0jMEkJOwLVoq6bh3Sle5zeC7YrX8dEJDEzwPVirsczsTElrOvgKDN462i81g28f/FqSDGJdgHuCgByBhfcNXr+N50mQLCHf6bya/8iP/lwI0wa9tXzauLsYNhXdnj9exfQz0UBO47tvMLisLxhLboKmUbTvHLWFEJ19tdlqrkBzHR2ZAejy68W4GJCbpgULMOkqZNOW21ZlmR2LNhhIk9PGi+j9dAaKXTqEf6OmQf5n9L61yM+mMpwdwB1CRjQn/WQLX65z4qDH0YRXOwIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1mhKlpKgMNk+OocYNIKFV+4+UPKk7wEAx6La3DJDhQ=;
 b=UalSgLyPNaEyGRS63x8IZyn3EJ6rYbAbvW6bw+9usSR2D7ynfNDJJzDl4S30t3jb63mtXguc8kOOmj3pjhJYQTxYhP6EYCZbMFjxBeeDEJEXdEOKJL+mKW+YgnJsFmWEcORPCQpLxQwCI4FP6m7qDiYKppK70SJfKdF/VWCSpUlIGqliqN0vvXEWeDKc4dyFAui9FbkhX3du6XkVwZutKorISAEEPtDAkE3YUbvlEr4qfH++n43u9B+730R3FlZXkQISVXejcS91+g1udgT2752bhmabz/9AikIPpufI9Dthxx5lYFfCewjkHh4hB2JlD70UdEdG5cJCxlaVbGCD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1mhKlpKgMNk+OocYNIKFV+4+UPKk7wEAx6La3DJDhQ=;
 b=LrYO+1e8+QMaR8LsY+Frwy7VC+NJqJF+KOu0c7AHJyYl8K3MAuxeq8XHyfMLXV7TEAS5BE83T+Erd1KuGETM0fnqdpEh2pz/U0VI/WAKzWsH8Quh9ASInszoegGs4cNYZbse2mOAoYoo6C/NRAHhOAx27J4agywyDcmSQqtti9s=
Received: from DM5PR15CA0070.namprd15.prod.outlook.com (2603:10b6:3:ae::32) by
 CH0PR02MB8076.namprd02.prod.outlook.com (2603:10b6:610:109::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 11:04:19 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::a7) by DM5PR15CA0070.outlook.office365.com
 (2603:10b6:3:ae::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:08 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:08 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bL-000F5K-Uv; Tue, 14 Dec 2021 03:04:08 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 06/12] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Tue, 14 Dec 2021 11:03:48 +0000
Message-ID: <20211214110354.21816-7-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83eaece7-58bb-45cc-50e5-08d9bef179fc
X-MS-TrafficTypeDiagnostic: CH0PR02MB8076:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB8076C0C7EBC1C6DF995ACB8AAD759@CH0PR02MB8076.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cmKIBkFJRw5KyZVsnBHIsq5Z7PRb5BZvjSAZO5vr4F8p4o80ozthVo+fuFB9Z1QYKxYjmtr7efgn8aHl1UE2RHHZecD6Neqql0YhOpJvQN3mLZjHntPzmXm7dm39UbiJPSh1s9hupD35vYxxESKV78yhXwrmBte+INPGiILJYNz6OVc8adQPRuiQbLHlX8R5+24laidYqutqxYx8NzvLmMfM/Hd+7IW2CC4Kt1AizOmLkDkZmH0ku6ftpMTwoJH5ZZIi6mef+29xvTLGgCBB9X7aKQWHDiq3SYn2HJdFeL0yBxbtCawIWvrNDKQfJSD7ndGS8mcor0aJM3neywrlW6IDvrZSJstDfpPsV4m3PNLJxtnYHibxdQM/tptdmWhy1rvfdcmGAaZjc8+/JoIzCgcA0Ob2Md5neLRecw+NQ8oOu+Y2vqMp+u5MzkE1S+eBADxP+IcQI/1yef07O6SQR1gBQIuWBDCADkD66cXwYa7uGkZAClVQkiJGQ2sut8x8NyD8Wy1cWiTHTbSPXSbNs+jN+6bMVlYywe7ZrTNUDCzFFJddGibKq7aznWxH/krLKXABlwAKXEIxjGItYKo8wrthbFmAvykMhQH808rrQj4lbYErFVA6YaWSH0UHt3AXNbmmwJjOfGrE0GRMZmWsJ895p/pF7fhhLbN4endrKRNDUZZ/9bn5TyBAP8W1fhSwok23/kG6OH5qzUQ4mEKOI0mtSAyhugJmoelB3JFEE4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(7696005)(70206006)(26005)(4326008)(54906003)(8936002)(508600001)(7636003)(8676002)(356005)(83380400001)(70586007)(44832011)(36860700001)(2906002)(336012)(6666004)(6916009)(316002)(9786002)(47076005)(5660300002)(82310400004)(186003)(1076003)(2616005)(36756003)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:19.1673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eaece7-58bb-45cc-50e5-08d9bef179fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8076
Received-SPF: pass client-ip=40.107.237.50; envelope-from=figlesia@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the DMA control interface for allowing direct control of DMA
operations from inside peripheral models embedding (and reusing) the
Xilinx CSU DMA.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/dma/xlnx_csu_dma.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..8382aa526f 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -30,6 +30,7 @@
 #include "hw/stream.h"
 #include "hw/register.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/dma/dma-ctrl-if.h"
 
 /*
  * Ref: UG1087 (v1.7) February 8, 2019
@@ -472,6 +473,19 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                          uint32_t len)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dma);
+    RegisterInfo *reg = &s->regs_info[R_SIZE];
+    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
+
+    s->regs[R_ADDR] = addr;
+    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
+
+    register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
+}
+
 static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
 #define DMACH_REGINFO(NAME, snd)                                              \
     (const RegisterAccessInfo []) {                                           \
@@ -696,6 +710,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+    DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +719,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
@@ -731,6 +748,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
+        { TYPE_DMA_CTRL_IF },
         { }
     }
 };
-- 
2.11.0


