Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831C2F8F7C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:53:00 +0100 (CET)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tVD-00038h-CI
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQO-0005FS-Ah; Sat, 16 Jan 2021 16:48:00 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:11232 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQM-0007As-4w; Sat, 16 Jan 2021 16:48:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrLcok06vL0SCnneUBLInXkoc7pTG8FWHWXPfYNG3MKSxzZre+1b7m5YomeqEfmxK8Sgw8O1QLFF7F3MMjcwhisw7iNSeFJkPQJXlXH/JjKvfiJqNSQkAM5alTkmHW0AiATBxpwXtfzHqBKo/xru/4YbHIMxat9FYMWj/2PVT2Q5fvObLRmE7v6SMtdYKtq8q/Maks3LkKvXfsbuZ1DG67n0Fcee5DQ0NBFkK02cngDQEXqFRaDUW9z+PII5miYJ60HmdXCYfQ+vxUC5N9Vqk3mGCnMJNCsm/ZIKCIyaz+Ha0RR017JF+5c3tC8Db0+e+DfphmBmlHi3iizOSYvreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICMILu8YfvWDBmmg7LSbUDT7XKbldkyGYymaKixavxA=;
 b=RHukgef/V8Sdcak4Jw4KgWhJQrlAsNdWAMxDMyrse9N9Od18OZKjL5LcXzqVs0Eix38j3nAfcoNnbHCD1cmNnv3+1zReQ5O6HOjUt8eVc/hshW9vYJpctSkI7XwqgwbTt9FZs3uY6/6SQhVMOP+bA/mxgCQI4wTuN5HSTUQXOMjlvNlX17bzEfnMdntxKbIbFH+8L05MMADl/rMzYCN+aEDqvLhSGmNcaqYGNvRAMPQ7MPCnfa2IUpgCMoFCWZNr7kaYwcYb+YVnKhD0T96aemaoDRGbe3Fs0Y2DDlUO1ONIlzSwZtYteyJdubN6aWthGo/FyKojMv53MbNAtivO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICMILu8YfvWDBmmg7LSbUDT7XKbldkyGYymaKixavxA=;
 b=ATtK/HQ3NINhSdZfEbnqkRIVbR6gw6FUOQOM9ZlqyC7wRDDeIJ625d//cdn/cRd9GBlxUGTMog1hKC9VYR2y6awlEvtIRi7lvCJv0h+hQcmt08ZSuk0SOpWKloO6AuQMudcMlMXkdD5l+Tkk8nmX0B5Hib6VCDy/IH9sIr85IUk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 10/23] qapi: backup: add max-chunk and max-workers to
 x-perf struct
Date: Sun, 17 Jan 2021 00:46:52 +0300
Message-Id: <20210116214705.822267-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb0dfb83-dafb-431a-7672-08d8ba685f21
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35424B31EB8E523D8A52CD31C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxlJtWNyUkxg6m9GQqMOVeDiNIcsw6f3oXoRle6Leka8g6gcuO5vSumgSY5d77JmvF9GkHkLHxRQpQMYJTztJU9O7bp4cM8T1uH2KI8KbDi8gspEJREkG0Bd5TH97LHeqH35tEfYQQzIJUzB5Oha4ZH4EuQ9PF1dzIzDjWptqrrNmrp4Ig4bBlGJCDlnmA9KGkgcuRdL47px/pfcPOy1Hr6RJyebuQaMzFcACNDU/1SNTWBwIoDvrViBJvidWspEBTrbemGNX3vEqlgXBSdyHMfmHhI9f8GTdguadg2L4qHecCsZjQ3cg5hMJPudFKD7oYLIWlAb6zG2EDnRZ3EK5qdeutASO1XxDnBRqJHGt2auVxlqnrvAgQKfu2nteo7TPkQ4vDThr8h1W2x4iJrCPhGwPXMYaZwU6T8hSU3+MPKuVoMjN8CTiD09TSrYbjXl8VbCEBUldjQJDa867A0AsXPmQ+bAkOz7vp2IiZEw9KY2ns6zRi1gAlMFiv1wYtx/gdtuGCrKEiZNN0JS+7mvXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T9jorjoKvGgNOBEKjzrR457Dyja4P41yoHNrO9fBRJA87BNX9Zv6B/u2GgtC?=
 =?us-ascii?Q?qJMaUqkWYae+3DVybhc/orQ41+EPxVXRBW8Qn+dFoZQ6Rc3a5O0j8sepHQV0?=
 =?us-ascii?Q?4WEpwDym1MkYz4G5xkT3Z1/A9jfYN4Y7Fk0+KExbd1BOiSg74EOM31s6o5hN?=
 =?us-ascii?Q?BtxpaHVkFagXR9cgkzUxM5W9Unjni9wgYTbMi/98czsMkRc6KSa9Sh81RpbV?=
 =?us-ascii?Q?X+llnt7TiJWbkSeQh3zVrzROGqcVTq1Ip19BRA356qHJtzpnHCCuDVtHLxuQ?=
 =?us-ascii?Q?gRB99RDN9TJx0gjz7pqUaoCT9FadobS7uDSGvj81EvrupcOPm/BsPgxpLLzO?=
 =?us-ascii?Q?RN0DuumyBE0YKhanZ3HsSMC5cz/nwLOWbLEo2nLU/jN6YlhDvd+76HjsTFlb?=
 =?us-ascii?Q?B0YvYgansiLgsE5+avC/0WQCOrqRhCxjdU6qMLm3QhmhXPY3nvN+f6msBt1s?=
 =?us-ascii?Q?LHqpZceoNgUnY6fYdxhZYjTTyHzUZgafkRvVPCbTqcB6bbEZ4tMecS4ibieA?=
 =?us-ascii?Q?bnxADWcCL1xAyRmqgRZVfBWvjutobyIKSwzCYgF2E05BaPj26eFp8iBXw4ga?=
 =?us-ascii?Q?8uOYl+oQu440UqWsR9U8VPsO+ipfjVRQDu+yxoEXvzpzkmPMRE9N6mxg7ZeF?=
 =?us-ascii?Q?df687aavXe6tgsoNC4zaCb/0vCuL0sh32NvhEwOpmPyjhla3vDfiJbTfFgoC?=
 =?us-ascii?Q?XKZcgV2JGOk7gw8H/92CPjEYPIf35vFI6mxXBkEYejU7EaSQhb9EkiEyVgum?=
 =?us-ascii?Q?VdPd8kESytyTa81pEs7AKik6z7qSxaNftLoYnFN5Yr9ennTSMZQEcv6emhEf?=
 =?us-ascii?Q?SKmFCtXvqD+89RTk/d790fHD4ixUQEi0nt6fcq4cKahP0Hz33A/9GTMLrC0/?=
 =?us-ascii?Q?4+7K+kYxT8eCUHUTGMDaDXssFJpBudvuXpIAtQdxS2odUw0KNtdm+kE7t01v?=
 =?us-ascii?Q?fLBtvaFupZRBmelwYQmMR9ZkBz5BvmLLvdJrLImVwEIYLprQrJ/H66Qe5Plj?=
 =?us-ascii?Q?3jjt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0dfb83-dafb-431a-7672-08d8ba685f21
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:51.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uBAI7hCStlGzu7AICWRiVx4hOgEynxPkItWX+IKUR/hoB0utZxgiXYYDzw+t3CpzjV49qw3mGo741HSyr0q7djFQbLfKqMoUz+Jl55JiK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new parameters to configure future backup features. The patch
doesn't introduce aio backup requests (so we actually have only one
worker) neither requests larger than one cluster. Still, formally we
satisfy these maximums anyway, so add the parameters now, to facilitate
further patch which will really change backup job behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 13 ++++++++++++-
 block/backup.c       | 28 +++++++++++++++++++++++-----
 block/replication.c  |  2 +-
 blockdev.c           |  8 +++++++-
 4 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index d161b099db..c0e9d119d2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1379,10 +1379,21 @@
 #
 # @use-copy-range: Use copy offloading. Default true.
 #
