Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356636DB8E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:26:58 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm5Y-0003Eh-Ac
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxg-0005ig-Vh; Wed, 28 Apr 2021 11:18:49 -0400
Received: from mail-he1eur04on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70b]:4079
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxe-0001qz-Hn; Wed, 28 Apr 2021 11:18:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I31Nn9aYxrRZVkK9QViYeOw02/lYkCf7a+WPelW/iFuRMmeuV0cS5L31+YLbzJk1Tf98IoOBb+NS/GX/1i9fM5naLxGjzVRuJdRq8ef1Hojaw+mLs53wf1RKhzPXICV4yYSBZ/o5ypb4a/hUeQZLZIYOzp8K+F+PNOcEfvLk2QJkKj3xta8pox7YNHymrUFCUGsOkgD1Y6vQNgFEtIRFg4b8LlSYz3KNEyoLUSvtQiQDsPOghYP3QQwuLsHU5Uq9Son50xzw9If3g1QBo7eAn7OJtExCbV6V+KyM9npt4kUhBR2lYPI402RqPoqGiemLQBrO/lZ/aXH5AXWWfiKr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlmkX2p423ed1XNl+MQScB/82iaGPIZ5rUzzjwTwIQ4=;
 b=m8GL9QqY5PxryHvrQpXJ81RrJyTUdQcZloqNept4bZGbpE1B9aN+n1SGMMNLYa9sVQMzrJv9TYDNmryBa+dxyMsaCcnu3xRiqPPgWiaELT70bdhm2QRqT+6CqLGFFpCe0nJGZAwb2zekBJJFBF+LYHlXtptQpGPTDDlyF73rXbVUglfmrhoJw++1cRWqM/O8JrAHl1gvhUeLXmIi4cgpC0jZ8MKBk5JJh+WiPMxcUyYwYfvV9R00vwLmRaop2zgTJjBIWE6PsNKs977w170xlWaRQweOh27t/dlSyw9HhUfCMgQXZ/APScmW63PfKDZUMatKzW13yhrnT4FV+8NP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlmkX2p423ed1XNl+MQScB/82iaGPIZ5rUzzjwTwIQ4=;
 b=eIlFCp+GHZRde7w4YgCdHErrjH+Q7DbjQpXbFu8kpRZIYgWQTz9akXf0pZczkPZcdpZR07dQvZ9AJ+XTwdtwmenBfbI38tYDfz538nGf0zklh2J0G1AzoPfbnHguydTl2C3U1ceS33yPKI0AaB0YDRe71a8TuZ4vzc+Pyy1AIfU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 04/36] block: bdrv_append(): don't consume reference
