Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074B658C09
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqic-00079n-UG; Thu, 29 Dec 2022 06:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiZ-00076s-4M; Thu, 29 Dec 2022 06:04:59 -0500
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com
 ([40.107.93.49] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiX-0006Vo-0c; Thu, 29 Dec 2022 06:04:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0DS3Lst8xAhdlAGx2xe+c5XCT6lRFg+sHcHTvESrEq5J7IYs4/NKPVqWuyxQ0A1P2Zh1oS82lQQWlWhHttn2LnyLm0LwcNdTx71/CpPCvm+CVjYyoD+ZAfkB6xWWMzzBoBclblkhJr2R5Sw07zZj+ZApjv3DLisXvpgKAc8rsirAHiOV7q31few00ABjXh99cB7AWQTeMRtff5lCb82llqR+NTw5Ekj5WV7c4f3pI/CEwFzIeoE+DIOGUOgOneqB7iKM0rJnQmjn1UQMKIqdX6glG6keQZNmedOZYyu0k66Qk3DmlI96w1dep7OR97COpBMuRQ+LjDL9wKoPldjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq2x4TNM8j+/tvysjdmnLXtptLw6Rzv6KU9vsXwt1mQ=;
 b=S/Sjqrf1Z7PCr9s8z2KT9XdQEyr93KFE+oUefrBTEk8MWUQHQM3AW+xFRsB7gVDvUaUwj/0Ner3NICfVOzoX0MccZGaQA71//yLhYRtZ6zU5NA14kRtwBlapCRrMZSeSbiRGwcqsAW/qgh0hhQ0q64Mphd/10FsQwsKCFO6nl5+AfxnA8LBSfQnkb4ZugRv0P7KJ+Sr3DFmWuZw4HpQ2HQdorLmsrh0FNpqx4wSSB7gJkgDBNf86ZIwDnA1hjvQb4YN8PpV77mlyBkwDTGD3gnDW2X7s0Nh2VK93ucFhRVqZ+SZGYXQ31IS53GGZJlkhrC5ibxc2mkvelWLZ4pIjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq2x4TNM8j+/tvysjdmnLXtptLw6Rzv6KU9vsXwt1mQ=;
 b=MSh7Q3NosB81dYvFSVpTMh7xP+X3d2JP8qS7O2j2gfFhEx6VdtYxUo2zSn01sbmpkpHyQ60P7lt7Ha4aJ7w7uZCadSZXFEYch8qhykPArfip3RRwCe2UBLa3nsFMM6sdG1iCMSRUEo29AmNpQKIstrWDTWB/e9ErPQtqAvK39IK77WnJMXjcSCw95erEEInXEZSuK4as96nysGnEnHgnpuujTEUFHe1LwFdVkveN2E3ckki/rg4GeLCV9Y3srzTvdgwTd0JVHu+j3QTq/X4EQFxCXqYsHChxglC3fYNaarvV6eeJaP1esmsW1o5rWmTQQ4adNHsWqCJlBbvH0vU5cg==
Received: from DM6PR10CA0007.namprd10.prod.outlook.com (2603:10b6:5:60::20) by
 CH0PR12MB5171.namprd12.prod.outlook.com (2603:10b6:610:ba::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.18; Thu, 29 Dec 2022 11:04:52 +0000
Received: from DS1PEPF0000E63F.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::13) by DM6PR10CA0007.outlook.office365.com
 (2603:10b6:5:60::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E63F.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:52 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:39 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:38 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:32 -0800
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
Subject: [PATCH v5 06/14] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Thu, 29 Dec 2022 13:03:37 +0200
Message-ID: <20221229110345.12480-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63F:EE_|CH0PR12MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c27192-593d-404e-e737-08dae98c82b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: viTu6lrEr0llTaEehwVLbXAFzTAuJcXQReMZJjBCEQcHUzAvH0aqNbDEEPxGPooIhhfzgFJZYFvots2hv+ptusisu03vyPZMo1hroGoQc8VdPvxFddBgy4QsiKl0+lCgzG4tCzApyh0BC/NySSfrmVE3vzNNl1JKp/BLrMDA/MMeUxUhPeR2zz0bZVMk8p6/yGEFLE2XafLNt4mcJ1wDqNvYzZkrYZOwheSxLCl1MbnftTJTLbye0ZkEOmyUjAdEUwb0SxEE13n6kHrfNdYyH0CROK5LHd4WoBfYf+1DayjHmAQfefKeaK0b+F4+aX8HWdJjeFjZteLF4Uy0KkX68EX9ek1mV7/XECNLL/0IudRSztDXZELaisDc+g2XMhdpVkqxUZv5ahhWC+TcZapUjnPkMLX1yOKiArtRFYfa73hIQt5ErrsQu+3ckfEeeRdzkGBxt0zcpIsH0H0FHcO9RyNOjdZ7J9WGurzLITVjTYK4ucIEWjBGaIDFH23bDTpVMYplfKKifPRyIFB03zf0vEqYQwX9XBP9FbUhezbIrBhc7CydyktIUJb10ci3FYkWOtQdS8IOVYBA72/fP6PT89TN2Q38Q7D9OzbCYBgt8xNaycoM3WqLrVjanHHEVZ14pyPM9fxQwHi4SVNLtirC3E0nXh7rZxYZZ1PTuGo0LfWAWt00DanzbnMc2+X5f1C/ZUbGUlYkDkc/SUUgGxrKgw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(2616005)(8676002)(316002)(1076003)(2906002)(26005)(82310400005)(5660300002)(186003)(426003)(7696005)(36756003)(36860700001)(47076005)(336012)(7416002)(478600001)(8936002)(40480700001)(70586007)(70206006)(4326008)(82740400003)(54906003)(356005)(6916009)(86362001)(7636003)(41300700001)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:52.2108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c27192-593d-404e-e737-08dae98c82b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5171
Received-SPF: permerror client-ip=40.107.93.49;
 envelope-from=avihaih@nvidia.com;
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
index 2d5f74ffc2..79303c9d34 100644
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
+                return -1;
+            }
+            continue;
+        }
+
+        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
+        if (rc < 0) {
+            return rc;
+        }
+        if (rc == 0) {
+            return -1;
+        }
+        f->buf_index += rc;
+        size -= rc;
+    }
+
+    return 0;
+}
-- 
2.26.3


