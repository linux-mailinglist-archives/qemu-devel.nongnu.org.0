Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC88356A8D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:55:54 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5qk-00066o-0V
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iJ-0005Uj-4K; Wed, 07 Apr 2021 06:47:11 -0400
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:30572 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iG-0001S5-QA; Wed, 07 Apr 2021 06:47:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjMoWxS+Zxrijr+R4Jellx+AmlQrL3vsyR3ftLzETQjvLdUgRYzvqwuzOCJqgEVMKe8uaEiY3hPXQautClkoLbijr5Qblyy8DzdX4FDGK2c4DZYlx5WYmHgDlhGWZJo9f6XokOkWgDjSvQzEgIQHpL6C+npNQJTIuWUPfYAkK95/GyrHh4qUYpYNcja6Y9DV1Me1Y8RIVGwItAQ517AYhFZcq7V1AOdruXJPHR2xxM/tT4yNVxJjYVUkDGQAuexV2gNsw/0N92yq8ybclk/ONYygUiHMOH2zWQ33vgCu0VtC+8Bhb8D/vLdW65fgcWo62+ixUV/+bLof2N5CEYXUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg4zmQbBdvV07Kt1cflatKyI+Ctz0/rC0WBKl5mbPQY=;
 b=cY5H+F11SSuI591WgvOtcdfGcSpbz4hEHNyidRPzhxvrGGdU9J3LDFndBuUnxx2YjvmKC3rKLxkV0NLQzDGfHF+cC60p8WD3KYOhbZI7x9A7wj8gV+bybIX1Fk+/Vp6oPwr+VsIyXu2iKallPT20c5+b0nWFpitptAiWYc1hzLnwhM7r41HJwpXN7BGfu+OPMtNrgyo/41FigO2ib34bbjysJHPMAPn3Vz9Teqkze2ZtLopR33nm1jQGq+FqGfSRlDjTJXSj1iUBCgW++upmNAd7ztYs5Uxge2GZAeY3QHAcAHtCRMITAMs2PFYuDKMndvwu+vp0jiGQP/ZGkiwFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg4zmQbBdvV07Kt1cflatKyI+Ctz0/rC0WBKl5mbPQY=;
 b=qgBsSv2gK2nomYg/AKK/rmmgBUyrjpvG6KpsMkZLNBxtFJ153trvkbktY4Fq1OiqOn8X91MocDPnha5/zNPVXJrE5XndSVL0glsyHXTg0eEvwF2oIzuOEdmsDHU71UmWZfDpExK3oiVqnSaxsUUazcMvisLhAsqgm5Gdsdotjcs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 10:47:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 06/14] block/nbd: further segregation of connect-thread
