Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E532743E
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:46:32 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGS1P-0005lQ-6O
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlF-0000Pt-4N; Sun, 28 Feb 2021 14:29:49 -0500
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com
 ([40.107.223.56]:62049 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl4-0003Ek-5O; Sun, 28 Feb 2021 14:29:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E++7tcvhis8IsYYq8258WAOGeqMs8rkTIg+FaEZDUs1/M+1oYp6/YsnRB/6/gJ8R+0AETod0yjcnYxPjiXUNAebtA2FrQEpkDQbUL8UZ0AdQ4d/CPBAMIfO98s1qDQ4ekGzqY9bpFZp4P8/9rAaltiiW10VIp2Kjvo/N1qxeu7JPxZwdySz1jpwGUn/hieEyEZB+ZoWbuUMMfukuznX+8IpBrz6ymwc0cKSqDYM1eBH/G/ivAdS9hmJHTND3vDjAxo7DVjBEQICpLMfb08If2GRSDkY1lb6JN+X4gcvCrVKIQGiTto/4gMVOVyyHQnZQQQ9Q5532CFUOuFJYZdiewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=cSBalAvfzCWkuUqx1I52eomO0LXh8U9lEgXEQunIRvQoz2vfzPvLggXUok1cakLe/N5f77FkI1+kkG/eI07RssW0cNW595mxz1jo01tqdvs7ZeL0+kCgDCXXIcdXbPM6xEBxIZ1yUyGWDUErLP9X9q6UboQBsWty+flYfxsupVFQR0iRq9oAllAI0NWKO0Hs8ZSudFh3ambotZrPq5fmyQEUjA5hQz8cC5uG4dfXCGoozqvSA91knVl0HZe3jdIksjrkJJE5v1nAnxZIQfAgN6o0hi851erb08tveDlCmsL55vqeeE/418N/pxNZsdAp9mH7tv2SubcSmw6QX0+MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=VsiI51nNJFGqrUwatfUPCjIYIDo9IOJsA1u+1DWLIFBlDx2wCk9BhjCkUH6pOIp0znZGoy6n1pg92AYXnMrct9S26fSMEF2+H9HYT10hwsQ3ZohsqHdvX3Yzk671djHXdPeGwV1xw/Anlxeexo4G9rwGgnCTJKn709BQg/ODjP4=
Received: from CY4PR03CA0011.namprd03.prod.outlook.com (2603:10b6:903:33::21)
 by BY5PR02MB6834.namprd02.prod.outlook.com (2603:10b6:a03:211::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:34 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::42) by CY4PR03CA0011.outlook.office365.com
 (2603:10b6:903:33::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57784 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0008BB-HM; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CEF1D13C0ADF; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 18/21] sd: sdhci: Support eMMC devices
Date: Mon, 1 Mar 2021 01:03:24 +0530
Message-ID: <1614540807-30686-19-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0da70025-9101-47eb-9172-08d8dc1f2d9b
X-MS-TrafficTypeDiagnostic: BY5PR02MB6834:
X-Microsoft-Antispam-PRVS: <BY5PR02MB68342F375409662E90DD7B89CA9B9@BY5PR02MB6834.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x95U8UgR56QtkHRACwkRqnImmHy83/XnP1CGF7SPfx8cFl/tf/CGJbRfQvUq0zNiqqDXWhxW9yPpn12G/ZLB692p05JwoaRmIppmV3jgjNXSkv9R7XOR6CtXc9Gsx5oSC2nfoT10iJXF+APAZoealdtcbIHKVo/SKwa7H6LjxY5oaeXLZMRiEUKLYKDzma7pOmi5QFgxqUciuRUucMgLv4sSJe7HJOYtI7+O2jMb9+P5n7jquc42cSutTqZo+Wn9JEz8bKXC3G8ZUNpZdaoHnqJikuSg7eWj5IMjN4sl2PVUvNsNZMQo9C8RsUm10dpRHRLmCxT0zmdFOBQJwuPTAD4tXdH8ttEMkaRW8T9PVSqMOgBxkHhoYJ5gCLWTMqiznOYdFC442UKTieWCy27jD4tACobE0E9Lp8pZvHb6idaU2V5ljWmZJsFJFOlVd3HlK3VFainacLZQiroEZYPPzVcwVdSiW7dZNKZT8s4VwjGWYQZcg1A656G143HrDONNMC6jQNtTg3SPpRr6AdmDokpprkYeTvIpkVW6Y0qYODhy1FP9kJUvuBDQrkdMpygxD7bQBVZXtmYbyJEQpVXJuVNhP97OaYb6pNiGItaAni5JrPDS3lgxshiZTCDUsBZ9AR+EOxjgRgSlkFEqUTgY6hDuFBYiSjo+9dIFQ0anpVrtAMXAKx0i8TjfYB7IzLxql2dNQg4M6kN6q3lQBau++g==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966006)(36840700001)(186003)(82740400003)(4744005)(316002)(36906005)(921005)(82310400003)(8676002)(478600001)(356005)(2616005)(7636003)(426003)(83380400001)(6266002)(6666004)(107886003)(7416002)(8936002)(54906003)(42186006)(110136005)(26005)(2906002)(70586007)(36756003)(5660300002)(36860700001)(70206006)(4326008)(47076005)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:33.9552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da70025-9101-47eb-9172-08d8dc1f2d9b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6834
Received-SPF: pass client-ip=40.107.223.56; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Embedded device slots should be allowed as support of eMMC is available.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sdhci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa539..771212a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -99,10 +99,6 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
         msk = FIELD_DP64(msk, SDHC_CAPAB, ASYNC_INT, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, SLOT_TYPE);
-        if (val) {
-            error_setg(errp, "slot-type not supported");
-            return;
-        }
         trace_sdhci_capareg("slot type", val);
         msk = FIELD_DP64(msk, SDHC_CAPAB, SLOT_TYPE, 0);
 
-- 
2.7.4


