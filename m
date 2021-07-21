Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15383D10E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:10:47 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cvu-0002aY-SN
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqP-0002YN-Gz; Wed, 21 Jul 2021 10:05:05 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqN-0007Ca-1a; Wed, 21 Jul 2021 10:05:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUwW7HN0ZdMrULsS9nyYD7HBKgrJAATU2G9yJrggbowCzERK60k2N5gVWaJRffS2q3eymESYJr9moGXT4p2j3l1lSfCDcjjuy5w9v/Vwr406gUCzLLENWWYJmsFMAZwaF0t+ZEjOdBr7WMAVcWalcH4eMvnex8a8urgAks2vBPXeiOCCyEtYIyz64HRUc8/ZQNHwEyW1rhm7Zsdx/ey4ZuC9Q1mpXG6HMm1qjsO5hv4evgUPZzLG2ZZzYU3lXe66fTPCa5FhKxznEpTNVdks0KSD4FbQ6X+/6A5FVS7iFl1HXU6S3UVyJOz6CI8qE3Nj4JDYWkvHLfhgBQXuoFChiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLisOIkdcfkCPVNUw6rSKkNVPe8yX/qz3Ja1yfN5I9A=;
 b=ZMd+PR2mKdYgkZgui7GCgJxlddS7wsDy5NN5sbxE32n3ihOvafcatY8H67S7FDfsTirk8mMNtYfdEw38brl/w9Gfey8/op7N1+Wkyio8bEKslyM64RNmKpK69GglJUGkODjIkoKFLm5IEAjPiqUWZYEqcVoOo/jeexGFjKf9YaHv2R5NRhKqPccHknGigKC0W98NqiVVCvOUYfOUEbn6NSbfOw5M5JPpPXMxpIGYf9y2+pObCyWFcezXQWSDlHh4KeradrmgLONYWKrPFqz41lfTlVmEFGBxc8ytCAjZuFo7/XbtzeZ4s/IozYTfco72RMee4K8YiqCgYD4yAVVeww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLisOIkdcfkCPVNUw6rSKkNVPe8yX/qz3Ja1yfN5I9A=;
 b=GPzhxf9Gcom8alobb9jsEU6rsD4miluepAGCEchTA07glqSkCz1SfWRgVveFwU27uoyv+p/d1fMtGKXRj/JyAPR51WX/sBa8+5FdemuDg9TYYiUIEN8GuTLWEU0TH8fC5qz4yEN7EZVrwwoOFXn01aNL2EjkRCpeq6G8EBvBpsM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 5/6] qapi: backup: add immutable-source paramter
