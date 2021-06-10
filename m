Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5B3A2A7C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:41:14 +0200 (CEST)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ3h-0002w7-8M
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpp-0003LQ-2F; Thu, 10 Jun 2021 07:26:53 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpm-0004QC-9h; Thu, 10 Jun 2021 07:26:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYRuZ72k27BcaWb2LjtoeYGH07ieaPFUjL6UBDfIZVF/0K5pOU8z3Eoey/AGu9A1WAS7jXMAyVTXTJQwF/yjlgQAw3pyyF+Nw0WO21TuB0wBvK3GHUgY9mIrGxWF6oW5yuiBJow6VMRswos6fvYgvLAt7PIj7u3eUUICcdLER2b9UkLazpYhTzMyoUUg5+1qE0nJQwA1OM8kiGuD9EtlC+7+xEzsanX0XyoyzhSy0K4qEvC4WVa6gYZnYF2ccjLHeFU07zMlBGzLDWIOSfXMfrRRUgTbXH39zz4hiU3tIqldjGTZuLVEBfnU4srfmdAmLRXv+y/Uh4oEFjoEwiNl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snuZrJ4K7ugYjwrH9/gsziimm4n01+9FkrKglHOGwIA=;
 b=aCFlN0md+0t75ZXiu/+LcQ/TlsmixMkGAJdmbSKQtUmxAP/yM96zjiYkOCE7BWhUg02Qs0p3q+EZ8XPqyxhnh3pXmnQk6iE90DMZoMcApvjox35/Lzsh+/0qGvtlf1LN5cujEcaTu0JH24EWK4zRM4Nlvy4ELEEy73drsAbKM9yB3x6N12ofmgVN2PXsPmbnGo0/O6sKyu2BFOKXvhuHkt7+R4uTMg+9rfnWg3iwNpvqY8W72nZQtgaIdSl0XbUaubKeTbxFj5xOLrmDTgFOEBm3irC0gatEeAmWi5zB1Vh+L88ph9ct+hlKyIjBqo1oQ7X2KM6tkE7TNR48ehLzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snuZrJ4K7ugYjwrH9/gsziimm4n01+9FkrKglHOGwIA=;
 b=AF6cWBc4VSiBJSm7XNiWz8ah8dtMtUwR4fNX3MvMfSmqTxnINTKzxoW5mNBtPpzShg91r037fiNzVdxdIKNZS2J/8SbJlHv6JgH5bw20haxBssYh7d9MVde1nZ3NV3o8Uch7cNjqpMGNQ+myiDKTVCNTzKcTXSBPDfbadbVvQ4Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 11/35] block/backup: move cluster size calculation to
 block-copy
