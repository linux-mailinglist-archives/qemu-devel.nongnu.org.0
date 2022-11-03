Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B461840D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcuQ-0000l5-FS; Thu, 03 Nov 2022 12:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuD-0000aI-40; Thu, 03 Nov 2022 12:17:27 -0400
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com
 ([40.107.93.40] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuA-00083l-GT; Thu, 03 Nov 2022 12:17:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQGMOL4iIBlUYM0u8h/arCY6bQOlzaZsjS6qoa//Xj86zlIrOUJ+kvZaRuepvVcygyOOrqKAGqNAY0AaeciWYs1A6VuX4NO8uLKzDrWUtOsmlThHVCs8ZqLK4jcwwVd4rUVwxwJoPk5I+8oeNfmDb9O0UPfh2giIGYflMdCHyT/NhCe60wHdcwhPi/USAGi9bf9ondifxZQpVfOW0/1pkvLu8cyouzq3VbSD4ryz0lELPMcU/SxbUdcup8XS3UKoGBfjUkSWyJ+0A+lIdW/DnMgBSafm5zzAKk/PW0upvboqxWxJ6M0K66kWZGPtoWXwiv1kBK+U/LXf/7tEVK0HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpUyHKAieomgHAQsQGREWdJpGdjrz4gLNv1Kubsbstk=;
 b=ZK0KY0/+m7eC6w5/MXG3nA2KVfeyaav7FlAMr/oWvdeckXjP9RQfdw/n6OM0zxssS/QPMwnfLPFK15fAmuPO19NDwv/9X2ZhnlvDau/Ijgpq8JoLErOpIEf2dMOVVJhvYxoOHbXBphsEsgKigpIG5j7y1JkMKpWXPH7/MHpoialfOTWlml5tPHVfZwsGCYEJFoJL3y93+TERoBwyJRw8GYKK9CNmXdXaPSGoTpe9C0Px9e9HYqImcz+S0bgj2GbrOj631lURFdsJmURUnYPFiXJwYey3Prfp7FAk9USmFjLM0M5Aq0EpEAPo6S01BTuIzeZm2PLXghCfWl5syODsqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpUyHKAieomgHAQsQGREWdJpGdjrz4gLNv1Kubsbstk=;
 b=U8iB6tV5e8x9LffQ9U/BggPNNDQbzcLBQsPwAWzcAPCjejBb4HkD5PomPey3t3IEyiCgSCepmAbq1DINcsSLV0JfYRB2iDiEDe8k+bllTEOZpg6PsUEIA5mxXN2fxfKKSFT5Q0bytu2u7ANMVEyq8PElDG3Rsi18yJpBtJ36Cl6HFyhYuPq/inb+vZ1B14Vam8DHbzTKUT1sz0EsJZAadJojVXqFLFV43+AIpEAV/JXVTnZyl4gR7hC855sGYVPMxCTJCkcrpWdzdiuH0kuPPYU3m98zU374nQq44qHTZj2WDc+h4OkOr6CdA3Gm4tyE9R7HhvygL0B3bPgCQT1rpA==
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Thu, 3 Nov 2022 16:17:17 +0000
Received: from CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::f6) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT084.mail.protection.outlook.com (10.13.174.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:07 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:07 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:00 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 05/17] vfio/migration: Fix wrong enum usage
Date: Thu, 3 Nov 2022 18:16:08 +0200
Message-ID: <20221103161620.13120-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT084:EE_|DM8PR12MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cbd5d3-728d-41d2-0864-08dabdb6e079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxwGJskxGWhC0gLTssfLZrV3nSAOY3um4VNxUxVbxDOpuQVAVN2h0TLZU2/zSGMXD1rU1Gzfl/C1sd57lctlcBAVx/o40FsZYvwlvnqUPrHBLY8PzZ9UMNJN0Xvpp5mEuECKdi1ingOEP2/4ahXSVn2DI3cJrCDQpkxwSpdDbNdpDDQfAMgCpcpwzV7/6LcC4f3py9e/CxgoP4qFxAk0+668URSaxQOASWzk2YLH1VhLKhA4IFf1caQIXWttRnndKlH2h7pTk5B5RZE8bvnNzwjPQvlbtkjiyUynbc70tcCjI+8Lz4U3BEiHLFOoG6eGIRPBT29Ot+/2dHjcseUfN9XVj6wqStGOnkoVdvr1xMMWPUZq2f0JgCntG9DDkEqui9AZFD8EGkljYuaCfJgT1C8jm/KqEEoAhg6ZbEfGYHIYKuaoSQ+jngfrFgCO+S4VxCRd/0BE/zKA7UvRNl6EnyqJB4Pi6EKVS7a69+NYsYrJ8eMHIgcugBSrzdRuAr2N7VXx/82JD9xEitPBEfGOD9v1a+sS7tJKj5gcamldbWvGWXNTsBHSd7JiTLmNS9fSrC+ktiJazXNi1teDZnIS4RvvoPrsbeRdMwPLIEyQgQxuVM7aVlLXiZ29jJYhflJaRkVmRf94MxXNTvQo9dOfBxzxy5ba14wIUzW8xXVBZue0+WmuOseOgmfEVYtGpA6TGu8BFFqEgRYcQ5OPS4RiW/1oZSWM3zMx1icOkTMZuuL8NWkTbjWOQViqGO9rHdjs/JKCOmKUgCpCdXgjISynWA==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(7636003)(356005)(82310400005)(40480700001)(36756003)(86362001)(40460700003)(82740400003)(7696005)(316002)(70586007)(4326008)(8676002)(54906003)(478600001)(6916009)(1076003)(336012)(186003)(2906002)(5660300002)(2616005)(8936002)(7416002)(47076005)(4744005)(83380400001)(70206006)(426003)(41300700001)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:17.3134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cbd5d3-728d-41d2-0864-08dabdb6e079
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5399
Received-SPF: softfail client-ip=40.107.93.40; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

vfio_migration_init() initializes VFIOMigration->device_state using enum
of VFIO migration protocol v2. Current implemented protocol is v1 so v1
enum should be used. Fix it.

Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization value for parameters in VFIOMigration")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 hw/vfio/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 760d5f3c5c..8ae1bd31a8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -802,7 +802,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-- 
2.21.3


