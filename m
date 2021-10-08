Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FE426588
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:01:15 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkoc-00048q-30
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkmE-0001z0-IC; Fri, 08 Oct 2021 03:58:46 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com
 ([40.107.236.78]:21517 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkmC-0000og-M9; Fri, 08 Oct 2021 03:58:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuHRa0wF2XV8mvJgOrof6xcQfCesD3BgpFQotSkQcEJYKshUzvdiVl8qj3e3lMMfCG0DwY6C5Ayat0FqQP/pZSZyRzyLTnyztQWIsiT8AipS4ek+quNsaGN9tpDFHmtQw3XsgwfJVLaBmx6RWh6ubM4cCxjZNda7zJGecmBs+/A+dtojLARhF7JmTvWdhklTG1jhoyX938B6B5/dHd7dBi9BrpUtafk0OsxY1pNmse+qvSt+uqaSh32CDV0YLjjlsUONiTGYZy11b0nS6aktd2ANd+frUlwTCpezr7QlL/Y3XE+P51+rXmyosW9erwv9hq0G3eMMN15taWf4cVBzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWvLbWjhl74zxtOSiO9pgU6Uh42gOEGV0hyNlfk+e3M=;
 b=h/Xg2n6EqqYaXRx/fxuvoEWDh/PIdGereThGxFA3Hlqqq8FI9hwRKOpTSjiyFbuT8RMblv5B7JRWcZKiT6sIBaM3p6Afj+u5ppJku8YN/mRiawJhFpflPo5Oauhlu44OQxziZPBZim/NblE+0gKY+Iag0Gb3RTYun3la4SWDDjeVqNCPupdCfKjL9O8E9V0nbPVk7STQCCFGnvEjMREBkNDPpJuWGSWc78nfUTY2HDzWw0+OuorO4SJXHnvZTFGg7R820yER6wT5dMm8MliDZ2tv7X/mN1jE3N5AEIeSNCcLFoF5luT49NTx4AJFIf6fxRVhDDRlfkEsfsXmSmEu7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWvLbWjhl74zxtOSiO9pgU6Uh42gOEGV0hyNlfk+e3M=;
 b=CtNUCfJ35gIXV7hcQCxCZSNGtExr5rsNMIWD88KAp21hxlJ9rZ80B8L+ijaoORSjOLf7yTztAXIO5IELaTjmfXM3XG6G8BWUlSTHVbo8IlQOuBvGXS27tQeDkt5dTcMUOEGo9stAc3jGnFHDNap+KdAjyJTA/D/BtICx6hIBqnJEU3K4PV9lUUbcG2FfzrpxhsbZcI75H46MJt9wjR/P0OO/PH6yhGXiRUVXYNMiEG1NowincG0Uapxs76G+N0p0/wXbLErqYC6wqR78g/s5wQtFXs1zq3Q1/I+3aBj089vn50MQjveTCsrNLXlnWpBzxbNhQElzEt9NzxZEoqPk2w==
Received: from DS7PR03CA0186.namprd03.prod.outlook.com (2603:10b6:5:3b6::11)
 by SA0PR12MB4573.namprd12.prod.outlook.com (2603:10b6:806:9c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:58:40 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::f) by DS7PR03CA0186.outlook.office365.com
 (2603:10b6:5:3b6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 07:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 07:58:40 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 07:58:37 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v3 1/2] vhost-user: fix VirtQ notifier cleanup
Date: Fri, 8 Oct 2021 15:58:04 +0800
Message-ID: <20211008075805.589644-2-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008075805.589644-1-xuemingl@nvidia.com>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cba1a14-9450-4195-ec6b-08d98a3170fc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4573:
X-Microsoft-Antispam-PRVS: <SA0PR12MB457357A333CA96111C3D64E7A1B29@SA0PR12MB4573.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xng+qFPo1N7MClv0F6Osyeogv0GAmy8fyIOQ+6V++rGVseRmteVvtZST5y6+yPaZ+w9YrJKrRuhvO6okXCeHbqZB6FZ239UHXUehdQTJoywvy5JvogjAr3CILBLva8RSE9iwvRVmOgAEHZROuD+jdYjTS6ocnBtj3GMNDIHsuqDtvuK1OG0WPT238qe1IFYh7/bgDpOp6urV2EV85rx9FjUWgwUNtV0t3UI79jnf7MjQPFEhE0AVLatfhkt8WvDymSntd3F/ITiqd/UUX/y8h8eD1xCh6FzEBwAgF+B8t/3XnSFK3ETL1exzL/7p3t62LjBsmPGeeAHJVA++QIIy2B/FdjSiftd4+a/EwUQ2g1qcE2+XiT8tT4did0uTOMDnP9VzbJ20FBPxeCt2O74PtPITuEuuLJ9vS+gRF6CHm27U85D+NcTcEG0KrjTtRumi7J7PTY9RiqO/2UNZ6b6sEfNkck8NZB/+gLQTIH8ghr8l9ukm79ViPjNC7wBzIce3IMXybxeQwjLsHPd3zw0fJb0ZfIu178VwCgsFWQMRThDZwL/0xeu8McwJTvPSRUyCJt/umizqdO19trZWfSCguNyt1cwjp7FfW5nSLo2u1JEtkjXaNEDiBf1iW5j3zyoAq2B3h+J/SFOOaaW7ifcNngGpuKF2Zcee+7ZKDXjU5WZJOM+XlOhayDVwvwg9d1EZZDRXoykBN/EqdZrQMT0oA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(426003)(47076005)(83380400001)(1076003)(36756003)(7636003)(82310400003)(356005)(6916009)(2616005)(2906002)(6286002)(6666004)(8676002)(70206006)(86362001)(7696005)(186003)(26005)(16526019)(36860700001)(316002)(8936002)(5660300002)(55016002)(54906003)(4326008)(36906005)(70586007)(508600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:58:40.1421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cba1a14-9450-4195-ec6b-08d98a3170fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4573
Received-SPF: softfail client-ip=40.107.236.78;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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

When vhost-user device cleanup and unmmap notifier address, VM cpu
thread that writing the notifier failed with accessing invalid address.

To avoid this concurrent issue, wait memory flatview update by draining
rcu callbacks, then unmap notifiers.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bf6e50223c..b2e948bdc7 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1165,6 +1165,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
 
     if (n->addr && n->set) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
+            /* Wait for VM threads accessing old flatview which contains notifier. */
+            drain_call_rcu();
+        }
+        munmap(n->addr, qemu_real_host_page_size);
+        n->addr = NULL;
         n->set = false;
     }
 }
@@ -1502,12 +1508,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
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
@@ -2485,11 +2486,17 @@ void vhost_user_cleanup(VhostUserState *user)
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (user->notifier[i].addr) {
             object_unparent(OBJECT(&user->notifier[i].mr));
+        }
+    }
+    memory_region_transaction_commit();
+    /* Wait for VM threads accessing old flatview which contains notifier. */
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