Date: Thu, 10 Jun 2021 14:25:54 +0300
Message-Id: <20210610112618.127378-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74e4603-b434-4298-cbb5-08d92c02a12e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33816B7CAE12423CC0634AF8C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlK0wM7ZSZzYrU6mFDWhZ3uFxAFE2Py1O+tdALchU7+vMh7s50420M1Y+2iJaNs1kiAyCl3lllKeXMQhmf84CRg+YyYH4G2kNlxuaw/KsLdcKIWgDuL6zjaD31dHEchyqE8MUZZjjxre7qBwpccvUikuYKFGiWAr4wkQAq3sZw2Nc1Y8A3gRTPrD46I+l7SnvOq9NeVwTFrS0qAstZZdd5l7yQzp3ehOmMnFM+FTXnAZ1YpPsk9DY6SIZ9M668AknCkoGa+mXwnY5OyO9swL1sxxPBnwSf2hCKcPkmxcnvaTXQkvRwQhrhJuCSAi680Wktp/wNMyci01/mf+vkVVRTFMqTpgAIroFPMWfgekZppYhV7X9mZaI1UBTpBglA1UcPY8Z2vv+tJ25kDcynuHjSJIEY5l1sxF8aQrQ/lt8tm8BDr22HY5r7DnKtzNh0bCp5IeRBwbngkCNLhajfXi9ylP/ZoprVYpfwgInG5tjYeRhekGT/m7zxt5eGAJQ+SLawlwiQY0W0SKA7yYng9dZXq4M6LyWIeO3NGeLBlXccSKAPNvUJmppH7sUVypcbYzODA9qp1wJ8bHeienSqcszXQtLby8Sv0VpyYC9XC9s/PSOqxn9lEZSz5ahfaHiJlKg9zpiWjCkbGBcwnfFvYem+9G8SbJJkV5u3NgjYJ0x7epg4KqJmeGoMw/R5sKiu5x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i/iB5hjQkkXb2WdDX+WkEXWIYnTlW+JRPjaU0yA1TsmUpj5L0OnlEt4uW/YS?=
 =?us-ascii?Q?UBHPu6ZLXV0W9w2Ey2/6/7Ry0HdieOgE9IlnjHEkCF/k/cT+AgfwHr0aMfh0?=
 =?us-ascii?Q?bbgf5Y9wB1xMqRUdGRfX4EWBeXVzRez053XX41PWWOTp4UoC0jcoEQCwkQgn?=
 =?us-ascii?Q?pGVbFJ4NB4v0eyrNqHxlx6kD6oZoOhcwkUoeynMcM/lukiSAdV51vt1hpqus?=
 =?us-ascii?Q?7JUPru3SosInkoFPxMCM9ZOd2INMis1pGEeNsV1E915tjZM8UwZFnm1sexj8?=
 =?us-ascii?Q?lpD/QaviGw9NQEipSMl6ytAIPVplOt3OLKxgnAnvWVaFRVs85yO+2lnCt54y?=
 =?us-ascii?Q?tV3B/p99SsQViIBQ/7DsolQhVLuJ02An/Et/esGyANTFDUlAFbFNCGOHOVCv?=
 =?us-ascii?Q?QSEDP3rc8G46F7LPcyqZMeanwSV40A/4kyoO1PhsP/M5T0uYoX2l5fpu3YSF?=
 =?us-ascii?Q?y8RmUxZczeUbCalJaeDORt+fKpx9zpr3+n1WOqld7xF6f2BsddwMQpz6AnV3?=
 =?us-ascii?Q?ywwm2EcDObn+qxCptu7iyNaUTZkR024AGzHOIfj8JtapvtfeJpE41b1yv86v?=
 =?us-ascii?Q?YQoZbCD7eEXDdBLMV3L1xziwax60Hd4VASW/2njrNufcw5MGLV7TmkcET4No?=
 =?us-ascii?Q?xlxdfFUo4nIubKpoHbMQpHrCK6/2+yib+Pn/YMgkGZOs1zBMM4CFetVzCyTx?=
 =?us-ascii?Q?tGwfCK42NaRIZtcqJV9STRBCZ7eKenaxBipsi+N0grlI6bI8iWMZK0f8V7ao?=
 =?us-ascii?Q?zwzRxwz06xYSnfY8QQwU9FesLKU4zISR9WgIrOWiFOm6UTOI0GyGQNlgfkMu?=
 =?us-ascii?Q?T1xhhFPPGyz44CbQrq7h2j+3giQuir746g/GCw6CeqC5L4l0Qeiel4u5VVlB?=
 =?us-ascii?Q?MNGB/RiVtLPHZXtXP34bojK0FFgfL/SQ6wySfl2K4WJKLar5WuSmeICOhjFa?=
 =?us-ascii?Q?Pv7hbnfKFIamPo9D1O0HMg5T8KdTyVOWaOxNnG1Y0KTmLaWGIu5X5xzoiHvL?=
 =?us-ascii?Q?oXnlTHUgaDuuhLTO2M1dJNuuK9nkPXEUxEIkYD3hZHtWCJtNCx5oJb4/iDw8?=
 =?us-ascii?Q?9N8j4n1j09rY9W2els/GSWg++DmLaK+k5tuwojo4v6601jaxFL/L+DV0yb11?=
 =?us-ascii?Q?6ZUFX/PB+2kAKrtRgrRunM5Xt/1TEo/zKOXx5I3vjUOyaEX4oYU0XqT91w3W?=
 =?us-ascii?Q?J8zKA+tnwsTDGpcNJFOnPC/Rl996E+7PFYLDOl37CPpi7NbFSF34aoaHZZsm?=
 =?us-ascii?Q?oged7tsNTRZ764oztIZY2n5ovcNBcNfE8wQgMCMbqdKqiD516wZWgxljLZdU?=
 =?us-ascii?Q?O4mw0275MDCs6rSZYuiO/+Hu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74e4603-b434-4298-cbb5-08d92c02a12e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:45.7392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdCqxk2mkodozdllpcwiBDabQdzSCAkmw817IiQbf9tfyjIJf6Js3NpH6dMR+EXZog5ca46NVkdrgdjz7ZVL8gcmH3xhmpXKSyzx+eS7xF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main consumer of cluster-size is block-copy. Let's calculate it
