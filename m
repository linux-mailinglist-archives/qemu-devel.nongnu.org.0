Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774A3A2965
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:32:30 +0200 (CEST)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHzB-00050E-AB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcr-00061i-Hk; Thu, 10 Jun 2021 06:09:25 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:61171 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcg-00056j-Tz; Thu, 10 Jun 2021 06:09:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQb/4JMzYoWW9wXrY+uxC1pKDPorRnKIrowpzx8N0O5cLLrrcuQ01/bGCFG7lbmAS/cdMQ0dzDpP2XfcpwmZ39yrpAzR/oEOMBklXKf2pLc93tRH1vCRjdRE0dBNRgLn1bGF1eHYo+ZxeZNrHiUjDrb1gy26wTFnioi7+EOKJa9dDP+0ztg/lTteedTrAO4z34nMurtn6uOKQepRukdCCMg5KeVcbTG9f9jofdN9IOtvgHng5csgRvny1t4QVFOS32O1aSbYD45eHf9ZPtiVyzXIZQBRNz63QRsAv64Q+BYDsLBf0eTtKNUvoC0HotFnDk/FdPpgMqu1HhHK9Iwb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWtRIvHl0T1kdIj285luwrU/yUDfA8kXsLel5Rv3AzM=;
 b=mM5vNvCn5eNMEg8xGjUrzB4EabODTmNltF4LpKknVKhgR7zXTPdFDFUn5SuiWRRZbyV2TNnFvseYBq+pE8UQxQfObHtCotXd9+5+Tzgpnet0qWNTDgNThCrvHUPhekg2oseaah5F1Vot50VDLwteOzh/jo6LXtA7EZRexRb49kEtEsjXxEHJZyNpO616+C3P+quMOkDCETspdcUUpYBbJvFtVHgkKSj9foGbxDPN3WL9qbLCTYZAEbtizmGYggXNbCWqCCJsP109Bqvb5kVUsT1S+dH2Nll7O9DQo5OxlHihhCOy6GHftc+gN03d1Y3xOeHfftSLfddsIrnjUwUkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWtRIvHl0T1kdIj285luwrU/yUDfA8kXsLel5Rv3AzM=;
 b=oBtcSe2+XkQmFKmM+nsHY8Hx7tffnDg7a1kBr61DSK0N2fzlhPF80hYkWkQ6JXYOFXzM8NXyz1SL0Mi1/UaElghaDPQdWj9Fzcj9s3JGJkMz6TKCdYrm13ffl3izpcLH3ww+bGquYfuBi9bKh9K0e0RIz88PIIR8fpUJnUSyN6Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:09:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 14/32] block/nbd: rename NBDConnectThread to
 NBDClientConnection
