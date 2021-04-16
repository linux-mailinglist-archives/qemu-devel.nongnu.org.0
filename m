Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EB361B40
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:22:09 +0200 (CEST)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJjs-0000e6-62
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYI-0001d8-PX; Fri, 16 Apr 2021 04:10:10 -0400
Received: from mail-eopbgr80138.outbound.protection.outlook.com
 ([40.107.8.138]:62715 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYA-0008Aq-2t; Fri, 16 Apr 2021 04:10:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYOTT7F5cCicQuzCGW/xoP8D3s2FSS/UfnyngjR315GegwSjVJs0gh7XDmb/R7GQovItGn8/YivQn/NW3/XQfU45+6OhkCOIVVRpura9pi5wegU+7jdA9s63WZVpx+qgLz2wVuFBtE0SISvFGyPuttrxzplS5+ghPtQUHipxMvnMFKWiSVs+XO9SBS0kmt7zmWogeTU0iMi8w5OP31BPwOp5gr9OjfS9Pra4wEUr4tWpcSH73JtCFjBAMxqfVuk/KKIjIRPPOc3g7b867PM/pk352nzGTy8O3d1FafP3qRYnlXpXq5qtZrV5gCFX24nd83yiWandquQo58Xv5hvpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otOQ2gyyJzz8+d/HXeCayEZtaVXB36lA2yD3SQkk5Os=;
 b=BEKC4sRPXOczNCtruAvJ7XLZWKCCKgxvgkfgoKGggY6r9zqDXrKOwMreg313z6bM7nMbIMZymDZtBqP+QMVpp1+QrJ5lfFDDsVi6/Q7xte4Dydst6ZqgXEy67eIZWgfUH3Weemz4hdlyer3RdJnzbwts/VttzGAJRsTz3U7WbLVJ1Vwt0umkjKbwvyNbs9QjIA6DYNeZsQ8rwN6UYRf1WZrrrlbkHI5A0j9S4fUXtP6gtbWVWLCuLApdJQi/N1ANCixkdPVr55NfPYjENmR9yMrKjMP4Ouku7ZXK0n/xLcLG/FSi+XtfpIhjlya6VDQk3ia97PBeZu/HrLAKX9sbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otOQ2gyyJzz8+d/HXeCayEZtaVXB36lA2yD3SQkk5Os=;
 b=IdaGLzpXdXgMU1E2D9Mvg4MrN34pcBpTL4awBzCFgJwpioMwW1Kt9gpH+8MDpVOD7gRQNpvVwJ8ZyWEHYjCpM6r4R3CMNlgEMIsmxK/1i0KvuYu3agx0ogJ+k9rg4nphziAjZGmQq5AmbbFvoSUOVPWYC8GRpQ7AX+6LPhVM1ak=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 24/33] block/nbd: drop BDRVNBDState::sioc
