Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3A3A294E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:24:43 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHrd-0005b0-Th
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcd-0005XH-9p; Thu, 10 Jun 2021 06:09:11 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62941 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcZ-00058S-DV; Thu, 10 Jun 2021 06:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMv8e47ZujOZxJYKan9Ml0zBCum5ay7WKW8zrM+dMJ4W6BbOYxGawRJs4RGyTZ+seKDoU+ZghThjVKmXXyByFFFVsK1snWwlkLp7Q4WRcuJ7UwiQXgEKHsrVLrynyLxHJmvpstkl24YMCUkIiMuyOC3O4ibSNmDK89h4f1W9gjbH395PvYGzgog7+zTK6NJxv6X4wfT5CoxIT49uv9CN8rbVp9tMTZI5UOkj7378zIxJ2VaBde0HZ38LHSIEWfomg/jQhidBfW7teFxfbtE5g5SsB96KjL6XPzNXOvl9VZWczXwwFRrE2gmdBtD8nhooJmBd1zv0XHtQy5UNMkN6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUWCcFPP+WFX9JPlDLXCdRQOGbTi+FlvG0pYsiWQRs8=;
 b=NJeLf9HQb8qZIns3FOyx1ZA7aOf+2kP5LkDbDi+Rq03FTPTOyUHYxZevomXU7e0h8KRGpCDSgnaEVoFciOW5LImkl/KansxCX7qZ93KszEAiX2/afOBJqQkADuYWhaLEuNcifwP7bzTztCHZuxjUGSEFQjCGFQTv1WuBGz+VSF62liI/uImjHI8QGHrKf7DgWgYT0oFFrDoJ+m6SPP/qqbeK21AUROoRc3p/MH6i9+2gcgjde7OEzspQZf00v3afQroq1QT+NY2M4hj5h/Fmm59wbqKLLNGUWnrzmOvjpz1kog2iOzus5DXA+kzaPBOgkDsrvKQjgaXkf4tGTGnU5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUWCcFPP+WFX9JPlDLXCdRQOGbTi+FlvG0pYsiWQRs8=;
 b=SCRGafQVqSWhn05QzmBZA4M8xwOyaus9TKV/vAwHRL2vUMMClJxD1JdIZCH0vb/X6plo957/iU6rV/ErU2Maj5XIG5AumjXDLbB3GDyIM74by+QDSOfGlxqNFNBiMC2wNbeVrsgPszDXgC1239NxX/0ttYM1q7yGfP5yBY/1tEo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 17/32] nbd: move connection code from block/nbd to
 nbd/client-connection
