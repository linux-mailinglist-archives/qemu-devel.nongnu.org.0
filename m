Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573183A293F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:20:38 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHnh-0006f2-C8
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcc-0005WP-UU; Thu, 10 Jun 2021 06:09:10 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcX-00051Z-E9; Thu, 10 Jun 2021 06:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnWwJBFu7R/wgEvnKOVoNnnenZvATXXsHtCymt6TU3VFyY/q+M7uvrsGwBa9kRTGwujhwNb6k0rNINHuH1xH44KgdcCH03+8OS+qw0wdzysGBCAFBJdiaMT0+gY6H+bDPCfta5E2PAU9/EP+VgvoI3X62yerBJ1/cAsCZlyXQfe4LIpmyDFj2Xip0OKz09TfPN+qPX1zFtkd+unxeEwk7LU3vjS9OeRV/qjISK1aYBmRLzaEp2RfIL/WA26CD+i0JHqn3wLeuhlKCbLpV5hJOaPrUHbZSVPYKmtAqb3LLi/s3S4R3sxNu800ORAxcL/lDzuodMtwjEZd8haD1foq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FcJs+1Mn2iazVR5TQ1YhDZo+BXX3gsjpxUocRGJw20=;
 b=h51/wS95RCC30Eku3PMvx6BnDvvPHtd6UXyp10jh0i+mvlgEAHcA2LRR+7cILsuEIlCTv4rkB7WvYTAbZsVNxW9yp6F8/H9lBiyPtAv1PhBxUT4PI48F/ftKTA8iMI4RJpaPezOHHs2A/TGZGKmo1xuz8jcxi5XvkzePcAy4DsnOwzJrSh/dar52xdE45ooMIkwbLMWIlcpwEdpKgwQAxastkvUxnHd0xs+KhwpscFs1nRhmKjHbSpEcxL9RL0OgOy/7QenodV8ktK7G/fVNfcUMC9Lx5nO58ORkHAn6rSfdj3zCjyIkgesdxmCNXV3lYUk2JO7bPcmIkG9LayOR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FcJs+1Mn2iazVR5TQ1YhDZo+BXX3gsjpxUocRGJw20=;
 b=pxY0PL1+HaZmAC/AQZAzDqL8YGOS4xZXVX+J4KHAYnmv9D4Jpt7wBO+EBL045kL+fXTW3my44PzCktvFQd9+Cgy0v8S7y+X7cV4OP89omlpNiIB6dGoT7ZRRV/d416VKE8SqP2m+LPHQUAQkoEp9pumF7jK+ZlVt1+bFfjdcFq0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 11/32] block/nbd: drop thr->state
