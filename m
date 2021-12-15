Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB7474F5B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:35:10 +0100 (CET)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIGC-0005EN-SM
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:35:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHxM-0001gl-JA; Tue, 14 Dec 2021 19:15:40 -0500
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com
 ([40.107.93.72]:26849 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHxK-00067X-8a; Tue, 14 Dec 2021 19:15:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKAzgEt97n6VC1uvgTeol93AMP3nn3wUPyw7GedH+H70Du+vq5Det9mIYbm7IjO105PyssIclCxr1w4rqpMdEIIVjqVV73iTSv80hjKBKUcCwtXBeLjPM/mUwyGNu4iLveTH9bBBAIyACWmIqOb21HO1xOleX5eP/MFd+rQvX1n+4RzkE1EjjcHjI6Ij7+PZVOgXGM4eIq7Ig/q9fXM+Lws/SGFRjvj3wYZoqM2y7RujXtZLoRZuAvl3w16NUj3wWMoMuQN0eHaNaKTjNPM867eBVOvMNqp+e1oE1ayZX05PUWyGDj7+A25PTt4W+wYcdY1QaSsIq1Z04CE3MTEXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJoBArt8iGc6Gzons6W77Ci+eHA9M1YfP6txE2pVuEI=;
 b=kVH1CML8cWGdyHOiygRxjF0UmAGmbcpY7epBcKhjv8H/bC35Rc230/iwZW3uxgVSA2fxUbKSBqGVJkV6h9uVOCvisUruf7i7SAVZWpuQTjcpTU3Q5YsUttcL4bjcMMGePE6UNcjVgwQuU1kAZHx9z4KlXmTxNzY0DkgSMtulefoELVcSvzMtU2NyhlnOo2xsp2U1ODV81yacGBH1tGKD6oavrD277AN2H7hJJVKlbAZUvZ6JqD3wJIx0Q7aZdmga0qnzDTAZ/+vzq7gGID60fV3PTvkwbzchyfmlY8+29CHDa1hLtGKk8Rzv7HLTgOZGnIp/HrHsXWHqFhC2n5tLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJoBArt8iGc6Gzons6W77Ci+eHA9M1YfP6txE2pVuEI=;
 b=bBP+Tkwj6Y/qaModtgUaBNVcHIoWendGpt2f1Szt/9e+SfK3vlWeCmTN8g+p/CrMduhlU3YAqLIlr0TH+uSwrnLM1Ms6dgL6LmTgFVkFr5P76XKfxprJ3Q2DCdMuLRXFFOTl/9pAhK/Ekw29VQwlpL54WaQcRnldceHvtDDKL94=
Received: from DM6PR02CA0074.namprd02.prod.outlook.com (2603:10b6:5:1f4::15)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:15:35 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::2d) by DM6PR02CA0074.outlook.office365.com
 (2603:10b6:5:1f4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:15:35 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:15:35 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jason Wang <jasowang@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>
Subject: [PATCH 03/47] virtio-net: fix use after unmap/free for sg
Date: Tue, 14 Dec 2021 18:00:41 -0600
Message-ID: <20211215000125.378126-4-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab7e8852-4157-4bf1-1dc3-08d9bf600427
X-MS-TrafficTypeDiagnostic: BY5PR12MB4099:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4099963043CAC39625C0EBDD95769@BY5PR12MB4099.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgpPTmY0lC1EkoDZNa5Swleb+15Eqph5xdrlDCVtnF9OPSnsbmCetkWhzmfMFASQ4cGgeKXd0/mj8/MUhRxJCCT3Zggf7WvcX30K0rTF+Sef3huMalC7JHwtEhfbuA3+4O4AS86PpBmNmFPAcdwrGETawb29zqpXY2Dmh2wfxx3SGMi0RVj5xUUNeun8SQwFEmdZdNAds2JBukgvay+9g111LC9dJQEplcgUK20aWOxukATKXOIEBt8YOsfzEMrw/ghxxLBys8rSwvk8w5l0zUezV4xDBgk9M54GgPxFFi3qh/kuiUQxoDZiNYDcgeW+LRifdyjyf0gqzurjoNyPaNpsnsnig8uGNa5WC0k3nk6etECJPaL0XcNP/O4wofz547NxEn9CzwZ0CZBQOb6DGadBeBn0tyvZmdpFQQMeuQ8VKLJwlYbKfKrXK/Idusu56RjVbO1iyJhesvChOvWjqhykxNns2xze4hHueSlhpnXHlG3qfQRRW5x/0Trfqzpl9gZ+przV4MMZcfQQNSSeKkytOm3j6Lb1sQGbVgrXztw3Gp+Oi6bXoGvGGdb1R9jW01eVzEt1PhhQSn6DKqxTJNDKIBLVKLiVOmfeTHXBvetE+VpHCaVvVKJCI9tKCN0QaXJsDeQhaR7ND0DbKrmh0OU4xCLKI2qAb1lDkbpM1FG1/zy3FrVp5m46wO8yUAgjTk/5S9jvnGEAf+0xWgbHsxt+TijXyTYewL/Z33qySo/08ZyqPVol1K3bJymp7gka6oDmIKSpm/CSIx11o2qE11k4GjK2trzFUgUtV61VGbQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(1076003)(70586007)(83380400001)(6666004)(40460700001)(36860700001)(82310400004)(356005)(5660300002)(70206006)(2906002)(81166007)(508600001)(26005)(426003)(8676002)(8936002)(316002)(186003)(4326008)(36756003)(336012)(86362001)(16526019)(54906003)(44832011)(47076005)(2616005)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:15:35.6280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7e8852-4157-4bf1-1dc3-08d9bf600427
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
Received-SPF: softfail client-ip=40.107.93.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
index 16d20cdee5..f205331dcf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1746,10 +1746,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
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
@@ -1780,6 +1783,12 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
 
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
@@ -1791,7 +1800,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                              n->guest_hdr_len, n->host_hdr_len,
                              vdev->guest_features);
             }
-            return -1;
+            err = -1;
+            goto err;
         }
 
         if (elem->in_num < 1) {
@@ -1799,7 +1809,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
                          "virtio-net receive queue contains no in buffers");
             virtqueue_detach_element(q->rx_vq, elem, 0);
             g_free(elem);
-            return -1;
+            err = -1;
+            goto err;
         }
 
         sg = elem->in_sg;
@@ -1836,12 +1847,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
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
@@ -1851,10 +1863,23 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
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


