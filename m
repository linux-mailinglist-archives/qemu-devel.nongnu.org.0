Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC0441582
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:42:20 +0100 (CET)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhStX-0005Sf-8O
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqb-0001Bi-BH; Mon, 01 Nov 2021 04:39:17 -0400
Received: from mail-bn7nam10on2071.outbound.protection.outlook.com
 ([40.107.92.71]:64993 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqJ-0002CL-Tj; Mon, 01 Nov 2021 04:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F21LEoAzpQ5PInOQQQFd2DxFhVbtzlaRH+CepRZy6SRZscQgGJd/f0d5NshTqplbHDssOrkGO8/Y8ullI73RhCRghLpvl9s2DIB1lA5+KAAo4xtZCkiWqVPcKJmHLzuA8rGlZZLkxl/vijBkWyrvAHpOMj41g7SV/hM73JxI9t0lO2XH016lBovbpvpIt6AGwT6NTVniR7vnvfnvIcYiEpGLDDfFIDY0cHuSyUNQqugOkjRDcd5uxrPN+WOUmNKDFRBZD7za4ejabYTRrtNgc3H+LmGJKcUGECVvgWx3JNSrVO6Dkr2a/614hksMoQfeXaNAuTtF/4VPIEFSTllRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsyFKZo4zUCM5OqxMJi9JIdPvY9mgO1KrWUbzMeFkmA=;
 b=PXjlN3zygHJ7kDqeWuzE09w5ibknWtoz7ydpTrlPhmobGerVFGFNNzwSlkdVixOlfPzb97eEx2bGX4I0cCgrND9RdpP3MF0v7xihDMG3oks1qdsYfAO11+0OW46tA9ATR5xGBGvl5KzpZc/k7tLhliWzXZkggHAdSlJOBf2gZ0Oc5p9E7QHkb5BKt6v445qNaTowsHieDnAHlLCzenlbuEfERrfoi64qXrLTNCMonihX3Fh0OfRhZuV6wPmabGai6Z4jjnykGJhTM9521UHMWyJwkc3RrxKeX7TR5UgqY5u9Ab8UNhEuhX8H+GgFcd9Ecok77i35TWMHvzYLuofnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsyFKZo4zUCM5OqxMJi9JIdPvY9mgO1KrWUbzMeFkmA=;
 b=iNzU60smnFOz2XVElAoPtPPEuSb3wOet0x5hJmAO3agK4s14E0JY6q/OFBEHmanDKFOYUBSkT0GOj80bd8rNczSYLcRlPpGL1nYjuhP53V/l/CYQdMUsKQtrKAgtxo+n4PCjs0oOUCgUlIwCxwBTBXbBE9f5yCC0SugsyPkW+lnmXwkzxiITewhYi4C9qvsW6q9R9iHHcJglEvvqzQ7Ae9EHXCzLD4TUUu6lm7l6plyj+yk8fad12Hr7B/PkskQjAy7ZA52LWHV+C/mbYDL+MhgbHp7pA4aZMsUCBcAV0AFquX68F2aS2+hSLqY20DGpuwyUexAvOpjBvp6D6fL28w==
Received: from MW4PR03CA0324.namprd03.prod.outlook.com (2603:10b6:303:dd::29)
 by CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Mon, 1 Nov
 2021 08:38:51 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::5f) by MW4PR03CA0324.outlook.office365.com
 (2603:10b6:303:dd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 08:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 08:38:51 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 1 Nov
 2021 08:38:49 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Date: Mon, 1 Nov 2021 16:38:13 +0800
Message-ID: <20211101083813.1224522-3-xuemingl@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 595fc0ef-94cf-4e28-0f40-08d99d13081c
X-MS-TrafficTypeDiagnostic: CH2PR12MB5004:
X-Microsoft-Antispam-PRVS: <CH2PR12MB500443F98E22B8B9F23C6A74A18A9@CH2PR12MB5004.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:39;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cd4PlXOwH30d5U54qdZnlVIrG8+SAcSVSKA2I5S0gtirS0+eCm2MAtL9LXDJgnPB5Q1okYls2jGm1QOZnVnaH6DJqhdFpFsBJ13C4XjIa4uZ8J27osQpKFCL4RlYElaPnf2Y45C14m8BEsq8oEgihRHUnwnLHPTb6WxDEFp78KdyJkij2+cSn64f2WNCda+wwbjF1N6g3GvDaorujIUdpUjHb9o6RrBPT/JtzErypBDbhJXm0RQjzUPincJLt0zmYBlhkeCAGJ6ZJiHTMHCXBJEm/C4Yb2OEroWpPMpyxkBSfRsG/qrRWWj5bV7z9DtuO8khnhux9eqtcxJOJUerASnG87RrMBMZ4TqFIJvK9OCwosiSwc9ot975YFjbmEHvqV0E3OcKaFgSSS6Fgtfy6euytSJLtASQF+r9CwOYNxtN3vPRLmY/jFjRMgMZvAND17zldrIkAWcn5SgurjGBMhfXteSGGmsXWfoVj7t6E9A9/6hw9Gvu0C9e1vdSTmAuqps+PQ61WVlKb7gFNPfGlhUKHTM/DmONW5fBeCVtBIT3TDefHn/QP3XtdtMh3TcWRGBCRE5WFbBRy/G+9HtdpTtgWcglpL5Zum2F1j3GXKzXGaKaL8Za/AkgIcfLwbadmG3ThXeTMmxKhEIjj6mvvcXUQ8k18bIEUwvIYewJ/VKslrK8QuF9Wc+jWZ7foj+NEQuXZdB/nsIjcBDq5HIAUw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(83380400001)(8676002)(6666004)(186003)(36860700001)(336012)(82310400003)(86362001)(1076003)(70206006)(55016002)(2906002)(7636003)(36756003)(26005)(508600001)(16526019)(6916009)(36906005)(2616005)(7696005)(426003)(6286002)(70586007)(8936002)(54906003)(316002)(356005)(4326008)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:38:51.4472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 595fc0ef-94cf-4e28-0f40-08d99d13081c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5004
Received-SPF: softfail client-ip=40.107.92.71;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1.598, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

When vhost-user device cleanup is executed and un-mmaps notifier
address, VM cpu thread writing the notifier fails by accessing invalid
address error.

To avoid this concurrent issue, call RCU and wait for a memory flatview
update, then un-mmap notifiers in callback.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c         | 50 +++++++++++++++++++++-------------
 include/hw/virtio/vhost-user.h |  2 ++
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index c671719e9b..5adad4d029 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -25,6 +25,7 @@
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
 #include "trace.h"
+#include "exec/ramblock.h"
 
 #include <sys/ioctl.h>
 #include <sys/socket.h>
@@ -1143,15 +1144,27 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
-                                            int queue_idx)
+static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
 {
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
+    assert(n && n->old_addr);
+    munmap(n->old_addr, qemu_real_host_page_size);
+    n->old_addr = NULL;
+}
+
+static void vhost_user_host_notifier_remove(VhostUserState *user,
+                                            VirtIODevice *vdev, int queue_idx)
+{
+    VhostUserHostNotifier *n = &user->notifier[queue_idx];
 
     if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        if (vdev) {
+            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        }
+        assert(n->addr);
+        assert(!n->old_addr);
+        n->old_addr = n->addr;
+        n->addr = NULL;
+        call_rcu(n, vhost_user_host_notifier_free, rcu);
     }
 }
 
