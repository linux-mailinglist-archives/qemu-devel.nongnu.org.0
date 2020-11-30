Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDB2C85D9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:49:51 +0100 (CET)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjYs-0006KI-LJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQI-0006yT-38; Mon, 30 Nov 2020 08:40:58 -0500
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:61792 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQC-0000P5-2k; Mon, 30 Nov 2020 08:40:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFwh6ORyaAQzSJnMKeDEg3Y6VMB2pJRM0ih3AJmVy8N+AYREW8hdrrkaaBSh4iDlwNjotpOM4NwbiizmQ3CjV9Aej7K/EE5xBkPSrbnkADtBUtE9NR0P5YtoM6wSXr+t4DOmc0BlZk8z5YkW+nabBbIJBRRTR3pHn5hFl9vWNUgAF44riz9AABu8yfBgpxpSiQCqg2pbULH58yGzislpVw4c2kyW2G/vfXqcBZyGcCqEgtUDrXvk1KvZjugYzsWWkwvrxMRb9HY+dvaUYMYD1e1ogQQ50wIn6ZGdAJyNT1DjOXt2QYOGBAyAFjlg1/r2gcRc5uExD8huAzen5bi2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72r0EuroHhhEzA7T5gR3oWtSPXYldejprkeoNpbp49Y=;
 b=AtZ8luZnGgOeSaDCedwB/noqEkv6gBCyH4wwcQGvgPU4eLpdLNg3h4b5hoEya+Z+LbnIDIN/Q1wMTvD4WQTMBI4/1SmXo2HDg9Lag76yn/3dC2HrWgOg/dEqoB4UujqyloggKGQbhAJmrstJ2ZAmr97l3MBUCtjvTBVJUna1ffsRZoLglI6TqpcEn7h4Y0rXqLbVasjicPqPAG6AkOUFqo9ucl61dFLse0FiwqTAEJG5VH5YH+cgFEcs+PKaCux4xhxVKORKpj7vhMZJ83x3cvCskAJkPqGr36STVln/WxJeo2LqH8hhY2RjxydNMcSq3wyNlIapEhfw+OfVeMdB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72r0EuroHhhEzA7T5gR3oWtSPXYldejprkeoNpbp49Y=;
 b=oEXZ3xiFfxszPMXt+iLZXqJR2qBaMJMfYKBWq1ec7eifEBXlOmnFjj6UVOUmGG1cMFHLiR9NtTRbLfyQb85FWdHMCBfsALJwEU/7v/t2Rv1HqGXS1lDWKYOQu/69GZv5hXeIeOMRh60qqpC0ZkgVgf1n02m8DMjjTjpGcwDvnVw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 2/8] nbd: allow reconnect on open,
 with corresponding new options
