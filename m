Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AD35865C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:11:44 +0200 (CEST)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVNn-0007AF-CX
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLf-0005Fq-NG; Thu, 08 Apr 2021 10:09:31 -0400
Received: from mail-eopbgr30133.outbound.protection.outlook.com
 ([40.107.3.133]:41857 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVLU-0001dU-85; Thu, 08 Apr 2021 10:09:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh4GPkEirGwuL57KLVXK9DLC6RLzkGCLUW1GS1XZoBHtXMbyb2rtUYf2KcvupYKVCf7ZrmJA6EISo+PfbLcToCXBsTnR6X734Ejq6RE96h+wqxKc4/5rQFM40E/gHR494SXeeXWkChfGFY5LpKLgUyCipZJAXRpOtLIHXy2ReijYRU5o+aMQ+0MjlMk5UwfQ/7nhX5KZ6pxNUcGldWEpJ+G6F0ipwozBNLhRi8Sz0EfmMtk4I85ojn/AmyRyzX698hXSh8WzGxyrKXQqA1npS5Pzt0vmTyAZFsv2/s0Hm2dCqDO/iNbGJidKcPXjvuPicNwNAVkLqE4Kx9ODI/pbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsfWNxdqsTyQWCubunuyEGnuzVEsvSsWNlXjnATH0js=;
 b=XDpDeof+JbMHM7gqCbZq2OHEh1AR/KuhOfhZJHJNYmiJ+JrCaMZI64M1p7JbraYKw4zKwGW+O7mYfI808nopIZutuo/tXp98HsPO05d2b3iTs5sj4xCQhn6AG2JKa4NDUw8Al3JEn0i/BY/kMYHo7N7pK5o29wo++8Q1Q5HsjRg2zcw9NsYRmtw0OIjzWWiWIFwo3c1JlFlCg95xgTT/frO5oMFegOy7zenBEqlx1czHS6aUJrTOz6UHhdWZ/XF03Cyi23WoY2S9a1qCp0bMQfHxdznSyFG/qrZK3wvHaIckDY0sUoxlnt9od5siI/ziSkBX6qfJLEgFa8hgcpylzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsfWNxdqsTyQWCubunuyEGnuzVEsvSsWNlXjnATH0js=;
 b=l+eEir/OngUmcHvT0Y4y08sQ0RTaDsfFwY6gqK7KUyPakVrvfJMJzlPu8avqygFmhwaoGKNPhRsr2WqHWKxncXiVjyimC6Y03UPG8ZPWjy28PnT6iqqQtyoFq77oCTmvKOBCzrMrZwW1soz4RefcR+a+7mNA63ENun9qMSvcGqg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:08:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 01/10] block/nbd: introduce NBDConnectThread reference
 counter
