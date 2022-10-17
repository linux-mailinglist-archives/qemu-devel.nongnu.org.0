Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B860077A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:14:59 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKKv-0004Cc-GU
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJsw-0003eO-S0
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:46:12 -0400
Received: from mail-dm6nam11on2073.outbound.protection.outlook.com
 ([40.107.223.73]:18849 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJsc-0003Wh-8P
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:45:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5sL8dCDrAaKJK1T13DEFB3A/vvxDIIK7NWYfA7dy4sQWkXOokXmEPqJrisX7ne3t3loSPyn+9meediGLHp11yZDUrmcim8evO98pQE28MTqv0jCSeTuDJiUhY2ep6iFcEf8xE+FOtf9CIIK++MTwrh4KjAq93Fsua7xDEAkYxAhu+eknUaIEdBY2DWkdmbDBd7z2VyyXuSnt7hKL5G8xE3QwPqR/bQvz+IzUah5h0/GeF9BAsx8iEffyxqMqJ4dByy//4Osssltd6sXlpMwgFl5G62jzZMJi6dEwrhwE/pRLWA230f9w8YGlZ7AlSq1Pz0aEraty8cnAmGposTW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG1sJSfD9QgA4ZE81Ae8tkJyHtcgkO/NWyH4md1DWTU=;
 b=dad/FEll666XmIcQvejnvVSY9AffSMfiDms8Uxxk+8QQIvVrhlr6e7ocTmW6etafDkQ0psCmZgLg7sQPLyfAKyLCw7OFM/gxQLcL6eevF1vn2ls6xe+DzmfSFMrtnrWxakBFIQh5TdednLlCQNuCkg2mC903WL2GjI8387BN6PgSIjoH46QkbAaGMiVkn4Aylyght+hjMsy2OoTAZwpYsF0zTXXNwdAnqXSGdj54NZzkWER1XarK3R6114MS5mh9IToJdr/NVMlHqOyXECWEQ/rq26vFmVwDXqngEYnLvxI5pxPZ9wrVOfLEw4gswTdL8wdvmRi5Y+4QLRG6abcbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG1sJSfD9QgA4ZE81Ae8tkJyHtcgkO/NWyH4md1DWTU=;
 b=DuriSipFn/+KIDUx2lc/CpAkrwIKkmr1kAYoDX/XAxGdmtxqa2qfMCYZT5NeBM6YlWCP8LEoPA76zA0cNPiMyDZdza9SzSbUaGchi8wsI9kZgO5wwQoRVRgxVBuTSTjbKXBSRdIKyCq80VQfZmnEZeBDf3nKmoHPxYmZJ6oyXjH9Pk4dFz+NC2iizNOxyH5Vo2IrslsmKr+ZeAt9S7dlchDuTzb4CqZ52zJ0BCqOAQgEBvuLsJ3YczbW95L9fH6zVTDWdEJe2pDq4qzKiQVwz8w3uldNMHn31CYam+aoMJ5DSMkliUo2q4iEhATnWZfv8VdkOqAU4aPTXzgE4UCE9w==
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by PH7PR12MB7212.namprd12.prod.outlook.com (2603:10b6:510:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 06:45:39 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::4) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 06:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 06:45:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 16 Oct
 2022 23:45:17 -0700
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 16 Oct
 2022 23:45:16 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v3 1/2] vhost: Change the sequence of device start
