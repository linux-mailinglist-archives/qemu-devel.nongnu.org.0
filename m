Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741D474F38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:28:22 +0100 (CET)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI9d-0001nX-8v
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHwP-0000RL-Kl; Tue, 14 Dec 2021 19:14:41 -0500
Received: from mail-mw2nam12on2049.outbound.protection.outlook.com
 ([40.107.244.49]:8545 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHwK-0005sy-E4; Tue, 14 Dec 2021 19:14:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZ4T/uIqhRHTAptqp9g5diIPGoRhPbLr+KyU3GunRUcc8d2Awl8kL69Kozq5TFHoZhl3lNOjBJgDeptnCNm4T/iXG6whcSfPqpsxoRiiO+/w8wTW0bi7eFqUVMtgB6qw5NCOzBc+6bjTWiwiLOapeqfal8gUwTgIwz+fM2ioMjSzSy3ZMnnKUnhvuN5BOjXQ/OMZ3XBKcQcWlbCi0PS70H9DdblolqpGt64nkN2OxLqek+FStPkea9T8Pi3Sj5lbM0wk2RwRHjGb0vEfKIbm1AG3s2uOV6h80Dz4a6KaF2VLhOG9xPIRORxl07wvauEVBjMe/vN3RHFLcEQYjc7iHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VkhSbSvcMv8eB1NQ7wwkGHdnQCcyW5AZDpcSjndIMU=;
 b=h2zLflsZvExl85oMNSSbfrGOVONsqge3nlOlZESaoR1bWskSrMD8eKb4L9lO6EwxjXxNy+qzgFqYggx46a+Hp3SDRXa6tzi+YFF+Iu4H4Y4ED4s7VACRl6Tl+tGlxV3AEpoVdtuYz6zlaj3sEH9ltsq7H+oD+uQ2L4t3fFZv4TmUEi3NXiIKnyCUbWe8yo7ubyRfGTAoemwSqli+gmnFhM4Frsm1HDPcgQpd72bTEizhtFQ+4dhAkAngQLKvO+VXS0Tm5GecIuNyqYBi/qbw0cHwhmcZlniLgUr13Lr3VCuiXvyskiYddbVo/SH4jvOqPH+36hjjMlI7CgFb/KsFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VkhSbSvcMv8eB1NQ7wwkGHdnQCcyW5AZDpcSjndIMU=;
 b=X8ZFk3IP/Ve2xF/d7Rd0FVAgU2A8iyghhsS1aPelnKRHqYDZxquLzZwbdNww/W75/Vf+5mhXAz9DxOP3Iq0Oxnzc1jvE9wsxO1RT+GVxNF/qRnLhhHFXm3+aZPqy+jViQw0fBCeZR9OJOj25IeTUpnFmIrtdRcgy8XQrerkayvw=
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 DM5PR12MB1644.namprd12.prod.outlook.com (2603:10b6:4:f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12; Wed, 15 Dec 2021 00:14:33 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::68) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:14:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:14:32 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Peng Liang <liangpeng10@huawei.com>, Alex
 Williamson <alex.williamson@redhat.com>
Subject: [PATCH 38/47] vfio: Fix memory leak of hostwin
Date: Tue, 14 Dec 2021 18:01:16 -0600
Message-ID: <20211215000125.378126-39-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee2fcaaa-04ba-4e18-c62d-08d9bf5fdebf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1644:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1644C0E8ED14F00514FF4C5F95769@DM5PR12MB1644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rL8WjSaC74DuoR2DGPiFCR00gy9UuWeJndWlTno8OUK8Qaos8VEDcukK2WP3PM7gManVW+8im9ieT9Kn7xiPwELLKQhVBqEFi5tmXqwYd/g4AE1ubQ3XDMrEUVsbNmSTFmyBrFGpZA/XZFFoB9P+lojGm4iOISLwDspIjasJpst8SUmLy61bLA8e8GhQ54TeOFOhBELSwlY+d8SOvE90c6ho2R9h7a3jyu+ZeXuzZ/tviUTFN3/mFt3IIcUtSIXYshGsSErVsdE8CkIax903JqAgr39NljgyRgQ1qwvdeTbW36WMJkNKKduwlW3lY4Ag3le5Wo7tc22xTiTYMTIooh6ttYg9mQzBi0JPw51n+rQC2dST+qhgQwEuDadjpv3uzH05mfhijj/VZ2H+qbAgeYMRTJXftNSdoAbFQS4kGD3Z5LtKhJ5bl6KW92CSaYslW0SVTWkjuNLU0Cn9r1pfhDdpOOBGAXi6/0mIESngp/Z+6b6IQW2GSX2+SHDynB4qxbCGj83M25AIshc+cgFo9JGKtw5z0o2cZqWqC/cpNpeZtccuD7S+LcLbSmHdc4m/cKjAYv5VMEj5lRqC0HWEJLx0ILIen28oBjoGvBKr6RwyTAdLjfA6IdFtH16rU4kHieYvzAV4AA7azqlNGyXQEM9XUr/fF0vH2qJxQ5tnzb4+VQrJe8N/Ccojo8C8mNpXgyJuCKJnISLbaX8prwVIeYfxDJImTBC9TjOR8bY9UaZD2gOezCh343b/Ng23JcYUkSW9UHnETLIkmojk4rKjI7A0Bzz0kbFpX1g/m/Qd9w77KwXMHTxa+YIWZ9Qyi+7urCCJVlRObvl3sqFrC77ZA2XPlmhN8WHDCtLYR1zTyM+p8VjBYCW2qYJ1YcYuxd16
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(36756003)(70586007)(8676002)(36860700001)(8936002)(508600001)(70206006)(81166007)(44832011)(5660300002)(966005)(1076003)(426003)(186003)(26005)(2906002)(47076005)(86362001)(356005)(6916009)(82310400004)(336012)(40460700001)(316002)(4326008)(16526019)(54906003)(2616005)(6666004)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:14:32.8919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2fcaaa-04ba-4e18-c62d-08d9bf5fdebf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1644
Received-SPF: softfail client-ip=40.107.244.49;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

From: Peng Liang <liangpeng10@huawei.com>

hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
it is only deleted from hostwin_list in vfio_host_win_del, which causes
a memory leak.  Also, freeing all elements in hostwin_list is missing in
vfio_disconnect_container.

Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
CC: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Link: https://lore.kernel.org/r/20211117014739.1839263-1-liangpeng10@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
(cherry picked from commit f3bc3a73c908df15966e66f88d5a633bd42fd029)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..af37346aca 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -551,6 +551,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
         if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
             QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
             return 0;
         }
     }
@@ -2230,6 +2231,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     if (QLIST_EMPTY(&container->group_list)) {
         VFIOAddressSpace *space = container->space;
         VFIOGuestIOMMU *giommu, *tmp;
+        VFIOHostDMAWindow *hostwin, *next;
 
         QLIST_REMOVE(container, next);
 
@@ -2240,6 +2242,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
             g_free(giommu);
         }
 
+        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                           next) {
+            QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
+        }
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
-- 
2.25.1


