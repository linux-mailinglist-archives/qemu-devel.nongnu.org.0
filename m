Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3C47D626
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:55:59 +0100 (CET)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05qI-000783-2h
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:55:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bx-0001jC-37; Wed, 22 Dec 2021 12:41:09 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bt-0002Xs-Ta; Wed, 22 Dec 2021 12:41:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCO4pmJyRMxdB/WwR1slbk0+kRkjEzFAu3UL6qBc7Qqs3vzBAFaJN9f5D5yoY7xk/42FGxgJR9aqNW3zhfa+OnorhyIuSo8btGhkhIHah0ZAby9p1byTP9Brvpvp5vvMrIjPpNwzicLj53RvNrtmXlCv1HgL9RFRJLIpwSXg/UX/NqVv29bhHy4JyTfRTfOa5CffI98C79OU1y8i6FGA89npMq14D3RLY+rP7DP4PDZ6PSfxzUvC7ktH8EwwN6QpEqMQCabrI4rxHzbxxNCJYm9DQ2Mxbwz3VXmwWTHkq77C446o4gWBW62lai91GHvTIYmJlgsxTANnYLl9BgdpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTSzb7KD7j5SDUVI7rtElgBrilXEn34+nzaSC5E+1SE=;
 b=izgpMYSb6SSdHGK32LhIoqkSvCnN0NoNxnEu4mFRUn93xQK1GVJsrMR1r+OedufR5zCQsYbBEFoVBW4wfeVY6uxwLL+BJ7/7WP0sOEEDAVVXQ1cjpGf8v7Ydn7hHKxfMowbA27rLzHBVxFHhvfzxrPvcphEkr7nQHVV1QtR5c46mdxGObmmNJrF8y3ijlTVZh11oLMHzLPBvXjxbjgqS3gSxu1Hd8HJHEkMzeaeHM02KEn1sm2cHdH+efF6TN7wt6svWgpPMglHxL7tIkfCjZqMC/nHpHaQ0lTsRCA1Khe8UVpx+/6lecPaqQ2srYSe20wv2TxUgNxO0Ce1b8FUjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTSzb7KD7j5SDUVI7rtElgBrilXEn34+nzaSC5E+1SE=;
 b=bAZFBD7cFGyXWtaUDfAkZtLeG7xUJ0wxcVFJUPHabmGDGEPXvfqEIU2EOnDQ0QsxbuwUKx8i909YPnWC23kj6MMzk7M/W8HPQOgnNNqu0EagrtZKGMhZUJXYf2e/3KAaC442O8oVBsvmC6mTi1SsZTsSgSQUho4yklvl3USMg28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:47 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 18/19] qapi: backup: add immutable-source parameter