Date: Wed, 21 Jul 2021 17:04:23 +0300
Message-Id: <20210721140424.163701-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d196d29-553b-4f82-412f-08d94c507ea6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63740E08C0EA1571D6968F0DC1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01MTSSsuM57ZLoTo69HO6qpymoCTZ1dw/efYceKnOj38lkfr9FHZBfKilhpvmBqDH5tXkGABaRR/WIIWpfqmBAZdwCAL6FakXQTimwEmXmqa2zBq1P/j4+y7Fzq2iYRwrbnRpnzDYd1+kNMiB/HEYqFyvY3ueKCIfJl+WJQNtsyNW32R5xpaWHu+NwB3BwLS2PnFUctw/GdGL9apdoSx5+eHstNhQcyM2sLgIbH35bvBH+KxAVHCYhNJMMdRCTRcmewBjSUIKShIn7nEvFmu1B6Pf2/ja6TuMV0b90XvB3BqVx1Fmk0XrNrrChxOazCD+JwxnAhbfJhx3ZStRjo3DNzKlVilW/PGn4cnP+UjNBOc1IWruiA3L2C9SIY4ZCE+HAFwMegzP/3N+oXOIzDxJpxj4r0Ak0lqqa26i1Ek7JZUDOvS33iozhuCBW2LV0F/PWTfdPE2rGo/Xw91bwGuYAxu6ej6tqj/8h6PgmglG9pKQrAaJLQrda+big1ablqyaGYjRhR1L7G1vSvcfM+F297gobqtOx3u+v5aia9SjkoHitkXT1QEtpJxxUhCa1AHm0DMlJ0+D1i2jPwNBBxHEXYRzSSS5ztZKZPvKQ6EfSeF6Tt2wWaQc35/tTJU934jY54u6H8N09TtMymCYun/ZJuUEivTb543rVHy/m+gfiyJzggmHpuHRtm6k2uxHpnoDmcUNExtpVQyeKkuxgymOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KEVnwlgm/UKoA+6iD+pbenmm5X7nvW2CLY+faDqX4bhqkUdg1lVFsOY8nhzE?=
 =?us-ascii?Q?cB2Mzjz2QzQZsuWEBIy66u+wgMldbb4RB5adDCmEdZStAW7rh0M/PO/FtHgP?=
 =?us-ascii?Q?xp737xbCk3auf+rH6x7zujfuBjquzgDCe2ki74jJDwcTGwA5pmQuxRfdpDSm?=
 =?us-ascii?Q?UOg+OIZKLSnsbKUUjgU9ZpZaZvUWZrrnHFRqbLXoNv9H5gnR6/1hDt7iJztA?=
 =?us-ascii?Q?7XxWCqhyBBvR+c4gWNA7UHvSFxErHoureu+le1+U5P0Ovc27m+4dKk5Z3MPR?=
 =?us-ascii?Q?a4jfipZef74nBdNiRQPVbG/1SDWZxagef52lYHBaR3+rQmt3oUS/YFZACG02?=
 =?us-ascii?Q?a0ha+iruH0/gPCYoIGllD/nAke5rQTezo79kvyifqQo2mNOJEY7963PxDpTC?=
 =?us-ascii?Q?mFlMEyYHLF66dNjfTyE7Y2BkQEPgEkCAOoeNBeLeu/JbGztQu1UjfCmQT8Y5?=
 =?us-ascii?Q?6HsfeF15kSkyXi9CZ4ISJoYanteUL460LUAdclRax1s8gikCKFqg9DJ3eG0p?=
 =?us-ascii?Q?sewsTgZicniSsBruVu/0xzys9oJaUsTVBcWrkrhLgy0TJsJyv/azoPJSWYRO?=
 =?us-ascii?Q?wYyBMLpyRW1fYw45i72CrABow93BsNRAVdZkpTqyXZVBGMVu1OHcKcFzaq72?=
 =?us-ascii?Q?UxIW8IhPGd6x351J0xwJppqLzzJ4LdUgt1zwK/qDwJ2rqIUafzS9f1BMjKDP?=
 =?us-ascii?Q?NNbd4GMFtpN3hvAp8+waRvdoW7uxF/vap0nUr5sV9hKx22k/Stu7no3zfrPQ?=
 =?us-ascii?Q?LdEpSLXWkjDaYa1IfecnDlHASb6eYqA1BifCFX3dA4z1ierbPBsc2lFFL80A?=
 =?us-ascii?Q?SD57quONQqW4T2Be4baMMacd/10lHYOY/IYZwfKGeqw3UyPCbu+hwFBbyVgG?=
 =?us-ascii?Q?eRaL0CJpKxVkdsp5px7SG3F4otrV1FqlBt1D5ZzQrHGhQJbBoW/ydDDBRMi+?=
 =?us-ascii?Q?mKvYty5hbcYaqh7vhnA6z49XtRY4rsujnl+kARwMVsIowaFDcz83+RNtnc6C?=
 =?us-ascii?Q?WcSsxP1KkLr3B5XrvQcXltIerUNfEhnvfUzIOHRo5ZTaF3zuasOOIClhx3NY?=
 =?us-ascii?Q?fyKekM1FaVLPjgFlDZ8o2xHelBdFKedC6d6g/deecM13WGiFmFiJzIhQB/aW?=
 =?us-ascii?Q?k26X++LjHQWE/go7EiTeMAqpRjnPD5UfjvcbZuIidMkfVbToF41WyRfcUK4Z?=
 =?us-ascii?Q?hGu4F7EOxVc5UxzcNutlWekL5lmC/JwUtcqxO4ZA3+nF05AgzMa8kup7ARuN?=
 =?us-ascii?Q?0D/kj0frYDnvmFmQ542ApW66u/aBF4TMeGGI+ozv6jyY5z6Ahq3Deiyc11LO?=
 =?us-ascii?Q?VlOGPjrPUAF/86lPomzOBhoE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d196d29-553b-4f82-412f-08d94c507ea6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:45.7715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKbH8FYp0AIXjNVUJ2rVPeD+hVGy6j2qP29KI4l62f5n1kapaLu1yNKrsdYcpkoEk6aVnMkcrBbx+SiYfAJZuW4yKChviQL6iKuzh5YPxRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We are on the way to implement internal-backup with fleecing scheme,
