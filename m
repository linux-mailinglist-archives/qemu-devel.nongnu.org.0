Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD9361B48
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:26:03 +0200 (CEST)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJne-0007oK-Mg
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYA-0001WR-Kh; Fri, 16 Apr 2021 04:10:05 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:39777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY7-00087j-Kk; Fri, 16 Apr 2021 04:10:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiXTY8rWsJkrTuiCtcEFg25UY1EDGCLJXNz1zRIgThsLYPPWK647sfh9IP7nZI4Y8y1jccI79WTEeDAyteqn5e6aAFg58G2LCk0Ze5Fwxcns5VoJVEsp5FgV1Cjb0CZwzWTjcd1sck5Mv7fy5ZTqT/rc4kPzaXC9qJkGyYLtMVY/TokG5yAmBhnNBTZeVdm7XKRIupQIzbgvWSExhmttQnU0o/9EoBbv8RcZaHJC9StOF+1dW4eylZdUG5cq6SUQZPoTkV8G32ARNPm/w8Rk2wulft1YDcEzjkZf5001giiEr2YiXJBB9A7cK1JR50Eg8tV2mZJLVXGJwuovFAVjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWXfklPfTJ4QOaMqPMKb2N3YkUuS6RCwGyHUQO09/uM=;
 b=ZnuXIbiaFH6XdkPnyxv9t4b6ZFmIpWuEROueI3O5FcdKjVPbH3HUghoN0d0LhxxACYsnlSM7vc1ICE0QKf36wuB9CBVHNeyhsIKR2C9CgjYZ1h8sIy9y6OjHI2Hr00hn7Iv7+65gxhLfDh7v4I4OJOXLRh5FplaXD/wrFF0TnFUpXMShvKqFiyHH/kcPKRo0gEnEgn+hhDSNigjh+R/ZeJd3+FqzUEAOthrz5KHbnAHWCrxjB3z2r69HtEPxjIbfscbyQ/o+DSrEF0SEVNNvycvHlHcCNRwqQ7ifo8JAQ/gMmIUw7VlbxlpH+3MuJzxl4LjITz2CnCWaMs1BH1glOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWXfklPfTJ4QOaMqPMKb2N3YkUuS6RCwGyHUQO09/uM=;
 b=pMFNLBLvoDq2pDMkUFTecDkAvnnzqFdPUpk031nv1P3lEWe0sgxfaHc42cNTEKM067UfU0qMpg+6/UDWWsWiP3TIVA3lWzYzD5ErjdL7OPfhR+EUdzAdvVhqZQFeTFDKlOVLh3fO0tS8vVpWIyk1UVJB4nnb1SiVeBppQ6vsL/0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 14/33] nbd: move connection code from block/nbd to
 nbd/client-connection
