Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A03211DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:18:55 +0100 (CET)
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Qg-0006Of-4L
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O4-0004X3-JA; Mon, 22 Feb 2021 03:16:12 -0500
Received: from mail-eopbgr760070.outbound.protection.outlook.com
 ([40.107.76.70]:59620 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6Nz-0001gz-E0; Mon, 22 Feb 2021 03:16:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbJvvamhEqjodGrkx9CFbNITSyb1Km0z12CmU+aVSOEY284Foh9g0TFYHeC1a95P08Ge5I6kWU6nxf3TUSQ+Tf8E/kUQEbMiGgBJYEOORmHDHDQsn5tNcSsIWp7HRiWoaLi4qronUAXQO3QGvA25zZjICZ8FpEp3u7fn2CNsw3bOYXRuV6KVxDx8AtKo8lZZB++ZoCnAaOxC0DHpLq1snqphjJaod0S5N556aoTeuQdrK5ul2k26UFXzDyhy2Nz7mmvkot2rsdnfwPdojVX7R1mnFCSvwl7i8iPfVjWTKfe3xF200I2YwILHr/LZXxVMaQf/D91oA+zSjzrXwqtCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HoxMV3EXDMRatJ8pxWAAMP5JF3mrZ1R+Gg/nxcLRMU=;
 b=XsLoSwokWEqMZwqSi6luq/IGEHBwDNBSlKa9iYgi/g0yrRMlfz0sx5bGXX60ozYKIspHlyd3xO9os0fYODlaK4IXXBUn0TGcEGvctdlh6znD6pdPWHGCzPQRWv+msIi/gS4aiS5NYRPwHIBaRArlfRSIgHaUKhIEu0pEJ+/EIScd8wlLplmSIKQE9YGp5jprrPzcFzO2gjksB40jpDSmyf7sa4YeYRh6ZfhDlEHc0nnR03N7/3oN85rsNvOfUAfP9CMzyL4ijWE8jIKkptpsORYjK2myahrjBiHbeyFv9wtXZLfiYl2RF9jo5yN/lQ1mXYPuiykda5dCgctPgD50eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HoxMV3EXDMRatJ8pxWAAMP5JF3mrZ1R+Gg/nxcLRMU=;
 b=a4PjWfoYMQpJmhdzJoZVOKhu6DHXdION4/bSMaagHIaWC7F/gH8yrufvPptJhSzpRwar5QGZB3eR6nv/XAmsQYcnrigiLO/NmmbMqOOH390ODKbuYj2yFwACeapcC+FyFA8ECIJ1GcJtHJh1KkCWMXzXnbK7G+ObnDddnjR8xzw=
Received: from SN7PR04CA0264.namprd04.prod.outlook.com (2603:10b6:806:f3::29)
 by SN6PR02MB5085.namprd02.prod.outlook.com (2603:10b6:805:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:02 +0000
Received: from SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::b4) by SN7PR04CA0264.outlook.office365.com
 (2603:10b6:806:f3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT043.mail.protection.outlook.com (10.152.72.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:01 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:15:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:15:59 -0800
Received: from [10.140.6.35] (port=59024 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nq-0004Lo-Ns; Mon, 22 Feb 2021 00:15:58 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A572913C064C; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v2 00/22] eMMC support
Date: Mon, 22 Feb 2021 13:50:17 +0530
Message-ID: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 719bd48a-e8ff-48bb-6d84-08d8d70a179c
X-MS-TrafficTypeDiagnostic: SN6PR02MB5085:
X-Microsoft-Antispam-PRVS: <SN6PR02MB508525B0FA132D637C80805FCA819@SN6PR02MB5085.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uq2TPf1T06rfG8cu1r1DndBiBr9S1mZAiIz+eMMeDYwDRJ9/24zsU2OlG1M/klCHtq3TfsTWrwhH9dN+4/vehnZOY6xVfcTWQ3CcQ2tdTuyzDgUJsrL8Kz5COlK71wgDJBKJbWVIW4DWxbHghWKPwiQhhZnPQd9gi++JjSDDQReVfEGfEeR3GENMW7poPJPj+jm0zTfkS9v/qc/pwA0sRs5UpNxtlwl9FsrEcBF+S7ZzuPfKOgUrsEVWimdgsspdf8pCjDKql8xF5Li28MpuuZOsG89FdVqss4x2iqOBkAk5aClC0ow3ABB/eAR01aywj7/3IcOrAHLfLaGjl4pH153ELj4Gz4xSsGid8qUAwmuVzP2w05aRTq11XkSxwHNyiSuJq/P9lQTvXwmPaKtsKM6kIlukUht18+7Q0WKelR7DhVOQzdpAzjRdFLp9rpltNxXEN/Khrx/lojBv0bM00+LkL/bkd0dEqqkuN7ga2CEmnaIvkfbx1VHtq06+sbppp7CsGiae+QeeIk3bGo0FG1GcPt8UpGqKYnmC2pVPIDWO+5+nqaIJrsCArc506qemmyziS/SwuG3pAJttuOwUzSXGoXlzH+bZMnk12Ik//HTW7kuPhV58IGu8ac49aTL/FBAmlra6lunSte7HWRwWHx0PcrZrULigtrFqpCjLdyNQ3Ez3MQm16hyOewIr31+sZ0qGQUbHztvR9ctdWrpg1g==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(46966006)(36840700001)(478600001)(83380400001)(82740400003)(8936002)(356005)(47076005)(921005)(5660300002)(8676002)(36756003)(66574015)(70586007)(7636003)(70206006)(26005)(82310400003)(7416002)(426003)(186003)(336012)(36906005)(4326008)(6666004)(42186006)(2616005)(36860700001)(316002)(110136005)(54906003)(107886003)(2906002)(6266002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:01.7897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719bd48a-e8ff-48bb-6d84-08d8d70a179c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5085
Received-SPF: pass client-ip=40.107.76.70; envelope-from=saipava@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This patch series add support for eMMC cards. This work was previosly
submitted by Vincent, rebased few changes on top.

Cedric & Joel has helped to added boot partition access support. I
expect them to make a follow-up series to use it with aspeed machines.

Present series adds eMMC support to Versal SOC.

Initial patch series version is RFC
Changes for V2:
	Split Patch 1
	Add comments for eMMC Erase commands
	Added documentation about eMMC and Versal-virt board.
	Make eMMC optional for xlnx-versal-virt machines

Regards,
Sai Pavan

Cédric Le Goater (2):
  sd: sdmmc-internal: Add command string for SEND_OP_CMD
  sd: emmc: Add Extended CSD register definitions

Joel Stanley (2):
  sd: emmc: Support boot area in emmc image
  sd: emmc: Subtract bootarea size from blk

Sai Pavan Boddu (13):
  sd: sd: Remove usage of tabs in the file
  sd: emmc: Dont not update CARD_CAPACITY for eMMC cards
  sd: emmc: Update CMD1 definition for eMMC
  sd: emmc: support idle state in CMD2
  sd: emmc: Add mmc switch function support
  sd: emmc: add CMD21 tuning sequence
  sd: emmc: Make ACMD41 illegal for mmc
  sd: emmc: Add support for emmc erase
  sd: emmc: Update CID structure for eMMC
  sd: sdhci: Support eMMC devices
  arm: xlnx-versal: Add emmc to versal
  docs: devel: emmc: Add a doc for emmc card emulation
  docs: arm: xlnx-versal-virt: Add eMMC support documentation

Vincent Palatin (5):
  block: add eMMC block device type
  sd: emmc: Add support for eMMC cards
  sd: emmc: update OCR fields for eMMC
  sd: emmc: Add support for EXT_CSD & CSD for eMMC
  sd: emmc: Update CMD8 to send EXT_CSD register

 docs/devel/emmc.txt                  |  16 +
 docs/system/arm/xlnx-versal-virt.rst |  10 +
 hw/sd/sdmmc-internal.h               |  97 +++++++
 include/hw/arm/xlnx-versal.h         |   1 +
 include/sysemu/blockdev.h            |   1 +
 blockdev.c                           |   1 +
 hw/arm/xlnx-versal-virt.c            |  30 +-
 hw/arm/xlnx-versal.c                 |  13 +-
 hw/sd/sd.c                           | 545 ++++++++++++++++++++++++++---------
 hw/sd/sdhci.c                        |   4 -
 hw/sd/sdmmc-internal.c               |   2 +-
 11 files changed, 571 insertions(+), 149 deletions(-)
 create mode 100644 docs/devel/emmc.txt

-- 
2.7.4


