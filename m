Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D4407E90
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSGA-0005nS-0n
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSDr-0003sF-6M; Sun, 12 Sep 2021 12:20:51 -0400
Received: from mail-dm6nam11on2073.outbound.protection.outlook.com
 ([40.107.223.73]:43578 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mPSDo-0001xU-Mv; Sun, 12 Sep 2021 12:20:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWMYpOgw2jtbu+viKcorY9MwpPT+acNoSmtT+IgCvi/IP/XIuNfH1U4vi3WlfXe1QVJ0ZLOoqWTbPsaWKdoRNapHG1AL4BalpgvAyddgC9UDml6SzVanRf0USx/b4PYq1kSnqb1KTvl1+YX4kXaWKpHWL3b+jaFD8cM40ZxTnl9KT/DMnRlaL0HIyE2ScCbdGsAI3UJXHliVR4fpoA+n8tX1RrJ/lO6Y+bvVRJ7Gi2lrQibDo77pezY40bbyfY6yRAyi5R0NVAoe1z0Ry0qNsBzv++QzY93ry8JLDOirCE1SZGk13w+D4tepgXH14FUvgzWtmALRJXOfvasze7P/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OmJmjbF0cqALuItlhZ1DN410IgtaLD1PAAIquAy9vVk=;
 b=WtdZPoxa0YDdrVqXevOg7V6ycwFc5dgdKvrL+G9Ux20SGKlFOmNuCAkI5Zm6Gt+O3YoW3koyuM023fiXmk2Vi/n/qqQgNAGhrT3tXCwPVMlZQp9SOYOrgqPwT4GCra9xmyf2muYic6FfgUfGHoyZVVLQbgrSjzPjhUPd9wRP5vriYUzxCuGowKl0a5SJN49Jb4eJunUBbmX4PWkti+5+SI5V1/x+sA2vr+JuLTAaBPsWsa49pxqwmpEQWwPHmvEUNxHY46iB12ameIweYZC/sAoNPXkEtxmFKbJaS/2VqIUR+rFbLMCK32cbIo7z1+YqRpej+6t0FmT7KrDLpqWGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmJmjbF0cqALuItlhZ1DN410IgtaLD1PAAIquAy9vVk=;
 b=JBp1VPM0bmYQWuwm8awvqjUzo5SeB8Djqx5JU5RgiHlhMMGIvQR1tbKtgep696WzgskZtzItFJe4sdZbSiOVbFtkl/yqxgmaF+maSbylj3ikPT4TanF8UyiC4OxGbvqWtG2LKh5V6Quj5TYI9Xn66tLhSltemMUkdih7Fkvr+UyfHDtIVIdzbp75Yrv4BE3ewd28QSQGqeFW/j5ITZXKozzqiFntrPv8jkWjAoB+Ll4Mf+AA4GDvS5+WRAP98Whuk9CHwjJB1ZLa1qSVTfHkXmt2yO9zgOjQQxs/GF0Br711IS5vLfrKK4yhDia+kMN/onZhh1z4NRMNbL5bimePSg==
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by BN8PR12MB2914.namprd12.prod.outlook.com (2603:10b6:408:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Sun, 12 Sep
 2021 16:20:45 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::57) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Sun, 12 Sep 2021 16:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Sun, 12 Sep 2021 16:20:45 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:44 +0000
Received: from nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sun, 12 Sep
 2021 16:20:42 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, <xuemingl@nvidia.com>,
 <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>
Subject: [PATCH 2/2] vhost-user: remove VirtQ notifier restore
Date: Mon, 13 Sep 2021 00:20:14 +0800
Message-ID: <20210912162014.106704-3-xuemingl@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: f700ef69-4f4a-4edd-8e8f-08d97609460d
X-MS-TrafficTypeDiagnostic: BN8PR12MB2914:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2914EAC756D401D07F6BA6C9A1D89@BN8PR12MB2914.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zP4nENV4A+ifnJbDDSRouQ/in3UGB0Z/sLM0UhL6Ca8xDSiC4I8kOKpqMCokL5tUI19qPOSzrMK6zbFD/wjx/lZfF/h1OmaWyMULzbRoXcXzT8/qisz4LuX/1HoAl4dxySil6/Nmht7QOLhonTf+/dM4HbD08UOlUU5Wayi4QpZ+7Wo6uGuCLH6ruIiDSuQ0h8+/rmgVElRHHgE7Qj8b/L+GQ7t4MiWDZmzqaRLqfD2f8IgrJt2EiMNvwzWFPeexF4bWHGLGXA9df/omI4eCm1Mvxd1+5EZ8FwjfgGT4f13/ZZxG+T4VPTx4MMG17iNjstk/6/McXrpy/zBipuzZNFsoq2x+eTcAxG51lrKLmYy0Cn/ukXbGLUiP6FMoklsDA9e6vOfTwQNjX9ajWoXI28hOf2Mboy/dbLVL3lJj/EgcpGjiO7+9cafuy8iguoAsYOb/K+eFnxXg8i3SZef2J3bmavEhZLDU4dKT0iEtFY9EspWiBTg7gHMRrGy4IXPtc40NlzidXqWN0mjYgyg5IapxQ/WNdp5jxvKY2sY5skoTrpl2iXMsASkBJMDFeeATpa6SBpc5Ty4OERCdFQ1opjwhq3kOEbR3277K7LmV9flNh+Fz+965752DizmqyTeTKWWEdUlW0eJQjsg6oKH38SeTnLbwaiwIMtkXFJ9gi4UyY24ohWicAeRnAT8xam//7SAcZ0oEenrYXjKO8LMlw==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(5660300002)(47076005)(70586007)(7696005)(8936002)(7636003)(6666004)(70206006)(336012)(6286002)(55016002)(6916009)(426003)(86362001)(8676002)(1076003)(36756003)(2616005)(36860700001)(16526019)(82310400003)(186003)(478600001)(26005)(4326008)(36906005)(316002)(356005)(54906003)(2906002)(83380400001)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 16:20:45.0573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f700ef69-4f4a-4edd-8e8f-08d97609460d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2914
Received-SPF: softfail client-ip=40.107.223.73;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
index 58722ab27c..fc688db884 100644
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
@@ -1163,21 +1150,18 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
         /* Wait VM threads accessing old flatview which contains notifier. */
         drain_call_rcu();
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
 
@@ -1536,7 +1520,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


