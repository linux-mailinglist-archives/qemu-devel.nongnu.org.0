Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6AA6D453D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:06:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJsR-0008RQ-RW; Mon, 03 Apr 2023 09:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pjJsH-0008HV-R4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:05:30 -0400
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com
 ([40.107.223.56] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pjJsF-0005z7-L5
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:05:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqVFM4ELeE5puUpAOyBVNaZPQx25AmT9V27Pk2EF6HbuErH+3qaJC2uFDFuXEWFeb/HJVCqHNJC4wNhp7dNIjEuVLm2Yu5xNIMo2WPLLqwe0rkdRFuTPw3ruY5A9rH6IJ1MRzD4lN1ryDczckroDTQiyBLc67Vqf/9VKfyVABQtSCmVXJnuD8FaaJ5VwwtImnDvYQBaEcSON3kU4hZ1Yjfo5JMRtBuom6jw9UuYrN3z3oRjSE92PVLx8DXCamwSjebDY5UW9EpKERN+vLNohJnONtNi6kc+pYWCItRsmb3BC6t0SBYtJqxxGg/OOSocHFA5QEaN6IZZkC6G1AegFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwRCnsZ1faF+rdH7OZWJPNE7o9pd06DUcI1vJxMZqsI=;
 b=FwIxwBDErd1d2AOyVlyI2GX9DnW9uZZ6Ryt2smllK+PWrwT+CTPysJvIcsuUBLFcTF7sn1o3BPjtAvlPHeyswnostoz/bqK1MTEnjpR3tyXzaz9WKPcJMtUNYlvDr0iIzJhZOuWiIZ5/jVm9dkoMDKWlwugAexv2OU4iEAbML1it6W+Ya8cGpzlwNoxyLyjuZi/JZqLiiGS7Cnb5S8nMkCFXnj2t8zwzDBDwktnmnf8QylimJSvtjcDF32/fuar4HKy8bSvIXlxZo/p2Al965cgs5GO/GDaRNSzrtIJyvszbaRr2OIjIlQiP6PMgb1JqR4Zk76gcS54xKHQNO0Q1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwRCnsZ1faF+rdH7OZWJPNE7o9pd06DUcI1vJxMZqsI=;
 b=DUiGlLrxDgSbFS0NPdk+/IMrpMP76nAyI27a34dxbPtH6vrWYPm9cD6PVVMVolvVyW5oq15jP22oQ+2kF3b+LeqmpYRvhEabehUXPfrPY34vhlUgOeaazETk7yhlNJVaeEL9eEZcpHNL+UwsXWbww8hJqUE1b9aubLFZBIy2V3xBR3PigFDxur6uzvSIsBZm0GdgTZ7VLwB7YR/vA3ltOL4WOD5OIRk4GxWkr+ReEF2XwcjlqrkKURW6JTgBl0jbL6zBQAENcjYNLxrEhMPR5rFB9O8vjBn1jLFWmWWqc030QAWYAYTbe5MsOGVzJz2wPHChibx4+2Z0UVyGpdIWCA==
Received: from CY5PR19CA0010.namprd19.prod.outlook.com (2603:10b6:930:15::14)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 13:00:22 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:15:cafe::e6) by CY5PR19CA0010.outlook.office365.com
 (2603:10b6:930:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.44 via Frontend
 Transport; Mon, 3 Apr 2023 13:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 13:00:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 3 Apr 2023
 06:00:03 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 3 Apr 2023 06:00:03 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport;
 Mon, 3 Apr 2023 06:00:01 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Keqian Zhu
 <zhukeqian1@huawei.com>, Joao Martins <joao.m.martins@oracle.com>, "Avihai
 Horon" <avihaih@nvidia.com>
Subject: [PATCH] vfio/migration: Skip log_sync during migration SETUP state
Date: Mon, 3 Apr 2023 16:00:00 +0300
Message-ID: <20230403130000.6422-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: a57cdf08-eb51-4e2d-b82f-08db3443626e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIojIC9ZE3iR9UwnfeUwRebZIVZrlJFAAUO83954gKVZTmgOmHNKK1j5i09U4APxJJkv4dF5pw4KXOvKsjdH9h/WK/N54hvSuwk8Y2KMFV5GoWt/DdLYbhde5XRvqHnQzqV7pVoH3WoLAQpUZ5cNG0e5JNMPwK2f265iO7qGG0qBW821K3KrR4HQ5JLnMDs0JBNTg6Vqwq373AKzpzAJNd3GLxiMrPX+LPUQXjcT1nO5qbn/4f+I37HvU6zF5g8lOEjhilc5R0EJgtsvTeHX7Wll/ZOAXPQscyGqPm2+gt1odZWepZnazXJ0xPccPLCnpsQ5PKdD7EHOvevh4JLI6yLHzUz4Wkv2aC3zFNQpzEJN7osiLyZAnUz8qxm5P4IvITJrvdAQx+ATJ3lJGIs1o85WIOerVeen8wOGD8gi35846WUPWyk2ilvTzO9RGB8oyP9mSc1CyckFd74PBA84q6ChhoK10/g9WzvoDgPykrKpSJsJZF+YsCemIYXHMYqJh09iSWHvsrTPD1dREW7M0QeMtxLp+XxwlrEv1WHNGC5cetBcxn5RC4ylMoUGIy8yEQL7touOsaIXU7W6jQDrFG/HfKEB/DoXbFKhTbUlY8ZhtG2TIFrPwJKWnnEKfDHh/bmRKnHFf1DSIDfkmoN/HVZjJMp5nO2fwxR7zDpt2VBY5N8oRSTqls01fNL/bwZ7LBBTjZkKZYLylz3S69iD+jSnTZo1dsjHmT71gqM3KBCGNbZeOwyTgsjpS1DIOy/P
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(40480700001)(4326008)(6916009)(8676002)(54906003)(70206006)(316002)(70586007)(40460700003)(7696005)(478600001)(8936002)(82310400005)(41300700001)(5660300002)(82740400003)(2906002)(356005)(36860700001)(7636003)(86362001)(336012)(2616005)(426003)(1076003)(107886003)(186003)(83380400001)(47076005)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:00:22.0839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a57cdf08-eb51-4e2d-b82f-08db3443626e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982
Received-SPF: softfail client-ip=40.107.223.56;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

Currently, VFIO log_sync can be issued while migration is in SETUP
state. However, doing this log_sync is at best redundant and at worst
can fail.

Redundant -- all RAM is marked dirty in migration SETUP state and is
transferred only after migration is set to ACTIVE state, so doing
log_sync during migration SETUP is pointless.

Can fail -- there is a time window, between setting migration state to
SETUP and starting dirty tracking by RAM save_live_setup handler, during
which dirty tracking is still not started. Any VFIO log_sync call that
is issued during this time window will fail. For example, this error can
be triggered by migrating a VM when a GUI is active, which constantly
calls log_sync.

Fix it by skipping VFIO log_sync while migration is in SETUP state.

Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4d01ea3515..78358ede27 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -478,7 +478,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     VFIODevice *vbasedev;
     MigrationState *ms = migrate_get_current();
 
-    if (!migration_is_setup_or_active(ms->state)) {
+    if (ms->state != MIGRATION_STATUS_ACTIVE &&
+        ms->state != MIGRATION_STATUS_DEVICE) {
         return false;
     }
 
-- 
2.21.3