Date: Thu, 10 Jun 2021 13:07:41 +0300
Message-Id: <20210610100802.5888-12-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e0d821-c014-4ad5-9ac2-08d92bf7c2fc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502C3A3D51460E56A66D888C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yazZin6QBmuDXX5iXlcNboPpqtVumgTp7P1mld6cs7poqcVKIj/BFPqrEupCuhvsjyLCWgKr4kqGRMm483qF0p/PVs7UtTLVN1glSl0mgAqBAahToA4dJ+9EzPi89o9t6mwCEiQhsl032DNFVauuVWt5P7WinV5aohQEMEZT7+VJWhERc0Bp3OBhx6TElQKBE4cXuBz7r/htzu2BmqOivxq0obRHwoc7i95LJ73MGuH3UgoH2JK+t/ShTL6UoekwNjJLI4EcF9p7fmx0lrOzba4/PwQfo73R/Wcr42Ox8edRnbOWe4tb0edLZkqbCaIoF0tatrX2qfbYh0pf5KGBnJ6ufUWiMc4CTaaHfjW3EmRVXtDcPn274CXKS/dTM8Kc4vyJvHsWX4RfOhEj5687gQzsoub2kMgXvLLsemIm4G7yAVIvKy7HYJ8PVVhFPtafysB/+UiHqAZGcs+qqEUMt1d9VsBp+rneeV6z8sZotmJA2UB12hsurSgdcTgaNsM4JLNXQVVbnwHmazcmlJaRU85SYqqckGAn0cekw5SkzKzgwkkY9Au/ywWXdI7dCus6zZkEgFG9L5rax7c0Yl6AZ0Spt4gZS46nBu4VivJOEOdW92lkqlTWjMTR9BEnsMEaZvi3arFCWrRnTyzDXlejezqoYm86PBnbD3gxyVEwtxp7ju7TAU+iiq2UAPBfeEG9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XTrfHshCrbZgvdtG7KlhvBMRyzC/LMLV0fvVuIQajc6V+S1KoQe9UDkP39GB?=
 =?us-ascii?Q?3zxAPPp+aH1Pl3dGtPR652qIV7o8fnF4O7FlfaXiOdFtexrEETRz5V7cBGNv?=
 =?us-ascii?Q?wfInVmDawbTp46xV97W9DhxondjQobFqF9V0g8C2ZUVps/9LL595hMFrIcn+?=
 =?us-ascii?Q?L3V18wOReGXpjeqhxCdK9ePtWfCbjUia7AbkWjLeEZbR6JIzv/vTNWrjGsk7?=
 =?us-ascii?Q?kz6CqyuFLLUiXAZg3Grgt7EqnuHzEEh9ZKrqrjwHWtZytlcocuYqu5w4yEgv?=
 =?us-ascii?Q?TuHl2TUse5IrcJA3yo4C8uON7i/nKKGcbY/gmYbITyoVCMmnwTxQ0P2AnhCS?=
 =?us-ascii?Q?lHozyxzqi1UhwqdT/jTf2N+xySG5jdQTIlHr35DtWJXMaYsEzi5bCiMm9o3M?=
 =?us-ascii?Q?eIqHoCzQkoVRMhHgZ+YZ1ej3EbKi4xNPBf4ss692/C2VX2GWw3PVb3/RSpQr?=
 =?us-ascii?Q?4t/92RPZOc/1rvomsZECpnhsfF3bEKZIcKhUNAU330JvRuO3JrIKNLuS74XV?=
 =?us-ascii?Q?DHriVCCGI/HLqmS8eSnt644sHJ2TLyfSxi/8nld1jpKb8abYODbdR44SuCJ5?=
 =?us-ascii?Q?Xy9EVlPsg58+6VY+kiu9pGMarXcOO5C0SJzbsBDFbJyrldinq+pkBtVMfTE8?=
 =?us-ascii?Q?90LFbRq57OW4sa3cJjanYVZGioIJK5Kb1cqga2Mt8qq/pqKG5hMEg3Tjcwo+?=
 =?us-ascii?Q?pdJMoOqS5afwY25FZ3vX4va5a8uPowrfTDizlnfnbO+qMOJwDnxC8dwvjNf6?=
 =?us-ascii?Q?SuhUx0+M7NQB6qj29bCnNgeLn5E7hLonu9IM7V/CX9mQ+CMLHP5WztERfRSx?=
 =?us-ascii?Q?rXyDK4jyTdyBMtoOfwpJms3a7G05kygoMxh5+KEMNYlD8RJ2ltmj4zVjOYxL?=
 =?us-ascii?Q?AhDtFq/x/s7k/USBoG++Q75fL3Jq6Otb80tfp2UcZh1BQRQZ7gPyJ8p80P8A?=
 =?us-ascii?Q?cUIbSMajIBOdezmHKStmKjI0ZBe1MFmlNDNiB6fj0yew2NcMn2oKFB0EWl4p?=
 =?us-ascii?Q?JW4TV81aHuEA1ATyES82mK8+kLbHLxxXMiAdZ9ORYT+I1GboFuF27wD1lVEi?=
 =?us-ascii?Q?6rRXZlC45InWtugFm3xuz3kcn8B0QnfoNRxg6LoFor+EbLcXNWhlb6N3bT4p?=
 =?us-ascii?Q?XnSzmqdH7AGFLJcd4ASzbjwTK0akXyzjUW8GezkbItPysKdgtSNCSJpWzBG/?=
 =?us-ascii?Q?rQ3HKA3o9244N9yoIABt5ymDLV8PM2P9kdVXmnM3GzBtvRODlBuWYBxSo9VT?=
 =?us-ascii?Q?WJiglyVifu5q81b8BLII8ZRuyI9VYgEMWC1zDzEGuFOK865gHQezK+FIQtWx?=
 =?us-ascii?Q?GdaWKEv/uv0ic8B6F7IgQIaA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e0d821-c014-4ad5-9ac2-08d92bf7c2fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:57.9430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx4Bzab/g1amirvHrirjUYBtysyPi7AQKAfGtg++61Q/eaFDZk37sS+Z9hk7krm3h0OYsqzlaEmi+5BEfYLMnBmk6Taqc3vfKOvN8NqoLgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

We don't need all these states. The code refactored to use two boolean
variables looks simpler.

While moving the comment in nbd_co_establish_connection() rework it to
give better information. Also, we are going to move the connection code
to separate file and mentioning drained section would be confusing.

