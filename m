Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779362F8F89
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:57:13 +0100 (CET)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tZI-0000kP-Ej
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQN-0005Er-87; Sat, 16 Jan 2021 16:47:59 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQK-00076Z-SJ; Sat, 16 Jan 2021 16:47:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn9SfAmhLz6s9fdBv+kwPulbNtnOo8q0KD+otEaaqGIfcARMvMb2fahIxVtjERt7FkOTcSRThNugZ17ouJ0XrLczayfBHXFY2KnZl02B/2ZRSE1DbdXHVtx0xg5b5pE393FEQnfgj5d1G53Md2dh4cmy/2RVC5gE8AlgwlzzysxvmG1CB/OilbWewfBeRagFWQurz2Ncm9P7P4ilb0vkpYmbTqTs+PIVqhBywq/cKREN1hitskqG/Slia4p4oi6eUC4pOwdPnKtyhRuB49/OnWXF7s9qpZ+/RoCuE7Pq9I0uhRo1bjUVVbF0LHCTYcwpi+kX/IPhIFgJ575G3lUnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lIrj5DfdUaEPMDrYPQsLF4VDVnG6Ctn6d2VyMs1pp0=;
 b=GavIRBR5yFPlHRyuklk21LdJAObJ5wUqE4H1KKwflzPectNLUiZ2GF/23L/SoamMM4e7Fik+RJvNXNVvjTZdVor/iZYyujIvilxGgoNJvxL8ooU8hVV6PIwVCRoEC0P3NR6NDifcsu8pCEz5CJ+obnbutDdgg1kOrMtjGb4nDudH1J5VqSBZ+AombZOod0DW9DwXcudqr9gvm62obDCYwoKjyTeXeUF6ZOn73g3ai5wtXPwF4OWePvSWDuAWiBgW79uM621cRCYnQKI4cvXTNawxhiiI44iCpeE96LDv6Ts4RjD5LRVEOu/6ku1yFq/dfLk8ZNG0n9YM28XMpvDdWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lIrj5DfdUaEPMDrYPQsLF4VDVnG6Ctn6d2VyMs1pp0=;
 b=XOSkZ2QrU1CYJlRoSMeKjLwykSl01fsNgsZIbef8josZGWwqSJ0ofLXsd78l9mTq90+58vJ6r10iVBU2GhFDEy71ghGSPzJ5ch7bSgUSaaQ9IdT1o1UQfcok8w2GQ3Q+6wcKVIUV3vG+iEzxuH3jjJLQ3JSmoTUCR4VCqLwUPZo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 06/23] block/block-copy: add ratelimit to block-copy
