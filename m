Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A667E32742F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:38:29 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRtc-0002UG-Lq
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-00007M-OT; Sun, 28 Feb 2021 14:29:39 -0500
Received: from mail-bn7nam10on2056.outbound.protection.outlook.com
 ([40.107.92.56]:13057 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003Aj-Dj; Sun, 28 Feb 2021 14:29:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvVGIF3HgnSJRjcaE0OWtRZ/eaken0x4rJ1EEXLGTeLvQuR7vAEpYYMoZptkWzDKHp1Dq+HBTdShIh/6psqXIQPD/V+V8gfIaQzZMxccArJYrXq1HXjEgA7wKx3RPJINH99X16twsQCOAcpWr5QaE9YDFL+G6Jq6Ed9Rh2+5YMtWx/YxL5xw4Qvv4HzxS/QxA1j84xeuwdlNbPEaLj8+naXDBmxg/Z/FB5Q/fwvNI9/sydoepvkyiKscVF0Sbi+YJyk1A86b12oZud6V+Cu2FPFSPGRthqs/bg0NjIoQ+XW/Mjs+YqrSilzizq9PhIJAyYrsQYPBdcxK6A7Jey7bAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZCRtAFYeCGAH6jbrO1832cRDu6eTw00apG72bJmoLc=;
 b=aHYBpewnMUkSOmG4gjJchibkeJbjcsvAUsuuXJ92YkyqHLf9WLORtXB2iJSwHZ82FkzxVMkxRRziuIn2n3tu6Ss5fS+CEKKeLiY9AzaD9iXyYBh6G1AT9L7t861Fyz2+t0T7KpK38l3FlLkDePXppa/soBX/QrI0OQqShRi8AxMXSqy8P9wBJJkd/kXx/dg53vEY0G9sjJeOA3d02maIluSXtDFqxFoTGN8cI435G+RfLm8k1EtZDC8ts3hZSkDPlS72KhD5mgp+N83KeN6Fa4boIP2Firo6TjYGWSoFOI1YmhuqeMyChZ+WM1Tf9YKHDZC23vLh70cCzfG+rLjfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZCRtAFYeCGAH6jbrO1832cRDu6eTw00apG72bJmoLc=;
 b=E2bDRNSxy/VwCL2Wnz6Tk4Pd3/8/2a8UpxMEBOKVQ8lp2M4Io47uQ+XueEPPbP05afLYqALFwLhmlCmKyLFHV8TrHLqKAEXUpSfZjIBUpvxdNM+0OR44QIdRbe1yXUNtXJNDTjqNGMqzZOfqX8+pIo8VqaHuOjbxZByH7aWNmno=
Received: from CY4PR13CA0086.namprd13.prod.outlook.com (2603:10b6:903:152::24)
 by SN6PR02MB4653.namprd02.prod.outlook.com (2603:10b6:805:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:26 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::8b) by CY4PR13CA0086.outlook.office365.com
 (2603:10b6:903:152::24) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57788 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0003Me-Hf; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id DDEDE13C0AFC; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 20/21] docs: devel: emmc: Add a doc for emmc card emulation
Date: Mon, 1 Mar 2021 01:03:26 +0530
Message-ID: <1614540807-30686-21-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26708fec-7fc9-4a4a-b38c-08d8dc1f2922
X-MS-TrafficTypeDiagnostic: SN6PR02MB4653:
X-Microsoft-Antispam-PRVS: <SN6PR02MB46534B8C8EAE035A1798E8AECA9B9@SN6PR02MB4653.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w77q/U1B8H4U/zdcJmMcSwGd23/Iwcbnqce1Tek/O6hnBXdqG1U5JXgZBBHYeaRu+W046bxeuxWgobGeajj9gdat/0EV4B3XtiFO3dycxqNDZSFdO+f3+KdgR7gV6MWEicMAO5d8ezObn+ea1j1rUdli7rzuNfxk5HKweo8LYVEbfFtJ15K05bD4l7ETS97l1SncE6Jf8LU61xmncwwSHDZNvwuJNNrQxkRtS2KL1hOpdC1juz1vGMV58CPrS0jdoRJJRuFzccEsF4c6D5Q9TDw3LBEekK+vFX4B6A7UdYLdJh0Cd4CIeo0E4GpQxDVy3hyEu8Pa+pR4MurzTnS5HTz8v5rrhYDhI5uWmhyGR4DtNMshxEsJMEy9HczJACa16sN81SPKdW9xdxvPKS1HKSdg0lsGyu1VYVzle8evcP3F85UqLv+6nHLDtz6CcxQ54hubamVrRqWyFatrNTqiJCJ+6RlkBC1/6lPC+6DFJf4KY2BIA51Kj7X2/7Q3855EUbYH0mVcvPMAj1nZjguzDWNtsg5f1rSYMDXniOBVxHLt1LQTvnTXjrTqAAd2SxrwHgPTD3Ryvf5x5pIexDRt+1oqavTwAtMcrphmmIYptt8gbzr/+0CPYopZ9TEXpZ5OanZMzLPueDmbC0e7uJO5pip877ZUuvOx/xD68DWhX8VUo5znsQAh1glxOuo/NtkQs1LTNDtyS5n0B2DlDyK/dw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(82310400003)(4744005)(70586007)(47076005)(2616005)(36756003)(5660300002)(186003)(426003)(4326008)(70206006)(26005)(921005)(2906002)(8936002)(8676002)(478600001)(7636003)(356005)(42186006)(6266002)(36860700001)(54906003)(336012)(316002)(110136005)(7416002)(6666004)(36906005)(83380400001)(107886003)(82740400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:26.4532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26708fec-7fc9-4a4a-b38c-08d8dc1f2922
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4653
Received-SPF: pass client-ip=40.107.92.56; envelope-from=saipava@xilinx.com;
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

Add few simple steps to create emmc card with boot and user data
partitions.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 docs/devel/emmc.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 docs/devel/emmc.txt

diff --git a/docs/devel/emmc.txt b/docs/devel/emmc.txt
new file mode 100644
index 0000000..2d098fe
--- /dev/null
+++ b/docs/devel/emmc.txt
@@ -0,0 +1,16 @@
+====================
+eMMC block emulation
+====================
+
+Any eMMC devices has 3 kinds of partitions Boot, RPMB and User data. We
+are supporting Boot and User data partitions. Boot area partitions are
+expected to be 1MB size as hard coded in EXT_CSD register.
+
+Below is the example of combining two 1MB bootarea partition and
+user data partitions.
+
+      cat mmc-bootarea0.bin mmc-bootarea1.bin  image.wic > mmc.img
+      qemu-img resize mmc.img 4G
+
+Note: mmc-bootarea0/1 are just raw paritions. User data can have
+partition tables.
-- 
2.7.4