Date: Wed,  7 Apr 2021 13:46:29 +0300
Message-Id: <20210407104637.36033-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb45210a-58be-4bce-f9f6-08d8f9b27c14
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446A2816A9E7D0BDFE9F13CC1759@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZW65onchZUsweubvBUNZOmkqSb7EW/ro0w2KFVEMVSPmvZQvGT1bD/YrPGXZMShch+WYC4zheyvOHj6SEoAGpcGS4qK3hBFPGdmc7OgLfRZXG+RdluCN9GDlB/WxUl8Fva/NpsY53Ic0BfxC487/86o2RBt728i3+BUNv9XxZLmdXXkRgnzCWmWOr1vBuOZczRoIVjuQCspLWT6RqvTEvddfmIL8pT5lD+y7qZc6o6Vj/o+VXZ8gyqt7VYvLrJClfcDp3KqGYg5GsAI7bM3JYGMdH7EaAsrrJbFw0KfT5hSwI6ELCsrmMMS6F9O0JsiEVXxnADnko61bk996H0YiaxKdtpOAmbBJAmP0EliQa0LrI8I9G0xlftvHJJHIMhGTyn7oWCFgajz7Mk/sqleXV9B0j+7U6kB6USp1CyWxevd8nrO0v1Ul6Ui2q/8UgH0ZoUD56/PfzcbsrF8qyx/FhyGAuPMBvascSuOgvSXT6izA76a45fZzVVmDXBOPGWXPQW3dXWMrPwxxeO1X/aGeJibMR9WgOK4qxKtagTTmjSThLWG0Pdwkyz3nY4kidCqsiIHelhH8EeMdWwi7Ld/tssH6j+XsEbUZvvrDwwyaCER5tjInkgpX5IftcuLXmCcLfsU7C/tY/Q+Yx1PN5ShDkfEZUvBcpHHSWC7fUQf97t/HReytJ2wgI8ZRbzYwI1Ll0NTLAr9+b24K7fZNvMZX+5HWFAouqtYrrJ1YN81Ct98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(69590400012)(36756003)(8676002)(66556008)(4326008)(8936002)(6916009)(38350700001)(186003)(16526019)(6506007)(26005)(107886003)(83380400001)(38100700001)(956004)(478600001)(66946007)(86362001)(6666004)(52116002)(6512007)(316002)(66476007)(6486002)(2906002)(5660300002)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6JfNE/cCM4IsLjYuAcDls5gjbXELeHTthexrg5W6erwtfVr0WiAHb2C/YhRA?=
 =?us-ascii?Q?97mtAT8xDAyRIA2D8MMc+uZ/4uVOPZEF2hq8345o9aPxRYbeoDXkLajc/Ytb?=
 =?us-ascii?Q?B/6yxsb1pscpunWp8yb9EspleOe6DqUVZ9B8SCYa6shSDZtSABnNA0ubnkjc?=
 =?us-ascii?Q?OgGDEmv3fL+kxC24rEU9ffiRzVoiGyFxm4/c/2fh3DiuDAU1cLCzaXKB9pAy?=
 =?us-ascii?Q?IRTPkkB09+i9i588yy6y+qiZP+tkdU1JlqeRz55PNSWg4mUBeaXuHFoEiTje?=
 =?us-ascii?Q?YnGeXcX2onSM/jHzOCQ8iyMh64AO7+xdxgufK8W4KWmNmLpS1iCKoP9533A4?=
 =?us-ascii?Q?pG3o5MwVPVrZUPqDvG+cCTbV//1yJUb0QVBpZp/VVwuWVX/OlzUI3MaTr8id?=
 =?us-ascii?Q?LI9RO8lCM/C+ndjjSslBhL+suL8r0byJw/6L/K+84t8tLDl9qcEeigyYL5a7?=
 =?us-ascii?Q?Jq4smE7h6CoIOb1BWOzASnlYA+IOh2xBkDr3pMc82MZsNrLUt94wqqceTZ0X?=
 =?us-ascii?Q?Z2aeC82q0IDjlF8CypcN+CnjHI7MYnJbJblUfAm6yh7QsNF8EQ2Vow+f2jnx?=
 =?us-ascii?Q?y3/e+lo5nGQfrLi3bNn4FBi6JbG5fG1QAAZGitD1xKk8tETLxnix9OJyzOok?=
 =?us-ascii?Q?wmTK906gOeSqBuip6CloEnUfub+nWgaihW+Z+qZmhWhmd2jP+QL+s+/mPUG+?=
 =?us-ascii?Q?RMihXlq4ROflwz4uRsWgsAwn4Q5N7JKJ0MmHhxqMNLSMs/eVWEZVJI3CJZUh?=
 =?us-ascii?Q?hi9YApJO1nkjDFWN1pvvTorx2D4pfjuUP3jv2OoIQGVTxqTcfb1HivNRGZmo?=
 =?us-ascii?Q?8rWzCt2udKenb9WbDZDrxfhXi99rCJ+wOb/F+GziF/7Egi4tjs+WnAuyMqM2?=
 =?us-ascii?Q?IGNdsYYr8kjHMQpKu8c36+vecxQI2uzEXtCgh+1wIHg2dA3ySc34GifSqcLk?=
 =?us-ascii?Q?Av+3KAf/e4xzy1B6JO2Qt8qEIv3fJufmDKT/xP54G+7uAmMs4A+lqwJJIVwq?=
 =?us-ascii?Q?XnEUAci3JFk1/Hvypr2ghDmCZCCfURnEU26K8nz8jAy7oMOuXSEsZr1RWZh7?=
 =?us-ascii?Q?HDShWrbJ1jZ9ABBXXB/gZ6IOqmOA35GUjFf/M2UQeEAYLN+0MAix0kGxEtgJ?=
 =?us-ascii?Q?kHBX3I++rSU5JuoAoZbdcEDNGFmDSwEJOJZps4kKq+PRMkzPPt4JjRfiVJwO?=
 =?us-ascii?Q?NDrNIajVz5Ms22ZINtCLStQcGFNKORC4SRplApYRpgobmMxkGfVSttOs+Y8Q?=
 =?us-ascii?Q?HkXbDpyuPEH8Rl5g2bDIL325AOtLGL/oHQdpEYldFTmx36cjCTRji6Zwefbs?=
 =?us-ascii?Q?UkMnoyD4OAe4j8OebDPAvXgj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb45210a-58be-4bce-f9f6-08d8f9b27c14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:05.6917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paunS7hwAQ0dF0KyA9cWorICrQ5v2BN61WcexrmG7LKaDgs8E0oaQmwP7gxgV/HEHDDP/f7nHVvfd1wjOSkzLJ/CWnVlB6qxVaCtAd43UGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.7.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add personal state NBDConnectThread for connect-thread and
