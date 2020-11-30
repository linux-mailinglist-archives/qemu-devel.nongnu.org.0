Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8FF2C85CE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:46:00 +0100 (CET)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjV9-0002VP-9S
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQH-0006w0-1D; Mon, 30 Nov 2020 08:40:57 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:22148 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQ9-0000SL-Vz; Mon, 30 Nov 2020 08:40:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjX0YBx0AlCvwlwTQ0e3VZ/ElZfBGuUR1vNb3W59yDPlIIKVDH9Mlws3fE/HddiatCI3q+b7yL7mPD2uGdaCFgJuVnQEPgfHOWt+ylv/3y4g5bg0iux/e4WekF4uK6sYqsGk/rOQYOao25AP0bvGEBvHIfRQG34PdlWOlur3rCJb70ztPqmrFV1/umNh2d/jryCKIXgBsqC14wVP+Swegb6oEWJ+iwHv1hivq+M7EzWZd6sCcRhdbXh7t6fsJUwwt5VJj7FW0Wo8iQRM9y61nu86vDlY3bh6y040RaSHizD93xX7M0qlfI/u+oAaWwU1AOoZdS3DZGxSThnelZ9XfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMd41hCS7VBMAxKiQjMW7Qi2+STqAzQ/lcI8OTOiO80=;
 b=aFDo6dv9z0KGEjg80Z2pLDc9nMfMhi6/tFEprYsrRs1z/YB+LNoTzqL1y10GfEktowoC+COSmyHxNhu7sfUJLezK2wtT9m471qF7q4/KpOM2RwK6tuSoqhjh1TahvyC5GpPxh3JO2PWJPHBBgnkhB2OsyRzBnk9lPz6aa8vzA6AUr1PSPqiIFDaHl1ZdlR0vSlQIAktANo4KqH+Sxux3VOIj/qHp+E5kb5CEORN2l3ViGFsVdUpeiEYulqIorFjdPi76/6Gq8aaGJD1UQzhhHx8SlI3n7+8uBRz0Z2OQ9fSV05bLay1igZ9FHJqx/alL1PQy/RNOx1mcPre+v1refw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMd41hCS7VBMAxKiQjMW7Qi2+STqAzQ/lcI8OTOiO80=;
 b=DWSOpugEILpttNvupn2HjvXLJpVOI8Ub91KsTyXcmszyidU7OOWGuaDJrWobeO7lFoesemjTk7ZOeKi2bSNahbedtbnw/eUCAFohaeBhRmCxAgLCe51diKkABzVX8vzhxsMBi4Q4JGqQxtE/3rW2+UKfsDBIcYfSc83N6/TWQ30=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 1/8] block/nbd: move initial connect to coroutine
