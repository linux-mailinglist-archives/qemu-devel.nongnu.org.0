Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1A2F8F8E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:00:00 +0100 (CET)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tbz-0004xa-Mh
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV9-0004NV-So; Sat, 16 Jan 2021 16:52:57 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV7-0000WU-Ua; Sat, 16 Jan 2021 16:52:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivwoTp4tY+kXweDa7njl1Pr2i/mJiIj/A6Ooo1Cv9w9U1p8nCN9ifJ02ZyoJTx3yvUoOm/K8IJNSJFQ+UxWRsptDLAT1vRv5DfrEMiXGt/G5RPADNaF8VqT0SDxeGKsi7v10eVolKOHbI1QDSDQTt9OhRlaor7nr4JLXn6DGYVty1jdko5vnael9DfNzrxqNaVKC6Fd5592MH16uqMQz6smsashUCY8URfZzRTryAxfqSueCgRvfjjjVEWtIPYNAA5HZbd8mjRD20gBb3/TYLq49aU2ZDoVAqfke7DaLgC/YfRdQs15/+6Ep+o/LBtBka540U1iAGsrHhpT0SkhGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C6ItPfsDIb1n2k87ts2XB3S0X0j81GhcQhN9vMKbqs=;
 b=KDQYOaEPWQUQUHQa+3i+J5Mnqimxn8fhD/X9lAytGD9TtMOfAxF4XgP6LSZohI6eVpYADwLBhvcfGwCkx6uhQrgbT/3sgKkvg1q+Htn/cme9GgYdjd3MZGXB73ckHD9VcKWebCzmrtWUP/SC5TrOfzD7JRRSpSNNRhJvePeJZozV/EFGjzTZFXfozPGBg34tjbsjMq/YZ8g2Xcmqfo2/XYAu/jSw6zePA4MuToo1H033TH28UQeVDuprkRHx55aHVlPd4WlCgkA397FQ6m8sRAotWqLAjKWVFnpZgP/clmR0zd6vcSwB3AgKHBP1O1r9fp3Ajhu+B8GO2Ag/FZQ2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C6ItPfsDIb1n2k87ts2XB3S0X0j81GhcQhN9vMKbqs=;
 b=UXeB21I2jXTEOebFWTrqzNnMZuG9wL2LbVT9XE7UkDBr7m2gCd1HOsDZ0Q+QAQTVbclH+Uwvfae88i67z4RhfauGr2Hz2KGJ4FaS4aNgS3hBjdiHBxmwzWtc87xeBZQToke5OpehOCnvEvRSObKd4q9hQPymIyUSpe1X8L0NmLs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 02/14] block: use return status of bdrv_append()
