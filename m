Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC1433ADD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:40:40 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrEF-000361-GS
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqCB-00034J-OZ; Tue, 19 Oct 2021 10:34:30 -0400
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com
 ([40.107.93.80]:3442 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqC9-000647-U3; Tue, 19 Oct 2021 10:34:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3QLtGRO0/rlXJS2Mpi+RegXNsPXoPlmWdTogLm8O0NqgpyBqGY9o8zYk3RVYU1giJPaPOYjubzSfjg2QcO9JKxu7ie1udijNdG0TPIWsyQErFvIeG+uSHW5ecv8AQ+5+6HGG6kF2SsbzZe3d4rLjPN9xYNFq51S/VutqMkltrIKD49qTthc3iPhJKf1av2wzmm89475okBrBTaC3mXkUfnCTdX3e9YOOU0UsE3hPXIU7sivhA7pT+g85rUi8rpxJW2RzJwyCTDZaushoe/Yt9vsjvhPkoHf2C1sq9pHKsP4OAi36YulNnXkeo8vIl2O2qhhIzdvtAkMRND0q5L6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0mH+OapYLLdxX+HZ+WI1GXOAGUzs7tLQ2xTReN3zDM=;
 b=ha0FmcjPOH3h/O7Sce7ZdNqfGm0g1W3+mJHLULQmhFrMAkWq/mAkz8DBfX9SDmyUl0zxqo9LnbXC95Aq01Bkf4dagI5mUIDgbwsteXkuccOXqC/Ei6YwQTFEJxmCS0rGdGDWF+Nic38cSJGFZ7wM99e5imsd/xJGqoYWawzDQVwj87mXKK3xTuEaz7hlSTgIciul48S9ol70Jcev5MlPoTY3LuhnSdsL9tU9ZQlkchpQN+HenAoWF017lDJi6mksnc5vjJXCDgzzVTlEi5Vu4K5/9/P1d+HlAIFfA3vmznQ3VRLUK/+i4iNJXEw94FGLW0aedWSUnICZGTjKchgtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0mH+OapYLLdxX+HZ+WI1GXOAGUzs7tLQ2xTReN3zDM=;
 b=izyljVYmKfIPntrKcHAdiDt3kUTJfvYhqEPTBurCp1hDS8A3pmKePdYRXYgiFuCPInaLoGq548jn6Z5LFBDG2TWNWVy+9m1x7i2fDFRK5CfqW3iCITao1ToYPoQCWDgxvSRNhLpNwmLexKKXC+olrWLVnxOQ9LTia4keSWn+PvY=
Received: from DS7PR03CA0234.namprd03.prod.outlook.com (2603:10b6:5:3ba::29)
 by BN8PR12MB2865.namprd12.prod.outlook.com (2603:10b6:408:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:34:22 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::a2) by DS7PR03CA0234.outlook.office365.com
 (2603:10b6:5:3ba::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:34:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:34:21 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: [PATCH 59/64] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref' (CVE-2021-3544)
Date: Tue, 19 Oct 2021 09:09:39 -0500
Message-ID: <20211019140944.152419-60-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea92a977-1203-4a8b-d9b8-08d9930d8add
X-MS-TrafficTypeDiagnostic: BN8PR12MB2865:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2865D88140BB524436C6368095BD9@BN8PR12MB2865.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zWTlbJvNMYk0Nit7nOY5ybRPuDBOS+1jSo2lVUuJvWAWzUhcoxk8WB4l4PshQPUMua4CZfnGVp7SNqUZoUrRSgW/BeG/Zcnyy3N4oiMdRoCO4ZCVC933NNuyh/LBI2lT5sZsNqiJOjDwVAY4G7LOK1fecxMEWMHACYHEE+76vAETVRi+QJ0scDqpazLcoTybvFBUHusYg3bCnG53O15wKLcZAySe1MVOy6PSXaMukcYH0wrVgKcrxwWnBUU26qVpd8fD+GUwJaQ39peCeATAZ6ZbXhPOFuwNEPRGoZm2MpADdlL6VPDLtZfsz96D2KmvpXJTr1VnYO+UJChAgQY4gaIj008TBNPqdWVgTyfLmLv3YqvJyOnnsv5mwHewn9hcQVefja35K8PGRoVdvJVT9DK5XKfhLX6p090vGLajJd081HDs0o+/GMQjVMneQaUlGAW2lrVujiP1v5mv/hJ5VHXgYl7wUJbhC3oTTQ24ZAOMM8tP0cTAj/BkinWM6Jeufl32LT5RN/8MZ0GWobUpfUmA3ZyW6w1Yxl5HHhgySlF04kIEu+KrRi8VGvLlRXIV3/P8D2G7WPT7u6Yimrl3Dt1Nj9gcrZLhXrfl8lOFwlHJGXYDR26+HzX7q6kgspmHugDf9jJ4I5gmaw4qcwsR8TGHAtSrYjnJp28P0mw1bAwYoisvugyIMw1yJ8Uq4YY5fSP34kosCFiHIIrNbOgJs9V8+GUJTHs/K5Cq+Q+NF0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(44832011)(36756003)(36860700001)(6916009)(508600001)(8676002)(2906002)(5660300002)(356005)(2616005)(81166007)(426003)(47076005)(4326008)(316002)(186003)(54906003)(86362001)(26005)(1076003)(82310400003)(70206006)(16526019)(70586007)(6666004)(83380400001)(8936002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:34:22.2549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea92a977-1203-4a8b-d9b8-08d9930d8add
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2865
Received-SPF: softfail client-ip=40.107.93.80;
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

From: Li Qiang <liq3ea@163.com>

The 'res->iov' will be leaked if the guest trigger following sequences:

	virgl_cmd_create_resource_2d
	virgl_resource_attach_backing
	virgl_cmd_resource_unref

This patch fixes this.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
in virgl_cmd_resource_unref"

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-6-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit f6091d86ba9ea05f4e111b9b42ee0005c37a6779)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/virgl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 6a332d601f..c669d73a1d 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
                          struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_unref unref;
+    struct iovec *res_iovs = NULL;
+    int num_iovs = 0;
 
     VUGPU_FILL_CMD(unref);
 
+    virgl_renderer_resource_detach_iov(unref.resource_id,
+                                       &res_iovs,
+                                       &num_iovs);
+    g_free(res_iovs);
+
     virgl_renderer_resource_unref(unref.resource_id);
 }
 
-- 
2.25.1


