Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01258318628
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:16:18 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA797-0004TV-VM
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75o-0002as-5g; Thu, 11 Feb 2021 03:12:52 -0500
Received: from mail-co1nam11on2078.outbound.protection.outlook.com
 ([40.107.220.78]:32256 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75j-0004TI-VL; Thu, 11 Feb 2021 03:12:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh/cQ/0JqCE8RLt4mgx2nAc4j7KkrAYZqjskH9mYV6v5uoO0QrsOIHmyrNHX/0AIZFLDCF7RzdEuTVm+PqRGtjZZE/2sdCXr92abr5LsXoF9w61Bbf00NzP5CWabbrVRYBzVW+/bDr3+6z3ATqmGbZ388glR/0GVb5lXvfgSThkg8kNZUQC5MhrHP5G1hm0MVUvpr8lZLoXCIcHf2cyHFxthRf/ZDmYu4YeQkMCvzL0bDxhaBPRNjdI0vG9WJBRwlnRYXzTC8JKdZGcmStB3UIuarMt+u511tYaurfVjbue3eN4mpbHpuXj+Qvft3UKLJSV3BOZxaWb321SxC6g3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EqVFKj9GfX1w2Dfwq1ViocJ2PCIR4gYnqtcyZn0Pv0=;
 b=UIM0nLaR3lHCoHYMp5E2M0lGLeHk1hulwP1gn65P2ovpmf6p8usKaW2+gJ6bUrzkIa91lTqLnuakWBforjNZr2U9+465FGMGTsGV6hM+1kpySb615l/DJk1FtNWwqbUqn53tj/UfFu6ZKQsz6yU/2KT80CRakqgl3hv1ERHR7A/kMca1QqWXPrTiKQoOSRehsjWfjJAV6aNwENYiC1NuH47Opj9Zifaubv26tUPcRLD0N1hVjuHsaIm0jTzpdyQKr4mADiX4ipgo5gAFwjwsmwZUr7kR27T38jsyEs4SLV+ocp+cT2bEa4u4zo4vuqhR1HZ//T1BvwY25ZNJ8fBeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EqVFKj9GfX1w2Dfwq1ViocJ2PCIR4gYnqtcyZn0Pv0=;
 b=aOqYMM44I0c6862D1fqgFf2OxEujOQWdyx8IvDz/ylJeyJ+v6vOL3kF5XxVTwsMejDkb7G07j3q4Z6mkBrnXPmjK6dUAWZtGSyqZI+cEO6lmrnusrVqB2vcH1w1at0pIgiciue3ByQOv/ClP/EiwDP0nzFFxDWyZ5moTTpKm6Js=
Received: from BLAPR03CA0174.namprd03.prod.outlook.com (2603:10b6:208:32c::29)
 by MN2PR02MB6941.namprd02.prod.outlook.com (2603:10b6:208:20a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 08:12:37 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:32c:cafe::f5) by BLAPR03CA0174.outlook.office365.com
 (2603:10b6:208:32c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:37 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:36 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:36 -0800
Received: from [10.140.6.35] (port=49666 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75Y-0000Pr-BG; Thu, 11 Feb 2021 00:12:36 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id DBBB713C063C; Thu, 11 Feb 2021 13:47:58 +0530 (IST)
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
Subject: [RFC PATCH 00/15] eMMC support
Date: Thu, 11 Feb 2021 13:47:11 +0530
Message-ID: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670e3675-631d-4707-d3a5-08d8ce64cb37
X-MS-TrafficTypeDiagnostic: MN2PR02MB6941:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6941AC7CBDDE503458507DDCCA8C9@MN2PR02MB6941.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbp3FXc0YLMBk1SP3oio/fkDeX7nzYOYF1nvAvhvQiw2EQH9KaQku+ZDor4JTOHpiirK8D6jIKt497odZoL7urxjj72z12Kus+WOEBqhkq3OBSq4jTVQbXoMbErQYl2/ka20HPfQSqh1A4bIVj6X1fsr90nBioONTda6NfbdpZ0J8twSpeCb01tlJ0J871tjkzcJP+fVx5aG8lgj5X1PjoBqjjf+nV8bkOnvygoV7prE3qU1DzXo5GswaP5Ypp45UA7+vQkqilZt4sVmzvavHNYj6bjviINw5TILv2UMPm92QdN7alh8nTt7mvZ1Oizv5IEdbWqj7FDrgHunmObDY5XAu2Opoc0vx3N03RC7giezvsqB2OwPhj8MOaLaeYZG5ZJKZqMH5yqMZfobYYaqcN6YGrms8uf94rC/XfbWM+lba1jRzKY2ttw33ndpg1V/RDJrrFdUR9FPBWWyMEsGePzXhzlMrctgUYVO6q/AYqrkmKNsGz3e/ajshySSONXehOgNjt4u4zRmDbp2jZuQrKoKc2KLEm+mgaqsLEI8zHyAa0hBatWhtdA1aEEMcqX/PYguLbqIKenUKkqvI4Df8eUrCrBZMkNoFrPk7jFcjQAvpB2hOx3fzBAGlKKiLNhELTVTUPtzGDArFblZqbjTx/oBYpGVKCUYfaKJoIIEcLz9iDbHNPh3LeWSpD/fxp36RWiTwTXufnL3b+w/s4dYzA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(2906002)(36756003)(70586007)(8936002)(6266002)(82310400003)(54906003)(110136005)(42186006)(70206006)(921005)(36860700001)(36906005)(8676002)(316002)(4326008)(107886003)(47076005)(7416002)(5660300002)(83380400001)(2616005)(66574015)(7636003)(82740400003)(26005)(478600001)(356005)(6666004)(336012)(426003)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:37.2992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670e3675-631d-4707-d3a5-08d8ce64cb37
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6941
Received-SPF: pass client-ip=40.107.220.78; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) AC_FROM_MANY_DOTS=2.997, BAYES_00=-1.9,
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

Regards,
Sai Pavan

Cédric Le Goater (1):
  sd: emmc: Add Extended CSD register definitions

Joel Stanley (2):
  sd: emmc: Support boot area in emmc image
  sd: emmc: Subtract bootarea size from blk

Sai Pavan Boddu (10):
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

Vincent Palatin (2):
  block: add eMMC block device type
  sd: add eMMC support

 blockdev.c                |   1 +
 hw/arm/xlnx-versal-virt.c |  16 +-
 hw/arm/xlnx-versal.c      |  14 +-
 hw/sd/sd.c                | 369 ++++++++++++++++++++++++++++++++++++++++------
 hw/sd/sdhci.c             |   4 -
 hw/sd/sdmmc-internal.c    |   2 +-
 hw/sd/sdmmc-internal.h    |  97 ++++++++++++
 include/sysemu/blockdev.h |   1 +
 8 files changed, 445 insertions(+), 59 deletions(-)

-- 
2.7.4