which includes backup job copying from temporary node (which is target
of copy-before-write filter) to final target of backup. This job
doesn't need own filter, as temporary node is a kind of snapshot, it's
immutable.

Let's add a parameter for backup to not insert filter and handle
guest writes to source node but instead unshare writes on source. This
way backup job become a simple copying process.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 12 ++++++-
 include/block/block_int.h |  1 +
 block/backup.c            | 71 ++++++++++++++++++++++++++++++++++++---
 block/replication.c       |  2 +-
 blockdev.c                |  1 +
 5 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 59d3e5e42d..d266eceabb 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1391,6 +1391,15 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @immutable-source: If true, assume source is immutable and don't insert filter
+#                    as no copy-before-write operations are needed. It will
+#                    fail if there are existing writers on source node, as well,
+#                    any attempt to add writer to source node during backup will
+#                    fail. @filter-node-name must not be set.
+#                    If false, insert copy-before-write filter above source node
+#                    (see also @filter-node-name parameter).
+#                    Default is false. (Since 6.2)
+#
 # @x-perf: Performance options. (Since 6.0)
 #
 # Note: @on-source-error and @on-target-error only affect background
@@ -1407,7 +1416,8 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
+            '*filter-node-name': 'str', '*immutable-source': 'bool',
+            '*x-perf': 'BackupPerf'  } }
 
 ##
 # @DriveBackup:
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8..6571dad061 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1284,6 +1284,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             BitmapSyncMode bitmap_mode,
                             bool compress,
                             const char *filter_node_name,
+                            bool immutable_source,
                             BackupPerf *perf,
                             BlockdevOnError on_source_error,
                             BlockdevOnError on_target_error,
diff --git a/block/backup.c b/block/backup.c
index 687d2882bc..2bf0840bc2 100644
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
@@ -356,6 +374,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BitmapSyncMode bitmap_mode,
                   bool compress,
                   const char *filter_node_name,
+                  bool immutable_source,
                   BackupPerf *perf,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
@@ -368,6 +387,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t cluster_size;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
+    BlockBackend *source_blk = NULL, *target_blk = NULL;
 
     assert(bs);
     assert(target);
@@ -376,6 +396,12 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
@@ -450,9 +476,40 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
-    if (!cbw) {
-        goto error;
+    if (immutable_source) {
+        BdrvDirtyBitmap *copy_bitmap;
+
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
+        /*
+         * initalize block-copy state and copy bitmap in a way copy-before-write
+         * filter do it, to have same code path later.
+         */
+        bcs = block_copy_state_new(blk_root(source_blk), blk_root(target_blk),
+                                   false, false, errp);
+        if (!bcs) {
+            goto error;
+        }
+
+        copy_bitmap = block_copy_dirty_bitmap(bcs);
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    } else {
+        cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
+        if (!cbw) {
+            goto error;
+        }
     }
 
     cluster_size = block_copy_cluster_size(bcs);
@@ -464,7 +521,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw ?: bs,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
@@ -474,6 +531,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
+    job->source_blk = source_blk;
+    job->target_blk = target_blk;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
@@ -501,6 +560,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (cbw) {
         bdrv_cbw_drop(cbw);
     }
+    blk_unref(source_blk);
+    blk_unref(target_blk);
 
     return NULL;
 }
diff --git a/block/replication.c b/block/replication.c
index 774e15df16..8839ababa4 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -566,7 +566,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
                                 0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
-                                &perf,
+                                false, &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 3d8ac368a1..3a8ff7c5ce 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2911,6 +2911,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                             backup->sync, bmap, backup->bitmap_mode,
                             backup->compress,
                             backup->filter_node_name,
+                            backup->immutable_source,
                             &perf,
                             backup->on_source_error,
                             backup->on_target_error,
-- 
2.29.2


