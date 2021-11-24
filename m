Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95A45B8AD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:50:45 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpprQ-0006lt-DC
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKC-0001tZ-Ir
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:24 -0500
Received: from mail-mw2nam10on2086.outbound.protection.outlook.com
 ([40.107.94.86]:10304 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKA-0002iB-F2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EABDDGLd5EhfsgZGaHXUw/FB9q6l6NLbMKzKnL+41dFNvm76ubG5wmK02vfds7EuTp9QdO+u3HhXypAyMZ67WB3AiqoGk4WaVwvvwKzaivMCGvkooor3LepZ7lPa9MWXNGc3Bm3yPMtrYTnp74jLs7eNUxau+Vx7Sx/iRijxUeS7l5yKwQQ57PE2l38cedCxuGCa3w0E/7eTmOdbyoVjkg9P+xBKXb87D07W9hrCqA7hDWLXoKMEQkwAZ1YAXyGifvekdja5hXXCbP1AM1C2F27goCxUAxV3NEATNwbun5cu7Z8JX/vZkvLTvoP8RSbua5+C2+E8xe9v+fIwDw9r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXfbDhx0Q6+Rogs0BnanHUPRlPrCapthIIq5RaBFgWI=;
 b=iRjQ8FGcR/RQfdQo8HGQjPNJhgN5013shpyRnUzh6aiT1m4+B6ZsyfqonOReoQACuRtdfwgUSjigHUUWxKcYI3YEyS217o6h2YU22SmT9Ka5nQesYuiDnA9ObyV7+ImZBSsyMs4+EM2QdNZW+ApDkgwNKtX30WCcjrT/e9U9LkJ1AjEsRoInlkfVSy/tAvXX2NVe20m/yQaEkRwSDj263cCEujWLpL7viUZSgxk1NKGwXTYpaOxrD1m7vpuwCoIWGc9vwhOn/F+wpJUjbTydb987gDP5zsm/cw0BciyHnRf8wMPef53JUztTSOJqsllI5UgDAbD4HwqIFPBZsGFNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXfbDhx0Q6+Rogs0BnanHUPRlPrCapthIIq5RaBFgWI=;
 b=TAYq69B+yoV85A7fvh4/wNC0le6S0bxSC0QJEeaj7EsNKSZNLadi1ylLFOJ1FEpS3lD/Z6YI/Hf1fy6INOdRdtJiBn6dhc48IWL5eeUScCj6h17TNhTSR0Foa8JbQniU/i3TpFSOn1TiZ8IO2fIKZ6rB+vlRfF7wnsew3WlSra4=
Received: from DM5PR16CA0029.namprd16.prod.outlook.com (2603:10b6:4:15::15) by
 CY4PR02MB2248.namprd02.prod.outlook.com (2603:10b6:903:d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Wed, 24 Nov 2021 10:16:19 +0000
Received: from DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::d1) by DM5PR16CA0029.outlook.office365.com
 (2603:10b6:4:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT040.mail.protection.outlook.com (10.13.5.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:16 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:16 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppK4-00036z-Ih; Wed, 24 Nov 2021 02:16:16 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 10/10] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Wed, 24 Nov 2021 10:15:55 +0000
Message-ID: <20211124101555.1410-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac5adb69-a44c-4e6b-a170-08d9af33756d
X-MS-TrafficTypeDiagnostic: CY4PR02MB2248:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2248EFD447BA0A46B9F4C353AD619@CY4PR02MB2248.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05MxGjRlBvU9683f0YgL6p5STjwrC6pWeysQCac6XGKMOQiZPiY0Qv+iOlj/ZE0WTEOnIPkGVg/7mGG/Kbj6pQeuu1GZxg/4uYXS8lWS+qELBC/wChiKVlA/+MvRwLmLE6/BuSpZwuo7P/sEtFGN3V9JrDza0QknfYoIzMbOU+GTGRu7ge+x+EhCp9Wq7xFVYsM0MCHjnD7HbcKcqdoPZNqOe7lGkRdnHMDOdgcujenN2rO9zoycFL/6sXeH9Dr5EgSvKK7bCXgmsR18vnUKLywMzbfjM/aw9Cc/n/l1uq1CySxqsER3qwXaN4s9fNsuyyzHac2cGLxo01hBNo02XAkCEyATLcGQeYqsm7ozylMe+bFTcACfxZqO2uobBejLxn6oPtYxPJ9K2G/3FBJjMDEg4OddHjnpJs3ppry5lSQjoYvIJkEKya4j7fdAQam1kiV9MkpuJ+Ad/ikxex65Hm16T2kSsBnYJkkQ7LM1EtuyNx7ctTs4XrhEnv1FlZhaA3l4oHlNs8Hvx10uA4eINzlBBNNRmNS/vS81xQ/RxLN26JaWvbKyHtRDxENzBtOoZwW/dSukZIQrQ2xq2Jc/vjuEVv4XIx2m6y0to1ecDqCrirCOMDKUR4NHu9bEO5dUatWFxoyVMn3cgeKPK22QtR5OpWZTWWVGSzTkKajOUCnc3Z354gJ1q3QlICW5c2ceuYw6wgl9PyDLEorr1Oz4RWEzPpCHbV2KPVyQy2LQNzE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36860700001)(4326008)(9786002)(70586007)(356005)(47076005)(44832011)(2616005)(4744005)(186003)(316002)(36756003)(1076003)(7696005)(508600001)(54906003)(26005)(336012)(426003)(70206006)(7636003)(8676002)(5660300002)(82310400004)(8936002)(6666004)(6916009)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:19.7028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5adb69-a44c-4e6b-a170-08d9af33756d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2248
Received-SPF: pass client-ip=40.107.94.86; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

List myself as maintainer for the Xilinx Versal OSPI controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8c2b01a282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -963,6 +963,12 @@ F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
 
+Xilinx Versal OSPI
+M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+S: Maintained
+F: hw/ssi/xlnx-versal-ospi.c
+F: include/hw/ssi/xlnx-versal-ospi.h
+
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.11.0


