Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FA6A98DF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5kJ-0008NO-K2; Fri, 03 Mar 2023 08:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pY48K-0008LG-1r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:03:32 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pY48I-0008AH-1D
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:03:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oamyy/AgmkyHCcEbM+GJT7q7XYjzRJAazR1S2VfxqnxgUJEdZzETM68eA/gYFbDnWTvfUUHlKsC96HTH0Ou58NFQ7Q2x03XijgMG/k86u+dMsHSrrdazAvY8Otu2JJ97u+NRfVApanAUHboEC5nTpypliR7+PvG3LW/wSyh7XoMhcV3Bz6lS6qXmPMecYBV+EtFmOct68WycD0k1e5MJLeZA6jYrAqJw8Z472D0HuiNccKPjSzViwzreSpwal+dv7jFoyZsSV/QvUDrlF6KAhVPPLzuOYT1y7JuLCTA0CGcqk4Y2zz/1cSwlPxgx2xrfskewjH2vawajc28RS74Ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N8e6lIUlaGPxheMg0e9L07hLwkFL4nVCKIcxL91sSM=;
 b=hmAp9TFKMJC1jxGAL6nQxXp+tkdO9CHkBHDeihoN53JcZjcOS9w6SspRcMl7JsijdpTRtu5r2TCkvN94SjZcxJww7UU+8F78JeoSqKitGH3AqionZjN3xB4ICyvoNCrD2znPt+bhEVYS+33cKP3yhZ3zFVNetrXcOqoQJNL7o+h1eXjqjLCzDhIP5pyQ4kCC3zv+6rLpfWmbO+WJqDSwSQieKihktyPBaU+rxWEn3octf2hXWkCftwHz5lOaa2qDah8TkA2EqsWtFR9HLtxPdIiVWn2sgyww2ATiOO2lFj6PM8Nb2OJYL1U3l077eEvxhNfTWX+gGJkIoNS39JF9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N8e6lIUlaGPxheMg0e9L07hLwkFL4nVCKIcxL91sSM=;
 b=4btbreTon7kb6KdScYt3sJ9/W2oqs0PQxdLsaCT1uxyGSaEh1vzjPmw82PlJDDf2ZKa2jtPznET7nU6zcTcu8RYIqucx0BjFL8aaMLPRPbTmeaVUtWJ++brBAfCHcGiVQVg9Q5hzYa/dU1PZDRIDbutFCxVDjwxmQR1gkkcE90s=
