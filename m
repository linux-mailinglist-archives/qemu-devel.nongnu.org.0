Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A745240F19F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:30:16 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6Rz-0002Zl-NB
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MC-0002PH-Hz; Fri, 17 Sep 2021 01:24:16 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com
 ([40.107.92.70]:24417 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6M5-0005tJ-11; Fri, 17 Sep 2021 01:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf170KA+9/UJYiPjazVP59a7AfDxlsaEUVNIz0WpTe3g6NfMrSmCuPUlaWZ0MMZ5AfK0fll7ZprqvvcxptkfG4iqNQ8pdB8GVh79T7Nk5T2TGRVaCcEoJDYiMgOpv9xwwY5Uhyj5DSmQOKt5GIovzA9WBpUyaYyzdjUF805slqQ6F/iNju8wD+T3G6eoVnElBB3CHrrhu5fW2jcGF6uU6JM/BGZUqBmH0zenwbP60Ik9CDvpPkdiv+zoERWmsR1v5fTMaGuj6qbviG5cnP/nSOHX5y8z9NF+KAPHJeas1g0us08eW8tRfsWQSGpMMdBPQNkk1z3VzpxmmNPhaWnmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JxkaR1Apl4MeRK6gqb/wCekagBj9bZjCd8zdkfXZHeg=;
 b=Ndk7XMn30PFln8l/8N5ds/1eI2+8fHyPX3F3BidRB02U8uNEb+ovev8jqukagVOuXaOciWYeQOIKbMIdlaRvkiG4/5SL7HP7K6fjQrz8y/mAEpFl8bbms16W77hHB2nmt4uaN4NbQ9/l96zfjcZTer9PSx29R4PQyUVbKNDzYqRRVV3Mq6JUCdQtZRbB3XrPF6jYUmAzQful9OWTea6skbehLVpAZ8zVE7R8wnqLNX098l4+OcBpEfTQsw9uUm5lBHy+VPOfje+XUW7EZnFEqQ/n4CU7m9D2P92C8QZgVy/xFRh3Op6JIEj42GwmulWeaSafD1LCRH2q46OLrsIIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxkaR1Apl4MeRK6gqb/wCekagBj9bZjCd8zdkfXZHeg=;
 b=h/hqSrDztdabTE9XDltSGu9Koz+q9L94+MhPUotuevjcs3uR/D7RKd3+MCv7AbqtpM0bkYANbEJnEiSMw++yViJrTUiL9lW/zXQ/zq9muD5qPtW+MK2gW+kwNVTKfI+4GdSPNfusdf8aQqA7G6hq8ZbiHrZewFuJc7EhUKEti7w=
Received: from BN0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:408:ec::17)
 by BN6PR02MB2259.namprd02.prod.outlook.com (2603:10b6:404:2f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 05:24:04 +0000
Received: from BN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::8) by BN0PR04CA0102.outlook.office365.com
 (2603:10b6:408:ec::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT035.mail.protection.outlook.com (10.13.2.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:00 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-P3; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Date: Thu, 16 Sep 2021 22:23:51 -0700
Message-ID: <20210917052400.1249094-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd32b8e-89e0-4910-0df0-08d9799b5d55
X-MS-TrafficTypeDiagnostic: BN6PR02MB2259:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2259FA4FFB3228D7D6A3232BCDDD9@BN6PR02MB2259.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNaCTyzDnSOidQotW0wKfnfTsfc9RuKdC1v+PXjESxDzsWOeXmHoeGFzfYINM0nSWVhV3GsjgqtyaAUjUcToB2kPGwejmsaJRRQf4+Lgsfrbj/J6eQsunCb+8Z4a/9alB/9ekd7PxgmSdmEic1HvpMjgW+69TasBzoMicjOcDrj/Beb/N2cIzTr2YVa/kX+Fd0BojJDphWsVCQLgLSBy1g6m6YFcDaKgAZEt6qi3wiz+S1dXaoU0Qa3U8qEBTCd2uY+fTc9IeLQ6uhGl7vH/fd0ujmlkHQF1T+prHGdHKY1tUasAbNgt4M2ls6tClYION00Ila2i/DNhPjOHzm0aE3kzj8b7MkUke8ZhG48Ehbp/ApBFBbSMciq9Y6GmnEcTgQp4t7bDE4RJr8TZfh5f9Uq8ihSFu29gjDdURLry+Aiz0u8VZe+0c3p7SbkMkkMGmjsPxr9inngyxxZwvpBpRRl1srXt9Jc+Sx+sdIW9Zlyj2NoFeTcgE7gbpOwNR8FRqQ7wmhc8oeZkinmO9g0k/wO3NNCoYM3goO7Ueff6h/VL0iq2LyJcI4zSMTxbujojtakroe23O0bO8lackDMz1uhPDFwwRscUd8gW+Hfi+J4LujLrk6jTro3VuW5MupY5d9qZT81jFsPB00MvLe65mury6U1M/MxxKG4RmO8KgpdJxyC5IBt/o/zi2eXRwPTGWlGiLLSzuYec7lrHw/8gMbyV5XWIUJ3vGIqB8Z3Xqio=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(316002)(83380400001)(54906003)(8676002)(356005)(7636003)(9786002)(36906005)(2906002)(82310400003)(82740400003)(44832011)(70206006)(70586007)(107886003)(5660300002)(2616005)(336012)(478600001)(426003)(6666004)(8936002)(26005)(47076005)(186003)(36756003)(7696005)(4326008)(1076003)(36860700001)(6916009)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:04.0983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd32b8e-89e0-4910-0df0-08d9799b5d55
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2259
Received-SPF: pass client-ip=40.107.92.70; envelope-from=tongh@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements the Xilinx eFUSE and BBRAM devices for
the Versal and ZynqMP product families.

Furthermore, both new devices are connected to the xlnx-versal-virt
board and the xlnx-zcu102 board.

See changes in docs/system/arm/xlnx-versal-virt.rst for detail.

---

Changelogs:

v2->v3:
* Move drive-backend attaching to board models
* Use OBJECT_DECLARE_SIMPLE_TYPE instead of OBJECT_CHECK
* Use reg_array->mem directly instead of an extra mr-container
* Add doc comments for .h file API
* Remove "qemu/osdep.h" from .h files
* Remove ad-hoc endianess detection
* Remove error_abort from device models
* Remove empty vmstate and mininum_version_id_old
* Remove unused #define macros
* Remove unavailable references from comments
* Kconfig & meson.build:
  - Add CONFIG_XLNX_EFUSE_CRC in patch 1
  - Select bbram and efuse devices from boards' Kconfig
  - Remove 'if' from meson.build
* Fix spelling and wording in comments and docs

v1->v2:
* Move doc change from 1st to last of this series
* Remove outdated comment of 'autogenerated by xregqemu.py'
  from all affected files.

---

Tong Ho (9):
  hw/nvram: Introduce Xilinx eFuse QOM
  hw/nvram: Introduce Xilinx Versal eFuse device
  hw/nvram: Introduce Xilinx ZynqMP eFuse device
  hw/nvram: Introduce Xilinx battery-backed ram
  hw/arm: xlnx-versal-virt: Add Xilinx BBRAM device
  hw/arm: xlnx-versal-virt: Add Xilinx eFUSE device
  hw/arm: xlnx-zcu102: Add Xilinx BBRAM device
  hw/arm: xlnx-zcu102: Add Xilinx eFUSE device
  docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage

 docs/system/arm/xlnx-versal-virt.rst |  49 ++
 hw/Kconfig                           |   2 +
 hw/arm/Kconfig                       |   2 +
 hw/arm/xlnx-versal-virt.c            |  88 +++
 hw/arm/xlnx-versal.c                 |  57 ++
 hw/arm/xlnx-zcu102.c                 |  30 +
 hw/arm/xlnx-zynqmp.c                 |  49 ++
 hw/nvram/Kconfig                     |  19 +
 hw/nvram/meson.build                 |   8 +
 hw/nvram/xlnx-bbram.c                | 545 +++++++++++++++++
 hw/nvram/xlnx-efuse-crc.c            | 119 ++++
 hw/nvram/xlnx-efuse.c                | 280 +++++++++
 hw/nvram/xlnx-versal-efuse-cache.c   | 114 ++++
 hw/nvram/xlnx-versal-efuse-ctrl.c    | 783 ++++++++++++++++++++++++
 hw/nvram/xlnx-zynqmp-efuse.c         | 855 +++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |  15 +
 include/hw/arm/xlnx-zynqmp.h         |   5 +
 include/hw/nvram/xlnx-bbram.h        |  54 ++
 include/hw/nvram/xlnx-efuse.h        | 132 +++++
 include/hw/nvram/xlnx-versal-efuse.h |  68 +++
 include/hw/nvram/xlnx-zynqmp-efuse.h |  44 ++
 21 files changed, 3318 insertions(+)
 create mode 100644 hw/nvram/xlnx-bbram.c
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-cache.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-ctrl.c
 create mode 100644 hw/nvram/xlnx-zynqmp-efuse.c
 create mode 100644 include/hw/nvram/xlnx-bbram.h
 create mode 100644 include/hw/nvram/xlnx-efuse.h
 create mode 100644 include/hw/nvram/xlnx-versal-efuse.h
 create mode 100644 include/hw/nvram/xlnx-zynqmp-efuse.h

-- 
2.25.1


