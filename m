Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB002F8F77
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:49:45 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tS4-0006yq-Vx
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQD-00056t-JD; Sat, 16 Jan 2021 16:47:49 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQB-00076Z-Bl; Sat, 16 Jan 2021 16:47:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcH0ZSKVds65ZiHb0P3VeqMvBmguU9YWl3prK92za9y/FSL0sLrPGwoAtQ7071kbgW++W9o6AJh86/ORx3vgOSbklatglJoeyvb4Ux9l+gzb4QxZyvnZOsiG3cdusLAg5wCH1NOLg1h7RrJ8lPUsa0iepkFJyscWPDHe/qAbrR7rTY4BiKZCfkWbjzgQhDejDf7UMlQB7jEQ3NNhV/vcdB6ot9rgi8P3KGAOq+ts5RIXmNI+qHYLZBQ4ghz1WKGL/ZWCfZyZo8OcZACjgVFBQxk31lWbAaQOmdJ6OEmiEOqS0S3XCS43Uir0FQAEVWqD9LjEhQuqOM9UQCIwVKXcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30X0oaUGxJdHzF8aoMtjxUvaTWGbX0mLBdNvbI5GoVo=;
 b=ICbhyau43DmU576t7j2okoZ7ODXrTg1G/rhlBhhOce183RI0Emh13AFKZsGn+B7Pp+pKMdyX90+XOvsgrS1LfL8K29srQLYm7hC/GY85MBxHpbbxF2SaZ3zc0Ho++wNKaBhzQlZ9QaXyz4q1fRMIwr6p62Ux7YPE0fN+wD8C0SCtemSPtAd/MzjAWcXPD5P79onVxq/qBBciXyzwAOBOnHXZDaPtw9dtaTxlS3WGkIj6rvJMJStBpU6XsSQUnyafx0U83zddvwmRcyhd/gF/ok2VFSxXYuluVagtJhczRkPmQg5CI2BPugGpeaCQ2mPBh2iZW502Ff/fSva7jZYfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30X0oaUGxJdHzF8aoMtjxUvaTWGbX0mLBdNvbI5GoVo=;
 b=u+oFU95mK9DB6F34073jatuyS2YFrA3b021D79wUcj1zT6sakwRN80Jb7L0xL9mtg7fYOXLL+0x+jifTByCdEJEYSFNcYyhIZZXaU3fDVrpmuyPI2NDFs/9OsppKHbreiN36R5urZ40/qhb1PlcLhhHX8O0L51fQFs4N83tPPQw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 01/23] qapi: backup: add perf.use-copy-range parameter
