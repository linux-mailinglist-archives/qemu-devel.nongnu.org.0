Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E702B54EE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 00:28:08 +0100 (CET)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kenuo-0007wd-SZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 18:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kent3-0006xT-50; Mon, 16 Nov 2020 18:26:18 -0500
Received: from mail-dm6nam12on2052.outbound.protection.outlook.com
 ([40.107.243.52]:38433 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kensz-0005YY-4W; Mon, 16 Nov 2020 18:26:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikxEXJy61f7QXzOxUusPSx15im+e5spkeeAy8aWkhTKAe3lM0G2g+yNVidd0lwNzEunpkHIJPcn66agHq8lP5O4uB4ww+TbAUIidKn+0NGKHS6AeW06b8uvngdh6ses7CdhoE/9ykSTtKdvjV3lqchBPikRYe1gbrc6sqOj7vvXyIewRVxDwddlIBqdaMLEjPyohqKDLvmDmRx4iC4kSzqFuxdMjLx9dbYaF0B5ZsLmn/fjAJ6k9ArZN8HdkLN1cRgdIt52KCgVG6df6zvAWR0Skzpw57DbTqoEQd/Y76KxATlnyyCneJxbEPlXMUvIudNHCyd5+y17tswImjtp5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GRwkfAOwkzUcWIMd6ntQxe8ao+JW3mT3KWLg5aFFls=;
 b=ZyMo2bahYpvW7Roam4bTgHFYdDJ3I7Dvlq5fPRB1Buf5byi9RGu1QaxkccajndJlRBcEU1d2JgrI8T+tf2G7RIQdRyKx7LfBym/QCfpiBBcfBemudh3t/lruedH2t/cpfS7xgvE4e9ZDzxy7iGJeeFse70SZFN94sQCPBbt20t04AsVei15GXqau0RxP9Tsq2z+uaeW0gsfZpjObtBEe1NAuUhD9FEuDHE/rjw3r5oTPJixllc9fGf2vHE2CxW9CFLgtD+Bs10kt0xwUa8UQZzyCFslqH4HWjsmFSH9SIqxnVPfpaRWoASGnoFCeIGfJiLtGHl2Agc6EaeaFrKZeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GRwkfAOwkzUcWIMd6ntQxe8ao+JW3mT3KWLg5aFFls=;
 b=GQP3PdtMMdQdwEc+O5PP+2ngMWHVqW6XejyaM7xm9hYDFrmVF25yfLEQQApMlTJseHS5Rjbmhriuk58QrTD+jZvmPzMecOZYiM1eHOspwKre3wzNhZcHz063rIN3GuqpmB7xTV5VDObQymMuj/wBNPE6Hup+Wm+N8DAuXRpy9Xo=
Received: from DM6PR10CA0019.namprd10.prod.outlook.com (2603:10b6:5:60::32) by
 CH2PR02MB6326.namprd02.prod.outlook.com (2603:10b6:610:10::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Mon, 16 Nov 2020 23:11:07 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::5f) by DM6PR10CA0019.outlook.office365.com
 (2603:10b6:5:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:07 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 15:11:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 15:11:04 -0800
Received: from [172.19.2.32] (port=55506 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1keneK-0007S0-KX; Mon, 16 Nov 2020 15:11:04 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 4/4] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
Date: Mon, 16 Nov 2020 15:11:04 -0800
Message-ID: <1605568264-26376-5-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd576801-1e1d-4da2-7b36-08d88a84e5f0
X-MS-TrafficTypeDiagnostic: CH2PR02MB6326:
X-Microsoft-Antispam-PRVS: <CH2PR02MB632662BB0A26326F61A4A186D0E30@CH2PR02MB6326.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qVV/o2a4e3gX4J5AE1FnYUhCbN6BHBCevOE7NRqcfTlxplngOMpM0vODr0ABJkFBorjkv+p7iteRecN5XStrBDLRJCNv98gkwd+SssgXjN9fA8kNg8INEQhOtxjaGFC0WY9B4VBcGcQOMyYUGEQTSpWtmCcVqlepgqwR6EHOBG/S/6z+YSCknjqaiOn1pUIDxdLl7TKBV2NHB6SCwuG4N5g8DYk8qCyKaiHfhMqhDetd2BzHW8G4FyjVlRsDfmnBz/vXlLncbm9FG954vkhi321BXeMFeuppwfrA9CDljI/peEVKyRN6MjCItsmuV9MamY+Hq2P2eUacss+VQUbHSvj8Rl0SpcsLJ6FS79rS+fBXMRNFDL1xpr/VMoMBBvVYfGjao8puiTnCEiv1J/wSgHNB/TAM/8DuzuYVajcS8LTw/6gzmr53GHBlkjuaC9i2T6dZB78FLD00b6Ws83+THtBL4bxzcWwOabECcvRjU/vyNYue8FGiLmOk+lYcpTC
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(2616005)(7636003)(426003)(356005)(70206006)(82310400003)(336012)(186003)(26005)(8936002)(7696005)(8676002)(70586007)(83380400001)(9786002)(82740400003)(5660300002)(47076004)(36906005)(36756003)(478600001)(44832011)(86362001)(2906002)(6916009)(4326008)(54906003)(316002)(966005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:07.0090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd576801-1e1d-4da2-7b36-08d88a84e5f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6326
Received-SPF: pass client-ip=40.107.243.52; envelope-from=komlodi@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 18:26:10
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: figlesia@xilinx.com, alistair@alistair23.me,
 philippe.mathieu.daude@gmail.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Numonyx chips determine the number of cycles to wait based on bits 7:4
in the volatile configuration register.

However, if these bits are 0x0 or 0xF, the number of dummy cycles to
wait is 10 for QIOR and QIOR4 commands or when in QIO mode, and otherwise 8 for
the currently supported fast read commands. [1]

[1]
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 56bd5bc..a67dc53 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -837,6 +837,30 @@ static uint8_t numonyx_mode(Flash *s)
     }
 }
 
+static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
+{
+    uint8_t num_dummies;
+    uint8_t mode;
+    assert(get_man(s) == MAN_NUMONYX);
+
+    mode = numonyx_mode(s);
+    num_dummies = extract32(s->volatile_cfg, 4, 4);
+
+    if (num_dummies == 0x0 || num_dummies == 0xf) {
+        switch (s->cmd_in_progress) {
+        case QIOR:
+        case QIOR4:
+            num_dummies = 10;
+            break;
+        default:
+            num_dummies = (mode == MODE_QIO) ? 10 : 8;
+            break;
+        }
+    }
+
+    return num_dummies;
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
@@ -846,7 +870,7 @@ static void decode_fast_read_cmd(Flash *s)
         s->needed_bytes += 8;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) == 1) {
@@ -885,7 +909,7 @@ static void decode_dio_read_cmd(Flash *s)
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
@@ -925,7 +949,7 @@ static void decode_qio_read_cmd(Flash *s)
                                     );
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
-- 
2.7.4


