Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E4361B36
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:16:59 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJet-0001un-0I
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXv-0001H8-Jc; Fri, 16 Apr 2021 04:09:47 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXr-0007xx-9Q; Fri, 16 Apr 2021 04:09:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7EcBNfvf7y/0iY9ipOBmJhnduS2b9xfXrOg35Z2uYXgm+V48Xh5yfICZ5slWHmnwom2HPNiH4Td7//RRvSWQAQb9XX1pM96PTE58y/Roic/cHwBpLCIXVqAHcw5LK8fWc1xgxm5t5/CVj954VJ203P3gEfWnpJ2RTzXGl6X5DIM4/2nQmhOfa9EuznIX6xJMZbXytgfKaiUojfA16AFu39TbW9yz/SpDU/EiPhsLhRU62cYZi9ViXwYQ9tbUfwAp3gNJZKjQk/pA/hWVKFmrjnhq6+JNlNOFyiKzpslwro1WgDjutO9Ed0HRQZL3eJAIJe1oz37ANZrSvmvMmRI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxTHnmb3cCRujztHtOleMzUew0v6XhZ4Tnu8nH0peuM=;
 b=hm/4uLgrT7VcmQc7Yi/qZ+dLCa3ogDlOKKHRJ/uzp94ssGpZ6wMvtlqOE6bPvl/LsrhLUBTwGkllnUK8QX3REeezLfLLUiPjGyuxbQprj+Vl90nf3iQrfthgZb8fT8plEOSb2atenxGcTTTRvrikM5rN6hTGRqnDyEYRgU0DILD8rFcQnAj8Iw+4/438QVoXz8KzfiYqA3WqG4bP/gTOTuienH/1sM4S3RTCAZM6JGAhjm3Ox1GgsSvAB6CsBSe0ajm/q9I6jDE0sXyweRn69Upy/ID33xLCxMVTrlJRr1dGcfrpp3JA4TDlFWTqEJrbD+Xt+ZyauqhiP9w8J26veQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxTHnmb3cCRujztHtOleMzUew0v6XhZ4Tnu8nH0peuM=;
 b=DbkEmdIqhm+GNd86lFcDgtRvz0CFxWTFzSMkGJkDx4UsMqUq0SSy8NXTIFHP1KzI6nbVc2IrskCzwBl+0oxQiA5THL0eTCVIxGE0s2HDBvhAvD5VyQLaTG7zbqBfAs0cekvau/h6elC2G9I/ldEAMUyCsgQ+75CJtauD/GOT6H4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 08/33] block/nbd: drop thr->state
