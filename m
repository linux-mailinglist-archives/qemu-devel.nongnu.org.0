Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9248ED33
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:36:50 +0100 (CET)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OdF-0004LU-4O
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVz-00038O-7y
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:19 -0500
Received: from mail-dm6nam12on2083.outbound.protection.outlook.com
 ([40.107.243.83]:48385 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVx-0007Ys-HL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrhiETc4B/aTSAWvTOKVK/1Ldw7RnWWPuEEn8k5OLo5XalfpZGlVM/55brPS7BC7pSpQ3V4+a2pLYRbyc7qRgy3ebGS60Jw+o4F2kJ90XrTNDXM3JJqRZKSJembq9NA7AUpD/8bMh87TMp5qU3BO6me7ns3ESbv/z9T+qPvlOGASdlaDkxaNe2LNk+3sYKjdTenxvSsnsJC7SNsGNKnM0vErZ5q3nVDYpA2YD0W3O6rlDfCJMGMs8Rvs86ujHpDljP53+oaknagp5llDAzZHYkJpdxVyKxhKR3krXxlebNIKOGrn/Q7WQ0KamjXHBNsTSPBS541qz6cgT/6iwOPN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nPalRkdAxIFKzvPjqldlLngU9ltdGQrlKsjBiIr9dw=;
 b=An3djUANERQzzHP7tm3CzwwziKsmVCvHomb26b+i5nsUE9Rh9Fvz8I0eQlaGI2DrcpT22G4kW0RqGCGQxo0uT/Bb5e07OfXffaKLBj0HN/Q4UTn/XNqxWSDfAOXOIm7V3bTKtyaLIkJQiSAZHAFc4kS+4xZ+8TdYV+gG1byoExPScb+h9hKBgOo88Ci0MIcmbOU3reZiG087jeM02Lk4/Lm/7bLbArRs42/Ogw4pFrp0XMpzinHwxyTkgUYQySlgY/hqdR+mGNttgLOzQzXYWkMcqebRgLAe6+CcJ3yLVo38MQhyJCIMNQBbTdl8l4DxhCkYJj3Sffvl2yL51XJicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nPalRkdAxIFKzvPjqldlLngU9ltdGQrlKsjBiIr9dw=;
 b=Rtb9N9ujKtG9e+4KO9mfmMZww0qYLHelifQzX9BCN/RbcSQQ4xG9kv9f6KQeosaclt7CSzpUvWbYz77sgSiI6xWwCTBgNwbFKtCJLuvFkqikc+ePNDBE41QtpwG95SXiUtgFFxjNG++0Zpcg6npFtJs7XgPRqsyF+wjyr8vPdJ4=
Received: from BN6PR1101CA0014.namprd11.prod.outlook.com
 (2603:10b6:405:4a::24) by BL0PR02MB3633.namprd02.prod.outlook.com
 (2603:10b6:207:47::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:29:14 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::d5) by BN6PR1101CA0014.outlook.office365.com
 (2603:10b6:405:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 15:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:29:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:29:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:29:05 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVl-0004L4-Ea; Fri, 14 Jan 2022 07:29:05 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 11/12] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Fri, 14 Jan 2022 15:28:40 +0000
Message-ID: <20220114152841.1740-12-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50854462-c2e2-40c4-9d9e-08d9d7729f32
X-MS-TrafficTypeDiagnostic: BL0PR02MB3633:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB363333228B7CC54BA6BE5502AD549@BL0PR02MB3633.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vcul2avyj88k4MKjHMj/y7RPa+W0P+e4tKbmhghmol1tju9LdKIMN7+GH8hnNvkxM36D7yJ6t0/bemq7MYZUj++PMCwhaQKdrBXuiKcSyolqZJWJQpdoi34CMfc5U3jXn8cyLbjbWZ77bJWk2Cz6/AlUARo3xZ288IJUj8Pfqcan9z2xw1xCpdbrOASa+OzUFiM4HepepMEejVrEvm8kdxzPdSR3N3vxuW/Mxg4QqreJQ6xZAEQt/xOB0JHtX0XBZGdDj3kB3aZZ3ndgGtX1fPaCCf03BdqIbb3ehvKtCc9wkYG+kZ+F0pvp9Cc3QP2qJjesqm9ikWqCrc4hS+3LJmj6QuicXqtZcM/dAMqEWbbpDsefpTLs1akOLQDhFAq6ybwWAS4Hgt7bgpl6ooXhnyhFRjTOAsum008RAk2ijHhUWddC0YOJ6I2iQSkdDhGqOVqB7Pz6qLS1XYjVi6MBqL2n5id1b+1j4PhBIsJhFrp+RATP668m94L+1F4A7UZQcr6mtPDF9Pg1qXWpSN2NK+yEdWvrUP1LEGlsuvXIydCxGC/hVypQ/9PJxcf4YWcYOs/elqA55uLMc13s6RpL8S3e8UKptvT633HI8X9HbV3sLLofF4vpGQQWr0MI/cYH0VH2c6jQUUOYdu+fA9CjS3tyHoynZGadhWfwJaiHY74po40gS/dSW701v65AyLaKE4kdNbUfOoZpsMwDvU3Uzf2XQPjdwhqToqFSo2i3ljo=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(47076005)(44832011)(316002)(4744005)(54906003)(508600001)(36756003)(426003)(36860700001)(82310400004)(1076003)(6666004)(2616005)(7636003)(70206006)(356005)(8936002)(9786002)(70586007)(8676002)(7696005)(4326008)(6916009)(186003)(26005)(336012)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:29:14.5367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50854462-c2e2-40c4-9d9e-08d9d7729f32
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3633
Received-SPF: pass client-ip=40.107.243.83; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

List myself as maintainer for the Xilinx Versal OSPI controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ccdec7f02..0e31569d65 100644
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


