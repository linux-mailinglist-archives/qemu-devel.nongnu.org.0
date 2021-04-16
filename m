Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B677361B51
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:33:37 +0200 (CEST)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJuy-0006E5-Lm
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYa-0001tz-Rr; Fri, 16 Apr 2021 04:10:29 -0400
Received: from mail-vi1eur05on2098.outbound.protection.outlook.com
 ([40.107.21.98]:63928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYV-0008Ex-M8; Fri, 16 Apr 2021 04:10:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMreaGx/sumWmqFV0WF5wAOwcSrHZzmJ95O66QRkIWJ+BV9iLjNWSJJjFVSqveG0FXP2VbrSjOSoFhlGWmXHaosaT6TREb+5GOIFTPlWM+R5XXmQ5v5gOLhgECfCaWV7jvfhhcF6GkhCZ2I+i+/jXxeLPseth+tB1fNL0V7fv8l7wMh3IAvuCVhe0olTWSHMXXSMH9y23LuAccUfVHVcEkRKDHCt7yVjMv8IMkSUq3IX3UmI6+DC38WvAQs/kh5dq9n5zP4THaGXEdAsYU1k6y2bUqorgl4bQwy2PMkag5bS/8mNzBfob7te8jmsdfAMXFtVelPvWX1Ou5Ybs7vgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTHprQmBIm8sfBADwHl2hG4xPP4x6aAUloBYLkAbtMA=;
 b=EdrYLL+dar52GvwI1548hGtz5ho869I0hqNzbY2Qkilj4mMsgEidsv0+FP/U3XFTrWrcNNt0IHM3d/77JS55q5UEsVbgXsxTvts3nqyeEQJTg7VzBpUrOJjR/xUqGLpl8+P2wdftlNMBt8uG40S70K0QrvsrITUFpu73fjL8Q5tYqSZHkXAdu/tyUEots6RX3jxeNHPqHIahypOWHDn3enSDPoYXv3wGFOWeNi6wa/yYq4DT3eJjLCo2oPJNMLywoX07jaIgv1GnQMyDRo3KeC2GCkaLEZzZxzXmUQ+mw8H0A1r14DL5DSPCczt/SdBtMNyFQ++8FI0GGeohL0p+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTHprQmBIm8sfBADwHl2hG4xPP4x6aAUloBYLkAbtMA=;
 b=mOAb+Vips3wX2itt4QbcTGebbzChPtZFYs/nuREJhalLZayJS44734ejz88zx3EGrCrD8ZlQyDyvgOWc/JD82pNolfWIGXZU6ITKUUsw9sLdarlKZ48aPQL8rtpyvqOwYrINBc65F5ni1DXRurBC2O4Isaavb6b2ZyYibtcnTjE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:10:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 30/33] block/nbd: reuse nbd_co_do_establish_connection() in
 nbd_open()
