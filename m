Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC55361B35
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:16:55 +0200 (CEST)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJeo-0001in-4O
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXo-00015V-7t; Fri, 16 Apr 2021 04:09:40 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:41299 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXm-0007qY-AB; Fri, 16 Apr 2021 04:09:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV47aeC7jDP+CItlRWvVC4ACAdXZ3sej6wHkHyryOv/P7ckdspWG0w6DsPl1FjFlYmV5c6F1A327X5yICqHsOcX3VeM10Vm/oJk1Sdhre1ikzNtGQ8hWmzJj+tv3VNzQukAnz7u/TksSDVJylws21xEYe+QiTMwTUwLr5DgkJe7T+vOyhssJ77CEiPnB7T35mbKwpX7nD0qCkYrZIe1z/kAnywdZmPXAOQSeP7EtWrwPdHZWSlztZ2IWmrFgVegJyKAhVu+4wqbzKHpxobrFjvfEJHZE3mfbJr6TLrKwDgw2b/JxcMS0hDBO+uYARWxvATdx7czfzrgkA5US67cXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3rPZzhPaBrd+1olCpj/0fwhxHRsV3WfO54ofj7f91U=;
 b=ZCG4haHu0goByjW0RgOzZKkWwVzwAgRxy5fWQ45DTqFl4X0uNlBxO9cZpLawGZquJWF6DEXADLWCP5x63WvOYWwHn65Xkjdqos1lc+9wRE4QCBSqJ6KPA7H+4moPnUO/ecH33xgpp7Jxz6gFlrbfvAU0wH1AeyxEnwmzzlKY9FNxmVdVglF9sDUXC6bhlNeiHf8QI3Spj8GtyJlscNwoItRNkyHPFNssmYH6i2XD60+jb2T1VPtrKSNgtdUZurwokLub75wZ6rUrKTcgkBInJSfH7Rhbtp5gXr24UfgCNg6nYP6roFVdWHmxL/Kx0af8IBl/yaGwupNp86kBG7M2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3rPZzhPaBrd+1olCpj/0fwhxHRsV3WfO54ofj7f91U=;
 b=hJmeOoa7qmoG7Elvq2vX65981sHISxeIRfP5NQ8WduvEWtS07htH2UQoBXTOSU/dFVM4gqlyZYahJsGQGi/y+IYiLyJZl0xfXEbRukykGQmoGxsK68NVPBH69fLLBw+Sj1Fvf7Tk+f2YBi/eumqKT3tb3W5EzuMKPFhD8lBpwBo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 03/33] block/nbd: ensure ->connection_thread is always valid
