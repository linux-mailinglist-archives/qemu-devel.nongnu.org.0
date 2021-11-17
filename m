Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E7454908
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:41:03 +0100 (CET)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnM7Q-0006Dg-Of
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnM5o-0005Tw-QS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:39:20 -0500
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com
 ([40.107.237.82]:14017 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnM5X-0007oa-9Y
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:39:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdlBoMJrwIfM8GiHJLRmQC6X2Gk1VHRwtjz0kQz4x0YviFHjA15EyNYrw2lQYNu/CuUgvqKLWdBeZKWWZIJ+Ez7/Xa/ra2UmJ3v/BzdHnWPfcZT6WB90QUycuS4xJz76NnOozxk5eDUFApXIp0YVNXEj2+c/zDYv8JbT0Phq3AAr5LG6qFDhYm/+OhHFKRbPqcARxOxEuI1Jb06hnWU7vsh0xsZY/TwJdscQ71G692/8OfHpNA0al0GwOKTkjpYF/KlrG6QYDLpyJ7/UOqOv5sD0mJL9qpmED8VqwUqNlBnDdpllpDA1GzE6AH47RQjRKzE48oBW5sGyS4NetEXZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HRsCz1junnoCsgQbT4pBrH3CAvazHGohgjdZVqFqKQ=;
 b=fWI3M4EBcyxpxMXF3xeU0nY38cQHbEKNLjeGlfKySjiAg8yflpZgbLR3qfUGCNGRro9wDcXooPbp/MsNUK2x/g1I/K+TbNtuu/Wez9eVktxTmjLOZImjnDx2o3jwOKEg88o3YTgXsnZLOh01tF9/3NI9MYpC0L1UOsXhVZ6FceX5BfzAsKBfrVOXdVX0GY09VIDheJiVid38VIIMQl/yckYrSi9tbJuqrLSl8Hi05ugO+uL2RmWqvZtS1KQmFI6Ok7Cb96ZRp9iRomMgTApvIU9lYKuaauQwETnk+V/9+/JdkVut8h2F9uUgD5ZuYS8JvMmQLtabbG21NxT/qCkoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HRsCz1junnoCsgQbT4pBrH3CAvazHGohgjdZVqFqKQ=;
 b=jW//jJYyRmr5//+M+0d3MandrLL/N2kU5rsM4AqmMOomJa0kMt7xUME4PuRlqX1QfxELWisfsTNoFjdOj8GWzBGpqGaYyU+jogZrquwv8Z9L5yjJlnTt/a3wIXRp/jJ260SrJ9y7jMNP6xlxPheP/FC48l9KqFtSd8Y4B+7EnI0=
Received: from BN1PR14CA0028.namprd14.prod.outlook.com (2603:10b6:408:e3::33)
 by BN6PR02MB2276.namprd02.prod.outlook.com (2603:10b6:404:2c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Wed, 17 Nov
 2021 14:18:44 +0000
Received: from BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::cd) by BN1PR14CA0028.outlook.office365.com
 (2603:10b6:408:e3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 14:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT030.mail.protection.outlook.com (10.13.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:18:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:43 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:43 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLlr-000Dy8-IE; Wed, 17 Nov 2021 06:18:43 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/9] Xilinx Versal's PMC SLCR and OSPI support
Date: Wed, 17 Nov 2021 14:18:32 +0000
Message-ID: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a60251cf-9fe2-4dc5-ad36-08d9a9d529fb
X-MS-TrafficTypeDiagnostic: BN6PR02MB2276:
X-Microsoft-Antispam-PRVS: <BN6PR02MB22762F04C0CF1BB6A4D5A2C8AD9A9@BN6PR02MB2276.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP1mJD/cynRhovq/aukCKy0bB1ENytvgekFRU03NLrCtQYP734kLEDMCCvAnfuRs3ft7Zva5RrvifQxidoCSbQTB+glrwnnjUhONJIVjT1PQg55SKT2SmOpubDcYWq/mla5NwFDevSOZ0GGyFC09TW3h4Pu71NkB1btaGuiyJpTnk9CPdhP2AekH/A+2E5J9LdldD9UV5WXFJkh7DpZVnp0SID946kUcVhk5aYdk7YPaSC2ws2HKPheyjOAHnkueldmtTnMsP+SES4yr0SYlMog4uFQsTaKZfhh705MGKZC991s2tGpHxvpoKy1JZRh9ySN0fSrnAM95E1e8wa9Dgnb8gWzAoXylnXh/jCIcv05cxsCOcpdMwGNv+ybLtN7PDnCKT3lKJkukDxADlgDXnMnNYQbbOyGYD10eCZZoq5RvkP2sdv40xz2bNr1D8KOQ1B7EVhAUCEcv9TA8GDNWme5HqH2qKzBT9MHkjQxrGwE3CpktHOyOwOuXd3Hrj7S2nxuMoMY+KhBbyQ/qO7Q+HdBzyTQhU7L1PXFqI32Gn7u/GPrhJkA2yPCBxttldxak4+QLSPyKUeUhM6vlAUvSxdDA61PbpkCU3vdClKC0fwtvW1Bf4g+RkZv/ngsLLdnPQwUl58UkJsmd4H7x3htFslVgP5fTgNdqcoqnrEH6XAb6DWX7WQunMzF3y1bSNvFC/VC1FYYLR2nZoV0bmGY3TuqUS4SbEwUkmFs90v0CCR8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(1076003)(2906002)(356005)(2616005)(336012)(36756003)(5660300002)(7636003)(44832011)(426003)(6666004)(83380400001)(9786002)(70586007)(8936002)(4326008)(70206006)(6916009)(508600001)(7696005)(36860700001)(8676002)(316002)(54906003)(82310400003)(186003)(26005)(36906005)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:18:44.5644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60251cf-9fe2-4dc5-ad36-08d9a9d529fb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2276
Received-SPF: pass client-ip=40.107.237.82; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series attempts to add support for Xilinx Versal's PMC SLCR
(system-level control registers) and OSPI flash memory controller to
Xilinx Versal virt machine.

The series start with adding a model of Versal's PMC SLCR and connecting
the model to the Versal virt machine. The series then adds a couple of
headers into the xlnx_csu_dma.h needed for building and reusing it later
with the OSPI. The series thereafter introduces a DMA control interface
and implements the interface in the xlnx_csu_dma for being able to reuse
and control the DMA with the OSPI controller. Thereafter a model of
Versal's OSPI controller is added and connected to the Versal virt
machine. The series then ends with adding initial support for the Micron
Xccelera mt35xu01g flash and flashes of this type are connected to the
OSPI in the Versal virt machine.

Best regards,
Francisco Iglesias

Francisco Iglesias (9):
  hw/misc: Add a model of Versal's PMC SLCR
  hw/arm/xlnx-versal: Connect Versal's PMC SLCR
  include/hw/dma/xlnx_csu_dma: Include ptimer.h and stream.h in the
    header
  hw/dma: Add the DMA control interface
  hw/dma/xlnx_csu_dma: Implement the DMA control interface
  hw/ssi: Add a model of Xilinx Versal's OSPI flash memory controller
  hw/arm/xlnx-versal: Connect the OSPI flash memory controller model
  hw/block/m25p80: Add support for Micron Xccela flash mt35xu01g
  hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI

 hw/arm/xlnx-versal-virt.c                  |   23 +
 hw/arm/xlnx-versal.c                       |  107 ++
 hw/block/m25p80.c                          |    2 +
 hw/dma/dma-ctrl.c                          |   31 +
 hw/dma/meson.build                         |    1 +
 hw/dma/xlnx_csu_dma.c                      |   32 +
 hw/misc/meson.build                        |    5 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1437 +++++++++++++++++++++
 hw/ssi/meson.build                         |    1 +
 hw/ssi/xlnx-versal-ospi.c                  | 1892 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h               |   24 +
 include/hw/dma/dma-ctrl.h                  |   74 ++
 include/hw/dma/xlnx_csu_dma.h              |    7 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   51 +
 include/hw/ssi/xlnx-versal-ospi.h          |   86 ++
 15 files changed, 3772 insertions(+), 1 deletion(-)
 create mode 100644 hw/dma/dma-ctrl.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


