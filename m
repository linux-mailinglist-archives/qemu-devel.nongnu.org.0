Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B748640F786
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:31:13 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRD1M-0008LY-Qy
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRCxF-0003jv-MC; Fri, 17 Sep 2021 08:26:57 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com
 ([40.107.243.70]:59360 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRCxD-0005tH-N2; Fri, 17 Sep 2021 08:26:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntPsnJwLdN+RAQskoQlwbBzHI8dDBuDWH9PE7kG6zYKlgA0J+/EHpoPXqTXfrmYQBNiUjl/yHkQ4iqIj3eQashx+goa4ObteQ1zmN6/JMDkrmUC+a67/FE3Sy80P1Meiax6WuliY2YXw0IB+zF+qewco4DcZ1+v0xuhXWLzBl6zUndJwynXfCn91KrolAQ+12dAhztF04j+S/idSSLVury/iw2dWRTRr7kbgeJe3zd9XLbdvA7ttxFDOcQ0LjE7D7LyR9oG9cxMuQD1EGJHKUR4Ky0rFdfVyLhT4YX7QjY0KlQ/izGp/+ygQ5Y8dF92ic5udKvt/8ZF1ik/xIf237A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9IaZsPlTSVXhuBLAyo96RYqC/8lUFJYfrRNywLcpPNs=;
 b=fSYRh95JvEdwomh77G4IMFStw/4u7Pdr91jmk3v1oWMn2+DtSuwwLzktvNd3JC8+jh/9wZmv/NN6lAoFfX6+DnOllRAMDYx6s8r6Rj5Tl5/Uk+u+DtW+2CuxpLbbrsE+VM4N9vtqOJk9FAdk7GgERlmnh6KSOQ24q3t+nU7F07Bg2O+T4eVgIsJYuOwpkKEP3oBUmG2mHWAx0mkgfTPVWksogbUaDL5bkx08a+O6p4Wfn1Tyj8pUf/wWNu0jfECEkP9oM6aUV4gHATjhmUgdMr6CSK2WD6UvkglkxJ3gToKG30yaCYFY4Rb5Y1VOF4JfHFuPhuQDmIW/uZjqfQac2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IaZsPlTSVXhuBLAyo96RYqC/8lUFJYfrRNywLcpPNs=;
 b=IIBGbl0t4/K/FXnQ2A9d3vh3G7fPbfxoq+90i6+fokpoIwYxMEsD58vAJK5mRax9kge2oD6WIz4PoVejMIzB04J2a8fcdiCOR6B+7rZOLcWE2QMEXTzfwfPePfXfIFmmFM/TteVCQRRfE9JYCiWUzeWlfXHZzZV/7Z/yDMtq12uQqWDxX4wCNdkDk560GnOgtIQt46BB1SUwu0dBY+5jBtDU2s3KRlntULUIARoaWLlmm+eIfG6cb87OlOKlF0gaXqjMhEZSVGeWKNMYvXWt7F/1favnFKWdXIpM/GiVv0ekRdjbFCsc4AU7qWHV1vAx7jJaL7REYpxdxXsc+okMmg==
Received: from BN6PR11CA0014.namprd11.prod.outlook.com (2603:10b6:405:2::24)
 by DM5PR12MB1484.namprd12.prod.outlook.com (2603:10b6:4:11::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 12:26:47 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::8b) by BN6PR11CA0014.outlook.office365.com
 (2603:10b6:405:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 12:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 12:26:47 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 05:26:46 -0700
Received: from nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:26:44 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v2 2/2] vhost-user: remove VirtQ notifier restore
Date: Fri, 17 Sep 2021 20:26:16 +0800
Message-ID: <20210917122616.6067-3-xuemingl@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d566679-e4b9-4cf8-1245-08d979d66ad4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1484:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1484ECA6FD3594C6EDEAAD78A1DD9@DM5PR12MB1484.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: stQ3bwPJkCuXhbFj/iaaddCfFwCj8xBY2vZ8mvShQilswksvbdNg0YUcTU6/EHhmy+3+/sCEA57FqP8pjlJ0jbvQxCm4Sk20uOij6AqE9ij0DkjMy4osevzD9gUM8CuhURKdM6IIHHGzQfYET5oPAf2lxKOYD1+4zffjQupSSxs1iMEyQ3iBT02ftfLeQ4WYBTR91Hg+Dc2eZ4cq5H6D1+0DHppGY4NlUoTYoMWAhiE/zyINhLok3kkjA3UHjaq5oOl44H8A7j3WX0/EpMoaDQTnARFXtEzZp0AvinlIYWMGRIWgcWME0fv11AlRfrRvYX6ZyxQkYvobRayaKqPN24eB20wCWB8zQZBy1krY9sjy+XsQAXJzvTVu6T5I4o2kO9OtunIIlnSK9mjS3dKzSG2BIuvKTPk0gNfagnNT5F6EYJSVgnLeFZkPMcbOiGc66pQEABkVx2+udvM4N9ksyDb42KLlpXgmWiLgIXdanxw6EkIRMIuq4YjxvSuYp60/UH4ccCE9ldazk9/4tveB9anliHITrD8Q9LQqtQLeKzXj1sziHhogDbfic2J4jA++VWqjIu04lyR2K1ShEdx15uOjCspIljuXJpUi1Ig+7hGKTHihZK9NAeQ3OAMQwNxHfT//ZQ1lDCxVZk6TjFOG2Paab7JCfI7tnoW/QK8VzR7J4dekHMGZiw9+w7UXw/UXYhcv/qKGZ/KxUNF47FwN8Q==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6286002)(1076003)(508600001)(6666004)(83380400001)(2616005)(70206006)(356005)(186003)(7636003)(7696005)(5660300002)(55016002)(8936002)(70586007)(36756003)(8676002)(316002)(4326008)(86362001)(2906002)(54906003)(6916009)(47076005)(36860700001)(82310400003)(16526019)(336012)(426003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:26:47.0012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d566679-e4b9-4cf8-1245-08d979d66ad4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1484
Received-SPF: softfail client-ip=40.107.243.70;
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
index 08581e6711..15a4b4ee76 100644
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
@@ -1163,22 +1151,19 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
         if (!qemu_in_vcpu_thread())
             /* Wait vCPU threads accessing notifier via old flatview. */
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
 
@@ -1537,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


