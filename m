Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63E426591
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:04:15 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkrW-0007Ky-7g
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkmF-00021e-Sv; Fri, 08 Oct 2021 03:58:47 -0400
Received: from mail-dm6nam08on2044.outbound.protection.outlook.com
 ([40.107.102.44]:56161 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkmD-0000pJ-UP; Fri, 08 Oct 2021 03:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iztGMcvEysV39K9/hyVaKTgmOIMIVxX//bqskefWYlVU+FhLkCD0deiMT5xBvnN5HbfLWdARj1LKpuKWmeh6E6lwX0ukZ0BRMvXr9GlOzIVZGS89lnm52vrPaS3889nsKfbGElf41YGIqTBUV6tQUJMlzWFKo7HvlpkMq/ZZQ+mR4BBXTaN+df4j360WTJEsj/JVH7AWAxCBIq+FVvwtlVNYEXrLlT0sx2jBE7S20JrE9+NQsmXlNVtqzqjsnhrWpDaYzUkditiCUC7MOGCPrxgsn7QLGg88fJ8z5lDTcI5sPlg4SWqyvt5/Pn5+PArG78iNSdKfx9OxYfePJpiz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgMTWS1YuIOfxON4sI1x+s50sUy7PWpl6TMVIFc2GOQ=;
 b=hH+Y7ydBuwis7g/Nq6xtLYVwwN5ihMROQfZ15lqjXDQEnoMsJ2yK44yAAjT1maRaS2lcnBhqg+ssb6utJC4GnBX5j6xuqxSnZI0M6FgOrMBO+KbKQbog62VViCNQAm9Wnf51dOnK5KBrDZh5PDWnNyzcgV55/oGKyK4qhgx/4Apxnlg2v9yhDvFIftLGKffdz84Fy1+yoSKg3pkJ9r2FtKnIlCOYZ+SYbTZc9GVMXirmhD/yiOgVQKmTyeV6R+jzuBhZul7kPWNS5VAttgsodhOzZh1jjx2Edropdtog+jvgYnrRMdSp3FoBUkMceS/pOgVz73zCUxf4p6WIp/WFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgMTWS1YuIOfxON4sI1x+s50sUy7PWpl6TMVIFc2GOQ=;
 b=fpwJjItddTD/0zF/JiU3HjgEF5K6qnyWf4rYJu1aPpfrdIT6iiHA8n+ooShLwp95zm68s7VsalBxMhR5OXO5Nqh3VLlozzhcICeFGl3Wh8HUC0DlhlfP0q+jgfs8wupFhBpMYddvcDuBW3XTsKJNaEY4HB/wJuZ+fUZyTbmoMv/fnGJ5O+97uFcn9ZtmOObbGA3jn8XMByttHV90wNzmOTexc7OyhsBo9ar7HpysT8Y5//IEeHniiXCFKA7DhCOLPb8XcbM4DaUZz0vDUoShag+Qxqw6YQhyHReEzgZdKNhvSnrtgiRONBDkzuhotYNyBYB0GRuKL6Hl+LsXVlmRKw==
Received: from DM6PR02CA0122.namprd02.prod.outlook.com (2603:10b6:5:1b4::24)
 by DM6PR12MB4925.namprd12.prod.outlook.com (2603:10b6:5:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:58:43 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::50) by DM6PR02CA0122.outlook.office365.com
 (2603:10b6:5:1b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 07:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 07:58:42 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 07:58:40 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Date: Fri, 8 Oct 2021 15:58:05 +0800
Message-ID: <20211008075805.589644-3-xuemingl@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7e9ab72-7906-4250-d3c3-08d98a317260
X-MS-TrafficTypeDiagnostic: DM6PR12MB4925:
X-Microsoft-Antispam-PRVS: <DM6PR12MB49251D36703E0E20FABC6C1CA1B29@DM6PR12MB4925.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9+Y0FJPE2AfLTNmkyeCzCyEjvFktLWYuEN1wyL5avQ9v265gz0r5CPDU2Aj34BstWMcwb8NT9By66+lTuLQ5OciKz4IlgIwmwvRzrdP4Knn2KMML5l3EzW7Lmra+GdJJGOaawE3BsZq6fMPye/g3LTAijL5yRMAuPeZEle/wo3K6i15XMbdE7sjLOPAaq5k9dwZMhFH+zdKjiKE09ZlIFYEEQWox3hy9ZXzHPWwOFqQOiE9QdP0YKWu1VvO5fk+WDbTczaW3gfGtj/c22hsERkEZnHxy5prWPNtpSDzNfPomOesIP/EaJoGmhDnDLdsF59F9b/1c9IODJqKzRUPwL4T6kRok1gwZBTjvrz/UNGu8XTxS97rVwCOZxZN2vweY/8C2cuTf9qccsNeW2+EmWgCSxwpsGblZVssTO1EiHEs+TlN5dwOhmRI5/xnOkvqWvGa165JtrlaeVhSZ4SNm3z+C/urCS5GjdfQpkSmSnqc5XP99I21iiGHnkUnN03b25a17mjg4zB/IOGRJeW8/ewmCqFhmH4Ng90j8OzrCg7mIsxbNkAxxTbzVEKj12WFn4zGRx12djq3BuCb05NynxNnExiIjtlP5ukEgTxfVJXM/We+m3wtEsSEKG+VuN1SeToELMts7FsjyLSTHcDpf6UbBXNRp3h6ihWjZg7HbUA8mSP420w4fK0ETWF3AQV5L6GF4S473bHBXEJ3laffYQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(55016002)(70586007)(6286002)(70206006)(7696005)(36860700001)(47076005)(86362001)(316002)(54906003)(2906002)(36756003)(6666004)(8936002)(8676002)(508600001)(186003)(16526019)(26005)(6916009)(2616005)(336012)(4326008)(426003)(356005)(83380400001)(7636003)(82310400003)(1076003)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:58:42.5565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e9ab72-7906-4250-d3c3-08d98a317260
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4925
Received-SPF: softfail client-ip=40.107.102.44;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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
 hw/virtio/vhost-user.c         | 20 ++------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b2e948bdc7..d127aa478a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
 #include "sysemu/cryptodev.h"
+#include "sysemu/cpus.h"
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
 #include "trace.h"
@@ -1143,19 +1144,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
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
@@ -1163,7 +1151,7 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
         if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
             /* Wait for VM threads accessing old flatview which contains notifier. */
@@ -1171,15 +1159,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
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
 
@@ -1539,7 +1524,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