Received: from MW4PR03CA0331.namprd03.prod.outlook.com (2603:10b6:303:dc::6)
 by CY8PR12MB7361.namprd12.prod.outlook.com (2603:10b6:930:53::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.28; Fri, 3 Mar
 2023 11:58:24 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::5d) by MW4PR03CA0331.outlook.office365.com
 (2603:10b6:303:dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 11:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.20 via Frontend Transport; Fri, 3 Mar 2023 11:58:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 05:58:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 05:58:23 -0600
Received: from xndengvm004102.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 3 Mar 2023 05:58:20 -0600
From: Gautam Dawar <gautam.dawar@amd.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <qemu-devel@nongnu.org>,
 <eperezma@redhat.com>
CC: <linux-net-drivers@amd.com>, <harpreet.anand@amd.com>,
 <tanuj.kamde@amd.com>, <koushik.dutta@amd.com>, Gautam Dawar
 <gautam.dawar@amd.com>
Subject: [PATCH] vdpa: fix emulated guest announce feature status handling
Date: Fri, 3 Mar 2023 17:28:10 +0530
Message-ID: <20230303115810.7482-1-gautam.dawar@amd.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|CY8PR12MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 312074c2-6f64-48f1-7b49-08db1bde97b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xrUVOVoIPmWuaRzPw7M3QKz+oKeJLhfdXo9wciAj09YKvDVyofX8lMo+/OQbTHvR6l6DAwuSFG3DeT4Q7xXBPrrJbYVqUg+TFB+JuEf7WHkvlt4cZgV3dYyTbrM3UQCLIilNg5vp3eaV7/67mUSHVVThAfnbJwNEAATXDLtLx4faKC1RpTGJzrRXJG78U9C67q9tfh7bBG/d3U2JfzfycGMhw1Wx1EyIEX6W4oKOrpbwkZWx4USf4hi3r4UmKx3q8iM8z8CLS4XeE7h4x3LwXfWmQ9ZnbJUbgsCxuMCiKb/uYo23l9GHx4CfzvKl5gjSibYocuy3HUkG19TZ5OzTr2Uxw0glyYjuYc6OHvEjDYp+Bc8+KF2BTUUVlKOkdVEcOgdIF14FMZF57/3kGHAXoY2eQrH0gObTeXd/0Dj1SpXIE04rqExFajLj+ftmLDJtgBqrdbioiPFWQfLaEurOeyR96PRT16P79CwePepCE+ltuM5lIwlKIVmWPF/32cSBke9VjP845leYhTX2axrIlk9OD6DlleLLdpBECoceKB70aRciUBTbNviUn1tT3whyfl4VgXlQcf+y3WOtD51NfwcgLfR+joPTlxoha0s5M/gMjTxufUaafzgqJr2CAvk7QkZbs8VqsdIVrIgrjNHZIg06UaSarnXxAXM7GuGOBzCtwrJ1pHU6tfOdR5d+0jwIZnFi1j4BZ+dkvGYYpx0o0mzxxKcj6h8dVg8v120bLE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(6666004)(26005)(1076003)(186003)(47076005)(426003)(2616005)(40460700003)(82310400005)(2906002)(54906003)(36756003)(110136005)(83380400001)(336012)(316002)(40480700001)(478600001)(8936002)(44832011)(70206006)(41300700001)(70586007)(82740400003)(5660300002)(8676002)(36860700001)(4326008)(356005)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 11:58:24.3372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 312074c2-6f64-48f1-7b49-08db1bde97b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7361
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=gautam.dawar@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Mar 2023 08:46:05 -0500
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

Guest announce capability is emulated by qemu in the .avail_handler
shadow virtqueue operation. It updates the status to success in
`*s->status` but incorrectly fetches the command execution
status from local variable `status` later in call to iov_from_buf().
As `status` is initialized to VIRTIO_NET_ERR, it results in a
warning "Failed to ack link announce" in virtio_net driver's
virtnet_ack_link_announce() function after VM Live Migration.
Also, I noticed an invalid check in vhost_vdpa_net_handle_ctrl_avail()
that reports an error because status is not updated in call to
virtio_net_handle_ctrl_iov():

    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
    if (status != VIRTIO_NET_OK) {
        error_report("Bad CVQ processing in model");
    }
Adding an optional OUT status parameter to virtio_net_handle_ctrl_iov()
would help resolving this issue and also send the correct status
value to the virtio-net driver.

Signed-off-by: Gautam Dawar <gautam.dawar@amd.com>
---
 hw/net/virtio-net.c            | 9 +++++++--
 include/hw/virtio/virtio-net.h | 3 ++-
 net/vhost-vdpa.c               | 3 +--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..36a75592da 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1503,7 +1503,8 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
 size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
                                   const struct iovec *in_sg, unsigned in_num,
                                   const struct iovec *out_sg,
-                                  unsigned out_num)
+                                  unsigned out_num,
+				  virtio_net_ctrl_ack *status_out)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_ctrl_hdr ctrl;
@@ -1514,6 +1515,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
     if (iov_size(in_sg, in_num) < sizeof(status) ||
         iov_size(out_sg, out_num) < sizeof(ctrl)) {
         virtio_error(vdev, "virtio-net ctrl missing headers");
+	if (status_out)
+		*status_out = status;
         return 0;
     }
 
@@ -1540,6 +1543,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
     assert(s == sizeof(status));
 
     g_free(iov2);
+    if (status_out)
+	    *status_out = status;
     return sizeof(status);
 }
 
@@ -1555,7 +1560,7 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
-                                             elem->out_sg, elem->out_num);
+                                             elem->out_sg, elem->out_num, NULL);
         if (written > 0) {
             virtqueue_push(vq, elem, written);
             virtio_notify(vdev, vq);
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ef234ffe7e..da76cc414d 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -224,7 +224,8 @@ struct VirtIONet {
 size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
                                   const struct iovec *in_sg, unsigned in_num,
                                   const struct iovec *out_sg,
-                                  unsigned out_num);
+                                  unsigned out_num,
+				  virtio_net_ctrl_ack *status);
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
                                    const char *type);
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index de5ed8ff22..c72b338633 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -638,8 +638,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         return VIRTIO_NET_ERR;
     }
 
-    status = VIRTIO_NET_ERR;
-    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
+    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1, &status);
     if (status != VIRTIO_NET_OK) {
         error_report("Bad CVQ processing in model");
     }
-- 
2.30.1


