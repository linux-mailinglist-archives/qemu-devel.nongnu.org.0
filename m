Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B8327432
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:40:31 +0100 (CET)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRva-0005fh-74
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-000079-Lo; Sun, 28 Feb 2021 14:29:39 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com
 ([40.107.93.58]:30176 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003Ao-Rm; Sun, 28 Feb 2021 14:29:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8ba82dgBpT4Qr5RX+XmU/lyOOpm3ymdw9gL1bn0RShTwwRI++FeIQvO27a4tmuZPrCpWMDHAekfrH2qhe7XURBKj0UXQttSz4eZmSte6AK/BdBS294JcVBQkmOearMc0/LMR1cVzBq7H5WXpDUpIkbmrgEqoTQnHSSK283p81HXrzVOJAVDcVKf/M9F1lptXQr6PbQKYlOotFzWERZkzY8OhDXDcXXfUx7vA6ogISheCEyW335i0N122CdZWpOivyBqDeT89qZPb5w5brd/H6xl4gUia7Zk3XQdnRV6rifQ5Xl66/IqzMnHfPgGOA7fygEcoworOe/SfYy+rUaGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SbKrRJNNepmkxuJ2LviKpNghhUGdFxXERSxoBlR5bk=;
 b=YC6jWAnZQBZ9v7lh8OgZbfE3nMtfwDh31YEMAPDc7PMVrCJfi/5BvnoEl4gHe3qpPCAoT27FttpKbYjqyZyDawcCh8oTDy51el5Nw4BX3e9Au9zYGi2Xj+dXg0FA5WlmR1D9D+sqzv9fBpLgWZQiVu5+daqpwMt5aAEk8iejZzyVjN5WIivBcS167P7fwUWoXBgS9dgVjmx6xZfbs+d//TAL9f2B3ydYJTvksiYpiBX+lE5Xomd3xogjFBz6vhPF819JRZC/KBVtlXUr66CFS0VmFpK9G08TipBXCHQfJs1LrIVNbzfyRyVFzWgBprxYedOb0D5LcxYvl7U8z+VQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SbKrRJNNepmkxuJ2LviKpNghhUGdFxXERSxoBlR5bk=;
 b=Y72ne9Beh/bOkexhWcSPlghI1P1FsXo0oMTOFEBjycx7wNVQlW1RQEPiAsGMETZOnSJG99L4LNH/ntLaC5jTfNqTUt0lWwCPpDrI1z7NROLOO9oRFMwfPSMRbmWig+E3AoPL8ZPx5Kp8noXvHwiA1KNsg/UNPPeecSjignNZhwk=
Received: from CY4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:903:33::24)
 by MN2PR02MB6221.namprd02.prod.outlook.com (2603:10b6:208:1be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:25 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::fb) by CY4PR03CA0014.outlook.office365.com
 (2603:10b6:903:33::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:16 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:16 -0800
Received: from [10.140.6.35] (port=57754 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRki-0003MD-9I; Sun, 28 Feb 2021 11:29:16 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4530B13C06B8; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 00/21] eMMC support
Date: Mon, 1 Mar 2021 01:03:06 +0530
Message-ID: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 170cf848-14b0-49de-b37c-08d8dc1f287c
X-MS-TrafficTypeDiagnostic: MN2PR02MB6221:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6221D2C9AA2D9C668E85EC68CA9B9@MN2PR02MB6221.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNhF/Jvnk1SUVBzH0s2pGh4iHKfglmrVrUgeJI/G508NqMKw4xRRRZT0cgsQYgT5oOQnKj6FJAwrpXx0J1Ns1hlq7oCX0jaYrIrPy5RNGw8fyoxR8hBi9v+qGkXpyLMks3Qkv3JH4lY78ZpnPbzP2HQTKETTViV2A42igwW8mFz8WRv+wJR5d0+5MghD2aYVjVACSSCHrqUm4GT8UlCjiawLr5Mj7bzmCsz0GUDLnCyQlyWVXXZfHYY3HngFKkp7Z6BZPV7tQw92sjqENEJoI7RXGm/IqOkeXGt6F5rX7B5zRUWxH0X6bJztRJknj+Jk/RuG6YLCpGnNpDPff0yjdN2WZRBDywLhdJyYU1uJ/kwclsO9vXhZYcENi6/UuB29eCyCqOfhpQDsrt0ch0KjlfAJDHnW2RxxV0Ns+x4uGSbUVi5lYKEtTvbVPdEjlPBdjiVw0TOhY2DDgWx45JSi2qnF/GNncdSPMM7hUasB7aBF0lSjMB7QW9OjSScYrVV0qQ2gkX+w+j3ZqtbmFGyEhiO7JOSbpQuKwdB97lFKixxmLgkrgSts7h315c4A0NOoAQ244jxu39/HZirvGC+nXStsQIBTK/sjUnheMQM8VYjR9UOygi/ioNfwenx5AMmmrnamucRvgiKzFlOzVnUh16u4VHGwgu9rjNnAxA85vQ6SpdoCX24n7ScOw10vS7F9
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(46966006)(36840700001)(336012)(36860700001)(83380400001)(5660300002)(921005)(186003)(26005)(36756003)(426003)(82740400003)(8676002)(8936002)(478600001)(70206006)(70586007)(36906005)(7636003)(54906003)(66574015)(4326008)(2906002)(42186006)(2616005)(47076005)(316002)(107886003)(7416002)(82310400003)(6266002)(356005)(110136005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:25.3643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 170cf848-14b0-49de-b37c-08d8dc1f287c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6221
Received-SPF: pass client-ip=40.107.93.58; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Changes for V3:
	Revome addition of EMMC drive flag
	Add TYPE_EMMC device
	Add id strings for shci instances
	Update versal doc with eMMC example
	Fix signed-off-by lines for few patches

Cédric Le Goater (1):
  sd: sdmmc-internal: Add command string for SEND_OP_CMD

Joel Stanley (2):
  sd: emmc: Support boot area in emmc image
  sd: emmc: Subtract bootarea size from blk

Sai Pavan Boddu (14):
  sd: sd: Remove usage of tabs in the file
  sd: emmc: Add support for eMMC cards
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

Vincent Palatin (4):
  sd: emmc: Update SET_RELATIVE_ADDR command
  sd: emmc: update OCR fields for eMMC
  sd: emmc: Add support for EXT_CSD & CSD for eMMC
  sd: emmc: Update CMD8 to send EXT_CSD register

 docs/devel/emmc.txt                  |  16 +
 docs/system/arm/xlnx-versal-virt.rst |  14 +
 hw/sd/sdmmc-internal.h               |  97 ++++++
 include/hw/arm/xlnx-versal.h         |   1 +
 include/hw/sd/sd.h                   |   2 +
 hw/arm/xlnx-versal-virt.c            |  29 +-
 hw/arm/xlnx-versal.c                 |  14 +-
 hw/sd/sd.c                           | 563 ++++++++++++++++++++++++++---------
 hw/sd/sdhci.c                        |   4 -
 hw/sd/sdmmc-internal.c               |   2 +-
 10 files changed, 594 insertions(+), 148 deletions(-)
 create mode 100644 docs/devel/emmc.txt

-- 
2.7.4


