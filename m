Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F672C6874
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:09:47 +0100 (CET)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifNa-0004wr-2t
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1R-0001fi-AQ; Fri, 27 Nov 2020 09:46:53 -0500
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:45281 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1J-0003QT-5u; Fri, 27 Nov 2020 09:46:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEWeHOTR5hTa9OrqSFIjI2KfCp+5Y64EIqLJh0f33zEIYanCfEL2X9MGBrBgED13LI6cjwnU/LcXhK3syK4z9VOcDBxArvjXFOidbhET0nIVFdRDD8pxg9YLl42K+yPVcC+U47kqutXx6YNM5hW8H2iJKXFXJsqD2nou9CINktRm3RVKMO7jr1KvgI97kyuz2ResD0CaLbukJ4lDJjcpH2eUaATDOEjxMdD7YDoek8e2Kqo3RSmVBqxDOZnUv1v5R64Y3ROj7WClhH2aK3hktFqkN7ZzPNJG5u9WNJGn9sYc6Jv5zgjjuRdb8vkalaqHcf2rGBMtt8pq9LACtfll5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYlvZS0uriRaQVqJbTJV5SLr2ZYh0DH7YH9xOk7aAZw=;
 b=GxfS7feLQAY2sNLQ/wG9/e+2ChRLEzVo2hbrGrtBwb6Pk5P4X6KPU6IoIbqpwgUXhtR6Fh3LcOWRjjQOhy/A0v9a5ILOp7SimS9gIr57gdNMnUhgXx4nALuAQ0bYCFl55i4BaTmLRLECj1Uuhq7hq0sLKTFg0UFOxJETlBrjOpYWBsA12+11izjyLddRdtVIvTvLn19OBmJkdE+i/C2XzybpyKm/hNMt4PXtbSa5CWvSB8l31C1L62VcU+GuzoRmlvcs+X43qARvtCTjbYUGFwPvfp9zXOCl4vWfibI7s/r39II0CvL/hEMnmDokt1Khb/G4YyM55FV0+KQq0ULqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYlvZS0uriRaQVqJbTJV5SLr2ZYh0DH7YH9xOk7aAZw=;
 b=C5/dHuyblh3JKMUP7ClDP/jpZr7LYXvtiIbYMxvqt+el3SNOd87cXMgWTmWbo6vu9j9e0c/0YiTMBpS6xr8FmvxG2K5IxwVsEY1pIMqXvCsJI5GjfBGa5Ix3vv0LpEga6kPZ5ngJu0zEQzpG931Ev1MlN3ieIRGaOV+vmglTdzs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh permissions on
 updated graph
