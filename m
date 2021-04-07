Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378CB356AAD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:00:04 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5ul-0002ds-9c
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iR-0005px-Hw; Wed, 07 Apr 2021 06:47:19 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iP-0001Tc-H1; Wed, 07 Apr 2021 06:47:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHeuGJDC+BA2hW4NRcTkZa5fHowJ6UjEz3BTxWY4Uo2JJYz8U7qtH7/r4H2z1go/JoAn6Cyv/ypyZ9lno//GnUb9PPG8zsBS6FjfSzgAUSUPqHB33kVjo53+3a7wLD8yXwIs17j1zuS1vipH1eEupEYJpskEHqo/Q8BuRAA/xCbvASY9iAw6A20MzGNHfTXU3RihiNFzlUfTUISI7mlyxIoYnB1bRoLm/N5w+YQ/kjD8vaR8lUQdnCRvItmtbstPJa+p/Nayj9dUJ6dP/9xhvQkkdi+EmYE9INg9+HB0wioVqFX8QLW7PoE7B2/qM+6w07tJ4eX3SZwedMGb3pY8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0s0fatcTUiyzTjLlBF94M7o3eaXLQI/jTsHxrFDSs=;
 b=cWdCNBktksVqs5OTng0ulo//+kX0KzjiaTZ0zBdwPHP9qvV8Am5zBrpHYyvKBknDTaIokSH/t5lJ2hSZvj648Q53lvr9RrhJN7pv/TnYCJblEQPh3m4Bvwz85ZR6m6V6nQVvQ3GuvrGRjL9XrhiY7npICIwC6Y2tvv2uOhc/irzwezjJFTTFKzvG46QabuIidF2pcMqjA2vzc6oIJLLy95ktJH+Jp7XLOu8CF2lEBSLq16v9Bm5OwarP0B0Nz3Vln6ebpKAl5nPZKAgaoGAA8M87DexdIb/6IJODR1uaa93RRZ8ZOBD0Kr8ZZ4i7gfluM+tXZqBvbvgvk10jZWL8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0s0fatcTUiyzTjLlBF94M7o3eaXLQI/jTsHxrFDSs=;
 b=joaAuc5Kgo8+rFTQ6FTUWN4ecUaWISuH5OxAqXCL+7+TvfMdcg6ZXay0aGLK4k0egwJ1ByuaUJXAyE/nhPRBCDptGc1jVYDv5BhWt9H9TFDklexMeAcp0Ymz2RzbkuXLFaILney35QcmZ4mVcSOAu9Dzi+Q+ScJBqmFkRuY/uyk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 10/14] block/nbd: move wait_connect field under mutex
 protection
