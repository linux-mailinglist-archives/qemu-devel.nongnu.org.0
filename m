Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF92C6867
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:05:55 +0100 (CET)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifJq-0007N9-Up
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1D-0001Nu-Dd; Fri, 27 Nov 2020 09:46:39 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:40192 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1B-000369-51; Fri, 27 Nov 2020 09:46:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzq5ZaQO4zIM6S/QaWTekG4WVmf9IrHFfx6qf1/L79pWvU/R6CRg0IjkdgU/y5yQpFvH46gtVObkoZs2T8/hKJ9hd7fU5UGRvXrLkOXIwVctASXxk6HF7mGl23VW1yv6fo6lYBxcGm7+Um5sFkYBTxFeborhMLE84QGB/ce4EB2QsZDwiwgUVdxmqyMeNmtL7kdm9cdM/15qpxT9oLJF2PHufguw5bhQdGY9eBwdndN/K+uPcbRalRzFVLzWU2oX7hPVtWQOzpLz0ilywejHOb5t22ZTZwoFC1PVL7cRX7dJ8WSTJPyt2DKGt3lmJhctAZcEjeZypQb1MRN/eah7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opGSjhBhIR5jpeUJk7EWNVLixLNA/jtLFIFR8IV+GsY=;
 b=WapzlG2TPyBGtI0hFPVMziyuR//Oo/KBPEkDA5yJgjr+xOmJHZz0VHltPMItkbYEqjMVlCT7kRRfkqiV8vMIIKdsnzzhSFUrSZuHgx1vXpt9sYaRSuXBkAhbOv2OUgac4e6Dm5FeqvnyuPe2NcUokAMRcvgRXlb5S2NV+ZozeyJfWxsB8Bn1HFyzPLDXmKjkULYnClINYP2SnR4DHvBEGaS0Jpn7VT4sAZhTvrqKfCJRNsfCnN5/kQFVaToSZ/DCE6ptrnnPcmrZ0FQElSp5mRM6ccqpmTTJC7gUaqQYYsIvUnnodJugL0lLzDIWDzcXw6CalG8HvK+3mKu0tZKXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opGSjhBhIR5jpeUJk7EWNVLixLNA/jtLFIFR8IV+GsY=;
 b=mIEY2remjTZkJGUeQXXapvVg4t93hh6xqbHAqF0cjF89UvMKQKuSdUQS7j6YG1Boo3kI6uNOBNYA5QWgNRnb0VPJgMg4IR8nrJJy38J4gXCgHelZrsr0O6ApOxp7nXpW7EUysjeVRQrUbitxrIbfVpKxjwI7S2ihdekzRSAGGes=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5128.eurprd08.prod.outlook.com (2603:10a6:20b:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 27 Nov
 2020 14:45:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:45:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 03/36] block: bdrv_append(): don't consume reference
