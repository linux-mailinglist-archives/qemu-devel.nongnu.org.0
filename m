Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D32EFFB3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:05:41 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDw4-0003pZ-7Z
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpU-00068s-EP; Sat, 09 Jan 2021 07:58:52 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpR-0003dJ-EH; Sat, 09 Jan 2021 07:58:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofQbwp/JIV7SUf8ab1mq9xosKj3oUDsNdPQphk3d+QhPjIGNES3NG/rfZx6NWltuIE/H2VtdEK7hcapsJGvIUSfWLnMTP7I6ctpHGo97Mz9L+MOrAvBsD7qStBY/umuevmcOFAiW5/1O4mfx8GY2jq0tVexn3MQU+98GrrjzbWWuZtG8NOM6jua6DpVipCrJ6461ui7EcPdwszx4BzN9JRap0UN0yXJYSFD49iYS62Zz9WQxvueFVWc7F6NQ5pO30wCD8jhIhq8FFbKnjAP3yclh34k57//8+nzLOr/0rsWrgtViJqPjwovc/395jsCLzaRVBoUr+FsMjsKocBpOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc4Nb8E8gqGRpwoov/MvHRCdPM2yDL/Xwq4kYSxOh28=;
 b=TacH991dLVP/aegT027QoWkb5syWvuQwTIQjt8I/j6P/53veAUwY/5/aj7AJe4Zu0y0XxcDCXeB1ogH24B6Zp5yHS/k8rkla3QJViZNn6uJtt9OOyu+T0jSIQ1WAwkzZJ3RHphai0GCKXDqFbhzmAc/wozSSCSjusEifcaR77zXMNTOGsF3+zWgdsAxG3v1UmOOu1WCFBeM+yQh4EZklKI3mcc7A8E1AOgLGOaQ/EHlCy/NcAFz/MgSaUWZGCfc7BzTW419q375fltDYJZ3nBh64+/lAKV+/tfWGWd8uIeRCG0WLkUcVpK2MqgMtvIfNZCxtA7MpM+OMh8N91fvk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc4Nb8E8gqGRpwoov/MvHRCdPM2yDL/Xwq4kYSxOh28=;
 b=CfvXZtjXvvxEyKpv48yZWW5sMseUWvfc0aaKIH/9ZtO8Yhmb1RXomhh+rSJlIRZyqHb+BynDaHNZ+DtlNruLE5xju1g0+Y8peBRliRDyrZxkYEZ77SgeR6bbPpPKFqg3VN5jffAZ4F2WP+0LxfiII5+Wsm5MZwDEQmT5CXV2pY0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 02/14] block: use return status of bdrv_append()
