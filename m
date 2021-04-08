Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427E358679
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:13:36 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVPb-00023N-8V
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLt-0005Td-2A; Thu, 08 Apr 2021 10:09:45 -0400
Received: from mail-eopbgr140118.outbound.protection.outlook.com
 ([40.107.14.118]:48256 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLa-0001dy-QO; Thu, 08 Apr 2021 10:09:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be1dRJ8BpEuz6q4cjx2xKOrHw+uMTm226QC9DHv0ZA4oJFwnSm4mQT73frLdmKwvwTkOz9oScUqePwA4a8Os2SfaUBH+QDHleJOLfPvk6wilKw4rp3UVrwytC+pCVYShfd+HDxIs7M4goMHC/2PRQbIaliEv4aDsHfpE7QSFsoXfahr01WnjJ1v98FMtE1f7CN8g+tF4uVNyG0DsBcPaLpwT5ZSYTKXvhGi1V/OFBlLLb+fklWreneVUjaX809IH6yKB14j8GK6h++Q60iNjC9aBP6dLcKzxLfPX9ibKYTzaa8/lsFuTTepAggl6QQQVAr3c092cBsKXcKU5RVMApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERQn4Ji29EMYJge3a7F+oZJrx3BKw/wWoj5Z74nNQyk=;
 b=llWbqdin1cQx0Nmlrtjp/3tYBX7R7h1V7oQIiEZQ1W7xYA8hjLGi4+Y6vjojG2c5y3YIvI1/bEO0yAfiqS2DcHs+sYiQxQbJHNgZCrezJilfmFiaPRrQ9ZeSixwgu+8Wi5msxCfTNOMWZFkg5f9iFR+zdYAjgy5KtNpztcPakbHHk5LSJhPSGvlPVtn2YglzmWinLu/OG7IargSBdn/xt3KYmXJ8XIsUVaTT7azbpz1OtKqvJEJSQlupT/hqNxpMNgpLX9gO2gN44fc5VFoyvSy6EgAKvDM4X5KBdFPuedHmp/XwjjW1U93Ezjn0oUuPH7uJcZxea5RgzMLUdJZX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERQn4Ji29EMYJge3a7F+oZJrx3BKw/wWoj5Z74nNQyk=;
 b=aVu4U2ybyyvPFuyQkG6pOikUkEV422L+5QCjWs8uitxXBIFsiMWlOrYzwmM771km5wQYOjb0n8yAdlNX/x3pd4HrZApZDp7E9QTqRsG4B9dxHC7+bwIlPZu+5nruu6M09qJaxYhn8i1It9YwVR1v8jNTFbaNFcl64tN8HVKflZ0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 14:08:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 05/10] block/nbd: drop thr->state