Date: Fri, 27 Nov 2020 17:45:16 +0300
Message-Id: <20201127144522.29991-31-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb44ea51-38f4-41af-dedd-08d892e327fd
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59907A5719D44C5337B8FB72C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5c50EFxl7K2TlEqatZWBO1nTmOOrDdUv7ZhA+49v9qhu+vbbz6mMsJsKwuY+zjdn+NYl1lPmMVLBzD+tkk6Myz3JMRL3PZHQjXSMRqpVxeZylLfb0NkexEezj8N7ZsVTipLOShvpurmO1F1kNaWkW0bKHmFCwNYA+HxJbvc6uxMFBppu3s/H1nX23uRb2POtQ5dnyhhdTR2eNQOFt3XC27TKVZGWA3fArZWm5dG+//u9kMeYVaX20RQV8p19Qp1dPXHiKZoAwuVNRsBT54k3DGaEF94JT1ZUb4yA2fuGzp09TcXLpCljkXIZ6+XnUmLjc7hPjE8q4Of+LjNgSm7lj1rS4y43DpRZXD28wkWTSUE6GvW2YXvsXTdizqphnUy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(15650500001)(66946007)(30864003)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rkeC+gC66G7b3puZzuGowDyr22wXMTr88i6vikmgy8FrlRyQtJlvm7nIuwJQ?=
 =?us-ascii?Q?orbfC1bCDkopIgQrsJtuzPb/Ra2of5DCrjt0Lg39IdgrwXSTXtyKlBJ87RyV?=
 =?us-ascii?Q?QbTl1T/6Vwf3j3RAUnXwKAba1Jl7+tmVP+30Cdg0pNQMHfhDbAhlnEXeFTqn?=
 =?us-ascii?Q?vnS0tH7epFTvoxBg7ZDnHTsN5pAXJ9AO7mE3/r9putQcUWLlo9AKaSLB5zY+?=
 =?us-ascii?Q?i44IHuU4E5McjMqgzd4Jxma8hHGY+leeqMV++6fdelKoGlTCi2H3Ny8AHXbU?=
 =?us-ascii?Q?5IS1oah0viRpycRljSwlkjYrQTArridtisFe7zUN3Pqx9mi8KTk7PQWduB4R?=
 =?us-ascii?Q?poyO+dFBqbUzOt4GKODmqVYBA9T+BfO9u/9VlTEeZup8s66TnppnNXDjj8Y1?=
 =?us-ascii?Q?0pogPnuMack3kcjuK7vdNP5jLT6puHTBDCNJbw5c/zymVVFOTIO/f80Y6pWB?=
 =?us-ascii?Q?g8zfDW5XaXnTdTtumKVop+m8v9fBOZBhD2ZUFLz1/JJ6A9Ca+DuyqaJdQlZy?=
 =?us-ascii?Q?0BPurIgsMWtYEYqY3a7y51yO/nNrEcVoUJdO71edS9dfKaq0pHFpgJ8BKwF4?=
 =?us-ascii?Q?/vpJo1Kj86l9fmM1AIeDQte4wV8xu/ipxpD2aDXbJ0oToMIpmADP7P+hfyoE?=
 =?us-ascii?Q?VTxrgxm+OIqRQTEIyVSb6q/jMwHycdat0OlvVVmuVb7xv6TFVkOZuj3IgItq?=
 =?us-ascii?Q?fKyI/ez//tVZqp4I+I3PEwy5hfQw2toR7tfG4LjRq94xsjT/QULt0FryaieL?=
 =?us-ascii?Q?WuW8ZEB1fQ2Nz9xpRM10WhU1iiuIF8fp9xqSQKyglaw4/nG2xsIHysF4Y4/s?=
 =?us-ascii?Q?nHLKSL/4hGWaQvqjpwgG7pqyqEbw6k3hqBbW3rfHyO9Mkxbnt4IzIAMXcVBW?=
 =?us-ascii?Q?0KDF8ePzaahoHTbHye1HfzScSGfIZkkgOZU+8FAdzwp2xbJXcr+tQYX0z+G1?=
 =?us-ascii?Q?5maU0qIVUVxLURXLp068QENa5rNng/7xX4tXDJheutXGBmAPKcHUm6IzPQiz?=
 =?us-ascii?Q?jMUw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb44ea51-38f4-41af-dedd-08d892e327fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:00.1296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGzwGoWwg0KrUjC5IKdtLoMDp0txKJhx79Hu2WQgp9LlemZRwfLYPk7IAzd9qwBioJydgkZ6f5GyojbaRcaX1hghPhlLRZIxrjjSRcQhmx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Move bdrv_reopen_multiple to new paradigm of permission update:
first update graph relations, then do refresh the permissions.

We have to modify reopen process in file-posix driver: with new scheme
we don't have prepared permissions in raw_reopen_prepare(), so we
should reconfigure fd in raw_check_perm(). Still this seems more native
and simple anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |   2 +-
 block.c               | 183 +++++++++++-------------------------------
 block/file-posix.c    |  84 +++++--------------
 3 files changed, 70 insertions(+), 199 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 0f21ef313f..82271d9ccd 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -195,7 +195,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
-    BlockDriverState *new_backing_bs; /* If NULL then detach the current bs */
+    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
     uint64_t perm, shared_perm;
     QDict *options;
     QDict *explicit_options;
diff --git a/block.c b/block.c
index 617cba9547..474e624152 100644
--- a/block.c
+++ b/block.c
@@ -103,8 +103,9 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     GSList **tran, Error **errp);
 static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
 