Date: Fri, 16 Apr 2021 11:08:52 +0300
Message-Id: <20210416080911.83197-15-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aea21422-c5c3-43f8-19d7-08d900aeff3c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691D65EB8DDB3860A3696D4C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmQS5TrwNMNOlSJ6xXUEcPINgpoR/T24eio1NBKAjRm0pCMOhMH1qky6wtFSki1/ZHKHfIiNJRoFvKfD9PRjhbhteTQTWy/3UwCnDnnY40kPay//TlNxSxVJ7GiZ+pM8YvijSZvD9l9p87UFSjRT/rpWPzoLdTX1H+QvYubqs7PFIWqOM52X33gEJvj8/L+UC0snJZ2rsJiwV6BBuVAHfOCX7EitgPbsU4lHXoyhdvTlBKLJXQAaIfyv31D64iXFBMimYzFyaLZ1OpRSiL6Mu+oJJsvhRX6BiGrGlUPJLSZUKe8+32zTcdnnLbO4G7hU+2ME8rEaCSfwby9MdNNyeJeZ6KpAoyNUnvN4w4stYtHE5796AhEtWxm00JslSSP7LCVEP90XZNUGLjCJgNWGGKGoz6JVRuqPnXP9R6v+Mp7AXLfGBdW1zhi+1boSF/LK3HpaVRn+Gy09GnQJdeWxrpDWrKsFsyuphm/nPX2wU9rxxitpnpJFnC+3xerbK6i7UYJIqH0QLCsnMaNinZ1ADzm+1qUCwiiECu4LMUWBGHq83dnxElTiwsLlKTvpYcs4i7Xbf4UBnk8HdbsJEmPkIeSS6f4StnW7yfK2qysaMUZCO87lIWrl5ZJRhaNcHewGgxV9+GR8h3i8JhOS6I7/PmDKL4sQusGkWsXW+XXPoDLAH4RScIbphWpri37GCuJ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(30864003)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KoaOFV+TP+xd3Oz//cLUpgXU5lZMPpfI/alU+QEyEkwyCuJyP58yp7PwvkCi?=
 =?us-ascii?Q?XCX4YgeJ+0bGVr0n1daQyare02GVwUv+Mr+JXQGhkAQ2vgWOgxnAOHrxEV4j?=
 =?us-ascii?Q?hI0wtX9oN4xlVahXakYKgZN8YRp0f7CFQq22ZAZUIs/oBSJ/LmQcm/LyYZre?=
 =?us-ascii?Q?A2+BWgnIKNEDzA1YHcJsKExKT+bw+06iF6z6qPz5Zgtz1ZhU7VX2DIZSBVca?=
 =?us-ascii?Q?sE7TfMpgC9TLcfwiBXUsp7ozeuY6SsIxnyFQwQSy8EeiGF3mb6tTI2r6RsZ6?=
 =?us-ascii?Q?NGcMOQo7KWunJQ+nUWvB7wttQcTFlfwRPD519ZmAKEdozhyIz3L6AwRME3s7?=
 =?us-ascii?Q?K4Y7ken0KiLgJJluoaG1rgAb7uOI4CHOT+F8PXN6V20i5VKCsWWiPEVtMLIE?=
 =?us-ascii?Q?T6x9fcnrnmZIPl9at9CasVPNMFoBoI+Z8q6xXeJDs/di3rrVksykVgFgclsS?=
 =?us-ascii?Q?aiwOJ0tXta8aKPGP7iB5AYzgf1eupmc67dY6tZM/FJl4WbWhUNyJX5QeiECq?=
 =?us-ascii?Q?7VPTT+iT3QKJkjdtqT/lFWtWF4CR7ttyF/jOpcVjbYC024gNsjQ8jNic3+uS?=
 =?us-ascii?Q?GtofmJ8OrqBsi87EICbEXdKb6khXTrHXnJyowO3cBHs3bt1cXJWWqMaaduS9?=
 =?us-ascii?Q?1Ucgl6FTwM5tglZkxdZIYGmLtqtC7u78W1lOU4NdUD6f2E0nQwYHQ7OqNOo0?=
 =?us-ascii?Q?EPT6UDptshwgZvxCMFYnPoVdaMDpunrcSWeRnKOL/TS8V/YJvJH7tAMOYqQP?=
 =?us-ascii?Q?pWmYCXsmxr+YCGp2v540HE+TgoLBLRSF6rdjK04zFYQr2oBCOse1rgOsQiqI?=
 =?us-ascii?Q?j9FmPBh+uZxA+JjR/tcsfjTjvZJVzSu/ERqrXfZ/Idi6m3vVtz7PlXMjqibQ?=
 =?us-ascii?Q?+6q2qSw81EacgF1yOt367zcKzGY5S94rwGV8etCahQ1wolBwRL4mCsCrat5E?=
 =?us-ascii?Q?mEi5PmBO9h4quPjGXVmJt00QfyWRccEWiukwOe3To7wH6dlfFvSRLlJp708E?=
 =?us-ascii?Q?fLhN2QSYqnItZW2UEZRWf+j1uX7AS/aNLEjlhIIBxO9Qjr4aEtAznQPGBtvO?=
 =?us-ascii?Q?n5kigg1+KnXI31OC1mZlkANDDuITWzlRyDIermtGFmCnOJdgwxJE738OKn/d?=
 =?us-ascii?Q?Jsm0uBdWMf8wBQmbfIUqhsu6iGwxZh3ieAlAJOSLuSyW8AWOWOIl4Dr5mIQh?=
 =?us-ascii?Q?Bf124nhLzMc5uZkO3mr4HT9BZ048Gq4r7dZgBD4uAdis1WkMhU4rHZPy0mSk?=
 =?us-ascii?Q?fT2fuzVfpvRU9Y+Z6cH+wkwgRkk3loV8PD0LA9oJQYsbcSAfeVed4nug9+qk?=
 =?us-ascii?Q?K9r2DKeOtiYGpe+jwdJ0hEBy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea21422-c5c3-43f8-19d7-08d900aeff3c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:45.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyZ4VAlwqzEeME6GkJ+I5uBDasDavv1wnDOcfu/zWvDTm++8NNmukESrvMP4P1KbplmeyD/FifWtr/JSTEOKdZEu+nbrEMbjcTcvTgS/Rgg=
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
 include/block/nbd.h     |  11 +++
 block/nbd.c             | 187 -----------------------------------
 nbd/client-connection.c | 212 ++++++++++++++++++++++++++++++++++++++++
 nbd/meson.build         |   1 +
 4 files changed, 224 insertions(+), 187 deletions(-)
 create mode 100644 nbd/client-connection.c

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f34d23bb0..57381be76f 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
 const char *nbd_cmd_lookup(uint16_t info);
 const char *nbd_err_lookup(int err);
 
