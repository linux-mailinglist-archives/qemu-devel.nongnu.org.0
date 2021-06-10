Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE73A296B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:36:19 +0200 (CEST)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI2s-0003Mh-2G
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHd5-0006Lj-Os; Thu, 10 Jun 2021 06:09:40 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:32769 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHd0-0005DU-A1; Thu, 10 Jun 2021 06:09:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT/Lkvol6GbwHj3hMetJB8p6qG/+WrV30SM4gFETor0SLM1ZVO18ZR1UuZAFDl5FPLro44tY57+t7BrlppIS/48R0lDX2MPUaiNukDvRS80wN/cWT9XnibHJEU1zsh8bGVOZ+HMrx9ZSdh93Oul5DTOQTRq0dM4TA4ckfQUfUO1Z3TpBBLbkcO9mmfjfe8x0EuKFnC+9UECxXZ9gdnL1sFyjykFQ6j9c6nUSHO+4D/OW1bQS/ThLPqD3CAhlTr02We5PXnUeI11T9kqQWdekUG6wdZlTJpiLHeWOdUe2BuNhB4RyxodEJT8eCp8VC66XsPHb1KmcPbHipIE+cuGKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEBcMQ8qVB5qoVebjKJoPvZdbrROBbC5dN+177BsbWw=;
 b=MytJE6ZM+28G3AZ9GSagtcQzleT27nbPOP1gjIFNHJNIPiBPBkYfPXdlDytB+S67I0/R47m8SjvwEHAXTAfMlszX5JXc7NzHOrNiqxi51qtuCcv8gqR/SfEQyvpY55byy29zGHpYwW6yc4/PjDDeDYCALWfUQL4qNBWwjb6TcoxbQjAyDbTTazxo6/jj0xaz0y3YSARI081cV2OiSRadonxsZ+Q8sm3lsr/GaVgnZOzO3AhWiSIjWpem2A/uDgvkVm950SWP8sy2EPcFDE5H6ADv+58jLegXCoPGWyoBuU8WiM9JOTumuHB97upz9HFfP1NtUYXrpWLdpHysNwyt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEBcMQ8qVB5qoVebjKJoPvZdbrROBbC5dN+177BsbWw=;
 b=tlyT+DLgQUqJKXBNJql/odXoCqokxBTImfO2YIm0vy3pG9FBf/ns/WWBs/3elHjBjJ6nIKGz6PJQJO3meSMG12xEH1Pm/lEcKF5vnaaZatO0Q0lgFnHTfS+d5XQiWbr6Jb4MAD0uqXHj3xsAO4JfzUSS3uYRblC4ZaqF1k6DOYo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 31/32] block/nbd: add nbd_client_connected() helper
