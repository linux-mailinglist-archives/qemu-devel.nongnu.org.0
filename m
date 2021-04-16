Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2506361BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:43:00 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXK43-00055o-Qh
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYd-0001xo-J2; Fri, 16 Apr 2021 04:10:35 -0400
Received: from mail-vi1eur05on2098.outbound.protection.outlook.com
 ([40.107.21.98]:63928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYb-0008Ex-IR; Fri, 16 Apr 2021 04:10:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2VzyzSNvL+WAP8nYy3m2jMBnQzxmQ/qUebzPCT+TYV3EvB2xSznXSe9NkjGRgrj/dj2eo+XqiQzjLPQTUpMnuhpzK+FaamjB+joFaulzkl92g7g1UZ7EsEriFaW6FJ9jMZ3GVaolNDTB3ICDcACAB/84tHLTlCKQriQSZriJ5MueVqUrrNNKzaMXLXwxGqf82+YecYIz7hF4wU0tKAtYj35pnNC85Co1KLHavbt+XMXj6/uVcEmdF9V18HYjgC8JBHYy2r7WYul8Qm36E79G8QTivvuIvKztGCR7nqIfWKbFc8qimj7aOiMgE3nXy+/gaDkAJEcBqiVu4uzS08DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IAJOjF/zZfIs7xBExQgmCFhED9fjabh/b4/XmMrE6s=;
 b=c/VgHN1jHVTDGLVpDskpyIZoOwO6ZXAVBlGFQGmXM8xCiuuPq6xv+kx1bMV7v0vYHnTeoubMb/W/vUms8nd83w6yCLBzH622SRFTCIkXeAaQpPngsUYbfwzN8Dq8dZc9SYeYBmMWKSblVPt91n9ktzTw4Q/DxrRYNeq0ZcPucHT/DoRcR2JVG5abdDNuy8ErOMgv0Hm1l9W2f0XT9l3PrcGRvtL7lAPB6IbMKTzsoAAoUdgqBj7jglXYaKP0/RoC4A1kukZItz7TXyOnUD0MT/Jum312O2sU+K9T04NJk5MJxbYQzh8ZqSUsfTa7SsqMpGHHXuManFlhJfzZhDzpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IAJOjF/zZfIs7xBExQgmCFhED9fjabh/b4/XmMrE6s=;
 b=nDwpw0J1PkBdvkXGIIJ5rL51bvpItS3NC+U7pa5dhAY1E2tW9JE0VtKk4k3TcKeeVjTYDCIvek+AvMPT34/BP3jMPZ6cWG5aGWBJnMdJgwRCNsBVRV9tyjpZrgubfnCalwUKZcaVhoJ889f/0kzOkTKDDmGVC88P/3XMmbvJMLk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:10:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 31/33] block/nbd: add nbd_clinent_connected() helper
