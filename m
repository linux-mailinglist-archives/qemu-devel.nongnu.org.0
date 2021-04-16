Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80230361B32
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:14:58 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJcv-0006ff-It
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXr-0001DQ-QJ; Fri, 16 Apr 2021 04:09:43 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:56453 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXp-0007yQ-JD; Fri, 16 Apr 2021 04:09:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MegP/niqeO4Aihk5Cfmgf9FvHFF3VY/gqLft6fNdyX5lpf9OnNsk3kaXBNniP9WjQYlz3XDffwJvCfgsGz2U2F0lywheeobsU0gn8j5c8+JSEkaxAEOYkUeD16Ld2iOGqEnYcddgD5qG/apCTjtkwutozw/iRdGPqGxxqURlg9yXG/NMcoR438mYkTqEVM4ZiLCmQnh0PMgQx4Y+tInJMQI/dmYNReTTq93xt7iAS9pJIy0RR5NAprrmyY7gxRE2ptsKjo6u2P4qzPaw1Gtvh4KmjoXSITIjjsG/QDh1jcO9f0RldDUgrLG4BPkL32zBk99lpNLIjHEMsRZBc7wMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf69RTA15HpCY2rwgaFIBvDkjazq7pv3eLSBZ43/J9g=;
 b=cYSyc0fXbOQMBjzFOjiTlU849CnwQb2cdujxBMD9R9i+iaxWdBZ2iI9MTXu4acXJdu9kjAe3QXRku/E2LNr23Ha+3ZubcgCl2HGDWyZqwaSdXPabVt5tDy44pRPaTT4enVV+J4GbvEurtaAdFj89uCYOYnTF0nEhyLj0gWXn6v1u/PRMs9oJTS/sZTOT+cHFoKtmYfg8bNkHjW7hO7Fk5t7SvZjuHOqiuDKAb2RokJQpKJQmVxT9HZxPxjqn6qMSsqUb9R5YejRlZfFt2/FjYYSTSmd28lXJlU/MsQZDh1XndUn+XBbrnHfg8paNWZngtHSdqGrez+WWUNGwFB2aJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf69RTA15HpCY2rwgaFIBvDkjazq7pv3eLSBZ43/J9g=;
 b=RkJTVZCh+x5yHC57tXhEEI95ow/5xC8F/UKxnqFC8vH0IdIbIuw0A0mxYoo0ux7qwQTGixKD8G5UXczPaTNCdxgvCjNkrU74OLAHgxTHPbM+n83tWa3hmg/XZQfs6jp8YpLU22jQHeJjyOCgMiGq3BOAXlo/oYcyPzYURk356JQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 07/33] block/nbd: simplify waking of
 nbd_co_establish_connection()
