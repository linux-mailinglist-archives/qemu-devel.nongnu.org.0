Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50193327422
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:32:37 +0100 (CET)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRnw-0002JU-66
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkz-0008Tm-L3; Sun, 28 Feb 2021 14:29:33 -0500
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85]:62369 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkt-00039L-Bc; Sun, 28 Feb 2021 14:29:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I02gLvEmjJoaypxlAK6lkK5b8Vb27tkBsZSGzDDaEpdLLlLTQafkge1aPvMNTnGCmvwxAN7p3xQl/nXkg3SjRlUrcyBd9S+zJa8mkK9lJH1hXWt1BkWjG9L3uIFh3EO3lPNIKNgiLDNfj4FPuMJ5qhSLo+XYE+OJGtGph4hgydd44XfeJiSO1AP6pvBN2TF2KDKo2Ym37vo0nUOXJWxfpMHlEfBort/iJomQmRrDMFZHJUcJhnAIwEgg7JMhqhvcP7ikAK7RCBdJtE+OJiQT9HgM8NshsVMsUle/7hrlTbJZ6wvqgSAezdoW1yQh6TEe0VbGswRyl0HNZh4RYViV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49822Fx4kiWHj6GdrggARoggno8Z+Qc9mfLCL8CMIqE=;
 b=Z1DGo9iEIZWvwgnjehJqwaJKhNl/SGZtmjznCTl6OdPpAK6/NelijR0GjQM5l6uznGrGaOrd9yCvrXvFmteaZv/37uN8DjjjWB/tBxeSZIUh0X/bEgaNFzgboiw8jw9lCvxNP3MVrtJe5xX4/xgoTYSzBs58SklrIr8Weya8FaAGa8t73F9q2BjIw66tPzRrVPYNJX/o2wP1xke07T2t+Vn0rBdaEdrJdQXDpoZImrQ5ku9jgzmvaT7oy9Cz82p/jqgf+/FzGxTjzHol7WVTneUfkG/xVtOuK5zgTNyV+rm90MtiYE0hZ73AwCmKTDx2Q2S/PcF7qIDR8HADFziXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49822Fx4kiWHj6GdrggARoggno8Z+Qc9mfLCL8CMIqE=;
 b=J5wU43lkvCAC6VFxtCwpK79x6THd2qBQuxA+ti/Qx/8tZHl9Jscw3SdblAlL4dBwqsnx1wmteH2GBNx5CW97s7G44mVcNQY4UHZearneEphSDOs6hq+x4soH7mT2mZmw2Akeuixh5GhT0h1j2bMWxcA/Na3SEa43F5HjgZTasQQ=
Received: from CY4PR20CA0027.namprd20.prod.outlook.com (2603:10b6:903:cb::13)
 by DM6PR02MB4092.namprd02.prod.outlook.com (2603:10b6:5:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sun, 28 Feb
 2021 19:29:23 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:cb:cafe::dc) by CY4PR20CA0027.outlook.office365.com
 (2603:10b6:903:cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57766 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0008Aw-EV; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 7580513C06CA; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 07/21] sd: sdmmc-internal: Add command string for
 SEND_OP_CMD
Date: Mon, 1 Mar 2021 01:03:13 +0530
Message-ID: <1614540807-30686-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 548b0814-7f4c-4cde-6c16-08d8dc1f26ec
X-MS-TrafficTypeDiagnostic: DM6PR02MB4092:
X-Microsoft-Antispam-PRVS: <DM6PR02MB40920CF643109FF92AC78AC6CA9B9@DM6PR02MB4092.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EU/iL1vnlz2+jXQ/Zl9uvtsjrM1YiwV4oSbs2RGl44VJHLuQTXRRTOdlv1YNbS+nqYfviMvNoNxijPwlXrCyLc9411MLE2yMLTSrgxZyWqoM728k17SIKtZO+YV4CzhTwxqfJIpV8tqPgEMOU9rwSBM5ty28hi5WOrNRwhGNrX+GqJYDoE3namBb9tuabmMMeTR6TMaDcNsP771JvKKA74Qq0eEzmoIBK5/BbbM8Z6ON2y+z/j0/RcmXL4U/YU9iTpa8mgjG3Ef2jLCIWpxraJg+s5G+C61d2lYaM7nklatHMAyWkee/RIifFuOwDC9AE9dLtwU0/vLnKveYHKY0KPqPHz93W4Mu/F72B4ljNn/1iLGcKxZyeh6V4H3r/na9tD8cnP8SOoIjIM95Tg8dr7pXgf4LIHdTwRuo6NTWqV5+8Uruz4sDFShA0pNszfyrqVbYHru1gF1hm5+tZ1TR2pv6+V8wXt6BgqBU/ywnG9bU9v7VmrvA4Kt6ogpGHnCQiZ9CrJoc9YNYF3OxWYNlZCokaeIOdM056LJ5qjGy5axrk/asyASovGCPdTtisi8Y/mFGniukc3NuYQH+snBTC0UWDSQU2cDU4akRn60v13jvYQ7uj+NBsD5Ipz+g+Q0L60440+cJd6lhWcuiOCIVitxloSodzhSr1MPqAN0vSxElNZRJAtx0AuR5jr+PFg3Vf+aL6l89b31bOeiBVd9Aag==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(36840700001)(46966006)(356005)(316002)(70586007)(36906005)(42186006)(426003)(7416002)(4744005)(478600001)(921005)(2616005)(186003)(83380400001)(7636003)(2906002)(336012)(70206006)(82740400003)(26005)(6266002)(36756003)(8676002)(36860700001)(47076005)(107886003)(6666004)(54906003)(5660300002)(8936002)(4326008)(66574015)(110136005)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:22.7420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548b0814-7f4c-4cde-6c16-08d8dc1f26ec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4092
Received-SPF: pass client-ip=40.107.220.85; envelope-from=saipava@xilinx.com;
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This adds extra info to trace log.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sdmmc-internal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdmmc-internal.c b/hw/sd/sdmmc-internal.c
index 2053def..8648a78 100644
--- a/hw/sd/sdmmc-internal.c
+++ b/hw/sd/sdmmc-internal.c
@@ -14,7 +14,7 @@
 const char *sd_cmd_name(uint8_t cmd)
 {
     static const char *cmd_abbrev[SDMMC_CMD_MAX] = {
-         [0]    = "GO_IDLE_STATE",
+         [0]    = "GO_IDLE_STATE",           [1]    = "SEND_OP_CMD",
          [2]    = "ALL_SEND_CID",            [3]    = "SEND_RELATIVE_ADDR",
          [4]    = "SET_DSR",                 [5]    = "IO_SEND_OP_COND",
          [6]    = "SWITCH_FUNC",             [7]    = "SELECT/DESELECT_CARD",
-- 
2.7.4


