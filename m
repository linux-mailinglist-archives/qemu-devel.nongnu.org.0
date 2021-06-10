Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905983A2910
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:11:20 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHeh-0000Mc-L4
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcR-00054g-8Z; Thu, 10 Jun 2021 06:08:59 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcO-00051Z-Tc; Thu, 10 Jun 2021 06:08:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi2UQHRGlYqTLOy4iHagMKinH4pET8bjWuMxN14ohUnwrDVVMNbRajlo3xTSaVwewADAA09LUf6nGpijzn/u04Y88s3fbURwBsPh0pYHJNYbc/Pqim3YmN1bkvQxg9ebBkKyX7riOTbh7zHhIaYEb7OB/aSOhfp6dA4xeFwyIEmqU8iHSDlvd9e+tiLcbOTLmaHdR2WxOAGCuwwKPp7anVZpX36IRO/opBue2ztgzguOltK/Fmbl5LUApd3LuCcinybpCXtLPo6q093Uuz3McIirw/4CMggDvWmUo938Sv1GmBfZdAXWossCeI/UX9XXV+vdzb79G7qb+TtJL8zXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la+3tbnBG68ClEcvYsihRJuUQ2ywaBEOO3TcGc6RyJ8=;
 b=BB/I5gK4r0+cStrytcxuZ8rNCb/1crYp7utEtq9Na4f8QkvywbRPxCmfJe7FTYHq9zlJl1MPS4N8b6c0SKenaEWLh0kXKzfH53CG2iQTvyLe2FcHM7SzKV8gz1k16ew91GXUmgZxiKvKxa2Puc/EnfP1Hmhp0jthY8aCCYyMdrTlSnjPEes2KdBk7/cbmhdxOGhOAhsIz3I8UeKCx1s0uCKN3wZjuGlQ/wmk7C+vDo0O/znCvSZr/N6sdNCQSGD2Vj9Zub6+FFGisPsYMpmSbHbcQhMjkJA/xFgs1JaY8KZIq1PoytN9BFzD6OUVq7ofiPtj4J4nyWYq42+zkI5H1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la+3tbnBG68ClEcvYsihRJuUQ2ywaBEOO3TcGc6RyJ8=;
 b=NGQ3KAVB9kMOMSMXL6/QPwFeRUoQtdgkzUFOBbrKac9som6b9HEQQf0lYn6PNJ6QBa7LoeJUoGjJGa+vDciBjnvatXTDev5vK5RC2vCZR5nnJWthUdvrc43EKUOw0mNEhLetQbOYWTej080ADSKIKndytyTOt3Aw1YzoPWtQU7U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 07/32] block/nbd: ensure ->connection_thread is always valid
