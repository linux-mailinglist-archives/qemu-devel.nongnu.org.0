Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240404B6887
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:03:09 +0100 (CET)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJufs-0004zr-80
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nJuck-0007ch-MH
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:59:54 -0500
Received: from [2a01:111:f400:7e83::604] (port=29349
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nJuch-00044P-PV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:59:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsSRs+w8Ql3USNgtp9dLf3I4TGRk47en8EnMWaJRKUCnkkZX1rSp/qNZ09Ley7JcGWe+ptBImqE/D7Rmz4a+ppH0tEuaZHWqM7gSIif63wK5G3chLibA1wCGAFWnOJiAsIqV2q/iXIlClLzOnRqQ8rWYHfJMnRmRDUS3bdjjUpkhGAGo5cJxA43ZRVAPDIyCfSFTrO50eV9oFta0uWmDngx8ZZgZZE5KVWPlWlOfJRTeCYkS30bv2aXEvyE9sJ7/+oNq/SOnwTLwaXzSiSiLQKEf1529+mg6x680GfX6DtMq9MMvNkw2FNoH6uj6cVR24phAEYMJSRoiZmKzu3n8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqtTVGD048U/+5qa0U3+yUmyLlQi4HW/fAZKlkGxf4A=;
 b=d2f5dqzHeUkaREzDCOShffDjustjeYaodGUsMUSkwDhFvsyVCvWO3ya9jF0ddeBt7pbLvDduk7yWxvT6kq28bLh3tA/a2IUr9TzU2/VtJ+PIOSuOyJqpHZzhqHL9iwNUCgeTA3Ju6mrV/KMpZgmBH0g8WdK85vUwA8uc4X/XbXLzWlnEaFKzb6Ervh4/lcihrn42Ew3yv+rf4lNVz0PShxQk6ACp46zRaOQpijGHmYtNceNrWEKsKFkhorI+fTmwPqvhTh6zDZkfziF9XoBDk5S1Zq8E610OMjzKnuQAFMSDds9cC9a0K1nUJqfq0k8tRnb84VjBtzOS/CivhSyIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=redhat.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqtTVGD048U/+5qa0U3+yUmyLlQi4HW/fAZKlkGxf4A=;
 b=YH6F9UGbDnn17eUxc4TQm2tWm33LgjwqRrpxyKimdZUrc0At1ZA80WVPffDY+QfCJZkdK8JVOnbWMWbzHkhWebKqHSmKodC6Rpqiw7sD/ByLcsM3bLd78PHhGEX6YYm6OjaZz+7Z7gRoEd0r4M27cG8zXglQW2h2trwzAGXrxcQ=
Received: from BN6PR19CA0102.namprd19.prod.outlook.com (2603:10b6:404:a0::16)
 by CH2PR02MB7080.namprd02.prod.outlook.com (2603:10b6:610:87::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 07:23:01 +0000
Received: from BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::e7) by BN6PR19CA0102.outlook.office365.com
 (2603:10b6:404:a0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Tue, 15 Feb 2022 07:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT062.mail.protection.outlook.com (10.13.2.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 07:23:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 14 Feb 2022 23:23:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 14 Feb 2022 23:23:00 -0800
Received: from [10.170.66.102] (port=55622 helo=xndengvm004102.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <gautam.dawar@xilinx.com>)
 id 1nJsAt-0000hL-NR; Mon, 14 Feb 2022 23:23:00 -0800
From: Gautam Dawar <gautam.dawar@xilinx.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <qemu-devel@nongnu.org>,
 <eperezma@redhat.com>
Subject: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa devices
Date: Tue, 15 Feb 2022 12:52:31 +0530
Message-ID: <20220215072231.2498-3-gdawar@xilinx.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220215072231.2498-1-gdawar@xilinx.com>
References: <20220215072231.2498-1-gdawar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6579719e-a549-4110-99ab-08d9f053ff99
X-MS-TrafficTypeDiagnostic: CH2PR02MB7080:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB708014B0FFEF1094E0D471E2B1349@CH2PR02MB7080.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xC7XFlBuIEFOpZCjtTu1Iq5W9BAn1foHHV4iMN51Gu0yir9h8Av0chvs0Fe9gmq+Lzb43YjH4q3VKL16lqwuyuk0pL2Jtgd9zMGCQCmOmAsg2OboeoiAwuWbltEon4+ULsTAGnztwFx2dXhscgLapopKKzT6r523HhqzwxVwE+Mcz7cPaNbmD3odHXrtKPlW8MnvTqgUCwsjxVfnHwPMnscInMl7UOFq8ZIp08MqKRtih49qE0lHXnnSfiYzUofN1PS1lpyx7f2nYQyr8eU2kerFFF+hlQ7O250rEfBoM2dIif+Jd5BnG5iXcwBq/3J9FwE7pHtujeidG4Yt+uThp2F7N7jY9LPDyEVL75sm7SrtnGejbAFUoLeJK5SvANzoYlDVsxRFCTzi/Ymc6/oequ4hsdJj2xGfo4c5OcfCKJ1hUBCnkrkxuFEWbaQj1ONxOnSJwth/WSUxySo8pAAcpybLSDuJo8PyzaZx+K/NqwEows8g18OYXDpca68L1ziRcE4t/70vkLWBvkv0uPMAyInPOxUbXHygdkxP829RjuScOx6zBOzViJmKqqiLgp5cNY6zymGR4sGcfYNPIJeR9WO7CDhMTkekptd6EUSKAT4Abq6SKGT5LtX6OluYa+gDFtkTh/ys0D++Fac+RV+DpXkGvr8/rB/qVrpAwOqwZVMTfDQ7QkZYo4NXh8GPT9NsFwfJl+DEstT3Nuf+6acRg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400004)(36860700001)(7636003)(2906002)(356005)(40460700003)(44832011)(508600001)(47076005)(5660300002)(110136005)(70586007)(54906003)(70206006)(316002)(107886003)(4326008)(7696005)(83380400001)(1076003)(8936002)(6666004)(9786002)(336012)(8676002)(426003)(26005)(2616005)(186003)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 07:23:00.9437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579719e-a549-4110-99ab-08d9f053ff99
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7080
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e83::604
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e83::604;
 envelope-from=gdawar@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: martinh@xilinx.com, pabloc@xilinx.com, hanand@xilinx.com, tanujk@xilinx.com,
 gdawar@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
for vhost-vdpa backend when the underlying device supports this
feature.
This would aid in reaping performance benefits with HW devices
that implement this feature. At the same time, it shouldn't have
any negative impact as vhost-vdpa backend doesn't involve any
userspace virtqueue operations.

Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
---
 hw/net/virtio-net.c | 10 ++++++++++
 net/vhost-vdpa.c    |  1 +
 2 files changed, 11 insertions(+)

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


