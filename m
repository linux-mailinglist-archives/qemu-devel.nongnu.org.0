Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133A538705
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:05:37 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjlo-0003b8-1q
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nviwl-0005NG-Ox
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:12:52 -0400
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com
 ([40.107.244.84]:56801 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nviwj-0000jU-NF
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:12:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvVcXw5fwVUfrInU/lLdCAzoraRphs/1E9qmZOxbKaMyv5u2D/0Fy1KVjmmwjo5ieo2/MEzlY1HSTfSShKv+0nKY1niC2C5X9Z6KvG0XD1MyTseKde/92A8rN5ybDXZ5OYWVs+rSibyQ1HZCSPObE3oQFNsQ8h0ON6REHsVTOjI1ylDEWjbMaiCXnDEMDmFslXKg7mjFjq7dkQilw5qchi6lReNEy7dZZfg/ArhQJv2R6kzG9QBZWKT2ccrehJBH5BsDvDyd4LUQ9XmDv7ZmAPk49N24Qs+g2R80+8O5thSIN0QN26g8HG5k0EHcCpVMgCfFFngmyGhGnsK52VsUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w87s7jP6ut2zJ6I/FVy9IqlyOXK1wpw82VRmMgmiahg=;
 b=nv1Jze1JaNBxDVa2CWAsto8dmqG5kMZU+5ErWZOFvkY7OCAXfQ3HN7/hIfvY6mkRYR5jO2D1Q3NXxnPeUhigQEBiHIX9ZMouNF/H9PQvOA2vs2ODbG1VmX/x5FqDL2RmnXj95nBzZ8+03Z2gLIX0C5SXQtHTtEpqad/AaAgELTik5cW8dAQqx57VZ2xZwC0WYd4GrG5yW5aBfbfdB+ccK2EEJuAUpVgg/temEBaFCDvY6Qx4MXMPyXsdzfyZfkn4jnB8tFC3bPq1raPPGVsttFJm+xYAkPp23giejRLdqtR0atzbk6fVrcyiS1MaTnnbjpQac9dh4VwLLCVpLFbmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w87s7jP6ut2zJ6I/FVy9IqlyOXK1wpw82VRmMgmiahg=;
 b=k0JO3SaTPJ8VSne4T7hE2o/uhprIiz1lNysh/6Md7n09VtAxAMordUGFqa8/42joSTN69tfI8LxI2gdud3eHjpX46Q0kvHN7BdblFDYlB8zBAlbFvi8NEx3NIvHI3Ca3Zr4FMwVNy78XQJPky+FcBzjTZW/fYpsuku119gOmLbfQs3Se7rVOZE7Rf2u/g4GDgCiur/T2tuBg9WCguf6BQwNi6TPOHJcBA9fzWnzI90d0Cp2dW8apjeskDoNkGpnv7eYnelBWVqZFPJGTs0g8lQjoK0f4a0me2Cr+Q6L3uDK5rlAjv9vLzprGtIFn3muwQBe6OLAPHlNTORXnFnoRxw==
Received: from MWHPR10CA0054.namprd10.prod.outlook.com (2603:10b6:300:2c::16)
 by BN6PR1201MB2546.namprd12.prod.outlook.com (2603:10b6:404:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:07:45 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::4d) by MWHPR10CA0054.outlook.office365.com
 (2603:10b6:300:2c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:07:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:07:43 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:07:43 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:40 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 00/11] vfio/migration: Implement VFIO migration protocol v2
Date: Mon, 30 May 2022 20:07:28 +0300
Message-ID: <20220530170739.19072-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e31b337-668f-4bd6-a418-08da425ee9c5
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2546:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2546DD8A9D3F720C8EBD71E8DEDD9@BN6PR1201MB2546.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTCD3jvKdxOyOrwmBRM+4lR9CGo2lghMXN+59gb/q5AjOw70regw0io5h9HRvKndjHaeVGpts9gYHUVzD+Ac3oWQpa9tLoumKteGROP2gLB5ppYTPbFBHwbQxLjGef1PULrPaGAwNn++nfjbg9SX740+0AqT63zsmYMdYGSVNbNavDe0iW+P/upNk5uzbxwQZCRLhDUDw1Dx9G6Cpes0TSo/crw2o7JgthjStYy6pyggIyQ8Af3XMNjXyJ71S+lUI9q4UbNsJr1H2GmWFXTAVynvQ7zjCLzVLFZaTrzpQ3rFfZaUDXxTXzZzbEhRVCZWXKtpLG0vrbRsRFAQsFBLJ7hxkOhIzHdlAS2cnFQvf3Xh02dcWeOkh+YqE+PgQzmb58/9+eQ8WgbQPhShOmlCnxYpN3vtR9mOWK22hJqsRVzv1yTtBGE3iYpLQrshqmhCeR+3G+/oMfH57LpCvj3Y9/GItXopCSryWHlO0K3Io4Fj+PXUdXigrZvO/HVJAjaWJBwG+wdTXoqRX80s8VCqKhdlvYuvCTmiK3CUvhKMc1nZ0F4t3oZdUs1dA2v0ZxV1o4OapGyK31O0vcunmqUtgR6KuPPQPJLDn7E8gEE9dmJsWFGXviuwsvxg17q8w5LUM+aZ3/ZDo6vCjqq0VWqi7EX5YOFsnOc36nw6zUnk5YqeNyraomeAWtO5qGs4iZkdWPRiOcqoFaSSy/wYn3jBD+M1nwK88t+w+HzWxIBXaQBIyIUN7MLz4DsTdxngh9Hxc+yi6b2J/8UQ9SjuLlEa8QJN6m8bm/hPlCN6dZg/bJhYnjW2OTaQbBEK2rvV9oBxYnclY7PUgpGncD5Tz8oaQQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(26005)(2906002)(110136005)(54906003)(356005)(8676002)(316002)(36860700001)(7696005)(966005)(508600001)(47076005)(86362001)(6666004)(81166007)(336012)(186003)(40460700003)(82310400005)(8936002)(36756003)(426003)(83380400001)(107886003)(70206006)(70586007)(4326008)(1076003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:07:44.1499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e31b337-668f-4bd6-a418-08da425ee9c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2546
Received-SPF: softfail client-ip=40.107.244.84;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Following VFIO migration protocol v2 acceptance in kernel, this series
implements VFIO migration according to the new v2 protocol and replaces
the now deprecated v1 implementation.

The main differences between v1 and v2 migration protocols are:
1. VFIO device state is represented as a finite state machine instead of
   a bitmap.

2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
   ioctl and normal read() and write() instead of the migration region
   used in v1.

3. Migration protocol v2 currently doesn't support the pre-copy phase of
   migration.

Full description of the v2 protocol and the differences from v1 can be
found here [1].

Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
that will be used later.

Patches 4-6 refactor v1 protocol code to make it easier to add v2
protocol.

Patches 7-11 implement v2 protocol and remove v1 protocol.

Thanks.

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

Avihai Horon (11):
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Skip pre-copy if dirty page tracking is not supported
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/common: Change vfio_devices_all_running_and_saving() logic to
    equivalent one
  vfio/migration: Move migration v1 logic to vfio_migration_init()
  vfio/migration: Rename functions/structs related to v1 protocol
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Remove VFIO migration protocol v1
  vfio/migration: Reset device if setting recover state fails
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align vfio-migration docs to VFIO migration v2

 docs/devel/vfio-migration.rst |  77 ++--
 hw/vfio/common.c              |  21 +-
 hw/vfio/migration.c           | 640 ++++++++--------------------------
 hw/vfio/trace-events          |  25 +-
 include/hw/vfio/vfio-common.h |   8 +-
 migration/migration.c         |   5 +
 migration/migration.h         |   3 +
 migration/qemu-file.c         |  34 ++
 migration/qemu-file.h         |   1 +
 9 files changed, 252 insertions(+), 562 deletions(-)

-- 
2.21.3