nbd_connect_thread_start() function. Next step would be moving
connect-thread to a separate file.

Note that we stop publishing thr->sioc during
qio_channel_socket_connect_sync(). Which probably means that we can't
early-cancel qio_channel_socket_connect_sync() call in
nbd_free_connect_thread(). Still, when thread is detached it doesn't
make big sense, and we have no guarantee anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 57 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index e16c6d636a..23eb8adab1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -85,8 +85,6 @@ typedef enum NBDConnectThreadState {
 } NBDConnectThreadState;
 
 typedef struct NBDConnectCB {
-    /* Initialization constants */
-    SocketAddress *saddr; /* address to connect to */
     /*
      * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
      * NULL
@@ -103,6 +101,15 @@ typedef struct NBDConnectCB {
     AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
 } NBDConnectCB;
 
+typedef void (*NBDConnectThreadCallback)(QIOChannelSocket *sioc, int ret,
+                                         void *opaque);
+
+typedef struct NBDConnectThread {
+    SocketAddress *saddr; /* address to connect to */
+    NBDConnectThreadCallback cb;
+    void *cb_opaque;
+} NBDConnectThread;
+
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -367,7 +374,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     s->connect_thread = g_new(NBDConnectCB, 1);
 
     *s->connect_thread = (NBDConnectCB) {
-        .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
         .bh_func = connect_bh,
         .bh_opaque = s,
@@ -378,20 +384,18 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
 
 static void nbd_free_connect_thread(NBDConnectCB *thr)
 {
-    if (thr->sioc) {
-        qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
-    }
-    qapi_free_SocketAddress(thr->saddr);
     g_free(thr);
 }
 
-static void connect_thread_cb(int ret, void *opaque)
+static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 {
     NBDConnectCB *thr = opaque;
     bool do_free = false;
 
     qemu_mutex_lock(&thr->mutex);
 
+    thr->sioc = sioc;
+
     switch (thr->state) {
     case CONNECT_THREAD_RUNNING:
         thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
@@ -418,27 +422,45 @@ static void connect_thread_cb(int ret, void *opaque)
 
 static void *connect_thread_func(void *opaque)
 {
-    NBDConnectCB *thr = opaque;
+    NBDConnectThread *thr = opaque;
     int ret;
+    QIOChannelSocket *sioc = qio_channel_socket_new();
 
-    thr->sioc = qio_channel_socket_new();
-
-    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, NULL);
+    ret = qio_channel_socket_connect_sync(sioc, thr->saddr, NULL);
     if (ret < 0) {
-        object_unref(OBJECT(thr->sioc));
-        thr->sioc = NULL;
+        object_unref(OBJECT(sioc));
+        sioc = NULL;
     }
 
-    connect_thread_cb(ret, thr);
+    thr->cb(sioc, ret, thr->cb_opaque);
+
+    qapi_free_SocketAddress(thr->saddr);
+    g_free(thr);
 
     return NULL;
 }
 
+static void nbd_connect_thread_start(const SocketAddress *saddr,
+                                     NBDConnectThreadCallback cb,
+                                     void *cb_opaque)
+{
+    QemuThread thread;
+    NBDConnectThread *thr = g_new(NBDConnectThread, 1);
+
+    *thr = (NBDConnectThread) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
+        .cb = cb,
+        .cb_opaque = cb_opaque,
+    };
+
+    qemu_thread_create(&thread, "nbd-connect",
+                       connect_thread_func, thr, QEMU_THREAD_DETACHED);
+}
+
 static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs)
 {
     int ret;
-    QemuThread thread;
     BDRVNBDState *s = bs->opaque;
     NBDConnectCB *thr = s->connect_thread;
 
@@ -448,8 +470,7 @@ nbd_co_establish_connection(BlockDriverState *bs)
     case CONNECT_THREAD_FAIL:
     case CONNECT_THREAD_NONE:
         thr->state = CONNECT_THREAD_RUNNING;
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
+        nbd_connect_thread_start(s->saddr, connect_thread_cb, thr);
         break;
     case CONNECT_THREAD_SUCCESS:
         /* Previous attempt finally succeeded in background */
-- 
2.29.2


