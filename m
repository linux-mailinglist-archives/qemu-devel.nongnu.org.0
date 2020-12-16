Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28F2DBB42
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:33:35 +0100 (CET)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQNS-0000W8-DA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ8D-00032u-H3; Wed, 16 Dec 2020 01:17:49 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ8A-0001CD-9t; Wed, 16 Dec 2020 01:17:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxDjy3T8Y16JBgVl0M6AnAUyH5cIjsB3iIHb9FynFzjYrghdhXrPOP5Q4SJQg92KHwvlZY/mPziba+zPHMe18IBtJ1MuyzMrlZ7aiJRmzvGs2ZoAZJJPGHHkK6lw4GZvsEwHK3yIQY/U4JNIwz2irOMeC0dynNTiLXwGQmHcVrCgZJwxDM7/W+kkJb5iITi3/05mGyaT58loJO0WA2ivGDR6siuyzD5qvEhrAzj7/1UWv400loY9m7hbQF8UQjgovZQPciczuZiLcOi+Ern0OsCfC4uKjY2EklUNTztoxM8SELN4dzvjbbGpRacITsX58tArYDbxWHl17HRtVgmE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaHoqmLjbQ1IspI2B5cCs5mLZGgBX131TkEZVnz/g3Y=;
 b=B+LM1ri+4BhiOzVv1Z0OnIKf0DpAWY0/t5n3zjGJZgopdijKp0qoXbefaFs6Gg4nsapFOqvpxy9FUFaqAGh+9ZlVvgx0OuQBTkNoTg2PfwH/NLRsbLUASzs7tra6VishDOapeTC118jwpNp0rkZ/2ADBzfMEQCIRDrxh8FhUZuP4/DEyO59qo4IO3BkC/ObhsuH2noDp/h+kvcT36a/BYTacUAvSo38KARMCwlnr4knIVUCTW6ZjJ1TO1BsJKmrALis41SE/AA8TySalUUkLsc44Ct8Luw0tDswljpMdNnACNl0EgVlYNzyvw6CzaWWWnILdZfCGPihgx7a2jWX0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaHoqmLjbQ1IspI2B5cCs5mLZGgBX131TkEZVnz/g3Y=;
 b=SCL1xiFPzq2xCsIqSgM5JWtktxRAm0yhFKGuhDeB8vSzhp0qiPHi77HYjBQyEM6/XHkVvSf2w3vLGR9rOC/CY7tDz/DzwyZ/yfB3BsnQHC4HtGh7Gu/m7mB7dU1vIuBk8vCfkWWqZZeKBJgeAyLdNy5r3tc4QtCnzMlB9SsjDnQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 13/13] block: apply COR-filter to block-stream jobs
Date: Wed, 16 Dec 2020 09:17:03 +0300
Message-Id: <20201216061703.70908-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09c0d67c-f132-44b5-156b-08d8a18a44f0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309098D381823D8F5875A8CC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pO5sfgDj+TJRu/jshEpbdOvcvL+9mDesVRnppEIHkbWWjK7WEerXUP/kqPNNWVrqbyyTdbAsH43YCB3/t5pisMgitniVTxtMqhahoHB2FRe5XsBpPzMMTXbO07dKuucMhd2TB1DhamwItqY4DmHm+7tV4x/gxZZl/aL+N0va91315Zdz351rg8D46q50LN1NESWqWmQG2yruBcWURr8cKU9ZVBDP8HPLGm9+43Fn0MrmGek1nOCLglcWyAnNe03ihIRVJvrFXvClPxpGrTCNxh3SIO2vjWCP0MDTJ8GCoYlX6IxoW6mj+9pORGklbXrE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39840400004)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(30864003)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ig3K9fzG+DUy5a2Z98tuG5D+eYncH5TBuRG7e/T5e15ilsVabh/euWfDf62G?=
 =?us-ascii?Q?OHfEFrVZDEfJOZYKcXOqpHFCUNTo7jWikOiRPqtS1ncilJcEjpqvdkqbY1KB?=
 =?us-ascii?Q?eoJUjvGuPWZP0d3zt3JDIyOLccDp04BonPkderUGNY8+yiRfJBp7yafZPFkA?=
 =?us-ascii?Q?j3N0N5MV3xTr6ceySPLBktZlAEvE5ccAwPeZbk3BGPPEdG+hIffJ5jP5G4Wq?=
 =?us-ascii?Q?VI+um59nAvzohBzBNOkJ9dr1xchi/0Ze56YSnFT3KlCjPUdyU/CE0kKn0Dr8?=
 =?us-ascii?Q?rcUWhRj/cpicqZDcUsRM7N0EMh6zRPBu8cGSXv9K6zHHR4W4YylMCnBEgDu1?=
 =?us-ascii?Q?MTMFX0xlyvJjjMcODppgrZi0peyAPixYfAAOIgpWYPio5fuYFr9rhN6GqxHG?=
 =?us-ascii?Q?mEpu0DekifnphZ7kfmKKhA0+O9yJd96ONIKutvVwUH3NngJE0bHJDqm/YRaa?=
 =?us-ascii?Q?j4gHcsKaHYhGT+UMk0lU+00Urc8G/ctbR6s76sz3DJzlsv7l5XEGan6ge6ow?=
 =?us-ascii?Q?EhFfCgJJllHKW5yPYw3fo8CrKd0DbFyAsJ4NZmSUMsNv1zbvklOiXDl3Zd1G?=
 =?us-ascii?Q?oTQJLtDjezGBAfCEnh9Taba84hQgZjXf4LvP4lJCahvWEgFt6IUTzSEAGeTw?=
 =?us-ascii?Q?dVaZeuIdFBAaz5MwsB8IOFYdFLUzTiosVs+2VVhzcGznoATOsNDVaq+fugXH?=
 =?us-ascii?Q?hePJayKL2c1BkQ1z3SdKq/8MJggHwIuoKnV+5bWzFdvAS6+ODO1Lrehjbpbg?=
 =?us-ascii?Q?0lpLTvaxb6SYAAXMaP2Z1tYGPXwj2/5NHVqGGwHcx5xZ9AK9vp2Hb6pcRxdc?=
 =?us-ascii?Q?YUfNRu5ncb1W9w+k7VouyK08XsQ5AGtmqg7j/S6BKh3GIJymEWDKN5ar6WnM?=
 =?us-ascii?Q?8qaK0pJgiqsCl5JNOnVasQTtuf3ug3PPcfHLL/bl4AAOfUxcIRCaS+4i11jz?=
 =?us-ascii?Q?713HgPMUsTbjXLzP3Sdol17MlA99VTyjjV6T5HModBTVvLN8/pwyaNr67KAX?=
 =?us-ascii?Q?nKwn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:30.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c0d67c-f132-44b5-156b-08d8a18a44f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg6ZkmSK7POL1maY5KcBhwQewA82VJKtGyQhYUTUJiz879PzkDH1t/dzJ61saoXR/IhwwLzGN1iLOfw9BQN/DJNkYPgItv9MLIkK1z0lxKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

