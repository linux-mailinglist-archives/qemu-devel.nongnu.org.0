Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805674AB616
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 08:52:10 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGyoh-0002US-JY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 02:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyKR-0002OQ-0X; Mon, 07 Feb 2022 02:20:56 -0500
Received: from mail-co1nam11on2072.outbound.protection.outlook.com
 ([40.107.220.72]:8449 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyKN-0005j0-Iy; Mon, 07 Feb 2022 02:20:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTGgbxpZaG9BomhTSEU/eYWUp2TVvk1d7wukbqLK2EZ73HqI6L4ohVEnC4GDqAlyt+nBPpI0Sc+Se9NtxJdAm1vR80RJwK5XFDtg0opF4FV/iIiNXaZ8gZO3pUhx5rJ3lDyqgs5BWMxJvGYxmUd1xdrwFZVoIx1V9w/RPkRy5ioH3q0OL9KehVSv9iwr00m3U7nkgWotx5RJVdcuAqAYawssTvt5+VUgbFw0nt/O6VHMHuvWJaD3vJcno+7JQpo3NY6z3mbuJDLEwfVs2F70VBE5WvjtbBUjVx/KKcjX0ZjUYai0CotRxY6X4IgA93kjyYgqGnJ29uG/wOjeLO2Z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1ijzzNqJ3A7IvFwLw/Psj2KUeXqtabkaUhfZ/P+p4w=;
 b=MUtXWn/A/a6WvtvjxyHHG7DjZJbCfTbcmgfO4gg7CM4TiPY/NtxXWCsYoxr8kH9j8kvBawe5NfK8JrwbE2knXD6K5WDlDHLmlARBmVbkuBBvbXEtwbYJjDlkx0guQSbyU/NXzEC0hev9VA7j2UtTVktZl2Ak1CRzhhCXImJ0OVzMx2QibYo6e2rch4DryUlXI2o2Dj/qH5E6Cg8/kBdg9ObffIHX28ivh67iHUolFzjfyZ69KDlcIzsbfDKLrD8OyOnfyt4PwbuoYdOKfZGpVMTG2JGMQvXqiNzvsx6JuwT/G9adCCzTDcSSvazA5DoinqmMP/hh9MOaDB3NuZD1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1ijzzNqJ3A7IvFwLw/Psj2KUeXqtabkaUhfZ/P+p4w=;
 b=S2PILjPISjfnkln5O5fh+54H0+SqU8nX1Bg1RRVfcbnG/JD7Od5nS/4D9rOCL5IAlK+OEQtb4DyTGLuI7CqW5d9HGFFSVP2AWGhLirDrChUScrnesrtvrx/dfOSjeKxMCVFU1TBKymlzkgx00jUbqGHZ12NeVAjDmwvrYdTcuvMKZDgI54yU/xQmmkJD+BpiIugsDQsCLpJjhvJyI69yYLTIQ1TffD+onFXi6fmQ96eDqMDn9p24maHISgmTQazP5Yj1421SNbF57hxBhgkLzO9tXQiZ7Z3IbCwTRjR86GwpNNw7jSGYNThVKZ/iAMItj/ZV3f2FKP20jNNw7sj+cw==
Received: from DM5PR19CA0059.namprd19.prod.outlook.com (2603:10b6:3:116::21)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:20:27 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::64) by DM5PR19CA0059.outlook.office365.com
 (2603:10b6:3:116::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18 via Frontend
 Transport; Mon, 7 Feb 2022 07:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 07:20:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 7 Feb 2022 07:20:26 +0000
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 6 Feb 2022
 23:20:24 -0800
From: Xueming Li <xuemingl@nvidia.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>
CC: <qemu-devel@nongnu.org>, Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 <qemu-stable@nongnu.org>
Subject: [PATCH v7 1/2] vhost-user: remove VirtQ notifier restore
Date: Mon, 7 Feb 2022 15:19:28 +0800
Message-ID: <20220207071929.527149-2-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207071929.527149-1-xuemingl@nvidia.com>
References: <20220207071929.527149-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5455f4e6-9573-4244-51c5-08d9ea0a50c0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5100FD82F9F0988FB7A25BC3A12C9@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgC7pQ0fRc8cm7gUynLyC04JLzuzUrtU7r03BUVw1+mw/uFZrAryrHXUaOG+n7Vl8oE22KqrDHo3D7L6VAv8NaUVdKkvHuTND5VsJU0t/eyqnYpkxcZLiwukOz2jBQWe29QzAvDBf5hmmrUKxw6MjcCjOKIFkhHKwqIHxfT9UEBy3BtE2fYTqxpBRQTuwLSN36Wp0XsR/F5U+ZfIf/ShVcDXvrz+/4i+WPwb6+YG8gSZ4PnN1r8he0cl9j+Kfd/IkmlfKMfKI4+0geiBFUZLDJ7k6ZHp3eiK+wl+zO9sKBeqQ6ULkGUJf3PgTmZ6LupB+fDrJz2mnGwhLZScJEVjA2MOHHxOuSt5ZF3PmEBaGRFNRK3rQpJ69rcgkpGg85cScKNKwP46d8TQH1Fe8emGB4PA7kFgxuV0gsORITC3SY+AUhieb3fK4Oe1J4hPFPE4TRGPrx7yZg9VoRa4X08t94j4e/M6ZmDjv6NGzbuKXMB95R/TtP4LJGUrhEJ4F59gqQU/DT7MsPf+r/TozMzvtQJkY5LW5Yhn1l5BRAdZvhb75RgDvMIRCr28amJOcEUmIJpl5mc7StOmepJ20cUxp9nIrNSTNvsHmULHyjyRqiE/ZLrp+rlJCNsbzlQnJU9kTxtsNKojRT4YOU3tvk0oqiUqZUwZIbIsIY9xN5DMqIrSI97h2QuWWg7uteTpE5RWVHV1/5YJ4/BFOSJTWrMLJA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(36860700001)(8936002)(70206006)(8676002)(82310400004)(55016003)(316002)(86362001)(70586007)(110136005)(54906003)(2906002)(47076005)(2616005)(7696005)(508600001)(40460700003)(36756003)(81166007)(356005)(26005)(83380400001)(16526019)(6286002)(1076003)(186003)(5660300002)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:20:27.3739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5455f4e6-9573-4244-51c5-08d9ea0a50c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
Received-SPF: softfail client-ip=40.107.220.72;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Notifier set when vhost-user backend asks qemu to mmap an FD and
offset. When vhost-user backend restart or getting killed, VQ notifier
FD and mmap addresses become invalid. After backend restart, MR contains
the invalid address will be restored and fail on notifier access.

On the other hand, qemu should munmap the notifier, release underlying
hardware resources to enable backend restart and allocate hardware
notifier resources correctly.

Qemu shouldn't reference and use resources of disconnected backend.

This patch removes VQ notifier restore, uses the default vhost-user
notifier to avoid invalid address access.

After backend restart, the backend should ask qemu to install a hardware
notifier if needed.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c         | 19 +------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 662853513e..ebe9bd58d0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1162,19 +1162,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
-                                             int queue_idx)
-{
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
-
-    if (n->addr && !n->set) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
-        n->set = true;
-    }
-}
-
 static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
                                             int queue_idx)
 {
@@ -1182,17 +1169,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        n->set = false;
     }
 }
 
 static int vhost_user_set_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
-    vhost_user_host_notifier_restore(dev, ring->index);
-
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
 }
 
@@ -1558,7 +1542,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     }
 
     n->addr = addr;
-    n->set = true;
 
     return 0;
 }
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index a9abca3288..f6012b2078 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -14,7 +14,6 @@
 typedef struct VhostUserHostNotifier {
     MemoryRegion mr;
     void *addr;
-    bool set;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
-- 
2.34.1


