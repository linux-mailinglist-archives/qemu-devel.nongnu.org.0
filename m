Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DE321222
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:40:26 +0100 (CET)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6lV-0004Jl-5W
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OK-0004tm-77; Mon, 22 Feb 2021 03:16:28 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com
 ([40.107.92.51]:31105 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OF-0001pm-BH; Mon, 22 Feb 2021 03:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh8FM64DA/OVn/3sAA1FnbOGvo86L4lQcxR1dcnuFlB7YbCgYmafoyraXa2ZOCMF8tBbqc366DeypfwAplQflwkOTzgEpNudKZ+az5DYPgGUcRl+V06qVjRcZzFsgDPa6mQeLsIWyrX/U4cguqFNJ7yhMPuJ7pxmwqswTnKJn6a1Cv9YXXx5bkcrd2vQteE5rqBueFsvT/VnRwcSEkUxe9U8g69XdH93oznzCXZRhld6QoTmNOpFukergGfjOunSW8hBcr0Fy1NepYBoMv33oCRuB1cfqe1ske3kU0OIQNtrO/VeRtU+z1A01SFi4Py3E4RuOarN1uGeIrm1E0W+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=gNNnayDBB07Kp2xFIcy99cqQuEr+8X7SaKr7XJGYEI86tK3gvv18FHS12lvY+++ofdOhqMAybH32Kpxtltyv5AKO08auphjTRRIn+5umBNHRAxuZSoJwGHkJINq2znzVARnju0Wq7cj599gmxim5WUoYQpSo63CAt7OCylBmSVFmRaj4KohC4qEg+oHAjgw5vStYUItXiYvLF37d1IF2N4/rItXJ2b3I1B2ibPt0Zeg4lTqaJMNRw4jLai1Mwm2T32Ij+OyhUR+UuFkqAC1NHEiTQ1l6b7cyVrf/MwXn7sPuuPkOUUo/3JsXiozcmLLTX6rRBUpDebhlBCSE2V0jNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwNf6MLkBbcRRneJqO0oqOP0h3ttUCTSUQYQ7jo9xQ0=;
 b=XZMydvFXoPcQ2JhBlgUPlott/4tum87YQK+/4OsTNc7bZTMvp4xIudj4FaimLbgB3e8GkPr5oOOOSkejRA4aTlbYWN8Fuvwui8vxHjuy13LGm0lby5PswFZDJg2uGjwUMKGNl4dVbqshN+wXA7ufKLT1+72yYqUe84iyimiIasM=
Received: from CY4PR18CA0051.namprd18.prod.outlook.com (2603:10b6:903:13f::13)
 by MWHPR02MB3343.namprd02.prod.outlook.com (2603:10b6:301:63::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 22 Feb
 2021 08:16:19 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::6f) by CY4PR18CA0051.outlook.office365.com
 (2603:10b6:903:13f::13) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59042 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-0004M5-L7; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 3A6B013C0AE4; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 19/22] sd: sdhci: Support eMMC devices
Date: Mon, 22 Feb 2021 13:50:36 +0530
Message-ID: <1613982039-13861-20-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08bf68c7-65cd-48ac-b734-08d8d70a220b
X-MS-TrafficTypeDiagnostic: MWHPR02MB3343:
X-Microsoft-Antispam-PRVS: <MWHPR02MB33433D7BDDD7D712F5CCCCF2CA819@MWHPR02MB3343.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQjlqCGm4eowEriMNxeTv3I9SmULBQSzPB5JZTE57mG6WUjGdfF6NahotsIh+lpOqhcQRSS5LRjcqFHv7wvMfa6oqWR/wgsDPy+CwpaSklEADy5W8j3ShOuD+6tqeszkvitxJag9vFe3mAfJet/WE+5zfTCXNNQohSW40K0XSBnr9kxVkSykgbaqLPQvOiTXERHwshQkFu4qBT5rtPfOBifTkEeiOxJL7qfVAkUCt9KFY5+8zGds+bKO8Cc50KNKW/kz0VSJa3d8l3PHlWCoL0hexPVW4Zs/t1JEv1cNbTPolSDXLHzBbSW/gFvsphJVHotQ/AuhA+QJsxcVvOIw6M6z8qfK6ibRwm7sXv++hOQ9reJ8a4or3k2na6N7NwxnvwJdoGNw5YQAqNbjzxQI44im5c/tiDHbGAD82PTTe7jjqLQK70VVCI5WcFMJ6mTOjp6RGZlzH1VEvMkgX/sr5hxPBNDfAuoCDW70UhsWEse6sRodsgHAk2uBufxosrwAhSJh5G1Y71w2sVv7QDUu1/RDVcHBphnb22CmHHlglubU71EZTxRyQLDMDqBPwlg7aQE1OhGWwohgH7/AvMv6ecjB6ymskS6T1W6IWodhvrDmkvSkXsWFleISs6/ph9wYjKAQaxZWXdzaWGvkntQ03Uaa6rr2mUlIZwLlNOmNrx22ofvKxC6QyHPwYiiwvAryjiMywMo1ddEZUcw03/4S/w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(36840700001)(46966006)(336012)(478600001)(8936002)(7636003)(4326008)(426003)(82740400003)(186003)(5660300002)(4744005)(82310400003)(2616005)(54906003)(6666004)(8676002)(26005)(316002)(36906005)(7416002)(921005)(2906002)(36860700001)(356005)(70586007)(70206006)(36756003)(6266002)(42186006)(83380400001)(47076005)(110136005)(107886003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:19.3143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bf68c7-65cd-48ac-b734-08d8d70a220b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3343
Received-SPF: pass client-ip=40.107.92.51; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


