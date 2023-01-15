Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F666B373
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7sE-0007Pg-D3; Sun, 15 Jan 2023 13:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7sB-0007OP-U1; Sun, 15 Jan 2023 13:36:51 -0500
Received: from mail-dm6nam10on2063.outbound.protection.outlook.com
 ([40.107.93.63] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7s9-0007dP-Vs; Sun, 15 Jan 2023 13:36:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fsakve37l3F4rD78qGfCc8gMQaaiQzyWD570hds8sRz/BCKBQUA6WLIaIr6AIykTHpRFZOOgOMfGrunQ0a5rnyjC4DOqcM6nqHrLgK7tGDwsQtKTqR8U6Hc4lvUYDYXDg0ADvCvr4SampI0yXTjhBezvhZkBp2uZ/stGyH+hjbZIzKj0CSyWYztjf1chc5mW632zhIu+OL27+7VIaOnvejowERaPT3SBRNa7iRydsdXtGIlwcS+LsR4ewOQ+gpAEUOx1rbMtCPAUARsB8ovrGdkAslPrpVSiMNOAqBB5jIewhT75ejLpXU4srodcBrbijPIW3Ch7gEcUlo6t3f5MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=ftIThmm7nw9Qb7UaZUvWZgWzLsQ420/6d0zUSQxEkRhBfuRK4YXuCxrxH64jweMlrfZO7t6Hf1OeYuTC4zO/fgp28LFO9FH797ids/mRuaQHjj8mXgOuY83eZgnjSOGjg8fHpflQoCmRYIUGDR+216CZCsmmlD/C1R303UR9BduZ5Vh0jxz4FEDlEh0MGNTuA/jY+4ONwZLgEg5rzAQxLpHsK0Ow/h2T1Xsr2sMfsPUD7RmNx5pxBcIZ9DsPQXQQHalVf8do0jrXPPvyv0e4jo+vHMfYM+NMX9D7ZuHqI7N+TIslbLpE4aKAMe51tYPz9IqkAH+PMXvPP/mygDsBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=meEU1KxmRLeUzCzA4Phtnn6iiEulkvenwQh/RbqsSSatrE06XGpON8uCYl9AUTTS9DvSW3xyc57guRjCRkshqDQ8UDlPKomnKo6v52EYnTgMmiLBciWwT3LmTAMxazDgipEXFW7Cwo1Rn6tNNX42B0264nvmXJofCGcllCS5jLlgmvOMZ3aoIGU3US/tefxdK/jZmlb0raZsBrJlqBmguSHDln0zVC+Ao5rkYP3W7z8JRQU36LPX5ySGqyj99XgPlD/UX8wciaPcpXvxDaNEz4hvaTiC6stmIvW6oDSlwe8nHoJHCq4pySTlMYEKxgm7J3FsmOQ72lctNmgKtfmkkg==
Received: from DM6PR02CA0070.namprd02.prod.outlook.com (2603:10b6:5:177::47)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Sun, 15 Jan
 2023 18:36:39 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::25) by DM6PR02CA0070.outlook.office365.com
 (2603:10b6:5:177::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:38 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:37 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:36:31 -0800
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
Subject: [PATCH v7 05/13] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Sun, 15 Jan 2023 20:35:48 +0200
Message-ID: <20230115183556.7691-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230115183556.7691-1-avihaih@nvidia.com>
References: <20230115183556.7691-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT063:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f6f3c2-e1f0-4f80-a9ba-08daf7277058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: acNu4J+md4Od944aI3dYKvaSXhCTaynvdzBEz7Cr2fQCqcq04o+RrDkhvTljbW7pOO2FoWCa6w71QfnHPH2rx+X+YJRb26koigDfIT50B8QqmUSADBmx8dX5jcH8UizwvrV+10gemSOW6lLE2qt0OwPe7CxbgWhaU2+g8wBKr/JsPPCeyAhs9KO6C4TqWe0d+wmm06F7mZnGbxtC5joAgDUo01ATnUzDqGlvgJizxSXbQQrD/I1iJxRNkjcXCq8rDgEbY2iimf67Svb7HjxV87IB5SXWZ9wJy+FGDDyNOGE1crNYZHoiCmIwgJhSu0mo9pWKusLPwz3NBlQuM3ipTtrWYRvXFzm4TiBrsqYVZqzCeTG16oen0QAb2DJ+jts7eCzD/6IcoWrkHNOAZXg63tRuOuu9diqYijrm3DRfoUl+Nr4TLipF7bMd1WEs2cFe0tGrItwJ8HSgNrTX41c3vM4DJ0AiSUh5sBMbAI/jHBePLhhRiOYlBF1TLWBg1f1Szi3ak7AomcBKjKU103MjIQ9e0r+Ma3XnKwye9GAwgGZgjbk0tJ6OaDehvM3oENcudF19l0zMBT0iFaqpuZ2APkJv6tMgMCqp4PLWu2OQdP6tu9HvtjBAHywbGgXjO50A595BbR29Xa/uGkp5IHDO9UWy+K57ZHCgDVlvN9vO85HEJOv/CzMFEZ31DIqwI8yPoDhW8hbb4Bu8nlrNBu3REw==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(54906003)(41300700001)(4326008)(6916009)(36756003)(316002)(70586007)(70206006)(83380400001)(86362001)(336012)(82310400005)(6666004)(36860700001)(66574015)(426003)(7636003)(47076005)(356005)(40480700001)(478600001)(8676002)(7696005)(40460700003)(1076003)(2616005)(186003)(26005)(2906002)(8936002)(82740400003)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:38.5584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f6f3c2-e1f0-4f80-a9ba-08daf7277058
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698
Received-SPF: softfail client-ip=40.107.93.63; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