Date: Sat,  9 Jan 2021 15:57:59 +0300
Message-Id: <20210109125811.209870-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2768eed-761f-44d0-95d3-08d8b49e4b17
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418DD8D799EAE5840DD2CA5C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: braqcA5Tq81OkkrX4ixOcZKZhyVq3opt659esED8H6vvpLy0pSgsQOO54xCc5yNQMADiw2Z/kdb5MMtL67zIW90IDlOtZVXQWPXqIyuqo5o/qpBeM2lEVZDKQOg4pezHw9CCGn7gs98DGDgjPf1O3e810mxKmAy6qDDYFOenxx/ib4n/VUQvYQCZqIjTyfFq5/3cgP/zvGkXgDlEV9iM3KGNsYEL1kUDWTFBNmdmZSuu8+cL8vEJ52Q6kmm90GHkSlwD7rbH937RnmL46znYp4hx3tc3tq3exSUc6QJYP+Hv8kFnF8aVXTqOeW/Ymzjb+3JdV97INqmPn6vNmntz+3K6k2m2Xgx+er95hQxdBvRB2Bac8pw34kWRtrhr4ZHKfp8Mi7mF4JuYvfR5/qafNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kWTHAE49S62Hy+MYZFDmewHxklom/QYrFmErdowBHYtB3P2WE3Glob8+k66W?=
 =?us-ascii?Q?r3tLWqtjnkoTiXsEhI1bx5fZGas3A6wDxiTfZh3ty+zHrWxLAErh50h+lBq4?=
 =?us-ascii?Q?AgpZfQQfgHXBc+/+LK+/VAmOOUc/DLAoK6tf3H5Biwo51711BsT27ZgaWkg0?=
 =?us-ascii?Q?kUMOyFkLdgdMPqx44vKEuN9UZ/9DuzzCVc6HYZMA2ndBSUMu2cdinWnrnrXN?=
 =?us-ascii?Q?cHz54kKi9XbhxaKiWpK1Otgzd9DKrkqbbcwamvp8tQZK46XKlDXCUVGH4cl0?=
 =?us-ascii?Q?CGYXvgoiCQE5t4S8on13u1uCXF8nucS/TIpCoxB7G2Zz+rLiM0oQS5/Mlcta?=
 =?us-ascii?Q?dEU6YkMZTelqzYI2hFojANgawAveh0BEpRxunrqYsN3gukfo40UrC/9tRzmH?=
 =?us-ascii?Q?EK3q0Te2CNEljPf1oa4I6OxOi2yiTR4dRt+ZDGOQIe7BkkojwZ/KALF5uqlf?=
 =?us-ascii?Q?hrtFkU6F0z/qhD5n7IPYwFSxYUrp72qDXi9Jw3jdp3m9cr2pd3+uXto3kkfT?=
 =?us-ascii?Q?B1qluMHIwSVHafZQNkzrEc5dkPdRPwulFp9f1RPKHGgJvxT/0EJtOl+XKOrz?=
 =?us-ascii?Q?UYLaFdZMWoIPBET58xc89gnCiddQIDXBKYhHSzyyuc/NPHNZI5Csojpi84xR?=
 =?us-ascii?Q?Hzxb4zMt+IaHioovMkt4DyzeXf0OxblKddxsa8dybi0sBi4ZxwhBBh65wrMr?=
 =?us-ascii?Q?D+qT+ZTuOO+/JBL0rmqKIaa9sTKHOpbdOFHIYv4FiSQkgggg/UlZWMlHyrwK?=
 =?us-ascii?Q?JLBVDRBaU63n6RVGdJHmUdOyNrjn1+fuD3AlFdV4vxUXzl3g7V1VGuVXprx/?=
 =?us-ascii?Q?tYz/QuFi/7ii6ot0c65w7Xnrqy54rwmXDJQA/N6l8NS3Ph4C0NK3Zgrthmr9?=
 =?us-ascii?Q?X5RAaf5lFyv5up3PGoJYBmnKS0hrnfsKgUcHRpL/BH4nONxni9Zg5kbEAQuB?=
 =?us-ascii?Q?oBre0wcG8Q4juxOQe7SPMwlYnaE5cf4pp/uT5tuQk7Y0rw0sPGPyxEm+ZqOc?=
 =?us-ascii?Q?wcdZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:42.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b2768eed-761f-44d0-95d3-08d8b49e4b17
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVpOte6DgTFvmrYVMIfQQpQgumIUqs3buVnd5n8dJKt20TeKf/M2V9b388jwpf2/DhvUUlpmwHVlMG7TQLVdxhWg8dh2/cjsqUmh12/pey4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now bdrv_append returns status and we can drop all the local_err things
around it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                     |  6 ++----
 block/backup-top.c          | 23 +++++++++++------------
 block/commit.c              |  6 ++----
 block/mirror.c              |  6 ++----
 blockdev.c                  |  6 +++---
 tests/test-bdrv-graph-mod.c |  6 +++---
 6 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/block.c b/block.c
index 1a5d0e748d..2a13fbfc73 100644
--- a/block.c
+++ b/block.c
@@ -3120,7 +3120,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    Error *local_err = NULL;
     int ret;
 
     /* if snapshot, we create a temporary backing file and open it
@@ -3167,9 +3166,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
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


