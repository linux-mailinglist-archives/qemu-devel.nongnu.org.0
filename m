Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7903A2957
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:28:58 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHvl-0005p9-Hh
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHd2-0006Gh-2J; Thu, 10 Jun 2021 06:09:37 -0400
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:1862 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcw-0005Hv-Um; Thu, 10 Jun 2021 06:09:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds7H8IrVwHAqbX36gGN3dr8WPfU2rTQwjb98imHt5IDHPwvNesT/0oH+Mbgpb/UHjzgtc1BmjZKTBCUly3UW//Bgi45fEBp0dSL58UVCkXuP2gLsUjkaQDf+3eoubiAmarj6hAAp+Lq0rSDygS/ntZeC0SWUGF2u5D4ZATpsmLTIpqay76ry5ZqG77eSYPgsv9lZphzCdJ81JmiV2Ogbqh9lQTMd8qzNPcoZD4gVAJG+01+ZDS3LXaVT5JkqXVC9kz1XonZHYgDcScUT99uDatpw4fZYRxcTP5cwQnP50lk4SIRTO+pn8JHlDyFnGdbAjsrt/F+JCY9dpXKj5gMJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUB3kq39p7pEEkOxutL2Mj2scfoEWTonqm19RC7Q2Ag=;
 b=joggrDJPA/iopFpABLp33AQacGh0C0waGpexxuvIAF+6QfDd8Ozi1cMOpo/wO1lRDo1HNBuZ5XzTfysVvDJKDTwOPI4YyP/mPm54DKTk4vLfYtUJGvRhKemv/pTd/Ftk17LcRBVu+MHLNTXofkd/ZtdLFv/aHL5skDFu4a5/3RFbuVLRIZVbKpZ+sSfBmSbq54ew8TLGQVEzQ6axvSsX49gjL0rKXURPuQNBqL/Z5D3IhpktpGbrE1PbqURjlYzoWPSm4Y81LOOYHIaTIVS/IhkQ+UB03j0WaphmKDvkyzQI5DwC0nS0+/r3zSMKid5cZzO+IuwBI8dSboDz7idTtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUB3kq39p7pEEkOxutL2Mj2scfoEWTonqm19RC7Q2Ag=;
 b=nOAdTT6bKug3PUpxFASGXef/behBlv7+Hcd3aEIV6t5FLypIfx6vmEeUNTs79bmusVcbKN6eaR5FqCkl8DYoOgTNjm+TIbplEvfgA0n4UuI3xFVhkyVN4tzc0V/VNo7IFaV1m+mv6ieG14WvSkQh6ZmhX+jcpQ+XVixH06OnNk8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 30/32] block/nbd: reuse nbd_co_do_establish_connection() in
 nbd_open()