Date: Wed, 22 Dec 2021 18:40:17 +0100
Message-Id: <20211222174018.257550-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7168303-b35c-4161-f08e-08d9c5722fce
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964E0FEEEAB157760DD0352C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaEXaioI1MfXmLIn5Qy4OIM+IkfUisBxCOAo9O6UXQnEAR8v+mFeK9ujyBlZE8N2qH/VB8jNCneplMNEqWivHy+jKvTWSeapyrAL8IXUTUH90xXYZAebhBr5bwbKgPN8UFLcUWWErrjDOXGibyIRM9GysFlNLwtx7AJP0sN8l/tvMUaEoj2PfSDb59XY2YLl4K5SIPbbmdBiRvoYHQ9gbk9sfBCNULo+Nk6KXhgZ4r2Z9mEsXDTxGrksfpyLyYqOz9CwlrndbvrgrghVZEzVqdz0DjGaREOvExS7iXC1v5tAKtkCB0jKayEeJhW1WLDPqUrI6UTXisMrDWr69OrUgh3lpi9lkRE76nS6qxOngrPnlX502TVsEkYCelcREG1mYjxl1CqHBPuJ2iQ8UtE8VPtyDig23UygfSOYlqgTbvwJ7Xwz6O1fVR86J62zaNX+pukHle4t5CQz1FkmDr6HH4t+G7olHnKqa5RW+v9KSLu4I1dA9bawQ7sa3QDioWECenxEkK1ckvHnqt6RkZ+rhzeuFoXiuGnRylS6ElJg5yszr5nFpdag5KU4JDSr0xi8atq28H2qgUhCIq6LyjIezWi1tJCaLdHV4vlKYB5KQIJn4D4uC0VL+HIy7pMFCraLXuoyumoH3L6Dj59xBIv59ly74hcTypmFJ5TDIKrbbx3qc43soiEo4EgHIJUNPtDYwGy0WdNTQ/FyfohruBytoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4sjROHG9e8JtfAVyikDGBei12Axins/j1lEF16Dobm/AwCkxEYC4F5wzZXac?=
 =?us-ascii?Q?GxktcFelH2mc7EFIdALLmOqxygo72y8mfo5/FKMsM84G/Zk8VZtkt4Ddq5oY?=
 =?us-ascii?Q?FC0E7XRje36xENzeuwNkjGj15KsFO0fmHoWW8e9Nx/SzvAkct8gyoRxN6CVu?=
 =?us-ascii?Q?VRJ7jDETJVwwGb4D/V4CdgVbBoyznZHnaPtZUfJjqVF+EFk/UqP3PJs3rwVU?=
 =?us-ascii?Q?NaeD04cWB0762F2QfBICH4gAYudyDHuPKO7ot9BE/YPwTp6B3/dcw1lDkscC?=
 =?us-ascii?Q?Y1oaAn3ZmoSIxJLUNMrKDpEgLZd6bdyg8g6ncvSMW2+PmEIt9j7yP9hNpnob?=
 =?us-ascii?Q?T2eFQcYkV9S/j0i9hfUwJemhPqad5gd2SFriyeYwoRuS1jRpbXYDCiIAFeUS?=
 =?us-ascii?Q?1Jm1YMPRggyTY119HMiY18dqCo1RjyLShUcl3EOiXdJpkWzXmFh9fZm78hks?=
 =?us-ascii?Q?xBoX0blFKowSOrO41tBfFmheVDbFarsIc0bymh4Q0RKueAbLKmtzEhjY9ZoG?=
 =?us-ascii?Q?fiwy05WPsVt/qjATOd31j94mDFDfbNiioqwNMMlA3YQglSb+p+4Xtks4qXb7?=
 =?us-ascii?Q?k5yNdh6W/S8mkCRCEE3XmQVyP16iCdFmqKjnx3KTfMiQ8NXoDaq13bhOqxDk?=
 =?us-ascii?Q?/1S0PcxW/Z4cw6gqs4KD9lhK9jdIoLkthOjKW3LDGG5HPcf4nlVkuwBbNNwq?=
 =?us-ascii?Q?HYjMCLUm2bS7drE99cU6cg2swylNq0swBTFGMTgd/aMATg70zEDso3L6rrvp?=
 =?us-ascii?Q?a3SRj8U381K7q4o8/7Dn4DCL0+JUl3Oz0v+zVZqP/5ZrhH6mA6DZW8AiRUrY?=
 =?us-ascii?Q?91XPQ6WaweYY5FfVGMbV7k+5oh77cOFbHDbmUIfN/u2+m6hzcEri5XOXp/WR?=
 =?us-ascii?Q?hnr1KHtJSDYcot0W1p3pWcbKc2Qxa6+703v9cdX/HICmHgGgq33qtw1iI20a?=
 =?us-ascii?Q?3st+dRxjiRY+O4SlfTQcrVb2cQmxYZouvRHNHr/P6DqsPixUisSD6CiiBNqo?=
 =?us-ascii?Q?+hN24Qb/X37Yi1bRWToOltMJbf9kIzIJAZAluxJCnVFyL5L0lKvI5q9RaGNc?=
 =?us-ascii?Q?37koBpG4Nh942I9p3WuG5RdJwsvnk3bYoK683Z67PNj1QzjFtmRZ7uU8zSrz?=
 =?us-ascii?Q?sas8QCxN5PdZ3BNNUTudUb2J2MCFF7Q+ucy1Roe2GL35O+zrjA+N0Z0u8CaJ?=
 =?us-ascii?Q?Q4hRZFyJCfmB9EMom2aNSEbKbIDIQjRg26yWxsmtmLBADN/5p9WI+56gBmma?=
 =?us-ascii?Q?Sfe16dclwtzSjMb56FwAJTkquQ3TsCbSpNb3E008IssGtTJtb7MyrU7ANTed?=
 =?us-ascii?Q?svz3KDjXT5Ho8slX0/+dBwizdeOw5O1xEycLBtqwfsX4CzPRAOeRhda45caB?=
 =?us-ascii?Q?KDMDuVmsjZv7wRJuoT9YbDB2mnKF6rcU2A5ywwk8LCx2YRvP8f5Te3EoUckm?=
 =?us-ascii?Q?8KpEe+fg7f6TFeH3QybsqL24ZXQn2BW+KJlw2QLWdFaPDWLe561whlakQvAf?=
 =?us-ascii?Q?yaGQd6yQM5HwcPp6oa7YDZUd1ielQGtbly8cVSKAs7sodftmvoDl346PIJxP?=
 =?us-ascii?Q?9iUPB+a5zZqN1pCY/uXsdtvjG0PLWnqB8fdXnXHWT4gWx4m4NgPpT2YR7l9S?=
 =?us-ascii?Q?KDDuphtvctMT7h7Kolc8V5CqvHI2ZulVXMzYqTSbCMIrp6bahwenowWyMV7Q?=
 =?us-ascii?Q?adVo0w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7168303-b35c-4161-f08e-08d9c5722fce
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:47.1170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fLZ0ssYIIuEDh9U/GXqoJPsobKyzLXeWB1uoZm5fBBDTadC9OZnxy+8Fr3HYRZs0mb60fjeDYjZHaY+5eGkC5MbM7ZUaqzmSNrDDfoc14s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are on the way to implement internal-backup with fleecing scheme,
which includes backup job copying from fleecing block driver node
(which is target of copy-before-write filter) to final target of
backup. This job doesn't need own filter, as fleecing block driver node
is a kind of snapshot, it's immutable from reader point of view.

