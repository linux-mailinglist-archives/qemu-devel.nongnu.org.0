Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56C361B33
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:15:58 +0200 (CEST)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJdt-00089w-J6
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXz-0001Jm-BZ; Fri, 16 Apr 2021 04:09:51 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXw-0007xx-Fw; Fri, 16 Apr 2021 04:09:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UohggJ0UHEKT9M1sikKN2MtyhmqnHUE3QvJBVeqH+/jFptCViCBhvmbZo/QGwR1Sj9FbsoKNBhd1b8a+6QFpXoO0wy2xAxNPjM/d5+9ibmbbowgD3cqkM502dh8qKpPkoBttpmHrEWOBBVd4zEHbJoULTrY5HW7T25MMKKkVdFbD+gKjF5/nYAXXvsUSdh92UAnqh8+I+CGcZhJnXv4IcK54AL6McBSDhcHC74hoXoQnnLPf5NQMJWGMUQ74+17crSn6DTQe8gUhdF8u1wbdV8KEE45nNh3+awR0hGrgopWTaL2dMNZ1bFCc39qiPShbXSvXEjQVC4T2pyWgPocKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HVou16nuRKjB/2sTi9n9MPkFdbgdvEXaQgaBBLJ5kE=;
 b=Lwj5EjzWK8pYHNZ6encGlcpFwHNBvP4CPKhuvVS/zIOF0usdAi4rSBxcZPBCSKGr6+DEngyMgE6BkaSJ0GjK7MrhJ7tEqiRiFsG8seNetJFq+buTdLZRzpH60KuikYsUJ07WtdSpzxNGR4WIkSr0r2ltSDElSjiokxIh5uAe0VtlUCVd9qRp9p76+qk/OZRelIm3HJhMc9u185MNVOmo8VC+6e9PeZwpWK/l1dyFypHJA5kD5Qy9ptvXtvaZdFVLgzGhDI7/eEaIj2qIPlvW0zoO4SxOkhph1rWs/xkfzLJF9yKpqgAkPMf2ciAKtHFGroLPuZo42jlfuDVifEVAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HVou16nuRKjB/2sTi9n9MPkFdbgdvEXaQgaBBLJ5kE=;
 b=swAQPA/CO/RtHXFhhSntZCYyqz6VLUb3wC8S4px+tGthAdMki0Cs6jmBrBgg6KkhjMoCv36a7m38JaABAZWJOFp5tktQrjO+EDWMSsiRwPNc6iqdw/vP+2CTg9kpmKNFCfSVgLHrzcVGjashjxni/RyNbuWcpgF3Ee3/ZzCv+b4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 09/33] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