Date: Sun, 17 Jan 2021 00:46:48 +0300
Message-Id: <20210116214705.822267-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef42fb56-2832-4bc2-12d4-08d8ba685cdb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20339C5A066D0474D8068006C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WSjRQlKtTPp1s6lWKF/gziLmaFoooiFAJA4qJogFH4BeCEKunQRJ/6ti7wwyRrIobdHk+dY0b0HPJ59yY4YEkgXyas/FvdkrZ9k+c4/fws7nhXs2cWROjVukhJfCPhsJvx/aOY7Un2fX/A5Oc8cEX3gy2l7reKytgHTaHunPpIoiULHbhtLWByWPVA072FVgl4Kt9odNazWHWsTYG1aLthvKuYOVl/en/Py+1ucteS2HacgcyVGtgw3KxRP0+c61Etp/rto5RUAVHPmnQs7sV4hlZC0QDIGpnum3/NbaX+3aj+FJmKybPl7XbtiPnB6ByghqYo+nawxRkH5y08Tb1IkTlBfukmNXwHlk1wWBvjdLgUxGgd4jH+tKa8esUg4yCOazlO+id7SRPU2BlbDFvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rACnNNP6hKUAAAccjR8HWJgskCjJuocwJOo5Gzs3LXWhtObFJURITWRIMIBd?=
 =?us-ascii?Q?5wm3jCSdd8xJZ1ceJpcezK77b1wSyiNZN64NKGtlXHpKKVFa8/i+1reKYttx?=
 =?us-ascii?Q?Su1pcql8rZ66vzBZEdxq4amDpYnqrGJ6NM0MsbB8iwtuHwD4diFRae0vysHt?=
 =?us-ascii?Q?eoH3UBVl1Rwi4TM6+pQ6q5k+ysHDItG05ZgyC/ZTZ5HRJrknZuUZ3B/casEj?=
 =?us-ascii?Q?YthPYkY5ouPrHo3zdA8x8JXtU8FQKMFB3iqFour+S7DlXHnHiz3Vg08zHZby?=
 =?us-ascii?Q?fY8DJU99q4TNqY/ikNqBpe6eH00vJaHS2/tcgVhRsZM24iLNVFlDfWuVlq1r?=
 =?us-ascii?Q?z3pTSKF+N5jEw+Ft0qq7jpe0BWYTxXL0/G0kHaqyspRUUpHVtsVBUq7wb98e?=
 =?us-ascii?Q?zD5ki5Vk5qx77H+MZ20mYOMXiF0RHhh9vs7C528PyNr8h7NL2CuR7V0vhP4X?=
 =?us-ascii?Q?DupvbaVSILlej3kCQv9Fi0Qqi/qspVqMbbnrEBYfUJOlcE82Uik5ENO5hjjl?=
 =?us-ascii?Q?8KX603hfmcTmrpo+6HyPl5oinxYi9z8liHxQw+/xNr2g1YSqwe7M7rFp+PoB?=
 =?us-ascii?Q?p535JmzdhHE98G4XchmmHzE1jzGl94Vt++XO6U9cPOmUyEqoatjFtJrkYpk4?=
 =?us-ascii?Q?fU9FCgibDy37Rc/WkzJ0U1eYZZLTZe2ekyAlLpIEiNxwjACk/L2Yy/uO37rw?=
 =?us-ascii?Q?twbjkxtVhozQQl3erQFfsvF6hsG3Y0VLY9EPeSpUIIp6ZvUAjFeZjuo0Obl8?=
 =?us-ascii?Q?4oeEkLTjsQSgpUL0DFgA+x9UzGRn2iPXAyHerMNNXYAi9TwsdaQR4NYiZlmS?=
 =?us-ascii?Q?tOT3JTl53LhWIKlr9kreiQDy1UZigixifjR9ao2/RUFngw+QtJw9m004AdFr?=
 =?us-ascii?Q?5dXZRzo1LuOys6WbUU/3jXTaBmiUN+Fgyg/ipr5ssEaD4rIP2ZBvlsvax0jw?=
 =?us-ascii?Q?hmYVx5cbW8UD3ifik10inlpbMJyZitV4LxOT4hvhagKiUIgYIuu/uA0C6r8Z?=
 =?us-ascii?Q?iHG3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef42fb56-2832-4bc2-12d4-08d8ba685cdb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:47.1371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81NYNVn1TI+/C43wrH+ooO4ZthmS5rG/nx0v+DEJnO+dLF4SVqBtJQayQwBD6LYNBhNpFf7IUOXvgUNjcZTsphqSBxkMR5Cutkq5+YoRptI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to directly use one async block-copy operation for backup
job, so we need rate limiter.

We want to maintain current backup behavior: only background copying is
limited and copy-before-write operations only participate in limit
calculation. Therefore we need one rate limiter for block-copy state
and boolean flag for block-copy call state for actual limitation.

Note, that we can't just calculate each chunk in limiter after
successful copying: it will not save us from starting a lot of async
sub-requests which will exceed limit too much. Instead let's use the
following scheme on sub-request creation:
1. If at the moment limit is not exceeded, create the request and
account it immediately.
2. If at the moment limit is already exceeded, drop create sub-request
and handle limit instead (by sleep).
With this approach we'll never exceed the limit more than by one
sub-request (which pretty much matches current backup behavior).

