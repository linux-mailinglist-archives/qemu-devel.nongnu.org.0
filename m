Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4493A2959
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:29:48 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHwZ-0007QJ-JN
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcl-0005ia-10; Thu, 10 Jun 2021 06:09:19 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:1541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHci-0005Ca-8G; Thu, 10 Jun 2021 06:09:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGu8ULw0B8Cbt/bcRPcpRYi6SBSZdqWWNxWLoOLsZZ2Orn2kGDuWa4UGB1z86Y68H80Y1CQj82bnV6XblYe6xti6eXu8Lglll+uudhwEtMMtAMy/KgBkSwtWskXxO1eqnSlP3z6tzpjYBZKhcVYj2YV765FxbyYaP62FWgofsUCqKNl/96hHfgCz3T2TRuAuOyAnihAbyCMQrtFbxP2K2+ZKgJaBaZ5Th0J2RcL1/+bUi/rYU0u/hbl8v2vostX16kpduCGjRX+B80TXhXmnxC7fBx148pm92OZzEQoyQMEwIeg95FgyoLHpqUxR2aVbdpp5GAxC4SpXJPFk+WhX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fhfM43iw6BTPHi7Tif3aqur71TzbVFuh2Lm0gaX2Nc=;
 b=B1ZBixKE4BVu/zWMqJx6/cWqjm7bgBlJsOSDq3Dg5hCdoIHltDzj6cWTh21WYGMUdTtUQTQbyIB2jDgSu2Rx0jw64oNY0dBmk8lUd7adPgORzht35cQzCuK24FbMVybiD4RXHphSpfkyi7CW1+lumJPvXJDC/pBzKKnjBzSZU9iGLcBanwt/6b2PxlygoV92EdhDsDGzr5VV9sWRLmmWKKHMcW9CfpRLG1SbsSmZiRudZWv62i8NP1TqQeKTAxOl/2hOQKwIlbf28jSPYYhiW1PTX7ojro40VKPm+GtolFVQDE8/Y5QFrtGjWG2hJ91dbBrRshPx6mTifWrYupQfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fhfM43iw6BTPHi7Tif3aqur71TzbVFuh2Lm0gaX2Nc=;
 b=Td707UuSTViC1ADk0oc6Q+06yIg+X4dwdGl1dBhsiuGF4p1DJW7deEwnBwq2RjuIm5GVWrP/vm4UAMlww/PzkMFikOk5IK+jsHpEhGSa5Cyp42i14papxmsd4H4TkKw0c33b+GMITP5X5hloQccwvf2PivEpiAqMlPBHcbz326M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 19/32] nbd/client-connection: add possibility of negotiation