+/* nbd/client-connection.c */
+typedef struct NBDClientConnection NBDClientConnection;
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+void nbd_client_connection_release(NBDClientConnection *conn);
+
+QIOChannelSocket *coroutine_fn
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+
+void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+
 #endif
diff --git a/block/nbd.c b/block/nbd.c
index 8531d019b2..9bd68dcf10 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,24 +66,6 @@ typedef enum NBDClientState {
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
-    QemuMutex mutex;
-    /* All further fields are protected by mutex */
-    bool running; /* thread is running now */
-    bool detached; /* thread is detached and should cleanup the state */
-    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
-} NBDClientConnection;
-
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -118,12 +100,8 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void nbd_client_connection_release(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
@@ -340,171 +318,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static NBDClientConnection *
-nbd_client_connection_new(const SocketAddress *saddr)
-{
-    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
-
-    *conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, saddr),
-    };
-
-    qemu_mutex_init(&conn->mutex);
-
-    return conn;
-}
-
-static void nbd_client_connection_do_free(NBDClientConnection *conn)
-{
-    if (conn->sioc) {
-        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
-        object_unref(OBJECT(conn->sioc));
-    }
-    error_free(conn->err);
-    qapi_free_SocketAddress(conn->saddr);
-    g_free(conn);
-}
-
-static void *connect_thread_func(void *opaque)
-{
-    NBDClientConnection *conn = opaque;
-    bool do_free;
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
-        aio_co_schedule(NULL, conn->wait_co);
-        conn->wait_co = NULL;
-    }
-    do_free = conn->detached;
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (do_free) {
-        nbd_client_connection_do_free(conn);
-    }
-
-    return NULL;
-}
-
-static void nbd_client_connection_release(NBDClientConnection *conn)
-{
-    bool do_free;
-
-    if (!conn) {
-        return;
-    }
-
-    qemu_mutex_lock(&conn->mutex);
-    if (conn->running) {
-        conn->detached = true;
-    }
-    do_free = !conn->running && !conn->detached;
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (do_free) {
-        nbd_client_connection_do_free(conn);
-    }
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
-        aio_co_schedule(NULL, conn->wait_co);
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
index 0000000000..4e39a5b1af
--- /dev/null
+++ b/nbd/client-connection.c
@@ -0,0 +1,212 @@
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
+    QemuMutex mutex;
+    /* All further fields are protected by mutex */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */
+    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
+};
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+{
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
+
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
+    };
+
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
+}
+
+static void nbd_client_connection_do_free(NBDClientConnection *conn)
+{
+    if (conn->sioc) {
+        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
+        object_unref(OBJECT(conn->sioc));
+    }
+    error_free(conn->err);
+    qapi_free_SocketAddress(conn->saddr);
+    g_free(conn);
+}
+
+static void *connect_thread_func(void *opaque)
+{
+    NBDClientConnection *conn = opaque;
+    bool do_free;
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
+        aio_co_schedule(NULL, conn->wait_co);
+        conn->wait_co = NULL;
+    }
+    do_free = conn->detached;
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+
+    return NULL;
+}
+
+void nbd_client_connection_release(NBDClientConnection *conn)
+{
+    bool do_free;
+
+    if (!conn) {
+        return;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+    if (conn->running) {
+        conn->detached = true;
+    }
+    do_free = !conn->running && !conn->detached;
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
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
+        aio_co_schedule(NULL, conn->wait_co);
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


