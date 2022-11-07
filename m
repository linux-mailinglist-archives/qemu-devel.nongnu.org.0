Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA861EA1E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 05:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ortWI-0002Qy-59; Sun, 06 Nov 2022 23:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ortWF-0002Q4-Cl
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 23:13:55 -0500
Received: from mail-mw2nam12on2061f.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::61f]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ortWC-0005Fj-Jf
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 23:13:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK7ma4klIVfrmHijZ94ImHiwcxDXdqiO2rEGtDNqVm2+AqRyOGriGGe5w2bMtqwUm/1rsYRR1mZ2Yd4jidqrz7nq7P2QGv+95scqGaZObCcKx5aDJpSCAS57bs076xWHkMseBWAF9P+Fbi3mqkEHy5mbDx1x2C/hxOP7IS1Ebf6JVGm4G+ds54sniNiRkm+zQscawI6a37P+yQN6Kyf8IR3PDjajg/O4McvWNPvy3rYDy7sKFjHJowL54t/wLfgdLgY1eqYyColr/RfL+76e1xnvoJj9FXsPpb3oJZ7ySfPsrbZ2xj3l1holGicxu0GVo3qbKARZ2J1Ci6pJJuCnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAZHzXwUDhmCQ5uIEE7zyz3xdGGGkWJX02k/u3/9hAE=;
 b=BvsMblX6X+GgGuoKMVcVzS63AFLXsIMHOD9PAHQeHRcRgYojpFgCrTEpZOT63vou97nBmKUT3bmJoqU7KZUWgb9UdYeWl7Djw9NlyesmSYKg1xyWgD07beywuR8kgClNf6ZKT2gaxb0HR8L7jz9iagHy37pwR7ZOc26jFYQdRIgb6CBxLo1RjPHGJdQbVX3nKaaRybbFNpHfmK7UWT/9hz47rs6KQpsOEbLTSpKe5KNGwvClLD9+zg3cj06idYZ0cKCOj4mS8e7twkKLtzKiU/TUxzLqJ9EEVMjFfQ8l86H9xEtneFcoZ35iuYMkb5o6TX8sT832lLgCLO6WOOdyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAZHzXwUDhmCQ5uIEE7zyz3xdGGGkWJX02k/u3/9hAE=;
 b=jVPTcO9rouOZpE/ezUEIXov0Oiep9rqYsciQm0M+ZM0eBvwOhtA8nQvOomCDrAr08g+MFV4f100d/mLkuwnQ3vSF2ioH7ioPlJLgAmG83dVck73BTuowfgQW2kyCfU6TowVrVtLyEjIyMQvOTkWdBI/7+hJVxoWpOubp6DVp8XKTx/Hrq3dLC4i6KW2Auyc3/9Y2kJlQ/FSC+3/2RUOMw54qh//i+RnaAQFSYKAm7D9PgpTPP1MnNmEgXow5YqOlx6DvcNUa4LKpLCRiu/VWfo5+W9/xMo38/Y3R9N2i4LK8nm3wI97QVtX7dG3EE/jZSOX6oeeZDJVyxzf9dRc1ig==
Received: from DM6PR04CA0016.namprd04.prod.outlook.com (2603:10b6:5:334::21)
 by BN9PR12MB5194.namprd12.prod.outlook.com (2603:10b6:408:11b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 04:08:48 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::a) by DM6PR04CA0016.outlook.office365.com
 (2603:10b6:5:334::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25 via Frontend
 Transport; Mon, 7 Nov 2022 04:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 04:08:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 6 Nov 2022
 20:08:40 -0800
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 6 Nov 2022
 20:08:39 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v4 1/2] vhost: Change the sequence of device start
Date: Mon, 7 Nov 2022 12:08:17 +0800
Message-ID: <20221107040818.619072-2-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221107040818.619072-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221107040818.619072-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|BN9PR12MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: cc68067f-0fce-4559-2dce-08dac075c51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGd3jR/S1mSMquejQ1EnTSJc0rPeKU6UxXTF2z3OFLo1J9sxJXyWk9wBAzYYTWSaeyyKoSxXJ8iigwId0l5lD0MFeDjY8UJdRahqFkSsQY/QTw7BmKgb5Db6Yf9UJ6wxB9iC5DYGJ30UUHESBYRisHBRqlL1O/y8vkxJtiEPA06ZJhGPwrMbXm0XSncd2xMimycQdUaIcebtHR4GlV9CHnekc3zIY6C7D+E1nb1pDpxbwg+sCSy5M6nzNt+44WWs2kJyURUs4rlbyjulYMO/fA2V4ZJIc1FW2NGmEOqdRNEYlgNcsKURKsVYnBRUTCR9tXUxbQivM+f8tPKmgJ3B24wLiwSuDESlfnNFdblv3mtGgHyGv/QM9Q1pri7gt0wZJTZVFjF7a0Ew99offQjW/iYFcJIP8xnC1+uqr0foq2XYn2BgQRdFrrJO39I/3DDHB378C5CnYYkF4MjKnLL7H0v0ZNSUQeloL+1RKSq8VoPlwlBrgjEIlIrUkZSrzobv8RmD3KkGXHzXzTSFztBwz6YtDSNqWgoKct/5qRuTBwrvB5n50qxdkP1LzT+Q+CRGk9DDdZvkdYwKf1M25VfMvygo0KlGxdHJtts4VJWZ4xyQvcuMdpEF3SuhHKqFcudDsJs+pqwyMewqb0n7Cb5kf1rpiXAFqrSP28leT0KUtTzbLisNpTKq1DZLwe8u9nSD6Wyzyw2PiW3+vZSmzzEormKu52F9iSloAYY/Qj+IXttxmgkvGr3Zf7f4/OOG6AD32M9H+6Hwow4SpUciMyrp6w==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(336012)(83380400001)(426003)(356005)(7636003)(47076005)(86362001)(36860700001)(82740400003)(5660300002)(2906002)(8936002)(41300700001)(82310400005)(40480700001)(55016003)(6666004)(7696005)(478600001)(2616005)(6286002)(16526019)(1076003)(186003)(26005)(40460700003)(110136005)(316002)(70206006)(70586007)(8676002)(6636002)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 04:08:47.5580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc68067f-0fce-4559-2dce-08dac075c51e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5194
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::61f;
 envelope-from=yajunw@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
 hw/net/vhost_net.c        | 14 ++++++++------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 13bf5cc47a..28409c90f7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -168,13 +168,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
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
@@ -183,9 +176,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
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
index d28f8b974b..0fe71ed309 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -387,21 +387,23 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
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
+            if (peer->vring_enable) {
+                vhost_set_vring_enable(peer, false);
+            }
+            goto err_start;
+        }
     }
 
     return 0;
-- 
2.27.0


