Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF168BCE8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0ft-0002hx-6s; Mon, 06 Feb 2023 07:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fn-0002dU-3d; Mon, 06 Feb 2023 07:32:39 -0500
Received: from mail-bn7nam10on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::615]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fi-0000Uc-5w; Mon, 06 Feb 2023 07:32:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1rDEcFb2vMnM/LEDL3NDzFf/MEatA3/6HPhs47CWojL+mGedWcZByJeXb6fM5xMdyPgOaSgvF8CUit/Ezkc7qvQKi5YVi8tcxoAMj0rpC7QOWE/u/WuPOyC3/CtUGcMCNog7nb9Xb5UNUhIhjrYI2Dg0scswTVKPcsm1KGdPh1CqFuMOMRAnsjeYNebHoS94+2Qp9Zh80fEOmTOrZzWkFvRzdVCBZe4lo82C031sLc0ZKyvOOcvofcgo+LFoyLBTmdEJOI1dC3IV5voN4vgXpQWFi/FgmZyOFnXeyABR3X5KqJ2hJclT5/ZZpgwG6v6Kvp8VyLD80my3IRvaOT5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=OAmoRMWE/y2pmz49+CMvKdZzBx4Lh8Pm4m+Fsx/wUbp6oK4AEuhQkafQZnHGhuJUcVaWMLbC1FO/OLv4LhftvqJ+ROOX9pXL4gNl7/F4gBFFxzxDQOOxKTL5ihXCF2pfKF5A9WS155W4r2r2qrDcPumyLnBN4T2NpbtDcQYa8NrnWiL0ZD5PlnvTHVygNnIeiNb26M+/3tHD5IOPMU1Je2fB4OwhuK73C9CmlM0em+56XivDBI0IkDr4E19Jc8CGrzxpFEUm0sH63PtWbPsEAL5Jxr5RtzD172SKjqzf/uFHaBOsYlz+Xo+NJltoJzfQjsPWOFzus77uoNbV0t2s1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=fI17PwhK98lNB5gjCL/Z0pVeAWiKi9li0pXFqOYKx8p+TFLW+91vuO60/XUh/nh3XzITOS63H9u2+Nt8d7IqAHfiIt/CYHVH27YfNgSsQUSlGgRDQdrm9C/hMm7nWORvgRUHmWOKYxiCjfcmqfhn3sIVmvlc8HFeDt2bQpgHfTVTisrUgIYXLC2bBvSxxVhjBx928tRm/Mu5EM4HKgcIhT+d4mE5sLvFmombFHXtPcIb3p4JV0iWcJTQUh93VfDjfFAYqT2Ueh8wJtb70qsSeNtS7cGFUtwnnUcjRb6+uaomB6xYezJgwvQSpAcIdLGfwUxulx5VOUTT4ABkjRrC7A==
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 12:32:27 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::bc) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.14 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.17 via Frontend Transport; Mon, 6 Feb 2023 12:32:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:09 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:08 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:32:01 -0800
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
Subject: [PATCH v9 03/14] vfio/migration: Fix NULL pointer dereference bug
Date: Mon, 6 Feb 2023 14:31:26 +0200
Message-ID: <20230206123137.31149-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 98dd84b6-ec99-40d7-102c-08db083e3535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WGyqUVEVH+UJW1csSy/agTOy92Um35pQgACJbkgx5ce0Ui/47/RNhaHS/+lEhJJDRAstXJUUaH/9AmSRXT6z5F/qXxjh/rEOLZPbiNEituOkBkoN0RV+1LeE2ZoRzJv3hAW+Qoz2fzf6/5LRp4mGQIYSmI+H1sfBzwJW7xrbEPXNsnpz4F26msDHRdWuttiMr0VSc5FV+DsQtiqwgse56HDQ6JqOyGD88gjndJKGlXUrfGn2jUf+fuY+V3xsfsiLoExf+e7W921P3gNoSVxfSq7jv7cgYBNBMEnAWbmwFDbKzWyFgAZIGsFqYV4kSpMI4KXnaKNVkhtu07bp+E3cPc48P1nvduRIhkCUiQ16VGAUQVKBQFzOCgvKzudAbMQxR1lJjt33+gjbEuAaImMMYuMj9of2yHby7MQqUWgRHp87PFFzdn6ENu/WSO0B2OcHJXlVw5+WSquoIY2zy8ZgLUQs2RhHiZVLEc/p/NGfVXZWslLoIaRDW7x/4bP/OSxsxKBBa6mxH8VVMIGjfs5DvB+G+wzd7gC9xbkliO+4U3KCI846wC2QhPlrqeI+Jt2/9BA2y4DQAfUjPVSdUwmwuIcRaen/Dy91tla+PxzQGIDVglJuYiZKBSUqPcexlZrAsFUSl5/h1ZSm993a58WErfc3T4i0yO76y7cMMatJ7pMSDxZxI0rPXdC/SHt86XvDgsYRvHs4hzVJUvC6GKdaqw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(2906002)(41300700001)(7416002)(40460700003)(5660300002)(36756003)(8676002)(4326008)(6916009)(40480700001)(86362001)(356005)(54906003)(316002)(8936002)(7696005)(478600001)(82740400003)(186003)(426003)(47076005)(6666004)(1076003)(26005)(70586007)(2616005)(336012)(70206006)(36860700001)(82310400005)(83380400001)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:27.4534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98dd84b6-ec99-40d7-102c-08db083e3535
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::615;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


