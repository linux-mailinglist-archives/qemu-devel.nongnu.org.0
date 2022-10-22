Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A079E6084C8
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 07:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om7Mg-0007dQ-BL; Sat, 22 Oct 2022 01:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Md-0007cs-RA
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:07 -0400
Received: from mail-mw2nam10on2042.outbound.protection.outlook.com
 ([40.107.94.42] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Mb-0004yI-L4
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjUVoBXxdTONbh9pkyvead5qgwsDNS0BginUy0EIN8uuVYGbgbL8vg8S/88GeFUsPexQfwytnQXJfpZ9SHMbi0ZhqKr7fVX7XVY5fD9x5pOWNF+9yc146ONvgP4NyV5N8Z9m7LRoOIhqKBZbfjVy/yPubiXDDiftFrbDt7I0tv1ENsRtmejF9fULVdf1a5gmuqnUUocv3uyOM8TZYANmUIwFQmLt7UQO9qFnM/6mPNQMFcU5iuwWiIflXA8E0vru78uLIBKz0t4YolieyHkc864guDKQM5kqdku+BDE2ARmGIrAD45CJQrpH28B6Cm+Lduxl4MB4fHQibVsRgP7j1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER6t1YyILRDMuN7TzWA4ZLX2tcRiCOyIlvawLU0lf9c=;
 b=dtaVQos/UIoEwijnmwp4m0kZV3oMPtTBwax6rPJyb4Ikz2Mk51rY68/YxiWMKSp/QSxejN5jKZGnjs/4ajvgvGUACvoDiXmcORuaHSuK9bqsEX35ksXjnixwWYKzB0wAEHNVs2+ZJ5ieh3N3F6ZwhmvXnyUsgK2mL7308X+6Zy4vfygtRzVu7e0H+tiZHArDfq7AlsaXCobtwvr6TAp5IiDyX4BImnEVZpM8fw4fayKHJ3N+vMkwgC1vvet4ONaEvdCxlFN7/eydpkXNumPsTQSkg8JDXUJJbloEsYBG1wqBppyp8pbndyY14OtE3CljMMty77AJO79FmFMdPGuyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER6t1YyILRDMuN7TzWA4ZLX2tcRiCOyIlvawLU0lf9c=;
 b=nAFkhj+DdBXInrsYQACyK+f0rQ1zzBmKCJkp3bxA9xp4MTESVdBHGnLCwIHHwbagjD0YGKb0QUg8Y000vEFxcWbUvjcypaZrPFl4h9Fhd5gTRWeqWLJApolV7RaifsxO6rkzxb4iU6Yvj5+J9uxwp2B7kLMVL5PGx6//nQqLKPU=
Received: from DS7PR05CA0031.namprd05.prod.outlook.com (2603:10b6:8:2f::6) by
 DM6PR12MB4563.namprd12.prod.outlook.com (2603:10b6:5:28e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Sat, 22 Oct 2022 05:47:57 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::4d) by DS7PR05CA0031.outlook.office365.com
 (2603:10b6:8:2f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.9 via Frontend
 Transport; Sat, 22 Oct 2022 05:47:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 05:47:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 00:47:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 00:47:55 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 00:47:55 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <edgar.iglesias@amd.com>, Vikram Garhwal
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v2 0/5] Introduce Xilinx Versal CANFD
Date: Fri, 21 Oct 2022 22:47:41 -0700
Message-ID: <20221022054746.28217-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|DM6PR12MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bc8923-4854-4a97-f270-08dab3f0f885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8Bj9dGFuJjZmA0q8pQaDmYPSLvNtN3H/GHW2j1V3C4VmcOsQBYsBba4R0qToPKv72MUWKxWPZNN9Ogloq8OvpkNVUeCi9Hgksa4lFb3NrJ41gvw7Py7YQ1smf0hpVbYsKs62/cWoLTDJPQZ5XFu9/ADiI5o5nEDZebWvTCPKF7/rvPckOFCgD5p2tbFv2fet9SZKjmTSjcINq7D/lGiwcfXxW0Cl19HdbNBkKenn6pHBTttjnfmbC1kxAcPBhBcs0ThxmJeMke0Z/IwrMubObKnkECUM3mbXadmEvvCsx/f7dcWOF8jDKcLYmTSJ3AMJbczxP/NPyvaQtOUMZSVFZo/lnU6DbODBbkOK+PHHWhGr5MfSgNMit4NX8RLZEvEzYDt7Tg0PH45WrdCDnQ0dSFkPbZ7qIxPNrjVERPPC0cT3VDVuIC0Zo66FFwG4NAczQEcjBJN7tK2NUU6JgleaU2lh/SbnDmKMIW3Ph5Dt5E4xzHSEE/wbZTV7vteKuNpiLCCgpT+hBVydv92SY6z8RNS29e7cdbwZXXktTWx764sSAQdsDvN2HVduNFpr/gYZTuiQTu0sDvcLAe3is9iJ4WpWL4wQl2GbPfF+QC7p+XJRbUZ3L41dhzWXo4C7yMU9MVo0kJR4UdSIinGXHQiZM2Ds7aS9fdbr/Uf3wjagWMwt9ufm758VLs2FyAZQiRYhqyuLXSCzFbBkTymeJAWYDxDDdTRLQ/qd3ub4EKuxY8ydUAKZsGD5/ZQJRz5nRUzYSESMaxqxkHYzEIBSOWs1mh6adx4pY3VkI4wLjGSffciv/TT5TqzRYy6SewRA0HX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(5660300002)(47076005)(426003)(44832011)(6666004)(83380400001)(8936002)(41300700001)(82310400005)(36756003)(316002)(478600001)(186003)(81166007)(2906002)(1076003)(356005)(26005)(40480700001)(336012)(54906003)(36860700001)(86362001)(6916009)(40460700003)(4326008)(2616005)(8676002)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 05:47:56.8616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bc8923-4854-4a97-f270-08dab3f0f885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4563
Received-SPF: permerror client-ip=40.107.94.42;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
This patch implements CANFD controller for xlnx-versal-virt machine. There are
two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
machine.

Also, added basic qtests for data exchange between both the controllers in
various supported configs.

Changelog:
v1->v2
    Update xlnx-versal-virt.rst with CANFD examples and add this in 03/05 patch.
    Addressed comments for patch 02/05 and 03/05.
    Add reviewed-by tags for patch 01/05, 04/05 and 05/05.
    Change commit message for patch 02/05.
    Add SPDX license for Qtest.

Regards,
Vikram

Vikram Garhwal (5):
  MAINTAINERS: Update maintainer's email for Xilinx CAN
  hw/net/can: Introduce Xilinx Versal CANFD controller
  xlnx-zynqmp: Connect Xilinx VERSAL CANFD controllers
  tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller
  MAINTAINERS: Include canfd tests under Xilinx CAN

 MAINTAINERS                          |    6 +-
 docs/system/arm/xlnx-versal-virt.rst |   31 +
 hw/arm/xlnx-versal-virt.c            |   48 +
 hw/arm/xlnx-versal.c                 |   37 +
 hw/net/can/meson.build               |    1 +
 hw/net/can/trace-events              |    7 +
 hw/net/can/xlnx-versal-canfd.c       | 2160 ++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |   12 +
 include/hw/net/xlnx-versal-canfd.h   |   91 ++
 tests/qtest/meson.build              |    1 +
 tests/qtest/xlnx-canfd-test.c        |  422 +++++
 11 files changed, 2813 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/can/xlnx-versal-canfd.c
 create mode 100644 include/hw/net/xlnx-versal-canfd.h
 create mode 100644 tests/qtest/xlnx-canfd-test.c

-- 
2.17.1


