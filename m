Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6A4330DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:12:51 +0200 (CEST)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckEt-0006TB-2Z
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0s-0005Oe-9l; Tue, 19 Oct 2021 03:58:25 -0400
Received: from mail-dm6nam10on2063.outbound.protection.outlook.com
 ([40.107.93.63]:57312 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0p-0001u2-Rr; Tue, 19 Oct 2021 03:58:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE+xEY3ZwXxX+sH5CunRaHMqBnJsJyKtOyqE7WFLpKH8OhN81ifGpeH5QWNFwf5uL9OvtW/E/TrSUu5cwV7YQnHteDqW2zXNP2gpMYDLmHgt/ov758GCkAiedTI5aOcxjUrRVGWV6xKy4j7qEx6HQ15ox7NBm89zc9GNHqW1KXwKglMFzL5AccIC8hv+hTS3AuD5nTK+2MeEPEZ4jNZqCnoYEpI4Rdgkbq5TzkfIwJPJOORKmGRzcCv89Jqnmb+EZaILdsqrI7xosNhNGt89R2i8tJzItRc24guwRBjPKbxJUkt2O9vqzCk+RD++sCqYhGXwyGeIHVgPZlfaW8+nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrmxkET6IrswjVV5Rn6M9MJ+zYtZYSv7Ih4xFcWYdvo=;
 b=HzuMYO1CILTrRFFpq304Y0RG73dLzyLuqZESMCqzRPzxXiJPu4LDlnf7YP//gkoJ2O5EjknGWt9DYQJQULLkPyLsVHu+3eLmBn6ySvZjjbkxtbusUSzbDVX2R+JRC/kgmqUXUcFpmG+nsJgy57wsV1/X/i+QL/lByJcZnZtxki8TSPWbfncgOkj/LZMZEVv2Ax0bkTnyR8LutZQ275rcXK5GssuZ1rc6S3y0KPp8qnKqFbB5MnvGsC9BTaRGt7j9mv2Y1bciZ20lGo56Y20wtX/ERx5yA6dtR9Ho+FVlBFipVpQg5YUrPmwYUgmLJikn0LwXfHdkpcXFQsETICFSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrmxkET6IrswjVV5Rn6M9MJ+zYtZYSv7Ih4xFcWYdvo=;
 b=R/Yldf+BCwiArCsM5KasK7PdyOyj2xsa46cw+3UWVzYs2kmAWhehCGA5QxvX1NXg3vtRAKOkfG0kkMYlwBXzNHTs3VI5svPPyGAFVA9zWSIsP4M67sS3ZzlaiNCy8aoqVQYRa8g8anBF0n/VcV4fPenfyNwj6vnq8o6qeBtNm6VJltd0MPsunep/Viaolgey8iRvuGdPEIAVAb8MRYyRGhHX7E56t/5FE82H0+tmFpNJeIiPHFtC2oL82B6FwmA0jnXkArSEOcPKfHE4opPcIAU+WiKPcn+DLakwwZHyX3r4ve23on9AR4ZjCKiuDSehvb+yj3C65rALOat9C05hoA==
Received: from CO2PR04CA0101.namprd04.prod.outlook.com (2603:10b6:104:6::27)
 by SN6PR12MB4749.namprd12.prod.outlook.com (2603:10b6:805:e8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:58:12 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::de) by CO2PR04CA0101.outlook.office365.com
 (2603:10b6:104:6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 19 Oct 2021 07:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:58:11 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 07:58:04 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, Yuwei Zhang
 <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 1/2] vhost-user: fix VirtQ notifier cleanup
Date: Tue, 19 Oct 2021 15:57:42 +0800
Message-ID: <20211019075743.2162432-2-xuemingl@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: a232aeda-f16a-401c-a695-08d992d632a7
X-MS-TrafficTypeDiagnostic: SN6PR12MB4749:
X-Microsoft-Antispam-PRVS: <SN6PR12MB474956258D1D5E82267ED51AA1BD9@SN6PR12MB4749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7KE+Z/jb+qlH28d6fGLHYZJl6VtMfvaHxlZN+7GSs+nnZzCvvoBQHjBReBKziyMN5/ZZDxa4tUSmRyAnk00XxCdo7rbkpdmgQuAGuy1UQJiHt0Lsyg9Vn3Q50xQfhEDYbJ0FDXdqe/eNiJ6i5aPJV/3/KB9zKWq7vIvPVsr4LsbgfAFa4BGS34Esh6GK5860s2jS6K3Hb0krO83jh2aELwkOQds+/L8BQdKgeGslosECoqybzoJ9TVIHIjSw2SvPh/3SJp8UBmaFsawrds28d1IHuCwRSUh7KWojc0ovxuNzXLy5c0IjsHeWuhzovbaheF5IYL6KVXiezFVGBMzsqMArkJgW8BeejmLoNet7dFZpQIjTWEHQCW3paGskq+S1gyylktkaZS297DmNvt1+OyvlCtuBajxuION+ckhZQdTTkCqCpZQN3IUCBxiy9RJLFTyvCaD5WWgB3uDP781aRTbVQAAXegbhWeGvZ5lZfGAKdXwWAoEJWGKdBrnS4DCnOXKBrs2/BsloUpX/R8MgPCJ6NjnByViOnXtbK73ox8TKuoJOWBsejgSJ6Sqg6onerkootHCJYmcKwVc076G0Kew1dpRqKRIlKkhuFxHrx02DBSQzuWDXkytCjOpiWrfqTE2M6WA3lIOhbAjbdY45g9msOt573kvybZsbJCeprcRskWu8kc61AoYDCAFIfwT/tgt3BDVDfPAtOBezdoOEA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(70586007)(2616005)(70206006)(426003)(6286002)(8936002)(36756003)(356005)(316002)(55016002)(16526019)(54906003)(508600001)(26005)(1076003)(82310400003)(6666004)(7696005)(6916009)(7636003)(36860700001)(4326008)(83380400001)(2906002)(47076005)(86362001)(5660300002)(36906005)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:58:11.0543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a232aeda-f16a-401c-a695-08d992d632a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4749
Received-SPF: softfail client-ip=40.107.93.63;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bf6e50223c..cfca1b9adc 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -18,6 +18,7 @@
 #include "chardev/char-fe.h"
 #include "io/channel-socket.h"
 #include "sysemu/kvm.h"
+#include "sysemu/cpus.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
@@ -1165,6 +1166,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
 
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
@@ -1502,12 +1509,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
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
@@ -2485,11 +2487,17 @@ void vhost_user_cleanup(VhostUserState *user)
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


