Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BB3586D7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:17:37 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVTU-0006jm-Fn
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVNU-00088w-51; Thu, 08 Apr 2021 10:11:24 -0400
Received: from mail-eopbgr50100.outbound.protection.outlook.com
 ([40.107.5.100]:41486 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVNA-0001oo-S5; Thu, 08 Apr 2021 10:11:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntW65Nw5wI45RBmDe5dgOlmYFOGUyTiJW0dyBIK3kRdO692vY34aJbbpy8TmSnxqbaYHtljaTuATC7UjrmgCbVD0zkuUxabC/SwAyFspeElDhfkQ3m4/AHvFFjRnt2OfmjvLh59m/5P2RTzzKuISO22CfgU5QaE+JVGP6oJyKHXtTaup7x0Q6mrvc8YtRwFF4tKWrUK6a3X3vWOhkelYLHBksPDDLdV8JHsgC1MefKme3A2g/vFQJYepIYHVDIC/q0Y6rJDarzZnD+RLZSIROUC5r8OvhPNSUSNupS2viLx1IoYUBZpxUlv0fp/WYi38pns7wOuuflz6DGHR2O44Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyjiggCU26sJ1S5IHOVKe2y4Hm1r7fyh9a4JUoUYRS0=;
 b=TmgJcrIXn+1kGpiXm0y9Rj3863De4W/AdK7Pqt1KqU2OosNXUnybf4hSweiUwsnRUM4qdvz2Spf1jcGFW4Pu+Kv0MV0P+x0E8Hg8eR7zMzRV78DVWkJWJAwWT5q/vEvdxbNR6Kw7V/poLaAi81f9C2tZPhrDOTPTaNeufOywy/r2fZlm6E80zXWIjwXHHCmT1v+Uc4BhjV8kADk65bLI75RJ4IhUCDOhX3p/V3yED0IPT5qW+pDnpZDYSQvXMOET0nKPNxQ/mmcXfY1aTCXUzMyzSwN1ulQRp42+a+sRpNI0c3Coug/CvXsIt9Kcpx6A2ZkSSHqx5/sJNMQMacOAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyjiggCU26sJ1S5IHOVKe2y4Hm1r7fyh9a4JUoUYRS0=;
 b=RbBk17kvIvPMUH6p/HCZ7R7UvPTeMBL9dFff/xzymOTUf3GIU9p8ijJprVYAKJqXgCn0UntdJ7VYo+CpRdNHPMnaZPGnoC0Y6hQJohNHtDX5uCRYDZapR2irgd+zxSsXDO3pQwP+0ykIGRS0H/aJ7NJCAtvydvW4JhgS+FsMsuo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 14:08:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 10/10] nbd: move connection code from block/nbd to
 nbd/client-connection
