Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E023563D266
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JeK-0003Lk-M5; Wed, 30 Nov 2022 04:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeI-0003LH-Gq; Wed, 30 Nov 2022 04:45:02 -0500
Received: from mail-bn7nam10on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::601]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeG-0002pp-MR; Wed, 30 Nov 2022 04:45:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQi2Md+oes7svrqkO3JuoRhaA8fcLUSQpqrjazzveFv2yXzYxVr/jZz6mDIDFU85qJZUs/VVxvGkcqboUaIDLVFkuxuW4c1cjuxlAN7gUb/Re8XpNQpFYqUsraCmt4oDU5FUChAKtOBZf/M96It7DZhndpyMFYF0fPHAHPeAFR5aZUGGOc+q81JNoam8P8oXg723J5tAZm6gVu11GOHbB6YR60/zoP/iF0cHRDEmazvT7CMAHYFvo0LSZ4S5OsMQSjqjb7NYvhN8ofXEnIJQ/bHeeMIiQdDssmunATr1cINwHDHheP25aLUKKpqjHwefRgg2cSWr2jrbAxy4bJa0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=jYUPGJ7jsvzXP5dVdYOjJxl3Z/P6cOsod5oAQMM6qGK0KkPxaKryeJX4W9VuANFLdR7ZV2sHm9eF9MtbFcGKTVcQH6RBlozs5W21S++6lqRXQdmvWINNDUtgVC2NISRBkHHeHGqCEXExxqq9TJc0ENCkRsZTGQLUbAPtzvov0n3HiLtaJrFVMs4V0V6jKlH0bR7LUbrW8OjkeEW/eoNNXFC2jqSHI63WIKnNTXw9zIel4O7zm0IDJX7J4rpOkmabKLvobnVMD5GYIuEzocjlRE0jfAOqhgzFd+aFiplrIMzLGkwBjb6RqKQGzILXMiGqne1JXtSR2lctGGcKKB1xKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=HgATbNsIjBFF7woPqrvwVKKgYTsV30E54v4RLDU3xWBMhzUnhcwstJ7FVWQ/fQxZEOegTDae+/D2v1sXyIdx/UG4+OCROjd4onnbHYpe98Myikfmew8CnkEEGzKeqM52ruiOXWUhAnE515UbOpD2qqu/53Jd7h2zXB8e9AgKu688vDaNkVwdIlM8wM4Hc3VBRLmX2mZN8//wh9YJGLKeXX9eaFvc0mQAAgLtSxITyr8QdwIzJlitQrMxllaLpeEuwApMiqJvzBkWUyw2ZHR/WSJZTe1XrQtBcTp3Q5jQw7z8zCG9MNOu1EcWYUysQDyNxIgWATBNtLlU6UR4K/1VRg==
Received: from MW4PR04CA0357.namprd04.prod.outlook.com (2603:10b6:303:8a::32)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:44:56 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::89) by MW4PR04CA0357.outlook.office365.com
 (2603:10b6:303:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.18 via Frontend Transport; Wed, 30 Nov 2022 09:44:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:44 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:44 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:37 -0800
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 03/14] vfio/migration: Fix NULL pointer dereference bug
Date: Wed, 30 Nov 2022 11:44:03 +0200
Message-ID: <20221130094414.27247-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce05c95-5bc3-4473-045f-08dad2b78a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szVlTNhdYhNRZcPWUPfvF+ixxb7nD+hOmY6q381GWh/DJKWLrow+JTo/b5RYsorB+7Ouwt4J1GgaF9g7gLHdYoP7sST9AxNaSZzQ1mE89iUEGnN2TwKoe4V2V189P7JDSfmcb9/4u1sUVs5/f9H1C86exOwQs6yledQnaNInTR23eXb9bASdSgO1IvMUFAKZtQZkf+KBnNDfVBP8p0phdynyGWf5Q/MhgwZz7k/CAPVt8JU/c6dMua06gr3O3eLBs1FQaHY3q6Fikns/FIC8PZ6it+gks7DPZhdFVeXQOFVIZr7y8seRMYhbl7B8gjP/i+Gk9D9HcrNGI4LP/QFcBHd7Gl7lUP/HYqNLzuZa2SxmDR2MhAKcQKVhzzqazXqrdeUFIDPIbJFl6rZtlm+27BVbdtT9Of4YBTCrDGYn7lbLh7VZCdhIsL3ak37OAlxJIYl6wS6irkrrLdjO3j7u9KTxoz60Jv4vO13vUDwIVjdxERwRx2GABXJzOznugB8r2u9/oMoPpMl1zHnA/GBxfGpb1gwjomYjC21SnjvRQhDDZKADsduAFDEy12Ydj97fcFZ5KWodnJ72oh+pWBfOAlAtXUyKSU2pIU4YmcleK8oX9Nr9qWq3cjt4sclVamxU2Td3UuO0Y4IdazjcWrlGwzeSLU4d0LdLvQ2VQ4GiFBVquFf4v4x1IjaSw6g23msuGsLB0BHelnFS1kfHX7+nvQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(41300700001)(8676002)(7416002)(86362001)(36860700001)(82310400005)(4326008)(70586007)(8936002)(70206006)(36756003)(356005)(7636003)(82740400003)(6916009)(316002)(40460700003)(40480700001)(478600001)(26005)(6666004)(47076005)(7696005)(83380400001)(1076003)(186003)(2616005)(54906003)(336012)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:44:56.4987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce05c95-5bc3-4473-045f-08dad2b78a35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::601;
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


