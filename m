Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F8327433
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:41:00 +0100 (CET)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRw3-0006HD-2I
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl7-00008j-Gm; Sun, 28 Feb 2021 14:29:41 -0500
Received: from mail-eopbgr770072.outbound.protection.outlook.com
 ([40.107.77.72]:57574 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003Am-U5; Sun, 28 Feb 2021 14:29:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV5FgiqYL9jVyIgela7BzVJpxfcnDuWeWTqiQMLMZaOS8IBPcd/+XGyKFpNeXD4ByX+3iM/8qmPMnGcnUnONcEB9dRDod3WfzBCZKSMt52/L/clOUaqoswYXMMRY1+heDYu7T1GBfaCKX/zRz7tcxCkbT//KEdsEMS3YTBwFvl4hKdAwM89eqcWdFGslmdz0AFDuaH3CXZIGwNspK5JzLzbEepMJPyg/98TONmPD+HYtcdt2tbKdRm+Tt7j7yFx90V4I+EWujgpC9n6eOH6Kl+4xBdLIP4FfuAHTTDHJQurvTrg07qiqcjQwI6i/H/YsSsZAfI5IL83zW0jiuZa01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/kLlHt3sNvFRKoBrjTykrarDocZp5C7m6n7LZo4pfU=;
 b=oXo6lCp8pkoKj368zOr5hdWtZIDUzzk3ozIP6QI8tHkUrJLjfVlZKftqS5BfZKrrW+yJta0O0NFqy0aZluNkoHZ+nENBUnHtDL+s9x6XoWezrNdBsEIKiRdcpLyJtzHmuL6p8M+JaupcTrPuqwnf9tCcyf6gGoUsC6tkJXTaCoCraXR8dkgGgb7tmOQXmkD2bvTp2IM9ZnNhPbxhIlMqGAqqKivXDWgYwVClOkpKanhZ/Xu7ULPWAzWgxhdMEiy3J7q5JU4gNP8w/tjpLEPjFdsnuJxAj/AsZD1xz/dnWM78/V5Biiv9NStO+wl1U//4ieisTsF+stdjo8YJnbV6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/kLlHt3sNvFRKoBrjTykrarDocZp5C7m6n7LZo4pfU=;
 b=YF4u9cIBCWR0s94uJkCHp5SmyAiyDm2ivIUTpmtd2ZSldaCnp6zsssZGBhzFPs0CqVrBxJB+im+qeu+lqg8CUOeY15S+1gJ2zF7xygmf4r66YqwoBXNvrnYpo1Vz0RSpo3JqUZIpyAmOYXM0jXzgZZSoPLjb6dui/T/4XIqhCmg=
Received: from CY4PR13CA0077.namprd13.prod.outlook.com (2603:10b6:903:152::15)
 by MN2PR02MB6336.namprd02.prod.outlook.com (2603:10b6:208:1b8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sun, 28 Feb
 2021 19:29:26 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::6c) by CY4PR13CA0077.outlook.office365.com
 (2603:10b6:903:152::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:25 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57774 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0008Ay-4b; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id E573D13C0B03; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 21/21] docs: arm: xlnx-versal-virt: Add eMMC support
 documentation
Date: Mon, 1 Mar 2021 01:03:27 +0530
Message-ID: <1614540807-30686-22-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e424894-085d-41ec-f7e5-08d8dc1f28d7
X-MS-TrafficTypeDiagnostic: MN2PR02MB6336:
X-Microsoft-Antispam-PRVS: <MN2PR02MB63365D318879F089F936A516CA9B9@MN2PR02MB6336.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22k6jLLmEdpaKGXA+E1zokMacJHOkyCa+pWB6WWCdUHxwZar7ixqalPZQfodoD2hM6kHKHIjkiGE2PZI/utmCPftRRYyoWBQ5Z81eM+L4UMtikTD+HNb/lo6IA2iWAR7iuWazmqEpwqVfg/HzHhoIMndQD66B5pPnVKI0Pm5abbFT7M6OGHirAsgqG02OZNZlmDxtxKoWYdOn15cK0vX9Fuw7Wdq8bW1pNdbV4fTXjaFBNIAJGQnMLpz33YyHHEicCDE6j/6oMIyQ9axbGXZAP1Q9MYM3XGpHSCC4gqNXp1EyoFsgswJtxKsaUY1nU0zmJxIGzHV0qqg4sUWOuXQeayhU87T/QlHtZgW3UwkE74Ucdcr3fYwPqQgn0MNHBIGENigGQKz3GHUAONG2mIksR7VQCeEuacfZkoaX+cqnlrvv/9Fyi1k0P09tOZhSNk4kuoOHMSpdZy6QEc3H3UprE3JEubXVEoEohLi1tHa3V104uroZsuGGcVxHt/vLpu+F1v706NbmSyINLBrZhnI4JgvlmgE33NY/+SPpWRzQnGbdmEkpzbKSiGhQEmw2jan+49YJy4/gJ/6VwGKOSp9BETfrPlhB/kHXJzZxhtkiO+x/G9wa41etQlvhznhMeF24wpHa0LHc9PFRLL8ZbTr09vV+hhRVV/mLjG71bRKDPge1BKpcCWyMtjRyf0a2zbXFry9oTBAETtoFTquwPmHAQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(36840700001)(46966006)(7636003)(921005)(36906005)(8676002)(316002)(4326008)(2616005)(7416002)(36860700001)(5660300002)(6666004)(36756003)(478600001)(8936002)(110136005)(42186006)(82310400003)(107886003)(83380400001)(82740400003)(70586007)(426003)(26005)(356005)(47076005)(70206006)(54906003)(2906002)(336012)(186003)(6266002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:25.9644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e424894-085d-41ec-f7e5-08d8dc1f28d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6336
Received-SPF: pass client-ip=40.107.77.72; envelope-from=saipava@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Add details of eMMC specific machine property and example for passing
eMMC device.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 docs/system/arm/xlnx-versal-virt.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 2602d0f..d1099fa 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -29,6 +29,7 @@ Implemented devices:
 - 2 GEMs (Cadence MACB Ethernet MACs)
 - 8 ADMA (Xilinx zDMA) channels
 - 2 SD Controllers
+    * SDHCI0 can be configured as eMMC
 - OCM (256KB of On Chip Memory)
 - DDR memory
 
@@ -43,6 +44,19 @@ Other differences between the hardware and the QEMU model:
 - QEMU provides 8 virtio-mmio virtio transports; these start at
   address ``0xa0000000`` and have IRQs from 111 and upwards.
 
+Enabling eMMC
+"""""""""""""
+In order to enable eMMC pass the following machine property "emmc=on".
+ex:
+    "-M xlnx-versal-virt,emmc=on"
+
+Above switch would configure SDHCI0 to accept eMMC. More details on eMMC
+emulation can be found in docs/devel/emmc.txt.
+
+Below is the command to pass eMMC device.
+    "-drive file=emmc.img,if=none,id=emmc,format=raw
+     -device emmc,drive=emmc,id=emmc0,bus=/sdhci0/sd-bus"
+
 Running
 """""""
 If the user provides an Operating System to be loaded, we expect users
-- 
2.7.4


