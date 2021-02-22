Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C13211E9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:24:05 +0100 (CET)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Vg-0005GR-Eg
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O8-0004Yx-GQ; Mon, 22 Feb 2021 03:16:16 -0500
Received: from mail-eopbgr770055.outbound.protection.outlook.com
 ([40.107.77.55]:6233 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O5-0001km-BB; Mon, 22 Feb 2021 03:16:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHG4Sns00HnIzsvch6dAjZwuDdZWJYXMi/XzDuLS9K2m5wvhA8Rcx0SGS3d/RsEeLNidp/CXOKwEjQARXZqZwB6RD5T1LgPy/UbLBUUQsMFDJpOmd4WMuX1IVd+bpDCCivcU+VyP+JHobayrCI5o0x+/jol+yOg8K7DiliewwwqWxO8Os66dbqeQo1qdvJBiMwDHGu/4n9qRktMnQ89U9RFXJd4YEf4v4d/f7vps1JCp42c/qtWTSk7Es8Wvob+2kTtdObKp1SLPR/sE3wsH5bVNtK4HyIaINhJazgdSrp7v6BQxAkbQNVFlMflnFW9AeKoMs/9DqSA/dInblUGu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NL0dSWRxPmLCDs88BzOyU1QICg06Ag38KcRR2Wkz0Q=;
 b=Ej5DnsInM1MxVbS68+WMpUw7v5QkwYDB2H9MnqTgo2CgZAWVJDfmtEZCjO466N2APBWWbaotfhBPIVRBdTSh4fmKzj4j8TaZ5LyPg2b513/U5bvB3Bu1deyYh8TT2yuCKStCpEF3IU9xoIMw5KGufImL5ZGKp0njoGAQcttMtFjmeSM37bBgaSVhQCBRgdCizc3y3Zgs8meWO4F2nSo17i4JTHZ5lC81y0Z4LYHnrd/fqkjQF9itQasWQ4O4kIoUKkDyaMvhhQHESjMWp6tpxVj4oFxP2xhnkYhdTZ9uj6hrArR51rnqjYtlA/2f8A+eUwgclf8g7e0O60InEzYIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NL0dSWRxPmLCDs88BzOyU1QICg06Ag38KcRR2Wkz0Q=;
 b=PdGVsiOXpFGRQtbfPOddKEOzyhNg2Zz5t5Zjk1GxW6L77Pvo7UvL4hKaEcgpk+TSRr19/7sSidU2J9HKL9OJaN7wyMUkuRxV2AmBi43QOMvP7+/qxHWO3TozjPk0AEA8P/nVaEIrAgu2h12KDOl9DDQFy+Ldsonvw6T/wfEPlmw=
Received: from SN4PR0501CA0094.namprd05.prod.outlook.com
 (2603:10b6:803:22::32) by BYAPR02MB4805.namprd02.prod.outlook.com
 (2603:10b6:a03:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:10 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::52) by SN4PR0501CA0094.outlook.office365.com
 (2603:10b6:803:22::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:10 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59050 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-0004MA-F2; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 0B49013C09D2; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 13/22] sd: emmc: Make ACMD41 illegal for mmc
Date: Mon, 22 Feb 2021 13:50:30 +0530
Message-ID: <1613982039-13861-14-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b13a9f0-2359-41b6-879e-08d8d70a1c99
X-MS-TrafficTypeDiagnostic: BYAPR02MB4805:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4805E70DE2AFC65705B9652ECA819@BYAPR02MB4805.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOSTh/PyGAlXWhNxn5Qh+hiznFPSVb3cNq8ydCBPcPffmo+DU+HYIYKtcfvBpG8CndBSO+gKEI4z3zvQ1UK0k5CUOFjLagqcza2gm0k0h0LvQIYpy+PHxqu24DibhhVO5Es4VexLxr88J7eK9fVboeqfBxCP3fAEDlNE/mrofK+SVWNvn2lHQDHZvv+qZhS0ImidR1oWNkMH7GZLAt+VXh7bRzMbies+E2knZPZWEURdp38fv1gYuEKD3LsdmirVPzvauZA3Wgl3/dEIUhyGQtyRnoNWWMBjMh9uO3NJbb/ufG+sDZHXg+07tJC+qTQ7RbSh6Sw/aeKzR/qXQ+NJiBzpQpwGF+7VzIJ4lN5pNavjo7NIPRHJ1co+VFViEJ4M4LKBvP19QIri2DTywHhwGF6oEshaRPbOJAdakD0596Ba9gFmmhZXzaopH/HKQscrsnMuLcc7pYW0cNJeAsZ2k7vauk2v/zRDZXYPeIP2XsTWPcEJtQPDmX8il4XmYuo2/c7LSpuE92xj1arxlIlYFYWKBpNXeTKDiiQ6sujsayHGA0O9YaPvy5/CH3hbCmswp35wxHVm/ZIYiZM2zDBCT/qGAzFr60oVqN6ZejThRkF1r8VslcwnDeQaHQBerJ6YQXWr9KVNqrO921+qi0dfb4bMvQsFFpohkXWY40eKsTB+3kL33mZDxuQ7MNC/BXnBtwmzmpPcFLyKVwNh7eCShA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39850400004)(346002)(46966006)(36840700001)(47076005)(82310400003)(110136005)(70206006)(70586007)(6666004)(82740400003)(336012)(54906003)(316002)(26005)(7416002)(36756003)(426003)(2906002)(2616005)(921005)(356005)(36906005)(8936002)(8676002)(42186006)(186003)(4326008)(478600001)(6266002)(4744005)(5660300002)(107886003)(36860700001)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:10.1584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b13a9f0-2359-41b6-879e-08d8d70a1c99
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4805
Received-SPF: pass client-ip=40.107.77.55; envelope-from=saipava@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

ACMD41 is not applicable for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d702027..df82b61 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1729,6 +1729,9 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
 
     case 41:    /* ACMD41: SD_APP_OP_COND */
+        if (sd->emmc) {
+            break;
+        }
         if (sd->spi) {
             /* SEND_OP_CMD */
             sd->state = sd_transfer_state;
-- 
2.7.4


