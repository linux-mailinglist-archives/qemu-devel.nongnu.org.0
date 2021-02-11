Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5D318627
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:16:18 +0100 (CET)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA797-0004Rs-Gg
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75o-0002bA-Ic; Thu, 11 Feb 2021 03:12:52 -0500
Received: from mail-eopbgr750057.outbound.protection.outlook.com
 ([40.107.75.57]:39657 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75m-0004Vl-RU; Thu, 11 Feb 2021 03:12:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCuY2lrY3ipN0B9K9gSp64EH2haDcizpyR0VBjiA6jEH3OBukZi6dLklwLZ/XoHX10LjrMAu2N9HmHKCeHNDaUmXvycu2VlpfNZam0NjyGjHGeGjySoeShy0GxVOIHxTAbuOHIVl3boQzUBA2WC33DG7uqQ1qQaNda2e2PhDtxvbQNl0T3hUGtDRSr91cunwTFC6Ec9N6mmpYpls/JIv9V52XSYFJ+szLjuZRQ7uI7RbQl9BZ5p0QTPPyeJ1bVMyRQ9+zYst5wZUufuz+pGvYabKPYUgFxrfm30MXkPKMbCIZz4nX6fVhymDBjexrceDgMwVdbHXgRVNzzmqieI/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpQvWGoHUm3/ueLU1b2jbgj76C+Z8U4TERYyWoKgGZk=;
 b=Ems/9qi6YIUiJTaCMPzTXM6kYMZvjKHf3zNdcLntGVtE2RhXBZl+q2uv/Kmfd0MRmTdxTHSYqgchH252/6hqxR2yW7YEFxlKTZ+S2ZkLUzKnP9QnLdfsTn8U1zt0rLav4OuEmz95X5cC1N+CJzD5mXWiRanNhNfLBhF+RL7Az2bEP5n0WLvVtnLyfrSPlu/Be7wkIREGKuhtLzU7CYhxiyIztYNZNTg2U2cGOavaTaE2f4AKNfoFoFBPsHX3q3MgAzxhbgSYGOR5o0UatIWuOFk8e3YdQz6pdsWwjCZp3rXKRiEBWGJovlBamp4EBI6EEq50qDEQt5SlVzAGq2dFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpQvWGoHUm3/ueLU1b2jbgj76C+Z8U4TERYyWoKgGZk=;
 b=kpFgNOrpy0oBFWm3HoqfaKUinzQ3+ZAJaCuRX2QOpjHzDRdsqJ7ukJbaiJcCX8C3VLw+mYo6tW48rPWTlk0yiXDQxhz5Qk4pgQ7buM6/9VApM0FHqZ16J926R77UYH4mU/IlDS8n68qayd7/uA1x/6kvv3L1RcU0WETDxLaThFg=
Received: from MN2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:208:a8::41)
 by CY4PR02MB2470.namprd02.prod.outlook.com (2603:10b6:903:69::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 11 Feb
 2021 08:12:47 +0000
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:a8:cafe::5a) by MN2PR12CA0028.outlook.office365.com
 (2603:10b6:208:a8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:46 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:46 -0800
Received: from [10.140.6.35] (port=49668 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75i-0000Go-8W; Thu, 11 Feb 2021 00:12:46 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CC69513C063C; Thu, 11 Feb 2021 13:48:08 +0530 (IST)
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
Subject: [RFC PATCH 01/15] block: add eMMC block device type
Date: Thu, 11 Feb 2021 13:47:12 +0530
Message-ID: <1613031446-22154-2-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 054674b7-4f9b-44bd-c709-08d8ce64d11c
X-MS-TrafficTypeDiagnostic: CY4PR02MB2470:
X-Microsoft-Antispam-PRVS: <CY4PR02MB247054EB5DFBA904F42DB724CA8C9@CY4PR02MB2470.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MR/S1EkH8XenrzBJWOcx4scSxiLWW9DY8GdlWuaMEt0rfmHauDp6shkm0IBNAFirYbFgLO+cFI3A2adPHtnTPuNGN3RoPOQCxROW9WjNvzcaDbTWjsRBccWiu0LppO3Mg9NAi/oRId1hbotrVytVs/mngTbpp8eJ+f3gkWXIftwRrqMTtAUrJjKMqkv4Jx2ffBr+1iOMvTtg6Tn/YjRMsTKN0rd+xJdkAzmM3iLgmHY2DsLevOMXW34P/QRjHYEmnVm5lItxAKX+nyUzT68A8UihGgiX5W2mjTBHEsRkjCAlVWkFBoFjnQ/6wI+8Bc49WcYYGruvvALEChxOzv7czPWqqnxlz6o8lv8o2KMU1o+li3dPZUvfkpnOaolC/Kyl/KaHWfJ6jx99EmFxCA4UUh2x5krioAAhvG4+ao8ShJe9FhMf4w/9Y+xJTX5gYO0CaiMtpstDvEInYSAAPpXcc7hSWPQ1nb247HQpXAefR4LkiaMP+yhskYGkpmA14ckTZPtY0vENI0AlxxsiPfDrHw9v705NOThJ6D7N6Nr+ff8QlAXIksYOObCPVOmxC05k9ydamtjZ4lykUTBlKkSq5CMMelrtoW2o12midntPwaKwuaNqL3XgdHVb0qsbP3iWnuPSdRoq+FuX7lB1zHs+NYUdvfRaOBLNkDON4WMLYqdp1hyyrUR1SNDQw84S3BQS9lkAWO/nyjKX9odN6o4DhQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(478600001)(5660300002)(26005)(2616005)(36860700001)(336012)(36906005)(426003)(186003)(36756003)(82310400003)(8936002)(42186006)(316002)(7636003)(70586007)(7416002)(47076005)(6266002)(8676002)(2906002)(4326008)(107886003)(6666004)(921005)(82740400003)(54906003)(356005)(110136005)(83380400001)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:47.1881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054674b7-4f9b-44bd-c709-08d8ce64d11c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2470
Received-SPF: pass client-ip=40.107.75.57; envelope-from=saipava@xilinx.com;
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

From: Vincent Palatin <vpalatin@chromium.org>

Add new block device type.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
[SPB: Rebased over 5.1 version]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 blockdev.c                | 1 +
 include/sysemu/blockdev.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/blockdev.c b/blockdev.c
index b250b9b..593ce44 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
     [IF_XEN] = "xen",
+    [IF_EMMC] = "emmc",
 };
 
 static int if_max_devs[IF_COUNT] = {
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 3b5fcda..eefae9f 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -24,6 +24,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_EMMC,
     IF_COUNT
 } BlockInterfaceType;
 
-- 
2.7.4


