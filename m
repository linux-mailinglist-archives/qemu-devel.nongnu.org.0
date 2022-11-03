Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AD618412
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcvZ-0001AO-TZ; Thu, 03 Nov 2022 12:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcu4-0000Zh-2f; Thu, 03 Nov 2022 12:17:27 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcu2-00083J-4C; Thu, 03 Nov 2022 12:17:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dwso9fYtjcpQRU/3Ct+TZmfHgZ2UEaxuEvAWHwIFluPC8Zc9YptxPyGUfL6ju2Bej8tXTbcdFmVXGXTs9GHCmBcsbiwj7Wk3P16nKpL3hpJSutrYpTTNuViHrJCRRSvbiLNn+F/eZZsK3DMm7e39+JrGQGpFTOuHmIjhYMLU6vrQXj/GJvhqDgJM/MXVDIGN1BkSJfOz6E1nzCCnHx3FsRCcvZNuwscwjurHlv5Zz1yUMp0l0hGvbwOMtMBjmdiTa3u60L8Ym+kmb4aFN+mt2OxovR1MYH42JXWsROohjdubR92F/XHxOZAxnsMT8nyKbbBteMfK2cubSFc+r+y1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9mrF8KR6IRzvzJw8cj21mszNev3GcRuLJlTAUyzvPI=;
 b=I1QpSM2REbiLV4yj+cx4OP2ayavDXbRmrynwFWVY2SLi356zFKb/EW5wR51ocKQ4nzp5u7uYrzO1VnRW+uzYGBX0/tNB1rtopa7zDv0fJ0qdxaKnzVyr0B40pEh0tXmiZ3J5wV/lqM7W6iTK1ZAwVsbMuUlmIy4zcDBYIE59LyEZt1ue3cN5HgKcqIzeuw4RoUqzQVK4DGhXSoUP7cY5sF0Cv8ZNjajKI0bjFoky5AQiA8IWXqB43TVM6zWZHMMe52onmEZ+KIRIr8hW4k5bTgqAAwoiHhH+QCU+FPItvDmxjtx10FYJwyv9g+wT+eyCbosHd8aPt6qIdRmrXB1M+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9mrF8KR6IRzvzJw8cj21mszNev3GcRuLJlTAUyzvPI=;
 b=iROZiz0nsCEMhEmK3kHlB1PH7W/Ah4LgEdrrs/6W9HPNGlZlxZjje1lfgz8QZFOfFD5LvehExBz9ktj3dWLzmmHBpJ66ouHEZG5eOkD9Q/L6PxxDw5KJwu2/Nek0KnVTfqLO+5fEU+wTP64UOIMVjkvEKs7F4/1X9OTkmqrUS5mykLu96DsAbe3WMInE3KOMmE4UrySznyKQ6oS9Hy5Lm68Yee3EDYWZ9ICyvsDDk2Chwd579bwXPsj0VGkM+zDsWpfsphBSW+I5P1N3m3N+To+nsQ24V+xUBlHRqwYsNc6j+OLJStckrFp6ayVJrpxAJ7MhpT5vjVqoaZ55rfBvLQ==
Received: from MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:17:10 +0000
Received: from CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::3f) by MW4PR04CA0169.outlook.office365.com
 (2603:10b6:303:85::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT084.mail.protection.outlook.com (10.13.174.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:00 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:16:59 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:16:52 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 04/17] migration: Simplify migration_iteration_run()
Date: Thu, 3 Nov 2022 18:16:07 +0200
Message-ID: <20221103161620.13120-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT084:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: ce366fad-b094-43f3-1e3d-08dabdb6dbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElJyjIbuoOCOlRi7GKPpmaeLAAbCH/AR+X3jzoHZear94hNqkLdRYMqCF+4hPAlLBlAf9hfxIv+8q3wW3WhxNowbxvzwFSM+8JJBnS/J+WMCgV6ZHGhmid2s9RrqKTrm9GCVfSzghuHqGgEXVuJdUMHImukr1D0dD3QWk0s+PulMdWmoaJ5DtA+JCqYxVi3SBgyN17TwwCFgj3w8UWnhHyoX3r8QQawV018P+UxwDHyQMMjpwnOMTHDPE6lu9IRfLTb+tDIKGW6NqJ3HjT5AscjjWWFF+0XRvv1xXsKNJulKpEWQWMz81i9OhRoP+0j5iDxnv3Vsa0IeWbkYe53mXzvvrBQwlcy01Lnu27QQQC+EtY/jb8qN3++AZ0K1RU8aHd7fkPH8RhtBvW9i3u/eOj5TX1jehKsRGsKMtByazIPMj9z5/CinFloASKTEgwQXbFiWYwY6xHRZKr7t7vCEr/Yt2iW701fbNl+hIvVASM2LgiHr3RtxWp/e/RpjH3DVojAdVm5J2Pk7PQtM/MOismT3WUvf8PmR9ZFnxL667hULnV+7o/bGtWojlkkmdlGjADyIeFPgIWDni8X52Bfk9Z1iF2Q2fcuIBlERYYecegTBKl5aRJ720JqA1YSNh3MRg9LDgMdw/sLA3Dw+A1RuA/WBxwLSg/CJR5uj68559XB8px5TSilA0s6/nc/HcRZxXFR8+K1a1qWHj3/+ZPf4G8tFk5ibMAscjnSuWN80Rfl55kN77OV5CY6iMO/sDyYnNy/O6M6gzpqRKzyO4y7UAQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(82740400003)(41300700001)(36860700001)(5660300002)(54906003)(8936002)(7416002)(316002)(47076005)(356005)(6916009)(7696005)(426003)(2616005)(26005)(186003)(1076003)(336012)(7636003)(6666004)(478600001)(82310400005)(40480700001)(4326008)(36756003)(8676002)(70586007)(2906002)(83380400001)(40460700003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:09.7512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce366fad-b094-43f3-1e3d-08dabdb6dbf7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 migration/migration.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ffe868b86f..59cc3c309b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3743,23 +3743,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
 
     trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
 
-    if (pending_size && pending_size >= s->threshold_size) {
-        /* Still a significant amount to transfer */
-        if (!in_postcopy && pend_pre <= s->threshold_size &&
-            qatomic_read(&s->start_postcopy)) {
-            if (postcopy_start(s)) {
-                error_report("%s: postcopy failed to start", __func__);
-            }
-            return MIG_ITERATE_SKIP;
-        }
-        /* Just another iteration step */
-        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
-    } else {
+
+    if (pending_size < s->threshold_size) {
         trace_migration_thread_low_pending(pending_size);
         migration_completion(s);
         return MIG_ITERATE_BREAK;
     }
 
+    /* Still a significant amount to transfer */
+    if (!in_postcopy && pend_pre <= s->threshold_size &&
+        qatomic_read(&s->start_postcopy)) {
+        if (postcopy_start(s)) {
+            error_report("%s: postcopy failed to start", __func__);
+        }
+        return MIG_ITERATE_SKIP;
+    }
+
+    /* Just another iteration step */
+    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
     return MIG_ITERATE_RESUME;
 }
 
-- 
2.21.3


