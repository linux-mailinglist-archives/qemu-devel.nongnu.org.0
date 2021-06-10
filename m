Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E93A2919
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:13:43 +0200 (CEST)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHh0-0006pc-1e
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcZ-0005Rw-Ro; Thu, 10 Jun 2021 06:09:08 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:61171 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcW-00056j-T8; Thu, 10 Jun 2021 06:09:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzmuXHFeGvGTsLhXu6HaN7vFfXP4F+Etaj5LOz7D5vJIS5Gu7ZDSizSzTHtiVeOCr7hogJQ6ENoMidN6AwQgHjb75sRZgvA/SjT9ZNWEszBG2jtRD0LlJNbiXqMIyfV2Izae3jhkIKwOK/mhvAN9jYie417pfUF2YHf6ckTcYXyVfx013i2PRfafjKfHDao6e1V3W/tutkBONhoigKS9e5moGWNkgxwLFDAJEV42f+yfJzxohvs1l05X600O8sgkvOxFzwoRdTFb5ADFgzHPKjWqjRNKS1KS1P8Ej2xpa9+v1/uCodJxbrlZ/iaXeCWq+ZxqeUKhRl5zv/+B5G5huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pztZqVMD2QUFf7oIRrvMye00IO7L6FChelccjNwPYJs=;
 b=kxEgRc1PA1PVxCu6+s/p/2kBJchvtMnCGI5Ec/UXRaHlxwL9oQezM4D9FdqpuXO3eoh6PBFTyVdU/CUrwf5uGFIwh9ZgBpeps0JGiwseFd64vg3d36GUnlm+LGvrgY3Hsl86a9Qh1HhvV8oNJEpdKkujmp0eFgzDuJGC9hagxFF6l9ZWI8xQ7ahb14gHrkrw4ksWtHc1qDwmglBRweXRQVvvmkqgLM6w+TmjIsOJ5EU51pUjInu7ly+g+uurWxQ+B22LGW0zv9IsVQWaD8rmCRmJpUuXlHx4+zZ6f86js+uqIaaxk81KpG6iediR/lwrnHQYW+9lrkwqf8461WQsAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pztZqVMD2QUFf7oIRrvMye00IO7L6FChelccjNwPYJs=;
 b=s9YmEZCFnkMLzRWnL8hwuosNeUKDYMNkWutqjwQUMTxwpAQo94Aa3QZu7NdPrHth3bIEaPtQdvc4pdV8/aLGRPF3ND56f9xSJsezMk8FmcaKACAleLcl3uQ0DIeA+zd4bZAiyqXfJj+qR5n0KU9TRurkzF72jas7IE3V/WrjOAU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 10/32] block/nbd: simplify waking of
 nbd_co_establish_connection()
