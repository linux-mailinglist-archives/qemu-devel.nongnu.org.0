Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434C67D4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:54:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LL-0005vZ-LE; Thu, 26 Jan 2023 13:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LI-0005nP-LF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:24 -0500
Received: from mail-mw2nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::62c]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LG-0002wy-WF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIK31kDQG3XC0+bqJsut7IcijgjVjoIRazCPfuSw410H7GrBqngn58kG63+wAcbVTmCV7Jp8F6hgyzBKd9H6Wxf3/Z60iIck1CIHHJAuExhOK5cgEn1g5GHI5mHBSJEo5tyxemldCinD/+fbBH4t0QCD9byL7dDbqJJ48OApVQbfUSJvEOfyPOC3nBvYbvxcPyaDCKYLSLTw3bfK8cjj3CK6yntbSXP4Qq0ovbFbWJc3UEZrsAXKKrOczYHL1YpItsXydJl5Ueu7MZ5BEs45N0co6Utg6xqBb05YSkwVVQjuBRIKiQ6iNYsmFwz8gkkENqlhF52JnjWZf/zx3CFG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPPDKm8V3Lo9Aeu+bYelnDegV5GuooD1YAYk2pR/vow=;
 b=FC99RKJIeyPdL6kNg66r01kUtK37xU842+36oKluFUf/8+LGekZ+wx8AIh6XJphtaJhRbRknjI7fCFg/IwLqNoeolYAS1WSW3aYJcPjGWF5lGnDQBRsQNxQ8b6e2Rx2sbnkUrVJ4F/HW21J+Z13s++5MmUCtC3xOi4xGiKgF+ZbwiVVLk44gd9bjo5ZAHGypJZ/7Jvl0wkZUJwXSBoBlpuD2BSG2as6shtujD+MoqIL0SGNid/tu7xdPuJQrHc2jjH2vluR5+I+IeqoYwLzzEF7emzlboFynfxNEW8osD3S2wZlRqdAJfMxYoDuVyE5Zcf+b36BOpLCxzPtXfU7/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPPDKm8V3Lo9Aeu+bYelnDegV5GuooD1YAYk2pR/vow=;
 b=uttY4B1igTZLsOdKh/R7KdwR+uWa+jknRrnotz5aQD66TKvDpX7p8A6Qh+XFRkvuE2aQK16Sihany/54AgF1uWs10vI0l1fbogPG/zWPJ4h3bxl1S8PNROa3/uAf9TXCPMooywTsGBpPveVv2BcojRTxM1fTvsrqhjGym9gA4iNYGn1MYYen/TGCBJcYxNxyW42LtMx5hAbB7TaBV3pqvh5wYWt3D03z7Lg13awqHuLmf1fXiEkeycWR1PYwYTneaoaq2SH2+Fy4nkC+L9e8yjU/oXTD+tgPWUTuQEPeP+nLlp+DudCPKwBzYbtDK6ORf28EAYfn9Lpheo4vVMZhog==
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:51:19 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::28) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:51:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:51:10 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:51:10 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:51:06 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 17/18] vfio/migration: Query device dirty page tracking support
Date: Thu, 26 Jan 2023 20:49:47 +0200
Message-ID: <20230126184948.10478-18-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba4003f-40dc-45b8-b406-08daffce5011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6g2VE4qOslm737xGqAVcwumuPYbZQDZT/ynyx5qCZtmfHmNgbjCov2w30o8tNSwDFd6ixIO2siIZkxmSY33Vi1ZGJA7nUDsW7nGtj3M806qVioKCb5IqFqRP6IPNpkSdjlAFYVRmoFDDRxVGLEGA3qN39TSXbxCrhTezuyIMlFGM1SN25RBWgGEpi7Bjr91kKkJJUp3Ewd0jlX58HZU+1St/4YpjqjRiL8or4n1YB9g3/2L61xnhRQ99H35S/4oI2ZuewuSeaWb6UiM90OsaiGuItuXYCg8esLq8/Raaj3V5su/wcDkNNil9C+ZOpreTVBFkw+Eo5kjDFx6aJ9Rhl6QpP50pwAZ7hYr9/7WRMa6DlqylcqfFSpLb4s15W+s5ON0CNCURPbXspXhhAF/NB6uI+osRjn38n2kEpIYjQP5u5auq8hKDYQ7V7WEGZ58ZJKlwTeZtaJS1IcIZ2RNLEbBbaY7cwikVTJELZmISMyUxT1UgH676mdJqueWIU3Ao4nS0AgFvl5kA51gUcRhUCcUXw/C3R2q6yPJ55xmCjRaflqu+2/g4NwbXO4bER1BNLTRL/1YOztWrnzs5Uer1U3rgeVdC+PJFc1eyEM+MkP8lm0scwNgmTzRNmoWXI/VgKm3wSpDichKxLgLD/w7kXr7C5MGJ50DsUfqm30pZRTkiUAztu5REkyiGLggk57mtEEnr7y5N0vxJcHrSdTQ0sL5Qx+vTbTaoMk64wMJYb8=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(40460700003)(7696005)(356005)(54906003)(8676002)(316002)(1076003)(478600001)(6666004)(5660300002)(7416002)(2906002)(4326008)(70206006)(70586007)(41300700001)(82740400003)(6916009)(8936002)(7636003)(36860700001)(86362001)(40480700001)(82310400005)(336012)(26005)(186003)(426003)(2616005)(47076005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:19.6154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba4003f-40dc-45b8-b406-08daffce5011
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
Received-SPF: softfail client-ip=2a01:111:f400:7e89::62c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Joao Martins <joao.m.martins@oracle.com>

Now that everything has been set up for device dirty page tracking,
query the device for device dirty page tracking support.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 2a0a663023..5aeda47345 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -658,6 +658,19 @@ static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
     return 0;
 }
 
+static bool vfio_dma_logging_supported(VFIODevice *vbasedev)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_PROBE | VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+
+    return !ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
@@ -693,6 +706,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->data_fd = -1;
     migration->mig_flags = mig_flags;
 
+    vbasedev->dirty_pages_supported = vfio_dma_logging_supported(vbasedev);
+
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
         path = g_strdup_printf("%s/vfio", oid);
-- 
2.26.3