Date: Fri, 16 Apr 2021 11:09:08 +0300
Message-Id: <20210416080911.83197-31-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea9e908-331e-44ee-0797-08d900af0c77
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB502995B05F713E7CB90185D9C14C9@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfIYD52YPy1XnkTH7OaHwndPzVMfnEXC8G8Z9Qsmj2PW0NmYDIjvDCOb0kRqkE2niy2p24o+/28eRQdwju1fOcA6SwMs7VlLXNjfmmfhuNIbpwAmMpw1BokXpfMMZjZvCTtZZWYSJhcesPMdeU8RvmMiP+oIy+tvRN8X+zXN+Ok09BluZP/bl2kcX0xu46D2Spr9IjASELhv8ClN4Hq1+n12H+gpuZ25UJa4TEn1yRwG2MYO/o21H7vfAG33ZLjuepSa5UJNpvdX/Q2DbEEhGpCOJy9gqU0v21kB7nTBTmadVKIuclvEHhx1yvt89HCavPqpaknbdeCShtsIQcz+zYY2M1cB4PhJX+IJeSBhNyshf2lH/+qdjdMb2aIakJA3WdAw/E4/HC3EsAOhNrGrcGJgii5rdJ6jKKmR0C9r72rhuYE/YxO0wIdIT7LgyCE18yo0fSE5JK/hllkEHPzCsWmn8zF7cuPLeazONPMVaSkCQSilLSCLP0HjVEQ41WaPI8RtJBu6AkSzXuO0nqFVed0yivcgxSyQc6NDIURW02Hn9hz9vhgmcrHlXhMQniblOpGMeXzwbAH2ZhFlyX6sbmCSOnka2ab+SIFLfjgOdazMPLphctWfENnMa0NhdlTf56/aDVZ32hlnLhqFN+WPfxKGNnsDRvoKfCTTLRb4zk4K6iWPrmR/b4nv/EGHnats
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(86362001)(956004)(69590400012)(6506007)(478600001)(8676002)(36756003)(6916009)(5660300002)(8936002)(4326008)(16526019)(107886003)(26005)(186003)(52116002)(316002)(2616005)(66476007)(66556008)(6512007)(38100700002)(1076003)(83380400001)(38350700002)(2906002)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kdTPP6k8+ccgY2uJy764BzgkRMgtcgBiWJFcKSrxrqhehdFrMPzutcvkBMJI?=
 =?us-ascii?Q?TofMXQxNXDgU7JdMELFmfnyPxkLRA9EX+lwGAvsR0c+j9qHKhIZfXreC7MgX?=
 =?us-ascii?Q?2SyXf1Ezv8MtVtyuI/A0nj0pKnJEC6GedubkaXEmmiW2jtahaudiKHEF8s0+?=
 =?us-ascii?Q?mTwulaRB+Vn4uWVSTz64QSSC27VRswOx0gmQXbt5OeB4EzsdrQI6akiG/A+g?=
 =?us-ascii?Q?IcXo0QQ7zlRqHrQoSaFa8kTMtSA5sy7JNHNoyAkyCyzRy8BoEp2emIUWc6fn?=
 =?us-ascii?Q?iUE71IvWvzr5YiBGsQXK7MSMqRqPzEHuJlpaxz6FjZ/bvkw1la7bymEyyqs+?=
 =?us-ascii?Q?FFx6XDmg/oOMggq8Ik679ec0i/Uj3qIOT11mjBigK+qJrlJ+wh93cib6nEXH?=
 =?us-ascii?Q?seAySe8+KLOvK8Qy7UoAemyWle5n4GRcdJQGzzXMKWbOoI0DJr055DfaAGSA?=
 =?us-ascii?Q?zAsfxl2v+dDqkY6z6tJ+7NHfPjfUa3w0V9lgx9GI3OKz49UWzYQLzkaDVd7c?=
 =?us-ascii?Q?sI/S3lG7z8bRh4pJNdwT0aTlKD5M6K77hHnG980Y8r6uRmOhNqebdHTDzosv?=
 =?us-ascii?Q?+UiBJGdX+IWEK/f/c83odgsq3XzVTcUfNhG1+tL+xsgcx7M9rPVQfcENdIMe?=
 =?us-ascii?Q?PYykbgjOQl1NBAyOguZFedy7PiHmCeRO08FyGJ9BW8L8iQOUZPVu73PiI6n5?=
 =?us-ascii?Q?6JjCDf+mqNp0nMHcZTfgbA9bwknLgtaU8IbHcQh1CIytC9xxHtBLGZohyMqI?=
 =?us-ascii?Q?CEykqQN7ugtB8J3G7hBeaVfUb65Y6D8nyH9rZnt9Pn8Hpg71mbLgZl97Bt2V?=
 =?us-ascii?Q?WX8XNzR78MmvbR+z3tgEzchPfSVcAjL115UOl4TbiSxk0wb75Crfv8bjAY8J?=
 =?us-ascii?Q?zJW6mFPFaOWuDiSWC45xGbe/QxFENCSJlIZcrxQrFEHDcGwtRbtFO21qMZSx?=
 =?us-ascii?Q?E4TRn04RjoUOnD6qDcyOMi7NPw5Iz87HMzyYi9JotTckyLOVgxdDAOtbKB9l?=
 =?us-ascii?Q?vgDwEePNdPtpqdH3UZ3ofQxhwBy9xC7OdImQBg9mRhQWHfXdNiXCQZUV1OU6?=
 =?us-ascii?Q?l+zy5qGbQ+9/I/1n+dQVhdgvmAb+DZr5xWrWs+E5eI/zhFJ9tOoy4Fj5r0YV?=
 =?us-ascii?Q?KrYe2HKTXLXQ2Cc+Kps3bGP6Or2690rYLnNqJ0gYu0e2yD2UuxuzGUzD498m?=
 =?us-ascii?Q?Myi0bjMxhK95Egt243osqtwdiKevKzJfJ12jSSyvPUl3qYB+nfpais3VKa6V?=
 =?us-ascii?Q?gzJL1ua3tzeS5ubscWy87MLuFWgZgy7w4LSP9x9EFFo6SZfmoA37RjbpeVMA?=
 =?us-ascii?Q?mPeZ8gFahYMaURehe/bWLz89?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea9e908-331e-44ee-0797-08d900af0c77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:07.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGtXXBlKc37HWxSvTxcCX+RZtwwX0L6B9SYcvzCc1FpaQ2EYh1s6pE3HNkqs0iU8TWP3OUfkru73inMhPyolZoQR08SB2+WAhF+gyB6X8YA=
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

The only last step we need to reuse the function is coroutine-wrapper.
nbd_open() may be called from non-coroutine context. So, generate the
wrapper and use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/coroutines.h |   6 +++
 block/nbd.c        | 101 ++-------------------------------------------
 2 files changed, 10 insertions(+), 97 deletions(-)

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
index 863d950abd..3b31941a83 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -44,6 +44,7 @@
 #include "block/qdict.h"
 #include "block/nbd.h"
 #include "block/block_int.h"
+#include "block/coroutines.h"
 
 #include "monitor/monitor.h"
 
@@ -101,11 +102,6 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
-                                                  SocketAddress *saddr,
-                                                  Error **errp);
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp);
 static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
@@ -361,7 +357,7 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-static int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
+int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
@@ -1577,83 +1573,6 @@ static void nbd_client_close(BlockDriverState *bs)
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
@@ -2037,7 +1956,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;
 
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
@@ -2056,22 +1974,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
                                         s->x_dirty_bitmap, s->tlscreds,
                                         monitor_cur());
 
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
+    /* TODO: Configurable retry-until-timeout behaviour.*/
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