This patch completes the series with the COR-filter applied to
block-stream operations.

Adding the filter makes it possible in future implement discarding
copied regions in backing files during the block-stream job, to reduce
the disk overuse (we need control on permissions).

Also, the filter now is smart enough to do copy-on-read with specified
base, so we have benefit on guest reads even when doing block-stream of
the part of the backing chain.

Several iotests are slightly modified due to filter insertion.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c             | 105 ++++++++++++++++++++++---------------
 tests/qemu-iotests/030     |   8 +--
 tests/qemu-iotests/141.out |   2 +-
 tests/qemu-iotests/245     |  20 ++++---
 4 files changed, 80 insertions(+), 55 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 626dfa2b22..1fa742b0db 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -17,8 +17,10 @@
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
+#include "block/copy-on-read.h"
 
 enum {
     /*
@@ -33,11 +35,11 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *cor_filter_bs;
     BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
-    bool chain_frozen;
 } StreamBlockJob;
 
 static int coroutine_fn stream_populate(BlockBackend *blk,
@@ -45,17 +47,7 @@ static int coroutine_fn stream_populate(BlockBackend *blk,
 {
     assert(bytes < SIZE_MAX);
 
-    return blk_co_preadv(blk, offset, bytes, NULL,
-                         BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
-}
-
-static void stream_abort(Job *job)
-{
-    StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-
-    if (s->chain_frozen) {
-        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
-    }
+    return blk_co_preadv(blk, offset, bytes, NULL, BDRV_REQ_PREFETCH);
 }
 
 static int stream_prepare(Job *job)
@@ -67,8 +59,9 @@ static int stream_prepare(Job *job)
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
-    s->chain_frozen = false;
+    /* We should drop filter at this point, as filter hold the backing chain */
+    bdrv_cor_filter_drop(s->cor_filter_bs);
+    s->cor_filter_bs = NULL;
 
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
@@ -94,6 +87,11 @@ static void stream_clean(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
 
+    if (s->cor_filter_bs) {
+        bdrv_cor_filter_drop(s->cor_filter_bs);
+        s->cor_filter_bs = NULL;
+    }
+
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
@@ -109,7 +107,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
-    bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
     uint64_t delay_ns = 0;
@@ -127,15 +124,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    /* Turn on copy-on-read for the whole block device so that guest read
-     * requests help us make progress.  Only do this when copying the entire
-     * backing chain since the copy-on-read operation does not take base into
-     * account.
-     */
-    if (enable_cor) {
-        bdrv_enable_copy_on_read(s->target_bs);
-    }
-
     for ( ; offset < len; offset += n) {
         bool copy;
         int ret;
@@ -194,10 +182,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
     }
 
-    if (enable_cor) {
-        bdrv_disable_copy_on_read(s->target_bs);
-    }
-
     /* Do not remove the backing file if an error was there but ignored. */
     return error;
 }
@@ -209,7 +193,6 @@ static const BlockJobDriver stream_job_driver = {
         .free          = block_job_free,
         .run           = stream_run,
         .prepare       = stream_prepare,
-        .abort         = stream_abort,
         .clean         = stream_clean,
         .user_resume   = block_job_user_resume,
     },
@@ -228,7 +211,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     BlockDriverState *base_overlay;
+    BlockDriverState *cor_filter_bs = NULL;
     BlockDriverState *above_base;
+    QDict *opts;
 
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
@@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
-        return;
-    }
-
     /* Make sure that the image is opened in read-write mode */
     bs_read_only = bdrv_is_read_only(bs);
     if (bs_read_only) {
-        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
-            bs_read_only = false;
-            goto fail;
+        int ret;
+        /* Hold the chain during reopen */
+        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
+            return;
+        }
+
+        ret = bdrv_reopen_set_read_only(bs, false, errp);
+
+        /* failure, or cor-filter will hold the chain */
+        bdrv_unfreeze_backing_chain(bs, above_base);
+
+        if (ret < 0) {
+            return;
         }
     }
 
