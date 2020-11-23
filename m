Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D962C1691
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:35:39 +0100 (CET)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIYk-00086L-Hk
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDM-0004Y9-Eg; Mon, 23 Nov 2020 15:13:35 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID9-0007NS-9v; Mon, 23 Nov 2020 15:13:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5iwHGdVbmwtt5y3HObwHQCsegQFidc9O98LwLsv9zxHAsTFxCsnu4X+bVakkKl+A3y1VBRPFAnA1Hz/nvTA1pFzNz71Y2koceEjre1RtnWARjEb7a8CRgVEDTvmTRtHr0LTTrzLOm13gtZnknDUvzniwMctVsixOMMR8qKj2ajDjozFgEtY3ORe/4rUHiuoKt70xSPTSK55cGFfg1FbAAnYETpWPMrN08QaFxKwq+2r49+sY6dA49VpveR1dTUUqAeCZtjL+ySFIE1yQdF1fDVdskq4cRDg8VBcSaoHNEAfSRCHKQDgEDMPphyXXNYAimOHox6qswuBZfmaMGYvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+GLRNLv9+2LbCaa6EtVC+okD72D2LSu7IJI6h3NAJY=;
 b=B7zvkPim4GpQrtCYf1Z2ovy7UkFW1ZaJ2M0WsU2ot5LyVVwyCJl5RhOX9ylwOosrRXY1yzsf68tvzZQqAAhcyF6qs1LBL41cyyP02MUMRYP13Az/RJYjHE8d+epy6R3ORoeAQWaL6KdH31wN9QW1dfmeXsnG7V5OkFg9FuD52R2va50Hn1glXzoUUVzhO3XvJHNGTrudhd9yjvWSLQcFTGLA9UAbd1TDsUXK2B7KXNwZyfyVn9npQOKnX0mMNrIaZjLCuAUJmEPRYS4O8uJom4TGJJ8CEzg646C4Yy7sUTwoDlU7PfvQ/xa5l14FX64CnOun3AkJ8aA1hNYJ/0MPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+GLRNLv9+2LbCaa6EtVC+okD72D2LSu7IJI6h3NAJY=;
 b=NrY4eb/C4I1TxijP4Wzn6DczP6PqZ/Ja2IOJqBzdQt298HSCgxx12rfIWZGFeWuTrH99C9PjsrP3JdYn7xMYvenk5b70uzodJDWwZNl325AZyZ6i6yZMGYrFe9ouL5tYggE6GhAeD/7UYpYzNCJFoohqpxV5o7sfem5rsty7G+c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 17/21] block: bdrv_append(): return status
