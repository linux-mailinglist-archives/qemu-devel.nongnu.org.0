Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBC30BECE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:55:03 +0100 (CET)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vCw-0007ED-7H
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8l-0001Ao-2Y; Tue, 02 Feb 2021 07:50:44 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com
 ([40.107.6.139]:33232 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8h-0001qn-47; Tue, 02 Feb 2021 07:50:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjoCGrT8ZHTwYFLJ/ESqQYXVEtZgEn1jqcFc34PCYMT9RXXW6AxuaB0Bm9iynIA/UU5TT++CaeKs7epsbSvrYM5S9g2BB/XBi6mrGe3ZYwaSnZoVNjd3SOue187y4VnNMkqZGCXWL6H/nWh4Z5jbY+uS0NnwC2Granzvp6Ki6GaL436bjGgZbWZcZ+IxV8BrEnOx4EjU4c+DsWxHqmfD/oQ6Q8J3WWevEaQmnZtiYWNfHfXGoK4p6R7dUGsx2m/dq0c+qiSYSIPM+8WvMPMh6X5wKinWCZ0R+zDFDGfaeGUE8pVPY7kIK4eL3VRNoJollv2pCGs2juS2yZLVNumZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kks2NLH0SSSLBaTdj72iNuPsYfxkro+OXuvgGYLuJCQ=;
 b=dWkZ6TsedPm/zMZMGR3ueydSpaAtxK2jtHY0MxVXnvhq0o4fsfl7+s4LgjQpuzR/wyznsmr2wHN62SpF6bOoz5QfXamWry9rIP5UIBHp/yVLFx4ppBscmhwEtntbB/Iqcy7f0xk7uvsFmvDRmLiYJPk/s1gMGBE3wGMtw0GLo3mrVXnQwGu3e8CW6OcD/5tMSPtFGzjfrSdsdY9l/nCPEnhwwPvAkw/VwhBHXNde21Xi0R4pw95zkOM/UjWKbrW47FMsrWfymYG7jlL319tP2pPmF/kfestsZB5/Zx+8Fi5z4elek4/vzDSf/vTLyc+rUvFrgkeoBLNODpKnRFw6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kks2NLH0SSSLBaTdj72iNuPsYfxkro+OXuvgGYLuJCQ=;
 b=hIhUENx3XkrRBuI53Lzuf2ptUAR9ulgzDHtREnqXSHpapnl/DOovxPeXBiw2fDqiR6b1YEsDGFNazwj6yjqvv6hnQBKCHuMWUfaFTSd/6SQR0sApTw7CSlWPN4JFU6YG5X8NGSt1LXKZuHNw41eAgJk3ExYG60h6NNwT1+Y/ZPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 02/14] block: use return status of bdrv_append()