Date: Thu, 10 Jun 2021 13:07:40 +0300
Message-Id: <20210610100802.5888-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd6893ab-5202-411c-4d0e-08d92bf7c252
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65024C4CB407ABA4A2E26D5FC1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:181;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUALQ8/3CeRe+mn5RQcGnwqCRWjTViYqmUpMjQs4A2yXBRmIjUEQYlXrwqry2+5afMvEmgXzvXERfugtewalzD9Yqzc4JErbS6/onAWVUYL8n8CUnMRXtJnkzGV3vGorww4hXQEPr46ffmFqBASog8jtZ2NmPPvlX3+FMe8AW//9flIWHZUhBm7DWzkEgYvJxvC9lBoG5yc/ylALztnPv0tpQb62jqVXopznrBydB+QYEDlwCqOx22eDi5bYK0pPexSfGe84U7Kl7F0ZY8aR40jfzN9R2iwcTbGe5osmpbCglVifGb9ISy1xOE6leRtgKFkopfMEon54Np6PAf8gzue1B4E8u8fyzfSo+VGaCVTuMuEM5wrDuVVpyvItc9FSwgkq+Guh9trIENIxlJJGfx57zDQka0wF5ZqxvQw1Mtxtt7C3wWGF8pqB/l+5UQIAVzegryD3phqudmzAToHxac6D4j2tB+cEP4/OrEssLawzf1luMBAWlbQYpl+3USKzNzTL9kjqpX+qWl3aUc0dMFZDtjBH4D+Kd5IhT+RFWVPVW+9hH7oK78+UbwI/kbhNW3GlfKBWQjw0w86ipGFfhGakWLLMXyjU/LSsz6ckIC1iCHph9g1RhO7d3sA07R/RiecY3bESN5MPKGBhHCOPu3cvXd/8ABn43BMrv320uaHOlZ4d1vSi/KbdO0vJ1Xu2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uQiA9lleRXNvbf9PNboJ/KVIRJXOZRVLWWQi46O9WYeyjFIzO1glvJmqm/CO?=
 =?us-ascii?Q?6c5F7hQhVtyIeNZL0K26UNwJmFx+qdZOebCdu7HBEvyiCkthhy3fMKNeLHVM?=
 =?us-ascii?Q?f6ge5GL6+8dK4hswdTUwAEmO5Fk6qp+X6xxIjxrr7yEcB2RFfUY9n2LxYjHz?=
 =?us-ascii?Q?HMoMQpjXj33fBSUDuuQmoSawNQG2bBhY1fZLilwm0tbXjIdUHNXCdmaK0i+7?=
 =?us-ascii?Q?siqLbCE2/gGec+0+xiu0TZ2XTSHpRSpjw/WJDE8NV+mCRM/neqLFAuSi/MhT?=
 =?us-ascii?Q?1PA9SzY3vIInGVTEv6/7PxWs5X8VqjKV4mzjPqve14uo38OVvpI7ooeyvDNq?=
 =?us-ascii?Q?w7j0NIt2wNRjYt1ZkGfbMuXUTduw40x2+KQOWafZv1kLTmhvacq3rVIz+ghr?=
 =?us-ascii?Q?VuMqnKi3J9/s5xnfwXRPDoxBRX0+FDhEW5z2WJPYlFp+FotAiEJOjkGiYCjG?=
 =?us-ascii?Q?FLOCtGJB4N8tABuHngcfE6Tz5tOfiug1tGXFPCzWQVpKZXwahSzbMTwjch5H?=
 =?us-ascii?Q?YPo58Q75IjUDfkCuiEpo7kcX9+gHpNBf0hQmNeV3hSbg1KwQeYcVjH2+xwpY?=
 =?us-ascii?Q?0hS/JsgLpfkpwOyR7SS58Jx01alh+3+26ej463bIuLB3FBmSLqTN/O6+T4Qi?=
 =?us-ascii?Q?2zKiPXXuNCyOOg8oObkEteFI7uHCty7LDC/boiNx4fJFJy8XqaA/XEsx3JBm?=
 =?us-ascii?Q?cEYzYC0m/LbbboETLtw7r9dIg+mIgyxXdkpBRd00ipYhGFX+cEb/UwACpo2d?=
 =?us-ascii?Q?dk70h4Kgbd/3af+M7IXHU0qgT/ZtJgEHLs/TjqCqIoSgIK8StQeZ3Tw4wxBk?=
 =?us-ascii?Q?5O69ASodKL7MOPfMeuy4Z5gtzJiqm1NCLeBwLImvHpMTpZM3jemTJVt7mkkc?=
 =?us-ascii?Q?HudiIV9pI4BXjzewS/d07TpR+sDBmDhqAjo5WwpBnYIDx3CzZbwRsvTRs+xR?=
 =?us-ascii?Q?LkQ0m1Mjej6sFfRrrdyxMVO0fXehCZj/fverKvVrmPxJMjaLo3LADdRCtZJm?=
 =?us-ascii?Q?OHhlr9fvXcGcvszg5wV27th1cH53kBMOHqQlNLFH2PtuAI/fq7JPtHOnRAoI?=
 =?us-ascii?Q?0bTZNTiVaosYfUlYQ3xz+wBCxmyPA720zOKZYkDQ19AgqjpM9tVPlE1xiDa9?=
 =?us-ascii?Q?ociLh+rel5TEiN79fx3UA0e0OH1XMO6LDAC1sTNYsDBmP8gj8c7YmCvd8Yxa?=
 =?us-ascii?Q?ETuU5Cj+t3E4IwrObFZmjzX1sDNVVX2Bs+ZrFhaHPoDP0DaNe2/GdfKdzKtn?=
 =?us-ascii?Q?GBnUQ6oZ+5NbL3Zcuq4RcyViAvUlci6vuQjJG8ACUhnMXxFn5YxdU5qK405L?=
 =?us-ascii?Q?L6+srEt0VXEqoYuHeMsFBgaz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6893ab-5202-411c-4d0e-08d92bf7c252
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:56.8249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ge4lCQ+E6lerz43yf6xOx36HsUI822f5RdaC1uET6exvCK00JdOBG1Tkg81CBAQQc1Yoo8GMVeWyF+XbJ0bFvuzf3P8c70j/cP9FzywThk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Instead of managing connect_bh, bh_ctx, and wait_connect fields, we
can use a single link to the waiting coroutine with proper mutex
protection.

