Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1759A3F59F8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:42:02 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS0J-0006a6-Kv
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy1-0002QI-EK; Tue, 24 Aug 2021 04:39:34 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRxx-0007OJ-Pq; Tue, 24 Aug 2021 04:39:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDiH8hMjO98xbgFDuIkkK0A/vlknoTt2hhqfhgaGJZ592kh9SNOOFtCjjW2mIfyTk6fyFuq+grNhEFx6NLxQK4Gipl43P2XS9kqYkjpN0Aqw+2T2BCPat8O+7K+yAyIgjqe69Qp/nebKSKvUHpyMwdKlVWeW6nkGqOlgfLzCLT5QpfJ+Cgt9EwUHXZOg29/EBzx8AokIzgqOBnsAoXuIhT/i10kBkX+fRGr0DIurgRYYwvzTujeWh3wG/qUEUyLusEhgwih0S1k0qcsT6lr/Ui6Wrn20riVgFnSEsliydi+tgtP0ZQwc3s2jJviCR36iWNMrvzmWbi5hOAZ8+NU/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGFsR28a9SvCr+P+ded0x8efbgfwajDijpO2fyun2f8=;
 b=FOlEgqThbMw0fs+tiYuayhNU6pVbxwsTW/+Tt+0AxGalOXRit/uNRNtay43hTL0KAfSWa2zUffqZPWsCWlQoLUMxHUiSKfmtFZuXyE2lUFfc1CxNgvdwuUNt0Mr4Rz6FvhPn74boXnQxhTGBMyL3BdA1ytrtRgz75b8zqBjv3L0f2xgBIxa2NnLGJ4UaYVQ4fYNRdkpkCCpaKHhidfJvdi9KeD+OiVbOASDClw7iPhh53FpX2VvZlgUWhlhRbm9ARDWDO8yTHqAsMStK6q0y/e3FrSnprbcL37TyD+K0JM1g5MOMxkHyFA6DNfhsYFtFwxRnys9coaIcIvxBhQuOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGFsR28a9SvCr+P+ded0x8efbgfwajDijpO2fyun2f8=;
 b=HmTZMe27t0w+gQobIWKivhRXczA4x109kbYdYUrniPUE/lODx1kyojcWTJ2R2C18qPeDdKJ6coACWk0fugvhtqI7yWyulCtlLsHn1AqhrsFUpDou+4o5uu67xFPhr5j1UvOxjpmZpWbJDZYgMyr6IRdKXCsqDn2zYKCZwctOHsI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 06/34] block-copy: move detecting fleecing scheme to
 block-copy
Date: Tue, 24 Aug 2021 11:38:28 +0300
Message-Id: <20210824083856.17408-7-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd152022-a0a5-43c8-db9b-08d966daadee
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17805A217B00DA55F2770629C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utY6Uvb7bbY7n0JE2/L49BgyWAAVWnkFbXNPPmzkrwmIKJBuaWGt0rP3Mmc0/+snxBWS4tAdMZySIA8nyW6gJqNIBil3T68D2NTgYlE4aUv/+vWlkddl0SXEefV675QZmyo7/bLm/m2H+wJN5+WjWwiaFHyRuJPygHu4j4KimNaYKvikFbzjFTqbXFpXmBrj6frWrh0O1KmuJzPEdhsuMxYrioro8gcq6kosEpQRcFVhTAcUWCOeqmygLEDY5me7MtBjHGvM3irYdYhTwDVnVRaAHhKf5Sq/0mTv5b0bDzpUMr/4MAdYF8kxqn7jkwYIKys/MN94+pZaiaihcUcTxUNIxNXIPQy08VtIpW9lFPIkzMU6km2FFWpo3tD1rkA36y2GoMNXuy7WLOv6ZhRToRsLAk3iv1Ryc3X3X99prq++6KoKBuZlqPntCylxeDwNgzZk/nx34z4UwcKfOoSaHoaA929EhCk1XBaqKCvZ2XFX4cJXk1//470C2mfwqGPVwPrGGdbPEWCcuCfd0NKay+HnuQj5oGwygbqFTHL4u0Z8hGidTzsNyUgoycYdRmoC/EHBli81+5D0sb7rcFVlrjI1k3vtOlT+coSSGmKLCLd/wjrtOTr5tchtJt4a9uxarGLKACi/ePROQfVJF5p3QySkbalMeDijQwljd+4VTX6Qw0xALB80y5n0e3NcJn9WzqGtphvaRzqPW5F43uDddA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jczJwBQlIRJXzPYycMnrv/QDTK+vbo2lQznnd/1CW2tIWEd6AcmhyJlqU976?=
 =?us-ascii?Q?j2qyK23Un8VdLus7VP9hb5x7IP9gycv3reGHQHNqlZG3SayUhUrQ7GjpTklF?=
 =?us-ascii?Q?8AoNN+n4UQkYDDc4pk4jU1DkbJZWIRPVmayTHNaYEqqpF/Yz0HFLiYcddNZv?=
 =?us-ascii?Q?SvFZflwGtfzW0p+Khen/wnLX1r/7cu1z4Sr84REb9QTVLgxRmP/cMxRlY3/b?=
 =?us-ascii?Q?wK4dFw0oUEj1xr4CwKjNoLpHOmoD/VrGYEqqyTlaA0MiE3z5vCVQNxn+58UR?=
 =?us-ascii?Q?1fIm3+mP5aHXpWE5xUSImWJ7nVKqxqmUfSeKanb598dqSJSEHBXX3IEvupH7?=
 =?us-ascii?Q?+//y+Ga5pZHrf7MZIOFG8pBxeZH2XMvaPKtNE7DRG2140d5qbWhwdV6XxLQo?=
 =?us-ascii?Q?xFoyFR9J1ZG7ayFH8LEotXOxCY+U/8/GcG0386DolF1gSzFGliLvNZ2kIw/z?=
 =?us-ascii?Q?/Y+9dhK4o2mYXqC+VeMFLKjhdnCRxzaS61Y1b8quJz80txMwSSn+hHRqhKTw?=
 =?us-ascii?Q?+p0R00ck/F2BTyXI48dhfY9JnzO/T1L2zVBmvERJk+B4nWy6QMOnxgu1IX5L?=
 =?us-ascii?Q?d4zC2zg1ek5xjQZkrZDWdZbuXd3kwkt2BGkOZOyhojczic4fYbhMIWtyAZD8?=
 =?us-ascii?Q?qoAGR1Rn3HzPWonwkVbjmrWDEwOGFqyzHslN20gJZxV05BPtPBIBOF7MNVjm?=
 =?us-ascii?Q?8UPZCZtikOH7ZngVz5tsI1cvEjkcOv0wwKhFQ3dCa7GUNHZzgM4fjHMUbPyt?=
 =?us-ascii?Q?SK1qzsje03ukapD8g7tg9x9jRFHCkSfIBRIEpiGOHHoR7rdu5PDoItxmi7z1?=
 =?us-ascii?Q?CosfwIyYXJIDPFxkLQirPOaQOBx4z1tRPr+6LYUVbJt17uY/iB09vkNtS+1M?=
 =?us-ascii?Q?dtW0E0PfokYUdzqsa/bQ8tpTanVuwUZ7Dj8qQwsHRL82zaGf7I6TvTgtbQ5j?=
 =?us-ascii?Q?acnhkuwfScfvFMQd74qnIGMKKNkLZiJDn0Vxc/HV0ZFr+8dJ2ghQ10X+Lqim?=
 =?us-ascii?Q?zLim9uZjpY49Giz+XHtambR4t388TwCoqd/RvTZ1IyGh+op5NWAlEg7+g+gK?=
 =?us-ascii?Q?swS1UA4U10Uum7JjOOcOLsVrInjBTE2EprvcF7y5Ypp97Xs5OfgElrBpDG8v?=
 =?us-ascii?Q?UArDWO+y3C7kUKHkvPXQxdZqbzpLpt9/t6hpgPJnOtWKwTQoN2HlNbDGGkj5?=
 =?us-ascii?Q?WfZvYhCs9aGqodoa1gGlq0AsxoGBeYROyyKQm9SOaACA2OUTEf3LphOJI+mK?=
 =?us-ascii?Q?CpdcBZdE2HqmVvXpiBjl/YLLC4YrSYfiM3N2aFIURJPk/zNe7HfEcWd5qLGK?=
 =?us-ascii?Q?ZCeED9iFRkIAkbawPFMQ+7pk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd152022-a0a5-43c8-db9b-08d966daadee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:25.7846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMtd74pfeeWFjLpEv6T6a4+RPlinYKH3cfhVjwl9YDhgRkcjOvNZEGdF+Rhv8yFGTOQzHTNuPC40KUkhB7vST2gNaVToVXn1JHBXayp/qJk=
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

