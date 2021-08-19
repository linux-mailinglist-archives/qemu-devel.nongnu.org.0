Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC43F117C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 05:20:54 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGYbt-00062e-J2
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 23:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYH-0001af-5J; Wed, 18 Aug 2021 23:17:09 -0400
Received: from mail-co1nam11on2065.outbound.protection.outlook.com
 ([40.107.220.65]:43525 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYC-0007vZ-M0; Wed, 18 Aug 2021 23:17:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlBwHsZod26EhyrPlVylKz07OUozBH7jRvR/dqahrpy4nuZFI+JBHQ7SeZw1rZxSQzyC3v4pMLjTY/x6pi+lmBVwEWVCHcKyM8oD41F5n8SM3Z4wtBXlk+3adZevIsaFn+Sm0CkVrwYDELHuhcOmdF57U3kQVVscFLT8mvesV2Dba3rfUjJIxCIpjxpGv7bD/0eY1ivokaMWLgRz8OBK6xPwlsnIlWDb0wAPT0IoKX87/4hXZpR6hy7mYQlpF4ZJh4NqQlViD32ETeaIywyVF1n30R1kYP+zHSH9clnv+DV3XD26OyxMCZDOtKOPFzsy0HpYqJpNVZrjMj0W4BG/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/c9BLUhtmbNDEe/88BRYjzwQ0hiDEeJ15ucNR6lQTg=;
 b=bKguDRrJYXtDiYoeAkdP4T0Sk2oGCPUbNDZNUqYi/lwTYT9Jp0QBd0qnh3ysmWh6R58QdudMUUum0A/0t44ehJJfH/6O7HX2OAoTLHjJ4ubd1FXs7B6l2Kq0Am10oCX1CS6YPpvLl23TNGp0hlpkdfG/We1JhuhXCSZh8DXkbnA1qkxXGTeW3VnLzBRjl5PFVcowVV7SOa51EYexTknlYjI7K/WJ+UD/vwtd4wMGNhv48+W+eWNtGuxIHi7YQoxYOSXOLBLrKxQ9180nLEV7sg8Ca+oeImDIt0fYHpNkHYkjBlD5tbshRvSGf8zydwsjbZLu7Ak7vl1XlJsh0/QojA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/c9BLUhtmbNDEe/88BRYjzwQ0hiDEeJ15ucNR6lQTg=;
 b=q7qrN03K1+pMqe1b23g6M9RZAhIZm1s4tiXyDFoOdGY1RVr8ehBmxxaycbXkRQ4KczPYJIEcfgshc1N0Qj8vMhj+44ZzkrjE8i+0FZoNYi4YAYUSl0uXyb4D0cY4QFDztObW5v3rKhx/K4vkwbbbGueY20paUXcKe77O9MbSw7w=
Received: from DM5PR06CA0026.namprd06.prod.outlook.com (2603:10b6:3:5d::12) by
 BYAPR02MB4728.namprd02.prod.outlook.com (2603:10b6:a03:49::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16; Thu, 19 Aug 2021 03:16:58 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::8d) by DM5PR06CA0026.outlook.office365.com
 (2603:10b6:3:5d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 03:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 03:16:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 20:16:57 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 20:16:57 -0700
Received: from [172.19.2.40] (port=52298 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGYY5-0002Wl-L7; Wed, 18 Aug 2021 20:16:57 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch 0/2] hw/arm/xlnx-versal: hw/arm/xlnx-zynqmp: Add unimplemented
 mmio
Date: Wed, 18 Aug 2021 20:15:23 -0700
Message-ID: <20210819031525.653995-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82fa3266-f4a8-454a-4208-08d962bfcdf9
X-MS-TrafficTypeDiagnostic: BYAPR02MB4728:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4728F53CE2EFD730DCC82F06CDC09@BYAPR02MB4728.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wj0po+pCdIORUaZxyPx2OvgMTx/ujAtJoerUg41owe0KBwqZu+UR0ZQAOkQp6Paho+vre3Kb9RxMxKnc25ulKSgQVPS4iqIEHe7McyCMO8u4t4QNQXPsrGkoWHIWu/cjtBJTNHWVwoyb2BE67A0tgHbkvQ6VTL3DMeWAK+HTamaKMaV160hw0ib3uyxZs7DYDB1Xl6RydJl3xtEO2YcIVjQxPvSrn+CAczjTXkZcItphDEUOnC2+rxxJrnchrk4IVPJFRYaU60emJF//FF4tjXFM2B4nf+5Y4BjGgbuxS3Q8xzRasaS51azTQhSV4BGDvprtooprVHrYbj3C3ejHOJIzLvZrUzKjFJfAmp510SiuDITTbgAUEhRuWATJAOs0CbTtJOcANdwH936LKuVr/CMwPaqRdp05m/VAes40XS9r3dv6N3vbzPeHvwDkZrCz8XUmdCLZ6bjyOjwVITT9FAtzJuhmBWvk7p42TT6gVYdc2zyPiBlWdSTljNJycZF1ItIDP5Z9e5pGr1BDV+TUxNr4uNqMhsGmXXUH5AYHiCKgg8p7YUIedTmjkjhu3bEBLAi4kgMfOEM6EXzvIVTAotAWGhW1NtvxUbQsQ2V5gqwdnF86hUcrou73gkHjvMYM2VqM7rbZ0WvWI153/b6XhhkBJO7qOD5/NEQ5UGn7Zl3oABI6OHoODrhZX06cwhTaBUsy5V4RCOnDCwnNqJbtlUfDupND+bcoBtvoqSW+G6srZXH5I6I6OwWdd1cImIMizAVd8ql5UIVgnGHQ1xBvS4E5prv+d4NOSD4pIczx+axRYGnL+pOoxufpr8274qgM
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966006)(36840700001)(186003)(82310400003)(9786002)(6666004)(47076005)(1076003)(44832011)(6916009)(26005)(70206006)(70586007)(36756003)(7636003)(36906005)(2906002)(54906003)(82740400003)(2616005)(107886003)(316002)(8676002)(356005)(4326008)(4744005)(8936002)(5660300002)(426003)(478600001)(336012)(966005)(7696005)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 03:16:58.2666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fa3266-f4a8-454a-4208-08d962bfcdf9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4728
Received-SPF: pass client-ip=40.107.220.65; envelope-from=tongh@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me,
 Tong Ho <tong.ho@xilinx.com>, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the APU mmio region as an unimplemented device
to each of two Xilinx SoC to support booting guests built with
the standalone bsp published at:
  https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

Tong Ho (2):
  hw/arm/xlnx-versal: Add unimplemented APU mmio
  hw/arm/xlnx-zynqmp: Add unimplemented APU mmio

 hw/arm/xlnx-versal.c         |  2 ++
 hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  2 ++
 include/hw/arm/xlnx-zynqmp.h |  7 +++++++
 4 files changed, 43 insertions(+)

-- 
2.25.1