Date: Fri, 27 Nov 2020 17:44:49 +0300
Message-Id: <20201127144522.29991-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b86f5ad8-6835-4e2f-e2a2-08d892e31b75
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5128E90F0A0D5081010BACD3C1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0flvWfw66MEtc2Q2BccfcMZaHCf97C/vsbOJvl1ZBxHntz/5f1J4vNw6U9IJhzqgJxbNtEXs4ayU7q03q4xnyhk0PsyjigxOj8pLvEONyWwYZfFRfj6Sz2kj8ndoT3O27famZ/yrbJ7MbgwoqAn6C8mKEWPUjKO7c5AwDr2PQgCwQLY38PJ/s/6sOB9mDdvzQZ7Iz4sTvI2p5OKsF7sOKRMxvO6564DH+LAYgJb422xKbQOScUo2fBuP6aoiIMf0IP3esmsa88EbvljA2T6KFl3ojmY6Kn8BWFcd6ayi6BR2tlAsopI66Vmq36bqpB+8pTK53WJ5rUWk2zqSJ272M3KBsWVyW09rIzDCEX2PSoQL2jTJrSa4cXCgm6YM8XBB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(186003)(6666004)(69590400008)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Jsz/DcUKrDIMf293uPrK98wnX/SmZqHQXDHOA0nb7KgDSoBhbN1vQjl+/qR5?=
 =?us-ascii?Q?cjvclBOoWmzK74vbGT2SfkZ/o010OdQwFNTQV/X2oSHFhR/UfvlA7gYiCw+c?=
 =?us-ascii?Q?RGFb/U+3SWa2C5RgwzR69tow48zBFTZBL3/GJG0RWj4QoWCbMIBXV37Azy2P?=
 =?us-ascii?Q?1d/jwknEZPur7Sh5RsuSppVc+gZO2e/wH4G+FB5feRs6Obh5tGr8Fv2wXryF?=
 =?us-ascii?Q?wdeCOVqH6NYe6cCUuPEMKhmThaErmOR5wZg4KnBo+pGNxawJQci8G8zWZyYa?=
 =?us-ascii?Q?dRgHZDRGE8jkJPtdNnNTWfw2TyqAjHlmdOMq4ev4mLwL/Ibw86O5qHYRZW4Q?=
 =?us-ascii?Q?8A4nLrqdF+p0JjK3GRfO3nz6mVRA4EBy6r1YQ0DUEpEJQ2aMU3WVx4iXhJXf?=
 =?us-ascii?Q?Xkb3NnNbiHhhnvinrAqsQHTIFWvoeaxAsQuoPNkQVXUhgkvaWV2TkyYuxp+L?=
 =?us-ascii?Q?hNjIk/Gm35sjcSwgTxyWsYqiU0UtJDoUuBR9hADBHmSntaswIhbdSupNr0Xl?=
 =?us-ascii?Q?yX1+ybU51NdjnAWDC41ygfAwTrM0KVo9QgFzlMAgiFLfpzOFDlBAYvbKqJMA?=
 =?us-ascii?Q?l+dkV6cg/d/KMpgk2AihrfD/Fn58s5B4hp8AX+9jMlCudX0XftfGFLB+zVZr?=
 =?us-ascii?Q?jwyiSrq8E0kw2X06xT73Sp76YZ9JSTMwGGL/Qlgge3vO1h40CCkMChTV8Ozd?=
 =?us-ascii?Q?CnLqZAqdm3/YJscrJ0tx7+AYynwPHswbh2awyPOdW8S5D4PX4l42c0k2HP8f?=
 =?us-ascii?Q?sQ4QYHqBFJY61pb9FxxciGqA3E1bH0sIWxfMXMEsntsfaKYzWzDTQcRCZtnO?=
 =?us-ascii?Q?wXsB3Qz1IUVCq7o9Q6xRp3+Due+ovvK1wg+b90LWBUABP5ziONeaCzd++xRZ?=
 =?us-ascii?Q?KN+o+zAuv98WsdLQx2UeYf4QA9XftKlpaYiHjZzjuJGju+vWyfJfhmehvmgG?=
 =?us-ascii?Q?k6e09UAdF9c5qlBTJlB86wqAepCN8tnepGveATMYalZBKrt1+BmPZgQTb5xf?=
 =?us-ascii?Q?iC58?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86f5ad8-6835-4e2f-e2a2-08d892e31b75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:39.0669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyGTIRCh68Rg5Z/xNVEdECOoHHxBCz18IRYUOHpVMVVdB2kzhaLKK7vbKB5yDgE6qx2qqBDvDb3W8v9SLIAyMbpB8w2ID+MteP2u6Ev1SwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We have too much comments for this feature. It seems better just don't