Date: Thu, 10 Jun 2021 13:07:49 +0300
Message-Id: <20210610100802.5888-20-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bae7bc5-b737-4cbd-6221-08d92bf7c88e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67901107E6347F5A032ED40CC1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ChiO7G9aZwvaIVUqHMTtFDXujARoa3UYa2GeGQtQgNmRyIG0ERf4rVutmCkxCzQ9yH5YsjLr4w3hlW1G0ceA9k9J7XBQgvkX077I2CuHqGRlTL93ARubtIudLFmdOwGFAVrwKl/B2gxFbmfEkMLvO6PLxaGGLA4FofpPtbh1YmrsVR+VYoGZCu02sMOHgfPwNmjbV1yTwvxJF9Dk7MQoHycGtZPF5U2mJML77//lajdZgcRieoCDQ1oyRdU78o82OXtDRUn9nY4IO5Dg/FALTE0J5dSaVacXgGex2RY+2dL8JpFrtxwe2xEwYJC+2tBoxpZkJMFa/nBBQTXqz5W9jOLLVEg5aCZ5WH7Kb8wFQrFtnd2yJ1TIcuZK4dDTqEU2U3piZKt+ubt0aA4eg+UNTIBRpM1LtQRsy9BZjjXqiYbg1MZTCuOpTVhQuDpttaieLfu0W7ZcFSGz3+9XY8vR7BuGd9mR6cywe8FX5DlyljtGM/tZrmy3U3CF+hhKfImvLQdH71TpOncEcRGwOUHljzdS0+sb3YryDZeplwvIqeM4ykXDFELWv0Z2vddw1oMCp0fmqwINPTOXJQCp0jTc1L8IQbW3VNlLvCvkH+fZiqPm7Uxem5EB+Ka2VIzHZiP+e0yz2mjLuZAoRzDeH2tdvBecXCL+BuBbys3A5L6eRZNksxYcIyw71HJ0lnX3wSy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NI+OAoM04WqJNjN2SQ7KF81X+j2TcJW9ELFiar8QxsUPMJ7RlJoLAzHlf+z7?=
 =?us-ascii?Q?bkU2nq+4XMhfrsRSPva4Dn5/kNabRSMcOxi+1gpLGPHKdXw/N7sq55zHr83Q?=
 =?us-ascii?Q?aK8aLMcw8Mzh2urQq9+/Z51MAHQ3ilGUTYoVgsXgYTIcOZzB0mJMTJFb2pq1?=
 =?us-ascii?Q?KZ5SyFms1yo8KMLCu+MkmVhqAox7d1xcJxZhYXxvR14rjdZrkfz6BGZvlYrZ?=
 =?us-ascii?Q?3UnamlItwOAP9eyNcA2F4rqBhXlPXD679lEbMy7v4A3Smqza40w09yatHb8X?=
 =?us-ascii?Q?kq/s3dVnboKMHnEUJjFz7hYOFZDP3I4SLyUirNUwPOPI94rQ/qxKN70mGyp/?=
 =?us-ascii?Q?V5fCKks6bbQ/HPjZAiFdfnN5QUYMrJ1ZmHKUfSotFmSPgJCmh5GbcwW4fKDH?=
 =?us-ascii?Q?mxJLN7lX8eFrbdNG4UNZXFD2DdIrrJ+bTzJ1PXNTqFm3FlyN9u/WGpuGLtcS?=
 =?us-ascii?Q?CR/XeMCwiJOspGvcwtQH0x/bdmE4kW9eFFf6MGXWIRl09ws9tqkNE3GzLX0T?=
 =?us-ascii?Q?GJ3o3lDGnJ9c2kAow2DUtE35ZIWbEWpKN+oNCHPOi+kn2wl/fLHVvA5WG9/z?=
 =?us-ascii?Q?P9G/ovkqPsiDVwQZtTWe1KBk/jGNBD3dgvGJJulfEhkyJs57dXcXOsd2qJHc?=
 =?us-ascii?Q?53egGXL2RjogEsjE4FwAKCYqDyukX5M9ko3BqeeXM0z+0Sj7spdSHZKO46E9?=
 =?us-ascii?Q?oA0TXOLPZYIG7E60RolqBLaUPWsd967RNieR8vJiPkB5D/lOmUD83WUbtlw5?=
 =?us-ascii?Q?UKTHwxAktceXI+br5AVTYWDun6qoGNXlYhkCh9b3P5F85OiwnJ+Ig1ML43wv?=
 =?us-ascii?Q?scsT/PlUQdRvdiY0KAkfHmzyJvDvndn8NejNekMgiK7gSnUSck7TQV9TcyFM?=
 =?us-ascii?Q?O5jzdDAad1d9UkdXrDmadlm4i3rTU3jDci7Q2PWLpTuVpKt5n3xpeq5Zl3xN?=
 =?us-ascii?Q?pSnl0HyW2Zpv/qbz/QBbDqGsHM1MRGYGFqvGqYx+hhcGLGABzDdkAHI3T230?=
 =?us-ascii?Q?P11+WnFCtO0D1W+8dpYNx4QuYffIXBurWiNcUwsBEEBIq5ckWK30mBYt7l6n?=
 =?us-ascii?Q?eNj14kb/psW6I6nMVMCKbUXgzq21pifYK8TAiNg+YGpRWUi9eYaLm/1AHBHY?=
 =?us-ascii?Q?inDkG+CGjUniTJMEdwLluyp0AFt15JaFVdwzcZ7iVuGX9qrbhcbvlmXxdvwI?=
 =?us-ascii?Q?EQvsVIrSJA/iW0XyTdpHt63L1YziU618+CMz/fpZVALCYk7A4Cb2O63QK4Kg?=
 =?us-ascii?Q?trBKGoGO7HdvmmGrqtUkRMGGkvfwFbdz3q/uZSTi58+M3FrPOwl8BgGn6sFh?=
 =?us-ascii?Q?67zEKYIK/uRH/QYu0GHZIlFD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bae7bc5-b737-4cbd-6221-08d92bf7c88e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:07.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jugZww52BWxTwBs6nFOWVGVPanid7GYAPHE/63NpHdX74OycQf5948Pzwq9ABEE762shj1jS0ybQPgFLG4rrFV+9tGpwo3buBiudTDRdE8=
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

Add arguments and logic to support nbd negotiation in the same thread
after successful connection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |   9 +++-
 block/nbd.c             |   4 +-
 nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 57381be76f..5d86e6a393 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
 /* nbd/client-connection.c */
 typedef struct NBDClientConnection NBDClientConnection;
 
