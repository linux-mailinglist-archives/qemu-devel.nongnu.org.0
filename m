Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DB3DFE41
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:44:15 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDRe-0006yE-IX
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMY-0004iT-DS; Wed, 04 Aug 2021 05:38:58 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMW-00062H-1r; Wed, 04 Aug 2021 05:38:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xt7v1qhG1H7IuupM9y/VO4/xvampOU9XR9TNyOYuJAaE0jMNSWii/bTZPC4ZQCVrqIK3RA0YeFhcxq6eceeqcrK5klMzdQEFOqFV8bXvpqRSmKBVLogiXeWD9I9mWq7HZy9rWFrYipjijfJ7FsGqOc5w1sHTjBjr+gQ7BJivsgPwBAFpMZfvdPw2Subq3PTxtdE2Xzk2783197ifPUyP/fgKUzZggPl3uS9soaJYUOKbnE/DrNGrIB1Z04jxC3WEVu75+f3WcVXU+tyZXEgDqj2tQb9iTs90ne4a94yt8fTkfRgwlZVkNohrRvLShelaXxG1sb78Z7JJFZQcjeRlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wheC1X4ZfJPyaYMZSI2XtlFCzDVmKqp5QtMnaFR04AA=;
 b=M0qOcf7kaEltwFUyh2LegF7hbtOKnDKr4gwzfY5k13B+BqJQMoFEtn7WZ/6RO1odbCPBCKvmMPkF6JyQiQSYRJpOytxkc2zACS3W8mXmJolbQoaSARaEaUpvs9HuvDx6/mJbvxZiXnbi7GObSvy7EKTNTrpyPg+S5OKtNj4W5DGU4KrPSaJu/DaeMeuYpI2Rsd7ltomZVGmYMPx2oLJwno4jmafnt/xR6PkkuPgDyAkoF4dNcWRFlXqEY4RJQyq/q2n1mgz7MjZbf3hUn+T986yDPPJrfsUerd+/SvyI/NEQ3vgBY/zFNkqrtoDC1aNZyUpTf1OfIweG8QHtfWFFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wheC1X4ZfJPyaYMZSI2XtlFCzDVmKqp5QtMnaFR04AA=;
 b=Jdx3kAaFWk8Z8UjJJyNWHufCl4pnOkT720h9tPC9ZX5pjKXdUkZIFhzSulpBF4hCg398sZTlOX3QBCogAwqLaSPX4B5FSFe/c1Q0Q6237Xe9aB2ozBVL0ki1zk41dCRaSIyNpEr1pX0RNEnWVPMCwqrW28evS7+j3U4lPLkxG70=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 09/33] block/backup: move cluster size calculation to
 block-copy
