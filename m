Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A556735865B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:11:30 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVNX-0006uv-Gm
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLf-0005F5-4C; Thu, 08 Apr 2021 10:09:31 -0400
Received: from mail-eopbgr140103.outbound.protection.outlook.com
 ([40.107.14.103]:51570 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLV-0001b3-Kj; Thu, 08 Apr 2021 10:09:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/y6OvRquF5cRTIqFkK8vlNz+MbFIr8Yu1BUCTuL+AWYpv16k9NsCe7dkTM61IgxJQ7TLNq/owT1tJoaup6J2Oa6COuxAy7w1pUmYJYc7EPW5H500dCGfYt6fvEb5s24ZBi7JjBBN01CUn1c1rSNpBB1K0sPOnmzwXKS7w/GKsKs79nrJMw6MTyjjE8C/R6LcL32sj4LsdOFm7yiDkm3ydbaKIpQSc1XCyJebKIlaojzdsLuX+xAYkQ9oC66vEUzv0KjW8m2QiqdQx7nQ68f4dSJZGwa7K7ZsfuRYaRAu1ttIE/KfuX8sJKRxnSHSPsbNrbNA2inpF6xHA6N0d+eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5jiqsB/GccwtYQCqrqNoYIaehUhulhHRfym3T32OhA=;
 b=K0gRDtQiqnd7iqFPqttuMI+zMehguL8FEkGvh/uvblsvksStYkLjTvx5vNpKteDJp6DpsQdlxTDMLKcUiNoaY1O8K2SS2ojBo/sMjQh9eBTvTA2AzG7OE7EVNhWmINUcEX7oqOb87KpXK3dbXPZssAVSReoGrKfagUMCGKTlMvvYT+QhhnMuuZ07U4IfEYF9G+RUPUfDvL0A/T1bUj6pLihbqmFQyBIcCAk/0t7sDSc/y87BpKuo+DX8ylOt71If5OPcD6G5OHGMvjfMKywIwVB6uPBEhDTrMFm9sNfq1wJU1O9JBghIz8/QJIf8Sw4F5Abxlk8lBVprAWprHqEHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5jiqsB/GccwtYQCqrqNoYIaehUhulhHRfym3T32OhA=;
 b=tdIopiAkAhvhpkc/dYjGzfXO6ZW86F3zSjzSXnz/P+d/qRF436EWW9F1qP7LaLzO8eriRB0hyo9GRevL7jFGKuPwyOPD7EfbM61zulYGQHEdIhwsE4CGafGkUOjNOg1Oy+/fMxJLuNDU/ORh1uD4OLwiirGJr9QYOrl9UvgVlP4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 14:08:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 08/10] block/nbd: rename NBDConnectThread to
 NBDClientConnection
