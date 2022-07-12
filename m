Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52185717C5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:57:53 +0200 (CEST)
Received: from localhost ([::1]:49936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDaS-00008U-Gj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDYP-00075u-1X
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:55:45 -0400
Received: from mail-bn8nam04on2069.outbound.protection.outlook.com
 ([40.107.100.69]:63407 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDYL-0006ow-5p
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:55:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVNEYRvpGrcxgRM60RncXKDyGCrnz29cOPiWm1inR04/d+wQ2PEswiD95jzcjElWyma/0II+UYmd9uGUO3gElNOVAcvjKQqEHB3jAHZm0kiU28TLliYu+24hfLHpFItLCYoiCOfVtC+g2M12RsOnBupd/r/n734pLuir9xI253DoCBmWyVBcWPEZilHK+pmPVOrhuOva/dqSpGq7LUpQ1i1a00u6quHoosNlO1jdJl5UzUL1+0uch3pg4zahONpGPt36RBPz1mq8uieCbRq17SuoZBNSpr6YpTqpweoRRWuMhRx1j6rPzZwVlJxmBdQtudVZ57EFy2gkDgfyYl1C8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWG+LAHE7xg1FT7V/Inf/9wzOlZKKmFcZ5o+G4Mzbsg=;
 b=Ch+UGOnWZc8qGeRi75FIqV6+lxv7GSgSA3wJtcMh1BS7Ci7IfY07uSI/+9oK+wDCh88Qa4F5BTWL2Qh3u3+1dU/Z/4HhO7bb5+f29foGM9IUfLaKc4gYLo1Wl6gE/V08bn9QaOIcduiDhCVj4DaBr0XyCk0tu+4bcPC4C2UzGZHxblaxkSZFalFai1rzlm9o7BUnXxu9v84yvN/2xIN4kyaYkktABpaczClEqiOl0MoXgTLnrWBk88tjVSenyM/GzwoNYQ6xla82XI+7rpiiUsrVoHLxjnXUUqPYlEnU2cf8zToV9/hvdsubehs6pVh/lxVAZHgNP3fZx27sj72KqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWG+LAHE7xg1FT7V/Inf/9wzOlZKKmFcZ5o+G4Mzbsg=;
 b=i6QTQWzAQgVE6SXm6oaneTQXArNLB3IZFqPJVmAlUzgiLVBrY5ks/BZew/amXN2SVTUIgGQrTDegUEDrNTEMIKdealWIyYss+bzopy/uLr7ku5PFHvBAWHAi1qD3q5dglqkTjvcsvhwsMbBYLCtiNJGPpzj046uSYVXGCkpuZfllBgP6Ko56//MwXAZ8SIJ3AhDDrgm/PIBh32N8ixAQ0tUJXHokfXYyr5OKhsl2bPj3ChMIsuSFzmc0efZOT6OwfqEcDmTz3gWy0EbrZz0+EcAgKoewpiJFBoRDlrqIH0OP1rREUXhtVRjkwniw+JtZK1WOATYcbvmVNeT/2+KUPg==
Received: from DS7PR03CA0254.namprd03.prod.outlook.com (2603:10b6:5:3b3::19)
 by MN2PR12MB3230.namprd12.prod.outlook.com (2603:10b6:208:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Tue, 12 Jul
 2022 10:55:37 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3::4) by DS7PR03CA0254.outlook.office365.com
 (2603:10b6:5:3b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Tue, 12 Jul 2022 10:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 10:55:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 12 Jul 2022 10:55:25 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 12 Jul
 2022 03:55:23 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v2 2/2] vhost-user: Support vhost_dev_start
Date: Tue, 12 Jul 2022 13:55:01 +0300
Message-ID: <20220712105501.688628-3-yajunw@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 539e4469-d709-470f-65ee-08da63f50dc8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEYIPjB6M1m4fyq+JtzJqP4IvCs2hNiecetJBEbIDkeKbCWejx8pls3CIyxxxNGH9Zaky0hqUitsENQcvMc5S842PfvVJR5YVHUHjamiS16ZlZDq+cTh6YnfrK4hV5AFxu55/LsHyWM09JsJX90HiKBzj4L2SdEtrJ9WoYXMM2lRTxpZE2M1UtGMJYyD0QCFNCa3wE21pAwd+igFpZsEWEQ/1GAyu6s3XmG1bVZbpaE6GZaVW8cYus0y2IUlDdMbnYhVsbRfiWP0IbB/6qdXN/2NlZ6HC4gbf8nxuQ78gcQvUxiUkAxYW/HeDuDENCOKMI8Eu7LB81JD81ckMkfM//S1xlGYXPu60QkOAbzCdDw6J1bzo1RIicAjhFntdnEuNdmw9hHxlqgsECFKDIHFVHdrOfDL09nVT39H++VwbYgcRiOpq35OhS98nxN5uuCWFfYKF05vWXc4zAPO8LtWn/VrGGyckHGTEirKjBlbf6/shCIFSrTjyUPkaVvqyAhb7v18J6zfa1yyjv3cy9uKtbybQZEgl9WEDctOdV2+E2F9+Dz5a4a2uBNshgSpvLC6mzdgipd2F1qlxgWLRfNGmpAo35YvsR4w2cRlRKtdh1j8qm8aRRvtdSkz+QhivxQVwBd0Zx58yK8UdkBHTGgEzn65YtfTL0pNk8ROudtNnsU/Vb4aVKtIKOkrwgDNsIglMqaOJCQ8hVMt+7gDYO2GgdHlI+iTN9umxaJ9x0Gbl589IJFEAw+vrhbqiL9ngcM4q5/3V+RnmSoImFsjro0Chqf+RpEuCHxl9Y67eLEufCx+CKHYJUQxnspdpmvLdjmUz18rAbr2FeSRaq5URNSIOrWJFj1U60uZPVBavNtZwGA=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(40470700004)(46966006)(8936002)(47076005)(83380400001)(2616005)(426003)(8676002)(16526019)(966005)(336012)(5660300002)(2906002)(6666004)(40480700001)(1076003)(82310400005)(36756003)(186003)(7696005)(26005)(6286002)(41300700001)(478600001)(81166007)(110136005)(86362001)(356005)(82740400003)(316002)(40460700003)(6636002)(70586007)(55016003)(36860700001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:55:37.4471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e4469-d709-470f-65ee-08da63f50dc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3230
Received-SPF: softfail client-ip=40.107.100.69; envelope-from=yajunw@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

The motivation of adding vhost-user vhost_dev_start support is to
improve backend configuration speed and reduce live migration VM
downtime.

Today VQ configuration is issued one by one. For virtio net with
multi-queue support, backend needs to update RSS (Receive side
scaling) on every rx queue enable. Updating RSS is time-consuming
(typical time like 7ms).

Implement already defined vhost status and message in the vhost
specification [1].
(a) VHOST_USER_PROTOCOL_F_STATUS
(b) VHOST_USER_SET_STATUS
(c) VHOST_USER_GET_STATUS

Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
device start and reset(0) for device stop.

On reception of the DRIVER_OK message, backend can apply the needed setting
only once (instead of incremental) and also utilize parallelism on enabling
queues.

This improves QEMU's live migration downtime with vhost user backend
implementation by great margin, specially for the large number of VQs of 64
from 800 msec to 250 msec.

[1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
---
 hw/virtio/vhost-user.c | 74 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..e6ad4c05b8 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -81,6 +81,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_STATUS = 16,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -126,6 +127,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_STATUS = 39,
+    VHOST_USER_GET_STATUS = 40,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -1451,6 +1454,43 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
     return 0;
 }
 
+static int vhost_user_set_status(struct vhost_dev *dev, uint8_t status)
+{
+    return vhost_user_set_u64(dev, VHOST_USER_SET_STATUS, status, false);
+}
+
+static int vhost_user_get_status(struct vhost_dev *dev, uint8_t *status)
+{
+    uint64_t value;
+    int ret;
+
+    ret = vhost_user_get_u64(dev, VHOST_USER_GET_STATUS, &value);
+    if (ret < 0) {
+        return ret;
+    }
+    *status = value;
+
+    return 0;
+}
+
+static int vhost_user_add_status(struct vhost_dev *dev, uint8_t status)
+{
+    uint8_t s;
+    int ret;
+
+    ret = vhost_user_get_status(dev, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if ((s & status) == status) {
+        return 0;
+    }
+    s |= status;
+
+    return vhost_user_set_status(dev, s);
+}
+
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
@@ -1459,9 +1499,19 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      * backend is actually logging changes
      */
     bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
+    int ret;
 
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+    ret = vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
                               log_enabled);
+
+    if (virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_STATUS)) {
+        if (!ret) {
+            return vhost_user_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
+        }
+    }
+
+    return ret;
 }
 
 static int vhost_user_set_protocol_features(struct vhost_dev *dev,
@@ -2607,6 +2657,27 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
+{
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_STATUS)) {
+        return 0;
+    }
+
+    /* Set device status only for last queue pair */
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return 0;
+    }
+
+    if (started) {
+        return vhost_user_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                          VIRTIO_CONFIG_S_DRIVER |
+                                          VIRTIO_CONFIG_S_DRIVER_OK);
+    } else {
+        return vhost_user_set_status(dev, 0);
+    }
+}
+
 const VhostOps user_ops = {
         .backend_type = VHOST_BACKEND_TYPE_USER,
         .vhost_backend_init = vhost_user_backend_init,
@@ -2641,4 +2712,5 @@ const VhostOps user_ops = {
         .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
+        .vhost_dev_start = vhost_user_dev_start,
 };
-- 
2.27.0