Date: Fri, 16 Apr 2021 11:08:41 +0300
Message-Id: <20210416080911.83197-4-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbd2bb1-75ef-4a05-a62f-08d900aef5ef
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50786EF9460041F4725C3EBAC14C9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmHcZDH9OJKVSRfgfvyjbrBXMxjKJ73Xd2OpTZTYSxHFFeAfrI8kxdwUZlH7yC5ef4wZf6ylFTwVsWkrs9CRfpFyhAETzp9UW/tUke7H66t/wNbJPf3vFIvYRlid7xyZJiqIpI3NJqufI4JJsbW565pU3tT+ccYNvjxfhwOwc/qKWrWhzKYoZWbgmhwYO4kZ+IWCteGrJyf8q2F5p0MB7zE7IrQjmiZE3HV+e0QCXQcxNv7SqudRJjGeaTQ/gYT8Vdww8gO8EkDlhnLmFqmZ/Vqz0Mr9r/vqnN2+fhN8U13pBLJgDw+NqYmWPiL1nAoOE1D94lqp4aMmMgXua19Pyezb2gPQCW5zAOjLbBg1T+MLRpGCTGFFxDdMfbAn0SUrnS3iozY5QGqWg7sfxG8js0CE9a8GXVR36IvybFhAFEh0DiCEgZzjUJAp6H9N2twUnRK0WBTVdobbQ0JF8niZ6v01L4FvR2DMUGZ8E7jgFRTGCV066KLcbPCruQcdl8BJxAcYR9/6bR2ewYqxwesEaoKcKCvnfihSa+Utj4VLT87dKAlUvQQjjTLpTJlpPlgn2i+YoZAqtmLFHxsbXFQR+9/QDXokFcdYdyZInxaqJAZn28uKVGE/OPAy6SLrpc4AzPELbE+89AiwfvHqXcWKdM5nrtD7BQi7YeIg4aBsEem7WxET6xkB5fDCGQw4D0tZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(2616005)(66476007)(66946007)(66556008)(26005)(16526019)(6916009)(2906002)(6666004)(5660300002)(69590400012)(107886003)(186003)(4326008)(6506007)(316002)(478600001)(8676002)(8936002)(38350700002)(1076003)(6486002)(83380400001)(956004)(52116002)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qHJAt1GuNC+q7pFtEzrHZR9+r4gZdBj8XE9u14gnN/CI9RzUmdB8tkhVclmS?=
 =?us-ascii?Q?/nOCqUoYgIZHkpZEhbejjWyaEm3AkxXi3MAYhkHY07vW9t7yU4e+Hkgw3Ozf?=
 =?us-ascii?Q?cmDlrkGfW/HAxoepPFC2tYczzb9ESRuRd5874jO2DMtF2oSqmvZtbE9+l8Bw?=
 =?us-ascii?Q?OJ09UeC+VDvg/K89bPD6FFN7wvOjOfOF6R2qikkd7Ly/SCG/sibJKLJSsuSW?=
 =?us-ascii?Q?8/rU7V8wqnUrEGDyZDKbmBbW3t+E5obIgkQNWnzbHXQIYyEshMFb3f/qcZsH?=
 =?us-ascii?Q?zM5DTOxZVM+WYPEOPprQj/BKJByPnZ+ilP9W6Bf4HrTs4Gazd84ZRY5oFG/v?=
 =?us-ascii?Q?ewsV7wbXDsKxaMpnQ7SWTVWbQOedKHAGkm27KQM14uK0HIg+o3cTi4ywp4t8?=
 =?us-ascii?Q?+qD7jxhiIDsCJ6h+w9poS7GIQVjWE25UBcQ0My57l+T10r7Sn1W/rBewdc4n?=
 =?us-ascii?Q?INKSgMPicf+tDyWmIpMtrD2CtFyb88PYTRVhnU1T6XPbVso07WYTABQefpFB?=
 =?us-ascii?Q?tP66G0ushr+5dYXGx8Nnly7zct0jpxR2zoLdRr8SyEl2wGaJg1oBW2yYufqC?=
 =?us-ascii?Q?YuyHYLbknGOlNr2Zf9+iZUXtRtAfcxoiTBlcyet7D08YjkpyJSg6Rzfucl5E?=
 =?us-ascii?Q?dN9zeAt1LXViJ69wyUiVPw+ja+7c2FEspE7HJlO/dXplciWqlKlIJGtcJhB2?=
 =?us-ascii?Q?Bw0+4brXNLDeRfZX6RsjngugPl2FEVvIA+C9OIKpYMqCI/jRSiEQ1sYJnyes?=
 =?us-ascii?Q?LblKiNQrcyry2VNMQyC27sp7uKZl4O0kjfKjHd2qkECUrWsZ18nylZfVSfh+?=
 =?us-ascii?Q?NwREPgiSsXqWC1GRardZ0OswWfN/F47JwdIdp6O5EwnhP0lHWK/kLS/uaVQH?=
 =?us-ascii?Q?1Uf7hcJLEhM2iI+HhvCHIl8KrJRc12rcxpz/vHnm1qi+xTpnWA+l+CQCfwG9?=
 =?us-ascii?Q?cvoe/+A9lrdXRNQpA3qLczbG8A4QaL+0ZTJ76Lx9cAFObPzPFbqmj0IkEwSd?=
 =?us-ascii?Q?mbkSXllHzdMuXEoqGt7ZVxvSx4UYk8esfBxpMoXVa8A8mxCmnIy/vvbdC2V0?=
 =?us-ascii?Q?ylg4vMCsosBECwmjvX3bS+5hDOGNB0AHqiMX6KsgJMeS+D3FVPaARrohge1o?=
 =?us-ascii?Q?VRrxXZnM7bagREUoHiBpdhJepYPqwPszc3mkbJOoafKO5wjMgFXba6KJGNdJ?=
 =?us-ascii?Q?1VK1NxAoeHZ/RvLmxuIe1Rxx5DDS3zChOTH6H/N8DV9cOQfpVty7X3LFVaH9?=
 =?us-ascii?Q?DPxhgBXzgCgEBerOPUCWkOj8QXblsfpSXTWJdvdnxaQjTDX7IjU/HEzVucDt?=
 =?us-ascii?Q?D5nHncJB6lTFg+FN3Khs5143?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbd2bb1-75ef-4a05-a62f-08d900aef5ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:30.1612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNKYxoiyzM9iOwPKeD39bs59IVtm1A6epVc0uXnYaVOyr5fn0OYoAfwk094JNtBHaD5dJgRtNKeXwBLBCzwhGqez3jvfxs9HOTC5Ee+968c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 block/nbd.c | 56 ++++++++++++++++++++---------------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a407a3814b..272af60b44 100644
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
+    /* the runaway thread will clean it up itself */
+    if (!thr_running) {
+        nbd_free_connect_thread(thr);
+    }
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
@@ -297,7 +311,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(bs, false);
+    nbd_co_establish_connection_cancel(bs);
 
     reconnect_delay_timer_del(s);
 
@@ -337,7 +351,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(bs, true);
+        nbd_co_establish_connection_cancel(bs);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -448,11 +462,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
-    if (!thr) {
-        /* detached */
-        return -1;
-    }
-
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -496,12 +505,6 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
@@ -549,18 +552,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
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
 
@@ -571,21 +568,10 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
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
@@ -2306,6 +2292,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    nbd_init_connect_thread(s);
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
@@ -2322,8 +2310,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
 
-    nbd_init_connect_thread(s);
-
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
-- 
2.29.2