Date: Thu, 10 Jun 2021 13:07:47 +0300
Message-Id: <20210610100802.5888-18-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64297251-90f0-4d9c-71a3-08d92bf7c723
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6790D96A5D443B2298AB4D05C1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B9y7wnJ/g5rwADJY9ire5669Hhn2sNmfr4AL59HdoGpZtPQTtLOwksKEuBjMl5xcNc60TJFelHlFScPvlIthAmY056/ouu65pfqtWeIL+LZD2qGgSLlqlODOFtGRTyuGUC5mZq17jqVv+gV9934sGYa6v0gSsahkEnB8BlnDt7O132pNkFduEgzgLuYOS30zRCDZkbfp6BhOD8yGFJzT/FgXr4efbFgHqRfucUdXNC6N+5zqrNfGjOOo5qX+1dw6jdnFBsTK0wkrfqbzS1laLwrLM0Kma8HAl1InB8lvPGkdxZrM/DBMj+2sKQ4Zss/3mePgKlKDYban9ZQC/JL7CMNAgF4kxC97aCKLeq82Iws6qzeY8d0NWOeI6HD/e5vTEZjUtcr1y74y/rLSLo+Svn1dnzb2X/1qkBJnKV4CVrmN3dwhdt3Y1HkeawizTxWpST+9yewOg6VCrNmc6MB+r8E2jh11yR+3NVekl1aOUuwXRRO/IfPd7izYE1QVgw2FKkeT69OjNBTCWjaHLp0x8h7F+JIZ9rOxKPWWrd1gASWwWyGLearYROs7wtxKOoO+N2qvOukcnInHdk3WAPrIS3DW/eZLUoiTqwJD8zfELrUhH+T+CkCFxBwngw+omVopwi8xXrDYFmcdAUYP5szR5M2E8Wic/POl91uuf7L6vjgdXnP4SYKcxNvJgA14jVi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(30864003)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?h5k8CS57OuOZJMruopr9JA1jFgDJJD7u3xyIcTvDCvDF18Ui3BeEY4PPsF0B?=
 =?us-ascii?Q?mtRuotaPAO6ZPBUBdqr0CUNzmI2Gh2w+5sNQLv6lQwXihhyMTE7RrxH43uDT?=
 =?us-ascii?Q?EwiGQRWWtG1BEswP/9fH7yq0i5+302m6qHdHaQUGke+niyJcGQWzwJXinX9c?=
 =?us-ascii?Q?+XQJ3lRk/oiQNosIHBYyS4sSq0/ZL51IjjiFqlNpAyKo4vJuYNmAJyxGy5JJ?=
 =?us-ascii?Q?ygbpuXLxQpkzqQFDId0C8BRYLEBmfWPbskAsbHjeER2dYkjrsG6uWOfpyEKn?=
 =?us-ascii?Q?3uncdZ1DSD2Lk8Y9mVsaUUAF5VFc+m47mtGEyvdLstRA1vN6xa+hDCDrwW/w?=
 =?us-ascii?Q?xHN93dphF6qYodt9RFEPf8E+B0KW7vT6jIqufsyZY1xXJMouMyDVXlItq8rA?=
 =?us-ascii?Q?5C6VMGjRT6v/hVm+x6TDrplUwO+fjtkwcBM+1IvPgO1taYqvFidLWPga2VPd?=
 =?us-ascii?Q?j8U1e1mXHGRi4eobm1TH/mqcG5X+GNg4TQHPAa5FWzn1NQU6WAN+le44qnW3?=
 =?us-ascii?Q?Zi/Y5V9jIZHJ/Yi9rBL9CkmZ1qqkyLuhWa0cPN8rdvyAP6cDagaYdFhBlZZm?=
 =?us-ascii?Q?q6xL00YiDl7185lJidUypCAZUkU4sXATRzFjTWBcwIfVekJbe7N5ZnIEwvT5?=
 =?us-ascii?Q?LDuIYGD679d7GH3TV9yAnXxkZk6WdaUj6tIDnBxbAwxcvG9xzUk5pE8S94hj?=
 =?us-ascii?Q?IkPQ88oS/pohDDGeJa/X7tRiy70lOP6qXDx0jPg9+tz9LVfXYvwgU4xUuF/D?=
 =?us-ascii?Q?IHmD9PdnDL+RlazBVSJudbZvLyx2tj40Fkrp8mwCiMZ/T9j8LIVfqBbrK8Mt?=
 =?us-ascii?Q?UwlNDN95ISMIuGETUT03F1lIK56yVL1BpQIKHjs+gQe2MxIX0omufG9lBTbh?=
 =?us-ascii?Q?EdFQ4eTiTbiiMEZHYbsZrefuRE64NLT31v3NAgHEYT1BZ44Awo+YAxSNUpHJ?=
 =?us-ascii?Q?MWV5GLtXzIHbCKTvz3uhBQGDFkQ4arY1J+B83JGZOLWDwigZck/V44HTeRKq?=
 =?us-ascii?Q?7hwTls6hb1T+JNk35w8PwhjD+1FghccXnJPB3lTu+zR+nTLlD+A8jwpwj+Ye?=
 =?us-ascii?Q?C48ZzOBVjBDgQeJ+e9CZCv8BgiWNzp6YpeDdATamT1VHAyCp4DJge0hNvGDq?=
 =?us-ascii?Q?yDNdHDGNOTDOXCHu8floIwZPK0FrtlTMBWl7drG7YTBrdGQYFb973lGqzXrM?=
 =?us-ascii?Q?HMeFqBgTj3zd/fiDa2BCYEl19E+wcVO9AGDJL93qET863rEZvP2DvrIH21fF?=
 =?us-ascii?Q?Z2k4w/YMt5fT56qebHzBxe5u2FplQ6m+zcmPpu1y8jGfGGUiSxZ7FWiWQl9q?=
 =?us-ascii?Q?cW7wTVxH9sIxr+PFdAncraJq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64297251-90f0-4d9c-71a3-08d92bf7c723
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:04.9393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLAIQ2FiZO17txtxL25Or8OTzPsAjXPCGm2QnBJ/bzF6/NG4Jlrbik6vy1eONfTR8kWGyAueFq2yO5/L0F6cYXnn98GzF0yL0I9HWNpgqKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We now have bs-independent connection API, which consists of four
functions:

  nbd_client_connection_new()
  nbd_client_connection_release()
  nbd_co_establish_connection()
  nbd_co_establish_connection_cancel()