Date: Wed, 28 Apr 2021 18:17:32 +0300
Message-Id: <20210428151804.439460-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddaee6a3-b82a-48d1-658c-08d90a58ded9
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB590999D06FC9458E21F0FE6AC1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BL91kYFlTTGu2OLsSMLorxM9qGfS+YBy6s1CaayC4GW2ROc8nGeoRO6S/jq5A/eUW2CiBLf9F/l031w8rSYTjth7AvP9y4g6FajY5mJxwXYsSaKblC7pqqbdzP5hp8OHBRsvba79lx7B/c45/gvGTWpT3+DfEcz+lPp9GC2/SvQAJV1iQm3/EMvTmR8kP77dz62I0klqTI9R2sDTJoVVOm77mMNBurrrb3s8WMypxh6nH3h/SrweHgUJfwldOTCCFxX/J2YK4f6gnzXPWo7kSvQUC5RM7Bjdaf2T/dleHNwidppZtBJSfup+8vJwSlwqBNfhxkbe+2zXOhtwgs53c4qFGQuXPHAGmTOaKCrJyvHqww0IBdyZI5r7id0vw+2fCoPIwb79PkzjLtUbGdbaCsYfwiE9s6DM+PxEUCGR3WwJuxKkj6/6wJo8eQMIQQRuCYAShvIDUMFycu0NmkE4b/ZnXQqdAz1Ubd9SdYq3dx47q5fjqogkIa/pE8tDCRIsfmWih6GgE2idaFKbp4NXnDAKcHyFbBp7ESEMpHMDLZL6UUndnxBe1Ff0A3FdN1USDv1pE37yEFOzLpVlkZvPw3lccZH1LoLp/N1bIrOe5b8YYnhhox27J0R6dL4LCy3OQSqB7JWqncS7/ryPyHDy71Miay/qFvJug6o1eiHDIeUVK17sw/Qbs4RqrY28Ooy7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ekYhN7Gfdw/+7Ccb+YSw6TEVtPqfLXAe10BmB9SyEg+SEnsFKaidA6W/oTR8?=
 =?us-ascii?Q?UxoNbwYXUEf0DSJXTz301d6QoASLu2FZnoIFYU/vsPC72uxCVIJVZn1tTP4I?=
 =?us-ascii?Q?thXVPEaSt6cBlqcVDHf5g1wNCErhy8pYZn7YAxe9//BbES9CHMeebfAa2oZ+?=
 =?us-ascii?Q?kQGLuWk2mrZRkno/6tfo2DS3Qjc4RA74w//va/h7WSDGN664msS0j3nzuRCN?=
 =?us-ascii?Q?lM97EJ2Ect2zWWyHUBDMA0LkgxNKxmjAqTBsIRj5KD7CMJzI281OQWTDJfFS?=
 =?us-ascii?Q?Zii8OOfPI5/X5Ccz2WbTWTt5rhOUP4atmPUtJRU9p/XxYX+gzT+SaZbkO7Zh?=
 =?us-ascii?Q?fJu7w+JRJ6iRjIMnYXnlx0/YgRj2LghK9k3C4EDhtJwceTikIzUfOkXhKjVS?=
 =?us-ascii?Q?U3gH5kBH10xVIoO0UTHwLTYWbB4UwxXAt0wCQct8wHjJWkOXIMUVdzbUKG+o?=
 =?us-ascii?Q?cYCw+zAPXebzpCrvvrx6aMkZifmqRsdnTs57LxRSKfzRBUm+cyNDygNSTksb?=
 =?us-ascii?Q?mF3xTEpGEDiWAox3E9ZwjgvyUfEfZ96+0qWobEUTHnzKIbprzSUoWo6bB9Ux?=
 =?us-ascii?Q?fiLkKhOQ6VOd7rlSYSZtieh9FWGnz13cSOCc5ynrNhiS5OjpJoiJZj55eJSa?=
 =?us-ascii?Q?+OSCSYH996N9sb0ccBqwV7+YpcFQVijY9/Ix0npvMuiHU+rRYP8LnRvTHE/o?=
 =?us-ascii?Q?QIRR9G9XNcDe2RDHH9LlyAwqs/yd1DOgcur55z3R4MhJNeqgVBC6MQnp/eU2?=
 =?us-ascii?Q?UFGab/9SDAhQ93MwORbVWEZwmDWz4qqW38r00Sm9Rj9jWuwiowkpxNKUegOS?=
 =?us-ascii?Q?uifH1rv49+MKCtRbtHHIYy15NSfKD5du9EOf0aV96ezpZnw9o7KyvpuPe8ot?=
 =?us-ascii?Q?0tdH/b/oUIn1VKf6kYUVYpMyotMfgq21zMajuadI3HgXwDwn4rwRr+OY/7su?=
 =?us-ascii?Q?DiHgGV6AlbUOA8svIBp2f1y/dM4RTlDBZ16uPdXPzxCbFw4ZITT77u8ZSPIE?=
 =?us-ascii?Q?Ev0ZpknKENaVjs8Cz6/Q4hGxGlLRQNx9x3HVz0k0Mg56yPU7lkqRodc8+UVT?=
 =?us-ascii?Q?5Ijk/9pciWzaQKkHZwpaEa3UEGwkKt6n81TiqcgoZGhQ2pSJyVdyDFu/qw43?=
 =?us-ascii?Q?WTLoyZpy8JegFMRY9baI9IqPkNdlZHsOQtcVtR96rIAs5qWXNm8UL1oRAsAG?=
 =?us-ascii?Q?xnD2lvOG3Q5UMruGhPQXIUiCN1qhR80zAJg+e369SvVN222Q5g5vB0FG+6pO?=
 =?us-ascii?Q?cK07ECIQbMqr/v7+tr2myDNq3lLDjgvAfE+sW3TFvBMVcC0UDQ2UzUQe7YOx?=
 =?us-ascii?Q?7HgnPHy7kvxxQ1iTfBRmWDIA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaee6a3-b82a-48d1-658c-08d90a58ded9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:26.3656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxPWNYla4bR+z99dIJDvYO6hrxwTbaq7iVToYzMPDSCcpJbxBY8zfJHP3uwXqE6yjeVfrwVKKWtF0XHuuJialPDZVIQ65lStMWxhQRzg7hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 25 +++----------------------
 block/backup-top.c               |  1 -
 block/commit.c                   |  1 +
 block/mirror.c                   |  3 ---
 blockdev.c                       |  4 ----
 tests/unit/test-bdrv-drain.c     |  2 +-
 tests/unit/test-bdrv-graph-mod.c |  3 +++
 7 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/block.c b/block.c