Date: Wed,  7 Apr 2021 13:46:33 +0300
Message-Id: <20210407104637.36033-11-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 942cfb39-0c12-4d4f-80c9-08d8f9b27f68
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24525E6EC31AEEBA23643FDFC1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TviBLIy4unDZHJvbWuZ+lR8vtWshTv6TY+38gJdmHapOpw/4KpnAMZJEtJr8Ul+qnm6hZEkqRFK9G3jD6rD58FT8A7e9oUF8oeRlaNiCij6NTUeE8FwJbT9Pi/yCe3DEgtGjYRyuNo6gxm9BqK7zhchvZ2E6PoPRHnJHkzuFzaktXGOl4TBgdBqsTCU37HVYfh3UQyviBX4ej5g50u0MDp9/jSjPpm+OUL0C2NXKyJzj5vVLryZyEY/pG0TO1SutbPmbj3dqf7W8F/abuxkb/RBgXP4Xaq5aNmiddhUmKQvnIXiXfzQ6JAIi+FWZdQ2+Wk1ypX6NuxJuRfggaDAC2BpQWJDHdTt6skivy4zbZh4Q7LRnJBiTHSjNAFGoz2boSybGDG5TU2MsIWJnSwSTJu+cWw29cdHYXkBeR/g60yiTyXzmmmnQ8U9tnmX2EhKNU7T1UOjRwiK7aAx/LFkBR1zA1FJbn2JVc3/0YEZ9cW11YlfZo5IZmhH2peC0vbVioByRaUtPcQQXcnwy3tIOEt2FyKS7WKlbed3hOtAWiFkakZIQ/AUiXY7OFXeU0I1L/m3DyoDsZHnM9VU6cJE2l79l6G7UtZlFB2Ik88MT1XNi/EjtkH2Krpw7bV69MBZt5FqgZN2CXrDFE6g85ABcG2huATS4v/qYLwIXyWZB0s5nqzpNHrEQUcD1w1HqM09eocywNxMFMkrDxu/VpYqUjqbep3ki2/5mBr+1pmGMT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?haElwzNzWt2rW37NTAz12jV3Yo0UzlNNHZH+ZMAqtpHWz0ELhhwDFQfpvShY?=
 =?us-ascii?Q?vmUW6qxr21WsFRM8cHEnXIeEJk58186xPMyEpCKFSzNEK9C7fmvx7GF+up7w?=
 =?us-ascii?Q?N4COchRaA/XVQO3IHjmKKoSCnIBq+Zw7uQohZNOR2J646c1PAF1BJ4XbShBK?=
 =?us-ascii?Q?PTV6g+pID4uvkidxITjuxvoWl46hsYDh07H5Ks7WyFOoOzotmO3NJSfcVhLl?=
 =?us-ascii?Q?6j4YbZQ8tto+BfyCXVhkgTsRBp81fiIGjq0rQp+nvjNgl+VfrfW67RpCLJnQ?=
 =?us-ascii?Q?belUeghfI++5/vclswpQ99KruXy7v2F2oIlOBEJd12ZhVcoBTARiUWDEoWI6?=
 =?us-ascii?Q?C/puqzZ+omGuS5eE0o39877X+lfWX72H5ZV/VAABAwr9g6JOGWamKE32lg6N?=
 =?us-ascii?Q?a9wKzqHZnDZXwfiAGJPaHfQVfXqxlJaoydjLLXSnb0mkDpg9AaaUHZ7bp8VO?=
 =?us-ascii?Q?3T6FHx2T5HcROJO57CW33uW8ypSbrZdyrQny290sgrWSRHGFeNMuGJo7jP/T?=
 =?us-ascii?Q?BwAxtuIk7xfKuXn719OcMvBRkQytL8u0/P0GDHZPYss0qOa4mwe4BIotSYXG?=
 =?us-ascii?Q?/UXGskt0ELrgbePoB0U6/Gyh0D8wSEbMB8+uB0OLJ2Ofx2KfBSX4Id13B/Og?=
 =?us-ascii?Q?JqK02ySV1eCsLLZM1xTiChCJB8VfRzRFVCW8FHSGv9HY+NPDGF2m4IDz8nBu?=
 =?us-ascii?Q?CEWmqxOhUMbSc4KksLuG5aXgU+ymSEECrsE02XZvZ/ONkGS/SjZ//WCiRvz9?=
 =?us-ascii?Q?1r257ophzDzKA5ZIyMqSXV5lAqmshfiFYUOGskIW5ZITfYxjCnBP5iYkb1pz?=
 =?us-ascii?Q?Vn7/QqzpXpf4dm0kxEDKHs1cu5SooNOWtGKTyiYgI+htS87NXd1Upy6j6+3+?=
 =?us-ascii?Q?SLEbeTZydONPvw9a+fGWwrejpY+QJ+Qt60KRbGu93KW+7aaxyqR2wiM3N83g?=
 =?us-ascii?Q?WOA839UqZmoIIt/BuiMcCgItoY+PokEmqmX0Zelj344jQX/zVxbf1Jzz4Zaz?=
 =?us-ascii?Q?tJ6MNTd+7Ze8XgBdaO6es772ye9+H5bkxYOzOkHuTNHJkWabKpBuxMXUL2yv?=
 =?us-ascii?Q?fqPrq2RlVpmj+IOp518or9YEVncNtdYEjR9xselwV6K8LrkSHXPaI+ueD9Sb?=
 =?us-ascii?Q?X/Asu4J5tpsorzXyxDQIdVcie0S4QSb3znzqqt0oP5X6+XAoXtYWGXB9AyRG?=
 =?us-ascii?Q?91Dq4M/qZXgf62UFO6FfzU35sMeKPsoEYvRmxWkHvw+oBAMfWDC5OhqrFexT?=
 =?us-ascii?Q?R0TwQHJbESG4nGbSg2POmfHQ8d5t4TrDatJs94rDZ9p6KIlXjdd49pa2a2IC?=
 =?us-ascii?Q?YOS2iGvCCx7h2TDyBISJtCSH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942cfb39-0c12-4d4f-80c9-08d8f9b27f68
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:11.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X27xW9wAw1ddtwgnPt0vw1ByKxF2wxDWy2VRHrQ/gJ5iDiKuAFv5ieNPaAXEI4WRvxuQY9SsC33VxUxDH881hy7GuakhLEbPtTdev/BMejs=
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