Date: Tue,  2 Feb 2021 15:49:44 +0300
Message-Id: <20210202124956.63146-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd4fb0d-9e2c-4af0-647a-08d8c7792145
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3623D190EA65C3A5E62C1905C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aN1FiIzbF9qhSeBiJZL8YMXTGm+d1taCUkupnUzim+oR8mj5RUwVqaUTVs+Qnm6EG0/QOQKnDGxWsOTjmxjjKqUuMDEGXa8/VnNXsguyHypRmaU4Ajm41wZ6l46c6q5ClsNCU5s4OF9133vLnjVmQ17NqRciQYgu8eTv1VeVmwQDLjQlrX+KXY6zw/Y5yzSvVRecIM/X1Y0OV/J8mNRah/cZ/HJluMy2mi+4PP0t8HhbP6X3k05t8yGpEhmZaYwc73YUOERwqtbQw+MQhO5p6X6AFZDemPEUe3NyFwDNhjtR55JIVfzZSNZHtRD2r5A9KsCx1QiwrY2madNp7TbRBDBorSUpSgOhPKMDT9uAqnze4HX/SVx3Hhm4hkrnJLVkoPk9WztCj50gZpoyPzCn3OpOHVy/rvczg0aQW8OLozxk1Kk3ZQFdDxFBlzqB0SF46UVELUa1NALdcaXD9Z7FxAjbq1GAWg+MoQIRY3Q/aDNU/LeT/Xd7xhn3qnqaW2l1pWGDHw9oHCiOe8MP90KUtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?G4Tc+LKG/jH4eJouZd12sc4fG/IKZHbqLFzSFjAOiwewaF/IVnaaCp9XK+0q?=
 =?us-ascii?Q?bCM5uCiQF55MYQJJzAG7S8ThCC5abfhdfb0lxpZS39hrj7XRASjj6LSkUd+S?=
 =?us-ascii?Q?9wDVeJ44YKr7IDqaVOtvvDLSklpoI+/PN7DduN5Je1BDjnDb1klsrxGFv11s?=
 =?us-ascii?Q?++tqrD5L7onDKwoYx1fmdk5visP26XPI/AbdxHKVmmvm7IvUAe2EmOH4DzeJ?=
 =?us-ascii?Q?lbsfBUm3eK7IimM1CAuKpo3McGvM6LjjRypDsq8GJ6CnYSufH8EPaWSqJvPx?=
 =?us-ascii?Q?6V2Z6xixkLkDlhNez60PUW9cVvf+KH+0M/MlcfsAOORJuXS2WphWi0ztMFC3?=
 =?us-ascii?Q?gu4nXd3suFOcluzrltqGnXBitxcSzTz5deft3hH+BWBiCaJGlkOD8pvkao1z?=
 =?us-ascii?Q?G0ltsnB6jPon0hk33u12zIqVabIbuMCYlZ0Fs/TKHKR3/r+sOQ6Kt1NY8cFU?=
 =?us-ascii?Q?WqOfPZQKitTu/5uZ8DHH5xI8h90cN3zh7ePy7U7Sb/pfTzOF+VHyozkwUdHq?=
 =?us-ascii?Q?6IKqWOc3/ya2nNZjYnrrhU72PN7eE11he67Yw4YOApG7QIyJNdL9VpYMZqgV?=
 =?us-ascii?Q?cUoFAmZ1yZNGGt+EcXjJ+ejFLByeC7ieJ7FWHI55EuGchXtKS7qBPAayBmaf?=
 =?us-ascii?Q?mHxV7gE3TCXnxcU1BrWivNp7kuiaZI9pcOflBKlhlsfAlRU55v/BRXqe87+2?=
 =?us-ascii?Q?WjmtFr8y+p+JKmAHr/y7NKqw/HVwXAjnCpBcZNGvb8ioyC9qJdnF8kzDVFL4?=
 =?us-ascii?Q?yTTcjSWFZ6SquFKhz5eawlTI15Mzvm1VI0h06xl9dcabm2NeQDUJ2MRRebpt?=
 =?us-ascii?Q?s9CQDekaf9rd1Vtzc6IAeyVtIdic+z8LtSGOVQUdu/WYrWdhrAV6Dlcc6g7q?=
 =?us-ascii?Q?D0ck1M/WdAfbzCbTgjt4DXrefd0LYDDFvCSd68m43aRZfEt6tcHzoW1BjrE+?=
 =?us-ascii?Q?lNBp2rpf+zBInz3DejO6nThomN3PlWeE0emEdBUzhQrRkIDT9VgGxmJQ+P+q?=
 =?us-ascii?Q?bqPCoK86f5wmjQD9cRuHnz+uBTovYFudDUd0EssJo+ygbOmy4mZmBK9VzPbL?=
 =?us-ascii?Q?eAkaYOnY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4fb0d-9e2c-4af0-647a-08d8c7792145
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:33.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlp+pIfxh0IMBW1e5Bmf/3DWi2G6OgNg83Mt9LgdYiUDbMge8HjMZMvJC42ixTKefqUdfB8+omysQkue0efGM7nwCgMxxPbRgyEllb/Zyyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.139;
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
index 8a169641de..48b0de36ff 100644
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
index 6e7e7bf340..d1253e1aa6 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -191,7 +191,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockCopyState **bcs,
                                          Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
+    int ret;
     BDRVBackupTopState *state;
     BlockDriverState *top;
     bool appended = false;
@@ -224,9 +225,9 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
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
@@ -236,19 +237,18 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
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
                                       cluster_size, perf->use_copy_range,
-                                      write_flags, &local_err);
-    if (local_err) {
-        error_prepend(&local_err, "Cannot create block-copy-state: ");
+                                      write_flags, errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
     *bcs = state->bcs;
@@ -266,7 +266,6 @@ fail:
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
index b250b9b959..cd438e60e3 100644
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


