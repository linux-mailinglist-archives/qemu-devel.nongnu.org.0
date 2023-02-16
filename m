Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C0699792
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNn-0003Hj-Lt; Thu, 16 Feb 2023 09:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNg-0003BY-Pi
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:04 -0500
Received: from mail-bn8nam12on2060c.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::60c]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNd-0004lF-Kf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6n1163D3J9ndCGaCs/McPLWD06L/Ih4+4Nuzsq1vZGNaTHZ8JKTMfcqkehehHIhhCxOwBBo0mnezcAIBs4GeeHIWA6f/B5InbO/OQF5eBIISCO+iCLjDjB5c7uLDthfwJ5lZqmldxHIvOQ42aoiHvlSNtegg1fT2zCaI318/mLG2YwSIqDhTKE39hz5PfViAr5WEsqZGvLwV4lQaQeX9rrv6RS4RO0wnboESWyvdjZvKfDWZc4jX21aJhXl/lU+bdRJ3KtJOkPU5TwgsWmbkfhMQ1X2iYBt7eWs3i1uE7RCHxB4PkfbsKS69DjFmitvjHQKNmbLSujlf+i8gUHn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef/EVfUhjnvIZeSN5VuMQ0un1uW6tSHHdNZn0OW+wVo=;
 b=AR80Ak3yJExHkV3UekI3zX6xk492MYFHKkup6FHm1vqDaAf8IB3gkbQ3CkZCrfj4o07kFwEsGdg8MYYn2SmBuK7xmgSH/edqgpwsBRZDRn/KRJqa9o6lQMRmYABsiG5NM5PCgGVhNBFY+zLLQR2NvkM6IAF0rbvdJZ6TzqXLakXQXqGa8dZSAbLkqbY/av3Y8nFO07liF4MjpDvNJk4X/R43nrueSydWdpsXAbNOj156r8ekOxyZwSn6Fj6lpNBYwhIzRuigYFtBLrFchEPR2cITaxbt4Qbhqx+0tDP8pRXaNL6fcAJo0dzl0mnlwPZFZfdX3zLqq4uj6jYHbbgKDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef/EVfUhjnvIZeSN5VuMQ0un1uW6tSHHdNZn0OW+wVo=;
 b=c5XbnHsz83Lj5Nnf4SCc03T01DQiX5E/xfHoAWO1tmew2Ff7tvMWHCjV3u/uOAEyTEbTk8+am0rh6lqlBW/3DLPaIUCjpcJA7dvExy4kFhMuzXcOh+Xqjgl/1U3Uh3ucJD9jbN3FH8egE8CER9DN9suKvo6nQNhe8RKC6fAqbAaSbYd/UU+oaK+OIJbJPqBA/hc2sQAPqjlw+7+3OCTmwyjo2kKfwY8Md16cv3CAUxc7WyfrsiOSiJrPG/B5SyCYJ8rclI/JK/s69+X5XjH5StvCXJZQxADjmGxS3Mq5RDRoP5HgWULNPztAeL1gMJva/iTry/1W0ij17D6dJWDJrQ==
Received: from DM6PR10CA0019.namprd10.prod.outlook.com (2603:10b6:5:60::32) by
 PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 14:36:55 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::35) by DM6PR10CA0019.outlook.office365.com
 (2603:10b6:5:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:36:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:38 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:36:45 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:36:40 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v11 02/11] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 16 Feb 2023 16:36:21 +0200
Message-ID: <20230216143630.25610-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|PH8PR12MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0022a0-87db-42ab-a479-08db102b4074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFh8QsUz/06098rtoQxARIZim7N48vMlvGYvTaevUMurRFlj0LuAbxWUyEX8WpwPa2g7RoE2ibb3QaKNBiLKRmjl1Ap8gpoGxu88QK1qVyNif1wXtnqBpQPe/0moaQJDXRwfBbMwmlJPdbdWHUe/2QTYFAwFMNNsGUvsp9vawRvP94trvIuGx+YFh2SFEbRyRm4hnq4XRs62qeuMaol0iPnNPnENy7OOnUuDIoix61r9g2GXO9+DYIOYC4uywR+BYIecBZ3vMS+8guPQ4pFYFvfyBtMu/e3VAwPIjuJKtWsZc+Bxm9J6kvgAA/Wg50jnAfxPwLlJL8iJNoK68rTo9NdD/6eVApwWujcGI3UVwxmH4HHm/318cjawCVis6nSnpwCYgOHrXUsIc02rPLQG8KDpVc9eOKrG/NhzaFV/QxpRml1RzH6L0z/TCwv7nzgtbpWSOe3sySfmvVNQpXVupYzRtzSxlEfEreisKupxFHth28rhgOLg1Yk9GImOnzq2OPP+Ubmc2fKAtsxPLS17zotdwahdX+QjG+mNme3PeTS67Qsok5vS0+UfmcuPdLElRpL6ogOxb740+jFEhqCrWnoaDo7quqlj86oiuzZPlHx8PDe41g9UHPaibeNPukdQJZKqKrEc0rEeOeZeGRW2O0cwYZLuW6FagZIN82qodOxmGp8CtG0T9fsNO4Nf/4ADXoIuNNMwL8tSIcv9We6SQg==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(41300700001)(4326008)(70206006)(70586007)(8676002)(36756003)(6916009)(478600001)(316002)(86362001)(54906003)(40480700001)(356005)(7416002)(82310400005)(8936002)(5660300002)(7636003)(82740400003)(36860700001)(40460700003)(7696005)(47076005)(83380400001)(426003)(2616005)(186003)(26005)(1076003)(336012)(2906002)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:36:55.2519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0022a0-87db-42ab-a479-08db102b4074
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::60c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

As part of its error flow, vfio_vmstate_change() accesses
MigrationState->to_dst_file without any checks. This can cause a NULL
pointer dereference if the error flow is taken and
MigrationState->to_dst_file is not set.

For example, this can happen if VM is started or stopped not during
migration and vfio_vmstate_change() error flow is taken, as
MigrationState->to_dst_file is not set at that time.

Fix it by checking that MigrationState->to_dst_file is set before using
it.

Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/vfio/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 83d2d44080..65f3f3bef7 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -741,7 +741,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
                      (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        if (migrate_get_current()->to_dst_file) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-- 
2.26.3