Move wait_connect to NBDConnectCB and protect it by mutex. It provides
simpler logic than bothering with bh_ctx (which we can drop now).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 8bd52884c8..29bdbd38b6 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -88,13 +88,15 @@ typedef struct NBDConnectCB {
     /* Result of last attempt. Valid in FAIL and SUCCESS states. */
     QIOChannelSocket *sioc;
 
-    /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
+    /* All further fields are protected by mutex */
     NBDConnectThreadState state; /* current state of the thread */
-    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
 
     /* Link to NBD BDS. If NULL thread is detached, BDS is probably closed. */
     BlockDriverState *bs;
+
+    /* connection_co is waiting in yield() */
+    bool wait_connect;
 } NBDConnectCB;
 
 typedef struct BDRVNBDState {
@@ -129,7 +131,6 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    bool wait_connect;
     NBDConnectCB *connect_thread;
 } BDRVNBDState;
 
@@ -365,8 +366,6 @@ static void connect_bh(void *opaque)
 {
     BDRVNBDState *state = opaque;
 
-    assert(state->wait_connect);
-    state->wait_connect = false;
     aio_co_wake(state->connection_co);
 }
 
@@ -374,6 +373,7 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 {
     NBDConnectCB *thr = opaque;
     bool do_free = false;
+    bool do_wake = false;
     BDRVNBDState *s = thr->bs ? thr->bs->opaque : NULL;
 
     qemu_mutex_lock(&thr->mutex);
@@ -383,12 +383,8 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
     switch (thr->state) {
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, connect_bh, s);
-
-            /* play safe, don't reuse bh_ctx on further connection attempts */
-            thr->bh_ctx = NULL;
-        }
+        do_wake = thr->wait_connect;
+        thr->wait_connect = false;
         break;
     case CONNECT_THREAD_RUNNING_DETACHED:
         do_free = true;
@@ -399,6 +395,17 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 
     qemu_mutex_unlock(&thr->mutex);
 
+    if (do_wake) {
+        /*
+         * At this point we are sure that connection_co sleeps in the
+         * corresponding yield point and we here have an exclusive right
+         * (and obligations) to wake it.
+         * Direct call to aio_co_wake() from thread context works bad. So use
+         * aio_bh_schedule_oneshot() as a mediator.
+         */
+        aio_bh_schedule_oneshot(bdrv_get_aio_context(thr->bs), connect_bh, s);
+    }
+
     if (do_free) {
         g_free(thr);
     }
@@ -435,20 +442,14 @@ nbd_co_establish_connection(BlockDriverState *bs)
         abort();
     }
 
-    thr->bh_ctx = qemu_get_current_aio_context();
+    thr->wait_connect = true;
 
     qemu_mutex_unlock(&thr->mutex);
 
-
     /*
      * We are going to wait for connect-thread finish, but
      * nbd_client_co_drain_begin() can interrupt.
-     *
-     * Note that wait_connect variable is not visible for connect-thread. It
-     * doesn't need mutex protection, it used only inside home aio context of
-     * bs.
      */
-    s->wait_connect = true;
     qemu_coroutine_yield();
 
     qemu_mutex_lock(&thr->mutex);
@@ -512,9 +513,8 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 
     if (thr->state == CONNECT_THREAD_RUNNING) {
         /* We can cancel only in running state, when bh is not yet scheduled */
-        thr->bh_ctx = NULL;
-        if (s->wait_connect) {
-            s->wait_connect = false;
+        if (thr->wait_connect) {
+            thr->wait_connect = false;
             wake = true;
         }
         if (detach) {
-- 
2.29.2


