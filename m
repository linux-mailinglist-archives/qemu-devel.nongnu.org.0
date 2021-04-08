Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49656358675
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:12:52 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVOt-00013D-Ag
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLW-000544-28; Thu, 08 Apr 2021 10:09:22 -0400
Received: from mail-eopbgr140103.outbound.protection.outlook.com
 ([40.107.14.103]:51570 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVL1-0001b3-98; Thu, 08 Apr 2021 10:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpYB0nNlKad880AgrW0pkVf4gUnTr96pfDizOVg96Mb6pVWAI6uBxui54j3XcEkZw5vkzKv8FipVntGgv2Oh7bcTMJkEqv0Md3gHADn6cKAnhkHXEmwg/Z/3bGUpGhGY4GezE79cqfs7bqJWu9fkLugG859mTP53AAY5wBYSFyoz/Rwx2GcOV+Hr+oSF793KeEX6ApphrhS2TtsLB0Kzl6/OXKaKXZF65BR//2ePlmPPPrfgCQ19hnYUNKu0EXOKqZwYY9kj9lheEwVFe8GaA50sIq+HTwvdHIk5YrmWWQ7VcmOED4hY6JzHolWEzLAuoSNEsOnR91f8Q5sRLte3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MSNekdnhLU/Ph5oyR/fN8+Fn6TYkQnNEUtW48VHjMc=;
 b=KO/Tt54sqxg3hpjlePAGTgHJLQCJdArUQQS/P+ZUeJRaH37YkUOsmaLNZWMbhwDmv05H+m8MtuwLzLRYsnD2s60Ufv64I4k9N93r92rCyynkYAjRH2lsrpug2W1yAjDNNs77d8I3bWbYkbDD5eoBmSwqtTqO4pH9EOBPaf/0P+cHWONT1R2SSgn7k5Qb6z+HLCOnT/CYVDedByDGIA7/Im4etHDVE2A2l51RQTtcHVb9icuTO/yZed2TR1kuuBn+7PYY5ll9apBv1N6tX6v7WT4s0EKImjVxT4jXJ8xFMbgXUiNU0MF5uzZDOKhOGepCfxDDaZxwit+BFkysckZ0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MSNekdnhLU/Ph5oyR/fN8+Fn6TYkQnNEUtW48VHjMc=;
 b=iIUxGBHfBYnFCp1hxB2rKTuW+QDN6WDXxmXs5ONGtcpK5hIj+O3HZzl8SpHl90Cq8sILqxvpwbzZZyWL/PR8B6SIiXKOQKLLQ8X0DYWhMo9JB5IcwDYwpNTNf7K2YcJ2Sc/OcKOY0pAn2ABvdHo8220ueHXA4y9OsMgeLAl8tOg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 14:08:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 04/10] block/nbd: simplify waking of
 nbd_co_establish_connection()
