Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D04C97A4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:17:41 +0100 (CET)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP9sK-0002Hd-9X
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9pE-0000Rr-Ev; Tue, 01 Mar 2022 16:14:28 -0500
Received: from [2a01:111:f400:7d00::71e] (port=41121
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9p9-0005Ia-B0; Tue, 01 Mar 2022 16:14:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UooB43C/5zqJiNv9NeervcXNxhuWpkcZtFNVJ8NDotZYOL2mYPty+/T5yTKq7vdRWV2nm1mOF6j8hqpxT2czUZPPZw0jwFXeYCD/IDqlsTusWR0sOCYw8rKqA70Eg8t5fbb4uDVy6b+XrhbWFiTlLb5Pb/U8RY3MZkwagMPOccSOiSA3UP7GFaVgpr9HLYFem5XIUz4kNUIMMxw1JjOMP0tLPgqs2zu31bINJqFVW3r+XokCmV86xw38w+VQ13zxCPzP+skoj5isa8gwyob5KUUMCbW9mqqSfOkd2Wk0YsBkYuDWLFeXKOAjecYfSjaf9m6VdIku6IbDuxDbl3Ybng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MS/Cx1HGxHLxjvIMFseXh2NGUP9wZmVjkrFIIbCuGM=;
 b=RUNiiuIFtuYkOjml1Z2eZfgnY82F+DHfipiWGjpwfdeucJk8H4FyEydiW9TfbotWXGVEfrTxtXrkqVkjfbWvXvvahvHF4ZNVNWG44pjdacctEFGXiMBUako1/EoZzXTX5+/WTr882XwxDIKYEQ3Tqc7U00qm7Lu95tgkE+3SN/RY2pIaih7zpgn5QWZ/F6Yk02BJgddEN7j5aYOcI4KMaHm6DjXUmWHk05grP1QW0cW4GIVVZ5tPlxBP4rZN9xlxBwOvqRpZWIrzqcUInilTORuoN0q1KMqSS+QCPvVGgSXh00kYmcxjxFT3TiY0OM0go41FqH6Epn+CbMURP4S+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MS/Cx1HGxHLxjvIMFseXh2NGUP9wZmVjkrFIIbCuGM=;
 b=agFoKctEeeJ9EwDR8bG3F5mzLKOLLH87nxZZ/4U9xIr6bTy2kdmksZRwJpVXiKaLzByCcd3wosveDoI445YtVkj3iYif98idw0WGH8ff6WzT+TsEWnkWw/wb1Gu7YpOuubU2a3Ceaq/Qvcp/NERTRzgM9nYlwHpjIe+3svzR6b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 20:59:46 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e%8]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 20:59:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH 2/3] block/copy-before-write: add on-cbw-error open parameter
