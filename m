Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EC3A2946
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:22:06 +0200 (CEST)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHp7-0001So-AU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHco-0005td-Rd; Thu, 10 Jun 2021 06:09:22 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:32769 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHck-0005DU-5o; Thu, 10 Jun 2021 06:09:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEo+oWpd8O9k1BNS0cMYjUmvCcmP6z5KrkVubNCm4ly7Vq4AISiQZ+RluvSjRGiR1dDdiWYtdKz82CWJaglrZz5Md3QQHTwudl4PwRA77AGI5luGypu+LJ9/FIAU6M6pZ5+wlQVmgqsab0A0tCv8RX6JpEACrQyinwOQj8vU5MbjGIuZdA39j5JqbfsIxt7pJ1fi4fDezOfGrQE2RjIljXNdoYCIp6E6dVEZzZ4j72ndX6Uiu9/KIRABuAWNJoRYmXOwCt5yINWYHvcTfDsund+nHtIUTe3QI0uqCo3mrnJxGFeuCgVou7BQeFXpI3xTFZCGlyHMiMtmZBg+VeeMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yEkEUhxrDB+lMrbHl2atgZAPr10tG6H0OuQm/V7MxU=;
 b=mgGkJqOoak2Fq1APuLMe5ThxKYOEoBqlMfsnLtix1oPgfDd4sSYfctVdIxXLw3v/xqoLmGo5W8OQidmpjXXTlt3nB8qtFjFVgNxAfwyCU4TCmb6SZhXnHq1cFkZhKoCKNypVVSMdjymkLJPfnuldqsOe9YZmWi+aJlGQ7kYjrKWl9oYw9frYhU8/nkSUZSTWbfTRkVcExT0ludgQMqutWWM5xv3Zs7ea7FStTnhQvtTu9gurCTrF11ooTJFZkzXj3DZryKMVS8JHV/aCZKr56gEW2Zk77A8Ol0ach1TZuN/Y89+whcFRa72xQabXUdUmTVSmK/gf/yZ3LWUcRQ3MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yEkEUhxrDB+lMrbHl2atgZAPr10tG6H0OuQm/V7MxU=;
 b=owRwKh5lSGPZKMfU1mkEn6uxX585wyL814SE1ztwRF1lXD5TtwRROfbpeN4qOOdCYwprfhSAj6lLyDtnF0aJ8ZIF1vSDxW6LERb+ji8bJEzgEMDfaD73VMOJQ4tfjwSLygg80zdLmna6ZTzrcpSoJFWl36DuO368iqhfzuhSFpY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 25/32] block/nbd: drop BDRVNBDState::sioc
