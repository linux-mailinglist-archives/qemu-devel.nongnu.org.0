Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B263D25F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jep-0003dk-K5; Wed, 30 Nov 2022 04:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeZ-0003VZ-Rm; Wed, 30 Nov 2022 04:45:21 -0500
Received: from mail-bn8nam12on20611.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::611]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeW-00031l-Jk; Wed, 30 Nov 2022 04:45:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cit0rF7dpR2ecN07pM3VFLYND0UKzyvFfw8vwpHvgaLCNBYm6AwPX1stHGa11J2OJrEi14rwuLbJo5SxAxsJfgTZN5ULPYNKgNRsw+3wCY4wtHqUjTpNXwEqoix3Kc3YCq17/onPZMONTAeHIQfqdXcHyvhVuqll62l182Ceow8y75EWYMt1UauvE5nDK3DN6DPKwh2AqcA1Oi3a0wo0Yh+7zLGlWSpgb6clahUSZIdysRM69leG0arxxzw3xu6JmHPPGUsszr0KgF75qv2dYz8uigHPB/y4btR3h6in7d1/Kywr+1aNA3pPFySV/fz+eLJ6LKMAt9FM/0KmiAzYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G0q/2kgHWbnASannczhKIF63rVDJa3fNWQ5vG82KH4=;
 b=PzfjJMJ6XEir2IKgUcr4S/vLelfuiHTEg8iTUsI0GsrAtkVltDqr9TddpkE4wjJhu24du2237WpVtXLetf0BmZ1FW6DVNvcPyBbcRbdF74WANC5XPf2kIAQpqdXhDWdUfGOF84jmRUbYVqbe+DCpe+8ltj/tBV9cpKAjrvlH9qq0L9x3l61vj+KGvE/VWxcU/xmwUZIgXhDI8PtoIIio9j4TNW3u+0FqBatCcsjigUQspVUVzohhz7gE7KlE7/A+QtbB+QvwSrG9Hp8FXg1RdnHH1iceL4HhMzDfhn2odAeOymRMv5SwWHyKvgHv2TgiqZI7zplRFHXA34QhrNHtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G0q/2kgHWbnASannczhKIF63rVDJa3fNWQ5vG82KH4=;
 b=JqoDcwAz+85ejAqF9jYj9XgO97nt8jr3jc/d0ex5pBntFHOWL9LgTjMIcbrGnNrEdWtYc6MdsWC4Kp9yPxO4p8+mh0igoPRs+5Qsr4++GyhNs/2xYtLnpJHBkd4pSvrAWFiqzbm6QfZ7oDSyzxdua3RyZDsluiQQT3YH00Vi9TvnWFY7KEI3CLSuAAJfLzqFI5FaWvf9eCstDadMyC6xqzz9BMQ0TqViSwcs2Dab94rzpn9RsLY9TGOaHo7DVu5VuNZm6TxQqPYcCmvA+Q/RuDjJtsPg9a+iOygKguHrlrrk2gyA5ziv5YvxOCNxMPHObexSa64qCHIJc5wipe9PSg==
Received: from MW4PR03CA0049.namprd03.prod.outlook.com (2603:10b6:303:8e::24)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:45:10 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::f4) by MW4PR03CA0049.outlook.office365.com
 (2603:10b6:303:8e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 30 Nov 2022 09:45:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:59 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:59 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:52 -0800
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
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 05/14] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Wed, 30 Nov 2022 11:44:05 +0200
Message-ID: <20221130094414.27247-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT019:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: cf297268-0677-4513-0df3-08dad2b79219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFaDybXiIJ5IRkio/nevhlNt69d3KU85RMxR4+xhzDoi/UXkDCd5GSkH3u9NaZcpsJ1JCQhFa7i7A+zcju7jjblDOTSuh6+Y75IE/PrIPnlhUGIjhFa20BL2WgDFQKocqXCzAJri8VPlm3Z6RIT/YBsDur88qJk8HGhJ60oqMJ6CGJyU6U88DCy7x3HLMi9XPujza7MK6ZH5d24fyCE/suRw68Axb40j+ln0hPQTecAj8vL34+rq4rlA4Bh1S6knz+/JDo2Q8DzoJINM1hlsqdg0wykNUGHv4zQoAZtYoaRBiyRu4HQ65lrgkGeYo6nzLCtYrIiLMLm3qg33bCOfD4yhk/5mkXCCATZoxpCPQrBnp2W9myC2LppLQyypH9TekFsnT+iJwRoA6Rzf65tU6MNFKbzA+f5sNtaljGDVR+JgCodSHvNLE0chIUn9sMzQTd6tLC2KzEHExw33vJq1MhDPkYbSdk+WsMHfUVdf2ZUr68hHqFVNzkTL7PTDAvabb//uOY0aqfeTdmJMZx1VqmR4wiRhsxLKf8NockMj89Qn2v70rMQ23AvKKQYxPYboaJyMUmZw+pwoqccBEj3YMYnQaJRlknsfdYCIqG7i6wJzRzLFTYMpHnuK8j33fT9HaM7qOYo5RC9ouy2m+9X7XbQl+TeXkq1Im6hyXrE6pgwDC6PVEiuS3jFH87P34GHKsLdzcFMDJHPkVudzzvxR4w==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(47076005)(83380400001)(86362001)(2906002)(82740400003)(7416002)(7636003)(8676002)(356005)(40460700003)(426003)(41300700001)(40480700001)(8936002)(82310400005)(186003)(7696005)(1076003)(5660300002)(4326008)(336012)(26005)(54906003)(6666004)(316002)(6916009)(2616005)(70586007)(478600001)(36756003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:45:09.7372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf297268-0677-4513-0df3-08dad2b79219
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::611;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
---
 migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
 migration/qemu-file.h |  1 +
 2 files changed, 35 insertions(+)

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
-- 
2.26.3


