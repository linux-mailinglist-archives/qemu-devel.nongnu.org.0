Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44404AAA6E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 18:12:05 +0100 (CET)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGObT-0000lR-NF
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 12:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nGNrV-00021R-6N
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 11:24:33 -0500
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com
 ([40.107.94.50]:22209 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nGNrS-0004yf-TE
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 11:24:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ4ktbhPFI1CBvxRXatCuppxAoT/rUALiPn4vek2ZiBxMNuVAag4yA8PZeCbQuSJyVoHeTMczqVNrZyWOR58ghsWnTAdg4NKDauDQy3rtQkMoIovq5cNrEp9qPNOOUX5Zti4JcpyFgXccKIeeCSeXC4ybfvR4dQ7sdRKKfQqRfJvO120hCrdP+wem4Y5xPcQ/AXBF9JRVZPiVMvJG6vyjHTJCXDu4Zbols8zAN2oGhvuPVuuT/PqBBMu4BB1WMgr4cz9SWeW8TYsWZOH+OaQOPgEBlHuPZq+FzHd+pcRyd9xn++PnCqMVAzStAzkHGXZBLqG4/Jd1q79JVn9+JGc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uxz43FHjKeqDRsRKaV250D6MrjZJsJRiBsFtOuLQ8Nk=;
 b=nmjScchYsLFoRYshAshI1+FbEQXDuxaDqZq7nPVFhV8zYfHxGmkkww03iCPPf6JgvtbOHZ2LM4IS1meByjDEyP4uaH9SnGB0eLi/2szqj3etKsVeNiW34J9rjyILauJBtAI9/W0iSwkI5VTPmbbSVkGh9qdTGVp+oVCr2WNWwSoK/QAo8hK7Y+nMN6RApdG2Fip2wHkAg8XaPbuiWNc0dJMo2sJTcY80eEsQPZYXE96QSACOcELVYHjowowSt1Ed5uhSinU9cEsmqSlRS+zLRtEQSrRt4U7yWi/A5kHMVewAWliz6ErPGv9RxD4YUjAiC3IVipCA6WhBx8Jn2xmeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uxz43FHjKeqDRsRKaV250D6MrjZJsJRiBsFtOuLQ8Nk=;
 b=bFd5mRR/Me4adqc3XB38SKidFrPMgXcmoZiChDi6euIaReVbasUI+qUbTMtrRHwnvMRXdzlQGTI0DvKwtsnFjl+zTC6gkJIIcFyvfEV/QQjTOW5PvyA168tDE0Rr9tJax9AJgw0MpUXJ/Y0k8tehPHAQkWq8EYdogzjcg55Rumo=
Received: from DM5PR17CA0054.namprd17.prod.outlook.com (2603:10b6:3:13f::16)
 by MWHPR0201MB3595.namprd02.prod.outlook.com (2603:10b6:301:7a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sat, 5 Feb
 2022 16:04:17 +0000
Received: from DM3NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::7b) by DM5PR17CA0054.outlook.office365.com
 (2603:10b6:3:13f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18 via Frontend
 Transport; Sat, 5 Feb 2022 16:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT022.mail.protection.outlook.com (10.13.5.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Sat, 5 Feb 2022 16:04:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 5 Feb 2022 08:04:15 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 5 Feb 2022 08:04:15 -0800
Received: from [10.170.66.102] (port=50910 helo=xndengvm004102.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <gautam.dawar@xilinx.com>)
 id 1nGNXr-0001N0-Kn; Sat, 05 Feb 2022 08:04:15 -0800
Received: by xndengvm004102.xilinx.com (Postfix, from userid 4129)
 id B81F34120F; Sat,  5 Feb 2022 21:34:14 +0530 (IST)
From: <gautam.dawar@xilinx.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <qemu-devel@nongnu.org>,
 <eperezma@redhat.com>
Subject: [RFC PATCH] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa devices
Date: Sat, 5 Feb 2022 21:33:49 +0530
Message-ID: <20220205160349.712-1-gdawar@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a295682b-88ff-4825-1709-08d9e8c129b2
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3595:EE_
X-Microsoft-Antispam-PRVS: <MWHPR0201MB359566176D389C000D37B7E3B12A9@MWHPR0201MB3595.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGHEX+N/H1ImPqa2uknqJPwdZbkZjihq0QYqHXF6owz+WRjf+tExNo3/dKuaiyyCeuPOoin6qXNQjfc5VoyzUXtWMcIqEtaVgcYT3qM7/yRMu4ETWGGBSPC88+ae5hR4yHPgYl2baL/+9jpge0Btv+OxkdyPO+QiFnGh90vKkRYjuSW3IdYjox3JGtLs1m/8xEriRDBB3q4uu90KuKUyEb/Q+6EK8ectbUz081OdQ1O7UMOZNPjKNyovY0HRsCDIrFNEqMCQzlZKAvlIkl5/S37OOjIjRSji9JuAZjfwJBRW0algzdRVQ6Hds24x7MSBvpGJ6aKDuLHqIN/Ngigo7QnArEhSAMF7+uD1b0bZFxDvAAbN7SZIy6q1kP3oo5X63DOQq1CRrc+P2E1bMXeWEtMXc3sCvPGHmdkPy0nAdpaibAf5+4LyZkl6m/6zjBtodrfOBmHjogtk4S27QrjHxo00TegkQFzAmpv1TqvGhGiS3+MrILO/hbRdICp1IkJWiYmCXxaHwA0AFG2IYlYCWajB3FNvN0Ty9UBug+tBIWxsy50HzfPPE/8OLG7YqirAouIoRQMBkRdYCPBB4a1PzlvnkY5ZZQvMsV50+zzRnZDL5LlPR2DemMK1lo0B7FTgD1ES3UJGF3d1WJ/AOvRz3JPTKIEBCgvIbEX22+/4JnopviIjK1p50Jupk5/UPdd5
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(36756003)(2616005)(186003)(110136005)(82310400004)(54906003)(508600001)(1076003)(6266002)(36860700001)(26005)(336012)(426003)(2876002)(2906002)(42186006)(47076005)(356005)(8936002)(70586007)(7636003)(316002)(107886003)(5660300002)(4326008)(8676002)(83380400001)(6666004)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 16:04:17.4567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a295682b-88ff-4825-1709-08d9e8c129b2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3595
Received-SPF: pass client-ip=40.107.94.50; envelope-from=gdawar@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 05 Feb 2022 12:08:34 -0500
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
Cc: martinh@xilinx.com, hanand@xilinx.com, tanujk@xilinx.com, gdawar@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gautam Dawar <gdawar@xilinx.com>

Hi All,

The VIRTIO_F_IN_ORDER feature is implemented by DPDK's virtio_net
driver but not by the Linux kernel's virtio_net driver.
However, this feature still can't be tested using vhost-vdpa with
hardware devices that implement it as VIRTIO_F_IN_ORDER isn't defined
in kernel's virtio_config.h header file.
This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit for
vhost-vdpa backend when the underlying device supports this feature.
This would be useful for benchmarking the performance improvements
for HW devices that implement this feature. At the same time, it
shouldn't have any negative impact as vhost-vdpa backend doesn't
involve any userspace virtqueue operations.
In the final patch, instead of making a direct change in
virtio_config.h, it will be pushed in the kernel and then QEMU's
file will be synced with it, as usual.

Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
---
 hw/net/virtio-net.c                            | 10 ++++++++++
 include/standard-headers/linux/virtio_config.h |  6 ++++++
 net/vhost-vdpa.c                               |  1 +
 3 files changed, 17 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..a1089d06f6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc->rxfilter_notify_enabled = 1;
 
    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
         struct virtio_net_config netcfg = {};
+
         memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
         vhost_net_set_config(get_vhost_net(nc->peer),
             (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
+
+	/*
+         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
+         * make it available for negotiation.
+         */
+	features = vhost_net_get_features(get_vhost_net(nc->peer), features);
+	n->host_features |= features;
     }
+
     QTAILQ_INIT(&n->rsc_chains);
     n->qdev = dev;
 
diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index 22e3a85f67..9ec3a8b54b 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -80,6 +80,12 @@
 /* This feature indicates support for the packed virtqueue layout. */
 #define VIRTIO_F_RING_PACKED		34
 
+/*
+ * Inorder feature indicates that all buffers are used by the device
+ * in the same order in which they have been made available.
+ */
+#define VIRTIO_F_IN_ORDER 35
+
 /*
  * This feature indicates that memory accesses by the driver and the
  * device are ordered in a way described by the platform.
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 25dd6dd975..2886cba5ec 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_IN_ORDER,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
     VIRTIO_NET_F_GUEST_ANNOUNCE,
-- 
2.30.1


