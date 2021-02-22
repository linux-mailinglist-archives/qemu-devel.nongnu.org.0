Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E13211F3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:25:42 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6XF-0007wn-Ar
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O7-0004Yo-SI; Mon, 22 Feb 2021 03:16:16 -0500
Received: from mail-bn8nam12on2062.outbound.protection.outlook.com
 ([40.107.237.62]:38209 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O4-0001kH-LY; Mon, 22 Feb 2021 03:16:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSoNUjYp4y/dUC4rOdEqCZwFzPUH98iMiP2OcnhFF4UHrRyDeVHIN2yOFTMgo4EWAZZ8pMpTZR6KtAQfPeMpYXGnBWn5fIovtXiWnTvDOlnV4XeDpQUuodbU3LH9NACeTqfJ+oNrPaHEMJiG6tgohWuzCveYia19D+C2stwH8tSJIYvdsA7BtcdNJ48fJpyFLLBecqHzOLEvVv/nENX0xWPy45MxF0IfRLAGA3c+31V8UYvkJD/NNagAirXgTomEHNCOwNjhQjb9zc4UwJ3nhc3lhFm5hT0PCh3W8bdKWrsI5BU7693XtodKlXXoI+J5iM5Rv3g9D8dnanVlOaJyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49822Fx4kiWHj6GdrggARoggno8Z+Qc9mfLCL8CMIqE=;
 b=B8nQ+QqETbDvMDtr9mLY4NUCLHZwjgUtlZJxAcpDE4hfRqp1KaZR0BKI0/tx0NWcM/fQ2YvlX1P5EyvuVN9wQf/xWrfsGXY1tn5Jk1d/09eNFx+GKm4kD2Vcnn/izceJ+QEuUm7hwFyMMjcMgx1rOcOeB+0bR9QD5/X8dSVyaIAY7UTqGNm7M8B97Q3CvqQW559+zvaoBK7pKq0ExV9vMRBxvhHHs6ro+ocSL8odDEDi3cY1nDf9NUaThaiJiF2gvPIO2Gu7APB29bXk4+PPpoxUx0X+nZJwyw7NKd1zXzUnUdo/rgja9KN3+42LS2EKFZOSY/R0efk47UngjlcObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49822Fx4kiWHj6GdrggARoggno8Z+Qc9mfLCL8CMIqE=;
 b=ppv1NjHYD0ADqZ8jSjK9GkI6yenprl3CRskeYh79vrcjL3/0dx0t1aLcJ8lzRTeOwXmJMdffAHXrJjdris4I9WykF1f1csyGqfx5d5Ki2y0LtcYSkNzilMk/QCnADOlfIEwFbhwSHLeaZSlaOo0G7aDZucrlxjjhWDZyxN7Y1wI=
Received: from SN4PR0501CA0081.namprd05.prod.outlook.com
 (2603:10b6:803:22::19) by SJ0PR02MB7615.namprd02.prod.outlook.com
 (2603:10b6:a03:31b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Mon, 22 Feb
 2021 08:16:09 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::97) by SN4PR0501CA0081.outlook.office365.com
 (2603:10b6:803:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59038 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-000370-U9; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id D4D6F13C0A6E; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 07/22] sd: sdmmc-internal: Add command string for
 SEND_OP_CMD
Date: Mon, 22 Feb 2021 13:50:24 +0530
Message-ID: <1613982039-13861-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb0a9fe-6e43-4b21-4e92-08d8d70a1c49
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7615:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7615BC20F89FA99EB64EE782CA819@SJ0PR02MB7615.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tObXqHQv2qEkAy9pH1sCudHwCaqg35C2aojUxyxlKtUAXOAMDPbls8LrwgDjiRANd8Fxx/hqNvTUY8q5DmL2Gw5AviVJIiPYFdu/he7dCzrNj1C1NwJD5dJFLCHEHnBE4YcoIXKYrC1eou85D4Qlvn39vee6ARVImuchm0lUxp2iAvSIqY7lpzoILqBisbWnYUZm/2IyFWlZ0hl4Haima2J2ugJvMHumdStFnA4bjfiU/1kpoYIov2759GdDbunzJDUJrhDr8IHAjOL9DUy7BazxTQaSIpBDysBbnEgqFpoC8bNLdNcLHoG2agL/teZfj95iuHsfWd00NP7Rg/6Bae11kmbtUwiFhl1t1miGrfrc/fhzjd2WUTaXA0QETcyW/A9rmT+XOe5FAyJk58uIjQCZiiJ9lf2VlU1+k/IPAp0TcxGToQGIZLNvMHTQiFT1QDkKdu9m1SfTRbfaYkFI4C8oPj95Cg6vI+rBZ/LsTGaQkES40reUErFMREzNvwtUK3qlWCxmL6xe49TICk6hTAZY4oLXP6BGAfWCrM030bYgGX2xiTzeXqQn1KmBwnAKYER6DrGPdboFXIP5JAoDwWDUcLnOsOnkACAheL9LvKkNTI3yJdZMC9eCl0I11IJnCWebQ4aSPlO8O5flLhxuCBJIJCfUUBID/3YqU2KdsyXPZweZgHatHjJat0MLvtk87onporg327Pqu41XyOOwUA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(46966006)(36840700001)(8676002)(356005)(36906005)(54906003)(921005)(478600001)(316002)(82740400003)(47076005)(6666004)(7636003)(83380400001)(336012)(186003)(4326008)(42186006)(66574015)(8936002)(426003)(26005)(2616005)(110136005)(2906002)(70586007)(70206006)(4744005)(36860700001)(7416002)(82310400003)(5660300002)(107886003)(36756003)(6266002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:09.6326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb0a9fe-6e43-4b21-4e92-08d8d70a1c49
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7615
Received-SPF: pass client-ip=40.107.237.62; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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