Date: Tue,  1 Mar 2022 21:59:28 +0100
Message-Id: <20220301205929.2006041-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
References: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f96008ec-b99a-4604-60f2-08d9fbc66a7d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3710:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB37107554415DEB99F5211A5CC1029@VI1PR08MB3710.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HMhPK9ZLqJjerYEaItwE4sX1PmaO5ul47cJ2muD5R9Qj8jFyxIsywTRTJn07ZTnT3A9yVee3iVIL9qJCOhHZUUIV67h8gmiUwdfi0ouFXWmR2FqR1KNnaFrwpP57VahC49MwQEiKOjCZ2+I5+lsR038ZQtEJjOZ8LeuyvCwWHg62ONKc3vpL79XZ3VDK2e5jl/09tuQjjEUOe8whj3xlNSy28F6ZJjVQiEBjgKikgg4bLp8aXsPeeR4bmYmGtYLJ68/d1lLneuGXn4Vbh9IlT/lUdBLZmoxbacAy4uSkBdwu8jO196HSv4gP3nsUN1krRMUZrmd9reBZxR3lhmz7B/lbs6T1k5Zce4qCAN4KQtMoFAg8M3A6XdtLB70Xii4phNvoV1sgZM+yi159/Em9pGNY1DM4Xum3C7RRcFNaL1jndzoJIvzuENLVy3zf3pB06Dx7mgjkOWjrhb2YIVuCdKsh+14NjFcUObtWDIXai7qPXZC2WZD1h5wfzfPyuK7lp0+GAvb/5y60tDPTFzOF237Vl8oY+Lrb3LRETtGkBDrkMURfMMVkKETfMNSmXIi9FDkMPx9jt6aoSZryr3HsnjR+fg/cdjN5QXHWjy+uQ/3qHzdojYwv4eY11J1BroHwBJRuH0Cz/+aVvpmr42IOwZHMgM+hJh/t9T9wF25+RiE07+6FPZCjW+VKGFXEBQ1TXRQkRuz2F85EDMj4iKs3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(1076003)(186003)(2616005)(83380400001)(6512007)(5660300002)(8936002)(6486002)(508600001)(4326008)(2906002)(52116002)(6506007)(6666004)(66476007)(8676002)(66556008)(66946007)(316002)(6916009)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bh+ERQa+cwfz8d706CkLJaZKc7mEn/gMHkTg3Yp2BQyp8YVpotnLgc1VVOWP?=
 =?us-ascii?Q?MyEQhnoYS81M3uFHkzrx9P4y48C3UHfsLHPRWZRjGNuJwKxrb/1EjihxwaWc?=
 =?us-ascii?Q?IPhzY5KymLjVsYk9CKaNW8Jl+qq13ocMRByGg+Cpu2Hro7DgOODPIsHjxKzN?=
 =?us-ascii?Q?EWJEtzeOUQuB0oXibz7J2ux1l5+MJXla0yljZXL0Nb7AGo0Okcolk1NaUGc/?=
 =?us-ascii?Q?i95yFUf8Jp4HqwspuHBuooXMAMtsyE3G6Enj6ifsnufSMLGsuvnE0CCuJ28X?=
 =?us-ascii?Q?ADZlFx+PuxaJJ71QBkq/3ituwiR4whPDwnMjG/ssiWcu3OmdGz2xCO9mCVr6?=
 =?us-ascii?Q?6fiVAjxLX4nKGUd+nnAcvpanv6KMaW3l0hO5DA/MTlqgBw8rL8pvsKvZlUnZ?=
 =?us-ascii?Q?TWahXBGF5O7/SZvBuC+Ib60Lzf3l79l2UYBhLvDkButT7l/lMQ2hQyyt2O+7?=
 =?us-ascii?Q?/kAlG/GxBwj0IC2YUxHvsM5d0h1WB6kuRhBgNCrxVZb/CSUZzmTICUc9/z3/?=
 =?us-ascii?Q?8KlxjOEvRpKHPxWI5rQNAsOE+4KquO+fzDV3o/OaOGXL7zkecJOCfi2O9/3b?=
 =?us-ascii?Q?G/DArdxcMmdSJyZQCjUBTqCfg47yRDg07uUmH4eEwgYNCfO9D8mz28rG+qhZ?=
 =?us-ascii?Q?qfGfmiYYM5IXfedmQgs2uPLKJkHxUpE9TOTUM8s/G9ZZhZRcPsxoLeb5N66a?=
 =?us-ascii?Q?f9ncTwLAFWJgxyF5alF5SS4xnscLcq0ziVHrF3Xf2sCKg9kGJ1EfsJtFngX5?=
 =?us-ascii?Q?Dl93GfuKNY0zzPq2eISsIpBT8Uiq8frdZsObDCrhjGD60qHb67rZcSmYji1B?=
 =?us-ascii?Q?EplDqCbbsGw03Eiz073pCmuVEmAm8mfmWxYIDfOyOZkV0ptpRtEkAb/eUrDV?=
 =?us-ascii?Q?ELY3Kt3Q6+fU4xEcvzDH563+ZpvWwtLRZoOE20xVmpPVHHtukxyMF7eWoXnJ?=
 =?us-ascii?Q?Gs4k1WvWzJKaT2cg+mFHqjhbNz9f1j68c2TcuytewuvKg41GSE+7teGfrKF5?=
 =?us-ascii?Q?Jg4jpVrdFLGzol8H9OF4Yi2apSUMRYyKc1YY+2i3dT685gdPpYhuJ6toO/Aj?=
 =?us-ascii?Q?KvR1ZQzIHFG3iuo8vzAWvCglOteZ8qJZhqNNx8RwXCEgLEOzfScBz3qimuWm?=
 =?us-ascii?Q?Tkfl5UcyWlWrnw6oS0cR+4X8QnaHf7uFQrUetSPBAcF9kLgDwobhkldooim6?=
 =?us-ascii?Q?uchR4eqYR3uoBeIa8WUKDbPjaYXrQ0tvr2lgrUczQTqA4f1zqy8A0l4pj1zr?=
 =?us-ascii?Q?KKHnH+ZEoHUiIX8QE01+Jenp9NWFkksK0J/I90pYlAeG8EQNogbFpWsW/oqA?=
 =?us-ascii?Q?2er7tghnsU7QqZ+yY5EMCf+PvZgWoPrlICnlGJKMVacvtXPvtjaFaRBcXSix?=
 =?us-ascii?Q?t1B9L0boTvdatmxg+2oz4mBjYcrffUBgqR76Dwkr8IR4X8EN3BeyjbQ287dM?=
 =?us-ascii?Q?r19uKaAZhXvMxo8YtC8doKDexnnNoMwSC20Nc4s97+g+uERTuGmuPG+13noM?=
 =?us-ascii?Q?8lqfui4ozFXAm/ytVExc5FGOihj0Y2djfXPYJOHnAWr66hPLIKwXBHKrqXPx?=
 =?us-ascii?Q?bsgVcJeP/lW1k+H3KbvI6g0T717VvSRk8ASkEQew5jWr1gcz1VctY0BEL2U7?=
 =?us-ascii?Q?pTrsq90cSWdKZUUiuKRgbPA7VJ1Zkufb6zPRZ5bafpOvq3G4eDIUFzxe4gQ9?=
 =?us-ascii?Q?ulb+Y6VJCyrXqj9ULwpsP59AH1U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96008ec-b99a-4604-60f2-08d9fbc66a7d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 20:59:46.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJye9i7Ia5LVidd5+WM4zz2EIuHWBErewGC7HYVYhen22B+pUJKRKMUO/SskWZdLNSryowboFy08Ztx1SlKb3vTVXJ0uM4gUupb3LxlGkiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Currently, behavior on copy-before-write operation failure is simple:
