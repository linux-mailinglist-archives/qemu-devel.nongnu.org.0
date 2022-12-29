Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A6658C07
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:05:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqiC-0006yQ-PH; Thu, 29 Dec 2022 06:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiB-0006vu-1j; Thu, 29 Dec 2022 06:04:35 -0500
Received: from mail-co1nam11on2043.outbound.protection.outlook.com
 ([40.107.220.43] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqi8-0006SF-Dl; Thu, 29 Dec 2022 06:04:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf/+hkf6M/P0OoVF00RvErTD3bpOymS2K94FJ9OyftPcAt7Mll1SrCtG27Y+gx63u9Q4VjRkGR95O/OgpNcwQ7bS6KLG6RR72y2P24EuB+N1QPNEPXPXcEfSUxJGt+UbxeIWttj6Pdt9QXim2f435Vww2GL8MURFjFeEymJCUJpioeWZGKd/Kb4EdZwAYzGQEsCIGoomfWtFsL/Hyb2k6XBb8ktQTERZtxorj3cyzlrmKdRsEsZ/oKM+Hu7A6uWa3SB4JkCNkgqUOGC9odXh5o/3OPZv2LA0jdrwrHxKKpVOIfO1VTXu4gX+tDgJ65QrafTgrYAx4T4RZaVxr8TG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxExRPG6v8cy/0WdHjtGA0g8CznpROkIsPiYgp+2XTg=;
 b=cXaobed2Hm22zr7v/9GROzzdcVa4cEjlWqAWsZbOlc+vBxULxouLx/kAqWDFiIK9mwBp4CXgZ7rkV2ah7KA2wo8ldeGTJhdcGACw1+nyeRQdK3mt2OAVdfPvspHSGiIacYDb10jeOfIYPTOXtC/IOAz+FViLfWMka+dDcqoXPdkt9Pfc2L8ZCp5XfjMMGqx/gkWqOvZJYAdXo4q9/4IUzj2Yi3OCfX0ONQ8bb54e37QBFewD5EOxQQm0gNijdaU1CLiHdxSY035/ORz9MMYKtsZIzrCcVE8GCLMOU7/upTj9fS8NIZD4OPboQRWv21RRhBlgUR2FCjS0l5MoDxoGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxExRPG6v8cy/0WdHjtGA0g8CznpROkIsPiYgp+2XTg=;
 b=r58SAFm+qbBJHVYj2hyGS09oNwp5c2lSeYTSu2Qzded4ELTXFAXa5YqBlCstTCqhpFBq0WlXIxPektYiR9Hnb/WrKxQDvr7hZElFUbNMVwLBpGFZ06PlVZa8yxzb3IMWz5jnNkWPtzJNtd75mmtCX9/tc9k0bXSwgNwWFJuItFsvxOQE9cGhE8IPbH3o/8w5DkIy50jeNWI9HOHPEpZtjTc/kgTN4QJ2LOvbX/U/xDHewY4Fsj9UVrJMDmWoAQcneUwxK4WUygErwrjxruDIqbKyce7PUnrUS5Gvz3XwHEPq9V+H4R9VbU4L9PKP8G4aAPxL4O2tCQEdQuBkuKyaHA==
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Thu, 29 Dec 2022 11:04:25 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::29) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:25 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:16 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:16 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:09 -0800
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
Subject: [PATCH v5 03/14] migration: Simplify migration_iteration_run()
Date: Thu, 29 Dec 2022 13:03:34 +0200
Message-ID: <20221229110345.12480-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|DM8PR12MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 56018dbf-0a72-4324-fa05-08dae98c72cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPqXbGCS7l81cUVIJC0oPnemoq1E++5hw2uVgZ9wVx64BJp/1jYgiVb+b52jd7+DFXsWcy9C6btUbRoLWVdJJobWhaMov19QBkCCX2+i6NAvK8tJs68nEkSowRcx7UbUHx82+f4bP7IGLt7Ah2vhN5mnkrhtxcq6Al5I2wknqbXBq/HWEV3tkDh/dDhQpBO9/8wbtMiKq+05u9MawaxbRjkH/VjQ5LGptLomvwtx48FkRsrBmSoZJ83L8UxIdii1lfj48NBgRYrVnFWJ8br0bGUguwBd8V7LeiXxcyBzOCnD+xSEhoH6SCvSOljasKIUbi2dlZp5XlqrimCmmyu8eiW3erxfx1+KstEFPOcSiPMYAaW6aidP6hhLMrg3xGC+pxCyg46B3i9mRoHnk5YzlNoDqAEEM7gDvEabFdIF2ygqfbqvo3XR5NIRfYl0qZ2G/OubhKb73NASjsAtGIEYgk66GY61OW3XkZ6Xu3GSCrt2Mbs2Bi12NXFX1zACbun8SUUcaoWyeQ03uALbY79WVbwg0gBRFw24TcA+MzLl/hdrrBjUmOMd4NNeepoYrPhBuES+TfzpcmmRI3YoGCUBhX36qfjNsYR+Bf5VxkX+0NkCL4re8IUa/vlF3gRSpOnzNt4yLgdIoUpeFc2BwtHlnG/LzaMJyQlwJmy2rF57VvdiAsr9YtFR7BTDjZtXw+TFkzCzTBmWGyVcYb/a1ouNtg==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(8676002)(36860700001)(70206006)(82310400005)(4326008)(70586007)(7416002)(83380400001)(40460700003)(316002)(54906003)(6916009)(40480700001)(2906002)(86362001)(356005)(47076005)(426003)(7636003)(478600001)(7696005)(36756003)(6666004)(336012)(5660300002)(82740400003)(2616005)(186003)(26005)(41300700001)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:25.5513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56018dbf-0a72-4324-fa05-08dae98c72cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
Received-SPF: permerror client-ip=40.107.220.43;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 migration/migration.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9795d0ec5c..61b9ce0fe8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3758,23 +3758,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     trace_migrate_pending(pending_size, s->threshold_size,
                           pend_pre, pend_compat, pend_post);
 
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
+    if (!pending_size || pending_size < s->threshold_size) {
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
2.26.3


