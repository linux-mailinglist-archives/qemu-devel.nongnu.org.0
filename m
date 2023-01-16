Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FE66C1A1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQE0-0002Y9-Ja; Mon, 16 Jan 2023 09:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDq-0002Vh-9x; Mon, 16 Jan 2023 09:12:26 -0500
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com
 ([40.107.237.61] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDn-0002NX-Ms; Mon, 16 Jan 2023 09:12:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqbitFi9nrbPlwck0LMZi4xxMMP4WRWuKUsSgp4TU4ei9ZI6BHBXP/Ki2lzZliMcL1S/68ziVmBQ0hWovP6kYYVzaPUEriMPF/d/DhtGBm2K47sFrjEWQgvOHFNj/a7Y0Stf7zQry+5x1c1mjngos6jCvsFB+tBTGOjzNjUSJs8gtH1l7UqnAmEbUc+eYz3qiInDXe34jLcVKT74HG8ukh0rrzoY52Ke6fqPu72iRAi+OVoZvbqdES4qLc3zt9xQtYmFuZh8bih2xTvQ9p1KXljsFjqcfn8iHiEkhqhL8X0nJfK7FKaieKErsJRKKH0Vif0+fILVaJEK2OJVnx39VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=fZZF3Kw81aM7flnowhrPCX1FTC09q9xFanDPLQooquca/cU7tyhGL4UUSss7eDyVdPNF8wb92d885EtD5yQp8MeiWV7GCRxG/Vw97/E5aIcj2u4Wi7f7NhkRBQ3nfsGEF6ue/TWM4nQix6VYPiJrM7BexqJwL/ZQQonMQDw1fHL6CKhIWSeLlbiSEybbxGf/hrQVKSUXzXRZj1bSN6uV0S4HlcqhpLJxEhRDNsn0lACHBMRcNWmXfLLuhp6KL6yBVz8RdLEgiJBELFmSV/CHO23PIX6nG8hB6ybpJD/90l2b/nJ7tc7T0T1pz1MQaPQrkD0ijUNaEZa6zkU/nWVjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=q34UuqT7NyR7AZ8yYuYGen/Y+PSZYtvH6WzQurXEG8Lvi3lDR9r28wZnmGLmQGVpiwkNOcaUP222eCKfmvLDEO/jpJ7/I1NvknRZK3fLzF+ZFjHvzpGqyya9jzWwiTdFl0Fn0zGXaCgCUbDXpLVgvaIXGeurQjIc9TF+l4YIeKHyPjNBrTau6/ytDrEZ1j23l+8Zj/WRY8/mQIP4sz1QDjr085pragaukUScTt5oPx3/HESkk9G24UDEBFo2bGh5WCbZI+HYjh2x3QEAb69NsATB7M1QW8YU3ZDHatYgHOjtBhF19hE4sx0mtXZXQ4ckbXViM5LD2jFiOxoOFhpDvA==
Received: from DM5PR07CA0071.namprd07.prod.outlook.com (2603:10b6:4:ad::36) by
 MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Mon, 16 Jan 2023 14:12:17 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::a4) by DM5PR07CA0071.outlook.office365.com
 (2603:10b6:4:ad::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:12:16 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:05 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 16 Jan
 2023 06:11:58 -0800
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
Subject: [PATCH v8 03/13] vfio/migration: Fix NULL pointer dereference bug
Date: Mon, 16 Jan 2023 16:11:25 +0200
Message-ID: <20230116141135.12021-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230116141135.12021-1-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT080:EE_|MW3PR12MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bd9db9-2863-4059-c8d4-08daf7cbac75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Mjg2aeb6j1KYLH2mXQtGslLRH0mfU1azlyRveGT5szXRJ4HnVtTJCLvmyrq4lEMM3LOpiVGPxXCz18aBfOcNMx+cTheNXGYHZZUa9jSmLlvLzW9DwxxvGIvfebX+hLfV31KcVQ6MgxTwTFaSFA3ZxB8eCjYv1tQc0/Une05uBFyUOxNo+UG+l98xdGJOEX6eI4K8MkrXHl57eHXhtDJwlwDKp+Lo6OjkEMDCNXIKoBhJfak3TIdW3e15Yr4ttjn6+U0Vg3rOzJyszFevvysxN+Bc1udtHnjbgYmqJZtD5ex8bVrJyQozqLokt/Ub56RaKC4xfM8Z9Ri2VEv+ugHYIgUvQ9MGxHT8PW4oT/DKdiXCLhugFnb0iH6a0PIZFyLNYbsadOLkMTvUdpiC2AnQq9E3qM0CXdQFM1LRDqFerkTvUyTPJvOkTIIIYneeRBVILS+Xthw8/MGFymNILwnBhNWtZUNZ4JvXHMpa6w7c/Z8PoV0j3fI+56vJv0BwnqPQum8n7Y2MUivmKvGPwUY5mnpXmYGpokTlsiaED/i+M1WzeAsCr66BhBwpa3tZLdWQrM4tjplPuemUSmcabkpKdG/KFy0RNsrJhTStfCorhi8StiUy5GXxEBKNzDXvX9XNga7qvbugY1SEmzAXj3nboIY99fwf1ccR29+01XOukq3QhENKmjMQD7b8bAfjJCE4ms9I1q/MkGq3U/eA0pU6A==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(356005)(86362001)(8676002)(4326008)(6916009)(8936002)(70586007)(70206006)(5660300002)(2906002)(7416002)(36860700001)(7636003)(83380400001)(82740400003)(478600001)(7696005)(54906003)(40460700003)(426003)(6666004)(316002)(40480700001)(82310400005)(41300700001)(1076003)(2616005)(336012)(47076005)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:12:16.8762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bd9db9-2863-4059-c8d4-08daf7cbac75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
Received-SPF: softfail client-ip=40.107.237.61;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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


