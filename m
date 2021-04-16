Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5532361B3B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:19:34 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJhN-0005Vq-PS
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY6-0001Qs-WB; Fri, 16 Apr 2021 04:09:59 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:39777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY4-00087j-6t; Fri, 16 Apr 2021 04:09:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKuSMuEcqCCFzqLNvecWmRncQIMf27JT8nn7H2YI4TUpDe/W6YBHXEvc42+7luXmRf9k0wJQ+z7zwszgtleW1GwGTl7rqcMkUutStlHvmt+Aa0AxeM9V3UzTVt1gMJjEWhFPK7NvJ0L2F4NZnTyKI42ZU3uxzmNmgXiclapZ4IOo4sjEnNYY73z8Mg9eW7jG7ZtBohHD3eGPDIYFanv3ciL36Cb3SksIbKbsHNmmOmln4qA7hhTPlbHgBW9KWHoSO+M08k9piEnaFZNEQWdEwi2LwEd0LqenxOcWxgJHVJi76tZBGH9dcVZN2ACgXz/jBeWF17V/rFaJeKFIfgBR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u8wbFiEu6QXR4/9V/lBrL/to7ALkbC0wv1rMvfxmUE=;
 b=neB7KwFGhWhzFLnykiMappclo/LhIOanl3k2GVBN8LSxDSkziz9I0f+xQPzomVmOy8+PTmlaiC/F0ChW4SqN+FbZcqhF39Lg7qrkZt6Ah97dVT/SW58/KYLhtd8qFE73ZzZ34bzDIHHzOSt6HP8b+kIfTizpsvTQSNfCezvzP7iwqfFX9YrARGdS9nhgJFWk+Xq+d9GrHVvGMnAd6I7KM24Pe0DZyeo3+nIE3X/NtWt/in0KTQu3bB2p6ShOpvnjCY8GGd0oYRcJQgnCg1SOyLj6eKfOIpqyexZE8OnBJGgdOREpV1CYq8eYLSbJWAFhneB6LyWSZu5y4oonD8VK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u8wbFiEu6QXR4/9V/lBrL/to7ALkbC0wv1rMvfxmUE=;
 b=eZYUr7mgAox116hjbVHh56mwQ/GaqK3MPYShWHwE11MeuVFNTQ21NvXHurhwIQUcQru+gMB7w4j8qD2K0++aoK5OXrMs6q/QW6icE6/+Fy4jvmlWiHgHn77bJt/gkJnqcIrBoW49sbSS3lbQieOYzRt/myo4Jbjh4tuvK/FOnzU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 11/33] block/nbd: rename NBDConnectThread to
 NBDClientConnection
