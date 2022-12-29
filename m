Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F136658C08
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:05:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqiJ-00070v-MR; Thu, 29 Dec 2022 06:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiG-00070X-OM; Thu, 29 Dec 2022 06:04:40 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiF-0006St-1C; Thu, 29 Dec 2022 06:04:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBcCFFJScmeZG0gpwEscDrDXvgcoCPKwYflYfusbcP9FRKeXt3GiU8V2r1QSuZ/iQ2rKI5I/NRUK7qIPN7hdcm132wALMxxcE7DxVGm1T1sXIpPFriDkLys5ZCe9OxQgS6SQ1MPlyOyWur+4p4dSn75ogQhJSd9WvN/+4kGMBgmZohzPlOEXnRt8xZGzd1AdH4X0/seNS0B/ZA6Q9CdxgF8N5UnhM0qQZCeQv4x1EuJASWZ2Kc7e74TZ/miaBpE3ZNxQ99SiDpK57KXb6gwzqwK8qoGCp/jgrP4+3U6U7aPvobJeTxWm1YX1dR3/U2Uh+BR9ZZ3eqanjm7lHZeBdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=Ps+EkCmSqkjj6q6ncTtvcTzbireYNoCite5MKU9CrQTtfc5lVymv1zJp4Zf/u9cDBdwEYcHCreJde+BFH+SBxnb5Y5Gub7k1tku6FzK6zbGFZ+LQlJEBaZFK0RRlKPgVyeIwS9djrsz8JFJAsn7NJ18eWiv2w/GDxBa5086pCQQQjF3Qp3bTlOslDcQlSR34EpTIM17KkdQtHG/jgHV6Oikt250XXmUF8C3zKeO4UefgQGnaVfHjdJM7b1XHi1d/LiSuMWUFkH4tu44pbxtG+XKSt/M9HQ6r49sHSgfVnlk5hfxpdpt3F6z00MJuPqzW+Cu5SB+IJ3GAs9YISQLH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJkOFNmqZNgWafMrpbwZLIyQY9fQkQPMJwKlAZkkfgk=;
 b=JKLMTz0miiDdHXW7bqfEnfMWrKkoXboPhoZNWMQ5PCD5xMDcM47r4OTNSVPbrJb28gYbBY8H3t7tiHxJ2Be7gqpwVfoMyMKB0Wri/kpWbRyT+4tQ53Ls+T8BDGnijiDbSQJfZKVTt4PpMLfTK/HptcH8FyQgOdOBpRTNJlBEtl3wN/lUZ77haYTmrVI3rQFgtYkkzwm5yX0TPcULEk3bvmc9D7nfHegqnT3mggPZsEcvWSeran+cIP9LsumFXb3eyLSNW81SaaqoosLnVvj4P6Xh1Ij0YyJz3pX+XoxwprrGs2B41nd8VzBE3bdI5CVHazGn/jzieo3+VujQrZPVAw==
Received: from DS7PR06CA0039.namprd06.prod.outlook.com (2603:10b6:8:54::7) by
 SJ0PR12MB6759.namprd12.prod.outlook.com (2603:10b6:a03:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:33 +0000
Received: from DS1PEPF0000E63E.namprd02.prod.outlook.com
 (2603:10b6:8:54:cafe::47) by DS7PR06CA0039.outlook.office365.com
 (2603:10b6:8:54::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E63E.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:24 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:23 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:17 -0800
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
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v5 04/14] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 29 Dec 2022 13:03:35 +0200
Message-ID: <20221229110345.12480-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63E:EE_|SJ0PR12MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1f3fa8-fb9a-4b58-e706-08dae98c775b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVLeXd7w3vHFM5Lk/uBYlVWC18+lWchuJ1aougO6w9S65A7UJp8ZiTfbT0+32A/7kPkv1X9mAE3hIUQ0bmBc8Ry+A0iXFpJZNG5kHmYSHP3+zjK4rqeHQC7muK6Ul6IitOYSI/iEmUGlABu9AsbHm5p8TuwmPqe6XA4bhrd2tM3sksopyuzFNa3bCvnXtmSGUr+6leOlQ64cl+NeBiQB34zSnb5TokkKFX9eDPOe451oK8Dv1COo3qJV8EOeqMG3a3C4YsHVfUcAJNx73o8lRClOUzgJv4a9N9+YXaTDzIq64+4CK04xuu38/WJklRKHrbu1zYk4EYU2z3uFwxT8dKhAZS5vr3eWoVe6Kh+m6VYzDaPzfiv3nowBd8eJaT7Vb6e3VfapXn58652cGsLZcjp4Qw1OMp9LFW3Bk4CRqYeJKWYS+538muX+JC/jfq23PpDZbHhZ7ZVeMqjRuQBC/mYqxlNFySKXqBkNec/K9lmmSXnXtJwcyHZcyTnx+4kISEtgx4RGIaAWJP3iGOL2qdXH4NWTi4xzcn6yQhJ3nVoh2IOMOg46JbVe2Ea72ffegXeCspdfZyNTXmCrnMfxDNzNlRZ06ZRm4Pa20OJOpI5U562oswG8yYbnbn8RSGzxH2JEP0cCKAC+AZqrqJe8ODmF/N32Yw/O0m4jpZnBzKtngvy5mPiZIYt0uqCkE36hspLpxT2+ixX53rl3EqBkNw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(70586007)(5660300002)(70206006)(4326008)(8676002)(41300700001)(8936002)(26005)(7416002)(426003)(186003)(2616005)(36756003)(6916009)(2906002)(54906003)(356005)(40460700003)(478600001)(316002)(86362001)(6666004)(40480700001)(336012)(7696005)(1076003)(47076005)(82740400003)(7636003)(82310400005)(36860700001)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:33.1832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1f3fa8-fb9a-4b58-e706-08dae98c775b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6759
Received-SPF: permerror client-ip=40.107.236.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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


