Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260B3A291E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:16:06 +0200 (CEST)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHjJ-0003xH-HO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcs-000653-RU; Thu, 10 Jun 2021 06:09:27 -0400
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:1862 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcq-0005Hv-Bx; Thu, 10 Jun 2021 06:09:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl+wl0e4om65sWUtTjswugMVOoCGxSPv3Yg02qjFjPi0kmuokJrt9kC60uJjhC6oqhYhDqdRb+eOPGeD1UAJWlmO9IF5uXtR4CIaMCoZfVcxqfw/WWJ+ghIFC5EAEPnSNb6ZVu50Ae3/DBKqMjU81pJaNa9C3IrQMxYEueUbqzuuiu9kuunBcr2JybXbZq4cYC0OPC3zVhMBD5ucl8yQ5ElAF1WzTnDr4nHELXkFEiSJoONj5jFHNJ4zHlPsKYiIeu5N75RAFU9gOC9d6FHA1J+00HpXO2QKp3IZX8uoHtvtbP/wMiqfYHVnNsxIcZZpwThIIbS589MCVWADD8MRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O99MZB6uGP9HFLNVclqRv46ONJSk0v+d/l/BXRMkygs=;
 b=QybkYsQ2O+nd4kh76rPm14rgG4dPd6KVTNXX9yjAnbUUODCp9CCSfqJMuWx0YtfcTgPuDffDN5C1hMlc8I8EhMWipPGg9hOQQ4fzCpmXGYrKUBdBW6IHXQkBg73UTX8UCvwIgEe9jVKn8CP+ZHfGtxQZCcYmjCu/9b2BwfHn5r4p+1nKcGiBpFfChfvNvZMoOC7seCTRRjn6dsL0/U2sIt6S0aj1vxlByeQwScTBTvtekvBkp2Z0nd8B57dQZBX3J8zOS5FLDJmNx9HQt4OZotEhGbbF+09Q/C+eX0dbrHyxFCvabljswCbBvGfl1orHB/+GbRDnEBNNykKiGY4szg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O99MZB6uGP9HFLNVclqRv46ONJSk0v+d/l/BXRMkygs=;
 b=VzQHof1M9h2Z+VPXFdS724lNO9tT7isd2oXt0Dz2VcFUl13FY95dEVdGpSXM/DFNUufRrIMz8RNKXcR6pxrcdPod/KHY480rThmF0rrRCZ6vHYsXz3fZMzss3n53t8BfWppfC/7uKpJhqHpDoqNIEZJ3wzaDC0BxLexbnj4XrNU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 26/32] nbd/client-connection: return only one io channel
Date: Thu, 10 Jun 2021 13:07:56 +0300
Message-Id: <20210610100802.5888-27-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01e10771-fd01-4323-3bf9-08d92bf7cd58
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806C445B5A181220A7E4F28C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKKV/GgUkQM45J78AU7NWM8eMeF+m5/M9gD0nGE2FY/YSY6QrfXPKN5/dohazFsfnEbuhxwOvi23TxR6rUgntLBuB39NDul8KM63O2/Vy5ZKmLFxpalT7KbJ/k+kxxnfuTbzDuStzM16Dpbfi3mGkYT7EJ4PjHEybMFUOttV4Q5Ma4zJJKONan8XiZ8R2DiatNgyBERUJmrQEVORyAXaFBKwy1QDseUtXO6oGkLWSHzB+K2dOYnWYGN/nzibuKC8GzqYxHE/0rz0HRGrIyTMq6X/QhGjXzrWcfBEsjYbLy0snaHcZh7AB8zFqxOtMJQeIqy6K41eny9nDzddysKis7iNCIVNJ79QBeElMghO10eY2UHsHd/p9sWnvfNQGvMGKeNJAy6ORGisX+OIoadJdF7KS7h4vQ2MWrO7uLqEWkU4Zi0HJD/5cVsOKtaPy+BIDRI72gv5w9zaHaxLC9cYM8zCV3saQ9JuIZgGRTRumhwRFtmzk6jizyQvXBJvM8b7FoXgTle9uVnuROpeUjetxt+vdi2YobT7AESvhPCbzOJjFLyFGwm+cVRjGWfkNppc8BXc3by/DKBaWQ82zqYq8LTlqeLAUbkC7nIoq02kx5tXTd9fUUs/rkZcqgJ1dmdi1RXhuH7zCoqTeuf7D321ttjJEbXOkoq/JxvvHO1NlXEA9lfgYMJo9ltKKP0Q5Vf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7m3TwlXRXV/75rNTY0KCyXV7CGqLv1lQrVqwCArKb6WNNuqjXYhIjC5VIUZ0?=
 =?us-ascii?Q?f7W5pbcp69KoRp4GqmGZujyorYaRyptw2AQ4unQnyprt2uYBd3rQNNy2078M?=
 =?us-ascii?Q?VQWPhft6A+dJtoXX1r5GiYC5V5N8lnd2exXudDSFyn2kWcwUWZAfI1baL6yj?=
 =?us-ascii?Q?ZXwuTOuoelc6bTFwBrK9+OVJA1CHRBjHiOwUSTbx7eEm1VBGs5FXH4m3AAUl?=
 =?us-ascii?Q?u8E4UlSLaIvr1PKpseo03eq6aHC+7JIzryQf0O0dMBI1I+wDMwNkvGZUdOyu?=
 =?us-ascii?Q?kaZoPI4Eay+p+uxwteQCRy7QgT30xfoHkFBo6lvZWl77vK8u8RD6Fo3RHjby?=
 =?us-ascii?Q?lDqR6hG0zjBxDqpxprzziLpEEuzpQaLVYbHLa2CN1WDmVGgD8TcLt0ecrKly?=
 =?us-ascii?Q?ksFPaVF3jRHruIYvlLhZZ/05hxkPrk+q7u3HBZjCp9rqpUA/h4f5Vvr7TMbt?=
 =?us-ascii?Q?Q/5skV//LoHMdK7ZAkgHvVfJoK4zwo8fC04+D3fVCzzjPXd/8ynC1HKq9L+M?=
 =?us-ascii?Q?meTFAs7DDj1rrn+TPvD16jDjrQQManmSAl4rQWxc3XbL2/Aq2Hgv1TGwyZxH?=
 =?us-ascii?Q?HBhyQVXck997NT1q0Sl+bdx4Xt5XD3mNJ2eXrDk6CxoHFtvRgaEfVfaQHnRJ?=
 =?us-ascii?Q?UkYfCQtHaAK790IpKM1VcWmA1O5Q7iV+VOJtdBBItaDVa5WJO0S5C1WjKqCa?=
 =?us-ascii?Q?KDwlKINRRp2dqX2dlveKJvywjof2k7WFNEjJrPSTtAhYm6Q20kVeAPCYvPW/?=
 =?us-ascii?Q?DBthU2q2yhKSkS92ZpsAJ0IVUabY1OxLuVg5KNTe+/NqEK8W5T1u13506TuV?=
 =?us-ascii?Q?7AYKCXvIrrTT7016GOW/Slvwpr7+mmjsCQCZupfJxDuEKenr8g/bLmGksW1t?=
 =?us-ascii?Q?GWuVvrQkco/C6JdMW06bO2AJVURErj0zrrCcrXfx9p8T/P5Vbs6JJQoHGzub?=
 =?us-ascii?Q?UhT1x/D19iapWmsyvMnnDFtDkmku/FYx8anrTWknA3p8zNHlEPVI7Lv1oKqe?=
 =?us-ascii?Q?gyvJ2C+50Hqh9msFP3P6FcSj7arsg25Bcuwgv7cFudJxOJxQvqW4VRU46YX8?=
 =?us-ascii?Q?cTbnArKfYtCfn7NtCw3mS93LR8GF1Kjy+dqTMo+ggYgLjz+6nfCY0HjrmYX7?=
 =?us-ascii?Q?0ZMiHXis+hQC+tdlzlbCL3pKycuyQr1Hhxt99LQ1HVmdojc/BlWVGauXelaB?=
 =?us-ascii?Q?i+qybCjZoFqILJ/5NvYUxVX8cuxudv53E5oI71rlgKIO6cmggh9TNGt0azrw?=
 =?us-ascii?Q?MW3tVzJiTUydj7RjPaG3BygRJzMzSBJWyHEOZnXrevRqwdOsYnzr8hSwIk5L?=
 =?us-ascii?Q?NBHrRrnDubVqSisCdPjDIpWA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e10771-fd01-4323-3bf9-08d92bf7cd58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:15.6492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ts4ky08Bkx9vR8qxIhpm+0Eon3UKaFe3t7T4ZXiXeff34Vm5TIWVhyJOhN5EOY4rABLkZlI9cl1eKXUIlyZPujbTQgo1L98+ysewjI6xFvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.6.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