Date: Sun, 17 Jan 2021 00:51:57 +0300
Message-Id: <20210116215209.823266-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3b650e6-4173-45ca-7e66-08d8ba690f7d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542303F013928B11EC021BAC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ewqe4siiwMs3hqurlCQ0J38OIv6j1wbmXozQAJRXUcopp794o7dWDUsQtjM654s98Xo0WwyhsqRsqGbG729/n2nRi9ddY1z3NuSEcnIy6Qi5uDFxQFadny4dTNveb1Zn8/BqNksLICVktf7q9jaSrcQM3l9dyPQhTu6kVwVWlceW29Lb9Z8UrutQ426dV5BEU6w+O5p6/G//9N4w7+WK1DJGfBT3f8RElL08DA6Lz6yMyq9lh04Q2CHY5+lbOvH71Mu6YuA8XAYOBkjsm+0BxWi0zIBJs5D4VsUtbMpNyiVJ5j+pPaU/QIvE/Wx1Bd/Zb9HWB5qVOeJvg5GqOFkouccqE2q73XOryVnjr5qPxbpHdP2zx0ZjfVUKzb03qYDVAlEsymMjy+Jb4nu5uPNa6Cbuuhzj7C+EuXAz2H7MpMZhgKjVKb5P3qnXfZrGD0r9sMhBHs2RTaczqeuOETSLa6yeOWZrJ6B9wdDGBRlNRXzrml4TwlEXu64Ak1LWBDpmwQ9BWgCXWsvsYhTUoTVJiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8lCAvBjyDDAzaHUizqTdCYqED10llLQfVjX/wHK7uYgfcr6hYrcyuyZYYtqx?=
 =?us-ascii?Q?4sRLu0/rxhTDKTvyX4PokUKGsEDLv8VE8+Rj14iF6MSHeqyBPj+yRdzsE9cG?=
 =?us-ascii?Q?R142JCyD4ql4uuPqya/CNLNSIEFTgIfX2X9vd96xawbDGGgJcX9uTf2aRIWa?=
 =?us-ascii?Q?C4fZjY+Mq72Z9xAaJ/ylOuEbKdLzkiKxpz8D706Y7TKJcZmEHodehDH0TWAu?=
 =?us-ascii?Q?foOxxEiEgA85/UGXpSQyh7zeDcezMP2e5I44W+5VOCHuIXJwfD40bmPc5FnT?=
 =?us-ascii?Q?d6hJdX7ZkMsrFMYzE8aG9Yho9AlzkqMamcjXIQ+gUmjEUJL39TG0jeipip9F?=
 =?us-ascii?Q?x2ixUUu1NZREdobZq4oZxwJ5EdZ7QUdWu7tTaE62c7sVUGcpIEcaEJA0E/iy?=
 =?us-ascii?Q?wt7+VH/FNgh5P4Od2fBEuFCnUF/mRL42UgztcNSXRZu0fbXXLOYC8fN/lFAX?=
 =?us-ascii?Q?WK29Vgl8UDy3+RRZuYDn2YjWoCThdY8o3JMCq7UbibAhk5AqkMDAZ/ThiHEw?=
 =?us-ascii?Q?X3Bb3jJ2lCUp4MNdp5a3V/ykrfLmvzOjB6+1rb5UX/ZhNTBdnNyTjvQKzMr8?=
 =?us-ascii?Q?n6CfQ4n9PwE8s9t3fU3R8+3e3B3H1+rbu1TYFcO6PJhQf+p+5wtaGr8cWKKF?=
 =?us-ascii?Q?HVIIPBn3fxEZ76O93wl/0qUxz4YqT9O/9Q/VXyGMFhRkFMpsmOONYmc2q700?=
 =?us-ascii?Q?J1r4SJ7Pe1wXuAcX8fo6jJ2J63HcOWprku5Y2YtLrxNqO5cqDVUZaTOimc4O?=
 =?us-ascii?Q?qSYsFF9uV3MGbHVRG53dZJdt42AhVsWiKR9wijtNQzvxQ4hiDGLZOj/zCshL?=
 =?us-ascii?Q?CbOnolKtNjptz8DDnfX8YnIi9YyRPiSng7Tj1muwNWwdljZ3e0yzxIKtJKQ+?=
 =?us-ascii?Q?Ww90ydaiqwmDI41pIZXkHaU141jHcZ9FjLt4sbM2STF0FgOv20wpNeX2A7XH?=
 =?us-ascii?Q?M+h0dueVQsmISUbNowR03upwr0Lgyvw0uivFlT9B+wmmh/aL0mc/YMCkQPTr?=
 =?us-ascii?Q?UTzV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b650e6-4173-45ca-7e66-08d8ba690f7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:46.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jTG1yZDZaLask540XO4aeHPFHq7AOp6isEWPme4HWB8j8lrxXRj6yaEU9//ZPWTiADJ+5LYDA2nVg8h0Snyk4kTDBG5zI0Te8dDm6yH8Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now bdrv_append returns status and we can drop all the local_err things
around it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c                     |  6 ++----
 block/backup-top.c          | 23 +++++++++++------------
 block/commit.c              |  6 ++----
 block/mirror.c              |  6 ++----
 blockdev.c                  |  6 +++---
 tests/test-bdrv-graph-mod.c |  6 +++---
 6 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/block.c b/block.c
index fecfe27d5e..0951d3b2c1 100644
--- a/block.c
+++ b/block.c
@@ -3118,7 +3118,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    Error *local_err = NULL;
     int ret;
 
     /* if snapshot, we create a temporary backing file and open it
@@ -3165,9 +3164,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
      * order to be able to return one, we have to increase
      * bs_snapshot's refcount here */
     bdrv_ref(bs_snapshot);
