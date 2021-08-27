Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943953F9F24
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:47:51 +0200 (CEST)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgtF-0005Fk-KV
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRP-0001KH-Ue; Fri, 27 Aug 2021 14:18:59 -0400
Received: from mail-eopbgr20117.outbound.protection.outlook.com
 ([40.107.2.117]:18413 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRN-0006di-G3; Fri, 27 Aug 2021 14:18:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPnxXBZ3Fo4kDwYOYqjKo4GiHlXXV/9ivpBWVcXKiIhFYFhxNP1pF/ExSJQxg1wyz6Hq9LBsjQKfwrwiudfNezqJQvGkXnLqNJFRYg55W+ivGUclxvnmqH9pObv2xbaUvNgdylHudw7Vug9rVOFwoqHtCR2KDUDcKnRM8TqHyW0POGNf9YbMUZ+iQagGNzInI3LhTC3N/0DjCho8cYwOzTvoGpB7AJbO/FpbYJdw1kGbTwG4MbM9MVXgN4nRPI+PjuvC/NVy8PVVeTcju27D1C7JS1a8cpIMnVAwsKUUhbZo+rr3ZGyXFxCDzlCAJa8uCFaKooD3b3EaOHpzWXJ9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+H+qqSA4DXUqrnk6nIUOc1i9yni28xAe8/2mDTGYbs=;
 b=lIEAEUPZsYre8V2iyfxSojV+JiMTxI/lla7I71ptsG3cg9vDGDMPKbjvMePVlg2CFWP8f/bOt3s2V4jTWWANA6xnnHvRX+KJXs5JVUbX/m2JWK/VdTuf5WPsOMMcnDIl0QYR/vgozzmkwRHaZ5zFKcMUeOKvKcccthzIydVzHjxs3HBa9XtzdtuLYKvzyB5tAFN5POLXuJYuPaAqI803PwnFd2/J/VunCXhgBAJPYOJwBANvFPBT8IpQLRE4qXxAwdrNJZpa2/FUBupj51AvEq3pX3A9abkSTJcdKVHjppyTy99YQt0JTGlC577xYiCd0y8zhuxaxFXCUOidncpIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+H+qqSA4DXUqrnk6nIUOc1i9yni28xAe8/2mDTGYbs=;
 b=QhtAOKtluLeyl8IvzVdOI3WL0oib5pH5nnzVajF/JKymANY8/dOpWp4WWxMYLecnck8HirJmT15ShgtfSqdsSyCdvoQezfrUnX9ZAyT2Q+7NgGD3hyJT7JiAJ8xJPsLR785BQ5vh72qOKGkHf1uWmpnG4aSszUhumPT8HNNdR2c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 18/19] qapi: backup: add immutable-source parameter