do it. Most of real users (tests don't count) have to create additional
reference.

Drop also comment in external_snapshot_prepare:
 - bdrv_append doesn't "remove" old bs in common sense, it sounds
   strange
 - the fact that bdrv_append can fail is obvious from the context
 - the fact that we must rollback all changes in transaction abort is
   known (it's the direct role of abort)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                     | 19 +++----------------
 block/backup-top.c          |  1 -
 block/commit.c              |  1 +
 block/mirror.c              |  3 ---
 blockdev.c                  |  4 ----
 tests/test-bdrv-drain.c     |  2 +-
 tests/test-bdrv-graph-mod.c |  2 ++
 7 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/block.c b/block.c
index 0dd28f0902..55efef3c9d 100644
--- a/block.c
+++ b/block.c
@@ -3145,11 +3145,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    /* bdrv_append() consumes a strong reference to bs_snapshot
-     * (i.e. it will call bdrv_unref() on it) even on error, so in
-     * order to be able to return one, we have to increase
-     * bs_snapshot's refcount here */
-    bdrv_ref(bs_snapshot);
     bdrv_append(bs_snapshot, bs, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -4608,10 +4603,8 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  *
  * This function does not create any image files.
  *
- * bdrv_append() takes ownership of a bs_new reference and unrefs it because
- * that's what the callers commonly need. bs_new will be referenced by the old
- * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
- * reference of its own, it must call bdrv_ref().
+ * Recent update: bdrv_append does NOT eat bs_new reference for now. Drop this
+ * comment several moths later.
  */
 void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                  Error **errp)
@@ -4621,20 +4614,14 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     bdrv_set_backing_hd(bs_new, bs_top, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     bdrv_replace_node(bs_top, bs_new, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        goto out;
     }
-
-    /* bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more. */
-out:
-    bdrv_unref(bs_new);
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/backup-top.c b/block/backup-top.c
index fe6883cc97..650ed6195c 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -222,7 +222,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     bdrv_drained_begin(source);
 
-    bdrv_ref(top);
     bdrv_append(top, source, &local_err);
     if (local_err) {
         error_prepend(&local_err, "Cannot append backup-top filter: ");
diff --git a/block/commit.c b/block/commit.c
index 71db7ba747..61924bcf66 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -313,6 +313,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     commit_top_bs->total_sectors = top->total_sectors;
 
     bdrv_append(commit_top_bs, top, &local_err);
+    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
     if (local_err) {
         commit_top_bs = NULL;
         error_propagate(errp, local_err);
diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..13f7ecc998 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1605,9 +1605,6 @@ static BlockJob *mirror_start_job(
     bs_opaque = g_new0(MirrorBDSOpaque, 1);
     mirror_top_bs->opaque = bs_opaque;
 
-    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
-     * it alive until block_job_create() succeeds even if bs has no parent. */
-    bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
     bdrv_append(mirror_top_bs, bs, &local_err);
     bdrv_drained_end(bs);
diff --git a/blockdev.c b/blockdev.c
index b5f11c524b..96c96f8ba6 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1587,10 +1587,6 @@ static void external_snapshot_prepare(BlkActionState *common,
         goto out;
     }
 
-    /* This removes our old bs and adds the new bs. This is an operation that
-     * can fail, so we need to do it in .prepare; undoing it for abort is
-     * always possible. */
-    bdrv_ref(state->new_bs);
     bdrv_append(state->new_bs, state->old_bs, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 8a29e33e00..892f7f47d8 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -1478,7 +1478,6 @@ static void test_append_to_drained(void)
     g_assert_cmpint(base_s->drain_count, ==, 1);
     g_assert_cmpint(base->in_flight, ==, 0);
 
-    /* Takes ownership of overlay, so we don't have to unref it later */
     bdrv_append(overlay, base, &error_abort);
     g_assert_cmpint(base->in_flight, ==, 0);
     g_assert_cmpint(overlay->in_flight, ==, 0);
@@ -1495,6 +1494,7 @@ static void test_append_to_drained(void)
     g_assert_cmpint(overlay->quiesce_counter, ==, 0);
     g_assert_cmpint(overlay_s->drain_count, ==, 0);
 
+    bdrv_unref(overlay);
     bdrv_unref(base);
     blk_unref(blk);
 }
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 27e3361a60..cfe096c9af 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -138,6 +138,7 @@ static void test_update_perm_tree(void)
     bdrv_append(filter, bs, &local_err);
     error_free_or_abort(&local_err);
 
+    bdrv_unref(filter);
     blk_unref(root);
 }
 
@@ -202,6 +203,7 @@ static void test_should_update_child(void)
     bdrv_append(filter, bs, &error_abort);
     g_assert(target->backing->bs == bs);
 
+    bdrv_unref(filter);
     bdrv_unref(bs);
     blk_unref(root);
 }
-- 
2.21.3