Date: Fri, 16 Apr 2021 11:09:09 +0300
Message-Id: <20210416080911.83197-32-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b95e0027-a62c-4673-15a2-08d900af0d41
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB502960FD8CC49E6BD4DCCE83C14C9@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+cFlwoAHm4SsouOZygK1mlpUQJS301PPtMk4TYm/PLVIDN3ipw7SbxAyh7QEjxVVTdCXOSwXNGVOVHjoaOYEuak1NsIivg9768keK4wXWPLxitAynG+9DnZiSsSW0KFNau9GZUhzRvZiXO3oT4y4E8xFTcOiJFKXDsVe1Sor1MathZFBN1eBqQPG13jPU3VqCc0VGfzA2LNGUoIl2BCEpOMQy2V9xybswrkAxC29l0scqkJR0w9a7YGrnEozLTR9J2Tg6/OUvpTxW5LZnyLKo4SD4VndVTl5NWjxLeeK5OmSuIuW9sn7Wj7+F909U/NUpUvgYwhvMfjA25/fMa5Jb4/pMFsSfkvbMXe2oNEQd5KMUwHdqXT14CUPc4qPHLADltt/NzACdz4LLiVbE8Crh7iQhHxqPECrLMlz0HWJX6zuCKFuOtR34gsljIJJDyuZyktBagjSkGxU31gDEmI/2cEgfFMffnLw3F8dhO0Off2iLXgKZlPe4+57PgN1WG3dnQ2pbQb+h48Fr1DSNjdlPMbifNPJn4L35LMzJVQnjSbKvPAVFY8nDqA9CRfbi03adqWIfMsFn95SOSpYqy7eRGsJ4s2QdSB6770ZxwkSOU200VuyD6Vw4hlSeSB0qBng86N91OOSzyYn7C+HqIUpJE6hHC7vugNvintHJYO6KaGrn2J0v5kszLwC1zwyGli
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(86362001)(956004)(69590400012)(6506007)(478600001)(8676002)(36756003)(6916009)(5660300002)(8936002)(4326008)(16526019)(107886003)(26005)(186003)(52116002)(316002)(2616005)(66476007)(66556008)(6512007)(38100700002)(1076003)(83380400001)(38350700002)(2906002)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NBFT2fOAl6z7PhbuaDUElFHwyxVa+VHw8/SG0z1pyCaR6H+Ht7s2lFGjHpOh?=
 =?us-ascii?Q?MtAcAWyFxmMZElnE+i/pqTnMnxihDeYaLFVZm6hoKL5yvv91i8OkB3Ih0KGB?=
 =?us-ascii?Q?KXpGjklOuv3uuI36n3ySgK6SDS2TeOnylEnyiWBfgpED7BFN0FB2qrUrKIE9?=
 =?us-ascii?Q?fPEyoLwtpKrOySmMsfehm1gEO1XT1/JJO5f03Tru8N8V6ryUI89pc9ixLA+S?=
 =?us-ascii?Q?l4E6TsbMLAmh6Q49nmVVq6FL/E3ZeDUTJifhS0U2zSJ6nZnQzTPB+abfGbL3?=
 =?us-ascii?Q?vvNLrvG4kfWKQ6GRe++H5WLjUjAMwCxtAMhw7SutjG22sv4oumcHB5nR3mYj?=
 =?us-ascii?Q?GXjuOC3YOonuULzv9PJtpzRpXen+sHXPPmqrU9qSu5CMId4g7LLO93dRor7p?=
 =?us-ascii?Q?FR5JVzqiNuwDt5hKZn5VC54Qi/lNWNlaXex3LLGNkcHAI1WDkW+jRQlW2kM3?=
 =?us-ascii?Q?A5UM92NJmDGBwpRZj6NRScAByQ8W/9D4Vo2oFSnmj5gVM435TVBYqrEaPjJy?=
 =?us-ascii?Q?URaDW1nA5un2uH/6K2VndU+vY3G2zR6OPJ0ZYIfVRr6KQyPWRLA/39h3GIiV?=
 =?us-ascii?Q?b7kH97NYhsYfuZaVFUWCu0hMIDmuskNgESXw5v2KJg35yZ3vQlOrasP6amkF?=
 =?us-ascii?Q?Psb8Z6jTgQJZmg88KeM33fl0Oq5EuuXyduhybFsa9Ac3S0HMukSlQTauzkff?=
 =?us-ascii?Q?bq9oyiQFehZXVH+AjQNm9fanusmieESN+33/ocO6wiU1lxL3gYFmpftfoAdm?=
 =?us-ascii?Q?CArcR/v2k24U7cK4/x3DzGgC5CfmcG8esr6HNrzSgylUpm1NvQSG9QP8to9C?=
 =?us-ascii?Q?Y/SLqsHgQ3rqQhqCRBM6TV6QOQROF1zicRBfnb0RQVY0S+QjD3P3xg1gDWQl?=
 =?us-ascii?Q?0lfmsXln+xrbE8dMtMpzcIGgn1V5B6W+Y1Puvd4K5VY5VATcA+KRdBsB8iig?=
 =?us-ascii?Q?A/gqjqGXeFQJf/LoZjFUlYHiOjVGvNS4D82NeOT7W/++AjJJXBzbuFqwYdkK?=
 =?us-ascii?Q?wQJLmJfNVhpTc00TIumWYMdvl1vvOi7wfF3Pmm7EQHg1p2WOjmIHpn57UI33?=
 =?us-ascii?Q?Gxi7nlzESV6Iku8pZZNslSvynXBJYQF5heF8ca2/4RBw6wHk1SZwwuHUF4uh?=
 =?us-ascii?Q?D7+iNAZPWFVUOM/YXfR9BFJqmRf4eMUX4Qr7fD9EYXRLBP2gPJxlcOohCY+7?=
 =?us-ascii?Q?RinK46PIJY6va77QuwvuM7csCiVqbtJFsAdykS4kBfNtwBih+OWDmaLk7ai3?=
 =?us-ascii?Q?jxQpahrQAgtweF3S1SQcDzXl3OE/tJ+mFjepNM0IWIy2onXkJooxBCLoWlPJ?=
 =?us-ascii?Q?Qu5aQw8/fjqHi4ZrIEcD7m5d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95e0027-a62c-4673-15a2-08d900af0d41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:09.3591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/7p8BcHhizhodlbm22j9H6oStJTE71fN733WkYQ43WkU9vhrD/pG130Tix2vAsIfPMOlnu/eFlBFM2pv3TDrckxNSU0XxSH11U7yVbNeFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Received-SPF: pass client-ip=40.107.21.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
---
 block/nbd.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3b31941a83..6cc563e13d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -124,15 +124,20 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
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
@@ -230,7 +235,7 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
      * s->connection_co is either yielded from nbd_receive_reply or from
      * nbd_co_reconnect_loop()
      */
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+    if (nbd_client_connected(s)) {
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }
 
@@ -503,7 +508,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
             nbd_co_reconnect_loop(s);
         }
 
-        if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+        if (!nbd_client_connected(s)) {
             continue;
         }
 
@@ -582,7 +587,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         rc = -EIO;
         goto err;
     }
@@ -609,8 +614,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED &&
-            rc >= 0) {
+        if (nbd_clinet_connected(s) && rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -935,7 +939,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
     s->requests[i].receiving = false;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -1094,7 +1098,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(&local_err, "Connection closed");
         nbd_iter_channel_error(iter, -EIO, &local_err);
         goto break_loop;
@@ -1119,8 +1123,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }
 
     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) ||
-        qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
         goto break_loop;
     }
 
-- 
2.29.2


