Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EDD433A64
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:30:02 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr3x-0004Sx-Fy
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq83-0005fM-M9; Tue, 19 Oct 2021 10:30:12 -0400
Received: from mail-co1nam11on2052.outbound.protection.outlook.com
 ([40.107.220.52]:20665 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq81-0008FB-JH; Tue, 19 Oct 2021 10:30:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIaANTvJ54wpQRwqjhlPmr/Cbfzjk+RZV9YqSaKl0zfKMcWW2iA4S6Y56cdz2QPt+sGk43D0Bl319u+j/8cAo77+TGNXB+LO7C5I9Ifb2DT15i5qY/9fxI/PlnFPfgWlTEmfWS+Sam+DPFVpchFgCS370Er5/CCbv7e+bY+ioAB0xoMzeQL5OTEd2dNmvPy8Ws+e8R2KaUqiHTEStWpGPZBxEf5Z+dyH0RE68UKqqjmzLvByYeASuAffYfugfqHFzQvWtclfApYUM9iZlHFM8M7vWNPY58e+rhV0GMV7BX5qUx++pVXrb8VsQ71qhDbpfBsInb4rruznuBlsuaJ2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f18gjX/lpVuH1bb8wZa+KCUCh8GvIqXkXRgdf5Fg95E=;
 b=G+Oi5VRBWBfPTzCEiy6g1vBYMY8Y17C6r0Lm9M/RhAs5ehZvKRXb3CyDVe7ZMyOFQ4Q5nbQ/Zrk7QzzlWbx9AU1T6M4gR2frmvh9rX48jM/YxuAg80yxML70v+XkSinHFuyV9bIa5LDVQ2S4oofN6Pl8C/anZ7b5+aRIpY+3iaojQzBrdXRCGpohieazqgtKNf6JaU6BYvTPHe5v1s071rS550Qxp4QXSGmUCc4TEksGfI7lqw09lwSdXuU5r280n09bqx5mLQj/W/zmYcFKJlM0pBUaCI2Fa+utXbmM+ZD1ny3Lkh4/PqQZ+1SoogWdENL/93MczPsA7ds+vxygsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f18gjX/lpVuH1bb8wZa+KCUCh8GvIqXkXRgdf5Fg95E=;
 b=Q5Nsdw7+R+F+K12VYamOv2ApokI/eM901mdHibA5sutykwhf37IFXUw4RDpZmJDFaObkrBl/tvkcPRbv1hg2yCHii50xYB5WlDB7HDih7n0+6Di7BdNLrAfFnzf49szWjZc9LbzqoL93u6EkaeDH83gbqglfJaAWmjtZ1K4nJyA=
Received: from DM5PR04CA0031.namprd04.prod.outlook.com (2603:10b6:3:12b::17)
 by DM6PR12MB5567.namprd12.prod.outlook.com (2603:10b6:5:1ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:30:05 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:12b:cafe::2c) by DM5PR04CA0031.outlook.office365.com
 (2603:10b6:3:12b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:30:05 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:30:02 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jason Wang <jasowang@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>
Subject: [PATCH 48/64] virtio-net: fix use after unmap/free for sg
Date: Tue, 19 Oct 2021 09:09:28 -0500
Message-ID: <20211019140944.152419-49-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8a3856-b93b-4eac-34a9-08d9930cf1ba
X-MS-TrafficTypeDiagnostic: DM6PR12MB5567:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5567AD747DBF780F27F4AA9995BD9@DM6PR12MB5567.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrPtT/G4VyfCJuW2uvwCiN/VNsVzP/JS92iiiRo9sAJ25ewzT+qBWQA6zmZRscguA5bbNDhxnvp6+0J9YemRBa2+ehAg+tKrg17BysqZv9iimNIN17eyI0DIWcGzbyF9q3Vn0RzmIRDG0w8KagXU5kkVHKKLRzp5EHkFtftlwgAj3LdwF7VH8pLH9rPag19/Aws5OTSAoqr4YnskFBniH0TvE41ShmcO40MIX4zm9omvUgvwpUQ/34Wi7oLxdl9Xfx8PhkYcVOGlBbS47Z7+oKGmwmYlv7TK3oMW3nKwG4wo8o10A6FSHzKE0sm00oaN9Dz97fNiCf+RwWTznc3G6+QapFLGMTPvq/5tooOiBBWMFSvNiBeVy88jQPgsXmnGejcDv5SNtF2o1tFReM7+7loGnEKe5i8q7xUtRoWujxGcbnXyNR/feWKxY+Hro5+wb/SStzMV5/4ib7HdJ+UfKXtOFSiKSNAnPfIVkbm4WB+i8ylH5ZwBVu+5XbjCnAxBEJ1WIQ4LfF3IkRgMRJl0ahksTqjfZtr0T1J6dZv81HMPxkhuAEiC+J4mPGqqGQi2zlZ4/Z9RZPYqLnFD3jWUQ8Gr+WUw1sS4DYbPIzD2uHfQRZn0LtFNHk1wRy13/feayCaxBWtr6fth2IJEWp/tQpXCyPScWYwU5/Tx4qFFBj7vj4ZIjZJ/Ns4X0eBP2HqVs0D72xFPiv+JLlp5++s3cO5seA4+ucPvEis8/uVn/Is=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(2616005)(2906002)(6916009)(426003)(86362001)(36756003)(356005)(81166007)(70206006)(70586007)(6666004)(44832011)(8676002)(186003)(8936002)(508600001)(4326008)(54906003)(316002)(16526019)(36860700001)(5660300002)(83380400001)(47076005)(1076003)(82310400003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:30:05.3245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8a3856-b93b-4eac-34a9-08d9930cf1ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5567
Received-SPF: softfail client-ip=40.107.220.52;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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

From: Jason Wang <jasowang@redhat.com>

When mergeable buffer is enabled, we try to set the num_buffers after
the virtqueue elem has been unmapped. This will lead several issues,
E.g a use after free when the descriptor has an address which belongs
to the non direct access region. In this case we use bounce buffer
that is allocated during address_space_map() and freed during
address_space_unmap().

Fixing this by storing the elems temporarily in an array and delay the
unmap after we set the the num_buffers.

This addresses CVE-2021-3748.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: fbe78f4f55c6 ("virtio-net support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit bedd7e93d01961fcb16a97ae45d93acf357e11f6)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff4511..760203309b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1659,10 +1659,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
+    size_t lens[VIRTQUEUE_MAX_SIZE];
     struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
     struct virtio_net_hdr_mrg_rxbuf mhdr;
     unsigned mhdr_cnt = 0;
-    size_t offset, i, guest_offset;
+    size_t offset, i, guest_offset, j;
+    ssize_t err;
 
     if (!virtio_net_can_receive(nc)) {
         return -1;
@@ -1693,6 +1696,12 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
 
         total = 0;
 
+        if (i == VIRTQUEUE_MAX_SIZE) {
+            virtio_error(vdev, "virtio-net unexpected long buffer chain");
+            err = size;
+            goto err;
+        }
+
         elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
         if (!elem) {
             if (i) {
@@ -1704,7 +1713,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                              n->guest_hdr_len, n->host_hdr_len,
                              vdev->guest_features);
             }
-            return -1;
+            err = -1;
+            goto err;
         }
 
         if (elem->in_num < 1) {
@@ -1712,7 +1722,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                          "virtio-net receive queue contains no in buffers");
             virtqueue_detach_element(q->rx_vq, elem, 0);
             g_free(elem);
-            return -1;
+            err = -1;
+            goto err;
         }
 
         sg = elem->in_sg;
@@ -1749,12 +1760,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
         if (!n->mergeable_rx_bufs && offset < size) {
             virtqueue_unpop(q->rx_vq, elem, total);
             g_free(elem);
-            return size;
+            err = size;
+            goto err;
         }
 
-        /* signal other side */
-        virtqueue_fill(q->rx_vq, elem, total, i++);
-        g_free(elem);
+        elems[i] = elem;
+        lens[i] = total;
+        i++;
     }
 
     if (mhdr_cnt) {
@@ -1764,10 +1776,23 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                      &mhdr.num_buffers, sizeof mhdr.num_buffers);
     }
 
+    for (j = 0; j < i; j++) {
+        /* signal other side */
+        virtqueue_fill(q->rx_vq, elems[j], lens[j], j);
+        g_free(elems[j]);
+    }
+
     virtqueue_flush(q->rx_vq, i);
     virtio_notify(vdev, q->rx_vq);
 
     return size;
+
+err:
+    for (j = 0; j < i; j++) {
+        g_free(elems[j]);
+    }
+
+    return err;
 }
 
 static ssize_t virtio_net_do_receive(NetClientState *nc, const uint8_t *buf,
-- 
2.25.1


