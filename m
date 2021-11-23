Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C645A0BE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:56:19 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTTG-0007IW-Jp
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpTRW-0005zq-4e
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:54:30 -0500
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com
 ([40.107.244.75]:22284 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpTRS-0003HL-WC
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:54:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzKrpvhLlIaucjmHdVsKojZPpZFIYQC6bWUebqE246dnmsFQ5qkwp7Fyx4qxuU/djhj++8ptS3ve+80MlV+bNKrw1Dnq33BULWEmoyn0xx1D+ad7W+RwnjCQ2wiTNbJIr8+6nyePo9tW0lm9zPrnwSvabFt6FIZZpgQ5Yn+A5TT2XSlZ1lqjzacMvXKcGh2PnbVKQfc6poUwJvYgEeIPAeMqrz2gmGK1HwTXdoc+psLIxCozqwcTK7lA+vMpAB7p21vysYaoz4BAG8/VKlfadGkISF8ebv+CLwtFTF+gVexGkEhu+LtSr4vq8HHZXIBzW6aZYlxAMgCkOC3bJbysmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3lJ9fp/4RPj2iV8PgshOgiqGdfGkclQ42I5NMLuR20=;
 b=JY/U8D1Qt0LwzFse6DrDjXjpjf9aZ4pKpERaLF9jCw2NenMP5O25U7TMXZlTNUFxahRq7bJQ22TH8akSqCc9p6oYfyN0I5WR6y0O/9A63+aWqJP6AXiyjRVfJz3zt0eNUXMzw6Do0jX8Y7Qg+9/xhxXXSA3VZy2pi6rsc/Awhi8R4RwD9/gUiFKQwaa24m3uzjA7YFF5ZyTJpliVT1GC8EQBmge0KJlK51/Iz4QIGXGiT4JJEnzuorUxBOCiQUgp+KXuxJqz6Vo2PbF0LLu1eha08FS4MbGDyEy5wUG3e/MyhR28Ul3H1nBc59vTQ2IJ9OWGsb7DZeOfS9L67FBdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3lJ9fp/4RPj2iV8PgshOgiqGdfGkclQ42I5NMLuR20=;
 b=XHoVJMgTy3bVXc+P7iE4N5L/MKrC+a+HyH1oyUAjaj1zWGc8N1m//hoAP56r1qKhClZLXccitbS+VzLrOGdTgF5xZznEWx0dh8tYNP46yDxoNlR6JNCNKnMrJv6/u8yjT6qhb3VY9WTRYkSyDfOMC7UN6AIQ04mylIbxmjSfJls=
Received: from BN9PR03CA0777.namprd03.prod.outlook.com (2603:10b6:408:13a::32)
 by DM5PR02MB2665.namprd02.prod.outlook.com (2603:10b6:3:107::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 10:34:31 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::6e) by BN9PR03CA0777.outlook.office365.com
 (2603:10b6:408:13a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:30 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:30 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8A-000GX6-6F; Tue, 23 Nov 2021 02:34:30 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 00/10] Xilinx Versal's PMC SLCR and OSPI support
Date: Tue, 23 Nov 2021 10:34:18 +0000
Message-ID: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 453adfe2-261a-4e63-ec54-08d9ae6cd5c8
X-MS-TrafficTypeDiagnostic: DM5PR02MB2665:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2665298F9A00733DB7042BA9AD609@DM5PR02MB2665.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hhg2BH4b/OYqAcMbfiwBXb7W7l5g1V1Y63MM7afrjJJ0qbQ1n27Oqiz2j6s0HBpOQxKZ7IZGFlpv1GmcWQ0gSxHJd+0aVuRZ6smA2CdBUPN0SbES/8xbybMkbPcKTRTPi9nIqWtxwKCERwTKfO8q3j0iFdC42xHlXl8+LN06N7he14l6KwDxQPP7PD8uLpTXQ/5G1KtVKlSLiD6Dio+PpCCjWCKZukzQSAL+m6ASFbdhxHQY37YKYwr3seoEWzUePUyFAX/fXoFwouOLvLP/0LKNHAOo4Br2Q6p6PNxTRsO2dnWvToF+KZXhq8AYKL5wAQNyZ3h48pz+UjZx/PvGrYk/57DJ2CVENHhq6nOSIDLoXoP6qqVSaA8XhYWukRLHoki+ZUVj0yl1KglKtUJhlEyM6KN428/NXQYsfRo8PpvutxIWEr/lqJtF6Of8Sj9ZKUNx5Uq0yIgthMZl6b13vvbAGcYcOecozLOkqCni1iYaJmyy8NXhuDnvWGRgqbpJ78ezFHNo7BlrN0ThDvrT06EliGcoUJIMOj5YYxuMyZuRGAPfclYjh/rOTpxd7QDhXdRZ4sRz2Tj+0RI9D54dqHkl6R50UBIXpaaZ/LsqR95Z4BgrDYVugKcoXFP/ZCxbYa4mfG8BGCnxcQMr1J5wiJFZnnTRDb+o5oLpDr6iG+c4Z0b7/BuJrMjmxAwJ0e+hep6IiePNlF2LPsjRmkZDXgOq/wWwu3FhAyE0dBxg93Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(70586007)(336012)(4326008)(356005)(70206006)(26005)(6666004)(82310400004)(36860700001)(186003)(83380400001)(1076003)(47076005)(426003)(44832011)(7636003)(2906002)(508600001)(6916009)(54906003)(8676002)(36906005)(5660300002)(2616005)(7696005)(8936002)(316002)(9786002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:31.4652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453adfe2-261a-4e63-ec54-08d9ae6cd5c8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2665
Received-SPF: pass client-ip=40.107.244.75; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

Changelog:
v1 -> v2
  * Correct the reset in the PMC SLCR model
  * Create a sub structure for the OSPI in the Versal structure (in patch:
    "hw/arm/xlnx-versal: Connect the OSPI flash memory controller model")
  * Change to use 'drive_get' instead of 'drive_get_next' (in patch:
    "hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI")
  * Add a maintainers patch and list myself as maintainer for the OSPI
    controller


Francisco Iglesias (10):
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
  MAINTAINERS: Add an entry for Xilinx Versal OSPI

 MAINTAINERS                                |    6 +
 hw/arm/xlnx-versal-virt.c                  |   23 +
 hw/arm/xlnx-versal.c                       |  105 ++
 hw/block/m25p80.c                          |    2 +
 hw/dma/dma-ctrl.c                          |   31 +
 hw/dma/meson.build                         |    1 +
 hw/dma/xlnx_csu_dma.c                      |   32 +
 hw/misc/meson.build                        |    5 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1445 +++++++++++++++++++++
 hw/ssi/meson.build                         |    1 +
 hw/ssi/xlnx-versal-ospi.c                  | 1892 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h               |   26 +
 include/hw/dma/dma-ctrl.h                  |   74 ++
 include/hw/dma/xlnx_csu_dma.h              |    7 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   51 +
 include/hw/ssi/xlnx-versal-ospi.h          |   86 ++
 16 files changed, 3786 insertions(+), 1 deletion(-)
 create mode 100644 hw/dma/dma-ctrl.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