Date: Sun, 17 Jan 2021 00:46:43 +0300
Message-Id: <20210116214705.822267-2-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 21:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d1e70a-e6ef-417b-b327-08d8ba6858f6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203314BE396C0EF06863EA92C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOxty+l6Cai6SX53gCKQNZSuyjAPbAx51RF9svcnkvq5K0AtEVas2tyaSpDfhENchjtPGETA8VhXCfLaSY8sQUUzsF1OIK6xrgB/UN9Dd3TWm+iWwOvJVzILyRPgi1rTFPPbXxRphsJxT+jiNIIMdk6gv7aYU87+FrDNHwThY3M7i8elQHtEtHaHP53qcjKVv0LDUwKmk8D4JWE66IXGdkm5rua+GKjbZTbx9lIKPepcU/WhgmGcrpCIAk19hf2xOx7knMcn5ppUro8L21qs2/dC07NqaYiz0I4Fa6CCSjXNsh/r2qldHsSX9yiYTzTby4pwau/d8ZN6ZBK4BB8a8NIYBL3Ko7KcWHFZU5Nor7siLeMz/nzWeQlxWlniWykk5beeMhc8mshvjBcgd10mHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(6666004)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tC3jof0xbJGvrHvLtEGZYtwETSalGt6yz2MW3Fk+ABSefzgIEJ21OTrtc+Ko?=
 =?us-ascii?Q?jKCVDywfMT+fkO6NHA6tRhprD4x4VjvnIt8zQEDcCVjSwoOqPLSBvdTO7mxT?=
 =?us-ascii?Q?+CEYct+nxBRkzwLl60JOiq3EYqrG2aPxMMvKGHlXnFKx1dluVWSZ5S/3FRxo?=
 =?us-ascii?Q?6Mahu+lx/kRjZIE8I+Vgz35D9kuu6jBgkXHdeIHfJePwAEXhuvVXMeL1cPig?=
 =?us-ascii?Q?IW2AIBbh8hdhNRcueQaouYgAo/xwAWuTzN3d1xYhNOPPCyoPt3NcorcaHUCC?=
 =?us-ascii?Q?sOB2q8V99f/DdOmqqL/7byUkkQRHET51VkKPQB0KsvmziONkkeRB4aEqRj9S?=
 =?us-ascii?Q?SK2IxUaKqvKbRz2Pd+/spdcxJ7t+FB/nOKuUtlz7AS1MV2pjB9iTA7AzdtP0?=
 =?us-ascii?Q?9Wr4t5TwNyqlvj4LNVKMr3Voi9Phb/lc+0cFcevB6URLN4s19xwtwg2IIOUJ?=
 =?us-ascii?Q?/Y9JkghftmKszeJZtQjNokKJfRs8dwFzeKbSSwaWTXyUungG3cmDWM4a0KIa?=
 =?us-ascii?Q?ds8rDljnfDUuQNV3PPQTQ3CTmvexwP9rClZpTXZE/j3QG47GrgpBY543c/ue?=
 =?us-ascii?Q?oebKhlaOHle+4Lms1R6FDt6xQ9rYNXjm3lj1hUdDdDTjAhPMdzhzr2w+24od?=
 =?us-ascii?Q?dZo2dx3tdt7OF9BToemIOaOKrt79al0r8Elx0PmhNhpbRdTzgt53yNLbqgrn?=
 =?us-ascii?Q?v+g85dZgHkh3nMbN+1hHFf6KJ+MztJHjwMovXXoqnaKwEbZgzZsz1JpxPd9T?=
 =?us-ascii?Q?t1uG6YPivdH21LmNjJMiZps3e+u+VIqOVJjH5LVfrexeLaYwzQDyee+IH+Ss?=
 =?us-ascii?Q?H6Id0gC8aS+VFjFAbyCRz1uvGrU7xoZYISXTcCwTQHoNnKv+MrtaapAkT6s9?=
 =?us-ascii?Q?7HrBGfI+FJRuPUDJyPtACTAMReeeT5a6J+l55eNbz62EM1w+JJldxeByNnsh?=
 =?us-ascii?Q?AprXSlGcyNy+HJYzEeClj6OWI4ulUOwU13bcFcg/UDPtWUmzjVdI5zgKx1vO?=
 =?us-ascii?Q?GIHW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d1e70a-e6ef-417b-b327-08d8ba6858f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:41.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJXMMA8JjWT7tiUEJgurG4fr8l9Zo1FkKrD3Eq+kFJP6i5sMglOO9U/zjRIJ1xWY1lOvWUj34QLwpWmRr2T9etA98uRUV4IpcSTWwdMcde4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Experiments show, that copy_range is not always making things faster.
So, to make experimentation simpler, let's add a parameter. Some more
perf parameters will be added soon, so here is a new struct.

For now, add new backup qmp parameter with x- prefix for the following
reasons:

 - We are going to add more performance parameters, some will be
   related to the whole block-copy process, some only to background
   copying in backup (ignored for copy-before-write operations).
 - On the other hand, we are going to use block-copy interface in other
   block jobs, which will need performance options as well.. And it
   should be the same structure or at least somehow related.

So, there are too much unclean things about how the interface and now
we need the new options mostly for testing. Let's keep them
experimental for a while.

In do_backup_common() new x-perf parameter handled in a way to
make further options addition simpler.

We add use-copy-range with default=true, and we'll change the default
in further patch, after moving backup to use block-copy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json       | 17 ++++++++++++++++-
 block/backup-top.h         |  1 +
 include/block/block-copy.h |  2 +-
 include/block/block_int.h  |  3 +++
 block/backup-top.c         |  4 +++-
 block/backup.c             |  6 +++++-
 block/block-copy.c         |  4 ++--
 block/replication.c        |  2 ++
 blockdev.c                 |  8 ++++++++
 9 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3484986d1c..d161b099db 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1371,6 +1371,19 @@
 { 'struct': 'BlockdevSnapshot',
   'data': { 'node': 'str', 'overlay': 'str' } }
 
+##
+# @BackupPerf:
+#
+# Optional parameters for backup. These parameters don't affect
+# functionality, but may significantly affect performance.
+#
+# @use-copy-range: Use copy offloading. Default true.
+#
+# Since: 5.2
+##
+{ 'struct': 'BackupPerf',
+  'data': { '*use-copy-range': 'bool' }}
+
 ##
 # @BackupCommon:
 #
@@ -1426,6 +1439,8 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @x-perf: Performance options. (Since 5.2)
+#
 # Note: @on-source-error and @on-target-error only affect background
 #       I/O.  If an error occurs during a guest write request, the device's
 #       rerror/werror actions will be used.
@@ -1440,7 +1455,7 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str' } }
+            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
 
 ##
 # @DriveBackup:
diff --git a/block/backup-top.h b/block/backup-top.h
index e5cabfa197..b28b0031c4 100644
--- a/block/backup-top.h
+++ b/block/backup-top.h
@@ -33,6 +33,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockDriverState *target,
                                          const char *filter_node_name,
                                          uint64_t cluster_size,