-    bdrv_append(bs_snapshot, bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(bs_snapshot, bs, errp);
+    if (ret < 0) {
         bs_snapshot = NULL;
         goto out;
     }
diff --git a/block/backup-top.c b/block/backup-top.c
index fe6883cc97..46246d46f1 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -190,7 +190,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockCopyState **bcs,
                                          Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
+    int ret;
     BDRVBackupTopState *state;
     BlockDriverState *top;
     bool appended = false;
@@ -223,9 +224,9 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     bdrv_drained_begin(source);
 
     bdrv_ref(top);
-    bdrv_append(top, source, &local_err);
-    if (local_err) {
-        error_prepend(&local_err, "Cannot append backup-top filter: ");
+    ret = bdrv_append(top, source, errp);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append backup-top filter: ");
         goto fail;
     }
     appended = true;
@@ -235,18 +236,17 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
      * we want.
      */
     state->active = true;
-    bdrv_child_refresh_perms(top, top->backing, &local_err);
-    if (local_err) {
-        error_prepend(&local_err,
-                      "Cannot set permissions for backup-top filter: ");
+    ret = bdrv_child_refresh_perms(top, top->backing, errp);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot set permissions for backup-top filter: ");
         goto fail;
     }
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, write_flags, &local_err);
-    if (local_err) {
-        error_prepend(&local_err, "Cannot create block-copy-state: ");
+                                      cluster_size, write_flags, errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
     *bcs = state->bcs;
@@ -264,7 +264,6 @@ fail:
     }
 
     bdrv_drained_end(source);
-    error_propagate(errp, local_err);
 
     return NULL;
 }
diff --git a/block/commit.c b/block/commit.c
index 71db7ba747..dd9ba87349 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -254,7 +254,6 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     BlockDriverState *iter;
     BlockDriverState *commit_top_bs = NULL;
     BlockDriverState *filtered_base;
-    Error *local_err = NULL;
     int64_t base_size, top_size;
     uint64_t base_perms, iter_shared_perms;
     int ret;
@@ -312,10 +311,9 @@ void commit_start(const char *job_id, BlockDriverState *bs,
 
     commit_top_bs->total_sectors = top->total_sectors;
 
-    bdrv_append(commit_top_bs, top, &local_err);
-    if (local_err) {
+    ret = bdrv_append(commit_top_bs, top, errp);
+    if (ret < 0) {
         commit_top_bs = NULL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..fad2701938 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1560,7 +1560,6 @@ static BlockJob *mirror_start_job(
     BlockDriverState *mirror_top_bs;
     bool target_is_backing;
     uint64_t target_perms, target_shared_perms;
-    Error *local_err = NULL;
     int ret;
 
     if (granularity == 0) {
@@ -1609,12 +1608,11 @@ static BlockJob *mirror_start_job(
      * it alive until block_job_create() succeeds even if bs has no parent. */
     bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
-    bdrv_append(mirror_top_bs, bs, &local_err);
+    ret = bdrv_append(mirror_top_bs, bs, errp);
     bdrv_drained_end(bs);
 
-    if (local_err) {
+    if (ret < 0) {
         bdrv_unref(mirror_top_bs);
-        error_propagate(errp, local_err);
         return NULL;
     }
 
diff --git a/blockdev.c b/blockdev.c
index 2431448c5d..84c5cde07c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1432,6 +1432,7 @@ typedef struct ExternalSnapshotState {
 static void external_snapshot_prepare(BlkActionState *common,
                                       Error **errp)
 {
+    int ret;
     int flags = 0;
     QDict *options = NULL;
     Error *local_err = NULL;
@@ -1591,9 +1592,8 @@ static void external_snapshot_prepare(BlkActionState *common,
      * can fail, so we need to do it in .prepare; undoing it for abort is
      * always possible. */
     bdrv_ref(state->new_bs);
-    bdrv_append(state->new_bs, state->old_bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(state->new_bs, state->old_bs, errp);
+    if (ret < 0) {
         goto out;
     }
     state->overlay_appended = true;
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 8cff13830e..c4f7d16039 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -101,7 +101,7 @@ static BlockDriverState *pass_through_node(const char *name)
  */
 static void test_update_perm_tree(void)
 {
-    Error *local_err = NULL;
+    int ret;
 
     BlockBackend *root = blk_new(qemu_get_aio_context(),
                                  BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ,
@@ -114,8 +114,8 @@ static void test_update_perm_tree(void)
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
 
-    bdrv_append(filter, bs, &local_err);
-    error_free_or_abort(&local_err);
+    ret = bdrv_append(filter, bs, NULL);
+    g_assert_cmpint(ret, <, 0);
 
     blk_unref(root);
 }
-- 
2.29.2