Date: Wed,  4 Aug 2021 12:37:49 +0300
Message-Id: <20210804093813.20688-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdab71de-f05e-4e1f-05e0-08d9572ba91e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032E56EAF7D0E4488098167C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ldKETfv/xOReQNVyLnlwpcxOMY6dMO8NXcq82BmwSmVLt9JV31JApYbUBIVgnIKF+qKjMag8sZsNcK+Whp+TaBuovi3YEVluewR0xed/a9PxSuJD8wLWOmpPIkDRg2BMB6FkghpXDW7NUyFxPi3oiMsgUmn95Cin5PYT/G1bJ4FMVKT9j9oqGoJ+AwaeLIDrR9jkE3B2PlZbBAIP9neISTTwTvDDOoEiA452dhD9LCdYFWevQ8JG64jiy20dnpQ9sFqsgTezeupm7iurx+AhphnS1XI5QxwO0RfpmfrywNo9jj3ybvYOt21/WI7rc7EyCJXPHi9fGRdrePvsElIZnt+lgU/nES9Ked/XuMBJMDejEEofX2oTEodXeDjzXj06U37fcpfBsJPOZV2Id/CzJ8SRdRZyg3ci7hovBqAEpGPn0jzMPtRegQfSEesAiK6hF3p8G+dSfa3S4d+NuirMm26mI/Hrmlya6Plq9l9ENupbOi/aDtPTucxar5Pmkcbr5uVMlzYoDS3NEuFrSW5PkRV7qEZ5jvu5bYzxlGKT/IvXCceiZvjgOlTsMixSTNiX5LQEM56Daq7jlAi2mFpVGFR9HAenSKpgyP6KbBCmzmWskEoq3rKgdF99CW+lejy8L78p5DmsAxQ6sZGQ409QPMp9xQHa4BBUM6toQkc19WxsPqLH166akk35Fn9MDhyhuSEjvbTb9eX2j/CRtldxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VvxYonwRj0a2mEShSiReaSN0Xtg3FWuHYYMka4obTB4UFr+ncDGvSIk760Qg?=
 =?us-ascii?Q?MvrlP42ySuh9FKQ2nHpy4Hx6/qvWoZfyyNsy2WDy270jal8QoSEUqde0VdAC?=
 =?us-ascii?Q?4f1i881Dzio+71R89dKJURZniVNnXPMDnTPTES5yLecxvYofnZo7+QMNRa9s?=
 =?us-ascii?Q?rWQyTBISRzomt68eJ/YMoZTbWiQ6TVcPRK6P1EGU7QhVjmgyQy8WVOxCOofP?=
 =?us-ascii?Q?yPjub96GJY84BX7Pc7Ucm9xFXUel51uAtbI5i9upYHX3KyMFVKpF+SG01KoA?=
 =?us-ascii?Q?Nj10/FwebCi1O7XE2KbmM4v5ZRUu3zkZpaVwGVoJ7wpcuWGQjRxNFQy9NUw7?=
 =?us-ascii?Q?FGoyfeA36Ke7GK9pm7N3XKuEy1mKW2J6IvT1j5FMn3YVrORYgC3mSf0uG/Nf?=
 =?us-ascii?Q?QniFo9wK7CaXN8uEMWKFebFuvNaqJZmzrQFt0+oYCAkjvxeIrhp5ZpaD+AnA?=
 =?us-ascii?Q?obT2VUuxjm3BTjtFn4GRw8li6B/oxck8wKOD4pgbnQiiYuj2g5ieBpHjc9OP?=
 =?us-ascii?Q?9oJgj7gSPe8f7S08W1yJF66dv/SibOMBWNCvVmtfU2lTI/9jgeazav9LTJxt?=
 =?us-ascii?Q?D+t6xotYqBUT2T8zg7qYtantvxAa6vuLKPmCyzvnM2Uae9cZhFPzaJHAXCBB?=
 =?us-ascii?Q?+15XXOKmAEpfp0I2rtbVg/8KJT8RW28LiAlQ14o5mHQaGEuSLf2yu0tmGhyt?=
 =?us-ascii?Q?RWOrQCn5svBZmod+S9ioNf0nJ8l75WH7Jq27W3eqz4wR6o9Jx3f7MOC6Mh7S?=
 =?us-ascii?Q?Z6g2PA+4KUHO7DYm9oRjU4djHzmeesb+Hfun8G08cyj4Akkx5uheZsrzMGvl?=
 =?us-ascii?Q?2TvsojIpN/MLAGWJPLoZ3lw1l3Xt67anI5kkbX0LTU9tvBWdQIVlxtmr0rJV?=
 =?us-ascii?Q?PfWuGBZV1UbJrBpHiAOEXtavrLxmlVNIIUN7wA+U5sjCh76/ShDrcBaV9kXp?=
 =?us-ascii?Q?gzJdfGAe8pL30ZC7EiVGMGcJ1IQVC3GxgjmfV288G5NnGfvdukNj/dIFIDTc?=
 =?us-ascii?Q?NhTe3x0N8d1Kff29i04St8NXJ0giAdSsrpNtnkmvAiImVYMhvPfUcKWwFOuq?=
 =?us-ascii?Q?Tk57ElxyzYMMMbMOO/XS5W+FUgQlk12CWU+m5KY2yFPJrdFYzP6fMO4N2kkk?=
 =?us-ascii?Q?F9sNRV7vhqElE+z0fzNTXSoO285bqMQXtfcpUcM9oYEFJwdXb4bDQ40iE2+u?=
 =?us-ascii?Q?qLN3ePW94Og3kgE1rTwzQyl9QmBjXVqdnMXDflNQRBbboaMLDfGIsE5+SzT/?=
 =?us-ascii?Q?cuaazpMQCAj/O7je7/QZZMgkM+o2NE4twcQQZzZDFckyAwdRkOU2cgZpvRkg?=
 =?us-ascii?Q?/8JyghB18e26X1tvI/QvlCTA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab71de-f05e-4e1f-05e0-08d9572ba91e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:48.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQCJDeNugriR/mqpy34/Adkclgs3uPOajw+JNhzK9RFu/rmwXYxM2NVgD5W9gZD73K1PL+YqM/nh7Dq/gufPSO7XT/QjuFMsPTAY25q+8a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
index f0ba7bc828..9c24e8f38e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,8 +25,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress);
@@ -90,6 +90,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
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
index 84c29fb233..78ee255fd0 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef enum {
     COPY_READ_WRITE_CLUSTER,
@@ -359,13 +360,56 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
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
@@ -959,6 +1003,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
     return s->copy_bitmap;
 }
 
+int64_t block_copy_cluster_size(BlockCopyState *s)
+{
+    return s->cluster_size;
+}
+
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     qatomic_set(&s->skip_unallocated, skip);
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