Date: Fri, 16 Apr 2021 11:08:47 +0300
Message-Id: <20210416080911.83197-10-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3173344-502c-41b8-82de-08d900aefb01
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469151ED4A99EFDB46A7D731C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTJjjT0neiST3KpJ14dkKIFW5e29lpAQJPLNaA37hM33oR2rKaSJktKC7Z9yMAgQHdioba07jlWO9BuLwe7n5hXWJDQEDRzsPZBnNMkSzSzBhomCVpFYsJvzBjRgG4sVq5XuOYMoEdhTORmYxPIexkyrOSRzCY6hAhpon8P4eWgquVgvsY2nbW7wxSi96ns0E0BCHVRBqI/rJI+Lu4z/hGVxr6Q/ayB25NkKiebnhrJCrLVgPsmQeiNVv7foFJF+IyAd6Lyv6SvTraGTNFD7y0sZSMZwK/qYl3Yem7wn+3P+XnqjWvO783U+aQWvMQR9aX7EfAI6nqCTSCmkne5yGe0iyDkmR+9+imMwI77DOLT0fYyFo96/6Qr0CGCNprQyaNzOpKOQEiJdZwDB5a/NLKNg/y9BjRfomElhQTi4+bXFN2WvUXhx8Q23T55vHmeyHHuVxGZrUZexkTipsOx77dnePHfNrn3EqgnghuPwrvpQMTd6NSV9oG7Ww4B5jaYHsWq3dHV+11o7UQ8WKPljo7JpRb7OqzkHw9WVBQ8onl48uOwHNMKcbETA3xr6LezFMrNkV5tlXjk3mA98h53s6sNfJRIVWhhV4yaIKv37AS8PFEC2e6NECgi4bwXPv5CQwlbe7QXE5xp1lGG+rjaEBlxj8rY7bgoAh4hwOmi/VNbC7IGSkmjQ4mrU7FDoddm296BRDs2jXqD8cwQ1wi+GPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(36756003)(38350700002)(38100700002)(508600001)(6486002)(5660300002)(8676002)(66556008)(34490700003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LbKtiypMKgGQYDzILDsSoGDMrsp8SsJ15dB/bSJpdOUS3mPSYDn7Q1zAw4vl?=
 =?us-ascii?Q?5vvD7IZC5vvPo57D0PGAuhvuYOGN8uckspVg6v+cWBC2LA3ml7WCf/AnfXH3?=
 =?us-ascii?Q?EGs80s7UzXeyx8v13ApUu6QSIHtozemPfrj6S5iryI6McLGFAYVCeg5Xppiz?=
 =?us-ascii?Q?7oeDgMwDZ/aJ/1cbOPu5t5EVrejpfJYHgJkYLp+vNp9oPLFYEC+9veKg65qR?=
 =?us-ascii?Q?10fTXaysW1QTksSINL+iqWTSky8o1+zGgfGgYN+hHXagE0pYR2Y2V+R2FL8a?=
 =?us-ascii?Q?tX9KFiKs5l4ksqIxstLxaQdNPlYI1wlcFb0i1Oihzi86BfAW8k3rXQXSaiQ9?=
 =?us-ascii?Q?L9VhUkzkMNyXdVZKeqhPfPPM7DLfPzPSXMDMhBtLP7Uk52PZPQYzhLyMlWzm?=
 =?us-ascii?Q?GC/1IJEeBoA+ohYq4YoD1h954pQ38HfKN+WnwjptNLkMp0TM9XLinFR826qG?=
 =?us-ascii?Q?Nij4+CDAw5gUV9ewsp2Rgm04DAocixT01egbfH6C17BbFllTwyfz3QNSDbFR?=
 =?us-ascii?Q?Wse13j/ecvfyJLNO5GAnDpCrjue3VC8iRMfbMUvIcjNR+Ze2zpICDWYrkA0v?=
 =?us-ascii?Q?VSntj6AZoVxhGi3A4aWss70aq4R0MWXCcZFeXBwpROKj6sP9a1vjk8WmtxQe?=
 =?us-ascii?Q?q8kD4QQLiYMCDHsPoO0uu0qr0eSoTP/lZoBXsnw1ltUkCAycdfYUlTScVJyw?=
 =?us-ascii?Q?PWXoWr+I5CGz0ZoSCN+glL+g92E/NDWLKnxtnp4wUiNvljrKmrtDF3asm/xc?=
 =?us-ascii?Q?dh3QseAi33P8C9u9IxlP05llfYFURB1eA8l7wxOSwFw01iZeg6MtZGisvecn?=
 =?us-ascii?Q?knaJyMGkgxrtrnBXwgetb6acQynBPmAb4m+ICRZ+gJ3nHKfiry6twSJX1Bkp?=
 =?us-ascii?Q?+WFCpouyfXnmBrJLE2zoZGHhKcIF8/ofFHJBT7yaXXpGwkjbN2/UN0pmG9XR?=
 =?us-ascii?Q?Gye9jLlQ0Q1owJ9LG1TB/S3YrVVDtcQiedGymZtIfTkHQSe9btMOXAmzrJBE?=
 =?us-ascii?Q?eQKlxePJpWAZ1RlXipY1nIfm+8BxcQ3ucCjOw/lie+HwdtPEAYL/KtXuXHYH?=
 =?us-ascii?Q?bOHMz9v7yXXd5PW3Gi3zBsVzhkc5ORdC0TUURRK/r7bt05/6jLb05nxZUqxD?=
 =?us-ascii?Q?9zveq5W+iZo8ZPID8GX1yT+l0XJnNoCyXSUz7Lk2p5UQDlFtekYGsyfCm87M?=
 =?us-ascii?Q?Agd1kxYJaVtrmjiukmwFM4HN3v30FSAGDSD3wiz46TXSijwA+mGoh8D6caSi?=
 =?us-ascii?Q?Rf+IQYw7mJ4FEhcSq94Z6tD0wnGbsgNpS4obhbb6/uemQZJlhYJLZ7TMpYKb?=
 =?us-ascii?Q?LedAPerx+vM84jYsSXyZpUxX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3173344-502c-41b8-82de-08d900aefb01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:38.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/rY2auuH7y9655nGroKytPTxfuKguQrBOXuXLJ+C/LKXyvDuD9A16ct5U9F3KJVkeI7RyCsecqeUDHKiJ6p13hoZxYi2biLvwW1FvU5fuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We are going to split connection code to separate file. Now we are
ready to give nbd_co_establish_connection() clean and bs-independent
interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 49 +++++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2b26a033a4..dd97ea0916 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -121,7 +121,8 @@ typedef struct BDRVNBDState {
 static void nbd_free_connect_thread(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
@@ -407,22 +408,36 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }
 
-static int coroutine_fn
-nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
+/*
+ * Get a new connection in context of @thr:
+ *   if thread is running, wait for completion
+ *   if thread is already succeeded in background, and user didn't get the
+ *     result, just return it now
+ *   otherwise if thread is not running, start a thread and wait for completion
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
@@ -436,13 +451,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
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
          * Obviously, drained section wants to start. Report the attempt as
@@ -453,17 +467,12 @@ out:
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
@@ -530,11 +539,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
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