Date: Thu,  8 Apr 2021 17:08:22 +0300
Message-Id: <20210408140827.332915-6-vsementsov@virtuozzo.com>
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
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91761c93-43f0-45e8-93ed-08d8fa97d4ec
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713ECE8E7C423C45D35C448C1749@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qS7NKmjaJKPXJfV6j4EQ5wRD3EQBSzNgtyXWBDzEGXKozsQwFaGg3CPRUsVbdfC6gSHoGZyYLizcz8ikUPFHp0dP+xLg+3t5Z1WmUe6QpvoY1/iZgvbo8xralyihVTohT6ZOWAGrrP1ct2LrYiGnYJyNPRNnkJ7NceFuK8nlAVWLNKGdpED/oZjsYVAi4aSLt/cRIVXp+uMuzjnzHzRv5LCNlWKTCdtQqHcbKIjXgE6PKLQbFYktfivgY4tmmN+h1qw73YgIRygeVDMauYJAkBO0irP7QZpB42VcX/toAyvj4E6w32ECVCpbTZO+0e7d6GbA6tBq1wGi20pPyc/9YTdflG9XWFyRhPMUpy7R792SqqWZN/CA1bYt2TZ6TCALGlbAlBHo9t0roXn45IHOiRJ7nzt5NnC5uMbeRMIOuGdNydJNQQMIKVf2o/jWfMcvM8Yjcs75er6/iK+l3MHw3fp2PieM/l2kI1Oe2uLBUJRjoYPpbtORtB/UqKFz6fhUFXPiZmdAJHBDfycHGQHpqGZ3F5tc+rXEfFB02qA1AQDBCIL3C2zM18NbmvL0L00rtqLZT8c21IxtJuF1sacxA7LvcbxPV9hL53ebQOY4Nf8pjGYqzmAhr0QLlbzzE5Uy1EJibCG9whqqAy31y4NYmJ3f716i8LWmX4Ig1UeDM6amMp9ElK0ffdZ1s/G/Yw+GUBmqhN3HWuw1sQF7Uqvmylnu+m0FraCCYJo3Pd/LiNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(86362001)(956004)(26005)(2616005)(69590400012)(8676002)(52116002)(38350700001)(38100700001)(316002)(6486002)(5660300002)(6512007)(83380400001)(36756003)(66556008)(66476007)(6666004)(4326008)(8936002)(6506007)(2906002)(1076003)(478600001)(6916009)(66946007)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VGg6YSWw2zS7jEvq9MJ5IUWjdltjxGpzezJJQJk2S3wzZcOdJ56XHF5GCoc3?=
 =?us-ascii?Q?ETlIqJMWzhT8Yvg74I63gRw6Mn23LMMlueae8UyxtcGLggzF6ZYJYQWpodEF?=
 =?us-ascii?Q?vEWNvneoRpfHTZPJarTvnApb1t6ukefOmH25fCqPS6P4e3dJhPC2ORh60vuU?=
 =?us-ascii?Q?c90uiZbb8M7L1RbftUPL3r4jH6gDtPVWUuf3Y7orDjSVI/02M34ghJSbzIEc?=
 =?us-ascii?Q?ukBO88hqMZzWnGMgWf1JR6nTP/spjrklnTZ+hqk7g384EFXSffgYhkqnpRk8?=
 =?us-ascii?Q?EUWJhvyszgCfIlCcmhgi6dqxy7Q5r1RRfTTWmR4o2YkUjgdpXFFPxMdB2G20?=
 =?us-ascii?Q?F2fE44asi8d9iZa4gQhQe8jqlKEszVE2GQC3HC8zwQMA2wGbfnY6JjaMYZp6?=
 =?us-ascii?Q?K7+6YwwdxDRvqt6g859xrVfhoDVi9B4aDepFLXWRoSzYaxjHVv1cKuZPONim?=
 =?us-ascii?Q?W74BtXCf/C9VZhTlTRALLFd8w/Mps6xQJt/xEsS1l+zym8QDgUzkN8ofH0mj?=
 =?us-ascii?Q?txNIRLGPTlw13CtKjInTjGvAgSLMIUS1b45owVJ/RpcmQ6PQVRJypmlYWx69?=
 =?us-ascii?Q?+dDPtvAFs4i2EIxaOEBZ1Bnj06am2uOdp3tOrETom1fR/ePFW9fRVZpgTviv?=
 =?us-ascii?Q?RppYaZRsd7QUk1UB8elaeDmZ9ZJ+wIxW7M5Izu6B5tp6p9fhIvTSvNzPvXaP?=
 =?us-ascii?Q?Ki6C0Xpp3YOX2NP9ivE9suLuPkFor/j/odhd54/ToX/UywXqWQceUa48gK8o?=
 =?us-ascii?Q?GwIvebsaffncehiiXnjGy3JYj5+QzPhDe21HlOfc58ewU4VXB7xmf9/UGduH?=
 =?us-ascii?Q?aQsV96NKBwku8g9ltJpbRrjJiccEsPwaK+XVjsUKRet4sSgkWqIMjjIhe39I?=
 =?us-ascii?Q?S3nCFnCQocEmGZuPpZS6zRsH2hZ2ZVrKR5xW2JmDvMA8EGu5sDn9VLa/rsjr?=
 =?us-ascii?Q?Zri+qWGSTlNpzdfb8WPs5OTmcxyzvs4wnfKTlL/uYT2qh2+SgayQrChCWV+E?=
 =?us-ascii?Q?NKx9GC4S0vVCJ7uOYiu331jepx3uKDqfqejYFNUZ6gqbT3jawm6YwUyU3ENd?=
 =?us-ascii?Q?FW+6OISR7Q3IfWjNo9x78rRV4G8qXAYvIr/Z6PNM39XCrscW7YQkAusGujml?=
 =?us-ascii?Q?wen6S10ExfiJvEfDjLE40Y08N+X8gatBIvjzdgrEqHj63cC7umblwrRyFftw?=
 =?us-ascii?Q?msZWayOU1cueruvtzTA3wqZaquZZT/Qhcj7rnPr1a+kJkfyU8A43FHtEaBku?=
 =?us-ascii?Q?Mmcp1Xa3t7G9FAbsySkabM9+knTIj3l8dSvywz2rDiJkaTOrvMwm3MWUbVyu?=
 =?us-ascii?Q?V1KQ23wIToe37I8wm+y2u1tt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91761c93-43f0-45e8-93ed-08d8fa97d4ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:49.3817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIyWBtlsHCoQKxeqC1nyXbchwT2c6nr4DHyADgY/uWhY7bYA6V0S7kjL4ijXL7ad8IQ7jT0HDEVHNRDzEJdvI25EI1a6YsGRBbKLpCGBlaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.14.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Actually, the only bit of information we need is "is thread running or