Date: Thu, 10 Jun 2021 13:07:44 +0300
Message-Id: <20210610100802.5888-15-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c780915b-b3f5-4c70-63ce-08d92bf7c505
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB650223957DE4C3F5B8C749F1C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxKhdtg95A2lG5qJIStqeMQ3NOk+JtDo/P5+PBH2eD5i8YYGRRKXdfJE7ZgrZ+GwcQYyWHLpD+GvwPmg+pUaR3yf4UoP6+dyAApv1RnjiZDEGdL48rScR+BJrpY9nJZBkARuOUbPMjgqdEys6X30nyQO12GKmTDKq/mZmNone81sDdcat74JsnV7wtyi3vU9ecCouWFADUOfhU9Egvfvu2j57MKr3v+KS3LNiHlJqq32mo8P6lBcLBnG+A//OTqGYIHyy74S/uJgUmVpWlLrID/S2TXYekisc1ovYFlLBetEDw/nbxlguTvqIsBEyFyHLSXD/SHelxcsa9bOSQCLKmfBZ8dMabBP/p/KScub2+s0n9IDSGaAnXw0EEeIsLNIGD2F1TxifuaXMFrLLfHSgrjzHtNW5C5V8WeSTBJOyFeDfseczTUkWUSscG+62fuem4+ljexQObnED/3oCq6zc9k+snmf3k0TwoDurIV8NnKI4X2sW4DjUh70Vu3LcayRJnxMzH/1tal00LHPwdbHg5Rq/mwVf+w3DuSdj9x8h2YSHenRiH0SIYcb7fLc854fIwkiY5vcjYR7QU9BOE+LGyOFnVW33uvd+NjA9nLaK7K5YgEdwchE4gBB0zjOdCB5joVCezU/0BwMr2CPSoQdNSwenWRPM1UQrLp6cuVRAW64+qVM15tKrXgBXllZGDuz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m9YFiVVUYP/s3cesgysaQAouooPLvJqU3vR56HaOkFxXgiDNNOdv2I5IZgui?=
 =?us-ascii?Q?xBoJy9WQcE+Og8iSg/wggCNqGupH6dpsj/HDLR6xx9Y3X6PNpiuqcXSEaGHD?=
 =?us-ascii?Q?w3JysLXz3W2b59WkUlZ0X5dXA7t3980rgZYbhTOSkp1bFS3UePV0U2oZATeN?=
 =?us-ascii?Q?l6DueumtHBjuPJVp9ZbnCrdDpNOrsZf17WBoCQbdmDnhdrwV2xZF9tRqHexF?=
 =?us-ascii?Q?4DNhNsx55Mo17GKukhJ2UOf5IF3KJSDDhHx84XM60synJKqcCtqnhrVQi5z3?=
 =?us-ascii?Q?iUMxVKWEHWm3H91KUwp2ON9TM393qFeUMU6F+3Ii0qz7/Q91XHX/iwsi4gJ3?=
 =?us-ascii?Q?gNHAE3lCWzauLhiG1xlbNeuno5paY/XeWAg5iMjJZSgYceyMf5YVzipp8R60?=
 =?us-ascii?Q?7DRH7Kvj5tsnAACGT6R0lE7rVHwzrl7GVPx8XueB/893WGp0z+INxaMBkBaV?=
 =?us-ascii?Q?WvmH6NXwG+YQLOD5wbfsXIAO91dGOFJAi4cgvf4YbElKROjqhP/P5BVt8lnD?=
 =?us-ascii?Q?OPkCriNQChTShlyuEzJFBslWGVs4JvR1llaxYYBZ8GbXJv3DzWNqxhO51CCn?=
 =?us-ascii?Q?dejlrnaO1BSExb0zow9aRCrWQgvvJ1Gxo1nL+7r43ys6YzoC494e7yEiz2sl?=
 =?us-ascii?Q?TqoW57ygsoK/ZkvuAnhZtTYvOZS0t+0UrfnNgsCTbcZGVtqelrtVzZIaKjWp?=
 =?us-ascii?Q?RxV7P5Z4ioW+Lw6VFP9jn5/UR6kDDBmnML2GbV8rVX6pj5DofrnDcKPkkToG?=
 =?us-ascii?Q?0I+mI6war7HCHn6t2QAPTlEkYm/Jhnv6ULrRIkGjwDa8/+3MxhCa7Hlhj2Ml?=
 =?us-ascii?Q?7dSde+EFx1QPbLMf8ScRDCXaLDDNanuEC+WqKXPfzvPj62WPzenKuYWAKgJr?=
 =?us-ascii?Q?ZmtWSqq+Z3F9iPFEut1rFNuRZf5Z/PifjdEjZHpugQVJRnDnI9UAUNfrAdMI?=
 =?us-ascii?Q?3Z41W1c2F5x/y1B3+QT9ZNhzLO3zzqIgrGcwlsW8SdYoDRuz7Uj7H0AU5dWW?=
 =?us-ascii?Q?ydY5Ym+XsLdT01vTxZNpTJoUQ8fVCifp4nWfSwqKquHs1fdwuDeK3teWbYCk?=
 =?us-ascii?Q?DGLyDpwor5uytrL4JV1ta1wuRzBott3/2+dZoV0WWHNw8mrj1SmslrJDb/2+?=
 =?us-ascii?Q?YLCRj1AF96nwkpTlsV/ZZF5qr6UGi2iIewF+JuqjucmNowMmUyWTk5ipNkCT?=
 =?us-ascii?Q?8S3hRvri+6yw3IyVk29tYsxEZ1fzwgGQabIObG/vbv+snyvFhlURTJfFucU1?=
 =?us-ascii?Q?9cQPhy8WfVCIm0me1x1U1SJHAoJGiTqcZ4zWcE2WyqGkFMazNUqmQCAj0b0W?=
 =?us-ascii?Q?F/2mjBhJWTC7Dx7UutRELKyj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c780915b-b3f5-4c70-63ce-08d92bf7c505
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:01.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8t5NZpzifUS8BY5InW5xTsqpfsdakskgnszX/+UJvhRkbbYzc9Co7KY/jsgeovdCGYrilEWLKwheh7e34OblB4mNX36fN6a0d22Igys7gU=
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