Date: Fri, 16 Apr 2021 11:09:02 +0300
Message-Id: <20210416080911.83197-25-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a122ae-b7fa-406b-d146-08d900af0780
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717D30B3D980F1CB37A59D8C14C9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYbcFKNlwOSXLqcA0lygwHP+hY+Gw7ldSCs+4Arxs9yR+/mBSFhnGUlKyXsrYSXE+YYu88U+cFdMepdYAa5YzxpwS+e4HWA4ttnvfG1OpQJJd8CBhNaVovi3VmxT5nYoa1Gnny9lGkOekN6IX1m1QfyWz7RaqaDscH9BfZC66Ii9rtxEICCjUQhtLds8zePbYLmfLTWnf1kBEfsjbqkRHzpezS3THb6n49/3xtZHYomYaqSxO67yFDJWQPcLQLE8/S1Ho1jo7p+IByQiWcARdyLkj9Y5NdEvXCV7yZESHx7RtVCj1yZLgO2akeDeYrSN1LsBhWk0Kwkxqqzp2XjlcRpRqTKoui7+zMA33+yVZk9yW0TCxTAAY6Hd5uB+KO4MManMXYcJdFX/YapY8E77he/Awuzqw8bzZ+wACyA0azZLtTXBs3C7S7oBraE6V64rOs43/lnKShTPjKjYJ/9L9lQojGwDmA496u7nK0aEpCQiorJzTcRVdtAdWDO7PMim+3s+p2ioQvFkVghh+ODt8Uc/8vuhrwmGwUtmcoTD5VP88KJNmTY7aQeO71WpAUVw12uvcpxA/WO+vkHvtQSFAIlLPmhmgPZZLCKqMp+TKFgS3AKjmiEHPZcCYoeQrULTcc6u0Hx1akLUpFBSKK4ib8tNgYz90U1Q+15hoJNwKuW/XSNAtupewgZARJQZN3vo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(66556008)(2616005)(66476007)(186003)(6666004)(66946007)(6916009)(107886003)(2906002)(26005)(6506007)(69590400012)(16526019)(5660300002)(4326008)(52116002)(478600001)(8676002)(8936002)(1076003)(38350700002)(956004)(38100700002)(83380400001)(6486002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?idI9jRwt2cmnv2zEOr8FU31ZSUtpQ8s0tScbEoqUAYQ6F9qNwKGAcoDUH2hN?=
 =?us-ascii?Q?Fc7kcPIlQLKviZUobaU5ZGfviZam1zlNXO+6vkxRo+ZFIzKMt1+1J9Am7j7b?=
 =?us-ascii?Q?SbUFWUNcqpFtCrLklqgcxVjK7k2xGybJcRJ93EcvB6nS6TwjtFyviGVL8T+j?=
 =?us-ascii?Q?wuIw+ffjiXG6bz1auKH1cOFg3uqBq13jQb8VhvUvGo25H5c2KALuLD7VRMUo?=
 =?us-ascii?Q?5/nQMyk74QoDfY5/5sgDse6AB0st50qB7uyTYJOEz4z/lFFxxOMA2ELkdNRf?=
 =?us-ascii?Q?4CFerKlniJPeMwsN9xK2+GOUXHVdXI0EKEylfO2cy2+RWaovW2857D0PzOU8?=
 =?us-ascii?Q?RJazH6ZQtTktWX428GlFpbwIOjlyGAEMHQiNaqywptiax1bNSlFfZygFqPya?=
 =?us-ascii?Q?LPYMycwe2v15Y/4nBwNQ1xGq5U6cGfAOAlAEnywmRyoZ07GJPTVTv2Xtx/4b?=
 =?us-ascii?Q?KLKqNd7t9t4eFuplOexBbq42gGKcndNwsvaGF0tPczAJZLZBil1u+gF13+rW?=
 =?us-ascii?Q?IZTcKtlfgmAagHZ1zBCRq9N3f38D1k8YZH1xehyUMqeQcJGERLbiNqg3sIPd?=
 =?us-ascii?Q?cMhwi8X3Lygn4VuHiOdVNBLqbBD1Hs9Mx6NMyM2NtTeQzXAgHDEujGOFPEMP?=
 =?us-ascii?Q?8jdvEPLUkJ2OBCTncwVxU+LEnBCHgfPNq3ubge+AgU/WFs/spagminrq2pMb?=
 =?us-ascii?Q?lTUUHFmfDqQgmKyubP9WU3GtB+orH30E0Zd9rI90ZXUcpkUNdP9ZdtDInSlN?=
 =?us-ascii?Q?coOFI5Y8BUiZhztGhwCvfa6ncPeUJT5Am3qmRtz+SsSPVczWhawHMBeYSxK+?=
 =?us-ascii?Q?LXXPRfZa9pc8VgzKHMXItifldx/VysXRz14T+zsXS31eC++nu+ZKaJznez9O?=
 =?us-ascii?Q?8IDdp2/36e1D8q0qlsee/r/0aEWYIKSklCBQjRnT7AFesskI51Qmps3ySUBf?=
 =?us-ascii?Q?Id2XWSYpCAG/ZFlES8gmP44ClinlfdnrKkUA5waYrOkVdcKz7fFuB8JRJz47?=
 =?us-ascii?Q?EUVbvL8Drex+LtvDV23UkafkqapNyORygnOOx6YaXBjH0fjvhSInGB0/UD5X?=
 =?us-ascii?Q?8vVxHW3uiiX97p7ExDpanzXqvD9F0GNtc7U0O7bNe707EyF2z/9eRuJRDq/s?=
 =?us-ascii?Q?DIjodgpe+Jqiq6+2wYPAigPOVz3Rnv+Ke0US+VCaYCFlMQpIxmCpYOYNLiKB?=
 =?us-ascii?Q?5Gx8JodyvCVVS5WYYXNKRuGoZMGEtk1v9GL1o/TyDS9JaN+BvpsDWQdE7DlE?=
 =?us-ascii?Q?P+IuT2cExRB6eP7D2P0TTGxVSAsjxQhLVFq8SoppOC67oYNL8L4OqiUfpCGV?=
 =?us-ascii?Q?3JlUPbiqKb/nzVrWFb2AZtJR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a122ae-b7fa-406b-d146-08d900af0780
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:59.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLmLWadk39u4vc4NaPmsmvmrBuw81N8LjUzUwZOAzqskrF3uJxPzLr8aaXnBfN18ZauK3thhDZz0roi90yqVNhBtgPc2sFthuXFOvCcUSmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.8.138;
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

Currently sioc pointer is used just to pass from socket-connection to
nbd negotiation. Drop the field, and use local variables instead. With
next commit we'll update nbd/client-connection.c to behave
appropriately (return only top-most ioc, not two channels).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 98 ++++++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index cece53313c..f9b56c57b4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -69,8 +69,7 @@ typedef enum NBDClientState {
 } NBDClientState;
 
 typedef struct BDRVNBDState {
-    QIOChannelSocket *sioc; /* The master data channel */
-    QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
+    QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;
 
     CoMutex send_mutex;
@@ -102,9 +101,11 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
-                                    Error **errp);
-static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
+static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
+                                                  SocketAddress *saddr,
+                                                  Error **errp);
+static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
+                                Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
@@ -364,6 +365,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
+    QIOChannelSocket *sioc;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -398,27 +400,26 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
-    if (!s->sioc) {
+    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
+    if (!sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
-    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
     if (s->ioc) {
-        qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
-        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
+        /* sioc is referenced by s->ioc */
+        object_unref(OBJECT(sioc));
     } else {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
+        s->ioc = QIO_CHANNEL(sioc);
     }
+    sioc = NULL;
+
+    qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
 
     yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
                            s->bs);
@@ -435,8 +436,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
 
@@ -571,8 +570,6 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }
@@ -1571,7 +1568,7 @@ static void nbd_yank(void *opaque)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
-    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
 }
 
 static void nbd_client_close(BlockDriverState *bs)
