Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E904AB5EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 08:37:51 +0100 (CET)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGyas-0004yx-1C
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 02:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyKQ-0002OP-Ii; Mon, 07 Feb 2022 02:20:56 -0500
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com
 ([40.107.237.88]:61568 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyKL-0005jy-Fk; Mon, 07 Feb 2022 02:20:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K13XNXV/C+Dv/V12ShnCSXhxKr8xRwRBwau1U6IfPbeNXf7To86y/7eeY5nQdVyHtppDg7VEgDQT15bpqW3zRZebexqZxIT4MiA1+gctc8xqh9cvk4J/DzzN/TNXIBFj80ldIwPm6KOEPT/ET6wjsXekNIRBm4xxDo0hOkiEWB2PkSKiIUZ1B2HTQstyIKHj9Lr3ngbTTZf+YQ/eRUY9aVmr5GgRIkjB3uu7H5jHqGnXk+zKYrQ7Q9cnqdlCA3UIhm0G7lcwlRzwsoOGfu0N7IpPHAIED1ajiJb9a3cTiuS3NVjyP/tetkXO8PABmYQdfSS3gcGthhilXNNcTWFVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vErEMcjcxM/NYEw2Trw0DfbGX3kzbmAiIT4qOFk/7lY=;
 b=JC6U2m2NsAPaG2zE9Op1ZrzH3AEEaFAjXs9W7SOXpnLbi3Kwc87JHYfXemR/kWWWMEm6sqie+i+xfymlwSibDLcSqkTMs/ztak/poWpWncETiC86F+UuYZyrHiCF051Gh67fOo9FQ03Zwi1HsHGzYULcxi7XbEY+HBuxmJ6jFxi37w2pXYOL9sOMiZ6rI4U1NXjSg0Lh52hLFwRuF9+WrqKFAVHXPw7/nwHlm03XRuWOTeGdeaUf42+B1lHsXnuTau3PUtoDmBowsGIqQoxOhgUZZ/AKbC5WOWckg01kb2kOwVY5b8sAqbEJLoz/oeQra0pnM4m/xv3oG2qVd3iRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vErEMcjcxM/NYEw2Trw0DfbGX3kzbmAiIT4qOFk/7lY=;
 b=SqbE+wCu4xBXWZpdYUMYYO6xXGFHeqfJMZw5sUaE5ZAo4uG7joZj+h7IyaO6f/Tn6qW6EqFCKMrUEOo3gcZ+lj7z6UFekBwBwVaA9G+QupwPvFriu57J/iD2NjPMzAzaQGBgGO5WgwgCCxEzCgYD6+MGP3EdHuoRral+L6wNv5fqNDAUTb91lQVCLEh78cMbrOJP9ln9CfSI9pWeC1EwdYvbQ3amfwefr0tp5qWT4J0hxsaQu0Fs34I8pMyoIbyZj/qqHf0BG1luts9IzCAwl8iZcjsvE+8IBSiwIjhg2QRZ5O9IFPyL9LVdpLhOmItYS78C7broufjH94PmcpZFUA==
Received: from MW4PR04CA0193.namprd04.prod.outlook.com (2603:10b6:303:86::18)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:20:30 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::85) by MW4PR04CA0193.outlook.office365.com
 (2603:10b6:303:86::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Mon, 7 Feb 2022 07:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 07:20:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 7 Feb 2022 07:20:28 +0000
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 6 Feb 2022
 23:20:26 -0800
From: Xueming Li <xuemingl@nvidia.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>
CC: <qemu-devel@nongnu.org>, Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 <qemu-stable@nongnu.org>
Subject: [PATCH v7 2/2] vhost-user: fix VirtQ notifier cleanup
Date: Mon, 7 Feb 2022 15:19:29 +0800
Message-ID: <20220207071929.527149-3-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207071929.527149-1-xuemingl@nvidia.com>
References: <20220207071929.527149-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebc331aa-59eb-4265-10cf-08d9ea0a521a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB438107FEE30AFE692B5C9D6CA12C9@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MB/3MZPyFDmsWlOPqxWfHhKMv0EQpGsKk7x4T+XiDmmYqHF6fw8zA/R7RXJxLAqR68l9KqKl8u2T+YET4shMSUKqfnvVuMalfiGh3rgHIIpmt9eEL8AkkfaHYMOm4sN4TpLc+4mhpq4VxnOmeUPFs/NgzHTWBYd1MS+Tg4Or//V/PGYaNqbzgrjzOr2nTKIZiO3JZPxWb9djZcaQbypNDXsbyOpnwamW2bXuS+4TTagCQgHcIGH+DZuZzvAREzYryr+YHOpR2Ct1s4gqZWE1suSajzf1b3feNe49JEE9Cai+9QwR1TuQ8+OVtBRKvTFy6raanKA4rDrkePQ0iiMiIUrf6SIHsDDyd740ONxM3O9WmnQKDw8HRBBfFkNkpXfiTEo0PxyPQANePlHA43uUobvhJSlO6/wgVQ7cdT75yLVbTd5pbXHvEawHHgQ1boDjqJ8QLfcj8dBBU2qXFEZT6K9wUAGwSnO2OVnzaV8qDjGzAz2S64Hmzy/L7FtVWtbIU25aeTh11tqc81Ocz/Nh5waYxXvj830i9lY8dOwmHSj7lMzFagW9y8vGqhocR5Z0/wRPjhDbap6FZwVfk8v6zXRePLWW2q/Q+xM2kWmPYR+tiY1omLJIh+rqnidSmDaicB1lZBpHll38QlLZ14AvAPy7s/f/akZvf+QqG1BRc8dzg/LRXkACqT7P+pz8l2S8hBrZbnlBQuk997YoEOPglQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(7696005)(81166007)(2906002)(8676002)(70206006)(70586007)(8936002)(4326008)(86362001)(356005)(82310400004)(110136005)(426003)(5660300002)(54906003)(40460700003)(55016003)(336012)(2616005)(26005)(186003)(1076003)(6286002)(83380400001)(16526019)(316002)(36860700001)(36756003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:20:29.6554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc331aa-59eb-4265-10cf-08d9ea0a521a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
Received-SPF: softfail client-ip=40.107.237.88;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When vhost-user device cleanup, remove notifier MR and munmaps notifier
address in the event-handling thread, VM CPU thread writing the notifier
in concurrent fails with an error of accessing invalid address. It
happens because MR is still being referenced and accessed in another
thread while the underlying notifier mmap address is being freed and
becomes invalid.

This patch calls RCU and munmap notifiers in the callback after the
memory flatview update finish.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c         | 48 ++++++++++++++++++++--------------
 include/hw/virtio/vhost-user.h |  2 ++
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ebe9bd58d0..6abbc9da32 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -25,6 +25,7 @@
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
 #include "trace.h"
+#include "exec/ramblock.h"
 
 #include <sys/ioctl.h>
 #include <sys/socket.h>
@@ -1162,15 +1163,26 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
-                                            int queue_idx)
+static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
 {
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
+    assert(n && n->unmap_addr);
+    munmap(n->unmap_addr, qemu_real_host_page_size);
+    n->unmap_addr = NULL;
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
+        assert(!n->unmap_addr);
+        n->unmap_addr = n->addr;
+        n->addr = NULL;
+        call_rcu(n, vhost_user_host_notifier_free, rcu);
     }
 }
 
@@ -1219,8 +1231,9 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
         .payload.state = *ring,
         .hdr.size = sizeof(msg.payload.state),
     };
+    struct vhost_user *u = dev->opaque;
 
-    vhost_user_host_notifier_remove(dev, ring->index);
+    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
 
     ret = vhost_user_write(dev, &msg, NULL, 0);
     if (ret < 0) {
@@ -1506,12 +1519,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
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
@@ -1530,9 +1538,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
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
@@ -2505,17 +2516,16 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
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
+        vhost_user_host_notifier_remove(user, NULL, i);
+        object_unparent(OBJECT(&n->mr));
     }
     memory_region_transaction_commit();
     user->chr = NULL;
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index f6012b2078..e44a41bb70 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -12,8 +12,10 @@
 #include "hw/virtio/virtio.h"
 
 typedef struct VhostUserHostNotifier {
+    struct rcu_head rcu;
     MemoryRegion mr;
     void *addr;
+    void *unmap_addr;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
-- 
2.34.1


