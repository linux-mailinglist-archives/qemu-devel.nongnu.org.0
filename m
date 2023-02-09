Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616D691138
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCU6-0004Gb-4E; Thu, 09 Feb 2023 14:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCU2-0004GJ-QV
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:28 -0500
Received: from mail-dm6nam11on2060f.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::60f]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCU0-0005SB-2x
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5edLPTf2SirKzzzdrm+n56ilcOEKhXDyMdUwZ0FfYQk0/HioHvD/l940wHEdUxaKMZ12gM3DAS/oIeCdXCdr5tW99n476eYFqaXiSgZphgsdaotB1P4JlsOYx9WMdy+NAY22Qkio3YPcO9tIf/WAcIKyln2tfM9SbLV/3oUKWXN7AgjRhhNaV7LCCOgQdveQ6OQTTNfnBHb0lncoSkhNQxPweWRKdi1Qkb/2eqMG6OkLA6w3mnZLkhDDGBBywoKj+nror+U6R14ves9wip/pqknXArJjNderJrgm61TZ1qbtPD96V12XUYodGe2OFPYECQ5dag1HshgNnd4/qIKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=QYjoOE+iWkkcHz4mnlSdEQexNiSUY54o+Dz1orobkIupqtXsTyoXe82zcMQtiSzIEp+9ROnpyXtgyBAB7co8Du1mSznGAZsU3LCMky3aP30Z+Jq1lW3bZGv/jc+EE1bAk1bKkAMI+AUffuP1B2VYk6acV8UcGvu+PwYpDpg69yqqPECYNvHzh3/dfWUidt6A9EX5IhFE3BYTZwcylCVHOcjY9nM6k/W5eS9/zxXGgHwjjjZgbXwM0tuvT0cOAKwNy5GaWFpNcmSoAiRaztFFbIG4kgB2IWCXmSvsGx/0ZFMVz31E51iMJIx1aD5kLY1MAUeVzeXSq0SjshtDQi4nNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=KLCeiht+q9oTwvnv+5A7deBKv2fXCmougMFivrG5sMVqMG/xRjwDJcngwRy8THgVDZ+tAYigAUetOsQR6vxQuQmmV8hbzhXz7lPG+xH4M1CorVEU8Qhqh/1eUEcScKoWYN/8sNvf9rz2Uix48PT50No7dH+YYJrHAIw0wtbLswojwALIjfSGC7WUWiTMBhe5wbllYPx6m3qhruu+9iDws5C1LDLUuOTND509mDfy+iav9C8ZW4EQaMEwYYglq0lKqFlCPqWpzemwbb2oP9rvHr2JnQy9gABDs1GjjcZxgiIq6SHQjt/1u+55Wff2Pg5puflyjSoJD12VnlEPH879qg==
Received: from BN9PR03CA0294.namprd03.prod.outlook.com (2603:10b6:408:f5::29)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 19:21:20 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::85) by BN9PR03CA0294.outlook.office365.com
 (2603:10b6:408:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18 via Frontend
 Transport; Thu, 9 Feb 2023 19:21:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 19:21:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:21:05 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:21:05 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:21:01 -0800
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
Subject: [PATCH v10 04/12] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Thu, 9 Feb 2023 21:20:35 +0200
Message-ID: <20230209192043.14885-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230209192043.14885-1-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT060:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: b7241645-edfe-492e-d90e-08db0ad2d310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0a1yQHTUJOpqWdFfAsnoXSlnzpLRUVQ+OFqyQPNsUNZdrNExYI28QimyIXdmn7uTIgAb+t23wvxf6MpEOkvgv/jFKLr87w+Vf+PWERrXPUs8Vb9vnzW1wkMZisKBTO9Gnz3OzGTwKak6w6TZnSQX/nMEdRBZWXuJzQXsif8mwlvszgXHU4NTvynqaI+8DVXoU5X8+yomMQPAuK2a/7/B6HP1IH/Jt1yIjrV57qisL9lU2Reinzl2ubb3mJtv0irvjePIhN75sRW/yhQBvXvh9ZgtosDQt9pgnKmE4Pl2KzIGKj6EgS8VVjSCH6oJ4Cxzdd1PpFtPOddAjqm7sq5qD+Nv1e4+lRPKeLhk1VbUK07AYZuoz7q/fnruT9YE3pdZrb+7L+nbKbOyNDZZndNWMmQ7jtJB6lF/p8S/5aQvcqLb43olcshCYGlwWnkZJbaksjqK6OhIIt8N4VnHAseouRHJZOsR7TysoRp7zi4I4/BA4LvvbzIAhaZSrI/vvgVRHxCZ81Y1Ys9J8qFi6d5xSXbOd+fKujrfEkAt6ZhxIBC6jVfnkJS9FEtAcauZ9dzvzJbi5DXV3gQ+9Shn2HmBKpbfsZLvGVre2oCJl6Btruoa4LNYbIKHwrvWsVN+9HqI/G8teIRGOfGUFMlPep9lpoSgZg3Y7aeCspZ+dDu4Y7BogQ0FxHCmZfS6uzG0Ay4DyoOp41oJBaK7hXodbogcTA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(54906003)(356005)(316002)(36756003)(426003)(47076005)(66574015)(40480700001)(5660300002)(40460700003)(82740400003)(7636003)(8936002)(41300700001)(7416002)(36860700001)(2906002)(8676002)(6916009)(70206006)(4326008)(70586007)(83380400001)(6666004)(186003)(82310400005)(2616005)(478600001)(86362001)(1076003)(26005)(7696005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:21:20.1532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7241645-edfe-492e-d90e-08db0ad2d310
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::60f;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

Add new function qemu_file_get_to_fd() that allows reading data from
QEMUFile and writing it straight into a given fd.

This will be used later in VFIO migration code.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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


