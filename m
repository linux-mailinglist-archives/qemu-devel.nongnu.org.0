Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F022E3A295D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:30:28 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHxD-0000Vl-WB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcq-0005xa-DK; Thu, 10 Jun 2021 06:09:24 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:1541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHco-0005Ca-C5; Thu, 10 Jun 2021 06:09:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTn5ifK7yg64114DWBgQmr1q8GGl9nP7wtjMQbv554DR3o0tYcqh28aso6CD0nVl2lD9z9y9MNl+YQlykLpYWVV8ONC8J5OvYD0xYsztkt6YYVScrFmdvhvzABnVLg3VKEebGYg/Xqrlq6Fe2lM/8oBu4By2FA9HeJQfmXHybUVxr4vchh9NOPG7h1zH8r2dYuC3ki0ts+DV+bMC7VvLxA/54ZWok9TButHisgjliXxGPfaOJV0D1B1mnlci8lhElvzLZEFG6hYNgJPDJiKlpDb0jUu8Mm/xn/iq18jrAHyQewp+YJBUukQFNdn+bxroRfIUymKU7evnf4jUkzcuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txBJ6i62H+6wQ6in2+bgk4Ozas3ngkpXVS/MnCuEhno=;
 b=DG/2jAoUUSdMFwJd2L/IC6Bxu5fs7iUMlVFxYTMCnnKvYSX8sUnJqD5Pr2YzWZn+K15dkh5PzWWdg14uWpi478ejJaBUs5EF6uDAO5kMeWo6oN8crbrwYUYfLKmNHsjI7fHBu0dSTw58ihBD15HcC2uUU5xdTNYkGb+kj26HSvZy2Xa95yROgYc0scABq9+dcGck+iDscX7AzeqUvNCr4NKMaRQrtEUpumDL+1t2KvUrfbQITZm+n2EvGCsKm9c38DNip2/jiCwVgsaHdS7bOQxIoND37zRYpBYwxrI4p2qqmxW3dR8K60sEFlViYFpthGKEV8qoGm5EN3kdgAqkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txBJ6i62H+6wQ6in2+bgk4Ozas3ngkpXVS/MnCuEhno=;
 b=urcRBAa9D1AVIJGjZ960vXUQohpe3O/0i5yg+tU+HALLeQZ9JEmq1iLT7sHvkoliVFquZpbZIPDXSdc+nz0fF/CBMziqyo4zohsj4UvYVCNgplKZOeH6cuni9gbCz0cH7yY6y0nlKBWITfU+N7FmxgSEM7oIte5RW1LiORU5/yM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 23/32] block/nbd: use negotiation of NBDClientConnection