-static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
-                               *queue, Error **errp);
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue,
+                               GSList **set_backings_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -2403,6 +2404,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
     }
 }
 
+__attribute__((unused))
 static void bdrv_abort_perm_update(BlockDriverState *bs)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
@@ -2498,6 +2500,7 @@ char *bdrv_perm_names(uint64_t perm)
  *
  * Needs to be followed by a call to either bdrv_set_perm() or
  * bdrv_abort_perm_update(). */
+__attribute__((unused))
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
@@ -4100,10 +4103,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     bs_entry->state.explicit_options = explicit_options;
     bs_entry->state.flags = flags;
 
-    /* This needs to be overwritten in bdrv_reopen_prepare() */
-    bs_entry->state.perm = UINT64_MAX;
-    bs_entry->state.shared_perm = 0;
-
     /*
      * If keep_old_opts is false then it means that unspecified
      * options must be reset to their original value. We don't allow
@@ -4186,40 +4185,37 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
  */
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
-    int ret = -1;
+    int ret = 0;
     BlockReopenQueueEntry *bs_entry, *next;
+    GSList *tran = NULL;
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     assert(bs_queue != NULL);
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
-        if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
-            goto cleanup;
+        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, &tran, errp);
+        if (ret < 0) {
+            goto abort;
         }
         bs_entry->prepared = true;
     }
 
+    found = g_hash_table_new(NULL, NULL);
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
-        ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, errp);
-        if (ret < 0) {
-            goto cleanup_perm;
-        }
-        /* Check if new_backing_bs would accept the new permissions */
-        if (state->replace_backing_bs && state->new_backing_bs) {
-            uint64_t nperm, nshared;
-            bdrv_child_perm(state->bs, state->new_backing_bs,
-                            NULL, bdrv_backing_role(state->bs),
-                            bs_queue, state->perm, state->shared_perm,
-                            &nperm, &nshared);
-            ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, errp);
-            if (ret < 0) {
-                goto cleanup_perm;
-            }
+
+        refresh_list = bdrv_topological_dfs(refresh_list, found, state->bs);
+        if (state->old_backing_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_backing_bs);
         }
