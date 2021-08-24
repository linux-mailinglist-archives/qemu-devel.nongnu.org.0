Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E253F5A27
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:50:02 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS89-0007tW-2d
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyA-0002X5-Kt; Tue, 24 Aug 2021 04:39:44 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy7-0007OJ-A9; Tue, 24 Aug 2021 04:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P56KppJV5qljwhBPm9UI8YNvnLNGt0aLhZ8yKCquhnN5ESoOmBzKNi2snHiHKFoNKSxrMbbWGd7Kr7ZohtNrEl716FoyM9ImTc4M/OmgcMB1Ocs2AOiN1OwjyqO6ICw56O4QqttRaZHcQH3PQkpQJGgvqR5hF6I6EVRwtV4DD0T0o/zRqfAexZ+akBBP53KpQ4dKwIxPWerpKOQxyP/Dt0mrSS8Nw91bP27ZLcxYw6pS8Lg0WDS/m1R+r/yok9ydiciCuOaxhew/q8uCl6+NMQfvboewypBkVJe4ZH25n0PJGvfLQxg2R7b3tBZgZsORi/n4TdwOj4Vsdg6KnYFQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itn2jvbeCkQbfrin3hCEsXd1QreO2666QKbEzX1b420=;
 b=UsqeXxNeHszBbFHFR8Eoi9XkSR9t8Yyv0U/hnoED3RM0uA/5D8HxgJtJeu/z/kaDEQS/XSfpKwDxFwm8vzDfZbpHzIj9r7dbFOwKP8z7dx5DA67W8jl0TWpePVXyXiPeqyTyfs4HvULU9gFofq4aV6t2Ly58tpk5RGOmX7H7I0lXLrJLAcGgNZxe6VcpmRFzM2hb7/euQUAF7EzJScb3i+icHJewecHEIqeCTTiuMIsB+vXV3sSVwAIws3/TUF6Pw510FHKmSM7Cd52GItn4YJY5HoA7NEXQfWhEP14dSYsiey3W1TGG7oX6IXnA4rpXxZYC/WrkE2L2XYfRREjh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itn2jvbeCkQbfrin3hCEsXd1QreO2666QKbEzX1b420=;
 b=pHLmM/Zrjrf14JX8mKRE4ysHBnVzV9F1JUyrA59C2oOtWd9mCzgROuQXc+rct0qf4KtIY9/lwivuuFetQ3uk3ImR1vnABijeOQAPmTXL92Ifn02seO1Ht/kvy8OY9BkpHPl9rO5TAXjQbS2Ow2U7Hy/w0loCGL60Ckuwlzr5Y5A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 09/34] block/backup: move cluster size calculation to
 block-copy