@@ -1586,57 +1583,64 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }
 
-static int nbd_establish_connection(BlockDriverState *bs,
-                                    SocketAddress *saddr,
-                                    Error **errp)
+static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
+                                                  SocketAddress *saddr,
+                                                  Error **errp)
 {
     ERRP_GUARD();
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    QIOChannelSocket *sioc;
 
-    s->sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(s->sioc), "nbd-client");
+    sioc = qio_channel_socket_new();
+    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
 
-    qio_channel_socket_connect_sync(s->sioc, saddr, errp);
+    qio_channel_socket_connect_sync(sioc, saddr, errp);
     if (*errp) {
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
-        return -1;
+        object_unref(OBJECT(sioc));
+        return NULL;
     }
 
     yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, bs);
-    qio_channel_set_delay(QIO_CHANNEL(s->sioc), false);
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
 
-    return 0;
+    return sioc;
 }
 
-/* nbd_client_handshake takes ownership on s->sioc. On failure it's unref'ed. */
-static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
+/* nbd_client_handshake takes ownership on sioc. */
+static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
+                                Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;
 
     trace_nbd_client_handshake(s->export);
-    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
+    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
 
     s->info.request_sizes = true;
     s->info.structured_reply = true;
     s->info.base_allocation = true;
     s->info.x_dirty_bitmap = g_strdup(s->x_dirty_bitmap);
     s->info.name = g_strdup(s->export ?: "");
-    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(s->sioc), s->tlscreds,
+    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscreds,
                                 s->hostname, &s->ioc, &s->info, errp);
     g_free(s->info.x_dirty_bitmap);
     g_free(s->info.name);
     if (ret < 0) {
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                  nbd_yank, bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
+        object_unref(OBJECT(sioc));
         return ret;
     }
 
+    if (s->ioc) {
+        /* sioc is referenced by s->ioc */
+        object_unref(OBJECT(sioc));
+    } else {
+        s->ioc = QIO_CHANNEL(sioc);
+    }
+    sioc = NULL;
+
     ret = nbd_handle_updated_info(bs, errp);
     if (ret < 0) {
         /*
@@ -1645,23 +1649,15 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
          */
         NBDRequest request = { .type = NBD_CMD_DISC };
 
-        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
+        nbd_send_request(s->ioc, &request);
 
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                  nbd_yank, bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
-
         return ret;
     }
 
-    if (!s->ioc) {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
-    }
-
     return 0;
 }
 
@@ -2047,6 +2043,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    QIOChannelSocket *sioc;
 
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
@@ -2069,12 +2066,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
-    if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
+    sioc = nbd_establish_connection(bs, s->saddr, errp);
+    if (!sioc) {
         ret = -ECONNREFUSED;
         goto fail;
     }
 
-    ret = nbd_client_handshake(bs, errp);
+    ret = nbd_client_handshake(bs, sioc, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


