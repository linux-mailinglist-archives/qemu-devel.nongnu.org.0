Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BD32121C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:38:46 +0100 (CET)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6jt-00012o-8e
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OI-0004r8-Ee; Mon, 22 Feb 2021 03:16:26 -0500
Received: from mail-eopbgr750055.outbound.protection.outlook.com
 ([40.107.75.55]:12871 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OE-0001pL-N3; Mon, 22 Feb 2021 03:16:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjSWPUoiOjnEnWP3Q72L8z4ppS/LAaDW8bYjz+BTNCKVOf0v2F1/ySvK9g4eqgdkBO1C5wBNHca5Rbprs2rmSocKZ4lQGFNOyQDnSUHw4djJp8TvebkFEDNKwLok+CxWGL42t75YQf1gBsNRG+Mrxiwp/WdlpzR2iVdNJRIrdLQrS9ZmAZ+HFLiHcH4sWl3HYF8h2HbOrTc5vXF3t8w+r5toPaRCm/FlORDBwOV+KUXkVisj5Eygd7fX7GFJ3isCDGxyMQZR75ggxBPFrSAwbvcVKDKynVW/jpnh23dokw2z9TxFzDizwkuisL4hLtiTjfcgqiZIaHT0eiLmTtBNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKSIYvISE4ty4kmLpUX8iLRfjf6XZh4BybAMEcaMb7U=;
 b=eK1BOg9NdZ8o7RBjOMQarkaNITRJx4/dPKRYTI9zlvoY3qhk6mBGw2m1rddAG4PaCNsEN3g+Sg+4FVA5pJ9JaTdd+nUevbo4BRzjM1sE1mMnioDfPKwkceK4hQZoEdOp6gbpi4HzxTiRAbWOoqT0dhbCxf+YZIPMXW/znsBuWQoDK3bDZdIOGoW7zX6/xkurt/qAP9wIgU4m9EaiX6GXTWE9htcCPXooqbw6fo89LSZys3gB+L89G0jeQV7gfCuhB8XR/CWEt0awFMBwDlxyQL3fyVbjrtYaMQCZY8twlXKxpsF/e3vc1CxO4nYGIWHKg2zb8LwAIiFOzSs0kIY7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKSIYvISE4ty4kmLpUX8iLRfjf6XZh4BybAMEcaMb7U=;
 b=pabv0foL0UVP343jpwQ2KKia7YUMzAcfYl/xecIJvlslUZkZ1j+VRCSwSf1p2Se8GIrflWi912vVBzllbDX09/HJDnFQ/N9K9PbKBdLpu4nqNLm5PJF61whzdAxsr737RXF4rRcUKrQJ8zko3Yx8pD04wGgjrH8tDu5ySkdKBeI=
Received: from CY4PR18CA0057.namprd18.prod.outlook.com (2603:10b6:903:13f::19)
 by BYAPR02MB5496.namprd02.prod.outlook.com (2603:10b6:a03:a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:19 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::46) by CY4PR18CA0057.outlook.office365.com
 (2603:10b6:903:13f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:18 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59052 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-0004MB-FG; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 151F313C0AD2; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 14/22] sd: emmc: Add support for emmc erase
Date: Mon, 22 Feb 2021 13:50:31 +0530
Message-ID: <1613982039-13861-15-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a744dd-7a9e-44bb-67ef-08d8d70a21c5
X-MS-TrafficTypeDiagnostic: BYAPR02MB5496:
X-Microsoft-Antispam-PRVS: <BYAPR02MB549686D6E17BA7D6C38D7DBFCA819@BYAPR02MB5496.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qugq3myo1g4CIDVorBYHQ8l7gY15V2jvfTpHbNIczuiaVk3+j7a9Vi2Y+QiAjVTv9onb0/RWSpVSpg5Ua3VhzFsT4Zm8kxqH1Jku5FsqCkDdjYSsjsPNe63JTSrg4dADL8QVs1MO2Yui3NOuE+2Ojl4QfkFZdMjnAv1zanbX1fgx3eOP/sxA5Xye0rT1iTHujpjOHRAZlw6rWxE6EN5YUTKBnsyz/XKWv7IWHpqgCt3qXrR0w3IMcK8D+Sj322g9Ua8G6fuWFug8LsXuGBCh1i+GmmVnoQWSruRPmXuDQkJ2RGgSIqnjQCpCVreeu7/zfDY+qkdGcnLdV9PbYowgPeILZ+ilmws+BhtSX2Z7J7LXfEwJkM3HhF6RNWYzPY35ub94gPncRYcjXsNsfyX49cHW8lxMPvxhgvsC+YvejUcckzp+9gNNXZbgKZ9r04IJXnukjE1lr4FBWBYfobbBimYJAzWSffDEnbiP+d3VJL7dT4aG8l9naFpfIkmXPciVuMIb7G64mg6i3oV3fVlfsvf00srL3zSNBPc2kQG25TIQeh6Oo2guGUASm+8EIwgNhQxqKUvPaycJGNrU/EdxFakehYOQ5/F8fYtSIBCBdVWogJ/I40iqHxgoXx05bmr8WpwD7+rBEa1mwsWS8RESz1cjSyRZscUKdwLG7nMynutDbEVIB+cO83GFn1moZrB/m7ypoz3hR9sJQjiMiX0+dQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(36840700001)(46966006)(6666004)(36756003)(921005)(47076005)(4326008)(7416002)(107886003)(42186006)(316002)(82740400003)(5660300002)(4744005)(186003)(426003)(478600001)(2616005)(336012)(26005)(6266002)(7636003)(110136005)(70586007)(83380400001)(8936002)(82310400003)(8676002)(36906005)(2906002)(356005)(54906003)(70206006)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:18.8535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a744dd-7a9e-44bb-67ef-08d8d70a21c5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5496
Received-SPF: pass client-ip=40.107.75.55; envelope-from=saipava@xilinx.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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

Add CMD35 and CMD36 which sets the erase start and end.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index df82b61..6d2ef2b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1544,6 +1544,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Erase commands (Class 5) */
     case 32:    /* CMD32:  ERASE_WR_BLK_START */
+    case 35:    /* CMD35:  ERASE_GROUP_START */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_start = req.arg;
@@ -1555,6 +1556,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 33:    /* CMD33:  ERASE_WR_BLK_END */
+    case 36:    /* CMD36:  ERASE_GROUP_END */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_end = req.arg;
-- 
2.7.4


