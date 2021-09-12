Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AC407E8F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSG9-0005r2-LJ
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSDz-0003xs-9U; Sun, 12 Sep 2021 12:21:01 -0400
Received: from mail-dm6nam08on2077.outbound.protection.outlook.com
 ([40.107.102.77]:44641 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSDm-0001vW-7A; Sun, 12 Sep 2021 12:20:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apKC1kfRGB+sR6O3/dzXwe++gW0aVFKYBtdjngC0AJV1NM/DsLXiFmf5gBnhnZeDB73pQXJDxtCXkcHdyP84VzTU4L8Gvcc8SI5ZZFVAgKig9GIIp6hYTpRyOpEuTpshmROl+BeuFl1zxf9rntQ6YAEgYlXOPwuSPcQnJH9E1IovkvkvtVB9jJLyODIfRnlNN1oRDL0Gid5Qm/W4lJdHnySyZJTeZwEltP3dsYxcWmrjmRDDkzAJWQaeEOj5PW7v9vKXaTVtnHgztDIuxafzcGHNG/wcZUbRTtyf/NyVOJFAutISTMnOle7NdBr8LpHG/wRHcA7wQwLheNCq1zW9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0/zXjAw8Ik2iPySqFG7FI/a4jDrjRwm026xP0dbEDz4=;
 b=FNbyZR4adMg7nCoKw2gl/6c18d/sjo1/3sFi1KQSbkNw+Saiqo4mJ/Nq1qx59GhwhPUG+106ejtXwf5wzHECmrzx+Bf5wQIvy85oGyqoMay/9VR3jGwDXQ9NbRs6B21dmKuRakbusXMZZGP+xJA1tSSmUXFOLmYIXXfzzvpbX1l26xmpcn6ScjGkIF9RLSTj27D/0PzKd+pZDemekJweqASjR8R8rmOfc0GrNt9fWLNXOZsKgLsxkxzOGx4etP5Ap5I7J1I5bSmT/kxlVIRiL9LksOleJqZmeLMYdpvt5baY8L99/AlpB04/QSNQ90I+Q/OxuHyYaRJPbbCzzQeVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/zXjAw8Ik2iPySqFG7FI/a4jDrjRwm026xP0dbEDz4=;
 b=sUxY3t//y2R2t5EMzDj3iSbbOLYOKg/cC3vOp2H6Qatysyh32auKXoikrbLB6z14JowVM6FDVhl8E7Dg22LRfj/eXInhup6byKhNvN5fM9FmMEbWHIccSZsU/6sPdew1xcNuOsTa4U/MDUu7P19xyqga0TWak9qL0xbaGaJMsuNzGP3S5CN4KYZNW+DBMaQml4HjgaBWj9xGSCweZVdA8A4GPv9eqBBM6BOeWF5y2ywz0Y1DuKxM2o4bsV9VqIQQHWHCJxOKaSif8rmDQEK5sg1YyurTrfdGoJX95Xy9jbZDjSq+hDFcgyfaBXgCqIKU9iB21wA933zNYueJ3TGwtQ==
Received: from MW3PR06CA0016.namprd06.prod.outlook.com (2603:10b6:303:2a::21)
 by BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Sun, 12 Sep
 2021 16:20:42 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::c3) by MW3PR06CA0016.outlook.office365.com
 (2603:10b6:303:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Sun, 12 Sep 2021 16:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Sun, 12 Sep 2021 16:20:42 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:42 +0000
Received: from nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:39 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, <xuemingl@nvidia.com>,
 <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>
Subject: [PATCH 1/2] vhost-user: fix VirtQ notifier cleanup
Date: Mon, 13 Sep 2021 00:20:13 +0800
Message-ID: <20210912162014.106704-2-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912162014.106704-1-xuemingl@nvidia.com>
References: <20210912162014.106704-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9425358-1c4b-489c-f315-08d976094467
X-MS-TrafficTypeDiagnostic: BN9PR12MB5068:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5068F350176F76D04C6D358EA1D89@BN9PR12MB5068.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVEUNSYb4w+Yusgppv3H1HZjn4DmtyUoPHfk4RcprAGBjdjxEFq5dqWDf5vIn2dj0GXJqo+5P6El+usHGtMhiyDHdAZl9wwHU/ArV0+FNDqGcDMfAavX/yuTOwlLfGh/WvbA6nR4wRRR4mZnZ5Z2KCsaGPWg6JmWy/g0DoZVUCMhIFqMv0plOurmVp6QI1DEepKJSjR6kkV5T1VjSOCtlqu6mEEmaYyGu6r4ZnCYzlXH1kbD9eFl4NMmTkIQXUrYeovalI+Kum/e16qKsaXT9itWCD7l39H2jGCYm+GizY/iiOhK9zhvPYPqAIg8SwEVd4j4FlKMidwa52J54j1FTF9FVnUIWqbGj2Qca6pP2tr9UwCfBzQ5QHi71FpxDQ0TrSTPTItJuzNrRqqlqFU7nGPaIBn5grLVyxFMeJ3pwZFGU4ABUDz2qbrHgFcz0ZHyi0Ej37qVNZXVg6GjLlxluAXEGCp1lwULXs+f9P+cWlSQep383xMTPKbwykQqV+n+xlin3NwCdzqbwsDPMPSQT9IOh0qq2xyq7Nf0x0miN5RP1BiO7XJt/CVoWpIGfAIGjDb3UoO9gorkcdI9tGQaYIO9hI4O8YC2NnokQ/TCBHaJ6/3wdF+tPRCSvC4pHYu+Z07XQGXJCvrrnjcvZT1d4IelbTnSbTQHNtoHiZ3qahlz7vry80jJEYNgsUJ9MoKWTR0TcdtQA9XPqCjA4qGaCA==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(7636003)(336012)(26005)(36860700001)(5660300002)(83380400001)(54906003)(7696005)(82740400003)(82310400003)(86362001)(70206006)(47076005)(70586007)(316002)(2616005)(8676002)(6916009)(4326008)(16526019)(36756003)(186003)(478600001)(426003)(356005)(6286002)(1076003)(2906002)(8936002)(6666004)(36906005)(55016002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 16:20:42.2932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9425358-1c4b-489c-f315-08d976094467
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5068
Received-SPF: softfail client-ip=40.107.102.77;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 hw/virtio/vhost-user.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..58722ab27c 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1165,6 +1165,10 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
 
     if (n->addr && n->set) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        /* Wait VM threads accessing old flatview which contains notifier. */
+        drain_call_rcu();
+        munmap(n->addr, qemu_real_host_page_size);
+        n->addr = NULL;
         n->set = false;
     }
 }
@@ -1502,12 +1506,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
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
@@ -2484,11 +2483,17 @@ void vhost_user_cleanup(VhostUserState *user)
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


