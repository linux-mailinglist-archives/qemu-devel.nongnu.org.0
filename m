Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B768BCEB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0fv-0002vc-Lk; Mon, 06 Feb 2023 07:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fq-0002jg-Bd; Mon, 06 Feb 2023 07:32:42 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fn-0000Va-IJ; Mon, 06 Feb 2023 07:32:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edS4fMRmFrhQK9E52AH6d+JC8+ncg2HejmojN2VPEfVYyg37Rnr9/cx9PwieSF8JTBhZDJKgpyYkHEkSOD9vj0/gMy++5hCIVkTFCBmLdbaOFFzM8o1iRAAoN1xI4xvy16i/FYLOAEHXvL3dro4piVQpm1F5bjyynWAtKxbTaO/iSxJAK9hc85yorOdnFGBjZGXzROYxE2K9Ep7GdJ879GozcQAXAceA/SAbbE1HtXDYVxKn8q+zi7beuJvaveSD45DV1NSr3Zb1TEOwoIuZ/7aIF7fPZwXZMACTg/9yiq5zBH5a9weVeVIyjmeXiKcxH9K/lBWwCkWSDS45u2c7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=afjJVzcpHg60eGoTH1YzPBS63EFkI1EI+19fyfhSPRKlEfG/4sgIPBKzv5xwLZQPuR2/bPG1+2kgEPKQCEZBd78GEiARcuVjEiqdo2bp9V2fswZL/gba/9uvTGZybs80s0fm54elVJvzRpx6XAxyuqTCXdroR1edFMziG7OPJAeTMbt6bKX+MOZDiOiduZDrCVTeYPXXlxARBwPj81CBwjSa72AGjrYm6nw50Piv7QiJwoJ22dlsCwWTL+5jj+b511+sqKrz7zaxnKvvatLqtxBt/5UumvM+YPJWIUoeFYhAzKG/xSoY/cUSqbP58HWY6nBWcWMag28bQiJcKTz3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=ctNneIMuX8dgZNK7zxqaw5AGTDO6JeUeAfWsgy7ugMgHzebbUoJLwBtHZ6uz4ujXTnxTYDBcHGZNf578M6EIbJ9tZqRtfWqWM5Kn3IHgMstA4vUEgq+HfqkQlpgN6mjcOONU9Ca3UYRQlZaprDzl3NTrUSqVvy7itCZtDJoVIC+QHQ8mTEKs/2rHDuVc7eP2i57FvnleEpYEjURNTLjonWV2uRPeZabGZJ/u4PRHVQghPRCQDHbCbxRvDLHopd5QXZlwnONeHDOyEZOHROjo7G1mSkKDfGKOGRE/MgH6mT4UYPmge4roUj/dRo+mqdKLlRDfgTot3mfHYtuZ7MS71w==
Received: from DM6PR02CA0069.namprd02.prod.outlook.com (2603:10b6:5:177::46)
 by CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Mon, 6 Feb
 2023 12:32:34 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::18) by DM6PR02CA0069.outlook.office365.com
 (2603:10b6:5:177::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 12:32:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:24 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:24 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:32:16 -0800
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
Subject: [PATCH v9 05/14] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Mon, 6 Feb 2023 14:31:28 +0200
Message-ID: <20230206123137.31149-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|CH0PR12MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd7e6d2-db0d-46c3-7a5f-08db083e3938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTkxx917T4QmvzTLKJgZHlCyoS1zBI4fd2NHJ7XM+dz8az9N9hOiyFftqAcwP5RARl13z/TOGQdZ4k2tvR8zRrVhbyDIHOy7PODhWekH/OFjL0moaYfIHBQSVQmz3S3pIDbmd1cNERFhmkXZNtDuZOD7+zXb16xTsiNRn2EakBGebvCeDMtNd0MxCYYbVWAvTEdpU5yGrwdXrOjUP+XataAkovox0RF1DYC7/Cu74+HTOX9MVjOkpTGZ0ozhOSEfBx2VZFbRNzEu43VxxEja8aMhrxteLHamFjKJsDYXJ6CmxvJ/WmkQdjjCVAepwnXEwPQt1QYCGUQP8RRkQ+K0DX/4U+/muv3v4pZMgIGH/QuMYQtyg2ffPlTEKUZKMKM70yXtbW+I+zXe2ErXpmtoCfmEZd/w6YXL8Ghz42I76/kDWb9rT5xaOjoFV0BHvklaHjZ8862cYVIHcp1o74vbHEXbQ9GTwysTikWbpH4bkbieYKOngt2JiZ/pvfMhBY0l4wiOc/0VnvA73KD6UnpOdti+alhXavl3A2oi5VhJvaH0Xsq9V5lwtP/dpfySE8Hc0XOwB5xBtwugB95JTFisLFAh1M9hTNtVSmmIp/7tWBJesaJT2V7/uSi+cnseUq1LxB8G6mYqe0BfPigp7s90qky9LdbiR6p9BuY8XHNN9+EdaIyTA3igpNFUWUToaKS9x7+0fH0jPNJSisPE5GOmwg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(26005)(1076003)(316002)(5660300002)(54906003)(7636003)(70206006)(7416002)(8676002)(36860700001)(41300700001)(70586007)(6916009)(8936002)(4326008)(82740400003)(6666004)(86362001)(478600001)(36756003)(2906002)(356005)(7696005)(426003)(40480700001)(83380400001)(336012)(82310400005)(47076005)(2616005)(66574015)(186003)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:34.2491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd7e6d2-db0d-46c3-7a5f-08db083e3938
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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