Date: Mon, 30 Nov 2020 16:40:18 +0300
Message-Id: <20201130134024.19212-3-vsementsov@virtuozzo.com>
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
 Transport; Mon, 30 Nov 2020 13:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a1f1a42-3691-47ff-6c92-08d8953586e5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB344848328D428E090201F638C1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ml9gDHve55r6E8YM3Ttf5ncZDiu+iCD95q6ZIpSSh07ApCQSXU9ekyRi4x+92eEC9ankosoD5NE7Qz8I1MpM+npAFFdk55hUFBn45rRyQY/AeeeM/DWKfdKrV1G1ormnlLSr9/hK6JtwlhiaH5kvciUWs+z1jQ6a5+rqcNOkCuRyAtpOg1GPOiTkItDgekoulLeMNkhxjyrL46tBzJMkKxvviRWXJuWgRmmOC/h2J8JWVYOk0/Fb/p9Bk1W0jyTwZIynstLj2luC8b4yUOSSrQgwvSjWve+R0zTdJ1v7Yb1tf9CAuxfbemwzxdu2Ltbb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8INu+MmYSOCrLcTbEhf1qs6ZpVkeLX0z/8rkEA+PCWoTSTBF1Kwb1SpLBVnE?=
 =?us-ascii?Q?1LfLfww0FFftCt+UL1uswwxHwVk5X1gyTN7VMn3KfZAXKiKyVHxJCIeMW2nK?=
 =?us-ascii?Q?TyjDaeCdqgFfDWAas78UtCUnHAybfy3IvKL2EwwiGGeDY++VTB/h5Px1xIhU?=
 =?us-ascii?Q?uNXcCXzpECgR1dsV4jFdqv6D85FXL1K3cK505aKk4O5sEyF+ubM29wGVQleL?=
 =?us-ascii?Q?4Vz4suZQd/oS0I3ozde8nkaAPWbsyCgqXK7jhRlc72q1YzgYzcOYyHsJ4hgF?=
 =?us-ascii?Q?yKvQD+MUD/Zi3sHkLzmcSXNXyCMl4W9DYGJQNpCm8iG9RcyggSqpdZ2cCyku?=
 =?us-ascii?Q?nTjDQZenNsDGMzIp0dkUZa2ZsI5EHouhJZjevd2i+ZKN4DCi/QV0r6+aWCYo?=
 =?us-ascii?Q?wfYbNWwlkxsRC/G+KVgDWDttRhDYsA21dhO8IQNF7P9SO785hoW2gOBzkcrK?=
 =?us-ascii?Q?V4y2b+PUAkDxrPBkYzZvTNFCw7qCDZouO34a6YmbCm5sea469ZqXcgY6Zbv0?=
 =?us-ascii?Q?fG1a5nlRWvSvFkzIxnM2tngTwoLGTkFm3X46Y3lr/bE1IxXoDEM+m/cW+OPW?=
 =?us-ascii?Q?aAFunBZRnC21dGar75L06gx7RasZZ3M7VPIoHRwMN+RLNZa5VR4QckdK+MwZ?=
 =?us-ascii?Q?er8Ukbm5GxHyqgeJLH38UI0Np5I6CLs9uT8EIJ3p1xKx83rt+rLuABswJ630?=
 =?us-ascii?Q?U+e1whM1m9hH1Qsk9SIpU7GPWUIJibvnsnnEFtFBHaxLj93Sx9HrUWRVNS3b?=
 =?us-ascii?Q?hHi9xQliE4mnRMGYB9WxL9KaVHjb5X27Y7hng815sz+50Zqcx0noMAs+v/9f?=
 =?us-ascii?Q?IPSiRH/OCcCzKhcdVKj67V4i1kvYxkAc1zuNSiPcZZ37qm0dgOanfkcCS91B?=
 =?us-ascii?Q?693Jty6zTuPfn60Iuonm6wdImZfYdKBVx7K/UUw4NVRmju2xpYwY3JzTAzpm?=
 =?us-ascii?Q?Sux41Di6VXsNmnK37SQLerpU5dU8otIGcZ7ASBv/hgfKebNxX+prdzMgrF3B?=
 =?us-ascii?Q?MfW5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1f1a42-3691-47ff-6c92-08d8953586e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:40.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oarXH9VaXJuZ9o2NAT9hUEGFu1GnoHHDEcRXlO4Ff8fNzhEglteMJVoJ3swk16AQJYyIsrJR0w/Ivw3r9VJp675MZhMx7bNAwv+MYsZ3yAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.21.135;
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

Note: currently, using new option with long timeout in qmp command
blockdev-add is not good idea, as qmp interface is blocking, so,
don't add it now, let's add it later after
"monitor: Optionally run handlers in coroutines" series merged.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 115 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 23 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3e1d6c2b17..d25acafaad 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -125,12 +125,14 @@ typedef struct BDRVNBDState {
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
+    QEMUTimer *open_timer;
 
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
     BlockDriverState *bs;
 
     /* Connection parameters */
+    uint64_t open_timeout;
     uint32_t reconnect_delay;
     SocketAddress *saddr;
     char *export, *tlscredsid;
@@ -305,7 +307,7 @@ static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
 }
 
 
-static void nbd_teardown_connection(BlockDriverState *bs)
+static void nbd_teardown_connection_async(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
@@ -325,6 +327,14 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         }
         nbd_co_establish_connection_cancel(bs, true);
     }
+}
+
+static void nbd_teardown_connection(BlockDriverState *bs)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    nbd_teardown_connection_async(bs);
+
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
         /* connection_co resumes us when it terminates */
@@ -474,6 +484,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
+    if (!s->connect_thread) {
+        error_setg(errp, "Connection attempt cancelled by other operation");
+        return NULL;
+    }
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -529,6 +544,12 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
     bool wake = false;
     bool do_free = false;
 
