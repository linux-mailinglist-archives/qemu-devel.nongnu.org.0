Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E49538720
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:12:49 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjsm-0007ih-QE
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis4-0003TP-TW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:00 -0400
Received: from mail-co1nam11on2060e.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60e]:26112
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis2-0008Ll-Hr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtmTED1a37dDf1Wo498cCsqKQ2ZzOPu5mvcvVa+MBPJIGfkFM3UgVe1UaCj5MN4mA+9ao74VGw177PMQVNqZudPzIhNcH7FSBbjTGmjcSTWMsYj668/+G5XgbOI8HwshaERtKyLJNsNSOLOMEKqEKkh+fpBP6ALYAhGkCmI2+gyIZr7jf2dI9ZNSqOH8X8Sd9jTVTxtbSwBjcFIDncwW0cD0+/Q5p4eIiBPIHyHs6mtqw5yWdLJvAq0nsG3UqaCJZ3CWMO0pgZW3yXlncD16+r8/LDXwMQj5soStX0DN4dotDl4rCie4X2FWqXD8ptnugK++eCzZTTbaBJhyMkhUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33dWet8F7c64nY1h8u8FSdJegji/Xrkz5DD1ILOqYGM=;
 b=D7xGCX1bUFpEt8rnaYK0FxwTIcWcwwedJRsRGGbn+pwg1JfhP8GQ6/SwY7ZxLthIZ4dD5NR1VIIABWjz/3EuhqcAjlxvvdvXI2zDDzifr1fzYeO3xMqvIeWgtu2bUw4wUQg1CX0o4+89guLIFlUyJ0jJUruzdzWTrVuwuILrJ+2OY9peDy+rdnrbcpZf1fZMnN+QGnCPsUKgZJmjfb0B1nKp+4PpUaFQYn0LBAuBR3WBfL9Tbtef+JCONNN8hnKjnUxvG1DzvyabGoppQApD1gMW6szYudjt95qoukLDtvaWTNHl6Bkn65GCBAlMiqSiqDqtX5XKJmLRX7kDxTjTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33dWet8F7c64nY1h8u8FSdJegji/Xrkz5DD1ILOqYGM=;
 b=JTUfXZMet43l9BWhcRqDnQ46KGC/Bse92skmdQzSkZWCpV4xkcLdJgF30oBgFYqR9Lql8mSUXJStQ0DIprpLIWd4aXi8Ca+S5p3KKEJwu/3WOFWdkWnjb66uksakLvnS4or/0yVvdc//9jlDXKKZkb1DKWi5R4znLOh3M4Oqy0oLPWyeKrmcMlBBbM69dUEK/JTym2eCfGDigrgDimAaMoFk1EgXSYZTKaWdm499tCeBS4CBxooiwhHqDQU/sEwxdz/fT85XQKsFx8za6IJNjxQ212CaKNMUU+QcEu6gWY+00h0y6EtnaoozkPHDnfJELfmjpXyjwWmKVuBy194mvw==
Received: from MW4PR04CA0215.namprd04.prod.outlook.com (2603:10b6:303:87::10)
 by MWHPR12MB1742.namprd12.prod.outlook.com (2603:10b6:300:112::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:07:55 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::bb) by MW4PR04CA0215.outlook.office365.com
 (2603:10b6:303:87::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:07:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:07:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:07:53 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:50 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 03/11] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Mon, 30 May 2022 20:07:31 +0300
Message-ID: <20220530170739.19072-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 953c0b38-f026-42da-6957-08da425ef032
X-MS-TrafficTypeDiagnostic: MWHPR12MB1742:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1742EB5B0FF9464BF15A2CF2DEDD9@MWHPR12MB1742.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvUQii6WdxXcn8PwmNz9IFWor48bWhqaTkzqadQRKrq09brsx5Pj8yrhm9NhBulo7ZkFEdbKM65ddmCHeZIbfpuArwcbwepGXi3OEZ8XSQyOUbb9aWg57RPNMk2LDJgq9ppGFIt11wCtaE4VX/JG0kNHCMOS0xXNxgKDJ5r5V3SXDfxgrJMoiI/Bw87Wsxa6ZNNdGAOioIobVavmc5BDTo1LPqPqACGWBkMEYT970JSGFaGiduNtG/caKO2cbHisHNavz9DbKkkw3bjtwSdgr+u0s3smatqFIsJrXJ8kZ9Qig1Ju4pR77wWN557CL7DaidF9Lyul62DUg9CZ5sUjgy+foz1bVRxl3CexqaPzOClVvwBt5fG32gmA1I9ZyhGpQvXtwqYX29BHPRdC0pQj0nKHXXnArzwFTjopLopW/6qNLk75/N5pR07slQ2zyAvZRo0ALLOSnujUjY/Vn9IOTe61tclQ8aruNeG8VbPCtSQ3wp1KCQRCfF7dYGaP3R/GNnMcvQsjL/3qwdDjI8o5As9vTFOIAdHkpInc82Oc4+vyzjap432guOsj/UoPi4zlRkI48OWrT+B8cJK0tbvHe5eHaH1y8PRd10CIr81pxoGcIGcESKwiHtzViCuIF52ehyuuv0wY8oE8JG+XPo51WppLUkn5QTRRJqtDMTsDBuJlcZkOdc7ofU9joKOg/fFS7n6lQxp5QfsXCqtTjzzyNA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(508600001)(86362001)(2906002)(40460700003)(81166007)(82310400005)(4326008)(8676002)(356005)(26005)(47076005)(6666004)(54906003)(70586007)(316002)(110136005)(70206006)(36756003)(5660300002)(2616005)(107886003)(7696005)(8936002)(1076003)(336012)(186003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:07:54.9447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953c0b38-f026-42da-6957-08da425ef032
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1742
Received-SPF: softfail client-ip=2a01:111:f400:7eab::60e;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