here instead of passing through backup-top.

We are going to publish copy-before-write filter soon, so it will be
created through options. But we don't want for now to make explicit
option for cluster-size, let's continue to calculate it automatically.
So, now is the time to get rid of cluster_size argument for
bdrv_cbw_append().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h  |  1 -
 include/block/block-copy.h |  5 +--
 block/backup.c             | 62 ++++++--------------------------------
 block/block-copy.c         | 51 ++++++++++++++++++++++++++++++-
 block/copy-before-write.c  | 10 +++---
 5 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 538aab8bdb..b386fd8f01 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  uint64_t cluster_size,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b74fb80067..e81cd952f7 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -23,8 +23,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress);
@@ -88,6 +88,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
 void block_copy_call_cancel(BlockCopyCallState *call_state);
 
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
+int64_t block_copy_cluster_size(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
 #endif /* BLOCK_COPY_H */
diff --git a/block/backup.c b/block/backup.c
index b31fd99ab3..83516297cb 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -29,8 +29,6 @@
 
 #include "block/copy-before-write.h"
 
-#define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *cbw;
@@ -354,43 +352,6 @@ static const BlockJobDriver backup_job_driver = {
     .set_speed = backup_set_speed,
 };
 
-static int64_t backup_calculate_cluster_size(BlockDriverState *target,
-                                             Error **errp)
-{
-    int ret;
-    BlockDriverInfo bdi;
-    bool target_does_cow = bdrv_backing_chain_next(target);
-
-    /*
-     * If there is no backing file on the target, we cannot rely on COW if our
-     * backup cluster size is smaller than the target cluster size. Even for
-     * targets with a backing file, try to avoid COW if possible.
-     */
-    ret = bdrv_get_info(target, &bdi);
-    if (ret == -ENOTSUP && !target_does_cow) {
-        /* Cluster size is not defined */
-        warn_report("The target block device doesn't provide "
-                    "information about the block size and it doesn't have a "
-                    "backing file. The default block size of %u bytes is "
-                    "used. If the actual block size of the target exceeds "
-                    "this default, the backup may be unusable",
-                    BACKUP_CLUSTER_SIZE_DEFAULT);
-        return BACKUP_CLUSTER_SIZE_DEFAULT;
-    } else if (ret < 0 && !target_does_cow) {
-        error_setg_errno(errp, -ret,
-            "Couldn't determine the cluster size of the target image, "
-            "which has no backing file");
-        error_append_hint(errp,
-            "Aborting, since this may create an unusable destination image\n");
-        return ret;
-    } else if (ret < 0 && target_does_cow) {
-        /* Not fatal; just trudge on ahead. */
-        return BACKUP_CLUSTER_SIZE_DEFAULT;
-    }
-
-    return MAX(BACKUP_CLUSTER_SIZE_DEFAULT, bdi.cluster_size);
-}
-
 BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *target, int64_t speed,
                   MirrorSyncMode sync_mode, BdrvDirtyBitmap *sync_bitmap,
@@ -448,11 +409,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    cluster_size = backup_calculate_cluster_size(target, errp);
-    if (cluster_size < 0) {
-        goto error;
-    }
-
     if (perf->max_workers < 1) {
         error_setg(errp, "max-workers must be greater than zero");
         return NULL;
@@ -464,13 +420,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    if (perf->max_chunk && perf->max_chunk < cluster_size) {
-        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
-                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
-        return NULL;
-    }
-
-
     if (sync_bitmap) {
         /* If we need to write to this bitmap, check that we can: */
         if (bitmap_mode != BITMAP_SYNC_MODE_NEVER &&
@@ -503,12 +452,19 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
 
+    cluster_size = block_copy_cluster_size(bcs);
+
+    if (perf->max_chunk && perf->max_chunk < cluster_size) {
+        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
+                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
+        goto error;
+    }
+
     /* job->len is fixed, so we can't allow resize */
     job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
diff --git a/block/block-copy.c b/block/block-copy.c
index 8baf8b9403..774f5029bb 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -276,13 +277,56 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
     }
 }
 
+static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
+                                                 Error **errp)
+{
+    int ret;
+    BlockDriverInfo bdi;
+    bool target_does_cow = bdrv_backing_chain_next(target);
+
+    /*
+     * If there is no backing file on the target, we cannot rely on COW if our
+     * backup cluster size is smaller than the target cluster size. Even for
+     * targets with a backing file, try to avoid COW if possible.
+     */
+    ret = bdrv_get_info(target, &bdi);
+    if (ret == -ENOTSUP && !target_does_cow) {
+        /* Cluster size is not defined */
+        warn_report("The target block device doesn't provide "
+                    "information about the block size and it doesn't have a "
+                    "backing file. The default block size of %u bytes is "
+                    "used. If the actual block size of the target exceeds "
+                    "this default, the backup may be unusable",
+                    BLOCK_COPY_CLUSTER_SIZE_DEFAULT);
+        return BLOCK_COPY_CLUSTER_SIZE_DEFAULT;
+    } else if (ret < 0 && !target_does_cow) {
+        error_setg_errno(errp, -ret,
+            "Couldn't determine the cluster size of the target image, "
+            "which has no backing file");
+        error_append_hint(errp,
+            "Aborting, since this may create an unusable destination image\n");
+        return ret;
+    } else if (ret < 0 && target_does_cow) {
+        /* Not fatal; just trudge on ahead. */
+        return BLOCK_COPY_CLUSTER_SIZE_DEFAULT;
+    }
+
+    return MAX(BLOCK_COPY_CLUSTER_SIZE_DEFAULT, bdi.cluster_size);
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
+                                     bool use_copy_range,
                                      bool compress, Error **errp)
 {
     BlockCopyState *s;
+    int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
 
+    cluster_size = block_copy_calculate_cluster_size(target->bs, errp);
+    if (cluster_size < 0) {
+        return NULL;
+    }
+
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
     if (!copy_bitmap) {
@@ -879,6 +923,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
     return s->copy_bitmap;
 }
 
+int64_t block_copy_cluster_size(BlockCopyState *s)
+{
+    return s->cluster_size;
+}
+
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     s->skip_unallocated = skip;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 235251a640..a7996d54db 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -37,7 +37,6 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    int64_t cluster_size;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -52,13 +51,14 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
+    int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
 
-    off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
-    end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
+    off = QEMU_ALIGN_DOWN(offset, cluster_size);
+    end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     return block_copy(s->bcs, off, end - off, true);
 }
@@ -169,7 +169,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  uint64_t cluster_size,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -214,9 +213,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     appended = true;
 
-    state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, false, compress, errp);
+                                      false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