Move them to a separate file together with NBDClientConnection
structure which becomes private to the new API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |  11 ++
 block/nbd.c             | 206 -----------------------------------
 nbd/client-connection.c | 231 ++++++++++++++++++++++++++++++++++++++++
 nbd/meson.build         |   1 +
 4 files changed, 243 insertions(+), 206 deletions(-)
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
index b34957e464..26914509f1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,32 +66,6 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct NBDClientConnection {
-    /* Initialization constants */
-    SocketAddress *saddr; /* address to connect to */
-
-    QemuMutex mutex;
-
-    /*
-     * @sioc and @err present a result of connection attempt.
-     * While running is true, they are used only by thread, mutex locking is not
-     * needed. When thread is finished nbd_co_establish_connection steal these
-     * pointers under mutex.
-     */
-    QIOChannelSocket *sioc;
-    Error *err;
-
-    /* All further fields are accessed only under mutex */
-    bool running; /* thread is running now */
-    bool detached; /* thread is detached and should cleanup the state */
-
-    /*
-     * wait_co: if non-NULL, which coroutine to wake in
-     * nbd_co_establish_connection() after yield()
-     */
-    Coroutine *wait_co;
-} NBDClientConnection;
-
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -126,12 +100,8 @@ typedef struct BDRVNBDState {
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
 
@@ -344,182 +314,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
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
-    int ret;
-    bool do_free;
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
-    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
-
-    qemu_mutex_lock(&conn->mutex);
-
-    assert(conn->running);
-    conn->running = false;
-    if (conn->wait_co) {
-        aio_co_wake(conn->wait_co);
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
-    bool do_free = false;
-
-    if (!conn) {
-        return;
-    }
-
-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
-    }
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (do_free) {
-        nbd_client_connection_do_free(conn);
-    }
-}
-
-/*
- * Get a new connection in context of @conn:
- *   if the thread is running, wait for completion
- *   if the thread already succeeded in the background, and user didn't get the
- *     result, just return it now
- *   otherwise the thread is not running, so start a thread and wait for
- *     completion
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
-         * The connection attempt was canceled and the coroutine resumed
-         * before the connection thread finished its job.  Report the
-         * attempt as failed, but leave the connection thread running,
-         * to reuse it for the next connection attempt.
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
- * Cancel nbd_co_establish_connection() asynchronously.
- *
- * Note that this function neither directly stops the thread nor closes the
- * socket, but rather safely wakes nbd_co_establish_connection() which is
- * sleeping in yield()
- */
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
-{
-    Coroutine *wait_co;
-
-    qemu_mutex_lock(&conn->mutex);
-
-    wait_co = g_steal_pointer(&conn->wait_co);
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (wait_co) {
-        aio_co_wake(wait_co);
-    }
-}
-
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
new file mode 100644
index 0000000000..31a129bf11
--- /dev/null
+++ b/nbd/client-connection.c
@@ -0,0 +1,231 @@
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
+    QemuMutex mutex;
+
+    /*
+     * @sioc and @err present a result of connection attempt.
+     * While running is true, they are used only by thread, mutex locking is not
+     * needed. When thread is finished nbd_co_establish_connection steal these
+     * pointers under mutex.
+     */
+    QIOChannelSocket *sioc;
+    Error *err;
+
+    /* All further fields are accessed only under mutex */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */
+
+    /*
+     * wait_co: if non-NULL, which coroutine to wake in
+     * nbd_co_establish_connection() after yield()
+     */
+    Coroutine *wait_co;
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
+    int ret;
+    bool do_free;
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
+    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
+
+    qemu_mutex_lock(&conn->mutex);
+
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
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
+    bool do_free = false;
+
+    if (!conn) {
+        return;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+    assert(!conn->detached);
+    if (conn->running) {
+        conn->detached = true;
+    } else {
+        do_free = true;
+    }
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+}
+
+/*
+ * Get a new connection in context of @conn:
+ *   if the thread is running, wait for completion
+ *   if the thread already succeeded in the background, and user didn't get the
+ *     result, just return it now
+ *   otherwise the thread is not running, so start a thread and wait for
+ *     completion
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
+         * The connection attempt was canceled and the coroutine resumed
+         * before the connection thread finished its job.  Report the
+         * attempt as failed, but leave the connection thread running,
+         * to reuse it for the next connection attempt.
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
+ * Cancel nbd_co_establish_connection() asynchronously.
+ *
+ * Note that this function neither directly stops the thread nor closes the
+ * socket, but rather safely wakes nbd_co_establish_connection() which is
+ * sleeping in yield()
+ */
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
+{
+    Coroutine *wait_co;
+
+    qemu_mutex_lock(&conn->mutex);
+
+    wait_co = g_steal_pointer(&conn->wait_co);
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (wait_co) {
+        aio_co_wake(wait_co);
+    }
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