Date: Thu, 10 Jun 2021 13:08:00 +0300
Message-Id: <20210610100802.5888-31-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb96dfd-1d58-448c-cccf-08d92bf7d09b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806866A20EF59CF8E0DBE52C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPfcCyjYWTWtiwnFullLXLnUNxYaN3UD68IJV4TDZoosyU1CY79i6qrNr8X0AM54IkRvjEFi0Y4A3fwFTFMojxXyBFhrTTUpxi11ssjlhdS75KZRwafUVvzwV2Br/Xd9sonsaZMFBP41OQax++ca6DdaIriqPKW453onr24SQOsyf0AHx3q0jpCYc/LV4/G5MkO0ZXbPAfuJtLOwLGBLP8LuFQ6By1VC9Ym5zqkaAmgwHoEx2+Z9CE0CqqRZ4/MIp1tUCdE2OQ8P5AcYO3yqckXXiQolLoSL83G/bNutjyQNjy52jS0QllZbJspNVinwN4CffUWwx2bTMbHnhoTuhbSwm1xYvWRiVfCfJgiGnIo41ARYU73ESlHF4Nm9t9YY2SM57kfgv/0V8ewhr8TnrlRGl1cNk+lTIg1Fq3TDuHQPDStTBQLlI9ZWDI1h6CTwYFBwJnbbF5c9zoUut+8JjsmmRmWPXqd228pyP8aFAqKpqSJ3vjgB+0VehXTrFgg7O4xoIwhTs71EOXiRB4Ex9g1HR7K0wRY1KVS/K0zEv2tdMFB7a2vlAxL+jCgxnSfbKVuzm1eoZpMK4K79inlRxdxxQuqYdKsbD7vOvv774KB4TEh+v3WPdXkrCFgSYxJVV0j+7jm14go/Yl3AjK6To74TXVTgOnWDZkDClLpP2OkMKnTyicZqP8UMuWBgAN8C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k8gK+5E73qhjLqRCPcg0TYjJd6zF6ltug9b/wI2ntm5eW14lnOiEA5LoKv5r?=
 =?us-ascii?Q?jbgn6wHnZPjwcnYvzaUgCkOQI1+hBl35Val88997iMVVVs/6lyK0fFV5x/xG?=
 =?us-ascii?Q?+6LPHYPwbm6Uq1xRdzcfU8NipZGLPlWfqDPYm3qYYNLJf1dlC4mInuOrQgTM?=
 =?us-ascii?Q?iZ84R/cx6evauKmJfocMwCC4pCB1WzFPZKHJtfwLAr1qlwWEk8p86jt93M8x?=
 =?us-ascii?Q?nN/1pKl1b363EOSzpOSES+RqCQ4pGcLXidc1R7f/RSDX+JyHeRcra9sR99mV?=
 =?us-ascii?Q?aflH/pudaw5FL/vvUfcDOEzspjMushVtzuPWXY+bspK4mKeSU7AJxHOdPvmT?=
 =?us-ascii?Q?Znj+P+GHQEjGPFnaDoQNjE9n1hQUTRh/L+bwyzNR6uD05e/qPh/S38YQpkkP?=
 =?us-ascii?Q?9DqexO2HYvCsCCvrrBUTfi/2XNHFaiiHh4R+koTIXnEt2bQ8vxW4f10WYCN3?=
 =?us-ascii?Q?BTUZ13uUsXPTbgMe3s6xswqxy4uWIRkCC5ZhJLYEsErddQQjHAdjuaMx/HU5?=
 =?us-ascii?Q?lpFb+3kqOtcYoPljqOJ0io53/CvFKKVL35cJl/n7tst1vXoIlId3LUIM6wXb?=
 =?us-ascii?Q?7Q00+jN8sjGD9jXKy3eg0fl7xhDD6sJ5KeBHPPKqTKec00vBkezghpTrO6LX?=
 =?us-ascii?Q?eaRhsea0+r48xYh4cekFBYJ9v5TKXmZlO1hfLVflnPeN/iZQtfVUgrtncbFz?=
 =?us-ascii?Q?N0QvivZkgrMs6FcxeCag+u0EZxVbY6NVk0c07FYWJRDtbZVIz8N8ri23NexM?=
 =?us-ascii?Q?MBMY2E4AhgigaYwCAZvibk4RWMCgXZ+oEemCoYBpo90EaTFXyG9ZH/qvTtVZ?=
 =?us-ascii?Q?4txKj5258mjOmD9q71YM1EQlQMjp9PNf69eeTq8ja7YuNMqBXqW/YMMgcX9c?=
 =?us-ascii?Q?PQJ6j8SapqkSrBkcg7jzJGblncTDAyR0hq8jayoQpKXhQurPunl6bonYGdiB?=
 =?us-ascii?Q?1XCsHwL4F1M9Qc2GBwEF6ugZaeQJFX2dg91LO4lf2B4PBp8QrRuh/Qf+RJeu?=
 =?us-ascii?Q?8Y9lS5dCdiAnchsMvVbNnBGz2QS5ZD52pvXaUAxOD0lscGFhtEvWA7CZhpiP?=
 =?us-ascii?Q?MUkU3/K8k/kOqOc1idZmG7Y5OE6qE2CuW0DfXlDRamCGNxrgbbzWDWPsL+gW?=
 =?us-ascii?Q?lBlml53Vl69gdSnPaCFaf2/bbrp61PVaCXOHe9gX4e5sgB9YAf/CR40beUjY?=
 =?us-ascii?Q?XFF4biAxQiJ99vQZQWgqe6dYAImCOjHoByuGQDFqFfZhb0zGTUK+4+otzCCh?=
 =?us-ascii?Q?G1JMz+COobVi4Eyq9QpHb4xL9Cf3cmlmr0qi8ECuhR4FvuDzCHnWDrcEFuZT?=
 =?us-ascii?Q?Udem1S9ynTesvHOTAice8hgD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb96dfd-1d58-448c-cccf-08d92bf7d09b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:20.9261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFS2+XYLaEjtjm2OBVuxsilKkIOr6owBxtNMXr7bdMizDmFeHJvD+XCFH++p2exq1FXcBYCtHwiNbVvOnO21MO466dpWdA/0yUIC5z8JzqA=
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

