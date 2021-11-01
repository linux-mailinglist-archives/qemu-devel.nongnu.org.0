Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCA441580
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:40:46 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSs0-0002nR-S1
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqb-0001CQ-AC; Mon, 01 Nov 2021 04:39:17 -0400
Received: from mail-bn8nam11on2079.outbound.protection.outlook.com
 ([40.107.236.79]:1248 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqJ-0002CD-Tn; Mon, 01 Nov 2021 04:39:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V87HZ4d7th9E2Df7pe+0JEHxSi/o7yoboKBzyMbrUHhpfi52UCxP8AYkskb0hfSC3qYh7ckGmwWAYUxcxQyCXkhsVYNQLB7WAHLMTsTp/mKNRTRO8wf+WwymzO363J/Y6PCINxhjGPohs5H3+DzaJd9saRS4hv52GgByGoMy1NWCIwXneRuHPoRVfPVpkBeZUVfc97OBEYtMYOaWxkXKWm29xs/dD1TQiWEKw0i9ZpyFvEXej34rd2JgvidLyYkINPJ/a0RPn6P+lUvCyNXo95RD1soIK7RpT9lFkZQndvoXQH7OrKxHsn/jinKht3QbC2PNdgVHhaQUjC6E4MbnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNkLnYBkVvlF7UWFy+0mGwrvrvJgBcg1EdgHk3awa30=;
 b=bIkh9iRwlQ7MQ+HMNBovFdfKA98yYkO7xSZ4ny1r1F9jn4NGSabhvF0FpBqWOnVeLk65S5FwwR8CUl931BtIufYrHlnZFwaFgkBrB7IvV13iLaTVgolZ623ncZY3F95Rt1IjMIoHyCg40qsIWnraLYrZkR4Mlx6l3vECepb1oZu9te6bI1SoC6RsSJyPm3PT300ef3Fd6Xz+gTLaExdCbVhc+zuPqQTxVn5P2L8cwArziVoJFWlcC7WYli0XVBpwqkHfKsQmrznMyVI+cQxOKBE4qH+XC2hCnPtD3Us8QbIxwfeFMQEgr62nHFhCL7UotAw+PaI5lFVJQK8l7swwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNkLnYBkVvlF7UWFy+0mGwrvrvJgBcg1EdgHk3awa30=;
 b=T9C1zmZuLyipWHcRW+fB5SmjSyoUXt9Yl7imrN6d29TUZFmi9fen1JcVLWjKP+N2wSxOSy74Y3Ar7IMPGcenNbNJIGTJr0Vz8IalBk2z/7g9vpfWPxsBLXQPvRZklNjPo4O9NoAkLN0Ya3Hr+dsEzKFq2o1m4BtOgLL0UdVdA3jyJUek8EeXT8Shfe2UmZBSrgVj9NHaZmBQcqO9jqw+r5BLSF9OBQ+JoC9bZJgOTkV+wYIF7qXtVbgx6rBZnGsX+olJ9IBAyoalhVhbqtBHSu817hq/8rvM6kBAY1xlDHDI+mkif5E4yTIcJjXvgnYgH9WJo38bdOZMaMF21HpH6g==
Received: from MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::14)
 by DM6PR12MB3867.namprd12.prod.outlook.com (2603:10b6:5:1cf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:38:50 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::68) by MW4P220CA0009.outlook.office365.com
 (2603:10b6:303:115::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 08:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 08:38:49 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 1 Nov
 2021 08:38:47 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Date: Mon, 1 Nov 2021 16:38:12 +0800
Message-ID: <20211101083813.1224522-2-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211101083813.1224522-1-xuemingl@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31a19a55-b8bc-4f4b-9d87-08d99d1306f4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3867:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3867518D906F7DFC4565298EA18A9@DM6PR12MB3867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eKLSjluK+KR7w3D2ru1XAg1GAxwB0jD710xV5QnmHAxFkwGFZqj/LRWrbbyNHdDPDTDGuz8dbXw9rWU3qmcStF/psw+znpL4nNqKqiMbiuKqefDL+09m3lH0EHKTfYVQOjx2mvFE91MhTdclaMkTYXE5AK5Y9GKpQFYsCP5/I1f1V5/bjT3sT9l2zWVDSEMMD5ATiltsWPjm9Icsc71JDOBK44FAaukDkS7DEyxmmOB3AgYZoq1NJK4UohlYVxPMKZoIyUh6NWHy0HF9Pn0F41UDUbtC5cfkCkvcW3w7zPfvoRBcY26inOdlsaUrg73mcpNy7W76uRaWdPQ1MUo3TdRk+ov6azReFJ8LSddx1GHdyc8nML1jxZ1qn0UYwM6Q2dd6e/TmMcBzfFj4cQ/19kd5S2lXqnYWklsrKiLlilWfOKRYG+1/1/vI+dHVktTGslBXBh2ZF34SuG0S4JJ4inXzMX9RNuO8Xw+93Lbn2tAcEMCAha96M+CC00tRLG6rr23ECy3LtrbjO3M5wmPbLt6fTGzpa6aNFOwT2llIAe+6+xjyY3Tjcdwwl9pABH5RCzd3EGG5SpG9jm2XOZoMO/oEy4zzayqGGaYCW1sxA2LrhDvLiQzeEHSp1LEqO2hMPc8/1vxgLVz6hpGC0LYuJdQTJkC0GYmSRE1z94+BYf3S4TuNZv8V1TobZkfx/iEPV0kpueC6XJBV7LsBQryl/g==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(6286002)(4326008)(6916009)(47076005)(86362001)(2906002)(54906003)(83380400001)(316002)(7636003)(508600001)(55016002)(6666004)(356005)(5660300002)(8676002)(336012)(426003)(2616005)(70206006)(70586007)(1076003)(36860700001)(186003)(26005)(82310400003)(7696005)(16526019)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:38:49.5170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a19a55-b8bc-4f4b-9d87-08d99d1306f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3867
Received-SPF: softfail client-ip=40.107.236.79;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.736, DKIM_SIGNED=0.1,
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

When vhost-user vdpa client suspend, backend may close all resources,
VQ notifier mmap address become invalid, restore MR which contains
the invalid address is wrong. vdpa client will set VQ notifier after
reconnect.

This patch removes VQ notifier restore and related flags to avoid reusing
invalid address.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c         | 19 +------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bf6e50223c..c671719e9b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1143,19 +1143,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
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
@@ -1163,17 +1150,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
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
 
@@ -1538,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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
2.33.0