report error to the guest.

Let's implement alternative behavior: break the whole copy-before-write
process (and corresponding backup job or NBD client) but keep guest
working. It's needed if we consider guest stability as more important.

The realisation is simple: on copy-before-write failure we immediately
continue guest write operation and set s->snapshot_ret variable which
will lead to all further and in-flight snapshot-API requests failure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 27 ++++++++++++++++++-
 block/copy-before-write.c | 57 +++++++++++++++++++++++++++++++++------
 2 files changed, 75 insertions(+), 9 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index f13b5ff942..e5206272aa 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4159,6 +4159,27 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @OnCbwError:
+#
+# An enumeration of possible behaviors for copy-before-write operation
+# failures.
+#
+# @break-guest-write: report the error to the guest. This way the state
+#                     of copy-before-write process is kept OK and
+#                     copy-before-write filter continues to work normally.
+#
+# @break-snapshot: continue guest write. Since this, the snapshot state
+#                  provided by copy-before-write filter becomes broken.
+#                  So, all in-flight and all further snapshot-access
+#                  operations (through snapshot-access block driver)
+#                  will fail.
+#
+# Since: 7.0
+##
+{ 'enum': 'OnCbwError',
+  'data': [ 'break-guest-write', 'break-snapshot' ] }
+
 ##
 # @BlockdevOptionsCbw:
 #