Improve also the comment in NBDConnectThread, while dropping removed
state names from it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 139 +++++++++++++++++-----------------------------------
 1 file changed, 44 insertions(+), 95 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 653af62940..58463636f0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,38 +66,24 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef enum NBDConnectThreadState {
-    /* No thread, no pending results */
-    CONNECT_THREAD_NONE,
-
-    /* Thread is running, no results for now */
-    CONNECT_THREAD_RUNNING,
-
-    /*
-     * Thread is running, but requestor exited. Thread should close
-     * the new socket and free the connect state on exit.
-     */
-    CONNECT_THREAD_RUNNING_DETACHED,
-
-    /* Thread finished, results are stored in a state */
-    CONNECT_THREAD_FAIL,
-    CONNECT_THREAD_SUCCESS
-} NBDConnectThreadState;
-
 typedef struct NBDConnectThread {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
 
+    QemuMutex mutex;
+
     /*
-     * Result of last attempt. Valid in FAIL and SUCCESS states.
-     * If you want to steal error, don't forget to set pointer to NULL.
+     * @sioc and @err present a result of connection attempt.
+     * While running is true, they are used only by thread, mutex locking is not
+     * needed. When thread is finished nbd_co_establish_connection steal these
+     * pointers under mutex.
      */
     QIOChannelSocket *sioc;
     Error *err;
 
-    QemuMutex mutex;
-    /* All further fields are protected by mutex */
-    NBDConnectThreadState state; /* current state of the thread */
+    /* All further fields are accessed only under mutex */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */
 
     /*
      * wait_co: if non-NULL, which coroutine to wake in
@@ -152,17 +138,19 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool thr_running;
+    bool do_free = false;
 
     qemu_mutex_lock(&thr->mutex);
-    thr_running = thr->state == CONNECT_THREAD_RUNNING;
-    if (thr_running) {
-        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+    assert(!thr->detached);
+    if (thr->running) {
+        thr->detached = true;
+    } else {
+        do_free = true;
     }
     qemu_mutex_unlock(&thr->mutex);
 
     /* the runaway thread will clean up itself */
-    if (!thr_running) {
+    if (do_free) {
         nbd_free_connect_thread(thr);
     }
 
@@ -374,7 +362,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
 
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
-        .state = CONNECT_THREAD_NONE,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
@@ -395,7 +382,7 @@ static void *connect_thread_func(void *opaque)
 {
     NBDConnectThread *thr = opaque;
     int ret;
-    bool do_free = false;
+    bool do_free;
 
     thr->sioc = qio_channel_socket_new();
 
@@ -411,20 +398,13 @@ static void *connect_thread_func(void *opaque)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->wait_co) {
-            aio_co_wake(thr->wait_co);
-            thr->wait_co = NULL;
-        }
-        break;
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        do_free = true;
-        break;
-    default:
-        abort();
+    assert(thr->running);
+    thr->running = false;
+    if (thr->wait_co) {
+        aio_co_wake(thr->wait_co);
+        thr->wait_co = NULL;
     }
+    do_free = thr->detached;
 
     qemu_mutex_unlock(&thr->mutex);
 
@@ -438,36 +418,24 @@ static void *connect_thread_func(void *opaque)
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
@@ -482,10 +450,16 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_SUCCESS:
-    case CONNECT_THREAD_FAIL:
-        thr->state = CONNECT_THREAD_NONE;
+out:
+    if (thr->running) {
+        /*
+         * The connection attempt was canceled and the coroutine resumed
+         * before the connection thread finished its job.  Report the
+         * attempt as failed, but leave the connection thread running,
+         * to reuse it for the next connection attempt.
+         */
+        error_setg(errp, "Connection attempt cancelled by other operation");
+    } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
         s->sioc = thr->sioc;
@@ -494,33 +468,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
             yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                    nbd_yank, bs);
         }
-        ret = (s->sioc ? 0 : -1);
-        break;
-    case CONNECT_THREAD_RUNNING:
-    case CONNECT_THREAD_RUNNING_DETACHED:
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
@@ -532,14 +484,11 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    Coroutine *wait_co = NULL;
+    Coroutine *wait_co;
 
     qemu_mutex_lock(&thr->mutex);
 
-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        wait_co = g_steal_pointer(&thr->wait_co);
-    }
+    wait_co = g_steal_pointer(&thr->wait_co);
 
     qemu_mutex_unlock(&thr->mutex);
 
-- 
2.29.2


