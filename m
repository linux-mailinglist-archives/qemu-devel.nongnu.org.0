Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E676A45B895
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:44:12 +0100 (CET)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppl6-0000dr-3m
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJs-0000fL-L8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:04 -0500
Received: from mail-dm6nam11on2076.outbound.protection.outlook.com
 ([40.107.223.76]:25888 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJo-0002UP-Oe
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzgKQqNb9dQbHzYckWQms2fJEdt6hIE7Vvxwk/zweWTkLElBiB9FTNFjuau3BD0iN+w+GBYt2chp3tcisu23VgB2APR/aYP65iZ3GCrG4LM+Crdo8syV1mwmzOxJELEYxtr8V4Wz7s55cR3MwMqM226MLyww5dfq7lu8sAVzNMbg8WQMAmOQQ0+p94UAlZO2Ac4wC13ghQwpq92xk2ISQSd4b1n9WE32ftmPjTO1Drvp2GhJIja5cHIRytV5F5zGbs+ImsCmXuYzf3o44H0yT6oLYT3NtcQcz5MhVzSyPslBVAe2PnVMWKcwDauyHQ3gx35g/yF0O9Nf1+4rE+8u/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3Y7rgI4zL/dreW3Fty+IvJrFPelpII8jZ36hFE9vgw=;
 b=g0xw1/E+MJywmBkn5jiE4gq7ldUHblCgXBFR9e3p12281/r0wvOG9iNbB+eWnPDG4jfI9s/oCty/6Qny8mr6aIMtkCfommQdIBqU+gfQ8K9HgzBfclyMrPB9IxcVVocI52M60gCadnBJnB80ZSpbgJJ7FuGd3Y39JpnHnQxtSfZfPRdfxVzADL+WkliWh9orDZ1I7mrI9b17G4BRhwEAQ78Z3Xf5cGQbw0mbZfqEK+O61L6ycmTbaNDjbAP36SMdg/DuKBjtbsP2U6K6bWzBS0FD47j2r299AY0M7hXMVxOwFeSj+XaNdLwgeQnDCMzLBztyhezvnFBfd4+Rj7dlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3Y7rgI4zL/dreW3Fty+IvJrFPelpII8jZ36hFE9vgw=;
 b=n2gelbifx2ZNLH7ZJBdKHmQLTgl2YTadR4EZRlNYFec88IcGA9k+lmHQxfa6TQHTFX13CFvUm4ks453+Sca06eIqJ/Lslj8E/apkd0ehQP5vFrSF8nIUapb+7Tf9Olqac5XyUHKIK8n62rXuUQc9bYC9q+0/sCClWE1RUyX4rxY=
Received: from DM6PR02CA0063.namprd02.prod.outlook.com (2603:10b6:5:177::40)
 by MWHPR02MB2638.namprd02.prod.outlook.com (2603:10b6:300:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 10:15:58 +0000
Received: from DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::ef) by DM6PR02CA0063.outlook.office365.com
 (2603:10b6:5:177::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 10:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT049.mail.protection.outlook.com (10.13.5.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:15:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:15:58 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:15:58 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJl-00036z-To; Wed, 24 Nov 2021 02:15:58 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 00/10] Xilinx Versal's PMC SLCR and OSPI support
Date: Wed, 24 Nov 2021 10:15:45 +0000
Message-ID: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7984f5d6-2447-4ff6-192b-08d9af3368c8
X-MS-TrafficTypeDiagnostic: MWHPR02MB2638:
X-Microsoft-Antispam-PRVS: <MWHPR02MB263866C604C0950E89352417AD619@MWHPR02MB2638.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwuIx70vMMYU3hoIA/2BCqLFtUxRJnPblEMuy5r3eZFQCgKT3vNWaBsthM+jpTw+VVhL44Tsv0THqyTjHxDR0yk9KyqWChCh1pSt1chjmuwzxCHMj276YTfBY64vtbjeuLXT/yRn8hPf2/xIZEkBSwEr31A+8R3DkcHhndyVXADFZ2iBZiSuEHNie0Z18ZjD4vp+O6cBs61JTePf9zA4v9wtoKFY+avEGgmqW6G3m1AesjSZw4YcezmLdl3Lh1YqAMCb0KQzREXmBg28MoJdNiej5DvwFGS29dvsqsHJZP+2T12w2oHpKl9S1OTs4eTS+ChQg1/1vigguqc9paWkejUIv02Uauv9u0bpFqEWjMhwQfcjC7fFJGpf4iTO71G+RbGzxO8Mf/hIBkS1o6pHZBZI1NVYOF50J57wnfJ51HQ+UR1RkDlNL/Y1YRXlwClikFEH1TF1dpxmQp5TszN6hImHxR3uAD4r5UKX/om5CyAqYbL1aL0oo4ILcn4obw4twUpAlUKyfYBlxdxJ06j/oY2QWlQZiqzvA4Vw9ngYAOPZGCp5/PmVfmGnMUs9MrlsOSJBZGGmWcYSUgU//VTwzX+3SPI/GZAQTOzhm6mubZCINh5RrF86I5Kg1nTqNs4MU3So53U55+wu4ffXUJ6/G3XjYNOW8W4DJxyLp0MeNqn0qI6U41RCrcM3uGF1i+5zPganXy6iCRdsQ7Yoi6UhcfOhctTUMP+FsOWdgbTDAdQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(336012)(426003)(186003)(36756003)(316002)(6666004)(1076003)(70586007)(508600001)(7696005)(6916009)(2616005)(82310400004)(47076005)(70206006)(2906002)(7636003)(5660300002)(356005)(8676002)(4326008)(26005)(36860700001)(8936002)(44832011)(9786002)(54906003)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:15:58.4853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7984f5d6-2447-4ff6-192b-08d9af3368c8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2638
Received-SPF: pass client-ip=40.107.223.76; envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
v2 -> v3
  * Correct and also include hw/sysbus.h and hw/register.h into
    xlnx_csu_dma.h (patch: "include/hw/dma/xlnx_csu_dma: Add in missing
    includes in the header")

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
  include/hw/dma/xlnx_csu_dma: Add in missing includes in the header
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
 include/hw/dma/xlnx_csu_dma.h              |    9 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   51 +
 include/hw/ssi/xlnx-versal-ospi.h          |   86 ++
 16 files changed, 3788 insertions(+), 1 deletion(-)
 create mode 100644 hw/dma/dma-ctrl.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


