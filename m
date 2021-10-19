Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9A4330D5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:10:49 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckCu-0000VH-HO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0t-0005Oy-L6; Tue, 19 Oct 2021 03:58:25 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com
 ([40.107.244.87]:42848 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0q-0001xi-Oj; Tue, 19 Oct 2021 03:58:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD4CzFPGx0JeE3JOEqA8u5Bc0uxkuDG3whl2lSZEHhq2FYwIFsBjZEbbD4bTxQvGQPpVPtRbBNniN4oXqrFmjAKHc3kYDSRpT2FH6bQ2CMotEYcGEW/nidaftKd/7naZ1sQ3rq2tkugJ4S2g06brIp2dxVb24wlDiMDklvaCQOIjQfXQAklIw3IzNk4NiPTbryDYMn6KJLBGMC1tUQL0LB9fyFe3KsftXKEh4x5cAGqVslbeOy9nEMgAoqVQ1BlYPLYX+MQGVRYSJI2stjVa+KU/8ihMNJsvQ0nh/0TGUfs6ZBrzw6ldSzyZVAIhm/JI/iTuSeXAKNlNbETmSU9yMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl9ivjFLwPZKKbsQBXVlEmracvpuo2usrmkis6izXl4=;
 b=VAcT1YrGp1JtUarKR8glLOUTfF9fccAd9V4Z5XzCg2/nwX0JDPIeaDd/BWTBdgsGO2ddG81Chp80bZ7erYeSjYK8UZgku8ucIy2CZUzsuflV0YcTP3Ccc9y6zOaeaHffZuQhvps3/VQQDJiDnNzpVadh42bdrXQCi3EofvUawE4HjONqheQCq9Ad4jv/8PfNrBcWE7DyGwDO7VUlzjvf273D8sDurSoDqQ87NiscfgSWwVojPTahtD+OhAQN/XMMuY+YkXw36vUi7Wh04ICsSJsAqry5WrRHzR1Fx6iIisJp7t3qhlyiaa8DeYOXXNiAjB6je3XkqBBHj+LSlEH0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl9ivjFLwPZKKbsQBXVlEmracvpuo2usrmkis6izXl4=;
 b=Gi//u+7ANzZrLdQPbLptpCrSoqjuxaftwmH3/4b7ce5eJYTtjc3vhhtzaXIFYaO58mLyb77URmB91iDuwCJFlAfA17my/sOLIltu2vDGq0uZePQIKfCnI38DB//pyxktPIdORnMci1Wq8SA1wuLF0U9EtnuD7UfBNR1DDGUl/tMDdLP7sgCmBSC9MtGQi8EdNcIWm0nzYZsWrB54i/UDhy/Jt8pL+E7cQxCNJHT5XSR2ADRqMO/lZB48DOsBiKpgK7xQzzMkVa5FxC3sASFTAYugwn4XGUD+nLCYpRF8EV5vX+SsIyqExEAe1uOAQYVS2my9cme7IJtRCMZkpYF29A==
Received: from CO2PR04CA0089.namprd04.prod.outlook.com (2603:10b6:104:6::15)
 by CY4PR12MB1638.namprd12.prod.outlook.com (2603:10b6:910:10::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 07:58:16 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::c1) by CO2PR04CA0089.outlook.office365.com
 (2603:10b6:104:6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 19 Oct 2021 07:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:58:15 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 07:58:07 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 2/2] vhost-user: remove VirtQ notifier restore
Date: Tue, 19 Oct 2021 15:57:43 +0800
Message-ID: <20211019075743.2162432-3-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019075743.2162432-1-xuemingl@nvidia.com>
References: <20211019075743.2162432-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f7b05b-7f62-47d6-e6f2-08d992d63544
X-MS-TrafficTypeDiagnostic: CY4PR12MB1638:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1638CFC6900C887309CA8F17A1BD9@CY4PR12MB1638.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7CT5sm+mZ4MNlg583YGsKy7nWr0b6CfGqKUsz3XNSuaTHhTzOhe/Ds6zes3C6DCHpVDZITTDDK5ieh2dKeREGdk+snFMD8ZXFLUD0v3nJQfxGc0QZmmrqIB5J6+zfUw4qxQ8+qPyOIzDL++aqW1AXm/cbWUma6gXTkHy4eIHI5G7WbXGqTTNezjPaS4MDTpLNyJUqL0Q8jpU8/BKuZTAEhW1jrt/Hy725zwyT691HligwoO6zV4jg+VjRCq0CY1Gr+cyTjzPcT+DdMY1sbAYl3IwqvRy2LYEvfYelnERohl1WeixlpRpcbMqlhhZ1YvjOZTBfG5j884N8gJG2/S+4BYitp5i8ft3i2Klyc80WZjtdA9s7gjXNL3axxhQfcWJKkGAKY7BKsaliVEz6f9KN6dVWo2cTnDReiSnAgot5BUGNoVqZogG3gu1C86s67+5sCpyYAsQkDNqfgtwgxfRnJ3FAm5eaWoVm0R42cGSHS6Wp88ViLymvlp6I716XHwas0qRe/cbxugP2zmYiED/m/9UBtS85TMVG8CSPao1Yx3NacR1VHMKCbynysoX+89yR6u9aj8tcE3zgG+0AD8MO5uYvFE73zT0iyTENBgnRc/TkfGoBwQqyHtFbM9A8QetnS5F9kU9H/9bN4pCygZPpHDURHSrJFQB5G782H5iAdM3FMIrbMemtPJuvtbM8tchfdSqRogzfkR59/oSDh/qA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(36860700001)(8936002)(5660300002)(186003)(7696005)(54906003)(70586007)(8676002)(2906002)(70206006)(26005)(6666004)(47076005)(1076003)(6916009)(16526019)(336012)(508600001)(356005)(316002)(83380400001)(36906005)(82310400003)(7636003)(36756003)(2616005)(55016002)(6286002)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:58:15.9224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f7b05b-7f62-47d6-e6f2-08d992d63544
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1638
Received-SPF: softfail client-ip=40.107.244.87;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

When vhost-user vdpa client restart, VQ notifier mmap address and MR
become invalid, restore MR only is wrong. vdpa client will set VQ
notifier after reconnect.

This patch removes VQ notifier restore and related flags.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
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