Date: Thu, 10 Jun 2021 13:07:55 +0300
Message-Id: <20210610100802.5888-26-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e55ecb0-b0aa-454c-89d6-08d92bf7ccae
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806248974D6B5A04A089525C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuiQZLUw2So7TlCcbyrTZbJfh0Pob6zpDlnv2MwvgyNFZztkvSOd5fC+Kaw87PAW0IE+pCh7DRbgNsdfgNvVFSvHIn7Cdw76vAePtRdFQXRZVu4xqIn33Ae+aM+1JFoNOgWqO3zmk66b5byDuK1ixLNarYO4+vB6uCXfnZ23qA9hEgPsp2HO7Ymo1aXKbuj2nL4tUldmKrodTc9bRL5HkXElXx+bWAhB+Db1Iha+Rb4B/KJQwGfGprXuD1VeV2Ze/MT3BsIq1GfFoGiRn3ih2YoeSEIf+u7GpTsuqm+zyfKvwHBUVgBVYCL+w8YhpLaiCFJjXM3h6z3jiiTtliDI6+EYVhEBLpkwl2n7MqbXqXOA1+a/C+g8B0IJY+FIdeDWMor4JHcSjWZq3bXAihw4trz8W/+XZoxVnWWanVmuUnCaM2CVAJqThomuoLQxO1Ic6u7EJyK900dLW9SXwrfaRy4lLCtTJUxYohp5s98gvfmMabvvKApeeZXuwn9vyPg3C18b+5eZWV89AjOej5KcB399r8NMMhW+d3bq0YClpqZ71vy25H+LzC85pcP0NuKkwtTvJLgREhg9gjKlOsvxQYAHnUoxuGBOG7OX+B5fLnvfgFRCuxDqEbxilrfWRq8IuhKiJSczMU8NZUGWUcww2KiVfPTb3XUmp0Eh+x8daIsZt8vxytzDNOf3GPOw44VC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MbX36uhWF8cxsU0lRbLQXgJY8xoDTIHPhSOCIG1mVvXk46aJfcHHJL7PuKMK?=
 =?us-ascii?Q?Q5M7w6N2QEESz0NDlDti65pKgdgnFhxNodol40TsZio4pRrxWfQMjhUVqwG/?=
 =?us-ascii?Q?q2lE/iCuhmiGGJrwV6TDeL0DVpaykxOdOE6b+KV6B08/eQglsfBsHsNLKXp6?=
 =?us-ascii?Q?LWfuTG94TU40g23QG+wqQ8lUzO6Za3U/k96rREO6iMbSdQl0Ob2YwY63MJqx?=
 =?us-ascii?Q?cCSeStoQsNONJrdb3fn0CX56FP4lF2AFZgdClwxhdzFrrZxL3Pq2gTQmAT6Y?=
 =?us-ascii?Q?g+TLr7eVjFRWuEjcebPUx33aX/HnW4w4h7zW5YFPZ5iQtgFuZZ667GLlsmu8?=
 =?us-ascii?Q?H0uktWsVU+taG6RzcHTwIfkPzhTBWPEJ4+fhrS4QqTpPNb8EuezHEwcF5V7R?=
 =?us-ascii?Q?/pjLB3nZUtMyBZEMbT7KES5NeQVQNkVdhhsn/365VUvawDVrKhXQSRuUpuZW?=
 =?us-ascii?Q?3e16kYeKiFmbZuPUOuQJe3nR0aLBQJITCo8rVBAzqLoTZyWzswzV0B2yGNlt?=
 =?us-ascii?Q?q9oGNCLgrX+R6RrECDkTglDA5Se4cgWW1DKqWoBP1ScunuqyUMKzRe/Rx314?=
 =?us-ascii?Q?vHws+HGMC0SSFXzMCw6yIgsVR+qAHThZZM9S2lKJ0A2J79vz5woGffS9ywpl?=
 =?us-ascii?Q?OPvwxsHHra0XPDj/IczvoF7QooSJ6Ddi2e8Av3GU8hzBCOxsrOJ6gjdL+5dF?=
 =?us-ascii?Q?9DCiiOejKMUUlGkmYy/7Fq6YDU89Vlq9sZgUjM354OOJm6nRmZMCkHpNc6Oi?=
 =?us-ascii?Q?J6t8nIutaK1ANI1GJB2m8m+WGaVnRgwM5mcNrOYu9WaL4MLrVnuYWhpABzSv?=
 =?us-ascii?Q?AcodfV4+tZ64FiaO0/hrFMiVmMGRmw7SXh2MSaj1zCzLa7wjGjElpsenZypl?=
 =?us-ascii?Q?lPupjvORuRujJOhkD/Fj3veS/h98cHQVuIIUcluDCHZNqfO1F4peOXdefvU0?=
 =?us-ascii?Q?9rdMDwbEWa3oCSRxrKw+fGuiFm6cvhDx86gYtuJ3pJUsNn1uyb0zwn41Mp6E?=
 =?us-ascii?Q?yjgVg1pXk9l33RjLpD2aCYAYldWp4rcV/qWJUez4Q/ZrwbNK1l9ikUZ2FWuf?=
 =?us-ascii?Q?duGSW8dLbBevSjErUeYC1IoxvXreaAzxHQn1HFiRroew5GBcNrqDqcHchvOR?=
 =?us-ascii?Q?/lK15tPHqugy3g4VolZb7hyyRagDsTzxc1iQeJKwRa003++VBUjwVpOIDRzj?=
 =?us-ascii?Q?nQqrG9WDZUk6DIZ11JZ1bNmu4vgpTlvYj3LoV8Nark1CX40Vd4rt7ejbhZ8W?=
 =?us-ascii?Q?d1I5MOoaYlUKGtIstT+giRPujXDZD7StuFBWiI2pse7BZ2YMoyTv7AadbCMi?=
 =?us-ascii?Q?QJLOZAa4qFTmFxjMyaO4gYBU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e55ecb0-b0aa-454c-89d6-08d92bf7ccae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:14.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHOcqtE1hkcOA0V7TV0l9/zYeIfyLfm9+nh3tzYTmQSPbDidzXof5HqzML8CpSrKqKfPrpAmSDk2fiT6V74Eke7sqc0MDZ4oa1YQa0ZXU2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Currently sioc pointer is used just to pass from socket-connection to
nbd negotiation. Drop the field, and use local variables instead. With
next commit we'll update nbd/client-connection.c to behave
appropriately (return only top-most ioc, not two channels).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 98 ++++++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2abcedd464..9f193d130b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -67,8 +67,7 @@ typedef enum NBDClientState {
 } NBDClientState;
 
 typedef struct BDRVNBDState {
-    QIOChannelSocket *sioc; /* The master data channel */
-    QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
+    QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;
 
     CoMutex send_mutex;
@@ -100,9 +99,11 @@ typedef struct BDRVNBDState {
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
@@ -359,6 +360,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
+    QIOChannelSocket *sioc;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -393,27 +395,26 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
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
@@ -430,8 +431,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
 
@@ -566,8 +565,6 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }
@@ -1566,7 +1563,7 @@ static void nbd_yank(void *opaque)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
-    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
 }
 
 static void nbd_client_close(BlockDriverState *bs)
@@ -1581,57 +1578,64 @@ static void nbd_client_close(BlockDriverState *bs)
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
@@ -1640,23 +1644,15 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
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
 
@@ -2048,6 +2044,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
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


