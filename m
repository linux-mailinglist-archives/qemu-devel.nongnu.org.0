Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BE5B4534
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 10:15:34 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWveH-0003Uf-EN
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 04:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWto6-00007p-0s
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:17:34 -0400
Received: from mail-mw2nam10on20628.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::628]:12156
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWto4-0003mu-4R
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:17:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoBeMoBcZvHOPFgro0hqsf3+iPdTvlPgQtW/YJmENcpl0XBHCf1ecWv1BYGG+YoR7iEw3AbDQIJEenKQfX3yMG1hClemEDOSmOPJMtv80FroWFgDlyATlC4gS+r9CdNnkc6dub0eeWGaJz7czoeB+9Ca5RPCdLA80bJYlAR9FxfaGrXwxqso+9bFcFGukiYALUmyYEbjQ3BD63/onfeWIe6AyNmBgBIO0+zXK2JPWWvZ68cXXqaX9WEeX2JOtP450MKvAl1OOwP0AQ0WX77oKd528+sqW/IWEBg3nCsiCg4drz2+rmGzhtBZ1EjTgItj93UDx8ttfg72B+CqX3wJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VJYFnZWuc7Lg6MNq5m9dKj5CZz39d/owFUb5xplm64=;
 b=ctGcZ3JIZ98pqWkiJ2jaR+1IUIWY307R2gN694WxZRaaBka/C50WJK62Yh+pEgm31u+A6xtsZAKevL7s/5XahNiaJwN/8GuYOV4pUsOTQxiP7iQh5I7dQpiAsuiFoFcAqn5agqRp/hSJEm5X7pdHH38I5y5oKONMd/AlfO/qTrxLsK0uBY5eWqAXzDNZ3zJOjDSld7msEpFH40UtzWkRcct7+U8WSLY/XMpEZ0YFINwDpCPVWeNVuhIHOAf0rodvW7jCidKGeamc+uoR2asA8OGG9SnfRBMQzqMVBcaUtzdaAhR1v4KE0tkyY+1eDps+bQ2/ZzcWxPS0DVpbc4hYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VJYFnZWuc7Lg6MNq5m9dKj5CZz39d/owFUb5xplm64=;
 b=v4fpioXO0B8FZO00G5QHMEhOjtrzyQhGVgZnhMMwfqEel72uRgwhKHLAjXBm/rhU3HOec62xpnGlOWUiiCr1XZlKsmgm2yavrpSqCqOvOeEdAxGGkC0jiWGZyryqRI/MS46gSwYxTKMnykZS2QY9iC916qBvPksfz3hBvPAH3u0=
Received: from DM6PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:333::34)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Sat, 10 Sep
 2022 06:12:23 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::26) by DM6PR03CA0101.outlook.office365.com
 (2603:10b6:5:333::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Sat, 10 Sep 2022 06:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Sat, 10 Sep 2022 06:12:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 10 Sep
 2022 01:12:22 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 10 Sep 2022 01:12:22 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <edgar.iglesias@amd.com>, <francisco.iglesias@amd.com>,
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH 0/5] Introduce Xilinx Versal CANFD
Date: Fri, 9 Sep 2022 23:12:09 -0700
Message-ID: <20220910061209.2559-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6909f8a0-ccc5-4975-e7a4-08da92f36d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkjXG15a8WyI5cK489We5YnpdBfX99MiKF2+JNjELq872Hii5tnRzH2svvT7eFPCMZdiTaf86V2QQcHQpdJ5e9GIhnsN+c8/tj+NFUV9D3y536dw8VN9yNtIa2HlbnKTmq5fRWsQQPV7TV7zQKY+L4b/h+gSeszz2e3sDZLMMdCn7FT1WK/j50vExe07P4En9BU/uu5VV/XaBN9Z/GBHGoPRkf6VeR3G/DrVecWbzk08GDzE+PmRcPOZA1yJb7rpR4qeJ+am2iEibi3VVY91SrV4sQ1VrQSfaWtczCBRJLXLKeapMrqrpTC7F+8wBPToMNA0dl9jk63aRXvObvw3M2PB5Pe5lVVMc+dcAy6nNUSo7YbcrbZcgfDe/fqco7qdiXCRO6H73laCrZwX7RA16eRKqhGQSOJk4uI0WVovuBwRuhpNX4PQniULUvcHGdvmSxhUCtmEpeIzaurXfqvnzuShU8oGSdh62GTAnwlgWLullu54Z8L5181yfbj6uvXd0trjDx49HVzxGJe7H552vI1fpg1fgIbH5p1I41kPKcjde7t6SW/ZiD3wXMiWpCEISCr3S/WOJxyAumhBs/06G9XRwTDG5YMi6R8dxrul7pHnNO8i9LaEidBgM7YViTjiOj3pg4HQ4uRo+LLweMXVVZb1eNNOcjSbR5KDwxZIKdypLV8N965PejShGbQvq0nKxMP/mO+ZwwzICdq2/rXwIsXrtoEJS/6AZIWcdM8aj9aKgQ5aE5LJbwi0zHZe64IvzEZgAClDp9a5IU2txYrbDkaQp2wv+mRcg349DQplmOs8WSPfHY/vpHHIzzmV2657
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(40470700004)(36840700001)(82310400005)(8936002)(36756003)(54906003)(44832011)(2906002)(47076005)(70586007)(8676002)(40480700001)(86362001)(41300700001)(70206006)(5660300002)(356005)(81166007)(316002)(6916009)(4326008)(82740400003)(40460700003)(186003)(36860700001)(336012)(478600001)(426003)(26005)(1076003)(2616005)(6666004)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 06:12:23.4438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909f8a0-ccc5-4975-e7a4-08da92f36d57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
Received-SPF: softfail client-ip=2a01:111:f400:7e89::628;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Sep 2022 03:57:30 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
This patch implements CANFD controller for xlnx-versal-virt machine. There are
two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
machine.

Also, added basic qtests for data exchange between both the controllers in
various supported configs.

Regards,
Vikram

Vikram Garhwal (5):
  MAINTAINERS: Update maintainer's email for Xilinx CAN
  hw/net/can: Introduce Xilinx Versal CANFD controller
  xlnx-zynqmp: Connect Xilinx VERSAL CANFD controllers
  tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller
  MAINTAINERS: Include canfd tests under Xilinx CAN

 MAINTAINERS                        |    6 +-
 hw/arm/xlnx-versal-virt.c          |   45 +
 hw/arm/xlnx-versal.c               |   37 +
 hw/net/can/meson.build             |    1 +
 hw/net/can/trace-events            |    7 +
 hw/net/can/xlnx-versal-canfd.c     | 2157 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h       |   12 +
 include/hw/net/xlnx-versal-canfd.h |   92 ++
 tests/qtest/meson.build            |    1 +
 tests/qtest/xlnx-canfd-test.c      |  421 ++++++
 10 files changed, 2776 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/can/xlnx-versal-canfd.c
 create mode 100644 include/hw/net/xlnx-versal-canfd.h
 create mode 100644 tests/qtest/xlnx-canfd-test.c

-- 
2.17.1