block/nbd doesn't need underlying sioc channel anymore. So, we can
update nbd/client-connection interface to return only one top-most io
channel, which is more straight forward.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |  4 ++--
 block/nbd.c             | 13 ++-----------
 nbd/client-connection.c | 33 +++++++++++++++++++++++++--------
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5bb54d831c..10c8a0bcca 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -418,9 +418,9 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                QCryptoTLSCreds *tlscreds);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp);
+                            Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index 9f193d130b..411435c155 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -360,7 +360,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
-    QIOChannelSocket *sioc;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -399,20 +398,12 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
-    if (!sioc) {
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
+    if (!s->ioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
-    if (s->ioc) {
-        /* sioc is referenced by s->ioc */
-        object_unref(OBJECT(sioc));
-    } else {
-        s->ioc = QIO_CHANNEL(sioc);
-    }
-    sioc = NULL;
-
     qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
     qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
 
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 80c19f4eff..500b8591e8 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -271,15 +271,15 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
  * include/block/nbd.h).
  */
-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp)
+                            Error **errp)
 {
+    QIOChannel *ioc;
     QemuThread thread;
 
     if (conn->do_negotiation) {
         assert(info);
-        assert(ioc);
     }
 
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
@@ -293,10 +293,17 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
                 if (conn->do_negotiation) {
-                    *ioc = g_steal_pointer(&conn->ioc);
+                    ioc = g_steal_pointer(&conn->ioc);
                     memcpy(info, &conn->updated_info, sizeof(*info));
                 }
-                return g_steal_pointer(&conn->sioc);
+                if (ioc) {
+                    /* TLS channel now has own reference to parent */
+                    object_unref(OBJECT(conn->sioc));
+                } else {
+                    ioc = QIO_CHANNEL(conn->sioc);
+                }
+                conn->sioc = NULL;
+                return ioc;
             }
 
             conn->running = true;
@@ -328,11 +335,21 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
-            if (conn->sioc && conn->do_negotiation) {
-                *ioc = g_steal_pointer(&conn->ioc);
+            if (!conn->sioc) {
+                return NULL;
+            }
+            if (conn->do_negotiation) {
+                ioc = g_steal_pointer(&conn->ioc);
                 memcpy(info, &conn->updated_info, sizeof(*info));
             }
-            return g_steal_pointer(&conn->sioc);
+            if (ioc) {
+                /* TLS channel now has own reference to parent */
+                object_unref(OBJECT(conn->sioc));
+            } else {
+                ioc = QIO_CHANNEL(conn->sioc);
+            }
+            conn->sioc = NULL;
+            return ioc;
         }
     }
 
-- 
2.29.2


