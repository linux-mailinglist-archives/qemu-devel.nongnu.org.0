Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74629666D56
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtK5-0006LC-Uy; Thu, 12 Jan 2023 03:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIo-0005fo-EQ; Thu, 12 Jan 2023 03:51:18 -0500
Received: from mail-co1nam11on2080.outbound.protection.outlook.com
 ([40.107.220.80] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIh-0007Xq-QY; Thu, 12 Jan 2023 03:51:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKxPd4Rrxal3Ey3QWJs2aFHajEDUC6LCd3u/ebCwdc/MPjvdCgtMaepfvfRsLdzqtwP/YqB3BGTFxZbWAJUXcl6cxg9U+tzxC2u1t4Wzvt9qeFCPoN8hQiIJCa074aCDTkXZIBLfr9lCYmShJIyUZ35na7MzffOxwof5JF46/bESKTnDmo8MGD/61VnV7OZn83MDFEYtZhStE1PIHKHNCX8eiiOLZ4tT5CkwjN7qpFDDB/yuOrKQEbTIITcJ+saU6XC4cyCflESiwoeqSBy7v+NeQSseUg1iqTKDL+Cb3tSM4WBy7mXMk2XqOfl7Cn2wuuNDaIEwGBdyaJW5r8Xp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=fIN5Pom13HRx9d9ByAY7iXMsSW2GNMLhy0lhnEKri0rbsijIRF0oFf/+0fo26EWtVLBCGfTchLzLwjNRBwktIBKxc8TxKBA2FuENZAi/Cpjo1P8ePxrPdXpXymgQ3rwXg0xcIrBn/IUeCdokZgVU8Kxma/WKl+0Bq1tQAUCCHRl+hcU1PAuHeRqY8olGgDHftVKVA+HKzK+29CSp1bbIOKwes5fY1/xKVpvQlI10AFG4uJV98NAnSxT7JzPbAv0FkNCi3LrX11y+AoqwZCX7VeC6HhIRCN84+ZypCfpP0i+PTvZXXnbmDRjC4tdFbQJEk5lvos3t76betReDVrKbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=LQxZxwCAxqcKfJtK3UdSMxQQMPtS23c46+9MczhHn/4E6811MGnBMdizr+9l8AS7bnh5ZEw86IAZQxUoPHUDEsTMcVhsUuCRxS9aHvLUnQt1AKIV5/2NKIcHrXEd5UocHKd9/UWTfwEoUbhWZItIukwUs6xWrZ08IDmRmTeU6pkDXUoZ0l501naorsmkpT9RSm971lJBxuHNnzctvgNeJAM4IKFbERfMPYw2FeKk7Xupvyv/1rRh1Q5LVV1H36vFt3ZgiWbgnDclhSx+clJXDfbAHM1TGnJyqJ8ElVcKUVeBpUU5e5g4wNjQMKil1lDCsQRSUBcz6JmLw4kRlOupag==
Received: from DM6PR14CA0043.namprd14.prod.outlook.com (2603:10b6:5:18f::20)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:51:00 +0000
Received: from DS1PEPF0000E632.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::bd) by DM6PR14CA0043.outlook.office365.com
 (2603:10b6:5:18f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:50:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E632.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:50:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:50:48 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:50:47 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:50:41 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v6 03/13] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 12 Jan 2023 10:50:10 +0200
Message-ID: <20230112085020.15866-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E632:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d2a6d9-7302-4202-3fb4-08daf47a20a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TB4nhpOVNp9rxc7B6O+Qlcf0Z5k94aq65MhHuZaCBta+mTmRna3C3nuFda1i9fvQPS33ExixlyOFltJOW/I1CAsg1gMiFyGLR8EkM2kXzMxCmdPvINLnH+jse3SixIiwq6bIapf4C2Lb6J9obIwqcXYB9vcFEbjdgdvpX/tjqpCbpXq4Px+ctjgkuQZWF9lG7sViSITynTWJfcp9Ni4swv1aYVhKC7ZfXPS8tN0KodHsGfStQq1gQCVS9qEf4uIzIQYfvN0QWvqco+bPf+gmfcTTkx4udut4OM4YkfJVRBff6GkkwqfN097ig8FYi1NQ80mjaeJD9iA0g6KMIHK/HH/yO4n4yIpctck0jz/eCzOvrhCtIoVHxyfdULCJHlc9DI0BdX8Ty4e11Z3Z4A6rCbDZ73MvN4gbX81puwezPku4+z5X9OcyWkj2d00SD/zumLCv3bRdzIned1ZMp3g9dEfx3byj5/jBsNlYv1gV6HexuvjNuUZr1m4I+0kiaQe+A4UQpt7hR8rJbPUZwtPuG9MqzB0SeXUM//EV6rtcNXtS4L5NIM/lWdBWha1HSXU3lT0cUwSXNXGe2A6lEB+TIObXfxvU/5PAlXuEdNEpm/1isXCwBdZEc2GasIkbOcSfI1cXgMDgk1unsvRV4D5QCgZA5FKXjVF6TFOqvLaEZdus6WptkVdn975AR2dquNYgUMaY+IS2MD0LbfAU9VuNBQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(54906003)(186003)(2616005)(82310400005)(1076003)(6666004)(336012)(40460700003)(47076005)(4326008)(86362001)(70586007)(70206006)(7416002)(5660300002)(426003)(478600001)(36756003)(8676002)(6916009)(2906002)(26005)(82740400003)(316002)(8936002)(36860700001)(7636003)(356005)(41300700001)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:50:59.5959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d2a6d9-7302-4202-3fb4-08daf47a20a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E632.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
Received-SPF: softfail client-ip=40.107.220.80;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
index e1413ac90c..09fe7c1de2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -743,7 +743,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
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