-        bs_entry->perms_checked = true;
+    }
+
+    ret = bdrv_list_refresh_perms(refresh_list, bs_queue, &tran, errp);
+    if (ret < 0) {
+        goto abort;
     }
 
     /*
@@ -4235,51 +4231,29 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bdrv_reopen_commit(&bs_entry->state);
     }
 
-    ret = 0;
-cleanup_perm:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        BDRVReopenState *state = &bs_entry->state;
+    tran_commit(tran);
 
-        if (!bs_entry->perms_checked) {
-            continue;
-        }
-
-        if (ret == 0) {
-            uint64_t perm, shared;
-
-            bdrv_get_cumulative_perm(state->bs, &perm, &shared);
-            assert(perm == state->perm);
-            assert(shared == state->shared_perm);
+    QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+        BlockDriverState *bs = bs_entry->state.bs;
 
-            bdrv_set_perm(state->bs);
-        } else {
-            bdrv_abort_perm_update(state->bs);
-            if (state->replace_backing_bs && state->new_backing_bs) {
-                bdrv_abort_perm_update(state->new_backing_bs);
-            }
+        if (bs->drv->bdrv_reopen_commit_post) {
+            bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
         }
     }
+    goto cleanup;
 
-    if (ret == 0) {
-        QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
-            BlockDriverState *bs = bs_entry->state.bs;
-
-            if (bs->drv->bdrv_reopen_commit_post)
-                bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
+abort:
+    tran_abort(tran);
+    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+        if (bs_entry->prepared) {
+            bdrv_reopen_abort(&bs_entry->state);
         }
+        qobject_unref(bs_entry->state.explicit_options);
+        qobject_unref(bs_entry->state.options);
     }
+
 cleanup:
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        if (ret) {
-            if (bs_entry->prepared) {
-                bdrv_reopen_abort(&bs_entry->state);
-            }
-            qobject_unref(bs_entry->state.explicit_options);
-            qobject_unref(bs_entry->state.options);
-        }
-        if (bs_entry->state.new_backing_bs) {
-            bdrv_unref(bs_entry->state.new_backing_bs);
-        }
         g_free(bs_entry);
     }
     g_free(bs_queue);
@@ -4304,53 +4278,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return ret;
 }
 
-static BlockReopenQueueEntry *find_parent_in_reopen_queue(BlockReopenQueue *q,
-                                                          BdrvChild *c)
-{
-    BlockReopenQueueEntry *entry;
-
-    QTAILQ_FOREACH(entry, q, entry) {
-        BlockDriverState *bs = entry->state.bs;
-        BdrvChild *child;
-
-        QLIST_FOREACH(child, &bs->children, next) {
-            if (child == c) {
-                return entry;
-            }
-        }
-    }
-
-    return NULL;
-}
-
-static void bdrv_reopen_perm(BlockReopenQueue *q, BlockDriverState *bs,
-                             uint64_t *perm, uint64_t *shared)
-{
-    BdrvChild *c;
-    BlockReopenQueueEntry *parent;
-    uint64_t cumulative_perms = 0;
-    uint64_t cumulative_shared_perms = BLK_PERM_ALL;
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        parent = find_parent_in_reopen_queue(q, c);
-        if (!parent) {
-            cumulative_perms |= c->perm;
-            cumulative_shared_perms &= c->shared_perm;
-        } else {
-            uint64_t nperm, nshared;
-
-            bdrv_child_perm(parent->state.bs, bs, c, c->role, q,
-                            parent->state.perm, parent->state.shared_perm,
-                            &nperm, &nshared);
-
-            cumulative_perms |= nperm;
-            cumulative_shared_perms &= nshared;
-        }
-    }
-    *perm = cumulative_perms;
-    *shared = cumulative_shared_perms;
-}
-
 static bool bdrv_reopen_can_attach(BlockDriverState *parent,
                                    BdrvChild *child,
                                    BlockDriverState *new_child,
@@ -4392,6 +4319,7 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
+                                     GSList **set_backings_tran,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4468,6 +4396,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
 
     /* If we want to replace the backing file we need some extra checks */
     if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
+        int ret;
+
         /* Check for implicit nodes between bs and its backing file */
         if (bs != overlay_bs) {
             error_setg(errp, "Cannot change backing link if '%s' has "
@@ -4488,9 +4418,11 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
             return -EPERM;
         }
         reopen_state->replace_backing_bs = true;
-        if (new_backing_bs) {
-            bdrv_ref(new_backing_bs);
-            reopen_state->new_backing_bs = new_backing_bs;
+        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
+                                      errp);
+        if (ret < 0) {
+            return ret;
         }
     }
 
@@ -4515,7 +4447,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  *
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                               BlockReopenQueue *queue, Error **errp)
+                               BlockReopenQueue *queue,
+                               GSList **set_backings_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4582,10 +4515,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
         goto error;
     }
 
-    /* Calculate required permissions after reopening */
-    bdrv_reopen_perm(queue, reopen_state->bs,
-                     &reopen_state->perm, &reopen_state->shared_perm);
-
     ret = bdrv_flush(reopen_state->bs);
     if (ret) {
         error_setg_errno(errp, -ret, "Error flushing drive");
@@ -4645,7 +4574,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, errp);
+    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
     if (ret < 0) {
         goto error;
     }
@@ -4767,22 +4696,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         qdict_del(bs->explicit_options, child->name);
         qdict_del(bs->options, child->name);
     }