Date: Mon, 17 Oct 2022 14:44:51 +0800
Message-ID: <20221017064452.1226514-2-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221017064452.1226514-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221017064452.1226514-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT057:EE_|PH7PR12MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: c48cbbc8-57bd-4ca7-7f60-08dab00b3155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxwCWPfIXcenY9h4wgzyBAFmY6cmWhfths3CfUHFBWzKZqZirMH3aDpztlaf8Z1YhH+iDIQOYxGM1jjFjlZ5XZBsZE5g8u+1kVmIWEpiR6t3Q47tR1APyIwbZgbteN7jzmrrjreOrT+Rg3NOVMK+uvakADbGVGvd26FSOdlifPkFWdDkyFQsyldrcum6gKz68UBLYhicgA6XpIgCyxOFF4F59E4nmtHaCCfUpxaKKRdUY5LaSpDLYaaD6EkP/ZnUlcf279v0pxeQ8M9LnFxWXa4F/HlPeXxY05qfwxXY0/SjCkmZpZ3U8RcL0O94/jIoDlFwITdPKkU5PtJbceU3l5izY69Uns/u4cUWizYuPy4U3DPMQ8jSWZ76T2gsg12k3CEGpZO+hFIQcj22dYwb9JPzzobd+oHOxfsUsGosXMPerbqGU95V/4hj19LnJyWPLQ1Q9zRHfqa+xW50tYIt4Zph7NNIp/+gKM7RWIjRjXcVipuuv3y9xIYP1pPNNYx914IX4uEvSAivFQB8N1xmmr0Eugab1M5Bf4ct/E8QETvCD9oZ0svVvzcLOMYoGBKg9Sbb6DQw1A1yAp/P7gq2lHRdBM/T6r+ouBGlnXQxY1aMtWd5ATxHRlh2XZ6xRB+a5T6ZY8kqfm+xuHWAIw6U3DzhCOL9hLL1MJJZuiwmEsrXh8kOw4eUazNtY95mZlVnfOI/S03Qvh8AyzlZvJxDcmbyMGGIusQJlAcfJvif66rLPiHrkQy+vGIIsVx9nmBDtDg/lYKRgsoQBWvcECudUQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(110136005)(6636002)(70206006)(8676002)(70586007)(6666004)(36756003)(316002)(7696005)(41300700001)(5660300002)(36860700001)(55016003)(26005)(47076005)(6286002)(426003)(86362001)(40480700001)(8936002)(40460700003)(7636003)(356005)(83380400001)(2906002)(82740400003)(2616005)(1076003)(186003)(16526019)(478600001)(82310400005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 06:45:34.2818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48cbbc8-57bd-4ca7-7f60-08dab00b3155
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7212
Received-SPF: softfail client-ip=40.107.223.73; envelope-from=yajunw@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This patch is part of adding vhost-user vhost_dev_start support. The
motivation is to improve backend configuration speed and reduce live
migration VM downtime.

Moving the device start routines after finishing all the necessary device
and VQ configuration, further aligning to the virtio specification for
"device initialization sequence".

Following patch will add vhost-user vhost_dev_start support.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

---
 hw/block/vhost-user-blk.c | 18 +++++++++++-------
 hw/net/vhost_net.c        | 12 ++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 84902dde17..f4deb8cd5d 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -164,13 +164,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         goto err_guest_notifiers;
     }
 
-    ret = vhost_dev_start(&s->dev, vdev);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Error starting vhost");
-        goto err_guest_notifiers;
-    }
-    s->started_vu = true;
-
     /* guest_notifier_mask/pending not used yet, so just unmask
      * everything here. virtio-pci will do the right thing by
      * enabling/disabling irqfd.
@@ -179,9 +172,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         vhost_virtqueue_mask(&s->dev, vdev, i, false);
     }
 
+    s->dev.vq_index_end = s->dev.nvqs;
+    ret = vhost_dev_start(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error starting vhost");
+        goto err_guest_notifiers;
+    }
+    s->started_vu = true;
+
     return ret;
 
 err_guest_notifiers:
+    for (i = 0; i < s->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&s->dev, vdev, i, true);
+    }
     k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
 err_host_notifiers:
     vhost_dev_disable_notifiers(&s->dev, vdev);
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..d6924f5e57 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -387,21 +387,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
-
-        if (r < 0) {
-            goto err_start;
-        }
 
         if (peer->vring_enable) {
             /* restore vring enable state */
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
-                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
+
+        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        if (r < 0) {
+            vhost_net_stop_one(get_vhost_net(peer), dev);
+            goto err_start;
+        }
     }
 
     return 0;
-- 
2.27.0