index c5b887cec1..1e7e8907e4 100644
--- a/block.c
+++ b/block.c
@@ -3213,11 +3213,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    /* bdrv_append() consumes a strong reference to bs_snapshot
-     * (i.e. it will call bdrv_unref() on it) even on error, so in
-     * order to be able to return one, we have to increase
-     * bs_snapshot's refcount here */
-    bdrv_ref(bs_snapshot);
     ret = bdrv_append(bs_snapshot, bs, errp);
     if (ret < 0) {
         bs_snapshot = NULL;
@@ -4679,36 +4674,22 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * bs_new must not be attached to a BlockBackend.
  *
  * This function does not create any image files.
- *
- * bdrv_append() takes ownership of a bs_new reference and unrefs it because
- * that's what the callers commonly need. bs_new will be referenced by the old
- * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
- * reference of its own, it must call bdrv_ref().
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
     int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     ret = bdrv_replace_node(bs_top, bs_new, errp);
     if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        goto out;
+        return ret;
     }
 
-    ret = 0;
-
-out:
-    /*
-     * bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more.
-     */
-    bdrv_unref(bs_new);
-
-    return ret;
+    return 0;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/backup-top.c b/block/backup-top.c
index 589e8b651d..62d09f213e 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -234,7 +234,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     bdrv_drained_begin(source);
 
-    bdrv_ref(top);
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append backup-top filter: ");
diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..b89bb20b75 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -312,6 +312,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     commit_top_bs->total_sectors = top->total_sectors;
 
     ret = bdrv_append(commit_top_bs, top, errp);
+    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
     if (ret < 0) {
         commit_top_bs = NULL;
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 5a71bd8bbc..840b8e8c15 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1630,9 +1630,6 @@ static BlockJob *mirror_start_job(
 
     bs_opaque->is_commit = target_is_backing;
 
-    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
-     * it alive until block_job_create() succeeds even if bs has no parent. */
-    bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
     ret = bdrv_append(mirror_top_bs, bs, errp);
     bdrv_drained_end(bs);
diff --git a/blockdev.c b/blockdev.c
index a57590aae4..834c2304a1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1576,10 +1576,6 @@ static void external_snapshot_prepare(BlkActionState *common,
         goto out;
     }
 
-    /* This removes our old bs and adds the new bs. This is an operation that
-     * can fail, so we need to do it in .prepare; undoing it for abort is
-     * always possible. */
-    bdrv_ref(state->new_bs);
     ret = bdrv_append(state->new_bs, state->old_bs, errp);
     if (ret < 0) {
         goto out;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 8a29e33e00..892f7f47d8 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
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
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 5b6934e68b..a6064b1863 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -138,6 +138,7 @@ static void test_update_perm_tree(void)
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
 
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
@@ -380,6 +382,7 @@ static void test_append_greedy_filter(void)
                       &error_abort);
 
     bdrv_append(fl, base, &error_abort);
+    bdrv_unref(fl);
     bdrv_unref(top);
 }
 
-- 
2.29.2


