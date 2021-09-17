Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42940F77A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:28:51 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCz4-0005f1-JJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRCxA-0003Ux-4o; Fri, 17 Sep 2021 08:26:52 -0400
Received: from mail-dm6nam12on2043.outbound.protection.outlook.com
 ([40.107.243.43]:4064 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRCx7-0005pM-JS; Fri, 17 Sep 2021 08:26:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPb+J+Ej0K7/+pho5+hK/QnVIxKsmE+4iJ7kyiR4Cs2yMhgtTYiiMnp4PhL1SEMieUwmKmJhCViq+ajuKD3chDrKhqISEYO2mrAZ/zzHmlrQDmTPnyRATzSorqOZVOPidYrsDwgfXs+ZvmqoUphpOQ/tZjkCS9/JMAcPa6oOfafLmLXc7LUb9/R5d8bk/5oTMMHhLcHX2bso8ZehWimmiwXcXSZbPPhZ51XXjOTV2uutTYn3VeBONeaYvNh3/TGSHIHju0Sexq3p12TYgaENmrLZ7Y7FSJbmx1j+bviq+IYnzXPeup384sn+dKY5oZhvzFFPgf4Ii9N8+mIXAQXy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Tl1kvGroobiX9ae/CdkRD3SLIl5vyxhq5fU0WkdeywU=;
 b=nj6V6iHDKQOxs5AiFkYB+/rNJdDjqH81kcEEdww4pt56lthzUEl/FWENbEIoVYdhFXgsCDqALzsCrGTv5UY41uOVsjkf477a8DvsGx6KWE8Gz0U8l9o1n1tvHPCWh8l0GIZKicWgijgErssDYGLB4mSueko0bDCejfVm8XH/lXzD9bO7XdLK28CzmNrIaJ49HO2YTOFCRef/nJsMDbHeTjXiBkmWCgyfG4zPxc/27aK/PRd7O19bQtsgqiJKQwVGLRa5+RJTKb4uk+cbHX3mXgzd3QZb2fUMzTo4r90MmXFEwoMuvyfomE1yJbZlccrAuExYm1kBM4mBwBETT/hwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1kvGroobiX9ae/CdkRD3SLIl5vyxhq5fU0WkdeywU=;
 b=LU8MNvHgpvGkP+i8z8f5ol4J/GDafo8UQ3XuXP1k603/32oNn9xgaZh0YgIZKcyTR7jytGBWHKvfr/8x8ByTtaWuqAIh2IMBlJldSAnyk1LnreuVhhuNP36J03gTNTnTdWfDK4Ymf0GXPGrRuKsDgwTh7N47jWFEgIQ9iFj+rgD+L2Uwtu/zGx7eBTxaTGnmGqb3u1nNpwf746W91bBBQIypCpi5HgUjVc5uZLzmMYClT5zngNE0tAeQfqgSpUJxoZ/2A5BBnKQ9gfYpPhxmpO4jrLuCZnJkIIz3hSWyEIrx7zRf2UQDDJAFnfA8qrY8nnyx8SqZ04IKzhX11PcTFQ==
Received: from BN1PR14CA0017.namprd14.prod.outlook.com (2603:10b6:408:e3::22)
 by MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 12:26:45 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::8e) by BN1PR14CA0017.outlook.office365.com
 (2603:10b6:408:e3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 12:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 12:26:44 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:26:44 +0000
Received: from nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:26:42 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v2 1/2] vhost-user: fix VirtQ notifier cleanup
Date: Fri, 17 Sep 2021 20:26:15 +0800
Message-ID: <20210917122616.6067-2-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917122616.6067-1-xuemingl@nvidia.com>
References: <20210912162014.106704-1-xuemingl@nvidia.com>
 <20210917122616.6067-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 202d71b4-4898-4f23-abf9-08d979d6698f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3997DECA01895D285E0D7CE0A1DD9@MN2PR12MB3997.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47TiicxfShUx8o/csoRBX99PjG5+X/xI5uWpiPazg8LJuRc6B1+tQkn1mPKuHp0SG3IDMa5gTJ52Sz9c9hSMSWDjmT15MQcM/oXq2mlzc75MjwX9GeIVtnYHCcWfZj1uVuiqfc/uloVpWqwQZu2EqXxeqL8uhnZbpQutjX3yvxes/7KP8W9Sz9mwCn4eJ4SM52jALU/g0jnhReImnyOCSy6Duxt20XetEKo55uT4cAy1HRrDuZujp6PiUmc4Y0AFfrfKvk/HbojDOcQzOigkx4FPxbT1YadNq8NNIlH44IQbPWGnmyOzQiCt6176xnDKiaVDmjzO0V4Fa7Q3kcn1DgqM00T3w9zIDf/ZpSx2SjzSW7DDAe48wHd0EuYUr9sD7huOTTHjFOJFfgb/DU7EaREISBKaahkXTWKIk6KnOL+Xg2CVcy+Me3Q5XppAAXWD5QLsyWrmnfPXqO53fisS1iO1gmeOVoJGCLdz2URpeKRi6HTKprHHoGAx6Y2LtU03y7PWtkBf3frmjXSKRc2lnjR0sJ19VGEgrfBCbp9slEdB3ha+OnDCt2yd+XD8OXRT65HxGHjeNK47Ha8hiwFsk2BoYbOfF2GzHXt9NQJ6zpIgvIaAaEqrUjzF+5/5ZhAGG/kppunmdBQ+S2Yg2gMy+RFG7r81jWFb/UfnNZpAhSs0FtdQLKoOQI682YY+JhnP/yFzXwKirPylcbajLKSErQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(426003)(2616005)(6286002)(82740400003)(36756003)(5660300002)(70586007)(2906002)(6666004)(83380400001)(8936002)(70206006)(1076003)(26005)(186003)(86362001)(336012)(7636003)(16526019)(356005)(36906005)(55016002)(478600001)(6916009)(47076005)(316002)(82310400003)(4326008)(8676002)(36860700001)(54906003)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:26:44.9054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202d71b4-4898-4f23-abf9-08d979d6698f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
Received-SPF: softfail client-ip=40.107.243.43;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

When vhost-user device stop and unmmap notifier address, vCPU thread
that writing the notifier via old flatview failed with accessing invalid
address.

To avoid this concurrent issue, wait memory flatview update by draining
rcu callbacks before unmaping notifiers.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..08581e6711 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1165,6 +1165,11 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
 
     if (n->addr && n->set) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        if (!qemu_in_vcpu_thread())
+            /* Wait vCPU threads accessing notifier via old flatview. */
+            drain_call_rcu();
+        munmap(n->addr, qemu_real_host_page_size);
+        n->addr = NULL;
         n->set = false;
     }
 }
@@ -1502,12 +1507,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     n = &user->notifier[queue_idx];
 
-    if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        object_unparent(OBJECT(&n->mr));
-        munmap(n->addr, page_size);
-        n->addr = NULL;
-    }
+    vhost_user_host_notifier_remove(dev, queue_idx);
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
         return 0;
@@ -2484,11 +2484,17 @@ void vhost_user_cleanup(VhostUserState *user)
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (user->notifier[i].addr) {
             object_unparent(OBJECT(&user->notifier[i].mr));
+        }
+    }
+    memory_region_transaction_commit();
+    /* Wait VM threads accessing old flatview which contains notifier. */
+    drain_call_rcu();
+    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
+        if (user->notifier[i].addr) {
             munmap(user->notifier[i].addr, qemu_real_host_page_size);
             user->notifier[i].addr = NULL;
         }
     }
-    memory_region_transaction_commit();
     user->chr = NULL;
 }
 
-- 
2.33.0