Date: Mon, 30 Nov 2020 16:40:17 +0300
Message-Id: <20201130134024.19212-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b459dc7-071c-477d-13e1-08d89535866f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB344874E92C9CD073D999E9F5C1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocTrgDr8LOeCiAdesrZ/8e+2sOrhvD8NivO+fd4J9jgeDAwFQYvfoiyCkzUBtLY+2A8NsONQwlfNXu3CPCYMJgul89LWHxCzF7VkoJygl1A3rpJr8mWbsiHtybfN6xJoj7QN2GklTVyYBbXHL3oAC5wzStZ7nrBa51cWmJ7LP8ze8g2gzSfI1Trm53XyLmLr1fUv23+TrliwVLHU9eKkS+Lg3ysul7/Xz0/3qq6ZLqpTeo4iXtKG2uaBFAJfjgl92f4p91TyJLGVqRoHgIzTLiR96Y19k6NY5uq4yFZSU4Ayn2GI5OpzNxdVk+HEt1m7iSjZMTV5EbYbq1cwLMObWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mRzlmbpT5Y0Z8De1BMZztDsvxr5kA/bB2eNHzwOjrO0wq/T/4IOnosHIHLOg?=
 =?us-ascii?Q?8KU3UX3rkytvFHCdYDocM2h9HrJC+XiWwZikpsJ8hlZYxGdsu33iZf621dwa?=
 =?us-ascii?Q?zKAxF5qeiA2jHeFTzAANIgJNPt0jo0x+DsbTrVSaGbNDParv4nUmBCZfq5x2?=
 =?us-ascii?Q?6gXfP4jdyTNDROH/QfjvbiSgCJo0moA8cHUZxJ6ulbYYgC3tflTOMTtQcwOx?=
 =?us-ascii?Q?ihyBnjCrwGwfLBswdTSj7+hqodt9SpSmC4gbsaw/t+cJwyzPZGN+3HI3RJJj?=
 =?us-ascii?Q?2lXHzhsOsnzi9mPZMqirzLEBbeIF7gkDgCGXx/Jvq3Fw2QmiKcJn2J1irWpJ?=
 =?us-ascii?Q?Z65sa4PVBi9AiZhQknlJo+n2ehiQqdcaTptGsn4UbVPA+4b7XnItlNGlhnJw?=
 =?us-ascii?Q?4dqmUc4vL7aagthlkkr5T1TN+LBUHAbxUjQ63PQQZvHiq2geTsrFtEVnxcP4?=
 =?us-ascii?Q?xfnKY8FJrnWEjbF95BwKu3abJk3Hyy/BPRz5kH1EZlYJSqQ84W1jCQjaJuJd?=
 =?us-ascii?Q?7ZfWiLfI5sXnoNAiGkvRI5/aVwLAkAgJrVcwQHl6/ShAPnObwz7z3ChrhQOs?=
 =?us-ascii?Q?/ludVSWtMCExcpm9ECS45X2X8mJIQaoX+WcnC91fJfP9VQFJpc9a22l0n2bw?=
 =?us-ascii?Q?mzd6dazEiZ1cjt575bsZ23Le8TJkAdLOR7QS0t5JpAULiinKK21Sb/XLlLF3?=
 =?us-ascii?Q?8L4S+O3onsddmWXMrkcmuEAJm31JvPbD9N5qzr9BCpKNPe4FxkTVCvcbnB6K?=
 =?us-ascii?Q?11KDHU+XcurGTGOyQk1eUU1vz+Gk+qUoHoOfCbNb4h5nFM+T5PxEAttzgn0k?=
 =?us-ascii?Q?CupwKq+y4Atz0FJhda5jM418B54yFai/NViXTgdYLHg6GPAe7zDCKgqGLRAK?=
 =?us-ascii?Q?nIsZeBdgAjTWFEDnlFycTHuBYzTSz721g2QmUC09tvjvJ0qTY0U7ABFgFEPB?=
 =?us-ascii?Q?BNBxUCmDkVXfuucemG0YSBQz/VBz7Q2v3Yr2QZAPnfEUM1OJudvgwrYbJNh/?=
 =?us-ascii?Q?yabG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b459dc7-071c-477d-13e1-08d89535866f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:39.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRJYWsPj9xrju/x6eF8wXvGbGkl+LYNBYroXHtbSwhNmvnnJE1f7MVENJPC84ICn6iYAeen+YxH0JpMJRxrb6zkAhge8wzQu8NIjivDuqrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We are going to implement reconnect-on-open. Let's reuse existing
