Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CEA2C687F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:12:52 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifQZ-00082P-Nr
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1Z-0001ms-Dq; Fri, 27 Nov 2020 09:47:01 -0500
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:27730 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1X-0003Uq-Eg; Fri, 27 Nov 2020 09:47:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrEZqMu8g2I7G3a4+m3jarKI+n9YtEAYgouosJ5X3zs+tSqGDTDa2DCkqmji10XCxa10y1MWSnj2/q7Yev9VG+f8aC9bKl/vECrv1ULH/lWvhd4k5xIx91gTSyX60s7g4GZTUQWAojl+5jurrbg7L9FNUYpe4X0fUmk1zBoF3Hh3vZAupToDwM/v8ZaDFtrwRrUuWumLR/xShbpCyT7Yh7mX08rEx1ed433IYxRH3DjnlVTSWX3kPJgTUJBMPt9uTHnE3tlp3NrMOY4DSM8pBDW23sfz8pHbB08+0xZ8QTw43ExxgYhxIA8uwYL7YLdcu2H1/dPmdChWvUNhknYOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf/ugMQ2qt0+ghbHSsD95N+SQm3+WshpXEfckv9P+UI=;
 b=PflVCMGgFvUefSRNWnXnXRVxek3li9qA/QuscvZUy5q7Q/OMa4fa+TPxmbw6HV27W9IwwVvsJCJGZ3NVik44o7vqid33MjSVeiQ+gRm43A9kNP5MW95OmKHAgsYbRUMiSDNXVnE10bRgTVNx3g3FIphlgrLtho1Xy0OWaSbekay/16Si0WpOuSuLKuy+SGjtKV21jEG8m6sWQpEdQ7iSRqVzAi1jMwiBr6zvEaMHRa34NLe8Erqnl9WgB1EEzQ8E049FQSmo8X9VJPh6HhbPX0rmI11EvCPX7F2qqF3MJuEDLeVbKhS/HVFg76QWKq3ayo4hLDJpO+SjcSHA0zDFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf/ugMQ2qt0+ghbHSsD95N+SQm3+WshpXEfckv9P+UI=;
 b=O9uhYohMAIvRo0QFCxos5E6zfN2KVLmOQUhSZB4R9AM/W2aiSBCb13xLPtp+LL0c4swkkLSM6ekFntXEba5EXSsCPR6XpRTQWOGkUyWCzPq3dTuruEZRlGlpvZxyFQumSXGt9NHod552LHSjvOKlv482q2KzjpqbHwEJHcyifZs=
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
Subject: [PATCH v2 04/36] block: bdrv_append(): return status
Date: Fri, 27 Nov 2020 17:44:50 +0300
Message-Id: <20201127144522.29991-5-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197ea59e-01db-4215-b02f-08d892e31bec
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5128B7D09F981FCC88B28C11C1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnNztdsRswcHeRgDb2avUNb5rxJM0l+wyLdVVPElc5dh43RVmHoxxDhpOTI9n+FHQB4og6rXmghjrbJ1Ihqabjc5sZlPfnZ6ZZDeHP+ixST1LIEUBloEGoDu3iMG+dxWDPL/nZwos+j2J0djFBa4BnM54mPehLXfin2Mv0mSDTWdvjD4pt5/C7Jr/mzkg35ZkpHyP/hIbGbw+2N1qSY1b0DnCTnNNcW0DrgV+Y33/Af6IHAKS6k0EExHQZZkEUEmri7YAS8q0RE+55s5ZoXHKGHEXzc9UBTg/o6vkQZSuTshZyYwQ6Stf3adpRuyGq36ofI7TrMSWuB6K3KJ8t7XWd2HKYbpxMLzUTJoBjwN+giTbEIgxSaxCb9cl+wjlAHi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(186003)(6666004)(69590400008)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0JGiUlZgnh59NoNYWjjaF977usNNXP7iTGyHzk3lCx1vEHUsJ/KQH0gjQBW0?=
 =?us-ascii?Q?6AT9qKY93hk/GCmpvv4EyhUHL2RuMwOfYdeEGqzThdKNeByE/D/PWY+Ecqu2?=
 =?us-ascii?Q?5yLrCYHoTUi/r2NXWllDWJnMHpsM4hUiL+bbU+cuEsAY2vYhRTERWoLoaZDX?=
 =?us-ascii?Q?wtC6nyw0EHyAli0lsyuT4cTvoEBTA+WvWQPwhL63okYZc1P12mXSqjOOBZYT?=
 =?us-ascii?Q?rWm7RR9z/WkA/39xGdQp1eXNZOdIlhiDcRMgePqTZNdmldlNi98zAJ6anooh?=
 =?us-ascii?Q?9o1aGvBxBwym/zSmNonYPoMe6FXiXcYXkssk1HNdbRcJwkY99sK6DUuPTRZ1?=
 =?us-ascii?Q?6Hw1U/Hy6cw2dDg/bV0UrCBDD6/U2xlBfR69TvtPulHVCciW6cGTWsC3FVud?=
 =?us-ascii?Q?xyem5tXZgGAnk9zKUAgzgZCXl86HYpY1K20/wBaYTVlCfN9bbs898gHf/F3R?=
 =?us-ascii?Q?icolzrWwESrHBW/pQJ3m2oddbCcgCnZ3EGUkQMHYZkFt9VqC99B/92IJyDrb?=
 =?us-ascii?Q?oJY9mU9vxJpTJVH8LyPQuyccbG4HNkLd+gK8yQAKb2IFlXUQvsCxFrLY4CO/?=
 =?us-ascii?Q?1j8N5t4HahGqMJnPwODBkHD8Z02PuuwFVeqef/ksIEZsl8zM8Kz4epTURfxp?=
 =?us-ascii?Q?nFxp+abnkTaaILyGLe0SPnvfUn/GlXSm4a+/aILgU4I0YzQ8MuBF9sgPSqhW?=
 =?us-ascii?Q?93bDpM+D8AkaYs4FDhZiFhWBXdfmUZ/O+R1ndb6Zq0Am15wCAs3Inqb5+ete?=
 =?us-ascii?Q?IJlyN7VLAK93WnpUpJB79gvLZc4uGHT/WP9KVmjn9zC6Is7voJYq4SYw8tMN?=
 =?us-ascii?Q?EM70mwF3wb7cRwh7+2teqObEAICoJJZLCRQFU5SNDWOMcdowGbu1bzTXkb7y?=
 =?us-ascii?Q?FBmZQ0Kyr+y7V5t5fNMfOC/IVlu99j1BSulj98rc8dGVYF4aJxD7d+gIU19d?=
 =?us-ascii?Q?rCiZ20zLyReF6O77TRDwjGlQYpvfWuZOP3AJMt9lPJQF5zSK9pF1TW0c12Uc?=
 =?us-ascii?Q?US3h?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197ea59e-01db-4215-b02f-08d892e31bec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:39.8186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzaU35AJhmxJ720b0LtoV0fIaGTwZkE2gTACq1ChBwt5wPYnHMm+lvLO56x2jixApyWBw9qQRirQCAJbkZDTM6A5RCSMpMpd0cILwuvbC8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.128;
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
index db37a35cee..ee3f5a6cca 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -344,8 +344,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 
 BlockDriverState *bdrv_new(void);
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp);
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp);
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
 
diff --git a/block.c b/block.c
index 55efef3c9d..916087ee1a 100644
--- a/block.c
+++ b/block.c
@@ -3103,7 +3103,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    Error *local_err = NULL;
     int ret;
 
     /* if snapshot, we create a temporary backing file and open it
@@ -3145,9 +3144,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
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
@@ -4606,22 +4604,25 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
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
index cfe096c9af..74f4a4153b 100644
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