Date: Thu,  8 Apr 2021 17:08:25 +0300
Message-Id: <20210408140827.332915-9-vsementsov@virtuozzo.com>
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
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b870ffae-40b6-4ade-6c2a-08d8fa97d788
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17137360BD345F6D45103AAAC1749@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHU0R320RMNRwcII9DSlPq/USbpNNz/iUmHZXy2C9TOSZk7kCWq7h2a7vm4mINKVr9sYvPwRVUPI7TrF0ajRhGtyOOUtMvx8C/WQYYFp8tQBoFG3pF7mewjcilRoYQbF96Lar7JQJIFoVzyJyKafBU6jkvC+BJsn1BDMjW5h6XPV8AAW3XZgbZz93vhW6QDeEebG626XnPNQSmjfuL3rcwCHDRYAvJR0c2/J/jiZj5Yb4BK9EpilB14Om+bkK1OOuN88YwNueNjfxobFlindocig3+xlaef7oUYdmG2gZXDDp1qCiLyoL8GHsCmqhA9JNX9NSbfC+RXbwgm6ojdYkxOyBxMWb/nRwUp2Vo9FHK+xiuWZd8udLsCR1oduHjlGcWf/APBu7JuR66tP3YY+3j3zp4NrnFsPwNkl41dlcKjJxC9GYJV59zByo8ha7gcyyW1ckze51GRnG2a01LT9xyKvaRb9idK30zRLGZe9PT8l1RVxiTF+Io5xYXmvQi3bOfVyklx630i7bhn0iGJAzZP079g7apGipapI0CyPRY4T8393LUsFwVcHQNB3GswMthwtPTzCJ0bAnEB1VFvzEQmQ9cJfnCG41t+/LJ/jwMLOeWSPZGuVMk6qwFeeb1pKHClR/YUhP2+DyQQwJ/tMUF4F6fRTgWVtSOaLwZuBBloPEwFzYwFTdubfobtVQntMyKJKp5W8/2cMlrDU+VV7Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39840400004)(6506007)(4326008)(8936002)(2906002)(83380400001)(6666004)(36756003)(66556008)(66476007)(66946007)(186003)(478600001)(6916009)(16526019)(1076003)(316002)(38350700001)(52116002)(86362001)(69590400012)(2616005)(8676002)(956004)(26005)(5660300002)(6512007)(38100700001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fW4ix0eugdPmiwZfAyIsoXHKEpV/dY5q0bBQWb5/B/pS9a80aZJ+TD9ZGhkL?=
 =?us-ascii?Q?8H01wxcSJtbV2vDcPQdMu+/izt1BjPAGaaKokR0RgBJQaE90HYcPIC4XfmfZ?=
 =?us-ascii?Q?RTqbSdsvZ4JVfGVEypqGDPxJph9EB0zRtsNSnJ5TjPP0n3GQ79pY9IsMyVOX?=
 =?us-ascii?Q?r1/bLsLb854kPQjSdj5Ijy+rropmok8r0TKsrsTcVI6R8Ojg/X110LeSp+c5?=
 =?us-ascii?Q?umcDTqbb38r82ynwKQFbbIX5F/Xu/dSFkORGGTvn8kHKhJZSNjt6SpKAGiFa?=
 =?us-ascii?Q?P3Qmnk3YI4MQbC9ncSf4FfO/LernpPnczt9pBp+v0xyE4WeZGp+oqgGHhwUW?=
 =?us-ascii?Q?bHTJqNIMsa2NYQDjFKQGP8o/Bb8PASBgo1yu5FjpunHzjaYUBDB0o5SjpmSm?=
 =?us-ascii?Q?H9bNyIAL5VY1WOa+xdvSUNaitB6a5szH1+QlVEjZTy1bneR8f3cz/sjpppQV?=
 =?us-ascii?Q?YieddnQpqg6zbwLlpPWziv21PLPoB5yrTvZMzLEx+DmnOM30LDP8PQ8rJ3NE?=
 =?us-ascii?Q?QyVeW5+Gtp7TRxKe9uWJAohL7nTX+/5/5thwPCKsgaoZJE39rbZ7RajHJiyg?=
 =?us-ascii?Q?LOOM2lvf6OK1GOsfar00fQ4gszUg4rY22ii6MMd+pbiIj7vpPIZQuGStaY4H?=
 =?us-ascii?Q?gUley9426aRfRsSXfHQnuCYbbDOF8137gV70Acz6MYtX4ME+N6Pe1vKZox+I?=
 =?us-ascii?Q?XT2txo9HYxQ8FZwWT7DSjogw4YK37y9ShU8dumhlIUS9j1WStsIm6Tf120W0?=
 =?us-ascii?Q?Q9JPQd6/BWcdug5Qp/dZxD2yAH05vQfXBByrbb1TE/yByWhZQSthJplS1qmd?=
 =?us-ascii?Q?BtI6eeeiVBKRnaDX48H/igomEZQl7AxmNLzdXWxSH/oEB925op5rHqfVL8ge?=
 =?us-ascii?Q?EI7Dqd+uYIdiVCikx1Mt6JltMpLQS5J4SZiwYVTBVgBC316aIUJj46bO4xE/?=
 =?us-ascii?Q?FjcA4YEQspERcnerHGhveayENOrGQZclSEpHL16K+4aSxvkfrcRUjbjgQ+eP?=
 =?us-ascii?Q?ilPD4WzVKD4z5vv0QbMd8mk59ayriv65z/cDDTNF5OITN4hEYcYYBLWB753m?=
 =?us-ascii?Q?SAF07dyps+Sci7piTESuz1lfnid++PSrmUjhEJsGty2zifZTtc7fx8aYcSz4?=
 =?us-ascii?Q?RoYc4Bx1hDbcdFUDJcKYWXKFXygXN+iyQPC/l8uWbQwUWN0MvhDmS5QHyw9z?=
 =?us-ascii?Q?IPlesteg8h9i5tD1Kv6WPehFLRqnOXDPrdznIij6NG/h40Xr37j+tE7lh8FP?=
 =?us-ascii?Q?f49awH30G2rzGE9SuoVXAPg0CexcQ2vE+WAyxQK+5gJEbE8xL9cWaG08qpCg?=
 =?us-ascii?Q?pNZEKE/MQXahy6o6l5XpzOnd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b870ffae-40b6-4ade-6c2a-08d8fa97d788
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:53.8501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ck6fkbS006Hl0kWKmmccygkDmcgNLUt+ttyb8Yjv18i0MkQbaFqWy+LPBr1Jvrz3AL+y1onpMduAnZciVxDNDRsT2amqI+wKu8RZeY+icF0=
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

We are going to move connection code to own file and want clear names
and APIs.

The structure is shared between user and (possibly) several runs of
connect-thread. So it's wrong to call it "thread". Let's rename to
something more generic.

Appropriately rename connect_thread and thr variables to conn.

connect_thread_state_unref() function gets new appropriate name too

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 127 ++++++++++++++++++++++++++--------------------------
 1 file changed, 63 insertions(+), 64 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ebbb0bec6a..ab3ef13366 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,7 +66,7 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct NBDConnectThread {
+typedef struct NBDClientConnection {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
 
@@ -83,7 +83,7 @@ typedef struct NBDConnectThread {
     /* All further fields are protected by mutex */
     bool running; /* thread is running now */
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
-} NBDConnectThread;
+} NBDClientConnection;
 
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
@@ -116,22 +116,22 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    NBDConnectThread *connect_thread;
+    NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void connect_thread_state_unref(NBDConnectThread *thr);
+static void nbd_client_connection_unref(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BDRVNBDState *s)
 {
-    connect_thread_state_unref(s->connect_thread);
-    s->connect_thread = NULL;
+    nbd_client_connection_unref(s->conn);
+    s->conn = NULL;
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -271,7 +271,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(s->connect_thread);
+    nbd_co_establish_connection_cancel(s->conn);
 
     reconnect_delay_timer_del(s);
 
@@ -311,7 +311,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(s->connect_thread);
+        nbd_co_establish_connection_cancel(s->conn);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -338,100 +338,100 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
 
 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
-    s->connect_thread = g_new(NBDConnectThread, 1);
+    s->conn = g_new(NBDClientConnection, 1);
 
-    *s->connect_thread = (NBDConnectThread) {
+    *s->conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .refcnt = 1,
     };
 
-    qemu_mutex_init(&s->connect_thread->mutex);
+    qemu_mutex_init(&s->conn->mutex);
 }
 
-static void connect_thread_state_unref(NBDConnectThread *thr)
+static void nbd_client_connection_unref(NBDClientConnection *conn)
 {
-    if (qatomic_dec_fetch(&thr->refcnt) == 0) {
-        if (thr->sioc) {
-            qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+    if (qatomic_dec_fetch(&conn->refcnt) == 0) {
+        if (conn->sioc) {
+            qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
         }
-        error_free(thr->err);
-        qapi_free_SocketAddress(thr->saddr);
-        g_free(thr);
+        error_free(conn->err);
+        qapi_free_SocketAddress(conn->saddr);
+        g_free(conn);
     }
 }
 
 static void *connect_thread_func(void *opaque)
 {
-    NBDConnectThread *thr = opaque;
+    NBDClientConnection *conn = opaque;
     int ret;
 
-    thr->sioc = qio_channel_socket_new();
+    conn->sioc = qio_channel_socket_new();
 
-    error_free(thr->err);
-    thr->err = NULL;
-    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, &thr->err);
+    error_free(conn->err);
+    conn->err = NULL;
+    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
     if (ret < 0) {
-        object_unref(OBJECT(thr->sioc));
-        thr->sioc = NULL;
+        object_unref(OBJECT(conn->sioc));
+        conn->sioc = NULL;
     }
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    assert(thr->running);
-    thr->running = false;
-    if (thr->wait_co) {
-        aio_co_wake(thr->wait_co);
-        thr->wait_co = NULL;
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
     }
 
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
-    connect_thread_state_unref(thr);
+    nbd_client_connection_unref(conn);
 
     return NULL;
 }
 
 /*
- * Get a new connection in context of @thr:
+ * Get a new connection in context of @conn:
  *   if thread is running, wait for completion
  *   if thread is already succeeded in background, and user didn't get the
  *     result, just return it now
  *   otherwise if thread is not running, start a thread and wait for completion
  */
 static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
 {
     QIOChannelSocket *sioc = NULL;
     QemuThread thread;
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
     /*
      * Don't call nbd_co_establish_connection() in several coroutines in
      * parallel. Only one call at once is supported.
      */
-    assert(!thr->wait_co);
+    assert(!conn->wait_co);
 
-    if (!thr->running) {
-        if (thr->sioc) {
+    if (!conn->running) {
+        if (conn->sioc) {
             /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&thr->sioc);
-            qemu_mutex_unlock(&thr->mutex);
+            sioc = g_steal_pointer(&conn->sioc);
+            qemu_mutex_unlock(&conn->mutex);
 
             return sioc;
         }
 
-        thr->running = true;
-        error_free(thr->err);
-        thr->err = NULL;
-        qatomic_inc(&thr->refcnt); /* for thread */
+        conn->running = true;
+        error_free(conn->err);
+        conn->err = NULL;
+        qatomic_inc(&conn->refcnt); /* for thread */
         qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
+                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
     }
 
-    thr->wait_co = qemu_coroutine_self();
+    conn->wait_co = qemu_coroutine_self();
 
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
     /*
      * We are going to wait for connect-thread finish, but
@@ -439,9 +439,9 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
      */
     qemu_coroutine_yield();
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    if (thr->running) {
+    if (conn->running) {
         /*
          * Obviously, drained section wants to start. Report the attempt as
          * failed. Still connect thread is executing in background, and its
@@ -449,12 +449,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
          */
         error_setg(errp, "Connection attempt cancelled by other operation");
     } else {
-        error_propagate(errp, thr->err);
-        thr->err = NULL;
-        sioc = g_steal_pointer(&thr->sioc);
+        error_propagate(errp, conn->err);
+        conn->err = NULL;
+        sioc = g_steal_pointer(&conn->sioc);
     }
 
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
     return sioc;
 }
@@ -465,17 +465,16 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
  * stop the thread itself neither close the socket. It just safely wakes
  * nbd_co_establish_connection() sleeping in the yield().
  */
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    if (thr->wait_co) {
-        aio_co_wake(thr->wait_co);
-        thr->wait_co = NULL;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
     }
 
-    qemu_mutex_unlock(&thr->mutex);
-
+    qemu_mutex_unlock(&conn->mutex);
 }
 
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
@@ -521,7 +520,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
-- 
2.29.2