Date: Fri, 16 Apr 2021 11:08:49 +0300
Message-Id: <20210416080911.83197-12-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 554904be-3b49-4362-121f-08d900aefcc1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46910FA0758340495F3BD02AC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3cDtyCTfkEBYMBT6Gs5yy65yPiiFvOrOzxXYG6Uydw7tDHc8SxbOE5pVA9yfSUVNgTcP/eUZSZ2snYZYYOwbJzdo5h+bWAjN5y5QHZX5Wisr7MsoR8zsUODZrxibnDWSccLMTJx3MMWsbRoNNwtmHMRpZeq+/0wm32qyyT7w0scadzNzWxuferud3KYVgwkyPB/+Xl9UmPSS5NpbwYb4bDh4kvtMMw7cZ6uU+w6xlP+qix2p2ZXLKKxe0ctUrr8WkA/oj4BP5tEpDF+zsvmfS2UffALzi727IJPgplFRaZuIMxcozhEVYROKRG9dQpsBzJeV9um3byxxraGsPYXpdPNkCVyDDmilNqJgBGfkz6UKz0tCPFXcH726Qo5cyUHpXynK31RT2LAZbS59SEq9eBkmrws3KUbcdcbgwA3FrwKPv8rZOaaos76k+zvENJvtNBl6q4+dfIBHg10IdocLj8l57J0R1iffiOpIlr0RkGh/YkkXaqfPzaVlAreZ7lSMAUkKW3DiB08HCr76lV5SlLAt944jnYprL+SDgFjWDQ+Zor7k2WlLH24mPwInBmsfy0Or9haZfvRgOb+onekYbCLbcmNnjfbKOmhz5M52b7UBS8CF2XTyI2ooFoS2iK554I05TUCw/E5Q9S7GldriSyxZJyDPgccF4PN3DtGDVXF7GmgWRKBDkiAx4f7b+NO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fzROfTE5a9pJr/La7vRI3KvdbdC5hzb9UuyadYYvOz8vCiItY413up8v9z+/?=
 =?us-ascii?Q?9uJ1Ws4Egh70LAmylgmgvJKPQPEDRecNC+A+4n4H17dwNJfKKyVJjVZj48h/?=
 =?us-ascii?Q?LBYpat74Ic8E5UIOBCtyM9+gzF7eI4tfUSxbZhxeD9XYuA7ecyFv5DqZYWOF?=
 =?us-ascii?Q?0h23l+PLvEquKkhThHNDNdCg6X6hvHhPW7ppClMlgYJYbhpla6e+P04Y7a77?=
 =?us-ascii?Q?iI4Lzc8+1iGypYH54lgF+7289+o+pV8LtRDcmSj0/0Me9LLg9Hu+23X0CcPc?=
 =?us-ascii?Q?NmOS4SM/VJ3oJxfhsS/erMqwlzHw01Wnm1SCW+mmn7FHril0CufL80WGs3nj?=
 =?us-ascii?Q?hUCs9yFakwNha1Tw7pjd0smtTsE7rrilVyqrcvf3ozo0s4DhTeTehxA6RGQU?=
 =?us-ascii?Q?7XX/ZgJW/fh+irOQnQFaeh/aqMX19MfqadCItmASlOevUcWXQJ2MYWU5xqtx?=
 =?us-ascii?Q?yHeSqMiPArTtuSYmx9kR4mq792HW9UUCnIhBUryBKupTFPnlocmde0H9N4Nl?=
 =?us-ascii?Q?iuIV62kntKRk84pgrVxl26oibZxFgIT6ECnRQGRAEIfh7M7eKGi2kG+bNY46?=
 =?us-ascii?Q?1TK6dN63sLV1WvruwVwJsCNobJqbbvxfWaLjNsNw75DMIE/n5PQ6TlG0AT8y?=
 =?us-ascii?Q?TRI/ek1s3ICdNdeR+tNv/dgXP7agDGRNZEq7HZpGNbahqmeooG31B0UIHB54?=
 =?us-ascii?Q?iqL5BH9AoD+o5cCKzo/Hxvv4cLMjQ+Ynmy3skjjWEmTBbY8SkfO8R0LDThnh?=
 =?us-ascii?Q?1ydqWhIIw8mBfc02DauG67oF7T5l3+t7U5v568SKKUF7ILWTfSu+jwTc801U?=
 =?us-ascii?Q?Mx8/nRKMpYxTqPKHIkzwbCNCKcgXyb2/anrG6t3oWsse62G20afHuTxja8In?=
 =?us-ascii?Q?j+cajhQarCwjQzywDtqh7M4b7ZCDzzNHjiX/6J/3/Z99PUCJe3MaIMCj2GFM?=
 =?us-ascii?Q?bGtxXTaAscBQnqSZgpScNQyWPbnDWmRZIsNRIGIDdVahZa+gmQVtRmGnDZVq?=
 =?us-ascii?Q?siZDmlVr9kZVlDV6nuX8aYb3XLyLKoXr0p10q+JQZtYs2odQIX6A3Wl+JwOa?=
 =?us-ascii?Q?Ys9Svu3wKKuzRFrahAs2RtnPuE5NHdeLxzQHpokL1FD2lmNqRF7mcw6vEHmF?=
 =?us-ascii?Q?5IybopZN/MhDl+hzmeESJ7dIYTgQ/i/gI76MAx13waLDa+l95xbjoc4+U6pZ?=
 =?us-ascii?Q?h5HO2VYgZqYsoAkzDHDTglcbLtSPDtQu2pVwvBZCkTHu9wBs68EPtetvrnOS?=
 =?us-ascii?Q?wkBtAjmli9u1yoxgXmMLYbZWlP0hWpaD5ufQm8iEKTjWoGdGcVLwFXtG0+Pt?=
 =?us-ascii?Q?6wXasKVx8f5b1CcNJoCqURwc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554904be-3b49-4362-121f-08d900aefcc1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:41.6916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6prt5BJaKA+q9kNGFP6MdBQ8HCzpdwlEuceYf5UNoibPAStIXzsTdfW2di3xkVY8ZuJCVMbcxQKzj60PvpQYz8BwW1m6fpfi1Fuidja9JrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.107;
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

