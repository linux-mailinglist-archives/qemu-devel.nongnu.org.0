Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FD474FBF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:16 +0100 (CET)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIfT-00060D-CH
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 20:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI1S-0001F8-Br; Tue, 14 Dec 2021 19:19:55 -0500
Received: from mail-dm6nam11on2082.outbound.protection.outlook.com
 ([40.107.223.82]:34403 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI1Q-0006fM-0r; Tue, 14 Dec 2021 19:19:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOmqGE97bvHMW6ZdI8LXb6CfEFP0ucXquJL8Wpo9GzkZHHHY4H3rYJwbmQEfwcsriHH2tchbx+sUctRzhQICMrXA2MoDNzzkJ7vx2vX6+ruSEweLbQDG6BswtMahQTct6wAmnksT7ZQKeBp6Uz6oNUizbDg0+Ro16UYD3J/8E2h+jCqViy8mPi/2HPsg602W8Z/SOxqUJg5Wkags1+cnIkWTATFiNUVq1RWtLFbEcJ2YSVquJclYslRdRI9jhTM5Mal6fr0o3SHUhIfiXF9bRsq4cj4nI6i8lleaxZHNcKqgJ7x7UmB+V7hYMTgWVCAOUezH4v3cuv73nRbX2GlX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5EzCM586ZQLU/n0UcWd51cBqe6iimLomh/LhdViAuE=;
 b=J2s/rENrgQqE49V72UsC9L6mB6ISMk06IDxaUp4PFrhqTRy3QV2CVT+jgzAF7omHn6v/DHfITf0ThDJN+9664aX9kzFu2FIR0H/j3Y3t8N3naKsDSw3UCPWG4PGy3WLaJ+iBF2iR3v1K/c378Nu9RWwbFgku8RSdSdVeERgfMDeMTzkJp59msfSMFoCN08p9aGV1WNiUy7FPsPYPCPDra1bAIchOs/Td12At5TjxRaI1EbP1kRkZ7VYCUktMAn0TK5qd3+9R2CYZA5f9vGHaMvLVFonTTLI+W+ArHSYF7/ZedbOPFFn7YS4yx8ephGhmlCCfvry3rnL4bW7w462WWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5EzCM586ZQLU/n0UcWd51cBqe6iimLomh/LhdViAuE=;
 b=gjcUBGTjOM2yAUNGdjpKKJpzxBfMvEwbprXlhicDfHpoUJi2pg30bL8jaq2/70nnRefilVgTjerXOn2AZMwouHGmrVzrj7JYdRQJHL5k6xlVP+BPRO20A+W/E0EcgTqctaWb9IqIMxsz/tInrmZkG2tXxUmCCGM1cbXs7l6+atE=
Received: from BN9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::35)
 by BN7PR12MB2833.namprd12.prod.outlook.com (2603:10b6:408:27::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:19:47 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::d0) by BN9P223CA0030.outlook.office365.com
 (2603:10b6:408:10b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.16 via Frontend Transport; Wed, 15 Dec 2021 00:19:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:19:45 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Xueming Li <xuemingl@nvidia.com>,
 <tiwei.bie@intel.com>, Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael
 S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 08/47] vhost-user: fix duplicated notifier MR init
Date: Tue, 14 Dec 2021 18:00:46 -0600
Message-ID: <20211215000125.378126-9-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21a86786-5865-4a8c-eafe-08d9bf609a37
X-MS-TrafficTypeDiagnostic: BN7PR12MB2833:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2833FF44AE362B2D993940EA95769@BN7PR12MB2833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Fq+RZlNvsiUvh9Iy4YVwMsmT23vQ8NEpyXqCK94d8RhyHswraq254qKt9wMXWFrF23vaAjs57UKgF6fX8F+A58eC60+MnhcuBMbMD8x8UkwupaW62w6/f8arqlqmkiIZBFaLW9pvvMz4erXgDnw9S29ykIJEaVEDF8M0cLUZMPMUEaIw+yExwXGPfueQOF8VMAHPqCQA++zSJjB9BIPVBLzfzOpJyUAOMXAV3sqAT7uYR1d0qvs7sew7O/gwUFPRMtwJisBl/NCHSkYruUyE1aGYN5qIXtLjDj95oySBkPjP0UnEv+1ApbKihC5SzPNbu74wEQs8fDjwv5ppStnbkz03HCzTPkVwDjCLTQqCEjuEcp48QdfqSa4AlIg4BsPYfCI3NKd1KNbQ7t2IgsR2dsnXJVpNfJD4MotRufZHtEZXF2HCGwesZJhj40TBPY+uEt9WZsBtm4DJgsYk3UBJgPoJSh+hYtdtqOrmaaorflvpC5FWjvmUl8wVb3Jamuv5U6op1V2hH2UFIngPKRk0iiMnVauGN4Xe18IF/XvtfbMTJHF3S7G0IChoJWO3YtOVNVgKW6Cz6BiORpnQeJca6q6nXY1C4e4wfYvX04pcmfWeiL3WCHv8igu+2Dm95tafHvMCVT1Rg2gQzDkaHdvHTRAC3AsNHvlM2kZabpTgIUQ2MO1SlS3zE9wQIMU6h1TeIRlYLlhVVyKEWSLQhPHhkdUmUfLQ5sMWkNuvj3LY4/8La1Ujby++hsGykJR0jWeARYWYyE6Nkin0oP464JCclA/H0TFInI6k9O8Z50Lw4Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(508600001)(83380400001)(1076003)(356005)(81166007)(2616005)(44832011)(4326008)(426003)(336012)(5660300002)(40460700001)(8936002)(6916009)(2906002)(47076005)(70206006)(316002)(36860700001)(26005)(70586007)(186003)(54906003)(8676002)(36756003)(16526019)(86362001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:19:47.4313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a86786-5865-4a8c-eafe-08d9bf609a37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2833
Received-SPF: softfail client-ip=40.107.223.82;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

From: Xueming Li <xuemingl@nvidia.com>

In case of device resume after suspend, VQ notifier MR still valid.
Duplicated registrations explode memory block list and slow down device
resume.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>

Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20211008080215.590292-1-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit a1ed9ef1de87c3e86ff68589604298ec90875a14)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/vhost-user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index aec6cc1990..7b35c5d71d 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1469,8 +1469,9 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
-                                      page_size, addr);
+    if (!n->mr.ram) /* Don't init again after suspend. */
+        memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
+                                          page_size, addr);
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
-- 
2.25.1