Date: Thu, 10 Jun 2021 13:08:01 +0300
Message-Id: <20210610100802.5888-32-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6a956c1-d29d-44dc-6f96-08d92bf7d15c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB680687BAE2E6A530A2DF3894C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jl3NwjzdrCst985O1hDDA9MG2YyxFTV3bYme8KLJI7kWoVKZdt89oRnG0PsnF0f3jCI9rM9nFKYLno2fYGFLJrNaPMwDpy4DBqPnJ9yWUIWPQNERRspjItoo02b1j/4LMzHQ/nyNIlQRT7DwC8RO8vf0h3nfnNGlU+xOu+j26zADPhvV/X4lBUa1FzvEXSImLNwpnvFsRQ3/IIyqxAQaRKaTt0oPHc3q/jHBM+oEN2gcF6m9R/3QUP5ma7mUtOvQUZGE4qnMPpiTYjV6VbWLHIx8A80UYSwfU25HWZ2xocvYk2SQhaNuxm6JQm0pl+QXo0KRdoqSzPAiBy4K4TJd9gsnjgkW31vE/PihCsYsGRx/7P21S/7hxy3OR9pI0m1Zmo0rd9Tu/OcHtWQQHGfp30zDoQRMyAcK9SXMlUdFzR5OSdk5RRUC2Z12YVSs5oyZKSzsVXzYpjsnTO41oGKyPa2iGT545M4h2ThbUEGzsPAZWjbboRJ2Iu32f5cfFaMGUFGZEgfveo+hwomThkQ1t69U1ph3boLUWADzaygKfKKfo0Q9Lr/chrO2CBuk2ibxI5vfnDBE21uCF79+KPBPOFZuUkzI70RF44vUH8Cy2eB2UqYqPxrhBeApGMUHVcIQtNQDMtJ1xbP+LV+4kZ1DaHGMw4qjz3TaH3OLlQacTmeW4ENLqGjedOS6rAJnbJqa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qCFaQ1DfjrZuYURkSkxcwty/g+cp4zOIUSM3kB/R4UORvwmqvgS3P3R5cXF+?=
 =?us-ascii?Q?58NOkekhSGeT95iw0eZHbd+hdo5bPhkhWpn4HrRcILc2JUazGAdDySTtijNn?=
 =?us-ascii?Q?y4YYhMB9c3dK8nnEYT9GMirgxJ7QXUDFSsUNWi2IHGJJLUI/vh5Gl0vWPOtz?=
 =?us-ascii?Q?stcIVEKOOTAL22bRH26d/6dsqEqaT+nlAIV0VhMBf3JHQXqwSreVOa2ldOFD?=
 =?us-ascii?Q?rxcWiNuLS19+912E1wV61Qd3BE2JIYPnW8mK8UTHVy4gwSUwysTMoJexwJHQ?=
 =?us-ascii?Q?59EZBVK6/AP32MWmjmJGZbLiOeYzT/UsFS7QnVJiHMcqEB5Esm9mMMwPQ2AO?=
 =?us-ascii?Q?pH7t4Y7YJFhcv6m2DUmFIuqp/Lu/RlQvazua1IDeTemENnQMleGlUFU0BgQT?=
 =?us-ascii?Q?p08PjRf5ssJQnNIi2uWFQMUyaJlxhrjz+1oLkr0cm0ZPOvCx/MpJ6xumIvJC?=
 =?us-ascii?Q?9Yw/qsjohmCOxzEh5cL+20Vca/y88G8DNBLyz3Wt80SYwEt7yIUAYhjWFJVM?=
 =?us-ascii?Q?kuXZhDcgdZO4lYvX4nGbBzkJXUyXXtmMq9suSA85mlUD6W6ZwUlYlr9OhSJ8?=
 =?us-ascii?Q?uQuyUDnh4hDlWURch8XLL24i0cnO3unbwR2rwDg5JB28yTYnK4oHe/OtDhZC?=
 =?us-ascii?Q?WurHB+CUNeu2MYgy3VhRZGKR5ggWekqaplly7r6UW0/Yb1osMIInAz44411H?=
 =?us-ascii?Q?Mfx9wlMJ2FrKZ/IyerW2Ah2pubed53wc2VfNVHDduS4MeZg3ee0sdBDIOaAT?=
 =?us-ascii?Q?BKLxJgoeZjZ1gNKTFws1uIudQhezyVKiKNY5qkG4HNUN+DbGUDF54YmjGpRB?=
 =?us-ascii?Q?oaUu/VQyTtuDZSfpozxLx59HIYPpAf/7d5i7xPIuf6uaO4hNH1fO4DAVAgPm?=
 =?us-ascii?Q?sr+T4pj8QX+8PTl5JQTDP3Y4oxfr2++zaaaA17LsYDAWKNAUtn22A7AXouVi?=
 =?us-ascii?Q?pGaiG22oBfKJ/scatCP6PCBCKXmDRKOD7uvfwN6zN0uHNG97gx0tDsjxx8hZ?=
 =?us-ascii?Q?qEmoDxYsuRsShym8Z5rkwhwUe8WFY9fBOWhmhjrONdXJpZqnDJ7ZC+iFWmpc?=
 =?us-ascii?Q?sR1fBU0KrpIOR7ebB9nCGuwVmYjVUOEE/jKBTSVXx/9nr93Z2ZrHytXjf4yw?=
 =?us-ascii?Q?ZYc2GMbynPV+dEeeS2di4Ncaw4QXgEwlEhIAg4hSeWFogndNqNDphTggn7CI?=
 =?us-ascii?Q?MIuKJW7+cT3X0cAyJD3vxAGdODXQYbwbA9vyjGjci6vVAdXj0ab3hKJdy2/U?=
 =?us-ascii?Q?kG21/slFLF6AlJaD9KY4IbddD/+WMYzaL8lop5FUwIyB3koUgqf5lwTmxYGM?=
 =?us-ascii?Q?8nfZbgI6udMeljyRdZ0+Kuy5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a956c1-d29d-44dc-6f96-08d92bf7d15c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:22.0292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/fvnhuSkSSERbkY0PckeyyYHl9RjJPpAQ4k/mnfBv9dQaA02JE8Q1pZa+VL1MJzRO5qGlnZR1Y8X0r93GMZgrTsNliJwbVA6KLvVcAzmFg=
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

We already have two similar helpers for other state. Let's add another
one for convenience.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5e7e238b47..5cfb749e08 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -122,15 +122,20 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }
 
+static bool nbd_client_connected(BDRVNBDState *s)
+{
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+        if (nbd_client_connected(s)) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+        if (nbd_client_connected(s)) {
             qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
         }
         s->state = NBD_CLIENT_QUIT;
@@ -228,7 +233,7 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
      * s->connection_co is either yielded from nbd_receive_reply or from
      * nbd_co_reconnect_loop()
      */
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+    if (nbd_client_connected(s)) {
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }
 
@@ -499,7 +504,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
             nbd_co_reconnect_loop(s);
         }
 
-        if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+        if (!nbd_client_connected(s)) {
             continue;
         }
 
@@ -578,7 +583,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         rc = -EIO;
         goto err;
     }
@@ -605,8 +610,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED &&
-            rc >= 0) {
+        if (nbd_client_connected(s) && rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -931,7 +935,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
     s->requests[i].receiving = false;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -1090,7 +1094,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(&local_err, "Connection closed");
         nbd_iter_channel_error(iter, -EIO, &local_err);
         goto break_loop;
@@ -1115,8 +1119,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }
 
     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) ||
-        qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
         goto break_loop;
     }
 
-- 
2.29.2