Date: Fri, 27 Aug 2021 21:18:07 +0300
Message-Id: <20210827181808.311670-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95345882-f4a8-4128-4b46-08d969871c15
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37651FA0A331F194FD1716B5C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/Wy1UMNY+zmNuOUZyKnHtlw5yeSlfbpalum1mRwv1yFQcyujHs5r7cH7eUF8/PWbXf1yeSEWQ+GSjr/o2d65vQgZjX4beqoBjHmRlvRqgOu+fiq08SxJHpdHRdyUMhk9kXT9k2whD1dY89QvkI+3WfdWH6/RrgQCZcgTDd12QKBiLeqkKdsSpzFeS3IBWp3qUj+R35XQ/sPGZEbhityK6l1bUvFRux2CHYqOejTuVO8RkfwGZqS2UO9cKNHR4goduOep/5yduEcp6nHgFxSIXDGQWKmvXlvPlpOZK06jgcMJTLk5M+tTp4Nc4oLQHy0VbmzLU4Tl5VlVvliXV/kLRxPGDtVFawfEJxh7mdSZQqV+93L4mY+LWjORUwHVtJ/kCmDzr9cwgYqA5y1QH2dmskI/4n9GKOO2d1iy04H2wepdiGDKNyVSsfYHCQl6H+UlAla2zRxEM/o1UgmEnAu9wrV7Zsqj+2Uvt+lYaY4HQeR/m5ZH88fHR700KTqmpccRGWM2RkgJM6zE7MED4NbG2j3mVFBiupgS3TXAQ/ZTfF05RxRCqstyX166KZLOwzTYMXE33PIVmQrdiSFj3YjanEJ7aHj/VNGFfTeXx2tlpGmev6EH+Ww6zp7ujmLWGPFQyxWoYZJuhkpvBF4eQ8/RTc1E7UfwlMqwIgVABqJ0piswuX93wyjf3xSwsQsmViuE3/fyzroBBCHHTUfZ9iuGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?htVWXLpv7TyBVK2AfycBPfmb3pGUXBaGcOyitgL1UPWKDLapFwBW/gkWWYX8?=
 =?us-ascii?Q?71uWkXOUl8wGMFY6i4zp+HqBtWNA/H8ruf/tNiTgzd90ntfS5CKYXeyRXdLH?=
 =?us-ascii?Q?Vo8wIFyMAz5joMlUz5wQa9L5ZO7ItNUdJDoK/euYXu2rWW1sjF8RI9p43FhY?=
 =?us-ascii?Q?3xuFNFrDyiPIdG0aAbz/sRdX17UQ9cP63xhAIJHa2+Zn/TLcwsQs5yigO0nt?=
 =?us-ascii?Q?O97NGv92lOLW34HGV6Nk4nw49wIlGZyG37llhk2b/KEOB8E+GEc8y8deIoOc?=
 =?us-ascii?Q?rgCIpv5zQFiuSfizrA4o4R8X+Ny42cHer2QFCKRs23wVmlv/rxSBt9EYhZUI?=
 =?us-ascii?Q?usfwXx5xTVY+UHD9i5Y7sjluLTqat1t45v4ot9AS85pFnm/+9s/mZPApuVsa?=
 =?us-ascii?Q?8J4fgdNGeHsXduVs2ymwjYtBY+WXcxwLgIqExshFNSqywQIg5IU6duWGEaoB?=
 =?us-ascii?Q?LLE2PQoJd3N8qIaoQ9bdnfkS+r2w208xQzsw7K3DKqjNu0UF5cH6HDmSEcJi?=
 =?us-ascii?Q?kXGwaXUDk9Ey664WN8+y46/zNXYb0D2b0SbHynpm+dHdAkXFTll22Mq1aVLh?=
 =?us-ascii?Q?hE7r0mDbJG7WHvfCyiv7xTGJ4StikM8vbDtlXiMEHttFnunt+rXywz3rHKm6?=
 =?us-ascii?Q?P/bPgXldqKBhCFR1vy5h8eM4qWngu7IUpuX/honv6q2UmMqQ81t8ff0DQu6e?=
 =?us-ascii?Q?0Jhgyq+3fx1hoihAZZ6LEWwCITJUOm+iHpfyAROS4ErNgXQ/2u1472+aTZkR?=
 =?us-ascii?Q?HMKCZtpUk8SiEUbZUahFTMVsJmUXW4ZC2qjukoFi/k2QwfBvc/9v+StF0Y1a?=
 =?us-ascii?Q?M9FghW8ylvY6W1MmWD2YPf2nsDf3VILsxP4Wx/NePjWugb85Nl9vedId4+Fj?=
 =?us-ascii?Q?s+bZLYRxHbI53snUCpo3L0GeAgFYVTyYi3utbgzmP+tnbyKo2zw4ZwWwNqxP?=
 =?us-ascii?Q?ShkCPOVFH0SaGVHEK9FBoAW2cv1wP/GVgNE8ZwL+1OEZBttw0xQrCOm4MPSE?=
 =?us-ascii?Q?V55FnFI2RX+h7loLIm981aEB3YuK58nWlQKHyhAiSFCnA16ydlOhnO41jP0E?=
 =?us-ascii?Q?dH24oJGmzB4NO658dQ5bzcgza4vXagJ4KO6hnzUMZoZIoyYcO2TLeaU/1aZX?=
 =?us-ascii?Q?Nr9We9ya30BLGhTmli2B8qJW3laexd9E8UfeMqvxS6kWGKkuC88bVrdNngWV?=
 =?us-ascii?Q?Ijpys0OSJ2EKwjaKKQEX0E+nQAhTimaLLDwrnqfocWEFV7wcbsbxvE2jT4ox?=
 =?us-ascii?Q?JVeo8e7tX6CP7UOGwAQzH9wAG3fL7G5wQNJeUB7u9pQkHxiJOM1Sdr3kLdJZ?=
 =?us-ascii?Q?YDV2Te32849UZ9eHBLqIS4pp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95345882-f4a8-4128-4b46-08d969871c15
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:46.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wICWSEzunN7C2JETW6To4sm+Z2C7x2WIaaUAYjpEUGvJohRvLYm0lCU9B7ZG/hbdyeS5FHgQiVBPTMy73yVauNKzQdu13L6foySMzDHxqM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
which includes backup job copying from fleecing block driver node
(which is target of copy-before-write filter) to final target of
backup. This job doesn't need own filter, as fleecing block driver node
is a kind of snapshot, it's immutable from reader point of view.

Let's add a parameter for backup to not insert filter but instead
unshare writes on source. This way backup job becomes a simple copying
process.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 12 +++++++-
 include/block/block_int.h |  1 +
 block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
 block/replication.c       |  2 +-
 blockdev.c                |  1 +
 5 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 8a333136f5..995ca16a5e 100644
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
index 687d2882bc..a7f4d0d663 100644
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
@@ -450,9 +476,30 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
@@ -464,7 +511,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw ?: bs,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
@@ -474,6 +521,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
+    job->source_blk = source_blk;
+    job->target_blk = target_blk;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
@@ -501,6 +550,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (cbw) {
         bdrv_cbw_drop(cbw);
     }
+    blk_unref(source_blk);
+    blk_unref(target_blk);
 
     return NULL;
 }
diff --git a/block/replication.c b/block/replication.c
index 32444b9a8f..5dba4907b8 100644
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