+    if (!thr) {
+        /* already detached or finished */
+        assert(!s->wait_connect);
+        return;
+    }
+
     qemu_mutex_lock(&thr->mutex);
 
     if (thr->state == CONNECT_THREAD_RUNNING) {
@@ -624,10 +645,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     bdrv_inc_in_flight(s->bs);
 
 out:
-    s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
+    if (s->connect_status == -ETIMEDOUT) {
+        /* Don't rewrite timeout error by following cancel-provoked error */
+        error_free(local_err);
+    } else {
+        s->connect_status = ret;
+        error_free(s->connect_err);
+        s->connect_err = NULL;
+        error_propagate(&s->connect_err, local_err);
+    }
 
     if (ret >= 0) {
         /* successfully connected */
@@ -636,11 +662,44 @@ out:
     }
 }
 
+static void open_timer_del(BDRVNBDState *s)
+{
+    if (s->open_timer) {
+        timer_del(s->open_timer);
+        timer_free(s->open_timer);
+        s->open_timer = NULL;
+    }
+}
+
+static void open_timer_cb(void *opaque)
+{
+    BDRVNBDState *s = opaque;
+
+    if (!s->connect_status) {
+        /* First attempt was not finished. We should set an error */
+        s->connect_status = -ETIMEDOUT;
+        error_setg(&s->connect_err, "First connection attempt is cancelled by "
+                   "timeout");
+    }
+
+    nbd_teardown_connection_async(s->bs);
+    open_timer_del(s);
+}
+
+static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
+{
+    assert(!s->open_timer && s->state == NBD_CLIENT_OPENING);
+    s->open_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
+                                  QEMU_CLOCK_REALTIME,
+                                  SCALE_NS,
+                                  open_timer_cb, s);
+    timer_mod(s->open_timer, expire_time_ns);
+}
+
 static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
 {
     uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
     uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
-    bool initial_connect = s->state == NBD_CLIENT_OPENING;
 
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
@@ -649,23 +708,9 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
 
     nbd_reconnect_attempt(s);
 
-    if (initial_connect) {
-        if (s->state == NBD_CLIENT_CONNECTED) {
-            /* All good. Just kick nbd_open() to successfully return */
-            if (s->open_co) {
-                aio_co_wake(s->open_co);
-                s->open_co = NULL;
-            }
-            aio_wait_kick();
-            return;
-        } else {
-            /*
-             * Failed. Currently, reconnect on open is not allowed, so quit.
-             * nbd_open() will be kicked in the end of nbd_connection_entry()
-             */
-            s->state = NBD_CLIENT_QUIT;
-            return;
-        }
+    if (s->state == NBD_CLIENT_OPENING && !s->open_timeout) {
+        s->state = NBD_CLIENT_QUIT;
+        return;
     }
 
     while (nbd_client_connecting(s)) {
@@ -695,6 +740,16 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
     }
 
     reconnect_delay_timer_del(s);
+    open_timer_del(s);
+
+    if (s->state == NBD_CLIENT_CONNECTED) {
+        /* All good. Just kick nbd_open() to successfully return */
+        if (s->open_co) {
+            aio_co_wake(s->open_co);
+            s->open_co = NULL;
+        }
+        aio_wait_kick();
+    }
 }
 
 static coroutine_fn void nbd_connection_entry(void *opaque)
@@ -2180,6 +2235,14 @@ static QemuOptsList nbd_runtime_opts = {
                     "future requests before a successful reconnect will "
                     "immediately fail. Default 0",
         },
+        {
+            .name = "open-timeout",
+            .type = QEMU_OPT_NUMBER,
+            .help = "In seconds. If zero, nbd driver tries to establish "
+                    "connection only once, on fail open fails. If non-zero, "
+                    "nbd driver may do several attempts until success or "
+                    "@open-timeout seconds passed. Default 0",
+        },
         { /* end of list */ }
     },
 };
@@ -2235,6 +2298,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     }
 
     s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
+    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
 
     ret = 0;
 
@@ -2268,6 +2332,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
+    if (s->open_timeout) {
+        open_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+                        s->open_timeout * NANOSECONDS_PER_SECOND);
+    }
+
     if (qemu_in_coroutine()) {
         s->open_co = qemu_coroutine_self();
         qemu_coroutine_yield();
-- 
2.21.3


