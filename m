Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E43A2931
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:17:30 +0200 (CEST)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHkf-0006CL-TZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcg-0005Zg-AZ; Thu, 10 Jun 2021 06:09:14 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:61171 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcb-00056j-Ab; Thu, 10 Jun 2021 06:09:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbnVm92Qf2SeMTHCSS6ach1TyTWM2Na+TndZkwfC2rehXhDjlTHPbJZ5UocbLCwLdUC05qVucW7xcDRDUtUePufRMAHLE6Rrzok63/U2+Gufu1Q9kwTjLEg23F9zDFipwezSakwA3x03Rdpxi1l8f4SVVqdJ9uJfaeovnyrtiVTQts5AIB98CbaPX+A8tCapcLzYdBIiyLYq46AtS0015BUc7xhcvA6SDacp1eY2Tz7N8HnFQj0CjBahKpxWOGL58LH37T8zVyC/QSu2LB6PVCsHgo20Fx/ZUf8a9RYovVggweP3gLazNy+oyT2NkdvPIv16nI0M5PEBltGLCast1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QghDeJqVYAhTT/1IK+bk20rlPQJutrEJpsWudBmcbfk=;
 b=ZvalgXb6F4pcHfRHnXG5BTbK61ZM0vtNi4G4PBwG7qq+hWXKhFrqeDP9EcjEqXuQiP4kRGvCJ8Olt6lAbmu0AEDoQlCujKMMUKu1LgJmOeId+SjFTAbWEI04JRRvD5JqWjOwm4eKRFFe+2lssi/UQNKZcack5YneAX8+rJto19fwQm3yvsqAkuaeX6ajoMEUVOpOsRzJ67RCzRoDEgEm1alpAtCB1928/b0fMd8cRYLE7dJwmbWlaJhaWHYaWOUljJ/hCRI3fFWUoBrKWD6af1eXH8LgzHFh030QRImQDFudqGz+Nk+aBUtIAeDsVF6yEjNwMuReZHf6zrcuzyC6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QghDeJqVYAhTT/1IK+bk20rlPQJutrEJpsWudBmcbfk=;
 b=HASNSLoCKMXZnWM3DxJRQMf/EocPBSE08THw/P/lImMc3NC2Bn8TKC/DO+ismBA2XZmt/6UPBusOFNpjTZI678vhhgl6HiWjZk+TGjlNMAroG5fQO8An7LMNHfeYcApbRVJqIQHAfRor65CYlv6e6EPmSzC6KfIKoll9bpkcMOY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 12/32] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