Let's add a parameter for backup to not insert filter but instead
unshare writes on source. This way backup job becomes a simple copying
process.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 11 ++++++-
 include/block/block_int.h |  1 +
 block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
 block/replication.c       |  2 +-
 blockdev.c                |  1 +
 5 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b47351dbac..6bac3b53fb 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1436,6 +1436,15 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @immutable-source: If true, assume source is immutable, and don't insert filter
+#                    as no copy-before-write operations are needed. It will
+#                    fail if there are existing writers on source node.
+#                    Any attempt to add writer to source node during backup will
+#                    also fail. @filter-node-name must not be set.
+#                    If false, insert copy-before-write filter above source node
+#                    (see also @filter-node-name parameter).
+#                    Default is false. (Since 6.2)
+#
 # @x-perf: Performance options. (Since 6.0)
 #
 # Features:
@@ -1455,7 +1464,7 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str',
+            '*filter-node-name': 'str', '*immutable-source': 'bool',
             '*x-perf': { 'type': 'BackupPerf',
                          'features': [ 'unstable' ] } } }
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c75e8ba9..efb85c41de 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1324,6 +1324,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             BitmapSyncMode bitmap_mode,
                             bool compress,
                             const char *filter_node_name,
+                            bool immutable_source,
                             BackupPerf *perf,
                             BlockdevOnError on_source_error,
                             BlockdevOnError on_target_error,
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..9b4b35b21b 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -34,6 +34,14 @@ typedef struct BackupBlockJob {
     BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
+    BlockBackend *source_blk;
+    BlockBackend *target_blk;
+    /*
+     * Note that if backup runs with filter (immutable-source parameter is
+     * false), @cbw is set but @source_blk and @target_blk are NULL.
+     * Otherwise if backup runs without filter (immutable-source paramter is
+     * true), @cbw is NULL but @source_blk and @target_blk are set.
+     */
 
     BdrvDirtyBitmap *sync_bitmap;
 
@@ -102,7 +110,17 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_cbw_drop(s->cbw);
+    if (s->cbw) {
+        assert(!s->source_blk && !s->target_blk);
+        bdrv_cbw_drop(s->cbw);
+    } else {
+        block_copy_state_free(s->bcs);
+        s->bcs = NULL;
+        blk_unref(s->source_blk);
+        s->source_blk = NULL;
+        blk_unref(s->target_blk);
+        s->target_blk = NULL;
+    }
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -357,6 +375,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BitmapSyncMode bitmap_mode,
                   bool compress,
                   const char *filter_node_name,
+                  bool immutable_source,
                   BackupPerf *perf,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
@@ -369,6 +388,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t cluster_size;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
+    BlockBackend *source_blk = NULL, *target_blk = NULL;
 
     assert(bs);
     assert(target);
@@ -377,6 +397,12 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
     assert(sync_bitmap || sync_mode != MIRROR_SYNC_MODE_BITMAP);
 
+    if (immutable_source && filter_node_name) {
+        error_setg(errp, "immutable-source and filter-node-name should not "
+                   "be set simultaneously");
+        return NULL;
+    }
+
     if (bs == target) {
         error_setg(errp, "Source and target cannot be the same");
         return NULL;
@@ -451,9 +477,30 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
-    if (!cbw) {
-        goto error;
+    if (immutable_source) {
+        source_blk = blk_new_with_bs(bs, BLK_PERM_CONSISTENT_READ,
+                                        BLK_PERM_WRITE_UNCHANGED |
+                                        BLK_PERM_CONSISTENT_READ, errp);
+        if (!source_blk) {
+            goto error;
+        }
+
+        target_blk  = blk_new_with_bs(target, BLK_PERM_WRITE,
+                                      BLK_PERM_CONSISTENT_READ, errp);
+        if (!target_blk) {
+            goto error;
+        }
+
+        bcs = block_copy_state_new(blk_root(source_blk), blk_root(target_blk),
+                                   NULL, false, errp);
+        if (!bcs) {
+            goto error;
+        }
+    } else {
+        cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
+        if (!cbw) {
+            goto error;
+        }
     }
 
     cluster_size = block_copy_cluster_size(bcs);
@@ -465,7 +512,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw ?: bs,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
@@ -475,6 +522,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
+    job->source_blk = source_blk;
+    job->target_blk = target_blk;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
@@ -502,6 +551,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (cbw) {
         bdrv_cbw_drop(cbw);
     }
+    blk_unref(source_blk);
+    blk_unref(target_blk);
 
     return NULL;
 }
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..c6c4d3af85 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -590,7 +590,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
                                 0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
-                                &perf,
+                                false, &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 0eb2823b1b..b6effd481d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2900,6 +2900,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                             backup->sync, bmap, backup->bitmap_mode,
                             backup->compress,
                             backup->filter_node_name,
+                            backup->immutable_source,
                             &perf,
                             backup->on_source_error,
                             backup->on_target_error,
-- 
2.31.1


