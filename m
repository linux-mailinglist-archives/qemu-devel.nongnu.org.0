Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B683B356AA6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:58:15 +0200 (CEST)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5t0-000190-B6
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iO-0005jB-Qf; Wed, 07 Apr 2021 06:47:16 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iM-0001Tc-P6; Wed, 07 Apr 2021 06:47:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHWxl2RA43SnwYV3E0bKNkFEs2NOUcgOrarakVQdaIvVnbVaywUBS97q+vfP41NsPRJszykzx+rLcQqzl1p8/pP+b6/sUWEiTjs6yddLIx4UGIozOo8iofjNaEcn8Wczjp9rdWAY7hMNLhVxbU07ARp4+yK1U84kYnYlPCmTzTRLU/nlZJrfCy1cdUtcfJRleyxWdh5Udapkt3zK5C4gLmY3d9t38c66GlNpP7sbrwdpoM+oQVIjcNlDnn99Np8jO0msYiUCqYdLr2chZMUzns2j5CTkcdgx5OrbCKJW5EkLlGoqqQgzJQwyhZQMqNEwwIgXGuqcouGLTcRdAhByRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hISBE4SOcW9KH3Zsxv/CF6wkk6WeQItoKD8C3GVjYEY=;
 b=Bwc7dQ1ufzUH2tnOhcFKzh33b2wng16swX9bCly4VWBh559PvjYAHguDzL9+pJxvxEpmPal55l5CVm6D5mmbdyVHXTmXCjkq4J0GZSD2jitwuJQFN2tEgr5bCZDuXPgSSS3aN7BUOlStXQjRgzOPzqypBLfagkqnOwSTcycJMvTV0EgssQI9+gPSzQv2QIcn4TM9lbtWwRFVgPLZ45YrWe9ALcBZaHnpJv389Vy/uyOQBqkSYGDd0ikYYu/DscgLISWJOgMl6WcyKs65ncaDv7SqkRMMvnR+VT8O+2EdFmhODXjlWqtLVcxYvZ6Os/YpcjbtLCw8QrRpEt1do9se4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hISBE4SOcW9KH3Zsxv/CF6wkk6WeQItoKD8C3GVjYEY=;
 b=C9en88uOfZJQidm6xiPQQOzSdinr+0CpEdSl9gx+WUCFbTQB3//VZNLPaslOx6EJLrSG1rxIa7nFUx9hs+xKj4oW6vpeCmVqX/XTD836jvjG3/CPmCmQ/Bx5LWO7jHuBUPWvUmViuU+ZgDzrflRxi5GKzWqv495g0jA4IbwLcM4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 09/14] block/nbd: NBDConnectCB: drop bh_* fields