Date: Fri, 16 Apr 2021 11:08:45 +0300
Message-Id: <20210416080911.83197-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4926b3ce-1cc0-4ec8-e448-08d900aef958
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717F7FA784B242DDA49BEE9C14C9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hHdou2Yh13vUkenfWc0nVNFfxcVbdTPYP4hJ/9DRjjxQAvVwM9eYr5SEgHoj+Mpi6jfjySiQge3YOfqjKGZiBzzJb+rekIwpMr2LukjAHFyD331PyYi6HSS+ikKnibaTM1MRPqDs2XJZ2WvzKgIe5BvVNIGz1Mi+iM68Uk1f3/wFoyAz/wTsR7Kbsr/RlsKGvojuXZTdan5KHgPcxMVNXmTz2ZeaNYpvdONnTgUCCpryIi0Wkud0DTihSjAbMyTey6BYXcXjS5FPqK0/9EIkLsEZtR4pPnRyOybnCHzZWDjQvcGfhYPEzY+xVxRmj5JuQBgSAfh9rPaAkKHT0XMfetHnR0ChPusbM5aJdHmFqs02+pLMnf8lp6ZGu1SYzPKDCf0kTZNI8GltZL4HR6Y7u+23bG9OgS55bVFkL068E2wuvE3P4K8RD0palSxvrao+APvytdDzcADf2uqkR/98w9PVmuOvkHiq52H3tVcj0mEiI8SvPl6lyZzQDmk9TjT2nGmTx/2PvbvlBYsuKoVdAiSilxcg4YSizbUZGwpypUnK+2ggtlDN09EiqQjhiiDRZgWc9+gmChz09eQCC/dEcC0nmncUZITaXafIih1NDhVVHNWaUEyqtep/GceO4Fz2wqydTv2ybYcEiPykHu0uwFNuT8E/GhMr+h9whQVuvmZvpBOF4rSnWpfo066nElF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(66556008)(2616005)(66476007)(186003)(6666004)(66946007)(6916009)(107886003)(2906002)(26005)(6506007)(69590400012)(16526019)(5660300002)(4326008)(52116002)(478600001)(8676002)(8936002)(1076003)(38350700002)(956004)(38100700002)(83380400001)(6486002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EiDUIk0EEYP7p/dQerjsie/UKGiue6UaBfBvdBTfDn3Fs9genyhi51Zrl15g?=
 =?us-ascii?Q?V2CIuXynh0CFS38xNPwwCYI5NFoGMiIMZ63UJRkDOgACFAPeApmXarq+12CT?=
 =?us-ascii?Q?FbjAgWHJXOohZ7JVhSq5TsiY0CCNNdN+dUcxoDLh6imN5/ETnK1pV2jA7QE9?=
 =?us-ascii?Q?D/ZeUNOCNszCaJDl2TzixlWrS2J0LJLZ+N3AvVbEbA3v7bk6VBv3lq/FDXYu?=
 =?us-ascii?Q?k0iof7Ga2S8s9aTPrMFS8A4tO2TUTMefeQL+gyF9OWECbXVCoDOhEFfcDI3o?=
 =?us-ascii?Q?YMRuqrjjfgANVqFlaL3kkHFu6E5Epxz9/aJdck+kSqy458rB5cq1bseZUXh8?=
 =?us-ascii?Q?0omqWxFWhWF9qotsMLCQbmu9cUNkQy8HYlHK96HKqOwchBD5JZNUOrL3aZls?=
 =?us-ascii?Q?VYjrYcmdExgxoZzFbK/NmUKVvqfE+qA19b3uhs5IV5Q2EKwG+V+kmjPT+Dlw?=
 =?us-ascii?Q?ITSP3j+miARyUv1VMp2+twbG8mAs5hDvmhYYdVL2CVr2RqHteMT7Lo6pQ6+k?=
 =?us-ascii?Q?H6Fqy2w9DH2qkaGZUd+NvzT1Qj0TkPm5adFgBEKtaXzBHlwtGNNnSoauzptV?=
 =?us-ascii?Q?Dl6RunwDp6poYMkZo4Fh1X7V2ehPKIsKrH7gV+x8mlNWwQ2hE9JKTk6ZrcCC?=
 =?us-ascii?Q?jh6kBF9037DJS5oAGYm15NRfAtV6dow66ZuzprI0DPAk/zRJnRQ8kDvJFZuQ?=
 =?us-ascii?Q?0Zf/Gd1FihfYTfAcfe5uQc0dXrXjuNE5g0zyh782xL1p969a15cRuUlGgWHR?=
 =?us-ascii?Q?giA1qt+/+J7MKZJST+DJERflAJnhq6mTsfWVYapxtsINTm0gMgCN4HQGNpkx?=
 =?us-ascii?Q?QVfILvGfWOIpDkBE6tcnj9OG9vEQbXKhrBKNhmp+8Dn9YQ/JLCCMV/ypYAuq?=
 =?us-ascii?Q?NIZpaqK+BgBJMHLI9z6ldc2i5CnhJQctnsQ7pDBVTQuPWH4tXjNswFv+hgIw?=
 =?us-ascii?Q?DURGA7nYi8Iq2fGWGCD2AOAJ/CHMFrroMqT2m4FXWjw4A+1+/lbvn7tEkZ2q?=
 =?us-ascii?Q?NXkS0AiUwF4VTfxlGToSYGL1ctx+L1G5rOHQqNLEvx9goY8dq2UBPuPjG9Sz?=
 =?us-ascii?Q?yRy8zTkNX4eaQtl68aYZ785994oMpLi3ntNQ0ucasEiZ8YSDg5yAnI/bl0TA?=
 =?us-ascii?Q?HrO7OjtzoRey3U6zMafAaFDVr9iJc9CsmzVANGs6kShh7cMA77ikEFEAJUUh?=
 =?us-ascii?Q?em08qIVYs1JN6kdEMN4wa8leiCBPJzWAupde3IDm3iavwRlLRk/pIBqSvDMO?=
 =?us-ascii?Q?HRXe3t9816/sdYwoADmd1tQsudXC8liUSY2mdIgSSfKBSM+ka2UeZHpmx6fS?=
 =?us-ascii?Q?aESDKvEZr8gmEgO9ZT8LoAuy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4926b3ce-1cc0-4ec8-e448-08d900aef958
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:35.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvlGHB7y2thySQglAWeyQnrfCFPzMZcNTZhniWwExmpmk5SH+4ZKXbBWOxJwIkib+MLHZZy9MOcPiFVyKLbShOqOzZnlcKRowStPEiekhFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Instead of connect_bh, bh_ctx and wait_connect fields we can live with
only one link to waiting coroutine, protected by mutex.

So new logic is:

nbd_co_establish_connection() sets wait_co under mutex, release the
mutex and do yield(). Note, that wait_co may be scheduled by thread
immediately after unlocking the mutex. Still, in main thread (or
iothread) we'll not reach the code for entering the coroutine until the
yield() so we are safe.

Both connect_thread_func() and nbd_co_establish_connection_cancel() do
the following to handle wait_co:

Under mutex, if thr->wait_co is not NULL, call aio_co_wake() (which
never tries to acquire aio context since previous commit, so we are
safe to do it under thr->mutex) and set thr->wait_co to NULL.
This way we protect ourselves of scheduling it twice.

Also this commit make nbd_co_establish_connection() less connected to
bs (we have generic pointer to the coroutine, not use s->connection_co
directly). So, we are on the way of splitting connection API out of
nbd.c (which is overcomplicated now).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 49 +++++++++----------------------------------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index d67556c7ee..e1f39eda6c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -87,12 +87,6 @@ typedef enum NBDConnectThreadState {
 typedef struct NBDConnectThread {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
-    /*
-     * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
-     * NULL
-     */
-    QEMUBHFunc *bh_func;
-    void *bh_opaque;
 
     /*
      * Result of last attempt. Valid in FAIL and SUCCESS states.
@@ -101,10 +95,10 @@ typedef struct NBDConnectThread {
     QIOChannelSocket *sioc;
     Error *err;
 
-    /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
+    /* All further fields are protected by mutex */
     NBDConnectThreadState state; /* current state of the thread */
-    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
+    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 } NBDConnectThread;
 
 typedef struct BDRVNBDState {
@@ -138,7 +132,6 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    bool wait_connect;
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
@@ -374,15 +367,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static void connect_bh(void *opaque)
-{
-    BDRVNBDState *state = opaque;
-
-    assert(state->wait_connect);
-    state->wait_connect = false;
-    aio_co_wake(state->connection_co);
-}
-
 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
     s->connect_thread = g_new(NBDConnectThread, 1);
@@ -390,8 +374,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
-        .bh_func = connect_bh,
-        .bh_opaque = s,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
@@ -429,11 +411,9 @@ static void *connect_thread_func(void *opaque)
     switch (thr->state) {
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
-
-            /* play safe, don't reuse bh_ctx on further connection attempts */
-            thr->bh_ctx = NULL;
+        if (thr->wait_co) {
+            aio_co_schedule(NULL, thr->wait_co);
+            thr->wait_co = NULL;
         }
         break;
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -487,20 +467,14 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
         abort();
     }
 
-    thr->bh_ctx = qemu_get_current_aio_context();
+    thr->wait_co = qemu_coroutine_self();
 
     qemu_mutex_unlock(&thr->mutex);
 
-
     /*
      * We are going to wait for connect-thread finish, but
      * nbd_client_co_drain_begin() can interrupt.
-     *
-     * Note that wait_connect variable is not visible for connect-thread. It
-     * doesn't need mutex protection, it used only inside home aio context of
-     * bs.
      */
-    s->wait_connect = true;
     qemu_coroutine_yield();
 
     qemu_mutex_lock(&thr->mutex);
@@ -555,24 +529,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool wake = false;
 
     qemu_mutex_lock(&thr->mutex);
 
     if (thr->state == CONNECT_THREAD_RUNNING) {
         /* We can cancel only in running state, when bh is not yet scheduled */
-        thr->bh_ctx = NULL;
-        if (s->wait_connect) {
-            s->wait_connect = false;
-            wake = true;
+        if (thr->wait_co) {
+            aio_co_schedule(NULL, thr->wait_co);
+            thr->wait_co = NULL;
         }
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    if (wake) {
-        aio_co_wake(s->connection_co);
-    }
 }
 
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
-- 
2.29.2