The only last step we need to reuse the function is coroutine-wrapper.
nbd_open() may be called from non-coroutine context. So, generate the
wrapper and use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/coroutines.h |   6 +++
 block/nbd.c        | 103 +++------------------------------------------
 2 files changed, 11 insertions(+), 98 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 4cfb4946e6..514d169d23 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -66,4 +66,10 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
 int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);
 
+int generated_co_wrapper
+nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
+int coroutine_fn
+nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
+
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/nbd.c b/block/nbd.c
index bf2e939314..5e7e238b47 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -44,6 +44,7 @@
 #include "block/qdict.h"
 #include "block/nbd.h"
 #include "block/block_int.h"
+#include "block/coroutines.h"
 
 #include "qemu/yank.h"
 
@@ -99,11 +100,6 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
-                                                  SocketAddress *saddr,
-                                                  Error **errp);
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
@@ -356,8 +352,8 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
-                                                       Error **errp)
+int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
+                                                Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
@@ -1573,83 +1569,6 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }
 
-static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
-                                                  SocketAddress *saddr,
-                                                  Error **errp)
-{
-    ERRP_GUARD();
-    QIOChannelSocket *sioc;
-
-    sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
-
-    qio_channel_socket_connect_sync(sioc, saddr, errp);
-    if (*errp) {
-        object_unref(OBJECT(sioc));
-        return NULL;
-    }
-
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, bs);
-    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
-
-    return sioc;
-}
-
-/* nbd_client_handshake takes ownership on sioc. */
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    AioContext *aio_context = bdrv_get_aio_context(bs);
-    int ret;
-
-    trace_nbd_client_handshake(s->export);
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
-
-    s->info.request_sizes = true;
-    s->info.structured_reply = true;
-    s->info.base_allocation = true;
-    s->info.x_dirty_bitmap = g_strdup(s->x_dirty_bitmap);
-    s->info.name = g_strdup(s->export ?: "");
-    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscreds,
-                                s->hostname, &s->ioc, &s->info, errp);
-    g_free(s->info.x_dirty_bitmap);
-    g_free(s->info.name);
-    if (ret < 0) {
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(sioc));
-        return ret;
-    }
-
-    if (s->ioc) {
-        /* sioc is referenced by s->ioc */
-        object_unref(OBJECT(sioc));
-    } else {
-        s->ioc = QIO_CHANNEL(sioc);
-    }
-    sioc = NULL;
-
-    ret = nbd_handle_updated_info(bs, errp);
-    if (ret < 0) {
-        /*
-         * We have connected, but must fail for other reasons.
-         * Send NBD_CMD_DISC as a courtesy to the server.
-         */
-        NBDRequest request = { .type = NBD_CMD_DISC };
-
-        nbd_send_request(s->ioc, &request);
-
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-        return ret;
-    }
-
-    return 0;
-}
 
 /*
  * Parse nbd_open options
@@ -2039,7 +1958,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;
 
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
@@ -2057,22 +1975,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->conn = nbd_client_connection_new(s->saddr, true, s->export,
                                         s->x_dirty_bitmap, s->tlscreds);
 
-    /*
-     * establish TCP connection, return error if it fails
-     * TODO: Configurable retry-until-timeout behaviour.
-     */
-    sioc = nbd_establish_connection(bs, s->saddr, errp);
-    if (!sioc) {
-        ret = -ECONNREFUSED;
-        goto fail;
-    }
-
-    ret = nbd_client_handshake(bs, sioc, errp);
+    /* TODO: Configurable retry-until-timeout behaviour. */
+    ret = nbd_do_establish_connection(bs, errp);
     if (ret < 0) {
         goto fail;
     }
-    /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;
 
     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
-- 
2.29.2


