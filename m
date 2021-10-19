Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5916433931
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:49:50 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqR3-00087Q-Cf
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpw9-0003ZY-9M; Tue, 19 Oct 2021 10:17:53 -0400
Received: from mail-bn8nam11on2076.outbound.protection.outlook.com
 ([40.107.236.76]:56417 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpw7-0003BA-9e; Tue, 19 Oct 2021 10:17:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaPg4+VW6zGj4aNLeYxQ6XBdA73f/Onf3++gyDNxCpE04wtw/j9rJ4r4g7uITzGRbgFMQysQORouenehOE2LmwhUjLpFy3hobz1AAaaYlzWulnr4ilVEPnn3M2zXHOd9EfJblP7ZvzQsvcRQqs2lzkfOqfL63DMu3cOHlQxXS+9VQl8v4aeKxeLg5BM15SYjPSZewC1CcVOQSN3UlUgkzdyKfblJZDLWm2t+2It+NZbDB2999pAYevIVKcu53cjy3BDs0pu2qFWeEV6w2lNAFfvffv91+D6WOUFMZcZjYiWHGYdf22eohkUj2A8Oh+VcFSaOFNT3AuyhFwkJbt5cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htGEvWbasilvoRt12RFxDzOrXFyN+aQLftzYMOsAAEU=;
 b=dqwc//whsurQ3B1AZHzIs+07YM7P35zoCPQblheheBwZcAR0veIBob4tCioBoP8HMwuazucyb+QcpdHwP0l01LCL+plP0BIXf5hn229J2DdtOP6s96+0vBmsuo1IXvhITpC/2yzVILiABfDpeg034Yu0coBTx/jUM4m5cCDzzwqZd9RnRZQRWQ5WrF6Ow+JF4IrTZR6CTZXun7TSvnd0tC27VWZboFhDWPIYUhFmv25+4JCQ1l/cMHr2B6tq4knBikXiI8/41ASj5xs7jaPf+4KIgyHiv+qk8HPQtNDv6FyKfeeWl8qG7XqRoBRTxLr6G55Uf+JbMaExuGK7o1ehkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htGEvWbasilvoRt12RFxDzOrXFyN+aQLftzYMOsAAEU=;
 b=k8miiqExVG/D5c73B3VmdS/+hqxkmGRjwxop1lL+NUHDOXbK6alor0F77eSDEA1YrydvZMey9h6lYtyCM/+F7hXGsp66kx+R2AnYKoJvKC1d30C1REBj7wVt2smZ+Ahym0yOTeutpkcKU9rSOrA7KXsfHPuziZwHb6ZvrnjbPu0=
Received: from BN0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:e8::31)
 by DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:17:48 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9d) by BN0PR04CA0056.outlook.office365.com
 (2603:10b6:408:e8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:17:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:17:46 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jason Wang <jasowang@redhat.com>, Gautam Dawar
 <gdawar@xilinx.com>
Subject: [PATCH 18/64] vhost-vdpa: don't initialize backend_features
Date: Tue, 19 Oct 2021 09:08:58 -0500
Message-ID: <20211019140944.152419-19-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f489061-edce-4d74-38ba-08d9930b3a02
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:
X-Microsoft-Antispam-PRVS: <DM5PR12MB46786175B0D1BFDFEB0DBC5795BD9@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yC/q4Y1pKgeAGAvneS9fTcV+ja14vs1Jk9+k4PfVCxsHdfhC5BZ35C59GQ0Y3LyleWxAPU7pt0+giyq1mjNaNLZnasnSgY7CB6R87ZE0b7cIabIkwdEhUC5D3UkPDhgujumtDoqx8YP0PmNV/dLJZNhChp1IgAofMzsJaQsDfWJCie3pRm1WZT62zkrjheLSRQ4rUvk3SAM2owNWC7PH3I/Kn013MXNLmR/1vwKLsm604niYgNm2Ghz6TR5/Xyi40DGGUh+StQWTShFkMX2i3x5VQHof5nSY+80+JV0/lD4EH7lTALaVMo0x85GWF8jAeaQ6GuySnjNsNXrKwxrxZrjzAaBrLowVUGxBGhPSQKGno4KqDp6FDBPaEaSAd1OCA0d7RIGPP/QDYavMDP/R3XbCga/w/U6y8ZP6iy/n7s/j9Q3GDlSnYwfND9R9IzyPkx54pv8Q1M2OGFYXDwbGmZD9CMXCx34ZOkAZwC4HO+QBfSgXUr4mbaWIS233Ft8oDFEweM0ZVb9fjFp1ninlnLHMOarFgTvX+eoOxV8gEl03OUlm59CEo3auN+cXNdhISU4oT5GGDKCpyfNWyuwSlYv1Rve+0rFl2Cfclc0A/kyd+25h6UsCv0LQOCM1nGjT2usRgZQCvBR/L1HD2QoKFKUzRbITa4dBqitDsQcLouvxeIksCxPSs/bhsWoUE1HMTeTXyGucxq9FwslsyCpWTL/U9ynE9B9nuNVcxpslH2c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(16526019)(82310400003)(1076003)(336012)(186003)(44832011)(47076005)(6666004)(86362001)(316002)(508600001)(426003)(70586007)(356005)(2616005)(36860700001)(83380400001)(54906003)(2906002)(36756003)(8936002)(81166007)(4326008)(5660300002)(70206006)(6916009)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:17:47.6343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f489061-edce-4d74-38ba-08d9930b3a02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4678
Received-SPF: softfail client-ip=40.107.236.76;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

We used to initialize backend_features during vhost_vdpa_init()
regardless whether or not it was supported by vhost. This will lead
the unsupported features like VIRTIO_F_IN_ORDER to be included and set
to the vhost-vdpa during vhost_dev_start. Because the
VIRTIO_F_IN_ORDER is not supported by vhost-vdpa so it won't be
advertised to guest which will break the datapath.

Fix this by not initializing the backend_features, so the
acked_features could be built only from guest features via
vhost_net_ack_features().

Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
Cc: qemu-stable@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit c33f23a419f95da16ab4faaf08be635c89b96ff0)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/vhost-vdpa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..5fe43a4eb5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -275,15 +275,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
 {
     struct vhost_vdpa *v;
-    uint64_t features;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
 
     v = opaque;
     v->dev = dev;
     dev->opaque =  opaque ;
-    vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
-    dev->backend_features = features;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
-- 
2.25.1