So new logic is:

nbd_co_establish_connection() sets wait_co under the mutex, releases
the mutex, then yield()s.  Note that wait_co may be scheduled by the
thread immediately after unlocking the mutex.  Still, the main thread
(or iothread) will not reach the code for entering the coroutine until
the yield(), so we are safe.

connect_thread_func() and nbd_co_establish_connection_cancel() do
the following to handle wait_co:

Under the mutex, if thr->wait_co is not NULL, make it NULL and
schedule it. This way, we avoid scheduling the coroutine twice.

Still scheduling is a bit different:

In connect_thread_func() we can just call aio_co_wake under mutex,
after commit
   [async: the main AioContext is only "current" if under the BQL]
we are sure that aio_co_wake() will not try to acquire the aio context
and do qemu_aio_coroutine_enter() but simply schedule the coroutine by
aio_co_schedule().

nbd_co_establish_connection_cancel() will be called from non-coroutine
context in further patch and will be able to go through
qemu_aio_coroutine_enter() path of aio_co_wake(). So keep current
behavior of waking the coroutine after the critical section.

Also, this commit reduces the dependence of
nbd_co_establish_connection() on the internals of bs (we now use a
generic pointer to the coroutine, instead of direct use of
s->connection_co).  This is a step towards splitting the connection
API out of nbd.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 55 +++++++++++++++--------------------------------------
 1 file changed, 15 insertions(+), 40 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index fdfb1ff7a1..653af62940 100644
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
@@ -101,10 +95,15 @@ typedef struct NBDConnectThread {
     QIOChannelSocket *sioc;
     Error *err;
 
-    /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
+    /* All further fields are protected by mutex */
     NBDConnectThreadState state; /* current state of the thread */
-    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
+
+    /*
+     * wait_co: if non-NULL, which coroutine to wake in
+     * nbd_co_establish_connection() after yield()
+     */
+    Coroutine *wait_co;
 } NBDConnectThread;
 
 typedef struct BDRVNBDState {
@@ -138,7 +137,6 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    bool wait_connect;
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
@@ -370,15 +368,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
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
@@ -386,8 +375,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
-        .bh_func = connect_bh,
-        .bh_opaque = s,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
@@ -427,11 +414,9 @@ static void *connect_thread_func(void *opaque)
     switch (thr->state) {
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
-
-            /* play safe, don't reuse bh_ctx on further connection attempts */
-            thr->bh_ctx = NULL;
+        if (thr->wait_co) {
+            aio_co_wake(thr->wait_co);
+            thr->wait_co = NULL;
         }
         break;
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -485,20 +470,14 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
@@ -553,23 +532,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool wake = false;
+    Coroutine *wait_co = NULL;
 
     qemu_mutex_lock(&thr->mutex);
 
     if (thr->state == CONNECT_THREAD_RUNNING) {
         /* We can cancel only in running state, when bh is not yet scheduled */
-        thr->bh_ctx = NULL;
-        if (s->wait_connect) {
-            s->wait_connect = false;
-            wake = true;
-        }
+        wait_co = g_steal_pointer(&thr->wait_co);
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    if (wake) {
-        aio_co_wake(s->connection_co);
+    if (wait_co) {
+        aio_co_wake(wait_co);
     }
 }
 
-- 
2.29.2