+# @max-workers: Maximum number of parallel requests for the sustained background
+#               copying process. Doesn't influence copy-before-write operations.
+#               Default 64.
+#
+# @max-chunk: Maximum request length for the sustained background copying
+#             process. Doesn't influence copy-before-write operations.
+#             0 means unlimited. If max-chunk is non-zero then it should not be
+#             less than job cluster size which is calculated as maximum of
+#             target image cluster size and 64k. Default 0.
+#
 # Since: 5.2
 ##
 { 'struct': 'BackupPerf',
-  'data': { '*use-copy-range': 'bool' }}
+  'data': { '*use-copy-range': 'bool',
+            '*max-workers': 'int', '*max-chunk': 'int64' } }
 
 ##
 # @BackupCommon:
diff --git a/block/backup.c b/block/backup.c
index 09ff5a92ef..5522c0f3fe 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -388,6 +388,29 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
+    cluster_size = backup_calculate_cluster_size(target, errp);
+    if (cluster_size < 0) {
+        goto error;
+    }
+
+    if (perf->max_workers < 1) {
+        error_setg(errp, "max-workers must be greater than zero");
+        return NULL;
+    }
+
+    if (perf->max_chunk < 0) {
+        error_setg(errp, "max-chunk must be zero (which means no limit) or "
+                   "positive");
+        return NULL;
+    }
+
+    if (perf->max_chunk && perf->max_chunk < cluster_size) {
+        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
+                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
+        return NULL;
+    }
+
+
     if (sync_bitmap) {
         /* If we need to write to this bitmap, check that we can: */
         if (bitmap_mode != BITMAP_SYNC_MODE_NEVER &&
@@ -420,11 +443,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cluster_size = backup_calculate_cluster_size(target, errp);
-    if (cluster_size < 0) {
-        goto error;
-    }
-
     /*
      * If source is in backing chain of target assume that target is going to be
      * used for "image fleecing", i.e. it should represent a kind of snapshot of
diff --git a/block/replication.c b/block/replication.c
index 22ffc811ee..97be7ef4de 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -454,7 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
-    BackupPerf perf = { .use_copy_range = true };
+    BackupPerf perf = { .use_copy_range = true, .max_workers = 1 };
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
diff --git a/blockdev.c b/blockdev.c
index 84685e057b..6db433cef8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2794,7 +2794,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
-    BackupPerf perf = { .use_copy_range = true };
+    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
@@ -2823,6 +2823,12 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         if (backup->x_perf->has_use_copy_range) {
             perf.use_copy_range = backup->x_perf->use_copy_range;
         }
+        if (backup->x_perf->has_max_workers) {
+            perf.max_workers = backup->x_perf->max_workers;
+        }
+        if (backup->x_perf->has_max_chunk) {
+            perf.max_chunk = backup->x_perf->max_chunk;
+        }
     }
 
     if ((backup->sync == MIRROR_SYNC_MODE_BITMAP) ||
-- 
2.29.2


