Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6F31863D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:21:54 +0100 (CET)
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7EX-0002Kc-QN
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA762-0002lx-CF; Thu, 11 Feb 2021 03:13:06 -0500
Received: from mail-dm6nam08on2076.outbound.protection.outlook.com
 ([40.107.102.76]:7137 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75z-0004Zz-CL; Thu, 11 Feb 2021 03:13:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS48Jtm0hN2E9oQkijzMcK63kNnc7RWbDX94/SIUAFW6cF98zEawepe4nZ5SASCWETbS1CFD1S+gPn8OKIcty+cAFlcWEg34ZGb+u7rnKnhCrVkFmeNXfOOnXiowjhxUKcSeKpZlGRf/zHs1Mhp/J/WBM3zd7565/GUjoPHSvoYUEBoOrpBlMYNfw2J+WOEn//ttq7nBvmCXLMLcBHPKmsKR50tkOxkJm0lhMCNy8VAFuhFROT+6vZ94sLL3hixvbuyiCOyoeRtnq6tnxIXBbkXb/Myw6DjSLpHM8qCF+SK4WeXFMLmHZUCL4VP1CSCOdnYgUS7umkYWqlowZuQAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nSCq4vZoR6UEJmvCLlEkfDmJT650EGVvrhw6DKpmy8=;
 b=A3qEF/ukkhsdbBO6+0Aw8UfgxXLRBZ3yYVj5G2CRCHtMmhrFHZZsRa+A4hUvoNDc/GW/gB1q19n09ED/tNmjC/PKCFCebi1tgO7SCbNKPFD6jmsv8z6Xya/CoftnKs8fBVdgitn6OOprAuTbwz0wRUTDwK0e66zY6WNPaHO2Wiq3HdNJy/hRXm3TLMj5uiqDvKXxLtQwe+VvPogPsPWEataP7URQcYeLiajKDEMA2cetSXjQ+WvOOnnOSc1qLRzH3nsVsWPDKvaB+w/QjHXeRwlz+gbYM8XlZgqzMEJKS3t0vQG3yeufl+UAmbYAaLjIbFG/EI57y86VnbCye3XHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nSCq4vZoR6UEJmvCLlEkfDmJT650EGVvrhw6DKpmy8=;
 b=Z+A27ftHPfv1Bn0WM4BcpkzsHdfRkgnhs51/7277L2Ho3hP0Qd/RPZGZPVy3Me4dOdrKKDpGf8sOuD0Kt84HLglsTuM5vBSm+m2gV66EnPM1l/scaspw7gvd3FJQ46XZytiItK1N6CYnJA0xN0KyAMlj8e/2yeT3EQkX2s+Q63M=
Received: from MN2PR15CA0020.namprd15.prod.outlook.com (2603:10b6:208:1b4::33)
 by DM5PR02MB2601.namprd02.prod.outlook.com (2603:10b6:3:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Thu, 11 Feb
 2021 08:12:55 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1b4:cafe::8d) by MN2PR15CA0020.outlook.office365.com
 (2603:10b6:208:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:55 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:53 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:53 -0800
Received: from [10.140.6.35] (port=49680 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75p-0000HA-1y; Thu, 11 Feb 2021 00:12:53 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 97B5E13C0653; Thu, 11 Feb 2021 13:48:15 +0530 (IST)
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
Subject: [RFC PATCH 09/15] sd: emmc: Add support for emmc erase
Date: Thu, 11 Feb 2021 13:47:20 +0530
Message-ID: <1613031446-22154-10-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c3441d-664e-4ecf-a07b-08d8ce64d607
X-MS-TrafficTypeDiagnostic: DM5PR02MB2601:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2601BDCC3EAFF492AF8B5142CA8C9@DM5PR02MB2601.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+/goeABbUXFCzFBz3EAjDAOEL/Ra0w0SlEt98iwSGhjKws4uucXfzehJDkcgzpL4nvgTbagJga+dWl+Ru1EaNw3+yx0rhTp8fQU9kNxdLqRZ8qcQ7ByyIQi1yY2dydLbyhBHOqvE9O9qYSo+NbAHsRa9hHYwFvW0eaD+jsC2vKiEGRNQ+r1CETxUabo5JlFK1h6ewnGIIT+ErxS72ShCz/f6S8kd11YF3HYbFYhfyzGeGbDV8+1DUoX3H6ah7mAUIzNkY48sVEUGxEl4uIN8nQ5h58PTBMUxWcPjN4GdvGA62ZK09ZdJuPyXD15oxOa7cVYAxOlVI2wRz5rAAk0qssAu8g9YkOXzX+xnCFglQx1LDtL1of+lwkYpd/nWihUKy/ErX8n7RnJO6Ne3HyLL145BPjWKWoqo5xeOwoc2l6X5ehAYQpQujV+094m8XDCj+QopoHdWtIyYCaKsr7F9L2QJjUAL3jb7p5iDyBjVMcOpmk+yuAXJxgm+ou4tfxRCyeMDaWgHXpyV8oLStdfA79TkoG0piV3nRY6aTdi0YH0SoOTcJMApwQ78MpqmJ8HFC6OSzDNcLrRFD0odJTCdQhvpOXWsp+Ji3mM+KgLXZ3WZu14dchgEkZB5xdWTMIPjSBYqnws1DiAdWUWp088hFTAWtDMaCwe7RWLXNsShz9IwkxW2WSUPMz59ADrl2Ek2RlPJU7Xmh6zUidwg6mN/Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(107886003)(42186006)(4744005)(26005)(316002)(6266002)(8936002)(54906003)(36906005)(2616005)(7416002)(426003)(336012)(186003)(8676002)(6666004)(2906002)(4326008)(5660300002)(110136005)(70586007)(70206006)(36756003)(82740400003)(921005)(7636003)(47076005)(478600001)(82310400003)(83380400001)(36860700001)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:55.4381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c3441d-664e-4ecf-a07b-08d8ce64d607
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2601
Received-SPF: pass client-ip=40.107.102.76; envelope-from=saipava@xilinx.com;
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

Add CMD35 and CMD36 which sets the erase start and end.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 236f2b8..7aab647 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1544,6 +1544,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Erase commands (Class 5) */
     case 32:	/* CMD32:  ERASE_WR_BLK_START */
+    case 35:
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_start = req.arg;
@@ -1555,6 +1556,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 33:	/* CMD33:  ERASE_WR_BLK_END */
+    case 36:
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_end = req.arg;
-- 
2.7.4


