Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5E66C1A2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQE3-0002a4-PO; Mon, 16 Jan 2023 09:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDx-0002Xn-LG; Mon, 16 Jan 2023 09:12:34 -0500
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDw-0002Ob-1M; Mon, 16 Jan 2023 09:12:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku8C2R+UK+pkmnYzVJBmBPlEGPgQN7l5zYFaggWg3Xh2/P9FzuL3o54Pgr+fIkGgFX7SZZhfBmyMzS3tdc902gQelCAR0Gz5f771vz+w/Qria+HHmzyIXuB1frh26Vv83MV/QPmJMzT1A17PvZ7O6Cv3gaTyavjTtYZ0IloA6BxZ5itXaCzfReqRMuLz0tBVlZQ6/y9QphJD+AbTcS0ixcRtp1RNk/7WitT0HNzw1fUe1Fs0yaWCIikkCd3P2yGdecK/5GRYGKO5Cp1gkjQs9D5NRfOUDuZOpvfa25mDsklbaxWtPkgCdcy+EVmD9SFHLK5Hq6db5NxMSjSEOxiZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=oNo8peVWdaGOMayM93r2KelCBpVmvj1c287FE7FO3e5w81WUMqkS8dscbRRZdCZtsCZbSXeCKC+s3g3V/W1ytgFV8f+I9nM3gRRrhSploNC6wSqt+FES4W5kdhb6/V7gFqW2MgJuCFkPi15/fYAFhHNiMMoVh9AY5xA6w/bNzqSmnv0dmuicflFEoy/6pn3Mb19fW7CGiVbPCbT/4BgrUhWHSpaYbmFJ+vD5YTxCzOKd/xgrPEfsWV4eyJnY2sRe5m2NaCR4lCb8BA3tY50j3JEP+mcO1CY05bDZiA7wJywy9hQsWi2NZoiVB1AywPCQb1kilDHYirk2Bj5BZfmOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gbDXRaEOiBY6uWXt9eb1QtUOueN1xCxq3UhYzQuoM=;
 b=im2u2/E8LtsApnbRbwakMFwAeiboSX2jNV2i52oLfSO1r5h4159ftGlT/emt9OltWQUJm2vT+TX273uv9B3j8zeFipS0WlisHtHIro1I48lbeaK2CvtPZmkcvbRL5erN166IqZwIdK7Qjl1oLlHMH74qsTR3DnTCFHIwH2dABgemYnO0R0yvZMwAlXDVrSC50j+aeLfB4X1M7uhoS6jcqfGjx/RY6/12GUf7XpLOnAUM0sVDJ9xtS//8Zu/KWMHFD8Dq2q5dtQ+ZxuE4GxmQHxhjmiU35qNsw9YHMsZaG2XWXWDoi89+gWbjZyNzRlVY4jzUGsU4yGr0qSOnOgPRDA==
Received: from DS7PR03CA0262.namprd03.prod.outlook.com (2603:10b6:5:3b3::27)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 14:12:28 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::df) by DS7PR03CA0262.outlook.office365.com
 (2603:10b6:5:3b3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:12:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:20 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:20 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 16 Jan
 2023 06:12:13 -0800
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
Subject: [PATCH v8 05/13] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Mon, 16 Jan 2023 16:11:27 +0200
Message-ID: <20230116141135.12021-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230116141135.12021-1-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 354bca70-3b46-4757-82dd-08daf7cbb358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcVMy/JhYy3j4P3YdQOnFaXwfED3t5K54Yh9DQMVCs9vasesNK/JnzMF+zzFMrWtKY28QCctomEH2sfVIaHp6xNNX07I6LtPCOzhZWdd3ddFWwc+EC2Jh8VOmKYNuQU6qvzzIJP7rIWEzGIRd9Ku0qv5ZoGdg1asSXrusLE8miFbPgr13tg3Q6t3sgerhsSyiWWv86PiEn0iG+QCZ50DnGAOYIv1GUq89V6P6q/o7Zj/zJV5cxfJd091449FPFfACjpY+tJu7vArJzvUWD3ITboKOXB2jyRy+GG4xQ+jX6HC2JNhbsJIqgJlqC/lD2tvPqt6EfqfOHip0/xudPBilKzpZxQTZGgl9VR0gKLFS77YLEN6HbF8AqpKAS/vKGCGQT0m2oZKFQHLWpSGZ3IiuahmSDAUoAVavd0bjLsXOGpmqGbBqIr/I6NQBpYjQ91fknnPirRAE6EKCO6DF6+1ukqNg+kcPkrZpsCnn2D1SXo4X51i4OCX4ZoD86CQadyImsA95o5M+FhcTVzESTSE0t3Gnum8mgJegq5JV1tbuRiT7K4desEGXrR0U4OiDZS+6q21C9B1F9dHWO5wCz5lLg0ASPawqfYnJxNnOqlKzXtg/8A8oliRLPQmDTAs1QgZ0sGciYLHjHvTwxJMdKowf41gYcx0ZTSGOxEURDelcQP/c/gHtnzxSDXFoo1aazntlW9nZnb4RK/qECcm2fDJZw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(86362001)(7636003)(8936002)(5660300002)(7416002)(41300700001)(36860700001)(82740400003)(40460700003)(54906003)(7696005)(83380400001)(478600001)(356005)(186003)(26005)(6666004)(70206006)(6916009)(8676002)(316002)(70586007)(82310400005)(4326008)(40480700001)(47076005)(2616005)(426003)(66574015)(1076003)(2906002)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:12:28.4284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354bca70-3b46-4757-82dd-08daf7cbb358
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958
Received-SPF: softfail client-ip=40.107.236.41;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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