-    /* Prevent concurrent jobs trying to modify the graph structure here, we
-     * already have our own plans. Also don't allow resize as the image size is
-     * queried only at the job start and then cached. */
-    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
-                         basic_flags | BLK_PERM_GRAPH_MOD,
+    opts = qdict_new();
+
+    qdict_put_str(opts, "driver", "copy-on-read");
+    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
+    /* Pass the base_overlay node name as 'bottom' to COR driver */
+    qdict_put_str(opts, "bottom", base_overlay->node_name);
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
+
+    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
+    if (!cor_filter_bs) {
+        goto fail;
+    }
+
+    if (!filter_node_name) {
+        cor_filter_bs->implicit = true;
+    }
+
+    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
+                         BLK_PERM_CONSISTENT_READ,
                          basic_flags | BLK_PERM_WRITE,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    /*
+     * Prevent concurrent jobs trying to modify the graph structure here, we
+     * already have our own plans. Also don't allow resize as the image size is
+     * queried only at the job start and then cached.
+     */
+    if (block_job_add_bdrv(&s->common, "active node", bs, 0,
+                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
+        goto fail;
+    }
+
     /* Block all intermediate nodes between bs and base, because they will
      * disappear from the chain after this operation. The streaming job reads
      * every block only once, assuming that it doesn't change, so forbid writes
@@ -310,9 +327,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->cor_filter_bs = cor_filter_bs;
     s->target_bs = bs;
     s->bs_read_only = bs_read_only;
-    s->chain_frozen = true;
 
     s->on_error = on_error;
     trace_stream_start(bs, base, s);
@@ -320,8 +337,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     return;
 
 fail:
+    if (cor_filter_bs) {
+        bdrv_cor_filter_drop(cor_filter_bs);
+    }
     if (bs_read_only) {
         bdrv_reopen_set_read_only(bs, true, NULL);
     }
-    bdrv_unfreeze_backing_chain(bs, above_base);
 }
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index bd8cf9cff7..c576d55d07 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -278,12 +278,14 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-stream', device='node4', job_id='stream-node4', base=self.imgs[1], speed=1024*1024)
+        result = self.vm.qmp('block-stream', device='node4',
+                             job_id='stream-node4', base=self.imgs[1],
+                             filter_node_name='stream-filter', speed=1024*1024)
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('block-stream', device='node5', job_id='stream-node5', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-stream', device='node3', job_id='stream-node3', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
@@ -296,7 +298,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # block-commit should also fail if it touches nodes used by the stream job
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[4], job_id='commit-node4')
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[1], top=self.imgs[3], job_id='commit-node1')
         self.assert_qmp(result, 'error/desc',
diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
index 08e0aecd65..028a16f365 100644
--- a/tests/qemu-iotests/141.out
+++ b/tests/qemu-iotests/141.out
@@ -99,7 +99,7 @@ wrote 1048576/1048576 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {'execute': 'blockdev-del', 'arguments': {'node-name': 'drv0'}}
-{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
+{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: stream"}}
 {'execute': 'block-job-cancel', 'arguments': {'device': 'job0'}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..432e837e6c 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -892,20 +892,24 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # hd1 <- hd0
         result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd1', auto_finalize = False)
+                             device = 'hd1', filter_node_name='cor',
+                             auto_finalize = False)
         self.assert_qmp(result, 'return', {})
 
-        # We can't reopen with the original options because that would
-        # make hd1 read-only and block-stream requires it to be read-write
-        # (Which error message appears depends on whether the stream job is
-        # already done with copying at this point.)
+        # We can't reopen with the original options because there is a filter
+        # inserted by stream job above hd1.
         self.reopen(opts, {},
-            ["Can't set node 'hd1' to r/o with copy-on-read enabled",
-             "Cannot make block node read-only, there is a writer on it"])
+                    "Cannot change the option 'backing.backing.file.node-name'")
+
+        # We can't reopen hd1 to read-only, as block-stream requires it to be
+        # read-write
+        self.reopen(opts['backing'], {'read-only': True},
+                    "Cannot make block node read-only, there is a writer on it")
 
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {'backing.read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts['backing'], {'read-only': False},
+                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
-- 
2.25.4