Date: Fri, 16 Apr 2021 11:08:46 +0300
Message-Id: <20210416080911.83197-9-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2261666-9265-47ad-19bc-08d900aefa2f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691E8B65BF8A8F611B29505C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hp5VU9ajb2PBif+UAmzI3M6FTMnSmF0d7eXiQJIo8v5YxVwfPokjIzFRXwsZ/CNnYXTomrg00F7emc4WzDUb7N1kMyZ0mzsQfhyg2/o5ZFB1pWT5pBSeprnU8LDgkeCJbTHSjUMCSShETifQLIRy6wUKyNLam9e3DGsjJGrmnrXo0TALP5Em/y48og6bwikxt8fMZ4Nz37ZYCnsP32OIw4EcIKXk5LhZiR92vfAKKXniqeOt0aKQP0JNCoZ7ZHFWoVdAGwuH5CNm/gRaptJBtLWa651ZwJpsy40ngrITEy7kgmhkj6eoWQs1ejVOzwWh6CwIIgMu9l3SEPNKqh9IzfLtwLc9KmCNW/dVytNKqq24s90zKO9LfEk/hJK1dDh5M4fE6gLoA+t456BocvFZ1ZCXAUtKLZPHBsZXt4OI+JvKJE4IQsDRIHRyiyRjFsn/kexJOhLBAoSYmui/uyS59EBe9Nv/sl0+FYQAs1a0CeGUPBK+uDiNNgNH53pkEwmRZHRsY547UsDf5KbKDH69Z017x3m6B2KcUhwtkmtUItLs6zTeJwpOBvftTyjGeSV+d3jY8j7VhbFpZP5CwP8GhpE+pUlLOaJ4KzIGW58bvjbzq39EzFtQiCWAAef0c8sFvNWQSw5/FaXowRAc99LikLHiPYUEKdWU9YffVECuNdEd9OQpmPyAKM4STIcke34ns2MtuTv5K2QbXoxYiA7Iew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(36756003)(38350700002)(38100700002)(508600001)(6486002)(5660300002)(8676002)(66556008)(34490700003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HU5VDPqQ8zn0Gc7RegUB6KleKhaQ5SV7DMTy0kNLIrax/XURhZXxyTsCByKA?=
 =?us-ascii?Q?uHniAEgtn7nxlONEYRPZbJWn06DZ7ygBBJGBEzC5iRyiYp9Ff2tVMXR0PPzn?=
 =?us-ascii?Q?YXInh+GDI2gYAZmhOnxQ1xU63b1pHUK9Wt+kc5VZOer/fDkdA7xiUI6/3z9E?=
 =?us-ascii?Q?q9OhN+3o8rQo3Evl2lcM5RXlBl2rcVpo29LJDm3W/1aVEYNilpMaYBgkK5Ej?=
 =?us-ascii?Q?OOwYt3dxjx9i3SEBQ6buxKCTSxjzu1egeJLDJkWCM3Ly6Win36ZZ+ysM92Qa?=
 =?us-ascii?Q?9EQR0lzJOeiPXO8dblIjuUM86/lAayzAmSg0W6rHiqGcIayLOLRMufoGKRiL?=
 =?us-ascii?Q?C1vAOfZr+Z2C81tzHPJyc66KltktvBbn3fBS1EjituAsS+CwXduaCr5rgKHD?=
 =?us-ascii?Q?BInAvPXZAPrqfsQ6K+jP1FqwaP1kWJlgaec29W/EXaM2Y4OVxJwWo1efET51?=
 =?us-ascii?Q?IpNQd7CAywpvE/KM3upkvDy03blgnzrSf/fZEnEhDXGM5H05fdFtxRxyzcIU?=
 =?us-ascii?Q?g6Cd7kXqBXwCkeImBkjZ44eZ9dyVnUilcBzHYtzI8qobCGKC6DtTuqGT9nQ+?=
 =?us-ascii?Q?51h3fjz87L2pfrBHfxxdcy6CQN/zEn9CVgUe0KwPUFKkD4fwllhWp0yGXJ/A?=
 =?us-ascii?Q?H/J6Rpgibfh8x4mJckKa0RITgY33kmXfJWfd2i+WlxwR3ZDbSktmPPwT1vJD?=
 =?us-ascii?Q?Yt40ebIF92P77HT1U7Iimic85PPttNML+6Jb34ba1M8xhZqW/7ABKDRkn0G8?=
 =?us-ascii?Q?Hf5+DFP0Pi3t6QlcIVD2svbal+HX+3TRfwihH22o0j1q8HIwbiyp1USwfJPV?=
 =?us-ascii?Q?CsQK012oIn7KkPixvhge+rI2mP46/3ZGpywPsRN0aR9mGiSWnqYIQT1cWliT?=
 =?us-ascii?Q?nsj4bC7JEfkMNdmpwy9b50YuJkACDcv1a7ryXm3OyABsIsl/jwlZHWzadEbS?=
 =?us-ascii?Q?LsnRT9h4sUVTS0eOsFP5hbokM5UL/JcWOxzbotxvmbW/7V1BukkYxtKmky75?=
 =?us-ascii?Q?Mjc0b08nkB9tFYTXwHcTBXRCn6vJE437nXYhYIU6MXMByanStYn1fUBN0QT7?=
 =?us-ascii?Q?q9hARIrdJy+sN/xxmHEkytOfzUK5ygpurryt/aTIIES9wwOfJeJXgScGTMY/?=
 =?us-ascii?Q?aUGC4rqFLXwtd0WuLUHQrQp7QgkS7KUxy2z//WVR6CB3dyiEKqpGpBtY/7t+?=
 =?us-ascii?Q?G5+/+G7S3Kwe6KZRhhTNuvnwDWJFwsEh4Thqjusb+nBWHVeDmY2Is1JJz/93?=
 =?us-ascii?Q?D7MnSjfnLSZIo3WP3QADT8kHV+joh1hhVtryM+KMYF9Ce6s0AySR8dEGtRRL?=
 =?us-ascii?Q?OMrADcYmXx9ez6qpzpWCLV25?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2261666-9265-47ad-19bc-08d900aefa2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:37.3526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHOQGV6cxs2DSvxXHH/8d03VoO0AtvPO0y2dzcNgjMs8tn8xMy9m5sYIzKQKfE4d9ZU3bgTr671hm4C6FbsOyS8I28XCz8dlyriE7SBp1a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
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

We don't need all these states. The code refactored to use two boolean
variables looks simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 125 ++++++++++++++--------------------------------------
 1 file changed, 34 insertions(+), 91 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index e1f39eda6c..2b26a033a4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,24 +66,6 @@ typedef enum NBDClientState {
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
@@ -97,7 +79,8 @@ typedef struct NBDConnectThread {
 
     QemuMutex mutex;
     /* All further fields are protected by mutex */
-    NBDConnectThreadState state; /* current state of the thread */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 } NBDConnectThread;
 
@@ -147,17 +130,17 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
-    bool thr_running;
+    bool do_free;
 
     qemu_mutex_lock(&thr->mutex);
-    thr_running = thr->state == CONNECT_THREAD_RUNNING;
-    if (thr_running) {
-        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+    if (thr->running) {
+        thr->detached = true;
     }
+    do_free = !thr->running && !thr->detached;
     qemu_mutex_unlock(&thr->mutex);
 
     /* the runaway thread will clean it up itself */
-    if (!thr_running) {
+    if (do_free) {
         nbd_free_connect_thread(thr);
     }
 
@@ -373,7 +356,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
 
     *s->connect_thread = (NBDConnectThread) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
-        .state = CONNECT_THREAD_NONE,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
@@ -408,20 +390,13 @@ static void *connect_thread_func(void *opaque)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->wait_co) {
-            aio_co_schedule(NULL, thr->wait_co);
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
+        aio_co_schedule(NULL, thr->wait_co);
+        thr->wait_co = NULL;
     }
+    do_free = thr->detached;
 
     qemu_mutex_unlock(&thr->mutex);
 
@@ -435,36 +410,24 @@ static void *connect_thread_func(void *opaque)
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
@@ -479,10 +442,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
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
@@ -491,33 +459,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
@@ -532,12 +478,9 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 
     qemu_mutex_lock(&thr->mutex);
 
-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        if (thr->wait_co) {
-            aio_co_schedule(NULL, thr->wait_co);
-            thr->wait_co = NULL;
-        }
+    if (thr->wait_co) {
+        aio_co_schedule(NULL, thr->wait_co);
+        thr->wait_co = NULL;
     }
 
     qemu_mutex_unlock(&thr->mutex);
-- 
2.29.2