Note also, that if there is in-flight block-copy async call,
block_copy_kick() should be used after set-speed to apply new setup
faster. For that block_copy_kick() published in this patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  5 ++++-
 block/backup-top.c         |  2 +-
 block/backup.c             |  2 +-
 block/block-copy.c         | 46 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 22372aa375..b5a53ad59e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -41,7 +41,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool *error_is_read);
+                            bool ignore_ratelimit, bool *error_is_read);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
@@ -76,6 +76,9 @@ bool block_copy_call_succeeded(BlockCopyCallState *call_state);
 bool block_copy_call_failed(BlockCopyCallState *call_state);
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
 
+void block_copy_set_speed(BlockCopyState *s, uint64_t speed);
+void block_copy_kick(BlockCopyCallState *call_state);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/backup-top.c b/block/backup-top.c
index 789acf6965..779956ddc2 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -61,7 +61,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
 
-    return block_copy(s->bcs, off, end - off, NULL);
+    return block_copy(s->bcs, off, end - off, true, NULL);
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
diff --git a/block/backup.c b/block/backup.c
index 4b07e9115d..09ff5a92ef 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -72,7 +72,7 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
 
     trace_backup_do_cow_enter(job, start, offset, bytes);
 
-    ret = block_copy(job->bcs, start, end - start, error_is_read);
+    ret = block_copy(job->bcs, start, end - start, true, error_is_read);
 
     trace_backup_do_cow_return(job, offset, bytes, ret);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 6bf1735b93..fa27450b14 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -26,6 +26,7 @@
 #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
+#define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -36,6 +37,7 @@ typedef struct BlockCopyCallState {
     int64_t bytes;
     int max_workers;
     int64_t max_chunk;
+    bool ignore_ratelimit;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
 
@@ -48,6 +50,7 @@ typedef struct BlockCopyCallState {
     /* State */
     int ret;
     bool finished;
+    QemuCoSleepState *sleep_state;
 
     /* OUT parameters */
     bool error_is_read;
@@ -111,6 +114,9 @@ typedef struct BlockCopyState {
     void *progress_opaque;
 
     SharedResource *mem;
+
+    uint64_t speed;
+    RateLimit rate_limit;
 } BlockCopyState;
 
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
@@ -623,6 +629,21 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         task->zeroes = ret & BDRV_BLOCK_ZERO;
 
+        if (s->speed) {
+            if (!call_state->ignore_ratelimit) {
+                uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
+                if (ns > 0) {
+                    block_copy_task_end(task, -EAGAIN);
+                    g_free(task);
+                    qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, ns,
+                                              &call_state->sleep_state);
+                    continue;
+                }
+            }
+
+            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
+        }
+
         trace_block_copy_process(s, task->offset);
 
         co_get_from_shres(s->mem, task->bytes);
@@ -661,6 +682,13 @@ out:
     return ret < 0 ? ret : found_dirty;
 }
 
+void block_copy_kick(BlockCopyCallState *call_state)
+{
+    if (call_state->sleep_state) {
+        qemu_co_sleep_wake(call_state->sleep_state);
+    }
+}
+
 /*
  * block_copy_common
  *
@@ -707,12 +735,13 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 }
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool *error_is_read)
+                            bool ignore_ratelimit, bool *error_is_read)
 {
     BlockCopyCallState call_state = {
         .s = s,
         .offset = start,
         .bytes = bytes,
+        .ignore_ratelimit = ignore_ratelimit,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
@@ -798,3 +827,18 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     s->skip_unallocated = skip;
 }
+
+void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
+{
+    s->speed = speed;
+    if (speed > 0) {
+        ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
+    }
+
+    /*
+     * Note: it's good to kick all call states from here, but it should be done
+     * only from a coroutine, to not crash if s->calls list changed while
+     * entering one call. So for now, the only user of this function kicks its
+     * only one call_state by hand.
+     */
+}
-- 
2.29.2