@@ -1190,8 +1203,9 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
         .payload.state = *ring,
         .hdr.size = sizeof(msg.payload.state),
     };
+    struct vhost_user *u = dev->opaque;
 
-    vhost_user_host_notifier_remove(dev, ring->index);
+    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
 
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
@@ -1486,12 +1500,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     n = &user->notifier[queue_idx];
 
-    if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        object_unparent(OBJECT(&n->mr));
-        munmap(n->addr, page_size);
-        n->addr = NULL;
-    }
+    vhost_user_host_notifier_remove(user, vdev, queue_idx);
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
         return 0;
@@ -1510,9 +1519,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    if (!n->mr.ram) /* Don't init again after suspend. */
+    if (!n->mr.ram) { /* Don't init again after suspend. */
         memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
                                           page_size, addr);
+    } else {
+        n->mr.ram_block->host = addr;
+    }
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
@@ -2460,17 +2472,17 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
 void vhost_user_cleanup(VhostUserState *user)
 {
     int i;
+    VhostUserHostNotifier *n;
 
     if (!user->chr) {
         return;
     }
     memory_region_transaction_begin();
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        if (user->notifier[i].addr) {
-            object_unparent(OBJECT(&user->notifier[i].mr));
-            munmap(user->notifier[i].addr, qemu_real_host_page_size);
-            user->notifier[i].addr = NULL;
-        }
+        n = &user->notifier[i];
+        assert(!n->addr);
+        vhost_user_host_notifier_remove(user, NULL, i);
+        object_unparent(OBJECT(&n->mr));
     }
     memory_region_transaction_commit();
     user->chr = NULL;
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index f6012b2078..03aa22d450 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -12,8 +12,10 @@
 #include "hw/virtio/virtio.h"
 
 typedef struct VhostUserHostNotifier {
+    struct rcu_head rcu;
     MemoryRegion mr;
     void *addr;
+    void *old_addr;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
-- 
2.33.0