Date: Thu, 10 Jun 2021 13:07:42 +0300
Message-Id: <20210610100802.5888-13-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4686f3cc-c7c8-416f-b4c0-08d92bf7c3aa
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502FECB31947641AE0AE31DC1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnXreWWZMvmD6Ui6naR5Sxbj42TbldQrCz1oesWaKFgvny5CuqvXuS0Vo1bjYPRbXG7lOyJmLbgdeicqkCTzwgXe1uiNyC9gvzW0wHvuLRRCenUqmsEwuBFm+/Z46RzX40iYf9cz9hHIHeMzLNfXJWx8JGzJ5LTJQbSB//KRVd3SzJ6OO57tk85ELItKMmDeE+Lx28lCD+eth2P0W5W7fQQbieAtA+DKs8UdCfPC97GgRL0Ic/TZlugB755xQtbZFiC6tc13qMxSCCv2NuSp8OKce3PO6M7ZLgetSZmVUezdx/04Gue+13CGjBWdUEwmm5MFd634oyD2Bh07HZl3qdqbYzSW3CGoaEZOcP0Ld5cj06fyx6cridtjmYYWUrpd/gq59Ur6mCjJoBfomMqKSEyCg+X/dO281Vi1SfBzR7I9EaEHhHJw6hKBRVSIltDffjN3BnJoetgGQuz5kzvVkWY6CFg6yGjCQhyJVZPWOPK0h0nas+9jGguFGiYc6xC20txcEf75z0wGMUyhR/UqdXZk9LS4gdvSRaE+WoklgUb4CI6A5LFS690zGEsToFftT8tS0TpvJwdWqlGlF7oMlEsqNwibDWrw8BOI06Q7xmcs5nhhUF6Q0IaNXazn83pwxt4ojDcKrDqSXHoRSEiZZcoE0HvmGBkAbiEhh5ltOePDG/mQ/5nVUmC0GwhUSiN/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MdmtAJzHIDZO6gZu5rIvdgXcG+NCelDkhI2ozz3GQegm+0iH0YSGFxI37a8R?=
 =?us-ascii?Q?qxtVaLxylS+CxzNbdsAaqx412pjE4vbGe4/LoaYkffjYObv5kR1haQLyRgIs?=
 =?us-ascii?Q?CkWSjqDMfaTdqmwz788z3ySlUtifPOvtSHm6+ljBDvsorNddPxETZvauP4lt?=
 =?us-ascii?Q?R1EdsVyGQ7Z8DjL4aP+vsDfdyu+NzMv6oOhfa7cIH58Wv1Zh1efus6Ns7Ksg?=
 =?us-ascii?Q?egHdlo5Ce59Zvt5hEwnTjIB8KMIbZuLzJRBJ9lkXh1V+pph42yyEKCvb09gy?=
 =?us-ascii?Q?6yzHb75umoAwr+FTehWG6g/QfiYp7h5DgG1b236cZvlNOh60hduTOyCJ/iND?=
 =?us-ascii?Q?IaEcS/kRBHNtCf2AxuASoR6yscvMZ58tV5W+gS36k+5lVn6aFR2eCRzkcqQ0?=
 =?us-ascii?Q?I4hCWkQ5yJJS8k1JUp1p3S/RB9jxX30IeIiqWsMUd/EIzx4+0BcPugPTxU29?=
 =?us-ascii?Q?3WY3tFh9pfC2ONUuGaFNeerwO9pgKNhqfY6xew2QTrxtHeYmlFGpJTXSSmHP?=
 =?us-ascii?Q?s6PW4Zqzxowozt/cdQUCMxRVUVVvZbY2VqPnzEb3TDYut1Ge2uOe+6Qfsqz/?=
 =?us-ascii?Q?p+aIvPluNcDkw70Jf1+0bALUdU6IPpJ8WsCR916h1SjuOUHvSsYtQX6RuZBJ?=
 =?us-ascii?Q?rUoRFOmqkaZgu0TAaCm3dqsfb5HuMH2zSSubQZfmeEPvcx2bVcu6rY8wGqiG?=
 =?us-ascii?Q?rmSr/19glXkHy1Tpv+AWFKjLlx01vLe3FarFhFIRxpOeylzHzAa1kXCqajY5?=
 =?us-ascii?Q?/6BaBKfQ5fSAnoOLCmj/ula/tzc1sW8mEXLd39Qg8i4o9rOHoJ3QyO6gP5Uh?=
 =?us-ascii?Q?S75Q1ejZrwD8WxbCmDBSRXtrXtwAXTtLlAhYayaPv1iDoYIegxaYcI1J0w+G?=
 =?us-ascii?Q?A/EeZSXjYhA68Rrz036tthkDFoqwEGg5AfiBb15FXQwlQmXzz4DUF7f+Ec1f?=
 =?us-ascii?Q?dMAGnplUTqVx4RGxnz8vKNeJFjbczlXGsL5XsKdGbTKwrOItLZ6Bo7J+y+fJ?=
 =?us-ascii?Q?aQy0sKcFORKLiasRJYq13c56KjafaSTVyNdTy1LmD3D+A4w24HbKi/voyMgx?=
 =?us-ascii?Q?meRaCAoCflDiEOJ+bR2dFb+ZAvH69iAP+2vWfxjaLwmrASYCDuEvL3T01MLn?=
 =?us-ascii?Q?7XX1qZcjZXrnwyJVhjbu+yeGzYj+XL1lMLqZdvsv9x1REUaTNTUgv0DsIhKZ?=
 =?us-ascii?Q?WNJG+PYso/AF1BEenXsT7In213gFnvF63wIs1oBps2jd96eztYTbZNEuOYyP?=
 =?us-ascii?Q?qQ33mPJb0N6hw9O7dxgNa3zN/j/P60Uxg1A45T6K1D+TKtGUBl7YYoXKHdEG?=
 =?us-ascii?Q?LD45eE2XpZ9jzTFKatcyFGaa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4686f3cc-c7c8-416f-b4c0-08d92bf7c3aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:59.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Eb8lRUSOFVgKRxrAkvwDqP/RWQ40blxyJGzJWxtDLUaXaKbTTaRQtlujsICHy/UdWCO1YlReJ+awayCxqnKjQD4bHA/+fVgPUPo21Nn+nM=
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

We are going to split connection code to a separate file. Now we are
ready to give nbd_co_establish_connection() clean and bs-independent
interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 50 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 58463636f0..9d43f0f2e0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -129,7 +129,8 @@ typedef struct BDRVNBDState {
 static void nbd_free_connect_thread(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
@@ -415,22 +416,37 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }
 
-static int coroutine_fn
-nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
+/*
+ * Get a new connection in context of @thr:
+ *   if the thread is running, wait for completion
+ *   if the thread already succeeded in the background, and user didn't get the
+ *     result, just return it now
+ *   otherwise the thread is not running, so start a thread and wait for
+ *     completion
+ */
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 {
+    QIOChannelSocket *sioc = NULL;
     QemuThread thread;
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
-
-    assert(!s->sioc);
 
     qemu_mutex_lock(&thr->mutex);
 
+    /*
+     * Don't call nbd_co_establish_connection() in several coroutines in
+     * parallel. Only one call at once is supported.
+     */
+    assert(!thr->wait_co);
+
     if (!thr->running) {
         if (thr->sioc) {
             /* Previous attempt finally succeeded in background */
-            goto out;
+            sioc = g_steal_pointer(&thr->sioc);
+            qemu_mutex_unlock(&thr->mutex);
+
+            return sioc;
         }
+
         thr->running = true;
         error_free(thr->err);
         thr->err = NULL;
@@ -444,13 +460,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
     /*
      * We are going to wait for connect-thread finish, but
-     * nbd_client_co_drain_begin() can interrupt.
+     * nbd_co_establish_connection_cancel() can interrupt.
      */
     qemu_coroutine_yield();
 
     qemu_mutex_lock(&thr->mutex);
 
-out:
     if (thr->running) {
         /*
          * The connection attempt was canceled and the coroutine resumed
@@ -462,17 +477,12 @@ out:
     } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        if (s->sioc) {
-            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                   nbd_yank, bs);
-        }
+        sioc = g_steal_pointer(&thr->sioc);
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    return s->sioc ? 0 : -1;
+    return sioc;
 }
 
 /*
@@ -540,11 +550,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
+    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           s->bs);
+
     bdrv_dec_in_flight(s->bs);
 
     ret = nbd_client_handshake(s->bs, NULL);
-- 
2.29.2


