Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFF2C1692
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:37:27 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIaU-00013B-2J
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID9-0004Wv-IB; Mon, 23 Nov 2020 15:13:19 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:43328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID7-0007SQ-A7; Mon, 23 Nov 2020 15:13:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSocu2ZI6WX1+L9I7A7F9UGKWB/f+qIAWCD0FTM1YOhTMM1xNpW5kNPSfGNSCJG9TXQvUlXy65q8QBqamQ62L8ti7xjwRzzg6URgEhjJKuBM2KZDO1fqusIWHqxNwUIV/t0PEARnqjhcq7mBLO2ktpY1t9ixbGtyndstPhQ4FeXutKVag1s91md9GDteeWYQ/7iELd6g8DT0VoU/CXR8L8V0taPtKOWAAwRjdR++AxbbeLewekQ5sWxb/wDH9bxl8Wap+5fN8KghIbpStVUq9fvTZjSy30xh0dT9v6g2noPjqx3/qZ5JWkQraqxXV/WM/SDAa6Z5XA7sfnP0Z8D48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6fZAf9Uj+1/UQ1k0JhLkNenGGcjMxJBkwtKfj0DUZI=;
 b=CsJKDlcf8QTUQzj6xp8GftFQZ2B/8HaE4dyuYlZaxuGmDdgTSyX3fOB5EtLgNjnq7ft0vPe9dbIJoiF9UQZ1vJdAL2LC63Pzr8dUagakJVCv4S0NgB8cpIOKq+746jyNNYcGbAh3SDliCIdcAk1N9jpkZa0ys5EmUzFsq0ifouQw8t/KbCDkHruZ3CV81NnbVIdUsITVU/xk1bSPXowl/M/izKxcCb2fBMh4HMIWGetESNCHyRjydQ47M39LYtBGRM3lfXjf0M017T03M+WKjovI6nw80KFzTBmumgOTCcYn+fQzOwH5RLgykvCQW72oePGQalDM/OZRBxTes0HeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6fZAf9Uj+1/UQ1k0JhLkNenGGcjMxJBkwtKfj0DUZI=;
 b=jbADEFxjxyVCMYgHHyVraGiu6AG+uQGzsz6Ogc0VMYX/2psadNDFq2ozTMiVch23uZgsWEY4ZsGzPxgMqzGiWsLDAxZc9uAWDXAl8scfyKJtfu7F4pUdukMBzAET7U7HSXaWIwXJXD0Mc99g9ZV4Fuk8YV46tZu3OrtpgRyb6pU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 16/21] block: bdrv_append(): don't consume reference
Date: Mon, 23 Nov 2020 23:12:28 +0300
Message-Id: <20201123201233.9534-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0b7ac27-7681-4430-5ced-08d88fec2fd5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690417E85E0C6D06D1A7C17C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1a81Jh84y1BdJEyc4fxykhpeow2CU1ng7Hq+Bw7tF//WgiEefXY2A5a8JiySJCANo3x6sN+GZxtNBG+PxT+Bc2OFVd8D4786djZ1Q8khHKd1hN+DYPv1vbAwx0Wbjvn+/x0zW6bKYlO/zxHGt2nt40mImK3prMhKPF22fj2XF7590Zw7DWUEaCFFBL+HiSSBuQoERhp9/sgvl69SKNPaW8ojuWjLTUDW4BuNFhHAksZH29GyjM490F09l1ihG65yrnxS5Soz9AOvupBLR5H2ufK/ID+3GVEx55iq39osa8ejmsFWPF9nildK76F9wFdr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: MJv0CkhUPE7ChtvflzOCVPBRe5q3plrbjXa5iRKRD0UaP3QKAFUuni10frCmzRzT3ArfHXa/uwgVCiR8i8nZihxCM8HXIm34iz/5BmmKK9eGTWNLkjsBEJcsicqKkgZ/8Q/t3ULqlB/a+9C0dIXrdcUksE8DAHEM2sUbL2Loqbnc/JDsfAZFaaI7XksyC41jm2yZK2GCpw0EQ1mOukZHgPEmeGX1zvgAo5kOBRnryecg9uatqZZFC+YJGno+4amo62+IRLsceIPRiIvXsg2n8bGRFz3f59j3i/jxbTubaDtvmkgtjQv3cavvtlSwTQBPUNdzXiag93IBGFzuYPXW5xhyPHX5up22LLKJMHfPeTrRYkQUJk/28MmGvSHlrCHjweV4afusvGJSzFTrXzcf5QrshvkNqoNsZFytJlKCbMvIIB7XPGUnWQdZ/yRijAoO13GTGJvPX9x1EP/c7SOjo36NQhVdjN43oaf0/C59onUfQ4p1DC0wFDILctBm3L/dIrix/MRAF+/IsjtLVlK4c3mEiOuMumRAL5BRPrBtdG4F4H7SFaacWXL5uGTJ7pHWUWfRF4Z36gC+PIujrFaCcmeQKcWCl70kUzXrnSrNwaUIguSp4JxLS4do3zpEm2a1W+2Ax6umcpoTMHr3RlVe480sMG6d2X73BjC0KH1U4lMIAu2DNbCuUADVc1Inr4bvdRmnMhzXfeEfcMj+EQVA8J5xMpajFZjv0XACM+djVIvu5Cqbe6mrlz34FfcbSOxUaf/zO3VD4NljHzImYeAuxo2LYcFvbI76Sy7/srOnbGWBS2aZuZ3lOfl4GT+z93PULhOatg1DUXA57xmFWn4T5SHwPJSiPdYAAQY8eKrzgluXN7SJxZ6mew9h7iGDWte6Wuflzhqg43P8wjEl5xGV3w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b7ac27-7681-4430-5ced-08d88fec2fd5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:05.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zno2ZUOhqneqJm1xsCYLfB3OiOJTY1GNt94E5CgdM1S8zhwWY8npEPgIpzecAJviwXqW4KHGpFoNh8sT7Hn6Wqdx3uMLkGBuCX09HC3CvOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 1327254b8e..a75c5b4aea 100644
--- a/block.c
+++ b/block.c
@@ -3485,11 +3485,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
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
@@ -4954,10 +4949,8 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
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
@@ -4967,20 +4960,14 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
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
index d0e0f56ec3..246f503e8d 100644
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


