Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDF61841D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:20:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcw3-0002f4-VH; Thu, 03 Nov 2022 12:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuQ-0000mA-Lh; Thu, 03 Nov 2022 12:17:38 -0400
Received: from mail-bn7nam10on2058.outbound.protection.outlook.com
 ([40.107.92.58] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuO-000857-O1; Thu, 03 Nov 2022 12:17:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfqabK+HqaNEcXdYdWLyUhpd2Pb3KVATtJ+fcr+qXXrHT44M01Navl6FRE3TNIWlc5w9WlbyJ/rlhr/OEshyc7zglebZOj+bd36HuKeaq8f/2UQsdFs21xjdhfeIOoCd96INBRPwdjuFZNWVChw76JIiZPkOjt1oWMC3xBjsHHm7Hgl7ijrPjWsYVS4jh4xXO0CGkmwXs4o69Ri9KzHmQ+xy7rIJIvafW3CByCLwFse2u7BxMdRAmVFTjlApB1gg2gS+rPmEw6UYXXIQCJUIqnbZys3bq5tIBIw51mFcs3uK7jtsk/DOz1OflbbVZ6g//gL1Y/XnTf9VNdK2xgxbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bjl1yHZbLc360zWMZVbBMvvvLaKTuzDAeCCfcJLGn8=;
 b=TGHhG3mTXIE+TN6eLpfo9JLYG5mK865ra/sga164vIhu1Mv6gmMXCeLxrZtC8T4xJfY5rXHEj42WwMjy2Gf0zmT03MYraYIb4PfWy2XKE0mw83vNmFkFj91BkUTYsLUtHnGLFj00eI0szkZYF0vVHWJjbzUNjl/+Jxkkfagn/pKEC2SnJttAGYVN19HXVSToYXo/ofEwaKvtU+JGql3BKiG2hsflij80gQihlptznFgOMFyhee6fVVwLROf2dewdTz03QYXG9VnwOk3MxoK95yx0Xt6h+9Yqdk/1wsX91XBlNocbjeqU4PhZ49I2hqopQanZ/aTTbF8KlDK7nYYoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bjl1yHZbLc360zWMZVbBMvvvLaKTuzDAeCCfcJLGn8=;
 b=T/xd+r1bNeCNo9iUVaV2d/UCqYOTfIocYjSbX6QrbVLB3/AILwYwUUBH2JTsW0oLf4oYQnS3OrHCmcZCNDlr35c+F273rKOAyVzAFiDJxdK93oYUzW33CQ6T5xNnfl65B2deO0zE0DAx4YNiJm3iyioTdgqCQnSdopdXhNUqibN8YcCgWZDL7N8c2vXft0rl0pbuPupnqIdyzCJFScmcdGgrayxTqknKe87wRGjWM71KX2Mygpem1QI9DL8ldUF2ciWkTNIjmj0ynp194LXDv/uSRXrEfP1gHyv43IARF6/OCPbnSX1rnJXcng75sJZNGljsupjJlHGXdG6o/BYDTw==
Received: from BN9PR03CA0990.namprd03.prod.outlook.com (2603:10b6:408:109::35)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:17:30 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::11) by BN9PR03CA0990.outlook.office365.com
 (2603:10b6:408:109::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:15 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:14 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:07 -0700
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
Subject: [PATCH v3 06/17] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 3 Nov 2022 18:16:09 +0200
Message-ID: <20221103161620.13120-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d020bef-70f6-4d5f-1d0c-08dabdb6e81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDetaVDLnCvsPUQSVeJi9E/7RbK4CPWBL5g+s/xJHNNU5DkKXX0o71mkNVPlIcLlSd6GsLSMzfZRaqc2EcVqfB47vMpB0vfRnI7R98mc8J2m32Sev1APLJAWF80AhwC6pWHNp9NOQjfvJ5wO7QsKfoQQyvOlPhX24NXdi8q26ZBuIfQD2YFc+bw3X+GfRDG4N2fpIH+oESQThfYdw6O78l/vVEAjaWhVzkHUO52zcER2kfbP9Yj322/13bpNoLkv3ZtHx53pO+1MtN1omzeY2Z7J4Y+VHeNKgxWdd8gzNFYmsq6Wm1uFwlYOVwCaGvux4rJHF60DzYIqlle8vc7hjtoexhvRGoKzq1JiLwSEP6juOVSq26CPju/sW22dhF/6R/M43s0Q/lJ1mqWhlj4tgODfpyfmDj9VJByFp7mCvmwIsahrUDp6gVjHyJKCQaYtRs/6a46sXzVzA2FBvdgz5T8jTbmcSxZxhCzuNWi32u4RSDWX4uVLRvg31ReJBgZTiH0Pj3YSG6K50g87oPSXUvHV7lO2/vsBPI3vcacinSVdtXHMOg5OG5J/EvAqVUTroVOfgzRNEF7TvVvGx2e9Xu1Ocx6MHQ7SutePav/ip0Y35JZCJ5EfQTq6ifue0pPDN/mP5lxcxDe6teEVRVLpHjiZaPkoSY10uC2xGodMUyy8VyntUlHh64AQEPVNAffmNVI80N0SQuZL3c3mNQiliR6FFI4F16EpE69uDTMjmpfKg7PQwRQ1agQpVPjktgdnFSV3aL83tgTSdbVLpESgLA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(336012)(8676002)(4326008)(47076005)(70586007)(70206006)(478600001)(186003)(2616005)(40460700003)(7416002)(1076003)(5660300002)(426003)(316002)(41300700001)(36860700001)(82310400005)(2906002)(6916009)(83380400001)(356005)(54906003)(82740400003)(36756003)(7636003)(8936002)(7696005)(86362001)(26005)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:30.0456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d020bef-70f6-4d5f-1d0c-08dabdb6e81e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
Received-SPF: softfail client-ip=40.107.92.58; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
---
 hw/vfio/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 8ae1bd31a8..f5e72c7ac1 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -740,7 +740,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
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
2.21.3