Date: Thu, 10 Jun 2021 13:07:37 +0300
Message-Id: <20210610100802.5888-8-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2328aad7-ce74-4512-7357-08d92bf7c03c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502ABEB47BB25154ACB3DFCC1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+34GDrNNfg0DjVZVTINBromZb1w8aybLxluZjaRulCOFq1n8MCNoZfkUMhz+jmE2Y3btsipb7WJEQ8JYToPJXTUx2XNM/nntE43DQk9GJic8VUORATDdOYfBzlIzAVCK5CQ2kYgnwASomNBTlfMPLPDj+YRu2tKuHLwMaw9xdewqUYhugPgQNHRyf9pdQ/JuSMKtAYWlhxlXb8yk0bVfNeHdKmK00lOX/ntVvQ4VE4GGk4+zOG47VEXZs/Yt3Aq+uk0gz6Dmz562zPQ+msdk/h9cja7uQmqFlZ83o09py5J+gUR2aMvdKetKwnx0QnhJq2OnjL14E8Mmm0QmrjzidqX5YwS/0JVTuTwhGCjMqj655wGD8DwEP3JNMlYaelqEz4aXZWdfDEgyrh4lIPYaR1fBiYCanIceBq291VtJwu+jBg40iPvqnyzRzeCPOvdEXPskP8idHmqU7dYnuPw1HzujGAviMUG6bsrLAxMpQV2B88Pq8DdSIdSQ2vofP6fW+biq6fxF+3bSvAanaKjLJAawjJg8NiFg0qZZ9OOF3q6k781MEWRTMjm+LGgrE8ZwgAUZ00jO67UMD5atM/dKYxDS8eLJkT7cAcW6f3Pu5d7a9CTlak6Y4l6xDggLYvTuLUrwV4111K6dtodAcFLjvcIdECcZsCd54AKafw4fEOFLZen4mBMr7EqkxfODhw1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vkfUS3RRYxMYO7xq/IviE690xWqIZVgc+VVKFiU0I1673uEzdRmsLcTIc+Gq?=
 =?us-ascii?Q?J4w2PL0/uL4OiwnA0gEyAyMZlAuor4NHclkyldiBPcD4b0XT+RNXwZURb0zJ?=
 =?us-ascii?Q?OYCZoSXV9BSFYBlogWGhyKdbNVh2DAAgEp73GQXBsEXqq/CE9zb6lYs2lKiJ?=
 =?us-ascii?Q?T1OCcAFVYCLL6onDfR1uuwCxTsykiUxfCA/OCugRQoEN7zcGwtPP/VIEAumr?=
 =?us-ascii?Q?afIUiZD0cwZaIClbiozSZWZ84gLZ2B2ZCB/ULj5oJCJqyjk9Rbrf0wjT8O88?=
 =?us-ascii?Q?WaRnxzmQ7SBekGnPgh4y5wE7NZCnY29uswKFTYLuZZLBj/CzrOQL1iPSvGfD?=
 =?us-ascii?Q?BC0qy7Fz4kf5Ao4XnqmyiFSD2JjcpW2gdeDnkmIk1Bycyis0N1jnrP6ZJ8wy?=
 =?us-ascii?Q?l65zx46/N8QB/3jCzf0mnmV5jV5wIwVjzWCV+EmQ3lGc15OUWk43OhFtYSPH?=
 =?us-ascii?Q?0eW3rEAJZDb7AowNjkwrARO20XPbIo8ycHVNGWihImueHbjIYUgqjs9hjfqP?=
 =?us-ascii?Q?LK1qPZId2xbG0f2Yoe1RlMzdqn3KTryXOkXMGwuIJLm52LrnzBgNXhNWJhpF?=
 =?us-ascii?Q?lO65oYcyUTXo+eOZvsJk3s2zmmJ8IpqwiwatMDWJEw5jDgErUBqisw5nJfz7?=
 =?us-ascii?Q?ZWiiQtSJMnlYXeAJqT48mie5aErqGcXsi4wEhw9aV0Mg+iqiBg2n84vgSK/6?=
 =?us-ascii?Q?xO6TpvcrkYivG+z5Upwfjqm5D/MDpnCIZqeH27V5gbN71mtHwLitQtH/U9Ks?=
 =?us-ascii?Q?lyV7Ne+X/J1SEQe5bsDYD9Mpjr1YCUBuCp4jpk+v+2CCWsg/+gsuyqjmvOev?=
 =?us-ascii?Q?RqsILD/hh7kLyyMkj1kVI3wYM6zDwkPunumQIPN8Rz+4iqnGxKxV4umCi+Gc?=
 =?us-ascii?Q?ktX9o0PdSq/UTlqnZiwElCAlhp825onpG2sh+FrOrTfvGnwMbhFEjpDCPkxK?=
 =?us-ascii?Q?BH5EffAzV9NqLHLKNr8zFx35hGf4YwTcXdEnU6ZBMpLKdcaXpWniW/cwCicm?=
 =?us-ascii?Q?3yUVv+8LdZ14SWihawM0UnrD0BsW5MUrGT0/mw3EyKqBYXuLOZvO/or99TL+?=
 =?us-ascii?Q?x3iqNrCTMznulBJRhLHFpu7v66uW/U6xRKUKihdCBXpubDzP6/F62ytvtMwO?=
 =?us-ascii?Q?wydTVZJDHxPEEVSSDBOKgEEICH2/H+9bdEg557AJ4VKXdXVoTX2Ytv0VVUyl?=
 =?us-ascii?Q?Ld53cebdXTJvKF2t3DfuK9sH2t4KPIzqmkA0mqMgqODx6VOeeE2IaMvi8l6p?=
 =?us-ascii?Q?kmoeOaFVMBjeRTuitdo3AwDAayUKNYOB4UB3HMF1g3t1ACbCYuNZdHWJrDhK?=
 =?us-ascii?Q?ztQcz8OVkh3ObCFscZwYnUKV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2328aad7-ce74-4512-7357-08d92bf7c03c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:53.3292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTcr/YFXDycGPTGf2774im2w/ph/A05RP7aeyapWjvscBP3WtHGmzYrNhwe5ifolAskK/JEHmsyOBmZ+E02Jq1CzIVhOD/iAYfwNfwpNHR8=
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