Date: Wed,  7 Apr 2021 13:46:32 +0300
Message-Id: <20210407104637.36033-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4c8b8f0-7e4d-42e2-5b08-08d8f9b27e93
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2452ADEE53B3476249B68566C1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/eXgrA4ddeItliJXQaLPk6Mr/AuK5rf48bBTSQw6skRPSk71uVsndk5Dvt/bhYG8Dv8GWQeEHVkjfxkjHS4Uh6all/QKxyGkEXj/WU7VYAj4vJ4lVd8x/PtAPTxxHDveBQfU8qOCe6rk7qkswoX577Xn2JAfXbK/6D9kmiEn3eRGIn/VvpmC2zFgO44/WkOYIwIUmKitegE0nvNaA8GTywYohBjovQdt8vCSxr0w1Gnq6m8uJ2F4h35dDCks45bR8eeA8ICleOSHBmMVHsqwMlo2N1tKYzUPpv8fmWLxn0EmxOCDje4YtGgHU0QlJ28iqH7kfzRWpgpmVlNt7QXaHzKY77Qc1OLv7jzeESK2uTVvFiuVrqLuPI1oIKj1u9/QBWRJEhekAgGNQXxJg3lFSS+n3uBTOLdiLzQWrWJkeN/JHkKEsf9R62F1Z+wklRP6QSZVfV4MKOUo//js2wGLMtMWBExaZrx3j0gc9cyYjAZ429qVVTfvylaAMMqBUG4hPEm0lalSAQsV6juFrRWA6KS000gyjsnmm9yIyuK3rFm2fx8+U2rAeIwGERidKlvRlVkGhH4DPrrVMCRUisXb9TYX96NFxxgJwa+BA8hBYG/KWcKoORFaEU0T+8SHa9TepVooyaJt6WOmtOKal74qpd4RX0Pf48LomckpzvC0gJu5eCXgWjWSDblKX26X6ixScaGiU+Geo1SFWFH9niztPgH6UDBdlIj8cy7sRhgeAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YTN/kMBnTmWpb6I0W5thkklJ18z9Rq74SML8UapNk2Zko3H+wvictCNjBY6P?=
 =?us-ascii?Q?PlLWcpPVx5lmsOq0gT8k1JWi3avg5EBAVoS9WYmIPw9M0rjpPlPv+sd525hU?=
 =?us-ascii?Q?kiIYzrW0LfOHCboImYUW43xWprNNY+rxUIsUlLLLxSDkSO/B030izj6jPn6p?=
 =?us-ascii?Q?aBDN1FsxSe4j1ctiAAr5H6o8WaqUNzjL/ghl9DQ1oP7kEUqsECmxkHJcJHzZ?=
 =?us-ascii?Q?qZAebpHao+jAozOGuvyLgvTBpe25lwqzuKKD092bwu1pG/lm9D85Q/dwk4lG?=
 =?us-ascii?Q?qMcRhM/sOOTu8DcJmx6W0RUSrRI8PVyJHWwVghpelrI5wSrTQDoOGMNLAQrA?=
 =?us-ascii?Q?AwWyI+fORvh9FYhPmvu0s1qpGiP8o/e0Oezu/nTsQWk5/9x61MVY3IF383yM?=
 =?us-ascii?Q?AxEXuJDsIriDK+A576sokAP6LOU1mlfm+o8bvINjl4XvE0LjivkbV6dVf/0o?=
 =?us-ascii?Q?C3Xc+IQwrY+FAsYHBW7yy6f+N9OI5JYWWN61DBqRi/tcqQ6boxBOjbfqQp/o?=
 =?us-ascii?Q?wFG22yfnSOPq0HfKRZM2/sqhsE9s5EpA0bJ9pAHe/nREH7pZ1//PoheJJzEm?=
 =?us-ascii?Q?9M0ZGwdOAZ51PjgAqvGwD8agY1uBuMwlQpJh510TMKSwJB328gtv8eDSXatO?=
 =?us-ascii?Q?2hEYEXlEdM+gAe0YcNTKqoNr7akxJfUXXZVyRXz88nd/G47ca18YhgjlNeNv?=
 =?us-ascii?Q?8KaqJGeFdVkelR9tYMkdtv4ymtwqMFsBa8BsrnjLDiQYRceBQICnQLq9QtiR?=
 =?us-ascii?Q?zcKk2nBTTDO2xnKkB8jamS3DKO2TY8dfkZPIWl+G5uvzd7Dks7rySK0A0p6Y?=
 =?us-ascii?Q?qYoSY0BASpRd74wx2YeXvtX25hNFZhdil+LAo1X1145yoXZgou/cHewX6bg+?=
 =?us-ascii?Q?Etvm+e2Ps/rRPj/Jm3nWYH/6gCqYEl1KsW51Q/FLTuOcMGQuMlJU3OTT35zb?=
 =?us-ascii?Q?Jv+Lnp2DQb2NWE9MfJiA8ewkMG6pvHe9gk4oDmDQD9nEx1mfdLSY5TGtsmsN?=
 =?us-ascii?Q?fKb/x3U/7O8M2IX/+Wi4L8y0YM3paK2bONSFJ8AwQUts9avz/VifE0fxfGrC?=
 =?us-ascii?Q?oDJP8rSOCVW1X8klnfsXI6aAmnraozLv2ARBgI9r3rubzBpyANR7//ZAa3pY?=
 =?us-ascii?Q?djY7lcUiTOaL7n3LX1l3B3C8XGSbtcTkgOT4pEeY/TJrD3zX9CtseMXW/AiH?=
 =?us-ascii?Q?0riZ74g2QYg2xFJ5Rpd5x4UnxVGMhfn5dMF/UGSCgnGOJDi6ll1z0rHr2kMB?=
 =?us-ascii?Q?BOGeM5+2SO6PrhkKk5qKqiYWVxyxpotjhbwnYdHPnjP2N8ydZim1mlgixX1d?=
 =?us-ascii?Q?usNw9vDjXEQ2ksb1Xd+kK/v1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c8b8f0-7e4d-42e2-5b08-08d8f9b27e93
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:09.8087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVGAUocAYdR3ioIP3f1vo8S5h60O+/NNweDgv+KEJiWfK32eL83cpgCUjrdNpsCfXOXJ16PQ+rfVeXY5t/n52e9NSoKUrDdf1IGPP+Ib93Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Drop bh_* fields and add back link to bs instead. We are on the way of
simplifying reconnect logic in nbd driver, so look forward to further
commits based on that one.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ba281e2d5a..8bd52884c8 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -85,13 +85,6 @@ typedef enum NBDConnectThreadState {
 } NBDConnectThreadState;
 
 typedef struct NBDConnectCB {
-    /*
-     * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
-     * NULL
-     */
-    QEMUBHFunc *bh_func;
-    void *bh_opaque;
-
     /* Result of last attempt. Valid in FAIL and SUCCESS states. */
     QIOChannelSocket *sioc;
 
@@ -99,6 +92,9 @@ typedef struct NBDConnectCB {
     QemuMutex mutex;
     NBDConnectThreadState state; /* current state of the thread */
     AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
+
+    /* Link to NBD BDS. If NULL thread is detached, BDS is probably closed. */
+    BlockDriverState *bs;
 } NBDConnectCB;
 
 typedef struct BDRVNBDState {
@@ -351,32 +347,34 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
-static void connect_bh(void *opaque)
+static void nbd_init_connect_thread(BlockDriverState *bs)
 {
-    BDRVNBDState *state = opaque;
-
-    assert(state->wait_connect);
-    state->wait_connect = false;
-    aio_co_wake(state->connection_co);
-}
+    BDRVNBDState *s = bs->opaque;
 
-static void nbd_init_connect_thread(BDRVNBDState *s)
-{
     s->connect_thread = g_new(NBDConnectCB, 1);
 
     *s->connect_thread = (NBDConnectCB) {
         .state = CONNECT_THREAD_NONE,
-        .bh_func = connect_bh,
-        .bh_opaque = s,
+        .bs = bs,
     };
 
     qemu_mutex_init(&s->connect_thread->mutex);
 }
 
+static void connect_bh(void *opaque)
+{
+    BDRVNBDState *state = opaque;
+
+    assert(state->wait_connect);
+    state->wait_connect = false;
+    aio_co_wake(state->connection_co);
+}
+
 static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 {
     NBDConnectCB *thr = opaque;
     bool do_free = false;
+    BDRVNBDState *s = thr->bs ? thr->bs->opaque : NULL;
 
     qemu_mutex_lock(&thr->mutex);
 
@@ -386,7 +384,7 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
         if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
+            aio_bh_schedule_oneshot(thr->bh_ctx, connect_bh, s);
 
             /* play safe, don't reuse bh_ctx on further connection attempts */
             thr->bh_ctx = NULL;
@@ -520,6 +518,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
             wake = true;
         }
         if (detach) {
+            thr->bs = NULL;
             thr->state = CONNECT_THREAD_RUNNING_DETACHED;
             s->connect_thread = NULL;
         }
@@ -2271,7 +2270,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
 
-    nbd_init_connect_thread(s);
+    nbd_init_connect_thread(bs);
 
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
-- 
2.29.2