Date: Thu,  8 Apr 2021 17:08:27 +0300
Message-Id: <20210408140827.332915-11-vsementsov@virtuozzo.com>
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
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ba393f0-a999-47c8-1141-08d8fa97d98a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5127AA53E899A09900678F00C1749@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJtkr2GmFdn6LGdjWjV/XbTri6QQIDvKeXXPlkjUv45V85wAURFHuyq/TxN1VTg7VFog/8w0CQ594idxZ+1UVykko4WHCUyRVL2qDvYfvApKL+3iuHEiR5kTWJd9hA+rC4r/EzmdddYQ6c5cCasaH8azPw64W2qqHOHwXKnTcy3zKlHQfhoMUm1eS+ebtlaeHVCpyAYD32l0KA4hOJtT0/Xt1+hS2T6s1kyMJBX9eWHWJoSuMkFuLi9yPu5nykYXAHOL/iyVwcoIXg2wCEO6zTO1mtFHbgYqI5DGfLvvdL5NP9YRe+H31gb3c5olUgcr2fv3zCVXUT9dClJgBb7s+FKWCmJ3WkdVIDuD8wzDeqrTHrSqDyVd1xv1McOJC/WWQkqW5mELP6TMnKAsR4FOX9x2kMlcaNvJtisUm6fsMXiYwQVrrgzOP4Kns7XFaWO6ACXtD0/9zq0TPg98L5G9phBQd/S8LTBsThhVivQaQ0dLL4nEF6RWhzFDvIbeXk9akJOCjpee7kXR+vtHopHqxKx2Y6ZKSgUbqq+kHegjM+/j2TvWzJcv5jsXJQALW7a6ArxI/eYsQs44tybdJHhPy7cgtEgewo0Z2SVH2IdiV0GX9EIOGKSvCJYOEGZVPnFumdYt3bGOAdZTro2RjcYuA63V2Uva+FgkFlN2yGFy/wjbkIsDephgrnlgdsKGmlIEd3L28dSiw461sLfCgiXZXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(366004)(346002)(136003)(6916009)(2906002)(38350700001)(86362001)(83380400001)(8936002)(6486002)(52116002)(5660300002)(4326008)(66946007)(66556008)(66476007)(69590400012)(36756003)(38100700001)(6666004)(6506007)(1076003)(6512007)(2616005)(8676002)(186003)(16526019)(316002)(956004)(478600001)(26005)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?451n2nhX0JTsfOcpt9/zDXov5WlMTSJM0kqP8pyheokxKrbXueyrIoCbam0J?=
 =?us-ascii?Q?/YDluB5uG/AcsTQtFXWZ99mbqqxXfdcjUezM2QC9AIu8z0cy0xAwFWIXVklZ?=
 =?us-ascii?Q?8NnLEvG+PnjflHnXBTAJPTWxJgKZ3itWCpv3nZIRbc1fjmfk+tRMH6WM0LJt?=
 =?us-ascii?Q?AVNqZKCeM9fXgPUlmqcruiUBkWVZ6cD1VGN4YQDdxfHS9jhDlJq8v/HkuXQ5?=
 =?us-ascii?Q?UmUHXTnsyXFwY1mZNcoJkImqNPLC0d8DVmBaiQZPq9+Tw8hOGIQpr6ncPFpa?=
 =?us-ascii?Q?xZ+uodkPLfudaaU5bH+wOqPCXD/bxt+aS5cPfMg+25KusI7N+P6IsudAQMT7?=
 =?us-ascii?Q?FLjcguVQ8AMGw2YXYVtpEQwZNY7xTqeetI3Cu57zYVg+czRU0fPifKu3Ye8D?=
 =?us-ascii?Q?AtO+kY05g2jatMY5+jaEm7zT3H81nmIjjwiIuxDtWoThjkwkVc4vXPyeDAi6?=
 =?us-ascii?Q?qLPmkhe2YjYTL+zEvW/EB2e+uIk1v0fs6Qclslpb/18IsVMO1ZEOuUXKQWhY?=
 =?us-ascii?Q?0IgJY7kq/D8Gcn7XFO3sBD3b0ZS5PKBMmXOSGZcHarBdQKlWJFSWlOiH803O?=
 =?us-ascii?Q?pDtXrEfzBb1GAiSfGLwybYuqd409w8LUHCR6ehvCJR9bgj599AQHYiouDmhT?=
 =?us-ascii?Q?FWnr9GlPzeYolIU+06MPPmbrSs6/kGMyAY0az6UEWywHrFhdP3lF4mNfiG0p?=
 =?us-ascii?Q?z3oOPcNI6b8uqB7jJAtnOQh8r9/te0FzW1BREFT71gd3qijFA74BjyA9CMGv?=
 =?us-ascii?Q?m1hzW1v1rQjepPwTY3kLCaG2oelrqy1KAtrGcKK7EsdMDFF5ubPvUcvE4bpJ?=
 =?us-ascii?Q?lzAHAhfrkHBbbT4WRHHsGi9uZYaRqXM+h7GayDokm8/ogWmlj0Zk5T0WCYbD?=
 =?us-ascii?Q?TLScb25i8GZFNExdhMQYESafCqHV4rI9NViDQWO3jUk7gvoCaUYFQohblBSS?=
 =?us-ascii?Q?i1AJEtngRhWdwymgHlITfYzZcyosr7DTyd7yXXPSNp9pzhK+6wGi8AIs1oxl?=
 =?us-ascii?Q?3FgNIP02/UXL5wBfuVbaY8M8H1Lsd9FSj0pMWSYPb7cgTfq+9xMsXO3/3G5K?=
 =?us-ascii?Q?nSAPatXW4NWvfciBuO5gNt67D8xnFNGKjtZCzcJ3SnEeMbRswRxFuHwpfVNP?=
 =?us-ascii?Q?PfdE5wBguMIh6uATuUXLqNOqRbmitODgg3ulYWUyItVGb7lI7BV4gBQuKeLu?=
 =?us-ascii?Q?T/NwiAB++x1d+SgLEJtNuNq+q4rwNTUgbB/dCGaU+hwr5rAF7oFCGHBprAN9?=
 =?us-ascii?Q?znOCayUxtto0kZQd9uBT6ieP0Uo1L1o3hcqE4RiTLYCsHv/5EdE1TvQ4ILVo?=
 =?us-ascii?Q?0hKRtazoEsPlzgQhZqPT5516?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba393f0-a999-47c8-1141-08d8fa97d98a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:57.1437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMCAS7v8MnCRMiV4XzsT5cV2+ogP0CgXLEVSU8/8QKwVEzWqWxcY1A81Rx0WyrI72UqXT3sjWBduLMDRMX8HnQyifFDlg9UgnrulziGnPLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.5.100;
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

