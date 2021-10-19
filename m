Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56D432E98
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:50:46 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcixQ-0007KO-NA
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcila-0002Ho-9b; Tue, 19 Oct 2021 02:38:31 -0400
Received: from mail-co1nam11on2052.outbound.protection.outlook.com
 ([40.107.220.52]:23040 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcilX-0003qP-Ro; Tue, 19 Oct 2021 02:38:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6htOHNImsXyvCbvDl+m4eWTm83o535TDhyuQR+wswyut4SZHBvvDaTW9FVh5IizkCs9x9hjwFzz3q0ne5VHR+1K/3UP9CalGB1hUkgJ+WnMipb+dkrKsB6OWLVjnX9pWeZhPERkrdq9nuqL4dH3QD/P5/Pz3kto86tC6V7xEKqHHQhV8/GZGkshKwC+TW0p0/H4RIKiPOTPk9xk0rUzBUEkW/AiVgHbEnR14gliioTG/p2zwdHGaAz5A8nyg0wYh8H/Y/YggOt5juL38UAjzNdyo0vPG3freeOTNKccXNLFSafjQMcb4qrdbnNlTHgQHtIwBX01qRCnAh6kcgRk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDVoIDUEMDly/sZD06A5qPUIkKgJDYq68yzNn/igx+o=;
 b=IwsOiHXiQaEkW6+yKOj7w6Zbtq4ux4bEWzmij+89aPO77b2w7AKAgPBC5BOJpZ6R6X2Z9hl4mpbGuOzQzC2clsv6ogYJ+0T108IFmTGDZNnJjuCJWmMPPaI3X6XR+XP6fJEHl1GQk0vTWm8rYBiILrT999dIawhtz3oQeMiFLBXzTykbZmSgZS72FmDx0o4xnj2yPjxbXp0mAcFHsyvzumn4DOcU9k/ul3jnry25+eMCWlowudiww+sfmmD0JgSy9C4Pw69BEaY0ewkhLxD9oj6kUHiMJZyywCq9V9/ltp23L86E0bH0z7HMYuEakrgsFqOdrrLJja3iUZEVedEadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDVoIDUEMDly/sZD06A5qPUIkKgJDYq68yzNn/igx+o=;
 b=lwzU5kE7x7qH4RPG3kJuMipcUB2Feq3Fd+aTsVo4Bl6GgySfxhvQ+S6Ou+bk8rskKv9G05QhpIw1qBL8k3oFOtMqZyfsVxh4sQW/07AtBxZNM9Xjf2CQeOTaIkZIyn7bOHEJvfUohTWEd/c4jSJn65BCgwMrzAbuFGfNBEHehU92rXSYeWqbUAEDtH4qGFHWQLitmCkEdOjp8h81D/WGWqVhFBdT3OHVDwX3NZ63SKzARVJdDuSHD2R/NfCtpzZyXM3rEqHai30ufOyPKP+eoath5bABJPuZlNZseuANMVXNGcdOMp1VUXnbzxTvzXRr9oVGixfsbr6E5yygNqv6tA==
Received: from MWHPR03CA0012.namprd03.prod.outlook.com (2603:10b6:300:117::22)
 by MN2PR12MB3454.namprd12.prod.outlook.com (2603:10b6:208:c8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 06:38:21 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::aa) by MWHPR03CA0012.outlook.office365.com
 (2603:10b6:300:117::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 06:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 06:38:20 +0000
Received: from nvidia.com (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 06:38:10 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v4 2/2] vhost-user: remove VirtQ notifier restore
Date: Tue, 19 Oct 2021 14:37:55 +0800
Message-ID: <20211019063755.2150452-3-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019063755.2150452-1-xuemingl@nvidia.com>
References: <20211019063755.2150452-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb078104-c1dd-488f-911b-08d992cb0ad4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3454:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3454F41AF0FF1E4F9F308673A1BD9@MN2PR12MB3454.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5Ur7ohsopAhcGV/ZxkOq7AS370An1slBbS8gNUFro7q0ookgldoyQZY05pu4QpqyylX41zL3TnnXX+c0M7LiBARoVKgljpR4vg9NTqrFT3j3ax4NBlTdJvS3AVgNHaNT++TYtVkfr+mKX7pjoPzHJmHzPz1xXTWZtq8jKml5BAUkYBxoMtaUNO2x9RjGNFnztPiIsud9aaG07U6RODOiysb+chBTRfYXesBm0WmvcUUk0gqu25SnVaUMomtJ27lDP/DNlMoEoIczqjpiSBHqsiOhYhEFFxzZKwkYYW3YuYl48EidfjAVu8C3YfVadroWxGd8HYkj6oCWJM64NeIykSht3NGUhrZTOso/AKmAWhrxth56F5luq1VbC0v4LJ8vEYWrAtfeIBTJwmq2apJVZzkmqoToYQNIX1K7bo2f5sxGy0VQI0G9hKX5o9RiAKI+VzPdBsEqssy1/rKk3c1e/Uv9dnWVkd7ZRigv8/uZuNHPLeAEY/DNDMq7TFbqCmvMTDDpPgy+uupw65xPIUGrceNPn67y9gybYg4DYNRe7qTmrSP7/2pqNpCosSJRHnxdDKxGT98AowH7YbTXGfSSyqSswbS2BW/i/XSlPoRmcRY7gxzRXgJurLPGpVsoABVd6Ds9D8+4QFvza4suHF6eLQk2hfAwLndbdGYSlLof8ryL1uLpfxV88aueCo4aJ0jdUOr33zD5SviklT2SiU6HA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(70586007)(70206006)(6666004)(8676002)(47076005)(508600001)(16526019)(7696005)(6286002)(4326008)(8936002)(36756003)(426003)(2906002)(316002)(7636003)(83380400001)(54906003)(6916009)(55016002)(1076003)(82310400003)(336012)(356005)(36860700001)(26005)(186003)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:38:20.1785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb078104-c1dd-488f-911b-08d992cb0ad4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3454
Received-SPF: softfail client-ip=40.107.220.52;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When vhost-user vdpa client restart, VQ notifier resources become
invalid, no need to keep mmap, vdpa client will set VQ notifier after
reconnect.

Removes VQ notifier restore and related flags.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c         | 19 +------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index cfca1b9adc..cc33f4b042 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1144,19 +1144,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
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
@@ -1164,7 +1151,7 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
         if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
             /* Wait for VM threads accessing old flatview which contains notifier. */
@@ -1172,15 +1159,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
         }
         munmap(n->addr, qemu_real_host_page_size);
         n->addr = NULL;
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
 
@@ -1540,7 +1524,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


