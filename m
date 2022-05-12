Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD2E52519B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:50:58 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB5c-00068W-Ut
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyk-0006LH-UO
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:50 -0400
Received: from mail-mw2nam12on20619.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::619]:51137
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyj-0005LG-4R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSQehNh7zkOLkIeBNYVWDADZIDRKnl+oo60nMC2YqZ+JuUnRSkqPw/y0xt4LzCp6uOHLNNnORoxBXiNJKkA7aAtBVII0cnhywXw8NjPR+ga4NytddGBRJsrWufqa86JswRqVw3eL9LEipI2lkkszHn6yqt7N58xFNREkAFge+mC+ZhsLXkVDPffFLV4SHVaaMMPjEtBXwl3liuqpQIdW3F0aM3hPTxqDj3cBWF7/XrOq81bkkN/ECoOORoGm8ioxYlOkh5j95Alb3gmTmQnih5K179RFwaugPPqdgBuLbV5Z1+oyzM7OrtCcvtodV9nGt7LBaaYbObNQUezTtEtl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33dWet8F7c64nY1h8u8FSdJegji/Xrkz5DD1ILOqYGM=;
 b=HWeOWD4aZMf8OfDpNJ+XXKRqzEtK10G8xA09TUEgxY1z7vd/Np03Ph2n23767iEEzi9BZkLsd0H7x/QBIIhU68lYdHdG0fCk6HIMNIgBtbGlLQ1TJdQ0ap3/udzsLjVTk2f0nWkRSEaPC80upAT0Jv2HNrcMUNch6LDpgWK/FsGLixDKuD1tE37tJQL6uYbfJ8Uy5mnKaFf9EBBje+SVUWMjTDrVTfQf0yYJHD3h7FVqb3oD5+EqE+blZypBYXMhUk164LmZ3B6LztEMBzYaoHL15UlRtfgTwgDGYngAlLJv9f91WXYWU2b7nZ5S/eobCLg0iBCBnpKTGOMkW9K6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33dWet8F7c64nY1h8u8FSdJegji/Xrkz5DD1ILOqYGM=;
 b=OtW3rX7LNYxwnni7nMkSBTv7/OBQxCZZRHnQUK0vgNJ6RvFEmQ5i+SCcWmi57gdZpHqyg3/tJQFeYXG3W1f/xC+o4xarDcJNymOwHOaUEGgzF2hjNQrLCMoLzHt8egQM4u2F9DEL+yX3WM1tT8exsp1YjJZ6/fuOjdeadpIQxxWGaSAYoYht1+MlOZ17fOtCNsem5s93DayP7cC84QTHlbuEOBofl7Tzm+5zWSbXh8w5DkwXZKcY5NEebixHu2uav6cfXf5g0T0+O6ekbrEqjx5UFJnF4YGl6p+0TZYHwrBbwLvAQgknQWDDxDm8S/NO/cXiwz3DKcoOzObZIKdD8w==
Received: from MW4PR04CA0247.namprd04.prod.outlook.com (2603:10b6:303:88::12)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 15:43:46 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::bf) by MW4PR04CA0247.outlook.office365.com
 (2603:10b6:303:88::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Thu, 12 May 2022 15:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:45 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:44 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:40 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Thu, 12 May 2022 18:43:16 +0300
Message-ID: <20220512154320.19697-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03e15a26-b992-469e-4d08-08da342e3326
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4962289DD735DF74C8144ACEDECB9@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ldAWDCA7Gcmzdiiz47fjc+xRxXBRLh8Sc5/vKPvbntd2AKYisW602nPEcjJSo4Mvh9ft0nIFvpP1mEAeVnjtr3ilhmxfATtnn6oyV24qaePMnl4aiyXIP149mDrMZEduEyBmtISC81SJRsWaXKowNR/zC4qRgwlQbcHGg7b4zuUIZf1R8pbb7bMG0HrQ0X3fVfLTLL+TSy1sXxWiyz003qomF09vVDqw4W9rDy4JpkDL6nZtA+QYtrNRhIt0o7t1OADZPexWUzO+JlK1H+4Qmq4jH1+Wluzqs3CMDxki5zB9UERsC+6Urnzjs9Mi9i7Prt1yE6XxMFNIB0Hb6D0XgVFeN0mXr1jjQTt4wg2p5ZAABR/OR3l+OYV3Iknk7KXpLIVtQtm3eOPOOoTx7FdBEFBrJMCQlGx/VmDKb6ZdJnpBPeFWO7+TW5V9hasFjijIcBsZ5A9bW9smEC8pXpz39m8BIpirbzYbMxTMnFANLT5mkQNod5Yy7B/caqH0Bds4d9UjVm7sEssDuEJvxgi8uAgfaXP717/5ON9ARtMzLqswyyM9Fiknoe24BtuCT/SfN8s1yMDLZ0NL/FWuPqA+kMXiF4F0sQhMyxlSb5gkY5s+tcC9fib899GCyMibibAdPHQ3bvRFleDPDSFBFJz87kkWHscq1vE8nN6TdlzGXOY2s9fbVTE92rnTuDr4LAX3MLVBL+7H9d9A3w+neG1OQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(36756003)(4326008)(8936002)(82310400005)(70586007)(70206006)(5660300002)(54906003)(316002)(2616005)(6666004)(110136005)(2906002)(508600001)(7696005)(356005)(81166007)(26005)(36860700001)(86362001)(186003)(107886003)(1076003)(47076005)(83380400001)(40460700003)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:45.6540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e15a26-b992-469e-4d08-08da342e3326
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add new function qemu_file_get_to_fd() that allows reading data from
QEMUFile and writing it straight into a given fd.

This will be used later in VFIO migration code.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
 migration/qemu-file.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..cad3d32eb3 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -867,3 +867,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
 {
     return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
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
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3f36d4dc8c..dd26037450 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -162,6 +162,7 @@ int qemu_file_shutdown(QEMUFile *f);
 QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
+int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.21.3


