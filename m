Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520A474F5D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:36:25 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIHQ-0007CX-FI
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:36:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHyG-0002O7-SA; Tue, 14 Dec 2021 19:16:37 -0500
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com
 ([40.107.244.40]:63650 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHy2-0006CD-NH; Tue, 14 Dec 2021 19:16:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8GCFljrz/SedVW3wiwDxGxVTqbHUsz6FbgIQRZMtD5MS0lPz998QUrGzY2bgFI9BhNLFwMXK0l2tCmedWFIOiS68miGc460AdXkJfA/r6iegod76jaYp14TM+CIDxmhsJyW0P7yffup8jgtS0h8A+yFgXsfBdWOyeDdGJilDe1FtpxT3d8mUS94TlRC16SHwGm72Ko0RMkdCcqL7neZFdHgcu3HBotA1SuQ6wSK/G17u1afr7/LrVyTLZovGZrEax0HcW/OZpKI9OSh3BRTGFrAmX5Jm+BK7NYknkcKnSz2kpFfeCYuYTcgNZMGZH7pRnp1zXDk6q3oRg7UXNTxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpwAJdo2vxOEqoBNuLEfjPFYSYDQn0GL4Rqx17GxZM8=;
 b=PMzkXcpGUpYYOVKm7Y21ON8Uxe8zc9+XDiEznnZIiE3hSHyoOgXZrSgV2mwB/lGFU7V0xzhkk1As2AZ0T1oWs0/fUvWONsmDVIOqI6vvckr8fDBlkBsv5pYQ2E39Q6oGSTgQfMkJFSsEWi2xvn64L+WcpUzGkMEDg2NVv8Kaml2X4S2YM0ujAM8Qwu+r6ko3cVJ0lfVNHKST5VUpXpQveUjGCP/1haIpRWJgYO5/LMJ84VaLx+nKaHwNHy+YR1KODtIJvB1QJYcvCtJCMcB1WorOz2AlEbXDIxhZwvb5lyIN8HjgIoi+FB8XaUAEGdIuTGhzWxoHN8M3K2KnOYQfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpwAJdo2vxOEqoBNuLEfjPFYSYDQn0GL4Rqx17GxZM8=;
 b=cnzj9sxUQdZOuKtW3M87XOhZZ20aa5Oigs5ay5IoJbva+8vlvLCPnP+E4GvNBJw4Im15ehugu/wsktLb3rIpXPlL7VqgAZhet0wJWvGjipJisBbtbABZXsIHvaw6AEiKUVPae4uq07ElVu5G9gLxc5iBbzc6y/Jv3LXLkj5KHmo=
Received: from BN9PR03CA0810.namprd03.prod.outlook.com (2603:10b6:408:13f::35)
 by BN6PR1201MB0049.namprd12.prod.outlook.com (2603:10b6:405:57::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 00:16:17 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::7e) by BN9PR03CA0810.outlook.office365.com
 (2603:10b6:408:13f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:16:17 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:16:16 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Hanna Reitz <hreitz@redhat.com>, John Snow
 <jsnow@redhat.com>
Subject: [PATCH 42/47] hw/block/fdc: Extract blk_create_empty_drive()
Date: Tue, 14 Dec 2021 18:01:20 -0600
Message-ID: <20211215000125.378126-43-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e83e11dd-a62b-4d86-5393-08d9bf601cef
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0049:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB004982A43897D9890EE69BE395769@BN6PR1201MB0049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsL7lyB7TJ6OtP+LE7lYy7p+PTv50jtJELBDztmOlb0LBKRkkZ2kOC95Us53gugCYgaEPeuLffrjUdLxCzTgHe3HkvL7J1mZl+f7lEx1Yc77s7N35Iciufevn3xIRkV1LGRLzLlfInXF6Gxtrk1B0DszId6XC4Py2+POe6/cBLmdFle5rc1xK2fq7M1mj97Qwori2R+LObjew9uI4rs3ubt3x7zqfYZRVNo7d3EJDPNhw/Rwn08sLt3/vykfqzaLeMuQkr34bieljWFAdtIXKgO8D4EshOwsR8B0qcpBhi3XITSnuF0bWw4yqguam4bDTXWIe+lwmM+TGnWBXuYPcFCibqyFX9aOC/nqT1QWkVQA8nCGYX1Xy6JLrwMIgv/4YaukUFH/xkxmWzwBB12DEDimItewwddvRYQhzs3vFvkuzlvnUhjuit7X94FIzcjonx9vYLGiMyNQNKmDmDRlCnkVX8jFaBnSpVLXpyvl8gPD/iFR0OssKUMsC3imtpHPW9C0m3IGHTqbz18ANnxKXNvQa9bvNopmUoVSqtq8IFWIsMTnuTAr0m59PRpxXQNINMnr2Hyg1JKoGukWuPGZ1+Qgz1LCfHyzvyuQGs5Cn3EOsX3DXbopZaC3YP/ubvgve/YZ3JpYXAP1EoRbrU2TRG6wLLh+eBil3NzwR1AU4ug8eNBDrpZi66twCURq52uvWUBJcfsG35+JupiuisTTOX2+ed+a70ao7CTiKQ7IC/XkHL18JjKy0wGsc4XBVvLAN/QVf/IaxOXPp3FbpTSc42L8aWPanA3w2mwqrEXXSgM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(81166007)(36756003)(8676002)(70206006)(8936002)(36860700001)(508600001)(70586007)(1076003)(5660300002)(44832011)(426003)(86362001)(2906002)(26005)(186003)(82310400004)(356005)(336012)(2616005)(6916009)(316002)(16526019)(83380400001)(54906003)(40460700001)(4326008)(6666004)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:16:17.2379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83e11dd-a62b-4d86-5393-08d9bf601cef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0049
Received-SPF: softfail client-ip=40.107.244.40;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to re-use this code in the next commit,
so extract it as a new blk_create_empty_drive() function.

Inspired-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20211124161536.631563-2-philmd@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
(cherry picked from commit b154791e7b6d4ca5cdcd54443484d97360bd7ad2)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/fdc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 9014cd30b3..c3e09973ca 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -61,6 +61,12 @@
     } while (0)
 
 
+/* Anonymous BlockBackend for empty drive */
+static BlockBackend *blk_create_empty_drive(void)
+{
+    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+}
+
 /********************************************************/
 /* qdev floppy bus                                      */
 
@@ -486,8 +492,7 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
     }
 
     if (!dev->conf.blk) {
-        /* Anonymous BlockBackend for an empty drive */
-        dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+        dev->conf.blk = blk_create_empty_drive();
         ret = blk_attach_dev(dev->conf.blk, qdev);
         assert(ret == 0);
 
-- 
2.25.1


