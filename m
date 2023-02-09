Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F5691131
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:22:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCTy-0004F5-84; Thu, 09 Feb 2023 14:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCTu-0004EV-J6
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:19 -0500
Received: from mail-sn1nam02on20617.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::617]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCTq-0005QW-NT
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayPMsG3t88+X7ucR/fSJJveu/JHAqo9Vwdw21jYjNo5TP+Bb07AVX2Nrs3lmg+DR6H97U+NRfx92FfDqXUADLjFN5L5aGSJiDaJ2Ui77o6tOFasnixO/6hDDHrskXw8nWRQsHvexrf3SCjcivGhP6GlYgZpJYOhR6yMi1ZOpQhBUQX9zRFe6HRIAK4dqL0R8Il+g2lbwLUsFhU+UVHcnwXZ5aEaq4TjQb9wXz38os6/fbEQkC/5n1PnPNRyAB1XV3QBKeRPg2zSV+fmwlzi65Rc+1j2AXNVANsWk2+dUsIsJ6NNo8BeqXN0wfHmX0wv7kBVeHsndDX9YmPA2wUYBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2oDHQg+H2VbFmK12qk5oTz+xQ98qhCYOKA/5NOJKI4=;
 b=XIVshsPKJK5wmRsi1NBC8A1dvK5jxg31pIbuDxiHdOmRFMBz/nGQfdxgMXdy6fIFDGp4grxw7mWyxkMV+oNTur5W2pdGP+2ZKtJzC0CztiYOx4l/lVTg84383fcVGC6mxfk7q9iceJiTj+KRf9WQyZBxPW3B3qMQAfkL7xePzIypY9hqN6+9f2QUwnU3wBXa3GD+9D4iOxHyJ7RWgcRHpx4LgURixIb1V/CdcH/vUfw6ZDK/zCNgnmK3uhrd4C7qb76FPJWePyQq+sZ22OJk9OV+b6jQsEigbkU2UHbA5Yt3vW5rf5ceOtune7nFNY8WaMSBp6HtS0wze9qO8CPkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2oDHQg+H2VbFmK12qk5oTz+xQ98qhCYOKA/5NOJKI4=;
 b=qFfwCCmJcua2vFLFuIVAhKwPnn3zL+lrqm9fhp28i9N3soWDaNIF8cBoO8lDhvtrEFiVBI4IT0xbQlC/jpy7U/ZBtAqadXjH/wm3ewYIh0UzG2pjxfg9fKQnF6RE+uTvBSrhszuMwpJSd2e7yDK9UbhIfZPF5i7eDc+kiyy4eOFu87DzTh+Szz4uAY7AMEjJRfKZj4WxM+226/VhO0+OWne2InU0mJCrvMuBU0foo9SjxraR3JR375mstYzqh1XGEV4vSiwj/BADYlaDOAfprG7sI2+cEcxVIv/GiG1wRUBgPHQNYg6hpA+p0Zzzl8k+YsyxuQLniq9n/pblOrnCKg==
Received: from BN8PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:60::35)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 19:21:10 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::b9) by BN8PR12CA0022.outlook.office365.com
 (2603:10b6:408:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 19:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 19:21:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:20:57 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:20:56 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:20:53 -0800
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
Subject: [PATCH v10 02/12] vfio/migration: Fix NULL pointer dereference bug
Date: Thu, 9 Feb 2023 21:20:33 +0200
Message-ID: <20230209192043.14885-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230209192043.14885-1-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e367ef9-9d5f-4207-7d96-08db0ad2cd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYuobPY8zP25vWMA/x0HCog9H0WdUzfZN0mcJGq3vjj8Js12NlmdQz+ZbEaPWLpbZd82LH64AS4+bt+JNq1ofUC3B1IlT9WhwwqPmWORrLXW66s8Ws+hWtQSruKZuKUrIEh5EsmvI1h4RlyBcvpd0Wmb8swwdka6g179bIei0uoOMhX+7p8qKu0s62uz/dlZBBmbPBJDQkCKGDYsXPRrv/RKX70jT0akGjuOwoRixyWdEmXeB0OBt27R4KEyWQHVQhhltZyqPHhmjDxXwtHWZWlzzJpRZem8MNsoJWZJaykNxbD2TDn4AvY8rwJIGSoB8PDTYG1G+u16vcLgwpPkTO/9L2N/ZNN773YR5u6Ijq62LVSWpu98I4i1ldWSTCxhbF/efxEbJa9iRcOBsudCigxxfvswaYC7vPmIwRypR3fooa/kVDprm3CGdwnxpLcdZ41xUKoO+TjU/9h92eMMeQk58ct1/QAPNtf58F7q9aI3bx/LED44yT8xZEHC/XrTx/9XYj1EDpSpuOuURGuPOWYHkokKhNhASnBo9jKU4ls1ZKEGDTUOcRtTWVZbk/ucoG200hr7Tpvvhk2oj5bCKHbcVFCy+qtQ9r24uJyrWGX8YQqEWU3fR/zmm4G5BUlqy+OOkWrHpsW0fSh8heR6oeaC80hpcqndqckFybwRGXQoLHvlo4t66BySXZHiEBFnPpbO/witzp5+12U+aCg/3g==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(86362001)(7416002)(5660300002)(41300700001)(8936002)(70206006)(70586007)(4326008)(6916009)(8676002)(2906002)(40460700003)(83380400001)(356005)(7636003)(40480700001)(82740400003)(36756003)(82310400005)(26005)(47076005)(2616005)(336012)(426003)(6666004)(1076003)(7696005)(186003)(36860700001)(478600001)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:21:10.3336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e367ef9-9d5f-4207-7d96-08db0ad2cd36
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::617;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
index b3318f0f20..02db30fe8d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -744,7 +744,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
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