We want to simplify initialization interface of copy-before-write
filter as we are going to make it public. So, let's detect fleecing
scheme exactly in block-copy code, to not pass this information through
extra levels.

Why not just set BDRV_REQ_SERIALISING unconditionally: because we are
going to implement new more efficient fleecing scheme which will not
rely on backing feature.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.h  |  2 +-
 include/block/block-copy.h |  3 +--
 block/backup.c             | 21 +--------------------
 block/block-copy.c         | 24 +++++++++++++++++++++---
 block/copy-before-write.c  |  4 ++--
 5 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 5977b7aa31..f37e2249ae 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -34,7 +34,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 5c8278895c..734389d32a 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -26,8 +26,7 @@ typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags,
-                                     Error **errp);
+                                     bool compress, Error **errp);
 
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
diff --git a/block/backup.c b/block/backup.c
index ac91821b08..84f9a5f02c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,7 +407,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t len, target_len;
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
-    BdrvRequestFlags write_flags;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
@@ -504,26 +503,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    /*
-     * If source is in backing chain of target assume that target is going to be
-     * used for "image fleecing", i.e. it should represent a kind of snapshot of
-     * source at backup-start point in time. And target is going to be read by
-     * somebody (for example, used as NBD export) during backup job.
-     *
-     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
-     * intersection of backup writes and third party reads from target,
-     * otherwise reading from target we may occasionally read already updated by
-     * guest data.
-     *
-     * For more information see commit f8d59dfb40bb and test
-     * tests/qemu-iotests/222
-     */
-    write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
-                  (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
-
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                                        cluster_size, perf,
-                                        write_flags, &bcs, errp);
+                          cluster_size, perf, compress, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/block-copy.c b/block/block-copy.c
index 0becad52da..58b4345a5a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -317,10 +317,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
+    bool is_fleecing;
 
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
@@ -329,6 +330,22 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
 
+    /*
+     * If source is in backing chain of target assume that target is going to be
+     * used for "image fleecing", i.e. it should represent a kind of snapshot of
+     * source at backup-start point in time. And target is going to be read by
+     * somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already updated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
+     */
+    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
+
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
         .source = source,
@@ -336,7 +353,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
@@ -351,7 +369,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          * behalf).
          */
         s->method = COPY_READ_WRITE_CLUSTER;
-    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+    } else if (compress) {
         /* Compression supports only cluster-size writes and no copy-range. */
         s->method = COPY_READ_WRITE_CLUSTER;
     } else {
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0dc5a107cf..4337076c1c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -171,7 +171,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -218,7 +218,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
-                                      write_flags, errp);
+                                      compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