Date: Mon, 23 Nov 2020 23:12:29 +0300
Message-Id: <20201123201233.9534-20-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef4c075e-3521-47dd-5252-08d88fec3058
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690420317E705829B7D4E9CC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4bX0qeNzrVki1kgR3QoKcuTJCoPddVG9kYkZCOrpWX6bJZVlCrlTXYYRUeGN8iau9NdTp3BEz8MsZSwENVWqMaBl/pkJS3dvhGEiSXcsA9Yvpv4HfivCUpnRUWo1QZ1Ev3gqRxV4xba0Vslt1rwq8ktJxVspap0YiYweDQ1Flte7RfUQzwLbFy81WWlqkQOC/CIyaBrzqCmdzffky7C3vuhQ1/h80KWdsBw4bOUgu9Ur1F8YE5N8j46r15PSv6IAyXT29oNVolxMsxBd406SLaoJRSXbI1TrjWt+7pLANnlhNBVbItlick+bzInESnSeWlCf0bgJeMerAIEvGOYeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: iqSvbGjpdd/YI4SB7ChEViUhi7gPOmuZWDZ+xCk7yUM/ov5b8S8a1B1hKx0emqn7fE++8I0uM1daxgDujAfTi9XNh+YgFkbJBU27jBOt9GCVan/hHOa6QCp7vzF4nzlGqpTGyzD6kcdVF+aI/ZJawqjilrPoZJHVXB351xtqs/jp+ha7CYid3UYZydQUR9K31hbhi6V2lEKKi93CwcBoqHFsXGLua/pvIlBTZksi/s6rb4ZGvykzvJUInqQKT/8tUVhha0m424/ZnDm9WlMnrOQpXgLkZB6lKqGnPS7RzHxQgTPIMK4DmonhX0QQcHO3whYtByaBrVCOJsHV3joBuePlt9vsnmhkWZoLuIDYLZGqdHqfUKJEf6CoUjjBzSnCu7oGQpojmfOUtxPyGlFAPmZEuCYgfehk0+i0L3wAasosHg7bX8FRdOlE/Vkip+Z39sXdnTO9E/naQlFc6L61kkWZrJl8p1dfj8LMb/0mdV7f5rA4ynY070TCLq+EmTeYokQBu42eU4edyrsehD2oZa/YXydBKsrOQbBwQIE1i4jkTQm71JVuEqakQGbTLFdHVgkxBrVGNheoHeAUha1aKZPb72sYQnagNYEiv3TJxm9ByobBiNXJEPxWizxApy49SiRjTTCcoO/gfKvhzAQOZb6KD+dxiZ1iEQbAguwFOf5onO6UlcJgWNCVp1LqqbiidXNi7AlEjFEF3IYqShE9toElmXj5Z3vyf0i245fjL7jLB5O9atWjl19sUdMuv4aLl1I+EeNoJr93Z1yjCo/z8a3N2GmVp+g/y83i4j8Dvqyiq7q+owdDEy0TvOHGsZAgfMGzVgfbnCFq9Vf63FsnfuZTbwpkJMqA/2at03yrmRJR+toA9vu8AyxFUy2mBsilkDf3yPjlVqiczqyuaS5HqQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4c075e-3521-47dd-5252-08d88fec3058
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:06.2379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E93vE1P/+xp7bc5lw2JriaPDZ4fZXaiJ/wR8V1W1Nm2X07TX51YbYKWgPhSnJM00AinZz0m/2Y3lLZhBoaFE2n85xxyQAB133RBe3Tm3+wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return int status to avoid extra error propagation schemes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h       |  4 ++--
 block.c                     | 15 ++++++++-------
 block/commit.c              |  6 ++----
 block/mirror.c              |  6 ++----
 blockdev.c                  |  6 +++---
 tests/test-bdrv-graph-mod.c |  6 +++---
 6 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index ab812e14d8..6c1efce0c3 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -344,8 +344,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 
 BlockDriverState *bdrv_new(void);
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp);
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 
diff --git a/block.c b/block.c
index a75c5b4aea..f2e714a81d 100644
--- a/block.c
+++ b/block.c
@@ -3443,7 +3443,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    Error *local_err = NULL;
     int ret;
 
     /* if snapshot, we create a temporary backing file and open it
@@ -3485,9 +3484,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    bdrv_append(bs_snapshot, bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(bs_snapshot, bs, errp);
+    if (ret < 0) {
         bs_snapshot = NULL;
         goto out;
     }
@@ -4952,22 +4950,25 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * Recent update: bdrv_append does NOT eat bs_new reference for now. Drop this
  * comment several moths later.
  */
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp)
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp)
 {
     Error *local_err = NULL;
 
     bdrv_set_backing_hd(bs_new, bs_top, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        return;
+        return -EPERM;
     }
 
     bdrv_replace_node(bs_top, bs_new, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
+        return -EPERM;
     }
+
+    return 0;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/commit.c b/block/commit.c
index 61924bcf66..b89bb20b75 100644
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
@@ -312,11 +311,10 @@ void commit_start(const char *job_id, BlockDriverState *bs,
 
     commit_top_bs->total_sectors = top->total_sectors;
 
-    bdrv_append(commit_top_bs, top, &local_err);
+    ret = bdrv_append(commit_top_bs, top, errp);
     bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
-    if (local_err) {
+    if (ret < 0) {
         commit_top_bs = NULL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/block/mirror.c b/block/mirror.c
index 13f7ecc998..c3fbe3e8bd 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1560,7 +1560,6 @@ static BlockJob *mirror_start_job(
     BlockDriverState *mirror_top_bs;
     bool target_is_backing;
     uint64_t target_perms, target_shared_perms;
-    Error *local_err = NULL;
     int ret;
 
     if (granularity == 0) {
@@ -1606,12 +1605,11 @@ static BlockJob *mirror_start_job(
     mirror_top_bs->opaque = bs_opaque;
 
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
index 96c96f8ba6..2af35d0958 100644
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
@@ -1587,9 +1588,8 @@ static void external_snapshot_prepare(BlkActionState *common,
         goto out;
     }
 
-    bdrv_append(state->new_bs, state->old_bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(state->new_bs, state->old_bs, errp);
+    if (ret < 0) {
         goto out;
     }
     state->overlay_appended = true;
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 246f503e8d..93a5941a9b 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -122,7 +122,7 @@ static BlockDriverState *exclusive_writer_node(const char *name)
  */
 static void test_update_perm_tree(void)
 {
-    Error *local_err = NULL;
+    int ret;
 
     BlockBackend *root = blk_new(qemu_get_aio_context(),
                                  BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ,
@@ -135,8 +135,8 @@ static void test_update_perm_tree(void)
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
 
-    bdrv_append(filter, bs, &local_err);
-    error_free_or_abort(&local_err);
+    ret = bdrv_append(filter, bs, NULL);
+    g_assert_cmpint(ret, <, 0);
 
     bdrv_unref(filter);
     blk_unref(root);
-- 
2.21.3