We are going to move connection code to own file and want clear names
and APIs.

The structure is shared between user and (possibly) several runs of
connect-thread. So it's wrong to call it "thread". Let's rename to
something more generic.

Appropriately rename connect_thread and thr variables to conn.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 137 ++++++++++++++++++++++++++--------------------------
 1 file changed, 68 insertions(+), 69 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index dab73bdf3b..9ce6a323eb 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,7 +66,7 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct NBDConnectThread {
+typedef struct NBDClientConnection {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
 
@@ -82,7 +82,7 @@ typedef struct NBDConnectThread {
     bool running; /* thread is running now */
     bool detached; /* thread is detached and should cleanup the state */
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
-} NBDConnectThread;
+} NBDClientConnection;
 
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
@@ -115,34 +115,34 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    NBDConnectThread *connect_thread;
+    NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void nbd_free_connect_thread(NBDConnectThread *thr);
+static void nbd_free_connect_thread(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
+    NBDClientConnection *conn = s->conn;
     bool do_free;
 
-    qemu_mutex_lock(&thr->mutex);
-    if (thr->running) {
-        thr->detached = true;
+    qemu_mutex_lock(&conn->mutex);
+    if (conn->running) {
+        conn->detached = true;
     }
-    do_free = !thr->running && !thr->detached;
-    qemu_mutex_unlock(&thr->mutex);
+    do_free = !conn->running && !conn->detached;
+    qemu_mutex_unlock(&conn->mutex);
 
     /* the runaway thread will clean it up itself */
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        nbd_free_connect_thread(conn);
     }
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
@@ -286,7 +286,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(s->connect_thread);
+    nbd_co_establish_connection_cancel(s->conn);
 
     reconnect_delay_timer_del(s);
 
@@ -326,7 +326,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(s->connect_thread);
+        nbd_co_establish_connection_cancel(s->conn);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -353,101 +353,101 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
 
 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
-    s->connect_thread = g_new(NBDConnectThread, 1);
+    s->conn = g_new(NBDClientConnection, 1);
 
-    *s->connect_thread = (NBDConnectThread) {
+    *s->conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
     };
 
-    qemu_mutex_init(&s->connect_thread->mutex);
+    qemu_mutex_init(&s->conn->mutex);
 }
 
-static void nbd_free_connect_thread(NBDConnectThread *thr)
+static void nbd_free_connect_thread(NBDClientConnection *conn)
 {
-    if (thr->sioc) {
-        qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
-        object_unref(OBJECT(thr->sioc));
+    if (conn->sioc) {
+        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
+        object_unref(OBJECT(conn->sioc));
     }
-    error_free(thr->err);
-    qapi_free_SocketAddress(thr->saddr);
-    g_free(thr);
+    error_free(conn->err);
+    qapi_free_SocketAddress(conn->saddr);
+    g_free(conn);
 }
 
 static void *connect_thread_func(void *opaque)
 {
-    NBDConnectThread *thr = opaque;
+    NBDClientConnection *conn = opaque;
     int ret;
     bool do_free = false;
 
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
-        aio_co_schedule(NULL, thr->wait_co);
-        thr->wait_co = NULL;
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_schedule(NULL, conn->wait_co);
+        conn->wait_co = NULL;
     }
-    do_free = thr->detached;
+    do_free = conn->detached;
 
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        nbd_free_connect_thread(conn);
     }
 
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
+        conn->running = true;
+        error_free(conn->err);
+        conn->err = NULL;
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
@@ -455,9 +455,9 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
      */
     qemu_coroutine_yield();
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    if (thr->running) {
+    if (conn->running) {
         /*
          * Obviously, drained section wants to start. Report the attempt as
          * failed. Still connect thread is executing in background, and its
@@ -465,12 +465,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
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
@@ -481,17 +481,16 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
  * stop the thread itself neither close the socket. It just safely wakes
  * nbd_co_establish_connection() sleeping in the yield().
  */
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    if (thr->wait_co) {
-        aio_co_schedule(NULL, thr->wait_co);
-        thr->wait_co = NULL;
+    if (conn->wait_co) {
+        aio_co_schedule(NULL, conn->wait_co);
+        conn->wait_co = NULL;
     }
 
-    qemu_mutex_unlock(&thr->mutex);
-
+    qemu_mutex_unlock(&conn->mutex);
 }
 
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
@@ -537,7 +536,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
-- 
2.29.2


