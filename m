Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EBE63D27E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:52:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JeE-0003D5-Ro; Wed, 30 Nov 2022 04:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeB-0003Bd-9M; Wed, 30 Nov 2022 04:44:55 -0500
Received: from mail-bn7nam10on2085.outbound.protection.outlook.com
 ([40.107.92.85] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Je9-0002pB-Cc; Wed, 30 Nov 2022 04:44:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY4f914UaHUwieS9Is5pOAYBUJ4Jm4Tosu+aJP2sh8Z/M9mVTNThvuvDcBZtED0NrbLAAsdaeQxZPCk51EKoutvoETsjwCpYWS2WfUihXz6/3fnqzFLxIsN1Ns8wbO2vWyb745F7TSPecB5fQU2xuckrl46DCMSHW5AtxNwJ75nzVPl1+lvwW7BUeXVBp3GcPzf7TJUZR/NtOLFVhCn0Vaxj+hSPX7GqNQx+V8NibI/BV5u4ix/75nxl20/ktozyhoYmMoJugMRfQOZBEoJPLP0m8N5cGUMrWjKCYiS0fBFhCpzbBcbEpxh8Z3Kemq5VffW0O7PD1R97o2I3s6hNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52W7DrAvGtfkkmAVsehdHAR6WaScEEdNPK/GKFFLxHE=;
 b=U/q8JLBjhrmUGms+/H8CAHnY6Y4yiGqZ8rBwJokBagf+dDtEKFfAr0MRVFrboF3ealIgiLbHsdqXqyKT2sZiCXZlO1GbAHVHs08l8Y94OUrprYuaraLVNOTBxqn4tenxGDZ0EaHGXb6sUGRP+X610+ABzefhwEZeyAsDKK30TowpHtNoLpn01GNC5IO6gB4/OoNavDMMxN+Uuan9rrATqzII7qc/iXMAySJmlNxX9rslLbgTF4u/LNWtn0AAMpePbQDUzF76vfWjW818x3NxtROHFbZNDIjeeC6RlAgS23eVij6M+Nz0d3Vu1NSL4C9apM+xEWgDWph6tKdWbWFfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52W7DrAvGtfkkmAVsehdHAR6WaScEEdNPK/GKFFLxHE=;
 b=GdVCbtjN1jdudPG6pSEbYOV/u6mp6VS2yt0uWWmzk5RqpLEcv0yU984wymq7vaCMJDIIz24dmHhQWXOsrAkN5aC3OUs08umoordCU/WWYkt0zxqYtj3Y4aZhyzWBlXaacfbLhEvH0QvkTJu7RemZoutVo9lk/pfGRdB+YQtA03Ts/uDoawFg1nDPJratF7To7rFIe7bn3u047dgFqPD8RqSKLc8uYw8ByopG+pNddHfdYiyqZxCrUV2SCJnYnoNstje6r0NGO7U4eULp9gDgFiF1+C8dzUs4KZ+Q9soZtcJAcG9QiY6qzavAL47UjVFLZJrxis3Ol5ML1kaznqyo2A==
Received: from MW4PR03CA0221.namprd03.prod.outlook.com (2603:10b6:303:b9::16)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 09:44:49 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::e6) by MW4PR03CA0221.outlook.office365.com
 (2603:10b6:303:b9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.18 via Frontend Transport; Wed, 30 Nov 2022 09:44:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:37 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:36 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:29 -0800
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
Subject: [PATCH v4 02/14] migration: Simplify migration_iteration_run()
Date: Wed, 30 Nov 2022 11:44:02 +0200
Message-ID: <20221130094414.27247-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: c741d341-2fac-47ae-67bc-08dad2b78604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8DEZyEgh7UrfTzYxbTV86stS2RVQkvFzpzoHAThMy0HK+WEa+OZOUWUPSc6CsYpS+eSGqmip1kHSDZ8kkXyFLkV6QZjIs48j8l/dmQ3FdVk9yTRiv4cKrC5PQHFqHEUQ0QHRRtJL8GgnA/7EdlfPs9xYmYycLYOblWRq4Ssi8EiiXz98Nbtffinvr1ulfizKWu+1wybSXrD9KrUb3ZZsdg+DxW66bUpNISWqAp5gi0y6u5I0y3Ky8b7uMiRl9s0dr+et4+ZlO77+r+G4CfIwT9k40kBw6OeUw7iOHfBZORPbwAsI9pIzx0hJ2KBaUk9netgPMDL15IQ8hraVSg9FzNh9u4VdmgKBb/E5zqq5leXS2IKxdzcWspOk4YJFvzxvLWAEmHSfCI6fug6I16y+6BhUFqlllIFAJcgsu8gE1U81Vi8ylGHiA2PcxeLqpSrrhRZ/id7z9UFp6FQVPXlA9awUmJ/B6R7wrTSJ0lO/PxgsMv0rcJXltRg0OWFpF8UZtCjZ6XC+Rza/Az/0gjkL20/AybCtq4BmPY4yRfwHmhyt+E7ckKb8ar0YHh7eUgeG7HdQPDjUvY+TbzULUoHfT285OBtbFf/Va+91lSwLdyLOW1SGCgRpO0GHn3LV4zTZI4a+ZRtlo7DTXBrmu1sWyYJX7C9BvhtAtrIQpMpxX/DajXCXHSQ3blu9nMlbwPfozjIgAWdVKZiORBCMo/EljQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(7696005)(47076005)(426003)(86362001)(6666004)(478600001)(7416002)(36756003)(2906002)(40480700001)(356005)(40460700003)(186003)(7636003)(82740400003)(83380400001)(336012)(82310400005)(1076003)(4326008)(2616005)(70586007)(41300700001)(8676002)(70206006)(6916009)(316002)(26005)(8936002)(5660300002)(54906003)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:44:49.4067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c741d341-2fac-47ae-67bc-08dad2b78604
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
Received-SPF: softfail client-ip=40.107.92.85; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
index edefba954e..630e4af02f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3763,23 +3763,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
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