We now have bs-independent connection API, which consists of four
functions:

  nbd_client_connection_new()
  nbd_client_connection_unref()
  nbd_co_establish_connection()
  nbd_co_establish_connection_cancel()

Move them to a separate file together with NBDClientConnection
structure which becomes private to the new API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hmm. I keep only Virtuozzo's copyright in a new file, as actually I've
developed nbd-reconnection code. Still probably safer to save all
copyrights. Let me now if you think so and I'll add them.

 include/block/nbd.h     |  11 +++
 block/nbd.c             | 167 ----------------------------------
 nbd/client-connection.c | 192 ++++++++++++++++++++++++++++++++++++++++
 nbd/meson.build         |   1 +
 4 files changed, 204 insertions(+), 167 deletions(-)
 create mode 100644 nbd/client-connection.c

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f34d23bb0..d4666b105e 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
 const char *nbd_cmd_lookup(uint16_t info);
 const char *nbd_err_lookup(int err);
 
+/* nbd/client-connection.c */
+typedef struct NBDClientConnection NBDClientConnection;
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+void nbd_client_connection_unref(NBDClientConnection *conn);
+
+QIOChannelSocket *coroutine_fn
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+
+void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+
 #endif
diff --git a/block/nbd.c b/block/nbd.c
index 376ab9f92d..1db86b7340 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,25 +66,6 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct NBDClientConnection {
-    /* Initialization constants */
-    SocketAddress *saddr; /* address to connect to */
-
-    /*
-     * Result of last attempt. Valid in FAIL and SUCCESS states.
-     * If you want to steal error, don't forget to set pointer to NULL.
-     */
-    QIOChannelSocket *sioc;
-    Error *err;
-
-    int refcnt; /* atomic access */
-
-    QemuMutex mutex;
-    /* All further fields are protected by mutex */
-    bool running; /* thread is running now */
-    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
-} NBDClientConnection;
-
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -119,12 +100,8 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void nbd_client_connection_unref(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
@@ -336,150 +313,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static NBDClientConnection *
-nbd_client_connection_new(const SocketAddress *saddr)
-{
-    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
-
-    *conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, saddr),
-        .refcnt = 1,
-    };
-
-    qemu_mutex_init(&conn->mutex);
-
-    return conn;
-}
-
-static void nbd_client_connection_unref(NBDClientConnection *conn)
-{
-    if (qatomic_dec_fetch(&conn->refcnt) == 0) {
-        if (conn->sioc) {
-            qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
-        }
-        error_free(conn->err);
-        qapi_free_SocketAddress(conn->saddr);
-        g_free(conn);
-    }
-}
-
-static void *connect_thread_func(void *opaque)
-{
-    NBDClientConnection *conn = opaque;
-    int ret;
-
-    conn->sioc = qio_channel_socket_new();
-
-    error_free(conn->err);
-    conn->err = NULL;
-    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
-    if (ret < 0) {
-        object_unref(OBJECT(conn->sioc));
-        conn->sioc = NULL;
-    }
-
-    qemu_mutex_lock(&conn->mutex);
-
-    assert(conn->running);
-    conn->running = false;
-    if (conn->wait_co) {
-        aio_co_wake(conn->wait_co);
-        conn->wait_co = NULL;
-    }
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    nbd_client_connection_unref(conn);
-
-    return NULL;
-}
-
-/*
- * Get a new connection in context of @conn:
- *   if thread is running, wait for completion
- *   if thread is already succeeded in background, and user didn't get the
- *     result, just return it now
- *   otherwise if thread is not running, start a thread and wait for completion
- */
-static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
-{
-    QIOChannelSocket *sioc = NULL;
-    QemuThread thread;
-
-    qemu_mutex_lock(&conn->mutex);
-
-    /*
-     * Don't call nbd_co_establish_connection() in several coroutines in
-     * parallel. Only one call at once is supported.
-     */
-    assert(!conn->wait_co);
-
-    if (!conn->running) {
-        if (conn->sioc) {
-            /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&conn->sioc);
-            qemu_mutex_unlock(&conn->mutex);
-
-            return sioc;
-        }
-
-        conn->running = true;
-        error_free(conn->err);
-        conn->err = NULL;
-        qatomic_inc(&conn->refcnt); /* for thread */
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
-    }
-
-    conn->wait_co = qemu_coroutine_self();
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    /*
-     * We are going to wait for connect-thread finish, but
-     * nbd_co_establish_connection_cancel() can interrupt.
-     */
-    qemu_coroutine_yield();
-
-    qemu_mutex_lock(&conn->mutex);
-
-    if (conn->running) {
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        error_setg(errp, "Connection attempt cancelled by other operation");
-    } else {
-        error_propagate(errp, conn->err);
-        conn->err = NULL;
-        sioc = g_steal_pointer(&conn->sioc);
-    }
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    return sioc;
-}
-
-/*
- * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
- * stop the thread itself neither close the socket. It just safely wakes
- * nbd_co_establish_connection() sleeping in the yield().
- */
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
-{
-    qemu_mutex_lock(&conn->mutex);
-
-    if (conn->wait_co) {
-        aio_co_wake(conn->wait_co);
-        conn->wait_co = NULL;
-    }
-
-    qemu_mutex_unlock(&conn->mutex);
-}
-
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
new file mode 100644
index 0000000000..f7000f7ee6
--- /dev/null
+++ b/nbd/client-connection.c
@@ -0,0 +1,192 @@
+/*
+ * QEMU Block driver for  NBD
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+#include "block/nbd.h"
+
+#include "qapi/qapi-visit-sockets.h"
+#include "qapi/clone-visitor.h"
+
+struct NBDClientConnection {
+    /* Initialization constants */
+    SocketAddress *saddr; /* address to connect to */
+
+    /*
+     * Result of last attempt. Valid in FAIL and SUCCESS states.
+     * If you want to steal error, don't forget to set pointer to NULL.
+     */
+    QIOChannelSocket *sioc;
+    Error *err;
+
+    int refcnt; /* atomic access */
+
+    QemuMutex mutex;
+    /* All further fields are protected by mutex */
+    bool running; /* thread is running now */
+    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
+};
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+{
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
+
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
+        .refcnt = 1,
+    };
+
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
+}
+
+void nbd_client_connection_unref(NBDClientConnection *conn)
+{
+    if (qatomic_dec_fetch(&conn->refcnt) == 0) {
+        if (conn->sioc) {
+            qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
+        }
+        error_free(conn->err);
+        qapi_free_SocketAddress(conn->saddr);
+        g_free(conn);
+    }
+}
+
+static void *connect_thread_func(void *opaque)
+{
+    NBDClientConnection *conn = opaque;
+    int ret;
+
+    conn->sioc = qio_channel_socket_new();
+
+    error_free(conn->err);
+    conn->err = NULL;
+    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
+    if (ret < 0) {
+        object_unref(OBJECT(conn->sioc));
+        conn->sioc = NULL;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
+    }
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    nbd_client_connection_unref(conn);
+
+    return NULL;
+}
+
+/*
+ * Get a new connection in context of @conn:
+ *   if thread is running, wait for completion
+ *   if thread is already succeeded in background, and user didn't get the
+ *     result, just return it now
+ *   otherwise if thread is not running, start a thread and wait for completion
+ */
+QIOChannelSocket *coroutine_fn
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
+{
+    QIOChannelSocket *sioc = NULL;
+    QemuThread thread;
+
+    qemu_mutex_lock(&conn->mutex);
+
+    /*
+     * Don't call nbd_co_establish_connection() in several coroutines in
+     * parallel. Only one call at once is supported.
+     */
+    assert(!conn->wait_co);
+
+    if (!conn->running) {
+        if (conn->sioc) {
+            /* Previous attempt finally succeeded in background */
+            sioc = g_steal_pointer(&conn->sioc);
+            qemu_mutex_unlock(&conn->mutex);
+
+            return sioc;
+        }
+
+        conn->running = true;
+        error_free(conn->err);
+        conn->err = NULL;
+        qatomic_inc(&conn->refcnt); /* for thread */
+        qemu_thread_create(&thread, "nbd-connect",
+                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
+    }
+
+    conn->wait_co = qemu_coroutine_self();
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    /*
+     * We are going to wait for connect-thread finish, but
+     * nbd_co_establish_connection_cancel() can interrupt.
+     */
+    qemu_coroutine_yield();
+
+    qemu_mutex_lock(&conn->mutex);
+
+    if (conn->running) {
+        /*
+         * Obviously, drained section wants to start. Report the attempt as
+         * failed. Still connect thread is executing in background, and its
+         * result may be used for next connection attempt.
+         */
+        error_setg(errp, "Connection attempt cancelled by other operation");
+    } else {
+        error_propagate(errp, conn->err);
+        conn->err = NULL;
+        sioc = g_steal_pointer(&conn->sioc);
+    }
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    return sioc;
+}
+
+/*
+ * nbd_co_establish_connection_cancel
+ * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
+ * stop the thread itself neither close the socket. It just safely wakes
+ * nbd_co_establish_connection() sleeping in the yield().
+ */
+void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
+{
+    qemu_mutex_lock(&conn->mutex);
+
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
+    }
+
+    qemu_mutex_unlock(&conn->mutex);
+}
diff --git a/nbd/meson.build b/nbd/meson.build
index 2baaa36948..b26d70565e 100644
--- a/nbd/meson.build
+++ b/nbd/meson.build
@@ -1,5 +1,6 @@
 block_ss.add(files(
   'client.c',
+  'client-connection.c',
   'common.c',
 ))
 blockdev_ss.add(files(
-- 
2.29.2


