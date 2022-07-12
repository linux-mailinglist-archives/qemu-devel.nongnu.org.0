Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1D571802
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:05:56 +0200 (CEST)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDiE-0004Da-Gq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDd1-0000Tt-TZ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:00:31 -0400
Received: from mail-bn7nam10on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::604]:46841
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDcz-0005d1-HR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:00:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5P/p1jMYJzNe57hxXcOVSD2JZM4NAp5NheXlSh7tR+ITt1rjR8z5QJWFuqWJ/kw1xU7baNyewDDyCyLkAo5KHbNvvzSBLbAmfgJsuouWSJAYYPobVnlUJByFclaOvRPR+bnDYeysPgj4NazkLuqAri7slpFkP8plGTaFp1nyYP83KrVYj3SVHfue0ZLeoio9+h7rR6D2D5AKUfn7tSkhnKMituj07nHwS9dhr2pNDmturK65USmfHRLhtgl7gTXa1+bSUeifF9hgLAarb15XJAqIRPoKAuSQn3KDItQ8JSSqr0TaCWTeDJVZHw1OvD1+UA08qvwWif7aBOwERZ2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DHqfeFmREQ6SBawGcShV9g1rwuY5ClcZ+mGZPy/ayQ=;
 b=L883ISEpGWuUG3OHRxXO/nPwiyELJ0D4yM+okFqXh9NdM6DPOmVXHgG2QkpvImw5TTQtR5YsWfDuAJleIzc2v+GHuslmsW73yI9N5i0DDDoURCs9t17L7gOYAGQjmE4ODiCvRxgetWu426F2XHbrh470EYT0PNgq7o1Y1CU+MLr77wHlixZqmHsQ6Hroi3bchYRBsHLRykDYR/+YlveWF8VGd6gGUp1i4WFjPrv7TV1Gay0JUmFIw3LuesP1mc07NllCe/ppeK6G1Yi84N60LMo09nR1cdk8v466EJPo+/q26W6v1cHi7sL5Bjd60m9xS4KEaM5Bzuq2eJ5Pp6ca0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DHqfeFmREQ6SBawGcShV9g1rwuY5ClcZ+mGZPy/ayQ=;
 b=OXVPjAC3AhvhZKTaykXBzL/bPAnSCrMtfEc5EhosGi49rdC4F8C2zGx8Azw71yHz26sNA5qZ3DrucsjgZYiVxs8Tn2zDNNy1/rv8gls/Z4JZkYpclEBaT8U1Ko3Ed92OAIk9p/agbnodWQHjNPN7F46NBictsOaSL5KjpUPUh/L1K+dTqOCw/D/cm1lAb5HQ7uR0sgnFKjHyFEMuepgHkqX066wOu0T0rwU9LBKcxVW3SCQuipGY4xR9G4Dk0FBHo4/+6xpAgOFEOcNM+xQKNehI2A97Wuctgdc5GNVKM0WKa8Zquqi84NhJVcgkF/LSJNWEyu0woLApP/3hgjIxBg==
Received: from DS7PR06CA0040.namprd06.prod.outlook.com (2603:10b6:8:54::28) by
 DM6PR12MB3226.namprd12.prod.outlook.com (2603:10b6:5:186::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Tue, 12 Jul 2022 10:55:24 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::2b) by DS7PR06CA0040.outlook.office365.com
 (2603:10b6:8:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Tue, 12 Jul 2022 10:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 10:55:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 12 Jul 2022 10:55:23 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 12 Jul
 2022 03:55:21 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v2 1/2] vhost: Change the sequence of device start
Date: Tue, 12 Jul 2022 13:55:00 +0300
Message-ID: <20220712105501.688628-2-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220712105501.688628-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20220712105501.688628-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 717d8152-7a66-480b-92f2-08da63f50602
X-MS-TrafficTypeDiagnostic: DM6PR12MB3226:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iFXdYRity6/TuHsx3loTNQUqmLqA889hfUK+aqWShjISk181kht/9zesH3oRUmkLmQD0SZuy1NZhETpuBPkdUiFL5B4zKcIl9Acs8My4fjT7HKKX6SU8g8kn/MN/cp1AkM2VU1KKfgjShay8yS/765EMPVUb+Bv3NRKmJiQJxEr823+MW2B2jMyYuVgBxuoJlfqpy8W3+wNSc9x92goIVQU2BLl47nZ5rVex7MoYEMLMW9IruRzz6BudAORS+qZKh9Khcd0KX1qrp8xOd7YLC9r018R9gq4Rb+J/xGz3ebqBAeKvPZmn2RSzP/DRpHh41mbk7oM3Ua+3F+p05LODykgTw52ih4hJ6qk2FARciYKf9fM+R8g8L5xW4yvaxitwDyK43BkZb5XSENYYsvlBKnG8MYCdnGDvfZtrIBd5b6IuVN4yVcKklCmrCsjkg8n7Ct55R9lwlVqKWctJdiOdczn9UrhY2SOLNi/ycH1n2ruwL+3zt3eVdW8AnumQjRs6zP4yk0h6fEzuJoXJpt9PRa3iBvgsTfKj5RgAHnExKOtZGVL++eyKnEEGNizgC8IfsZuSZNaT7Rb+nTp42akTHFtiD9UtNNWeYiMIRO+4QQwBfgf0BVFc2zdFkyiqzJZEEb8KoeR61JkeJmTLF5yXe7E1H+5wd0VKLU5HG8YHN+mPKXwjd6JJ3bieCQ8XtGYTiMkp7mx2YHw0a71QJQuvOX3TWuDjpXMjRrmf+bvBD8UHhOzzZ7UYY0ddq6WpbLmnLgB0b3RQ2QnAuItSFZmzAuF3Ml/xnovYWB/nONspHy2REcT8wAbnFwByvrzsUIzyqgCUDFH3ZlpbJFh88cJXpuw5BEktdO1Qn3LzU8q01s=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(40470700004)(336012)(36860700001)(47076005)(16526019)(82310400005)(6286002)(6666004)(26005)(36756003)(110136005)(2616005)(41300700001)(316002)(83380400001)(7696005)(40460700003)(1076003)(426003)(8936002)(81166007)(186003)(356005)(6636002)(82740400003)(40480700001)(55016003)(8676002)(70206006)(70586007)(86362001)(5660300002)(2906002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:55:24.4065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 717d8152-7a66-480b-92f2-08da63f50602
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::604;
 envelope-from=yajunw@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 9117222456..972ef46365 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -163,13 +163,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
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
@@ -178,9 +171,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
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
index ccac5b7a64..6a8a6082a2 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -370,21 +370,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
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