-
-    /*
-     * Change the backing file if a new one was specified. We do this
-     * after updating bs->options, so bdrv_refresh_filename() (called
-     * from bdrv_set_backing_hd()) has the new values.
-     */
-    if (reopen_state->replace_backing_bs) {
-        BlockDriverState *old_backing_bs = child_bs(bs->backing);
-        assert(!old_backing_bs || !old_backing_bs->implicit);
-        /* Abort the permission update on the backing bs we're detaching */
-        if (old_backing_bs) {
-            bdrv_abort_perm_update(old_backing_bs);
-        }
-        bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
-    }
-
     bdrv_refresh_limits(bs, NULL);
 }
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 37d9266f6a..42c60c8a02 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -175,7 +175,6 @@ typedef struct BDRVRawState {
 } BDRVRawState;
 
 typedef struct BDRVRawReopenState {
-    int fd;
     int open_flags;
     bool drop_cache;
     bool check_cache_dropped;
@@ -1062,7 +1061,6 @@ static int raw_reopen_prepare(BDRVReopenState *state,
     BDRVRawReopenState *rs;
     QemuOpts *opts;
     int ret;
-    Error *local_err = NULL;
 
     assert(state != NULL);
     assert(state->bs != NULL);
@@ -1088,32 +1086,9 @@ static int raw_reopen_prepare(BDRVReopenState *state,
      * bdrv_reopen_prepare() will detect changes and complain. */
     qemu_opts_to_qdict(opts, state->options);
 
-    rs->fd = raw_reconfigure_getfd(state->bs, state->flags, &rs->open_flags,
-                                   state->perm, true, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -1;
-        goto out;
-    }
-
-    /* Fail already reopen_prepare() if we can't get a working O_DIRECT
-     * alignment with the new fd. */
-    if (rs->fd != -1) {
-        raw_probe_alignment(state->bs, rs->fd, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            ret = -EINVAL;
-            goto out_fd;
-        }
-    }
-
     s->reopen_state = state;
     ret = 0;
-out_fd:
-    if (ret < 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
+
 out:
     qemu_opts_del(opts);
     return ret;
@@ -1127,10 +1102,6 @@ static void raw_reopen_commit(BDRVReopenState *state)
     s->drop_cache = rs->drop_cache;
     s->check_cache_dropped = rs->check_cache_dropped;
     s->open_flags = rs->open_flags;
-
-    qemu_close(s->fd);
-    s->fd = rs->fd;
-
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -1149,10 +1120,6 @@ static void raw_reopen_abort(BDRVReopenState *state)
         return;
     }
 
-    if (rs->fd >= 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -3060,39 +3027,30 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
                           Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-    BDRVRawReopenState *rs = NULL;
+    int input_flags = s->reopen_state ? s->reopen_state->flags : bs->open_flags;
     int open_flags;
     int ret;
 
-    if (s->perm_change_fd) {
+    /* We may need a new fd if auto-read-only switches the mode */
+    ret = raw_reconfigure_getfd(bs, input_flags, &open_flags, perm,
+                                false, errp);
+    if (ret < 0) {
+        return ret;
+    } else if (ret != s->fd) {
+        Error *local_err = NULL;
+
         /*
-         * In the context of reopen, this function may be called several times
-         * (directly and recursively while change permissions of the parent).
-         * This is even true for children that don't inherit from the original
-         * reopen node, so s->reopen_state is not set.
-         *
-         * Ignore all but the first call.
+         * Fail already check_perm() if we can't get a working O_DIRECT
+         * alignment with the new fd.
          */
-        return 0;
-    }
-
-    if (s->reopen_state) {
-        /* We already have a new file descriptor to set permissions for */
-        assert(s->reopen_state->perm == perm);
-        assert(s->reopen_state->shared_perm == shared);
-        rs = s->reopen_state->opaque;
-        s->perm_change_fd = rs->fd;
-        s->perm_change_flags = rs->open_flags;
-    } else {
-        /* We may need a new fd if auto-read-only switches the mode */
-        ret = raw_reconfigure_getfd(bs, bs->open_flags, &open_flags, perm,
-                                    false, errp);
-        if (ret < 0) {
-            return ret;
-        } else if (ret != s->fd) {
-            s->perm_change_fd = ret;
-            s->perm_change_flags = open_flags;
+        raw_probe_alignment(bs, ret, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -EINVAL;
         }
+
+        s->perm_change_fd = ret;
+        s->perm_change_flags = open_flags;
     }
 
     /* Prepare permissions on old fd to avoid conflicts between old and new,
@@ -3114,7 +3072,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     return 0;
 
 fail:
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
@@ -3145,7 +3103,7 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 
     /* For reopen, .bdrv_reopen_abort is called afterwards and will close
      * the file descriptor. */
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
-- 
2.21.3