Date: Thu,  8 Apr 2021 17:08:18 +0300
Message-Id: <20210408140827.332915-2-vsementsov@virtuozzo.com>
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
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02dad2b6-98fc-4ad8-c746-08d8fa97d17e
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909B238ED8E68747439503BC1749@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yH3PivnAIC5EukxXS4kHKTFK+Kze4YB+ynmqFFD9jrEfzpTDrpF96nnjcBRy/PxvKyaRfWPVOiXEFMsvbPzfMPQX/i25aRdW2HHUcK0KgmiA7VlCUnQE+V5Q20Jgi3RpKTi6c7ZscoS9vHAc+rBM97v7toZa+7L4skw/I4O3PtmMjc0Kn0oV8RBOUsuXiuS2py8tMofsC5zsXAdPnekyllW3sk1iy0kXkMf7gfkzd7QnNfi+xZHqx6mitfrTSPyv+c3skg+2nU2IkkJF+3EO7qaPGOhhx5mqU7dTXszrFcfTSbgWP3lRd28qVpzXq7VgkE3oQssFPwAt8vutsVlc+Q9iFB5+FrTZ/JSHR2dPAVhFSAwNv1YgHJmCTNXFNoch5hckjMQvgLpPForGV0tTLMu9Fos8hvfuXokLmGmRa3Rj1x4/tuJpk6hv05p9tT4cJpNwJbpUoRRN4lRE9lvsQEjDJPh6MWrGZrpbGaTHZ5PebbdUydrA886pgoF87YFs135suK4CIYfdGxXZuPHXHl4s5vuH0onO1nrkOws2iQsg9gvZwdZQGU/knFBrJUhBY1ogtKqQRTRv0ONfSyN56HbNx2gpOPKdOYrtJDucLTV01l6P4W9p46+RBhH7Dms0DBh3+BzIdaz/ktND8QhewXNXpbuHlvMed9gVfgXcWayQbZ6LoxTsfRE/5ao5KdidKz0hCF2B1GOTUCtfZiZU0I4h/ig3IfOGVuhqy8bnvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(36756003)(5660300002)(38100700001)(66946007)(316002)(478600001)(86362001)(66556008)(66476007)(2906002)(69590400012)(6512007)(38350700001)(6916009)(186003)(6666004)(26005)(8936002)(6486002)(4326008)(1076003)(16526019)(52116002)(8676002)(6506007)(956004)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TpsoOg6IzRJwCHTU49pS9GCWJnVGLxhBeynv3VrD4kQScwiVfkDh1G6RSVyZ?=
 =?us-ascii?Q?0ZKN4uuxyU3G8D7wODkCwmpMpQDFVyJm3eW76EmgCG5wOP6Nl6UxuArQCak/?=
 =?us-ascii?Q?TOURDjTUQcg5GXHvFaFK58i7me9x1yuUI4eXMsGdD9lOJDIueoBBNEEcwUkR?=
 =?us-ascii?Q?qLANyO06eBULQ+lGaJdo2C4hogPN/sShKk1GRTvjpAkZR2AwHMMhNcLhwtbG?=
 =?us-ascii?Q?xsjZpWBcaeUFTd8ObvnDBFLM8YmSK8+aG8buxrz+iOu3uUNyTh1p0gRDVdLB?=
 =?us-ascii?Q?vUKR/tlbWFQFLoiBiFx9vGXdFu+8So2qxKCLmWvQmesPgLU8VM+GL3ymhW9W?=
 =?us-ascii?Q?QnS1V5olaCtD9L/uVR/G7obSrHg+sgZRRSh4q7AwLeA/fR9/JmTAPYR+4xbm?=
 =?us-ascii?Q?QMVpz0grGEoi4WuxGaGkYjZhFHekapAyQUazuUsdrBhzwUfZXyluIXEGjcsy?=
 =?us-ascii?Q?3WLywzRm/WwGHBnnT+Hm36qSuNYF9i6Tvbb8YP+etutvR1OPV6sSxncjUxDW?=
 =?us-ascii?Q?7w9VtX1a47jpGIMhM6sqMgpHgRvzE7EaMKqIqZ6tden9XGDxILoddaG9GCAu?=
 =?us-ascii?Q?bz8p9HOK5mA7owfkmVdtAyaEWF1O140WNtlFLkOlWTw9kAJcs4hYIpguZehD?=
 =?us-ascii?Q?pOaZJiCnLQ14lO0iQrhFHoe4lzG54U1iW9FGD2AyVExzwJpR825beZSXyngl?=
 =?us-ascii?Q?wQ25odB9gFhyQ1JHVw9f7Abp3/hsIg35kdZks26wJp667DidiagGF8AUkeUt?=
 =?us-ascii?Q?09EGPhZAJCiSHJa7x3tMfnKX/iT4DYIx3KgOu1WCyFHQvFhBgUdTLxKzaDKh?=
 =?us-ascii?Q?hvrkVeAjKnD7TJglXwmzf7j04+pwfhW/BwE+Ka7Aw40K35uQtynw+2BozoLY?=
 =?us-ascii?Q?Y+5cJC42RMDEBkj330tT/Edf3+SQpvVYdDTA6/mRPLJaoW5PSDObQhpUKq4p?=
 =?us-ascii?Q?7T5Sw0pIz+9BJSlx8G/w9Un/uvDFWYbBrdycELDDK0aRLbNX0z0wcOZ93UDQ?=
 =?us-ascii?Q?IBQXXGpqS03o1FswJvWSl30WvS22hN8cllDoSM6uziQeoq2eB8ylQj3hBqgP?=
 =?us-ascii?Q?4VzebWcNtlipe17ZcJ6AhHFAE1zdEUwyRzDPANt68sMc73pV6GSKNBwXWzDt?=
 =?us-ascii?Q?JPgmsZ7U9Su8RKkj8+DKyurpWpDJeDZG65nC++Luu81DSZyxd/RujlKttIAg?=
 =?us-ascii?Q?So3uqSRYv+E9qwi2RXV4o6HmYRQEO4P4TgxiYS3Mv/HhGVsRlNAiK3fO645H?=
 =?us-ascii?Q?+I6IAroHHrGI1wLh1jvTAIC3bbDyXVj6M80LYhKu3iwLgSZItY6xA29GPplT?=
 =?us-ascii?Q?b3xKrzzfAofoUP1ZmUcnCDcr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dad2b6-98fc-4ad8-c746-08d8fa97d17e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:43.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgrlkGQDKc7i19zQAus24w0JR1w64RgPtH88eU0PSeZFlxTogz//3EGRFFp7HIg2kPnKOua46ZwvuO/GUav/2ZBfVPD4pFmxsPzXTuOk180=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.3.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