Date: Thu, 10 Jun 2021 13:07:53 +0300
Message-Id: <20210610100802.5888-24-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa06a013-c7c1-4dd6-2298-08d92bf7cb62
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67905579B6C8A92B15B3DCC3C1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khbxDT+PAXVNXt0wj/kbwRnsa16LDAjMDaoyiY1VdJ9mMrmJb+0oPvaEOHD9RAnm1/w1AfqgMX4mFQ3M6eehLqpHdH1KgYUvqBYdRSQateavIJ4zAV6DpXp4YjEeSSNwZ7cBn1mxuLugFnEmT4ahfsFpOylLo/IESiBO7QbsYWjUmCm2N93YsgBmuPkpOGpIMiGMT5tiz/30ARf85N749QnOy4JqF0n3FelCw+aO+n/9ZBXASgESHHoZ9x6KKBDxXqFaAWsQ7few6tsrybvphMe/4EV3PnBbr/NVi0RFogUoTOBK3EgpPbsOZXPsKBc3hsOMK9SuKbxL4rSRRNBMLbhbQpdwMb5MJA6nQlEMtTJUEa5Jbi+X8IjyJbghyk+cf33v/OUGglS4jlLRQsbBuaqwlcJefpp4cT6sJUVod5ysoelnG+bhqIc/tUisbODXXqIRURXNqNTtp8RfZMLBKUzcFSt+Op1DdepRxfK8Im7pXNYHfzj/CZYJpWQywNrJG8t1Eg5Qyq0r1rcIKBQcspRt9bWcCstffJh4Sk91I6+2IMDGUyhzX8UyEdj3liJdhr4yskw1q/r30qHez7UEO40YSFYDgOFkrLqBOaougdSuDxs98CLq8uATpHrh7XF+lMDeS3NAlQbF5fmpEQ/rXuXsMUy8I0ruX+1khyeuYlMvcnGrybakIHhETzj5KqIL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HJPieoJTEa1Mr7/q1mspG6N1uSgrWm5DsOz+yYZi7RnF5918Ezwyijq3u78O?=
 =?us-ascii?Q?MinNDd5szIgRHJEJWA48T3pbqVQIpzkiwRZZQVi4R0glT1TVSglKQtOLDgXZ?=
 =?us-ascii?Q?jpB+Mz+Waxy9IjnJP87h188rzts8fPZg9wsj9e1RmqjP1KDGHF77BzUZQsOQ?=
 =?us-ascii?Q?zhAht7t2ccWZs79ghspzFuQ+KrdfNRgzIjR6cUpiXQoqJ6DglhBhFL+TAUg2?=
 =?us-ascii?Q?Jioj0MkJXaHTmkLaRIXicNXinFCdGBZnn6iv2LQdRgO+6I913I7/NrWGAI7A?=
 =?us-ascii?Q?K0Zv9UBf1v+3LZ10TI28qyVk6Ma6viBjxyWxIuapa29wB/Xe4KEqvDF7Pb8K?=
 =?us-ascii?Q?ne9RpEkmH5mGAPELn25JbKi7oTcBZOMZF1CmVrpsvaU305w7Pc/So+YbjRMT?=
 =?us-ascii?Q?AtjT16/d0rl8R7dMmoMRUN/TPBvFZp2cdabavhiPhcDJ2EtZYCTeAqCmv2f5?=
 =?us-ascii?Q?zuCc+xlZL5PiFEuKTj1oYhRSducW5olpFNCs3OPR2W0zMdD8RuQwQZDZCrMm?=
 =?us-ascii?Q?mgk3FgntuODI78MkLjFGtACuNytcsyuQCaYg933v7fUym6d73CMF6gNQS+6x?=
 =?us-ascii?Q?hVHrP8XuzAHfAg2Fgyqvsfwuw4apEnM4wfgjoFjMIz0wha8ycHEhN3QMvaAa?=
 =?us-ascii?Q?JDRwTL5rj8zG77oOzqlGl2rrw+ZjTgWs7+I8FJwbGWjljP5AYUvS71dEHcdh?=
 =?us-ascii?Q?t3/NpUokVEPjU8VSCpZNdowe2XeCBOaaJAeZY8z3DjHTJGrVtLAUMSz2A1/B?=
 =?us-ascii?Q?BrljOTbMFBTib8m/MWPk8q7/rCbNd8YgHDn3pTDXd9QO99OMEZoC71leJY0y?=
 =?us-ascii?Q?4i1azLxjZdWpAf0Iyx18755ZzHz/knp0lay1V0uAdg1/mDJn4rR8G22tmkMA?=
 =?us-ascii?Q?grx/14lIwfi2lYmqZxCHqs8fmQY7pjJlagpz3kfhXAzrNINehcbYmNk5heZ6?=
 =?us-ascii?Q?vhtO3Etp+GbMKq6DTgMLRnLKbjQQWYo1BPuqzeKgz6Ziyn5uqg6s4fmVF6AN?=
 =?us-ascii?Q?mIH6Xkfgm0fQ3+JPCD24/Nd2z09kHZI8t9bsO15a3Ettzm6x0HkZzkpp1fp8?=
 =?us-ascii?Q?PblPxzb1lxZQ0DhjiFIX0MjW0k3nxQ4FZbzCfcOoYGAq4GOPUkCo/U8sAE9k?=
 =?us-ascii?Q?tvvbGqE3b9OHIFI4pYXgksvIit8e4bukom4eom5a2xGMgzyMF/qKlPeAJA+T?=
 =?us-ascii?Q?3In28RWS7FbAXkZF2ZVJDA0aOXAwYTtNegRqS5BmJcW/pdQOsYpBt0T8hR5z?=
 =?us-ascii?Q?T8MDj6hwRZUp5KZu6EelMchasfsHeDS0XzETHMla62xQbgQRCzuTt249LKv4?=
 =?us-ascii?Q?eppDOo31Jxen0A9zmPbt0zbf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa06a013-c7c1-4dd6-2298-08d92bf7cb62
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:12.0500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NR7YIr33JR8y2VVzjmcp0f4gWpWIiOxN+MvMGxcVQcTA44INFav82HK3QNKzoax30lWUnXAKb6iSEZfzRNNfc6gfAJA7mdlyJoPmzDyDEWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.8.109;
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

Now that we can opt in to negotiation as part of the client connection
thread, use that to simplify connection_co.  This is another step on
the way to moving all reconnect code into NBDClientConnection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 240c6e1b3d..3114716444 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -362,6 +362,7 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
+    AioContext *aio_context = bdrv_get_aio_context(s->bs);
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -402,30 +403,44 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
+    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
+    if (s->ioc) {
+        qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
+        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
+    } else {
+        s->ioc = QIO_CHANNEL(s->sioc);
+        object_ref(OBJECT(s->ioc));
+    }
+
     yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
                            s->bs);
 
-    bdrv_dec_in_flight(s->bs);
+    ret = nbd_handle_updated_info(s->bs, NULL);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };
 
-    ret = nbd_client_handshake(s->bs, NULL);
+        nbd_send_request(s->ioc, &request);
 
-    if (s->drained) {
-        s->wait_drained_end = true;
-        while (s->drained) {
-            /*
-             * We may be entered once from nbd_client_attach_aio_context_bh
-             * and then from nbd_client_co_drain_end. So here is a loop.
-             */
-            qemu_coroutine_yield();
-        }
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
+        object_unref(OBJECT(s->sioc));
+        s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return;
     }
-    bdrv_inc_in_flight(s->bs);
 
 out:
     if (ret >= 0) {
@@ -2051,7 +2066,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
+    s->conn = nbd_client_connection_new(s->saddr, true, s->export,
+                                        s->x_dirty_bitmap, s->tlscreds);
 
     /*
      * establish TCP connection, return error if it fails
-- 
2.29.2


