Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E376E6F31C8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:04:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU74-0005Ck-Ut; Mon, 01 May 2023 10:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6t-0004zn-I6
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:36 -0400
Received: from mail-dm6nam12on20626.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::626]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6r-0006gi-FE
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT7YUeB5oQBo5oVFqNV1qZiCdkA5JjCR8/kxc4JHyoJ/L9lg6HmVsFEGE7PBvdbEgCk+55O9HfHXxfEo9sGfi2bAKlVb6yVHrCNBs3lB7pL2ptJ/2hh8IdhxaLRwFS2w0BTMWKRJM0ShQREb+v9VhERkWKDSWakf8G6NhBVmIn7MEHD2ng98KEREV2q1JlHicsjOA0qhigXJdcTmDCVTJTyZBgezmuRRzrNsQMf3qN59ZR4N6jl4Chr8DNnEjabuSfZAAfXu4gsw5iIb0e/skZSHGPq6c+T/k2Tb3Ql0VK6WBKID59cFMhrc4N3k7duy7PUfMtnv144j4QanPFRXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mlkwswwEYDXeDfwevrgq1hri9O7HNKvLwcLCvotfqE=;
 b=fqxAmJj4UncWfBlXeNTEqTORIWpnR0UBEPc/gj7fmncMEKLaNIF2kILCMuC2l+UCeeHRm1xlr0u7VmeKCPC27iiay8EIxCAFmbyqPOXj3FRQZvE/AVKTLVRcSRAK0Hw7ssihhWjvV39z6ktW86zU+LWx/X3hy1eylOg6oJC6uPI6mU4ty0XxGoDNaH+ktHN/djItqJ7lhXBxDFLREKwlnzJd5EGU2FeLaqRpwF2ZCEn6x/UikPP4U5geVVCNxvvS4TiC0QDebaVcqlU0e5wsPAFke+UomyqQM805+ehShSjZ4xZtOgRVRc0OxtyUfcLdIhFl36+cpjHc24PI6byfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mlkwswwEYDXeDfwevrgq1hri9O7HNKvLwcLCvotfqE=;
 b=aQVDGcF6tVbpt+55uRFy106wwFu6kwRLboxCSQ00YhLfkyowXuUPAt4VSEGsEJAZmFRquCl9ZicLQjTi5rozgK/bCK3brf/Tt//12EwNBE+Hh9uAwQe9K9/JzIcqREamZ5EKRtLBn3CxqyslqXXc/ApmcfojLdHeN8ZRH+KgoKtfGKb4LjItrGOUSSA0zAKJ3Ycbi8Av3Cs46lBKZUyvz4+PgKIDuX5zcx1+HC9Eh3TGedo8wrQvBVGHpSaHsQG7/obLtpMHiyAGi+2AT6gT7h54MkbWGPLdcM6dKh9VNUYhImO9/JJ8KusSUFo/9pvlSXzdNlgGOaKaAv2fZmZgAQ==
Received: from BN7PR06CA0067.namprd06.prod.outlook.com (2603:10b6:408:34::44)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:02:29 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::79) by BN7PR06CA0067.outlook.office365.com
 (2603:10b6:408:34::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 14:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 14:02:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:16 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:16 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:02:11 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 6/8] vfio/migration: Refactor vfio_save_block() to return
 saved data size
Date: Mon, 1 May 2023 17:01:39 +0300
Message-ID: <20230501140141.11743-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT037:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: f42f8601-f87d-4a8b-c277-08db4a4cb368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hH+djy1OZDEEZOV+8QOOcxUS8khNPkeZSRKj54yWS9IG7cDhzWLf7wGsuFUC6ahg3TG4Rh1bpS538mK2w92aqBT91iBi9HB42ZG3N39Z0frifoR56AMkVyp7dHo4PRu2s58mkg/Olnt3jTmqt2O7b53eTvi+Uqa5daFOmsD4vBDkwDJ4jlOW/4sOCK8PWQruhkdrXjLHZoxGxCosofLnWBCBB4s1H9yEHw+jc+I9oEaroo7Sg5VNkrl3t6dhDCU0pc3m8IcYhJ58oT7JNAHScRWBeJto31khtB/n8cUo5LYhSCVgCqca3yl36ywzgCAOrQuOpsHxDbi/aJyID81IaHwvGoBdXY1DoqDAKsXl4qd1kyPL6qJQmx+umotwxhNeOO87ivm0yZwUEiiUJpKfKucHi6kWHE7fsBtT0siMgV566w8qK7Ie/VNYHbIARMs+bKEd5P5JUj7dcX1uiQsU6WckCoSZXaN9WCcPh2A60jYiqd5+rddPQ3/elUnS1yb6OtoIOoD4F6IHOuFZOnoV6TEEZehkqM1UsQ5R9YzCr117xcsGMy9Y0B4XkIJ1zaw4vAd4D7oixchUgrCDh4GiYZQXhxtg0sKDKH3dnXBn7hhqr4Gw+ump0Su9hQ+WBas0WOdc5IB73O4/pvLHZmngjew5jy6tPk7DDfDBSPwY7/iqUGxxNLbIKO4gko4vVIDgqp9qG2l8oLJsEM5xaATxQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(40480700001)(478600001)(70206006)(70586007)(54906003)(6916009)(4326008)(336012)(316002)(40460700003)(426003)(26005)(2616005)(6666004)(186003)(1076003)(82310400005)(7696005)(2906002)(8936002)(41300700001)(5660300002)(8676002)(7416002)(7636003)(356005)(82740400003)(86362001)(83380400001)(47076005)(36860700001)(66574015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:28.8983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42f8601-f87d-4a8b-c277-08db4a4cb368
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843
Received-SPF: softfail client-ip=2a01:111:f400:fe59::626;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Refactor vfio_save_block() to return the size of saved data on success
and -errno on error.

This will be used in next patch to implement VFIO migration pre-copy
support.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/migration.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 6b58dddb88..235978fd68 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -241,8 +241,8 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
     return 0;
 }
 
-/* Returns 1 if end-of-stream is reached, 0 if more data and -errno if error */
-static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
+/* Returns the size of saved data on success and -errno on error */
+static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 {
     ssize_t data_size;
 
@@ -252,7 +252,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
         return -errno;
     }
     if (data_size == 0) {
-        return 1;
+        return 0;
     }
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
@@ -262,7 +262,7 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 
     trace_vfio_save_block(migration->vbasedev->name, data_size);
 
-    return qemu_file_get_error(f);
+    return qemu_file_get_error(f) ?: data_size;
 }
 
 /* ---------------------------------------------------------------------- */
@@ -335,6 +335,7 @@ static void vfio_state_pending_exact(void *opaque, uint64_t *must_precopy,
 static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
+    ssize_t data_size;
     int ret;
 
     /* We reach here with device state STOP only */
@@ -345,11 +346,11 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     }
 
     do {
-        ret = vfio_save_block(f, vbasedev->migration);
-        if (ret < 0) {
-            return ret;
+        data_size = vfio_save_block(f, vbasedev->migration);
+        if (data_size < 0) {
+            return data_size;
         }
-    } while (!ret);
+    } while (data_size);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
     ret = qemu_file_get_error(f);
-- 
2.26.3