not". We don't need all these states. So, instead of thr->state add
boolean variable thr->running and refactor the code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 103 ++++++++++++++--------------------------------------
 1 file changed, 27 insertions(+), 76 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 4e28982e53..85c20e7810 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,18 +66,6 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef enum NBDConnectThreadState {
-    /* No thread, no pending results */
-    CONNECT_THREAD_NONE,
-
-    /* Thread is running, no results for now */
-    CONNECT_THREAD_RUNNING,
-
-    /* Thread finished, results are stored in a state */
-    CONNECT_THREAD_FAIL,
-    CONNECT_THREAD_SUCCESS
-} NBDConnectThreadState;
-
 typedef struct NBDConnectThread {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
@@ -93,7 +81,7 @@ typedef struct NBDConnectThread {
 
     QemuMutex mutex;
     /* All further fields are protected by mutex */
-    NBDConnectThreadState state; /* current state of the thread */
+    bool running; /* thread is running now */
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 } NBDConnectThread;
 
@@ -353,7 +341,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
 
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
-        .state = CONNECT_THREAD_NONE,
         .refcnt = 1,
     };
 
@@ -389,16 +376,11 @@ static void *connect_thread_func(void *opaque)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->wait_co) {
-            aio_co_wake(thr->wait_co);
-            thr->wait_co = NULL;
-        }
-        break;
-    default:
-        abort();
+    assert(thr->running);
+    thr->running = false;
+    if (thr->wait_co) {
+        aio_co_wake(thr->wait_co);
+        thr->wait_co = NULL;
     }
 
     qemu_mutex_unlock(&thr->mutex);
@@ -411,37 +393,25 @@ static void *connect_thread_func(void *opaque)
 static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 {
-    int ret;
     QemuThread thread;
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
+    assert(!s->sioc);
+
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_FAIL:
-    case CONNECT_THREAD_NONE:
+    if (!thr->running) {
+        if (thr->sioc) {
+            /* Previous attempt finally succeeded in background */
+            goto out;
+        }
+        thr->running = true;
         error_free(thr->err);
         thr->err = NULL;
-        thr->state = CONNECT_THREAD_RUNNING;
         qatomic_inc(&thr->refcnt); /* for thread */
         qemu_thread_create(&thread, "nbd-connect",
                            connect_thread_func, thr, QEMU_THREAD_DETACHED);
-        break;
-    case CONNECT_THREAD_SUCCESS:
-        /* Previous attempt finally succeeded in background */
-        thr->state = CONNECT_THREAD_NONE;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                               nbd_yank, bs);
-        qemu_mutex_unlock(&thr->mutex);
-        return 0;
-    case CONNECT_THREAD_RUNNING:
-        /* Already running, will wait */
-        break;
-    default:
-        abort();
     }
 
     thr->wait_co = qemu_coroutine_self();
@@ -456,10 +426,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_SUCCESS:
-    case CONNECT_THREAD_FAIL:
-        thr->state = CONNECT_THREAD_NONE;
+out:
+    if (thr->running) {
+        /*
+         * Obviously, drained section wants to start. Report the attempt as
+         * failed. Still connect thread is executing in background, and its
+         * result may be used for next connection attempt.
+         */
+        error_setg(errp, "Connection attempt cancelled by other operation");
+    } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
         s->sioc = thr->sioc;
@@ -468,32 +443,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
             yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                    nbd_yank, bs);
         }
-        ret = (s->sioc ? 0 : -1);
-        break;
-    case CONNECT_THREAD_RUNNING:
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        ret = -1;
-        error_setg(errp, "Connection attempt cancelled by other operation");
-        break;
-
-    case CONNECT_THREAD_NONE:
-        /*
-         * Impossible. We've seen this thread running. So it should be
-         * running or at least give some results.
-         */
-        abort();
-
-    default:
-        abort();
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    return ret;
+    return s->sioc ? 0 : -1;
 }
 
 /*
@@ -508,12 +462,9 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 
     qemu_mutex_lock(&thr->mutex);
 
-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        if (thr->wait_co) {
-            aio_co_wake(thr->wait_co);
-            thr->wait_co = NULL;
-        }
+    if (thr->wait_co) {
+        aio_co_wake(thr->wait_co);
+        thr->wait_co = NULL;
     }
 
     qemu_mutex_unlock(&thr->mutex);
-- 
2.29.2


