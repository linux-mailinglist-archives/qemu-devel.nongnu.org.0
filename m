Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821FC66B372
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7s0-0007Iw-4O; Sun, 15 Jan 2023 13:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7ry-0007IN-JH; Sun, 15 Jan 2023 13:36:38 -0500
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com
 ([40.107.243.48] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7rw-0007cm-RD; Sun, 15 Jan 2023 13:36:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnWPXjFAdo7QsvXg8Gf5GRg2PObkMEEkNwjkitWpOEWjliXUbd6OmX65VbDcETSjln9Fvu/cn74OLttwBKTwsabHNbfUaQSV323dbRB1duulQKrHW6+aWf+l7y5dcqEXrnQizCPy8snnFb0IxrQBIDrWl1noIQAbWQWd+DWxRZNshRU6reP7ACS9GM1HqyZtVi5EgoLiEzeHRpKo4/pJ+5buyRx9jtR41OlWVOKldYBFew+usbJXWd+10ZlKNTb6a7qWaq0AxcmG1/1G8Bf66CIwLqvhPf4qmuaoc36BgeitBCdK/Ywmqlm7zxZQTNZ1HnjB+nI76YbfOMMbKt2gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=oN3fvyZs+50KnqLxEWJLOPuaT4FWfdGsXmv8Bsv1BJJwBo2agmIQRbw/tBgFiHuWvzhSSa1Ut7luwXSHkRPp/VBgBh8t6xM+H1hoVwuTiw9ZRkJV1l3BJYmSqKixYhx9kNoKmUTUP3Ha2RZLHhn6k4a5MGHVBOP3tbwU4WLRSBLG+pNMgV2oY27IbjrwCy5aiDh1OWPqvUg1naMAeYzM8TX5NPEulIvYni6v2XgpQsbgjog+2JfmNX7MprHhRGkX4aWrSgZcRSGqRrgn7lUoi4BnEp4BxfUD+DZj1TlNsvwo+169ebYsjovfNjzpynFs9jMptg7AY1QudzZQPFdpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=OBWzDKDpCUgrkcFXuZeHdkees1N7DyChldw+SI1iMahyfebvV+Nkug39zti57JvG4L9HK3cqcuzsnJShW4zHaAW/XUi47qB9wqXGBSewUEYEaQ+TeMEB40Y5KyQoSr6eZeQwAkli/wyfmhruZredbz2bHEvV5ShShyPeAOVrq4fRB4vj0lLcbXt1RavDHz3mg77axLTZ28DyA/w/tNydusdvP/IKrEwijeOAnoeQDwvt83VMSHTrgOGEeNgkUgqpRdMUTlVIOfVRnftI4h/GrFdNajpWVSHG6TBFz5QbPVnGmPCIgD/lP4GUXxrlQ7wty++bP+sx4/QJa1Bc4QSSXA==
Received: from DM6PR07CA0073.namprd07.prod.outlook.com (2603:10b6:5:337::6) by
 DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Sun, 15 Jan 2023 18:36:26 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::55) by DM6PR07CA0073.outlook.office365.com
 (2603:10b6:5:337::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:24 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:24 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:36:17 -0800
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
Subject: [PATCH v7 03/13] vfio/migration: Fix NULL pointer dereference bug
Date: Sun, 15 Jan 2023 20:35:46 +0200
Message-ID: <20230115183556.7691-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230115183556.7691-1-avihaih@nvidia.com>
References: <20230115183556.7691-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT061:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 219900a4-2b09-4f6c-fd11-08daf72768a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQC9bYgAZ4sBpsnT3/qjwtSDOYf2bxJOANi6MYkvR/71vrdM6WymXUCpREGpWi5r5AquVM/sHn8F3vnGNyQFIZeOGQtwSHNVKhRkGBLBh+efKZOGR2OavztG6w7vDmboI8qMB5GiSa2pDxrw2r3dJW2RaH8wIFTp+the/PUaJQimyPH2/7s2iqqUZRtx/E2hE4ZLakOrOx1k6s9ibizOhpsoxF1mP/59UsuGYdOEwKB5G1bv88z0esGT4e7XsOuo3qNp5ryn3isrogCtBlqsIH5vUhnj/Wp42BG4rd1vD1KSdhdPswHHkzpiBT6AvIEoHIKx5Wcf+VBuTeCeggWCvmgdcwcJnQcxww38nbP+5kp3qQ+k9tvUVF8IW2pKccOQpv2/LLbWNtGfavSUrMigyWj/VS5OpyZJMQxbIF8dLY8MyxPrGAHLUBnmc+Ywg/n2L9OIpMmiKjL7sAibXjFDJ5qiZRw5QobuGtZhWEdmtv4KOhE7SomCjPf/ykyAZ1RQ9PWCSeR3ZJ/c+Utw7NR3W/cWEJM1fhotJrPTzdBmRJTSnGanlG/bQF7sKpIAsmpLui0gdJ2TjuwcjxntUFxQFjQHU7KGcn4EBZflstZpLA/FouNGaUilIzItPeHPQpWOxydWGQQU/ALJpM9i5PaUNF/2UPqPUkfYczasxBH03kGuHbFCMRdCyfFiZWe0jCraaJvOVaugiJYKUgIaq5Q7gw==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(26005)(82310400005)(186003)(6666004)(7696005)(82740400003)(356005)(7636003)(478600001)(86362001)(40480700001)(40460700003)(83380400001)(2616005)(336012)(1076003)(36860700001)(47076005)(426003)(7416002)(8936002)(5660300002)(6916009)(70206006)(70586007)(316002)(2906002)(8676002)(4326008)(54906003)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:25.6343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 219900a4-2b09-4f6c-fd11-08daf72768a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988
Received-SPF: softfail client-ip=40.107.243.48;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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


