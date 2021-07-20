Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B83D01C5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:36:32 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ubX-0002uZ-2S
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uX0-0006g3-OV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:50 -0400
Received: from mail-mw2nam10on2086.outbound.protection.outlook.com
 ([40.107.94.86]:6147 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uWy-0002GF-VP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1HVNi0TyAcPlD+4Z2P7Z9h+nP2iBOkGmjJFO4SGbxTz9AUD8QbJga+ty2ABzDPEEfC6hEQbn230HxnVCsk2YUaE1ECoVg8klsAFPGSBUiMiQHtb+fN8p0A/kUPoEDP71si9K5stCt583JP1U5TGaVmA5ykPJ0HIdlJemfyynglLodKmOjUDD+J7pMMVqxmm5r5P3yF+GK+0b86SZSH4n16/YX02v40RzHRZemttSU2gDJ93PWaBUot61mmTbfkhiYhOZ/L3RqcLaa9N+YrqlTVwJFc/AHtokgB+Kmoc7Li1f6anal1CoZG3OfM6G/xnWyMDfu+7hOG+C7KaTDf8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nVPnyN2IqJjphHJA/YQM1ahAOOrBy7v68lWgJeUPFw=;
 b=HMt4nqU/CJdxXxzjgBpaPtmBOgkAEdWm9YQSYbGuxeX3wxFs5Gnz3AzYwnI27AfixbtMehUzhB2VwlYU6QELQtZfMn3pJ/bAfNA7pj5pTYKWkzOfkOgq6+8Ppc0YWFkOUqHAzMLBG/m6bXkgV3J4giO2RuF8h5QmR02XBzIs6epMn8gb6PEIvcpvZZfS04s/rNFcfDWcgDF81X5S6cGJcBWe4UtiSn+PnSe3iAj9YT668+Ho8EWEOQUe4icKGM2frtYWOGMIeJbSjBHIY0l/XrlmRD8ZZjYA9REC24Z53EmsqCpdQkKC1wtDHWKJJdsy7/xCs7gjgmHmqF+z8P/tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nVPnyN2IqJjphHJA/YQM1ahAOOrBy7v68lWgJeUPFw=;
 b=dMWXFSB8Ng3DMoVQuDFmmhWEZS3k35vw6M4I9MkIxJ18jZUEVyviU15O19Sj40Smeworl3i5OmnjQsljIDLjPQ3zgkGkdr9O9uwLhBar4nRKQvPwH8Pw/3OLUklE035PhPhlWNLvk87MDsSV+KKUDvmRymV4i0Q+7Gwtr++BBpQ=
Received: from BN6PR17CA0045.namprd17.prod.outlook.com (2603:10b6:405:75::34)
 by PH0PR02MB7478.namprd02.prod.outlook.com (2603:10b6:510:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 18:31:46 +0000
Received: from BN1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::42) by BN6PR17CA0045.outlook.office365.com
 (2603:10b6:405:75::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 18:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT032.mail.protection.outlook.com (10.13.3.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 18:31:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 20 Jul 2021 11:31:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 20 Jul 2021 11:31:43 -0700
Received: from [172.19.2.32] (port=57332 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5uWt-000H05-L5; Tue, 20 Jul 2021 11:31:43 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] hw/registerfields: Use 64-bit bitfield for FIELD_DP64
Date: Tue, 20 Jul 2021 11:31:43 -0700
Message-ID: <1626805903-162860-3-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3abb731-a814-45f2-f1a8-08d94baca154
X-MS-TrafficTypeDiagnostic: PH0PR02MB7478:
X-Microsoft-Antispam-PRVS: <PH0PR02MB74786FBF716B2C7E3C951521D0E29@PH0PR02MB7478.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F3NiJ53Y20VxEcRjRnPNmM2pGQO0lOeohuLA7ULWUVmJi6OWL8G2J0XrbQmyLKg2kp1jA8WICn7TVm0SE9cj8HYdf1MZ00b80JhF1r4kof024u4Lc/odX+jKWSjx0rnqvSJw3VM7mbB3vqd4/o3MYPEZIr1hcUTnZbscCRDY4+zXK7NRvWi8fol7dYpkn1QorsKuuLRMXW+UFC7Pf/s4gI5lk/S5SUfp+PXOUoFkybrnnpa2inmWtRkJe9qZk052gObH29xcKtJZhIn5LWbCt86r5L033OCT9IvLTZq8VlooV4h6jbnLip9hpwZpBi6L0hwsAAZXAAIQZwgoyRrvovRqGJkRsbFvNOcRUg/9EAn+CwAfhI3ozJTUhMWiHvjIa1F9yrIkNTxF4AGoXlEaiK0hCoxq7X9vQGrveeKDfCHcS/UbvrxsLSr1ZQO7TNdSCkflFG/GxKxwM3KKDvoOt+b3RhUX46tIrPqQxAdhpWvhdzrS4346t9Im4rlyPT1edPZItHKmpwrAtNbypmXYA+iFnp3tJ+bQM0/X5bqWy60PEIY0PLKwM74do1L/QlMd8ckpi2UBp0/g0G7MMSxjOe4EWaZbK7lxC9UvLbLOUoEy2ZXbPlZZ+aALrAqGK8E9LacgMjWP1A7HGWjS4G3LqFWx5qu2l6KU4svFEoB6JqEmLwY1x1/ojyFoKLabJFSjQwD4iDu3ayT2yPeAiG/BFin+zpvZRg2bOBAJu1rgO2Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39840400004)(136003)(36840700001)(46966006)(4326008)(86362001)(83380400001)(36906005)(336012)(36756003)(186003)(2906002)(356005)(5660300002)(26005)(4744005)(47076005)(7636003)(8676002)(36860700001)(7696005)(478600001)(82310400003)(426003)(9786002)(2616005)(44832011)(8936002)(316002)(70586007)(70206006)(6916009)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 18:31:46.1423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3abb731-a814-45f2-f1a8-08d94baca154
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7478
Received-SPF: pass client-ip=40.107.94.86; envelope-from=komlodi@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: alistair23@gmail.com, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have a field that's wider than 32-bits, we need a data type wide enough to
be able to create the bitfield used to deposit the value.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/registerfields.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 9a03ac5..f2a3c9c 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -95,7 +95,7 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.7.4


