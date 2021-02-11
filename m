Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E331865E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:36:22 +0100 (CET)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7SX-0005Iy-BS
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76P-00033Z-Eo; Thu, 11 Feb 2021 03:13:29 -0500
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com
 ([40.107.93.68]:39904 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76N-0004fj-S0; Thu, 11 Feb 2021 03:13:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0g6Ap+dbzL092h7U90JxXAAz5+ekGUhI63dtbovzhMXNlUDcaLzbz7sUZfubCW3JABIdUPjPv3qt63a80PaSIjUpFGrEzsiuurbyBl0hJmPyrx1U2PAK68wA0FUu5y/QQmJP8ftunUgKmps+IldZC136XdHZtSWhpU3YKiCHENpEX90Arl3yUiZsAm1gfDwPmF6dJhIIXwT//TW2HpW3fcLqiJKyeN7/pCGmyH2lissFUev9J66O3wgj43tQTC8iu9bPuohMui+6Ac60InqoyDOoWroU371G8tmJxCQVQyudb7mVVnpqFq0JZHlpdV06cheHSWIWNeWY9K8saWPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=FpR9AJIfJU+SzZHt5JYBkRqJTEUWZ4wdttD2RZ9j2aMHCXjNoCeo0jRUX20u4KkfWO+XFyrtz5UX9JDOrDdV3PG/bzUpaLTXYKD0oWszs1xnxvv+d+RIe+6u+dZjpAhzjbA1kGWVSFWyFmsO619e5C+Ic1+/WQsYKXAuDYM6LwPkFCTH7CFeqP/opPvUl9UU7+c5NFjbp/bs8hOfVMDF7mykfvxq6JXrX84xcD52QcfDPR2rbKkzTUWkPVgrM7fQ803+OrUVi+7JkgyG+eJVu6pjuCYDk7NOCwlOI7ebq8c4lZNn0uC993zSxbtjh7+qMN4mJbBRxuopwidhdZJShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=tbpXLJrJtf5r6b/V95U8bCaUx1KXT+o/iqSinGy7pD4TsGSKrZz6spsJlhViZsrRr5DXXxPHYnkldsa0BUH4uYdzP3WkGeqMKpRbDp2u3LXkuxS8U4zaoj6FkSqvnZT6xgzNW9R73ct+caJmySiwPVtaJN6vmCXbIwLEf8y2RUw=
Received: from BL0PR02CA0121.namprd02.prod.outlook.com (2603:10b6:208:35::26)
 by BYAPR02MB5704.namprd02.prod.outlook.com (2603:10b6:a03:9c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 08:13:18 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:35:cafe::e) by BL0PR02CA0121.outlook.office365.com
 (2603:10b6:208:35::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:57 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:57 -0800
Received: from [10.140.6.35] (port=49690 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75t-0000HN-Kj; Thu, 11 Feb 2021 00:12:57 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 318F513C063C; Thu, 11 Feb 2021 13:48:20 +0530 (IST)
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
Subject: [RFC PATCH 14/15] sd: sdhci: Support eMMC devices
Date: Thu, 11 Feb 2021 13:47:25 +0530
Message-ID: <1613031446-22154-15-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4b0e87b-4e38-43bb-1067-08d8ce64e3a7
X-MS-TrafficTypeDiagnostic: BYAPR02MB5704:
X-Microsoft-Antispam-PRVS: <BYAPR02MB57045DC9CADE8A95C24A0A31CA8C9@BYAPR02MB5704.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEjzbrmf5oJmGHogfvuHQSnXeEhKJDqsivsmrRZkKlEU2huDvAfNr/PHkA9GdatICcNLtJV7scmlkJrTDxrSWkJzeJD9zZdCJEOXqDWHQz1Xavgbt7KOYzBg3Tbo3bIBBuoR+vk6ohLzKc/bB6INda5De72K/jd5b2ZrRbchJmyib4VtSBltCkfFzMsKzEgfRpzJIea4AXBx0I+o1xsTR1uAam2NmotygeOuZEFcr1k7tljK9j7aAK+ddbsX+dcnfNJrHiMsgUh+o4eH+/TIdctGnOEgbxHZbx2ZTZR2kYkwS8xU95rNKr+Lksf7KQ9GtjJrua+3WiujtA7GNvUfDsit/OujPTn/VezM6wSzfPiLJwkC8CgSl9CG6L44McgID7iwO5nrl6tlw9BUu4oRC1gs71bCgsgD5NHwO6gPsGxBP1lk9+DC4yyiHWTiwStiSaERy394Kfveh0NoIM4UeH/0e0FVPq7ekvrD2PZlc6A5+lq7M0L5G2xYSV+51TT32il9Chp0y+z2AaaSVbMrv2WjEnTOieg6PjOJnjjUqAYn554HqvA4mg4EVuIKBTrzFOBqkVQzH5Qi3uwHgqHf8Dw1noDbc1PHJO9cSC5MmuuLvKOqitLpcqTjA1iU5Rjr3xVCyJq7fPxNMA+L1jOs62+GZDn4XS5M1irTT7Zzmi6fCSl5Dx36Y8Px7wJuI19zMrQNXfSoYEPr14eXDvxkYA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(6266002)(47076005)(4326008)(107886003)(8676002)(2906002)(83380400001)(82310400003)(7416002)(54906003)(356005)(70206006)(921005)(82740400003)(7636003)(110136005)(36860700001)(2616005)(5660300002)(26005)(478600001)(336012)(8936002)(70586007)(36906005)(4744005)(42186006)(186003)(426003)(316002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:18.2924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b0e87b-4e38-43bb-1067-08d8ce64e3a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5704
Received-SPF: pass client-ip=40.107.93.68; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