reconnect loop. For this, do initial connect in connection coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 94 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 42536702b6..3e1d6c2b17 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -57,6 +57,7 @@ typedef struct {
 } NBDClientRequest;
 
 typedef enum NBDClientState {
+    NBD_CLIENT_OPENING,
     NBD_CLIENT_CONNECTING_WAIT,
     NBD_CLIENT_CONNECTING_NOWAIT,
     NBD_CLIENT_CONNECTED,
@@ -113,6 +114,7 @@ typedef struct BDRVNBDState {
     CoQueue free_sema;
     Coroutine *connection_co;
     Coroutine *teardown_co;
+    Coroutine *open_co;
     QemuCoSleepState *connection_co_sleep_ns_state;
     bool drained;
     bool wait_drained_end;
@@ -141,8 +143,6 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp);
 static QIOChannelSocket *nbd_co_establish_connection(BlockDriverState *bs,
                                                      Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
@@ -339,7 +339,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
 static bool nbd_client_connecting(BDRVNBDState *s)
 {
     return s->state == NBD_CLIENT_CONNECTING_WAIT ||
-        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
+        s->state == NBD_CLIENT_CONNECTING_NOWAIT ||
+        s->state == NBD_CLIENT_OPENING;
 }
 
 static bool nbd_client_connecting_wait(BDRVNBDState *s)
@@ -639,6 +640,7 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
 {
     uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
     uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
+    bool initial_connect = s->state == NBD_CLIENT_OPENING;
 
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
@@ -647,6 +649,25 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
 
     nbd_reconnect_attempt(s);
 
+    if (initial_connect) {
+        if (s->state == NBD_CLIENT_CONNECTED) {
+            /* All good. Just kick nbd_open() to successfully return */
+            if (s->open_co) {
+                aio_co_wake(s->open_co);
+                s->open_co = NULL;
+            }
+            aio_wait_kick();
+            return;
+        } else {
+            /*
+             * Failed. Currently, reconnect on open is not allowed, so quit.
+             * nbd_open() will be kicked in the end of nbd_connection_entry()
+             */
+            s->state = NBD_CLIENT_QUIT;
+            return;
+        }
+    }
+
     while (nbd_client_connecting(s)) {
         if (s->drained) {
             bdrv_dec_in_flight(s->bs);
@@ -759,6 +780,11 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
         s->ioc = NULL;
     }
 
+    if (s->open_co) {
+        aio_co_wake(s->open_co);
+        s->open_co = NULL;
+    }
+
     if (s->teardown_co) {
         aio_co_wake(s->teardown_co);
     }
@@ -1757,26 +1783,6 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }
 
-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp)
-{
-    ERRP_GUARD();
-    QIOChannelSocket *sioc;
-
-    sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
-
-    qio_channel_socket_connect_sync(sioc, saddr, errp);
-    if (*errp) {
-        object_unref(OBJECT(sioc));
-        return NULL;
-    }
-
-    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
-
-    return sioc;
-}
-
 /* nbd_client_handshake takes ownership on sioc. On failure it is unref'ed. */
 static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
                                 Error **errp)
@@ -2245,7 +2251,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;
 
     ret = nbd_process_options(bs, options, errp);
     if (ret < 0) {
@@ -2255,23 +2260,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);
-
-    /*
-     * establish TCP connection, return error if it fails
-     * TODO: Configurable retry-until-timeout behaviour.
-     */
-    sioc = nbd_establish_connection(s->saddr, errp);
-    if (!sioc) {
-        return -ECONNREFUSED;
-    }
-
-    ret = nbd_client_handshake(bs, sioc, errp);
-    if (ret < 0) {
-        nbd_clear_bdrvstate(s);
-        return ret;
-    }
-    /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;
+    s->state = NBD_CLIENT_OPENING;
 
     nbd_init_connect_thread(s);
 
@@ -2279,6 +2268,29 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
+    if (qemu_in_coroutine()) {
+        s->open_co = qemu_coroutine_self();
+        qemu_coroutine_yield();
+    } else {
+        BDRV_POLL_WHILE(bs, s->state == NBD_CLIENT_OPENING);
+    }
+
+    if (s->state != NBD_CLIENT_CONNECTED && s->connect_status < 0) {
+        /*
+         * It's possible that state != NBD_CLIENT_CONNECTED, but connect_status
+         * is 0. This means that initial connecting succeed, but failed later
+         * (during BDRV_POLL_WHILE). It's a rare case, but it happen in iotest
+         * 83. Let's don't care and just report success in this case: it not
+         * much differs from the case when connection failed immediately after
+         * succeeded open.
+         */
+        assert(s->connect_err);
+        error_propagate(errp, s->connect_err);
+        s->connect_err = NULL;
+        nbd_clear_bdrvstate(s);
+        return s->connect_status;
+    }
+
     return 0;
 }
 
-- 
2.21.3


