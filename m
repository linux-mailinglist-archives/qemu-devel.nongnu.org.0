Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121D321204
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:30:07 +0100 (CET)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6bW-0004pe-Ht
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OK-0004tX-1E; Mon, 22 Feb 2021 03:16:28 -0500
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com
 ([40.107.223.89]:21088 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OE-0001pT-Qz; Mon, 22 Feb 2021 03:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJxGGcfwTqBsgjffpExR/QGfsn48u3afBq/al44RiYnR13der3hhGAWISxR/CCF76A+GH56Tw25O6SZgBmlmGE2Uk9tAQV3RJQyOFVmZTM169lFt14wl0XoaKMkNsp/NxUxOU+oGxdmb4aJhOx2c431ZnedAQzaXCwmlFsg8lQMyrpOqF8LEKyyFANDnww0cNVelRWLXOkZICCMRNdaYO6vUVGANXFoHi2aiH8N/Fme/INfbaIfCYrNaxRUextxw/eSULUM4XC4N70kDVVpI2oEVZMaBpgf2JAkL2667H6ZFeLtUdqfyqyxEFp2sf+KYLWA5H4Gn3Ck7y+FDJVRt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycOAAxR58NimEpZgH4ohDflLNqwb3PcbKhUthMi5Gtc=;
 b=G8bgWPLKOIqiLyzEQQ51IOGkn3AYY3Aql1sDtZ7HdigsNSdCEUoVV1gCI/0JA4YMgr2B+WLiOBuTl1RUZrIOdjqm/aMizeb53SEEqmBtSOeAdbNn52bZBnLejBmFd6l13j+P5/PBY4GUsm1GaAKjRBMyvPLXNbf7y2WxjT4lCeoVoKqSkldQiDP+lWm94ox99m9TcokvkjO7o4/cPkZXlqIgn52IGw6UC9zMXSCvubB/glOGI770aEQQvsS3tJMqN4ptDWMoAmFJg1C+bkN2AGoE/NgAZjBrma2ftI+7UBJVHfuhM6GwTHKKRHCbknIs4ZYp6/bnlc5GeTHsIhaO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycOAAxR58NimEpZgH4ohDflLNqwb3PcbKhUthMi5Gtc=;
 b=kjfoMmP6Na0tZzJ5HdJv/zqw/7VRj5JcJJrUk8Ir7qzHUkqdnz9WSEDBI8QhbPR6aRGK9HSVzJJHlFL9HO8uipODkjH09U7bjcBkRsGBW8HPF11qjSCg6UghWaoqdhjnBgyCoLzClDSlsccI5Y1rJexkHRMU7wMuAXxTQgrmm+w=
Received: from CY4PR18CA0069.namprd18.prod.outlook.com (2603:10b6:903:13f::31)
 by DM6PR02MB4012.namprd02.prod.outlook.com (2603:10b6:5:9d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 08:16:20 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::cb) by CY4PR18CA0069.outlook.office365.com
 (2603:10b6:903:13f::31) with Microsoft SMTP Server (version=TLS1_2,
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
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59060 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nt-00037N-3g; Mon, 22 Feb 2021 00:16:01 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4EDE813C0AE9; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 22/22] docs: arm: xlnx-versal-virt: Add eMMC support
 documentation
Date: Mon, 22 Feb 2021 13:50:39 +0530
Message-ID: <1613982039-13861-23-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef87fbcf-628a-4550-b7fd-08d8d70a225a
X-MS-TrafficTypeDiagnostic: DM6PR02MB4012:
X-Microsoft-Antispam-PRVS: <DM6PR02MB401262D3FCB5C4EAE155A88CCA819@DM6PR02MB4012.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oC9zYhuwJXkXvYfMrblvbbNY0eGgI6/+MVZVisaR4VgNCRUL9rEBK5J30giT5OQnA59W9OuFMFgrOIR1g3Ltg7K3w5hfvDceM/I8Gcb5SfDHFDX9QIu/0gZMpjPJgKquq2r2FEgWCtSL4f/SDwQB2c6ILIS8haA4bxgIje0vI0TmU/iLxKqTcC9NfqT3pn1CfvYZUy7v/2M4UY+/4zRl2JvHDHpNj0F/tzL6iFiFVwBQ5Qq1ij/oG6mtZLhXGtwNp6pnjzwNtUlWj33/KfsXTPxSDTWKwcj3wtlo+S8kl37in9dvMlo8eGx68OvB01BVU78yPyMVqLpIkBk1NT4KGs4bmKu/iMOweWTdkQf3aMsfmfAGdK/+Vc1kEqUtLaiWs2twIF+Gt3SCf2fgxrGGoCKlgT/1Qt+tBrGzcvYd4nfglMOrRYBALh999OKeS6pgByvPJgh6xIKm7P+YTwX3Wie/3mOIaj7dtxBYpUcY7tbda/AkcTGwbaheoj+qjI3Tg/WpxvcGoeJQPopP9Bc0ldWvkKcLvyN8cJhZZUodos9hCe5ysziwDKUHKkczy3XHaVvLarBWDCov40zsmA+j08Ce9reErXnof2fOMNfXHqVCXpGxeYyrDIcA/oVgwe2+WeWqIXY4Y0D2DPlhJfGSwavcAEFLaJUNdCvWsbzP7D+6dOtT8M15ESY9LxoBYChE
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(36840700001)(46966006)(7636003)(36756003)(26005)(82310400003)(6266002)(36860700001)(70206006)(356005)(54906003)(2906002)(8936002)(70586007)(82740400003)(7416002)(5660300002)(921005)(42186006)(478600001)(316002)(107886003)(83380400001)(336012)(186003)(47076005)(110136005)(8676002)(426003)(36906005)(2616005)(4326008)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:19.8320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef87fbcf-628a-4550-b7fd-08d8d70a225a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4012
Received-SPF: pass client-ip=40.107.223.89; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

Add details of eMMC specific machine property.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 docs/system/arm/xlnx-versal-virt.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 2602d0f..a48a88d 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -29,6 +29,7 @@ Implemented devices:
 - 2 GEMs (Cadence MACB Ethernet MACs)
 - 8 ADMA (Xilinx zDMA) channels
 - 2 SD Controllers
+    * SDHCI0 can be configured as eMMC
 - OCM (256KB of On Chip Memory)
 - DDR memory
 
@@ -43,6 +44,15 @@ Other differences between the hardware and the QEMU model:
 - QEMU provides 8 virtio-mmio virtio transports; these start at
   address ``0xa0000000`` and have IRQs from 111 and upwards.
 
+Enabling eMMC
+"""""""""""""
+In order to enable eMMC pass the following machine property "emmc=on".
+ex:
+    "-M xlnx-versal-virt,emmc=on"
+
+Above switch would configure SDHCI0 to accept eMMC card. More details on eMMC
+emulation can be found in docs/devel/emmc.txt.
+
 Running
 """""""
 If the user provides an Operating System to be loaded, we expect users
-- 
2.7.4