-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index 26914509f1..df9d241313 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -357,7 +357,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->conn, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
@@ -2035,7 +2035,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    s->conn = nbd_client_connection_new(s->saddr);
+    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
 
     /*
      * establish TCP connection, return error if it fails
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index a18842a5a6..4301099f1b 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -30,8 +30,11 @@
 #include "qapi/clone-visitor.h"
 
 struct NBDClientConnection {
-    /* Initialization constants */
+    /* Initialization constants, never change */
     SocketAddress *saddr; /* address to connect to */
+    QCryptoTLSCreds *tlscreds;
+    NBDExportInfo initial_info;
+    bool do_negotiation;
 
     QemuMutex mutex;
 
@@ -41,7 +44,9 @@ struct NBDClientConnection {
      * needed. When thread is finished nbd_co_establish_connection steal these
      * pointers under mutex.
      */
+    NBDExportInfo updated_info;
     QIOChannelSocket *sioc;
+    QIOChannel *ioc;
     Error *err;
 
     /* All further fields are accessed only under mutex */
@@ -55,12 +60,25 @@ struct NBDClientConnection {
     Coroutine *wait_co;
 };
 
-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds)
 {
     NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
+    object_ref(OBJECT(tlscreds));
     *conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, saddr),
+        .tlscreds = tlscreds,
+        .do_negotiation = do_negotiation,
+
+        .initial_info.request_sizes = true,
+        .initial_info.structured_reply = true,
+        .initial_info.base_allocation = true,
+        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
+        .initial_info.name = g_strdup(export_name ?: "")
     };
 
     qemu_mutex_init(&conn->mutex);
@@ -76,9 +94,61 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
     }
     error_free(conn->err);
     qapi_free_SocketAddress(conn->saddr);
+    object_unref(OBJECT(conn->tlscreds));
+    g_free(conn->initial_info.x_dirty_bitmap);
+    g_free(conn->initial_info.name);
     g_free(conn);
 }
 
+/*
+ * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
+ * are given @outioc is returned. @outioc is provided only on success.  The call
+ * may be cancelled from other thread by simply qio_channel_shutdown(sioc).
+ */
+static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
+                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
+                       QIOChannel **outioc, Error **errp)
+{
+    int ret;
+
+    if (outioc) {
+        *outioc = NULL;
+    }
+
+    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+
+    if (!info) {
+        return 0;
+    }
+
+    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
+                                tlscreds ? addr->u.inet.host : NULL,
+                                outioc, info, errp);
+    if (ret < 0) {
+        /*
+         * nbd_receive_negotiate() may setup tls ioc and return it even on
+         * failure path. In this case we should use it instead of original
+         * channel.
+         */
+        if (outioc && *outioc) {
+            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
+            object_unref(OBJECT(*outioc));
+            *outioc = NULL;
+        } else {
+            qio_channel_close(QIO_CHANNEL(sioc), NULL);
+        }
+
+        return ret;
+    }
+
+    return 0;
+}
+
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
@@ -89,13 +159,18 @@ static void *connect_thread_func(void *opaque)
 
     error_free(conn->err);
     conn->err = NULL;
-    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
+    conn->updated_info = conn->initial_info;
+
+    ret = nbd_connect(conn->sioc, conn->saddr,
+                      conn->do_negotiation ? &conn->updated_info : NULL,
+                      conn->tlscreds, &conn->ioc, &conn->err);
     if (ret < 0) {
         object_unref(OBJECT(conn->sioc));
         conn->sioc = NULL;
     }
 
-    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
+    conn->updated_info.x_dirty_bitmap = NULL;
+    conn->updated_info.name = NULL;
 
     qemu_mutex_lock(&conn->mutex);
 
@@ -145,12 +220,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *     result, just return it now
  *   otherwise the thread is not running, so start a thread and wait for
  *     completion
+ *
+ * If @info is not NULL, also do nbd-negotiation after successful connection.
+ * In this case info is used only as out parameter, and is fully initialized by
+ * nbd_co_establish_connection(). "IN" fields of info as well as related only to
+ * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
+ * include/block/nbd.h).
  */
 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp)
 {
     QemuThread thread;
 
+    if (conn->do_negotiation) {
+        assert(info);
+        assert(ioc);
+    }
+
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
         /*
          * Don't call nbd_co_establish_connection() in several coroutines in
@@ -161,6 +248,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         if (!conn->running) {
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
+                if (conn->do_negotiation) {
+                    *ioc = g_steal_pointer(&conn->ioc);
+                    memcpy(info, &conn->updated_info, sizeof(*info));
+                }
                 return g_steal_pointer(&conn->sioc);
             }
 
@@ -193,6 +284,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
+            if (conn->sioc && conn->do_negotiation) {
+                *ioc = g_steal_pointer(&conn->ioc);
+                memcpy(info, &conn->updated_info, sizeof(*info));
+            }
             return g_steal_pointer(&conn->sioc);
         }
     }
-- 
2.29.2


