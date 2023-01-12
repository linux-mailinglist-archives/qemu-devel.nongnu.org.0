Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91353666D5D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:04:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtK5-000697-1q; Thu, 12 Jan 2023 03:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIu-0005jD-PV; Thu, 12 Jan 2023 03:51:29 -0500
Received: from mail-dm3nam02on2069.outbound.protection.outlook.com
 ([40.107.95.69] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIs-0007ZL-GY; Thu, 12 Jan 2023 03:51:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5MgIxRXIwwmS8TsKCo50GckE+QEDLt4UX4HLmoykg9puysEkeaM7lmDopyaRN8Q+amLMnMN2Z2myplNllnOK4YQbDU2V1LN+f4eGM1Ml6MkzfmMgHZhuGbm15rsgLVZYDh9OMq3xfyyPmIrCGzwie1srShjXvFjoUSDsFp58t9wi8CNX67/I670z5NpkeGbascNDn7Pw2yvf+DyT1qtzA1Wwv+uwFo62HLLSCifgt3qlp7YSv6f89nfVrUKnJUwhYmn/JPidNfjJAx/RGYM813FrZ6W+oQReXnJTm6BAZ6tG4Ask05xDN8+o0VjPQ9d4u7/dsMfhBOySZAJk5A5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic5jkH1/JBJkiScEMlaPgRajfRUdf9+VW5vsnnDbELI=;
 b=VP8HlnJv4h2caTteSzWLEXM3uYIamq5raMdc3hj9bJm0LnAAYI/dbLu4IEK2m3ScdPT8HwBCp/mbeeiHRfwmsacH5r2FVpGEUnpZZIj6YhsKumkwSblCf3hN4RA7Udk6ny9sI4BhMNFzGLItlBoJ62S5lNbaEnbyKmfOesGyU1JJj5wiEMEKOYArINFprlT45LNj4T4JsTQdWGU5VhQRqfBb8CL/ZQY6sx3w8rf9JKXk5D1/snuB54D2ixkn7l3qXLztLnLXOOWkSztOq7IOSPJR0zwFdCzc9vcNCUDJDy9T4md02G5xWMfteG/y83DYTi+KcH8Xescnkro9e3froA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic5jkH1/JBJkiScEMlaPgRajfRUdf9+VW5vsnnDbELI=;
 b=rAMYaa2IbkfVU8g0gbRgYd+OymOLx6nuG8W1uNdb/RREIUpNbCYgCy1beOR/psE+mVvrKcRs1yrKIaWK2Kfxa5kWaVSkMzdIMR1tPZFquCGKzyn1Ntm/viTYZKebYRl4PkVmCJEQKaN/SfupB8JJGacFk9+GfvmDzSZEo8RpvdaOHBtKddVNW9lDbkJ5Gb2d4Ldddif2B3QfRYpzibXIRAvNxi+Gxe/LehphmjFqZOETAHP+M+0Ne2amTDG/cGZFzRYSDTGgU4KHpPldAG+X3FmReP/CH4K8qbxrlmmIHJD4BmTeSsJSVGO+HtXPekTDcM8MHETXXTJZ4Nr/ZJfVkw==
Received: from DS7PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:3b8::21)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 08:51:14 +0000
Received: from DS1PEPF0000E635.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::79) by DS7PR03CA0016.outlook.office365.com
 (2603:10b6:5:3b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E635.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:13 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:51:02 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:51:01 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:50:55 -0800
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
Subject: [PATCH v6 05/13] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Thu, 12 Jan 2023 10:50:12 +0200
Message-ID: <20230112085020.15866-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E635:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e396e5-8d0f-4f54-004b-08daf47a2937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfvD/LlHBqdFJv6N1nhdpw0vAGd95LQWX8lUmTfsWZN/HoVSU+BYwVwUSWGcJfqR53TfC1nMvUBeGIwfz7/PVdlju6odDy4qyJp6tdpT35N5lz+o8LLUSKkX9YDu3uDw2GqvAj6uzVqsAvu7DPLfkZEI3xOzDKlCCxUcWge0no6Ea1D3ZvlAGB4jNJ+bKmiYdEIOz5JO8GDuCNJN85WImij+s2s7AIpJg7uSJsGVYZ5YRxnw7MAVQUJciC0ci+26Y/6fVbceoRV/XnJNfi+6Cau6t/40dnM2wx7udQIfw4X864q7bjLFz4C6wViBClPPK3skpPmPzOP/LVOPiQzrloN2KBV2s9kb0WhHUXfRCvcGfmj4s9x5CtfC88j4dKsm0dwMXWGDRvzb8u0tTzb09qyAi5yyIchPdH3TAvNr5g6R+yySlMtwv/ZxMRy9kH1vfApHKz/bFMFHkbn/HZGQ3Q2m9Swdh7+NlX4OtOMgnFy9FADYTAQ4yg+n9Da/9pU1rXDK8ZLI3N8JcJrZZkd4sDo+JUupOMG9NpfNOh1HS2RSkhfGM1Q9AVvvDl/opC6yZsRKZBX39snozOILE11PLiEtSWmxEGhmoJVHKWCoD4O1PvZcz0VFtT6fvs8mbisscTHgFDr4gfiyCo+SHsWv63hB/QeYvp+kUgujoNMJEEZX8lo3GB0DsElBghD+lZO84zOKtKSq55eZcqNlrq/3Cg==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(478600001)(426003)(356005)(7636003)(47076005)(41300700001)(1076003)(40460700003)(86362001)(316002)(54906003)(2616005)(70586007)(26005)(336012)(40480700001)(186003)(7696005)(82310400005)(4326008)(36756003)(70206006)(5660300002)(7416002)(36860700001)(2906002)(6666004)(8676002)(6916009)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:13.9598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e396e5-8d0f-4f54-004b-08daf47a2937
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
Received-SPF: softfail client-ip=40.107.95.69; envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

Add new function qemu_file_get_to_fd() that allows reading data from
QEMUFile and writing it straight into a given fd.

This will be used later in VFIO migration code.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/qemu-file.h |  1 +
 migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index fa13d04d78..9d0155a2a1 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
 QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
+int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 2d5f74ffc2..102ab3b439 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -940,3 +940,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
 {
     return file->ioc;
 }
+
+/*
+ * Read size bytes from QEMUFile f and write them to fd.
+ */
+int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
+{
+    while (size) {
+        size_t pending = f->buf_size - f->buf_index;
+        ssize_t rc;
+
+        if (!pending) {
+            rc = qemu_fill_buffer(f);
+            if (rc < 0) {
+                return rc;
+            }
+            if (rc == 0) {
+                return -EIO;
+            }
+            continue;
+        }
+
+        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
+        if (rc < 0) {
+            return -errno;
+        }
+        if (rc == 0) {
+            return -EIO;
+        }
+        f->buf_index += rc;
+        size -= rc;
+    }
+
+    return 0;
+}
-- 
2.26.3