@@ -4180,11 +4201,15 @@
 #          modifications (or removing) of specified bitmap doesn't
 #          influence the filter. (Since 7.0)
 #
+# @on-cbw-error: Behavior on failure of copy-before-write operation.
+#                Default is @break-guest-write. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
+            '*on-cbw-error': 'OnCbwError' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 56aa7577c3..e89cc9799c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -41,6 +41,7 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+    OnCbwError on_cbw_error;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
      * node. These areas must not be rewritten by guest.
      */
     BlockReqList frozen_read_reqs;
+
+    /*
+     * @snapshot_error is normally zero. But on first copy-before-write failure
+     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
+     * value of this error (<0). After that all in-flight and further
+     * snaoshot-API requests will fail with that error.
+     */
+    int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -99,11 +108,25 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     ret = block_copy(s->bcs, off, end - off, true);
-    if (ret < 0) {
+    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
+        if (ret < 0) {
+            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
+            if (!s->snapshot_error) {
+                s->snapshot_error = ret;
+            }
+            /*
+             * No need to wait for s->frozen_read_reqs: they will fail anyway,
+             * as s->snapshot_error is set.
+             *
+             * We return 0, as error is handled. Guest operation should be
+             * continued.
+             */
+            return 0;
+        }
         bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
         reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
     }
@@ -176,6 +199,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
 
     QEMU_LOCK_GUARD(&s->lock);
 
+    if (s->snapshot_error) {
+        g_free(req);
+        return NULL;
+    }
+
     if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
         g_free(req);
         return NULL;
@@ -198,19 +226,26 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static int cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
     if (req->offset == -1 && req->bytes == -1) {
         g_free(req);
-        return;
+        /*
+         * No real need to read snapshot_error under mutex here: we are actually
+         * safe to ignore it and return 0, as this request was to s->target, and
+         * can't be influenced by guest write. But if we can new read negative
+         * s->snapshot_error let's return it, so that backup failed earlier.
+         */
+        return s->snapshot_error;
     }
 
     QEMU_LOCK_GUARD(&s->lock);
 
     reqlist_remove_req(req);
     g_free(req);
+    return s->snapshot_error;
 }
 
 static coroutine_fn int
@@ -219,7 +254,7 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
 {
     BlockReq *req;
     BdrvChild *file;
-    int ret;
+    int ret, ret2;
 
     /* TODO: upgrade to async loop using AioTask */
     while (bytes) {
@@ -232,10 +267,13 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
 
         ret = bdrv_co_preadv_part(file, offset, cur_bytes,
                                   qiov, qiov_offset, 0);
-        cbw_snapshot_read_unlock(bs, req);
+        ret2 = cbw_snapshot_read_unlock(bs, req);
         if (ret < 0) {
             return ret;
         }
+        if (ret2 < 0) {
+            return ret2;
+        }
 
         bytes -= cur_bytes;
         offset += cur_bytes;
@@ -253,7 +291,7 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req;
-    int ret;
+    int ret, ret2;
     int64_t cur_bytes;
     BdrvChild *child;
 
@@ -273,9 +311,9 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
         assert(ret & BDRV_BLOCK_ALLOCATED);
     }
 
-    cbw_snapshot_read_unlock(bs, req);
+    ret2 = cbw_snapshot_read_unlock(bs, req);
 
-    return ret;
+    return ret < 0 ? ret : ret2;
 }
 
 static int coroutine_fn cbw_co_pdiscard_snapshot(BlockDriverState *bs,
@@ -366,6 +404,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
      * object for original options.
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
+    qdict_del(options, "on-cbw-error");
 
 out:
     visit_free(v);
@@ -407,6 +446,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             return -EINVAL;
         }
     }
+    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
+            ON_CBW_ERROR_BREAK_GUEST_WRITE;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.31.1