+                                         BackupPerf *perf,
                                          BdrvRequestFlags write_flags,
                                          BlockCopyState **bcs,
                                          Error **errp);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index aac85e1488..6397505f30 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -22,7 +22,7 @@ typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size,
+                                     int64_t cluster_size, bool use_copy_range,
                                      BdrvRequestFlags write_flags,
                                      Error **errp);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index b9ef61fe4d..1ddc3af244 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1256,6 +1256,8 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
  * @sync_mode: What parts of the disk image should be copied to the destination.
  * @sync_bitmap: The dirty bitmap if sync_mode is 'bitmap' or 'incremental'
  * @bitmap_mode: The bitmap synchronization policy to use.
+ * @perf: Performance options. All actual fields assumed to be present,
+ *        all ".has_*" fields are ignored.
  * @on_source_error: The action to take upon error reading from the source.
  * @on_target_error: The action to take upon error writing to the target.
  * @creation_flags: Flags that control the behavior of the Job lifetime.
@@ -1274,6 +1276,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             BitmapSyncMode bitmap_mode,
                             bool compress,
                             const char *filter_node_name,
+                            BackupPerf *perf,
                             BlockdevOnError on_source_error,
                             BlockdevOnError on_target_error,
                             int creation_flags,
diff --git a/block/backup-top.c b/block/backup-top.c
index fe6883cc97..789acf6965 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -186,6 +186,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockDriverState *target,
                                          const char *filter_node_name,
                                          uint64_t cluster_size,
+                                         BackupPerf *perf,
                                          BdrvRequestFlags write_flags,
                                          BlockCopyState **bcs,
                                          Error **errp)
@@ -244,7 +245,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, write_flags, &local_err);
+                                      cluster_size, perf->use_copy_range,
+                                      write_flags, &local_err);
     if (local_err) {
         error_prepend(&local_err, "Cannot create block-copy-state: ");
         goto fail;
diff --git a/block/backup.c b/block/backup.c
index 9afa0bf3b4..4b07e9115d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -46,6 +46,7 @@ typedef struct BackupBlockJob {
     uint64_t len;
     uint64_t bytes_read;
     int64_t cluster_size;
+    BackupPerf perf;
 
     BlockCopyState *bcs;
 } BackupBlockJob;
@@ -335,6 +336,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BitmapSyncMode bitmap_mode,
                   bool compress,
                   const char *filter_node_name,
+                  BackupPerf *perf,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
                   int creation_flags,
@@ -441,7 +443,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
     backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
-                                        cluster_size, write_flags, &bcs, errp);
+                                        cluster_size, perf,
+                                        write_flags, &bcs, errp);
     if (!backup_top) {
         goto error;
     }
@@ -464,6 +467,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->bcs = bcs;
     job->cluster_size = cluster_size;
     job->len = len;
+    job->perf = *perf;
 
     block_copy_set_progress_callback(bcs, backup_progress_bytes_callback, job);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
diff --git a/block/block-copy.c b/block/block-copy.c
index cd9bc47c8f..63398a171c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -218,7 +218,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size,
+                                     int64_t cluster_size, bool use_copy_range,
                                      BdrvRequestFlags write_flags, Error **errp)
 {
     BlockCopyState *s;
@@ -260,7 +260,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          * We enable copy-range, but keep small copy_size, until first
          * successful copy_range (look at block_copy_do_copy).
          */
-        s->use_copy_range = true;
+        s->use_copy_range = use_copy_range;
         s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
     }
 
diff --git a/block/replication.c b/block/replication.c
index 0c70215784..22ffc811ee 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -454,6 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
+    BackupPerf perf = { .use_copy_range = true };
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
@@ -558,6 +559,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
                                 0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
+                                &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 2431448c5d..84685e057b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2794,6 +2794,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
+    BackupPerf perf = { .use_copy_range = true };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
@@ -2818,6 +2819,12 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         backup->compress = false;
     }
 
+    if (backup->x_perf) {
+        if (backup->x_perf->has_use_copy_range) {
+            perf.use_copy_range = backup->x_perf->use_copy_range;
+        }
+    }
+
     if ((backup->sync == MIRROR_SYNC_MODE_BITMAP) ||
         (backup->sync == MIRROR_SYNC_MODE_INCREMENTAL)) {
         /* done before desugaring 'incremental' to print the right message */
@@ -2891,6 +2898,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                             backup->sync, bmap, backup->bitmap_mode,
                             backup->compress,
                             backup->filter_node_name,
+                            &perf,
                             backup->on_source_error,
                             backup->on_target_error,
                             job_flags, NULL, NULL, txn, errp);
-- 
2.29.2