Date: Tue, 24 Aug 2021 11:38:31 +0300
Message-Id: <20210824083856.17408-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d863b0b-4017-4a2c-c8d4-08d966dab059
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB178070DCFB5FA631DD5D7853C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJ29j2OqHvpESbLSTjYLbSY9dudFrHPh6eZL+hyeEKrB9Nr7cknWAx4eiX769pEIFzZwAblzUCk+IwVwhb+ouCfHujIoIpD3oZ0zML5UcPYig5sHxPZ+AVV1aUoV9JrTc7KyO0thAYC9dRStqclkl4cObkw0sGj5O46a1lwx6rbpHKnb0nyG001/1yO7v+Jvt/Dme7ilvKpDnFt41kI0v7oC4bepMBxrBv7bqfQp915GcC0ENVyH/NH0QxnEU1pvN2Z0uc/F8EfJlSy/GZkWZmK+HfP+B+Qqan8aDrp94i9HcJu1acG97gpkcAKU+8uDZyRY4p+cbyVB6aIdxELLHi0sga5qG1SucFCEZBNijb5zRbO4I/1Zue7qEGQlpz4TuikmjCLXP4gzoBIMZrwTvqO7F9JufJUX29lCDnkMZDLsKDb9X1XJ5RYYpjcO9p19ZeMpiowqjXmZhHw32aHbOaBtRPN0p4houojV3ZEGtsAAgH9yqaCprCMwCHlkz7PMTpVlOSue8nWjYrex8ZfQlmtOfdh0kVFwuZS71hrhNrMtICYkk3J//mmwK4cQbbOdqsAMZ3iKzlUBAwYvsL7cJxHiBmx1IR2hUZyTulYy1YbFwMXHU9SOtNzNEEGYXltoLjwvQSMLzDzxNxhv5jV/ZQtzuz8YILpmqpNTQc86jUcSjQnVSdAzALQzFr0jjjayysjQqFpJmQsUUCjBQDWwhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(6666004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nWG9ibigwdsVg9ZzGR9qtCS2G6aQCNX1gG5egi2lPLl7No4tZsMZ8d1TFSZM?=
 =?us-ascii?Q?UfCG3bNdhh4492OR54urqbTFEFA9eTb5jT5MjDJlkvM6U3fmd1pIyYQxKsqg?=
 =?us-ascii?Q?TNBnngym95MuCO9DObsXSnsfh6SIF4lKFVkVA8v3wVjSPmTbnVI2OlyJ6grK?=
 =?us-ascii?Q?Fw49yyvO+o9Cbh/2V/LVh+pqtYpWQs6NUrtYE8aJazRmQ3SlVydvcTsF433B?=
 =?us-ascii?Q?3RXKwoUTC7z4j7NGCbTG09iHRqDJm+Ac1ijDvfSQCM8r4Xef2jU/RswXNf4o?=
 =?us-ascii?Q?hR5+uklAd25rnBWYP41sM5RhS5mX/A/F5s/7TcEYFpQdh8RMSMjV/N5MDsjH?=
 =?us-ascii?Q?oXOVRLQl7NTnuSo1OeTnBZ+eVKHsODoAqZNDAbDZ/z95YJlveprHw1rfOB5Z?=
 =?us-ascii?Q?mc9XiFtjVVuWBoDtNCs44bSWyDVUy+6Or2Ch+Fugx090J/lTqnLfB9YeTxM9?=
 =?us-ascii?Q?4a92qcHxQhEMQUuUhQ/xCde7gNWhFc/SpjSWCjdpXPXfRnzdB0QJeMWCvJL0?=
 =?us-ascii?Q?7BUlBtDeL1xAQocB6aE0av3C+pTt+xhIU0HWX7iQzr+vg99qBfOFPPF5MgeA?=
 =?us-ascii?Q?gVsod3YkFzUbLUzg+oxAhHTSH2gNZ0bq16H7y+x0rbTgSfOxXk/OJtARAXCM?=
 =?us-ascii?Q?gwqQqKXFYc8zftqcA84T3rUXWVWDz1GjPXG2LHuV5KJ0wukAtFWMwcRvPMYx?=
 =?us-ascii?Q?nYDPRoVNKFcgYQRJ6djI1zys0fSM/lxW9/iJ8X62WWq+DdfEd54G8nSyPwVo?=
 =?us-ascii?Q?T22bIjF5w7YZFYoZ/xb4hpOi75wWhIc9pIQyjWVxWB0XcSCVKewnuuZYw4+8?=
 =?us-ascii?Q?XYN4+vvyBc1jumSLFp1fPkzByEY3NBsghLWif9E7Y9aL7l6GtKmBCcQz/7Cy?=
 =?us-ascii?Q?IhnHNLH/V1M+EO8C6ZGAbqRZLXqombX+tk/p0JiKRyunoMZd5l+iz22TEZUs?=
 =?us-ascii?Q?MVdiv2dzTnQp0Dsn5CdJ50Og/l7Jt58TCNH4FO2fL5IojB00kF03Mp3GutHy?=
 =?us-ascii?Q?qThjy2c+0nnyLGwKXIx4GIFcNC0XTWYBCAjzWvM8ACljULLJv+9hiRrQWZPh?=
 =?us-ascii?Q?7ybjTBJrW+h7nDgrLPCdeE1SrU7lGo2hwCWv7iACOatKXHmTGKwTIqzdkF/y?=
 =?us-ascii?Q?rRJxMgiEWT1o+6RJ8Ex5sET7ESAJzPcOQ+xC7kgelGIEvf8SXKEGmVtJpXOY?=
 =?us-ascii?Q?wU1jsRmyC+EpGI+EllnOga3OR3rLecwa1iqn2AT+UMyC/nld/+uHEUdpsgex?=
 =?us-ascii?Q?0IqTxIhLcVZUSdRcH2nCp8cdSWhtaP2hBkxcP2AjdlhKqFV/C8NLLdGRwLHq?=
 =?us-ascii?Q?o68Hnf8eeIVa/+kjkdfJk4hY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d863b0b-4017-4a2c-c8d4-08d966dab059
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:29.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou0T/gW19wAJz+uc7AMbtKePdEyA+f24scXlD6C5d072USKjSuEKqBU9lLHyF6TyZsm5ZGcW0OAA4rlGcZYnYUpvJ8dT8wqzzsfWvcjXB60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index dca6c4ce36..b8a2d63545 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,8 +25,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
@@ -91,6 +91,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
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
index e83870ff81..b0e0a38330 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef enum {
     COPY_READ_WRITE_CLUSTER,
@@ -342,14 +343,57 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
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
     bool is_fleecing;
 
+    cluster_size = block_copy_calculate_cluster_size(target->bs, errp);
+    if (cluster_size < 0) {
+        return NULL;
+    }
+
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
     if (!copy_bitmap) {
@@ -960,6 +1004,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
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