Date: Thu,  8 Apr 2021 17:08:21 +0300
Message-Id: <20210408140827.332915-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e73e5974-22f7-48ac-61f5-08d8fa97d41b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171348AA03741758D1514F97C1749@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Um4L0AU1i4YwYmBjktsoNvLU9n/N38GWCrFA6dEVCvjVQl9V5PYYeZfzfPhSQAbJppUqwSUB7c0X8f1ZvyR9c2ia0+jowpQhofkqggKuchD47a8iGMIqwSsIWC4EPZ6/iWCC3RrlB0hyrfzujZpfar/cMWdCl9zd0yMYh0YNfZSIPzUqWqSRvohO//esYc3WH54lIMntktoabZK/juuy0cj4AZrmdoFBtFUPMw18UIjTRNLU1XWP1ru9QDhWaUTLed+J93Jf2fDYU8anSKCRRSEJmbFjfudum5LhBgAa/EYFGaF0rkH+VakVtAwl38s2g3qAhyteE1HCbnwPm2qRUb8E+K0T5Z/+QJ9VWjaR6LGPktMZdVzHK25n/Aj295lVLk5jMsoENjPPx83q21kl1JBmvn+D7OFKYfv1m/9MTgsLVksDxjNZakAikzzOgTdedFG8V8Jw4sQwn1qa4loQfuH5/3c88Pc93G7x8HDVmX9+BGqAS15Md6KN9X+6QN2t/XWnvTjv1wShn6x4d1rcbv3pUMcbHpz1m6gohBC0HOMlUkAGZHwRiFKtRmxMSnPgyLiYKgSUyeNZ2YaaK+KJHOMSN6bMrWhafNhAV3HQJpITjHjgFYTPP4iOrfdL33buJo+9E8hy70rVhbvdXm+oBH0WS/jHoHPaier6JHV0WzDeKLrmJ+fgN045juZ9Q3X3C7IcztHrBRGPPXOE1cvpvCcXWgkCW/THOnb2jeks2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(86362001)(956004)(26005)(2616005)(69590400012)(8676002)(52116002)(38350700001)(38100700001)(316002)(6486002)(5660300002)(6512007)(83380400001)(36756003)(66556008)(66476007)(6666004)(4326008)(8936002)(6506007)(2906002)(1076003)(478600001)(6916009)(66946007)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?le5D3MNs057NgK8kYUuSAULJIcdkZSrNvRb064nUUs3DAuncTbIFnDjpGP+Q?=
 =?us-ascii?Q?LstyOAb1Xq8yuEO2M7TcpptkJNpMyYeFxNn0Z6cSgpNV+Gap7h2Ln9bdmlSn?=
 =?us-ascii?Q?QFvZLmSVQyIfQTVSJSv2ckk6yPPPHumlSY3KhA1WsQ7ruyYhBMnlNaA2yXkT?=
 =?us-ascii?Q?KjIg/HusJeeDHNdLzo8Etgtp9pu0/4eO++RNYivZ9WS4pUTLZHgpLhrgTuiq?=
 =?us-ascii?Q?VwKRoOr7Kyl1+aqjwth+s+dDoT4wWldJsBk8IBSEMF5LAtBBclnQBvJBuZtz?=
 =?us-ascii?Q?jkN/VtcDP00ivyQr+cgvQGuMPFjB7PzKk9D0NtsbFGY8/gHH+ajHVrn3Hjq+?=
 =?us-ascii?Q?eIDTxYrmHYpjmd4NAJ8cGOVe0OA6h5jYp7DK9dzQj3LBG1bYKkXhPBXnINS7?=
 =?us-ascii?Q?jsoDVrG91VYLTWT1/5lpeXW0LushBeZqOJbw4fq2ua/u1vOOoobokx8YrS7L?=
 =?us-ascii?Q?iTcPqpNUPoEX9aC/6vTWicMMhHQ+67rsRfhqTM9L48DK1bJP2nzPzP0ZSqSJ?=
 =?us-ascii?Q?Z2g0FsYv5yEVJObSIxCyWsQxoXpR4imd0CFPT3D4gTjUfw6WkI43ap/3EVma?=
 =?us-ascii?Q?VrFWC8ReVN86Wd1R7InkB8qeOrX4lbHF9o0499xXZynmS+to49W87ffgFvds?=
 =?us-ascii?Q?3kpaWBEtvCB5Mzv/6wVH8oKIiDmFHMhyxXNwaBTpa+Gd8FK59343ORNg2i+7?=
 =?us-ascii?Q?FAubSQAIZq46q9PyqE5cSy/KHjsIXjv7RIFPWStZUVUZIFAZCfKRjByEPz1O?=
 =?us-ascii?Q?5PSBSe64nWzKeW94WGEGvtnGeHO5Xt9pzEJfEv0TNd5JrLu9I6jfYyXFgsU0?=
 =?us-ascii?Q?DkDdZk0q74OOLmZ1hqpki0JnfnGCAePWHD5+jyqRJhlMFWOaVJeqwWhWGV14?=
 =?us-ascii?Q?rzPitbyIVNFIhgwf6wyddNOFIJUxSKk4wCvIKlbO/BfKUh0sq5rCTSnfB3QZ?=
 =?us-ascii?Q?NVmk6j2DBojh6NSmHH51f7lyb5AHp2Oued0rbl+iFuveWhARu8Jr12r3NSS8?=
 =?us-ascii?Q?8JPtHOmi2XydASopJOuZevR2DWnjHpPUON8TDK43OiJR5TWI9KJ+lkpSOCbY?=
 =?us-ascii?Q?SVFBSRcU9vA22z1lxrcqLon2H4eG7B/7vokZLi8DLXyymileIkVofrNNX50K?=
 =?us-ascii?Q?mYQsKFxCVu901IaRv1c7fUSwPbDe9Y14+f+YEEIjwtb5b3yobzRRTAh3ToHU?=
 =?us-ascii?Q?NCvXzCmRpVqzE7GaD4uP6iphXytKRmSnkvuQ3TvzxCBlsxTEZcvbXbI0uNBp?=
 =?us-ascii?Q?IJ8P5ZV3m0pgPs7eIi0WOnQEaRFdyN1BZBTY49Wxm1neFFI+JDFig6zpRfdE?=
 =?us-ascii?Q?1pVFMTs+KgwlTexzu1YblNkz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73e5974-22f7-48ac-61f5-08d8fa97d41b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:48.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHr2Xe4/RbGqkRvSDHKIgtRgS1NkHHps0KE+ve7RYP18Ec8F3tXudQvby4vb47Tm98qAgLhMZrvs1iX99bGiJfwDEDkbJ9RxqDDlCIYfAQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.14.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index b0bbde741a..4e28982e53 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -81,12 +81,6 @@ typedef enum NBDConnectThreadState {
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
@@ -97,10 +91,10 @@ typedef struct NBDConnectThread {
 
     int refcnt; /* atomic access */
 
-    /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
+    /* All further fields are protected by mutex */
     NBDConnectThreadState state; /* current state of the thread */
-    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
+    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 } NBDConnectThread;
 
 typedef struct BDRVNBDState {
@@ -134,7 +128,6 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    bool wait_connect;
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
@@ -354,15 +347,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
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
@@ -370,8 +354,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
-        .bh_func = connect_bh,
-        .bh_opaque = s,
         .refcnt = 1,
     };
 
@@ -410,11 +392,9 @@ static void *connect_thread_func(void *opaque)
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
     default:
@@ -464,20 +444,14 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
@@ -531,24 +505,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
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
+            aio_co_wake(thr->wait_co);
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