From: Roman Kagan <rvkagan@yandex-team.ru>

Simplify lifetime management of BDRVNBDState->connect_thread by
delaying the possible cleanup of it until the BDRVNBDState itself goes
away.

This also reverts
 0267101af6 "block/nbd: fix possible use after free of s->connect_thread"
as now s->connect_thread can't be cleared until the very end.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
 [vsementsov: rebase, revert 0267101af6 changes]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 [eblake: tweak comment]
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 56 ++++++++++++++++++++---------------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1c99654ef7..08ae47d83c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -144,17 +144,31 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
+static void nbd_free_connect_thread(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
-                                               bool detach);
+static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnectThread *thr = s->connect_thread;
+    bool thr_running;
+
+    qemu_mutex_lock(&thr->mutex);
+    thr_running = thr->state == CONNECT_THREAD_RUNNING;
+    if (thr_running) {
+        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+    }
+    qemu_mutex_unlock(&thr->mutex);
+
+    /* the runaway thread will clean up itself */
+    if (!thr_running) {
+        nbd_free_connect_thread(thr);
+    }
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
@@ -295,7 +309,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);
 
-    nbd_co_establish_connection_cancel(bs, false);
+    nbd_co_establish_connection_cancel(bs);
 
     reconnect_delay_timer_del(s);
 
@@ -333,7 +347,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(bs, true);
+        nbd_co_establish_connection_cancel(bs);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -446,11 +460,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
-    if (!thr) {
-        /* detached */
-        return -1;
-    }
-
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -494,12 +503,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
-    if (!s->connect_thread) {
-        /* detached */
-        return -1;
-    }
-    assert(thr == s->connect_thread);
-
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -547,18 +550,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
  * nbd_co_establish_connection_cancel
  * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
  * allow drained section to begin.
- *
- * If detach is true, also cleanup the state (or if thread is running, move it
- * to CONNECT_THREAD_RUNNING_DETACHED state). s->connect_thread becomes NULL if
- * detach is true.
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
-                                               bool detach)
+static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
     bool wake = false;
-    bool do_free = false;
 
     qemu_mutex_lock(&thr->mutex);
 
@@ -569,21 +566,10 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
             s->wait_connect = false;
             wake = true;
         }
-        if (detach) {
-            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
-            s->connect_thread = NULL;
-        }
-    } else if (detach) {
-        do_free = true;
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    if (do_free) {
-        nbd_free_connect_thread(thr);
-        s->connect_thread = NULL;
-    }
-
     if (wake) {
         aio_co_wake(s->connection_co);
     }
@@ -2310,6 +2296,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    nbd_init_connect_thread(s);
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
@@ -2326,8 +2314,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
 
-    nbd_init_connect_thread(s);
-
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
-- 
2.29.2