We are going to move the connection code to its own file, and want
clear names and APIs first.

The structure is shared between user and (possibly) several runs of
connect-thread. So it's wrong to call it "thread". Let's rename to
something more generic.

Appropriately rename connect_thread and thr variables to conn.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 134 ++++++++++++++++++++++++++--------------------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 40e8d5b425..a7f1e4ebe3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,7 +66,7 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct NBDConnectThread {
+typedef struct NBDClientConnection {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
 
@@ -90,7 +90,7 @@ typedef struct NBDConnectThread {
      * nbd_co_establish_connection() after yield()
      */
     Coroutine *wait_co;
-} NBDConnectThread;
+} NBDClientConnection;
 
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
@@ -123,36 +123,36 @@ typedef struct BDRVNBDState {
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
     bool do_free = false;
 
-    qemu_mutex_lock(&thr->mutex);
-    assert(!thr->detached);
-    if (thr->running) {
-        thr->detached = true;
+    qemu_mutex_lock(&conn->mutex);
+    assert(!conn->detached);
+    if (conn->running) {
+        conn->detached = true;
     } else {
         do_free = true;
     }
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
     /* the runaway thread will clean up itself */
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        nbd_free_connect_thread(conn);
     }
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
@@ -294,7 +294,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);
 
-    nbd_co_establish_connection_cancel(s->connect_thread);
+    nbd_co_establish_connection_cancel(s->conn);
 
     reconnect_delay_timer_del(s);
 
@@ -332,7 +332,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(s->connect_thread);
+        nbd_co_establish_connection_cancel(s->conn);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -359,65 +359,65 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
 
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
     bool do_free;
 
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
 
-    qio_channel_set_delay(QIO_CHANNEL(thr->sioc), false);
+    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
 
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
  *   if the thread is running, wait for completion
  *   if the thread already succeeded in the background, and user didn't get the
  *     result, just return it now
@@ -425,38 +425,38 @@ static void *connect_thread_func(void *opaque)
  *     completion
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
@@ -464,9 +464,9 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
      */
     qemu_coroutine_yield();
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    if (thr->running) {
+    if (conn->running) {
         /*
          * The connection attempt was canceled and the coroutine resumed
          * before the connection thread finished its job.  Report the
@@ -475,12 +475,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
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
@@ -493,15 +493,15 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
  * socket, but rather safely wakes nbd_co_establish_connection() which is
  * sleeping in yield()
  */
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
     Coroutine *wait_co;
 
-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);
 
-    wait_co = g_steal_pointer(&thr->wait_co);
+    wait_co = g_steal_pointer(&conn->wait_co);
 
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);
 
     if (wait_co) {
         aio_co_wake(wait_co);
@@ -551,7 +551,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
-- 
2.29.2


