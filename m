Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230363211E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:21:33 +0100 (CET)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6TE-0001xs-6p
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OA-0004Zh-K2; Mon, 22 Feb 2021 03:16:18 -0500
Received: from mail-dm6nam08on2044.outbound.protection.outlook.com
 ([40.107.102.44]:10784 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O6-0001l9-VW; Mon, 22 Feb 2021 03:16:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfrCk2KNjoWq2Ty/Sy/ZW7Fevu7nCAnYRT4ktji8Id+LrP+tSCC8Q4FzLhMmgFr/0KlgN2XuRdqnJqVnyHgwRYt4aDWb3H7ajdKw/Jr1pNpny23HCyQC1Owdi9NN1sUzgkMHY4Q9mtFJaqw1AXpMAZO4adWMVx5V9QfKGMVTuTQVys3fPN+K4RdJXNqs4ABkhOaLHQi71nWoua5gfcgVh/VGxSnMcHq4K6CnRndQAaZP61mL2e7zQvznGp/qIxcFr88twy7oQ0hV1M6zuaAiMXUgtzgOOloLAj70Rz3DvZ0ijfdgfEroR0y2nnKxZu/ILSUBFPDZhJ1MFKGw1fq/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCUvtISp3EkZoqzDRGXMfq7YpJHX2ZozQMfrUxT5CyE=;
 b=W0M/TiIV+GsJATDaDmk4BmeCa3nEaEXqb4cr39fhqKJuczjm4eC4DLXH5b7IfRsHoT3HklvXnID4iLa6+81VeW4+QfomMtH3yskOdXJpcpuKg9bJxyG5D1HGgmE0MOFrZL5eiQUTKjISyxQUS0C8r4wxBtBwXY8U6MsfIgdC8UQBmMmSaJQcuTNUAtp636QOJCVDj0oQ96PX342IFGhxdr8cTNJScKng33V5vdGi+b0PW1M6Vq+1mWLrFqQEaDivqlH3kGqWVfmcdwnwPZk1BICkDwD4gikUNZAdSI5F4mEWZdvvowWFEDDq9sIvseaFpD5JgDKlUABxRxli9lMjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCUvtISp3EkZoqzDRGXMfq7YpJHX2ZozQMfrUxT5CyE=;
 b=EfIxgSXQIBuBhiln4eQIcBSc5Rsz7UBXqGTmd2H/xcbcsVbQLQ5/9fsE0EYA0pQ0SZOozDJ3gE7o6yyJTUM1w5GO2s156V4k0fUk6Y1c29DiHUXj6YNRcWTq3c2EcEPz11WOV38auA3Dbk7QUWccvH3jejNyvW2pXimR/+9ibWo=
Received: from SN7PR04CA0251.namprd04.prod.outlook.com (2603:10b6:806:f3::16)
 by PH0PR02MB7495.namprd02.prod.outlook.com (2603:10b6:510:12::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 08:16:09 +0000
Received: from SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::ed) by SN7PR04CA0251.outlook.office365.com
 (2603:10b6:806:f3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT043.mail.protection.outlook.com (10.152.72.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59042 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-0004M5-Ub; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id E38B913C0A83; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 09/22] sd: emmc: Update CMD1 definition for eMMC
Date: Mon, 22 Feb 2021 13:50:26 +0530
Message-ID: <1613982039-13861-10-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb4e311-1e58-4bfe-3ccd-08d8d70a1c1e
X-MS-TrafficTypeDiagnostic: PH0PR02MB7495:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7495C8F902948836CC2E3035CA819@PH0PR02MB7495.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRcUcVMGIz7yW3TuYLWHcUzY1mrl5jvaqrazBKfIMndyFt+e6VYsB5ntGCo6h0SSN/Qqm0REK+ksbgwvbfzuIUEusFgBlSnv7TB+5Iie0QqZrz2YnHxlT9aOEXF8rcEkt9G7TVzE90t35LJqCgytJdqBqzD3A2c/NdXbMJ0czfLrNyavHm0VMIeuZZvdsrFx/YJBPCFrSmkXObJ2PpxqPN0g7rGrFd10TJg6a/e5yO0Pxv2rjW4fUfdvNFa0ibephUG4m2LSPaSIzhkx3y8cgP07KfxYt3yGmT216Zxty8FTUv4YjeDWUt9zSMeYu2B75hn7gmbfK1RYmSC+u3B8XZjcS0Dmtgl7lXi+rAg5S1hka9rtJwhn/n2emeaKO0E0RizrseW36PHHeeT9C/aT81NoKE5pxj8kjA3zsr9AA49oHo9MkACM5Q3SLCk5LmOk0RBjI93oHZIOFQRWhmW9pDM1TL4U6D4x6/5QgA3p1Zq4cUQY6OTV846tpZn95vFjf/wOki4Oy6+5A3gXsiKX5VLcl3NwQYxVnTjcK4UeETKYqVYaLk1BbfkzBVgCNxcvLq5MzIkL2t5nN+tEUBSY8sxOCA21LWUGC/ibdsbfB9Wl2YNt7oczw/4Gwax8dXwkteZH2Eppw8IduFgrc1gGKrkqAZJpxXO76eeQRr7S6FHzzMZxvLMjgmBxvyJ68KBOOdJ6Xhi4X0rkRNaGpgp4Tg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966006)(36840700001)(70586007)(6666004)(316002)(42186006)(47076005)(2616005)(7416002)(36860700001)(70206006)(186003)(6266002)(36906005)(54906003)(8936002)(26005)(83380400001)(478600001)(8676002)(36756003)(2906002)(921005)(356005)(7636003)(82310400003)(426003)(82740400003)(110136005)(336012)(107886003)(5660300002)(4326008)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:09.3504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb4e311-1e58-4bfe-3ccd-08d8d70a1c1e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7495
Received-SPF: pass client-ip=40.107.102.44; envelope-from=saipava@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add support to Power up the card and send response r3 in case of eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 9835f52..8bc8d5d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1033,8 +1033,16 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 1: /* CMD1:   SEND_OP_CMD */
-        if (!sd->spi)
+        /* MMC: Powerup & send r3
+         * SD: send r1 in spi mode
+         */
+        if (sd->emmc) {
+            sd_ocr_powerup(sd);
+            return sd->state == sd_idle_state ?
+                   sd_r3 : sd_r0;
+        } else if (!sd->spi) {
             goto bad_cmd;
+        }
 
         sd->state = sd_transfer_state;
         return sd_r1;
-- 
2.7.4


