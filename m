Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B095474F64
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:39:11 +0100 (CET)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIK6-0002g2-4m
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHyS-0002fm-Hn; Tue, 14 Dec 2021 19:16:48 -0500
Received: from mail-dm3nam07on2071.outbound.protection.outlook.com
 ([40.107.95.71]:60449 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHyP-0006Il-5M; Tue, 14 Dec 2021 19:16:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU8mdaiu78yNDTa5/o0r4lMPGwkEo6TYmCHvB3XSKq8u5Hf+aatIg6Qfbf1Fn/judVn6KEPKR1NFcvv8hublbV3NnzBkX8Zn4apjF/vd7IIugjFe1xo1/BlEfRByfZRq8+REEOCuTgdizZdB83QkelFZK6l7gBg9MuoDNnHdQ+FkNb5Tg33D0Qrm9yzfl07LPlHM5HFR2eEHTbhM5rp3/RRwAxFVkNnK9p++ffEeHHyc5EJWT1fR5JnevIyvfOlbSST7VhJDyVniIeIS1HEKcwdlhf3R8804wSV9/4p7uZLmNT+BRiAhEQwkQnXsamwGFeoAkRyMCk5tN+AfSWt41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtvA+uV3GXSLKg4KZLljaWhwZf0XoThAmHZ0A1E5uC4=;
 b=b2DRF3W7R5gNBLwA9w4psholcZqBZSEU25Ghv/M+LGQyaWl18pfjWioz33KIG5lyeTKhVEqNTrBCqODjBwB7pWox096w8EMXlnpLeRHTJVF6RLp2Nt+HIELgXiZagCbOt3smkTuuapt7iHkdJbvVjLB9q1x+ZOS7INkuFTxOCs4Lf378ysghFF4tGujW3StDVNp6Vzyj+F3iFfyo/2aI21NXkiB88Ce8nW35IylmlMvrQ7ZEF3hMb1GPklboLQXr05errLoiRRYc5wS4ks1NO60/EpO+H6eEBgBy+KLT0u2CrdBq4wvTRs+7Pu6HVhz5ClrPomi9PGtx0GPArbGacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtvA+uV3GXSLKg4KZLljaWhwZf0XoThAmHZ0A1E5uC4=;
 b=5oBJ3GoAwDZF219OwlEwKVyQLViFKD8uDVwOgo4yM7J9fEhPnZg+YYzqa4ffzSAABLOYf0cuBsFbz6C+X4+fIc7C4uwAi54WoZCHYZgAymQnSIU4Aw8PFqKuEv22n7KCKfes9ARu9+v4g5D/NxH/6KcatmdVgQitw5IRCd9n7C4=
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by BL0PR12MB2515.namprd12.prod.outlook.com
 (2603:10b6:207:40::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 00:16:38 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::52) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:16:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:16:37 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>, Darren Kenny
 <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>, John Snow
 <jsnow@redhat.com>
Subject: [PATCH 43/47] hw/block/fdc: Kludge missing floppy drive to fix
 CVE-2021-20196
Date: Tue, 14 Dec 2021 18:01:21 -0600
Message-ID: <20211215000125.378126-44-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4f264de-e1d7-4d5f-a384-08d9bf60295a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2515BA15F12B7F4DD2CC723C95769@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:356;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: re+94pMDh0CeINvACaAySUxXNLECakqgL7JTujKyxTEiafPH01ZoSEhGHaaiSWprl9n7BfxYFwClUjtiGz3rjAMpTCPfr8H+ZTMj8qOlIF7BggqGkVQ7Y82RjSbuB07P92m8LfSQ62saaQuhWnT75/H7loogm+cwq4t6p5BEqRG2znjdOnF7JJxTAd+q3ZfrpCjYmhFDWx/br5PlnTXmhlS4GapN1irndBaAPoumF5jc5e3PaTfRi7Cyom3o7JpUEBaNU+ABJ+Qx8cc7i0v/61GWyWFujTccK3o+IDFUl95vIEnCQeI20F2gOxpF1A3NuNnwZ95j2XEITZ/Ujkl0sW9BQteREsq4w047xhHBLC8c7Th3OajXpyVP9CCNhDfnkN6pV+W9KutnsZMc/MCKfKD/4YzDdRuAl+LjF3ka1+vLivE5dJwnaohs2eJ8112tPTBH+649vQHWAOwnRWq34bMfcKV6tbeIZJwrYIDGBfw6WR5e9XFe7ulG4KkkWg+ZCc0zAW7QZTCR80Aj5UmQChwLWV99vnUB394LPazcKzPF80EFWatJoMCm1Q7zarYrVMdu015faILKkU8gr/UzYoHs3oaCBumk7MIaF2ZaVjzJgG6cFPUieiYgTuUNwOU/gXZ9WD0TL157inZweHOC8O1O2C5nHMY6wAvJsiUELfcvF73e85UqX7MtrKLBndfFRGhBIkcyDj/JSCYHIcQPqSQ1O5ejr6P6fMbbAsk5UTcCN/sZl4JhkgL1qf15yRQeWPEC09PRYL5JeRQoiHw+2t3hKxSgggT+WcmNe10zbJPRnTcTdi4mpqx7HLdWL/L/6w2rJxeeEwTENWFw5Vf+5i2Tths34iK8AnJXcMvvX77ZPmzCwpaYF4Sq4WZWhV/WBlOTn/BK2PMfP3UnzNWqYA6wPWbwcepxLjyizqxDJFU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36756003)(2906002)(4326008)(81166007)(82310400004)(8676002)(356005)(6916009)(36860700001)(8936002)(316002)(40460700001)(44832011)(5660300002)(70586007)(16526019)(26005)(86362001)(6666004)(508600001)(54906003)(426003)(336012)(47076005)(70206006)(966005)(83380400001)(2616005)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:16:38.0894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f264de-e1d7-4d5f-a384-08d9bf60295a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
Received-SPF: softfail client-ip=40.107.95.71;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Guest might select another drive on the bus by setting the
DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
The current controller model doesn't expect a BlockBackend
to be NULL. A simple way to fix CVE-2021-20196 is to create
an empty BlockBackend when it is missing. All further
accesses will be safely handled, and the controller state
machines keep behaving correctly.

Cc: qemu-stable@nongnu.org
Fixes: CVE-2021-20196
Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20211124161536.631563-3-philmd@redhat.com
BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
(cherry picked from commit 1ab95af033a419e7a64e2d58e67dd96b20af5233)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/fdc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index c3e09973ca..af398c1116 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1166,7 +1166,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
 
 static FDrive *get_cur_drv(FDCtrl *fdctrl)
 {
-    return get_drv(fdctrl, fdctrl->cur_drv);
+    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
+
+    if (!cur_drv->blk) {
+        /*
+         * Kludge: empty drive line selected. Create an anonymous
+         * BlockBackend to avoid NULL deref with various BlockBackend
+         * API calls within this model (CVE-2021-20196).
+         * Due to the controller QOM model limitations, we don't
+         * attach the created to the controller device.
+         */
+        cur_drv->blk = blk_create_empty_drive();
+    }
+    return cur_drv;
 }
 
 /* Status A register : 0x00 (read-only) */
-- 
2.25.1