The structure is shared between NBD BDS and connection thread. And it
is possible the connect thread will finish after closing and releasing
for the bs. To handle this we have a concept of
CONNECT_THREAD_RUNNING_DETACHED state and when thread is running and
BDS is going to be closed we don't free the structure, but instead move
it to CONNECT_THREAD_RUNNING_DETACHED state, so that thread will free
it.

Still more native way to solve the problem is using reference counter
for shared structure. Let's use it. It makes code smaller and more
readable.

New approach also makes checks in nbd_co_establish_connection()
redundant: now we are sure that s->connect_thread is valid during the
whole life of NBD BDS.

This also fixes possible use-after-free of s->connect_thread if
nbd_co_establish_connection_cancel() clears it during
nbd_co_establish_connection(), and nbd_co_establish_connection() uses
local copy of s->connect_thread after yield point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 62 +++++++++++++++++------------------------------------
 1 file changed, 20 insertions(+), 42 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..64b2977dc8 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -73,12 +73,6 @@ typedef enum NBDConnectThreadState {
     /* Thread is running, no results for now */
     CONNECT_THREAD_RUNNING,
 
-    /*
-     * Thread is running, but requestor exited. Thread should close
-     * the new socket and free the connect state on exit.
-     */
-    CONNECT_THREAD_RUNNING_DETACHED,
-
     /* Thread finished, results are stored in a state */
     CONNECT_THREAD_FAIL,
     CONNECT_THREAD_SUCCESS
@@ -101,6 +95,8 @@ typedef struct NBDConnectThread {
     QIOChannelSocket *sioc;
     Error *err;
 
+    int refcnt; /* atomic access */
+
     /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
     NBDConnectThreadState state; /* current state of the thread */
@@ -144,16 +140,18 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
+static void connect_thread_state_unref(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
-                                               bool detach);
+static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BDRVNBDState *s)
 {
+    connect_thread_state_unref(s->connect_thread);
+    s->connect_thread = NULL;
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -293,7 +291,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(bs, false);
+    nbd_co_establish_connection_cancel(bs);
 
     reconnect_delay_timer_del(s);
 
@@ -333,7 +331,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(bs, true);
+        nbd_co_establish_connection_cancel(bs);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -376,26 +374,28 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
         .state = CONNECT_THREAD_NONE,
         .bh_func = connect_bh,
         .bh_opaque = s,
+        .refcnt = 1,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
 }
 
-static void nbd_free_connect_thread(NBDConnectThread *thr)
+static void connect_thread_state_unref(NBDConnectThread *thr)
 {
-    if (thr->sioc) {
-        qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+    if (qatomic_dec_fetch(&thr->refcnt) == 0) {
+        if (thr->sioc) {
+            qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+        }
+        error_free(thr->err);
+        qapi_free_SocketAddress(thr->saddr);
+        g_free(thr);
     }
-    error_free(thr->err);
-    qapi_free_SocketAddress(thr->saddr);
-    g_free(thr);
 }
 
 static void *connect_thread_func(void *opaque)
 {
     NBDConnectThread *thr = opaque;
     int ret;
-    bool do_free = false;
 
     thr->sioc = qio_channel_socket_new();
 
@@ -419,18 +419,13 @@ static void *connect_thread_func(void *opaque)
             thr->bh_ctx = NULL;
         }
         break;
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        do_free = true;
-        break;
     default:
         abort();
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    if (do_free) {
-        nbd_free_connect_thread(thr);
-    }
+    connect_thread_state_unref(thr);
 
     return NULL;
 }
@@ -451,6 +446,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
         error_free(thr->err);
         thr->err = NULL;
         thr->state = CONNECT_THREAD_RUNNING;
+        qatomic_inc(&thr->refcnt); /* for thread */
         qemu_thread_create(&thread, "nbd-connect",
                            connect_thread_func, thr, QEMU_THREAD_DETACHED);
         break;
@@ -503,7 +499,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
         ret = (s->sioc ? 0 : -1);
         break;
     case CONNECT_THREAD_RUNNING:
-    case CONNECT_THREAD_RUNNING_DETACHED:
         /*
          * Obviously, drained section wants to start. Report the attempt as
          * failed. Still connect thread is executing in background, and its
@@ -533,18 +528,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
 
@@ -555,21 +544,10 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
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
-- 
2.29.2


