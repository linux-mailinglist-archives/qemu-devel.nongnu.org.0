Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39A356A8C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:55:31 +0200 (CEST)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5qK-0005iS-G1
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iL-0005bV-Qb; Wed, 07 Apr 2021 06:47:13 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iJ-0001Tc-JY; Wed, 07 Apr 2021 06:47:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVj+mUfVPNVT90SvGxTCoYJlS/LQwIm74vMEa/d6QQLcU1MUT7yB9v1DrLsP7qc4+F1yquNjw44xMdQyhyQeN20dgNNhB/85lGkcyn8C8tLG/1X4pZ5FVzokYQD3duhPtNjZcwIREI+/DdpVbsHhSsDyhifXt/dIqxW3mfvW1oDhWoWc/S++KOIYNhl0xL9umQr2JPiFnknAk/UXLJrcYNfrvyVJMl9+MJpo1WZHz9AsfknGiof6CIlLy8a8lPP6Ms852ZNeBkXSiSyfFZiLku689uh4PRlG8qlOsoTQLndD5rsooCHcPKumE0Wy8MHR63ZRTWUiUywugzLJi/jpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yt6dXcBbHGdZLhSlAgJxmYwqpMspavq7CGWEn5m0rQ=;
 b=kFnh3M/PaI1IZSG9crElOpqaECle2Wif3J1n8Uj73K5O5toWWAkT22ionKsEFUQFw3UGMgs0ePqFfu9KrDaiPmrxg+mef8/d7A7KQjFM4DwmbHE1LQ9MCvjQqjuA/MffpkzNo7TLorI+4KUNcbA9l+MZ5WXZhcsFVErC8e6LuEZL3/Zv8aMKrrZoSf1nm+UmY2kcDBJ0EvIqr4BjAprc0+M4PybM4lTgngiMOTluTQUp430k5er9hW8fUEsiY/yAwV6aBEExC7HUyrgT4tszrkLY5yOHK8azUPGGMOpb3y74buMt3G4l67QQ9rd+Ks/XSHr3ofGfUsc1gbzcQG0S8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yt6dXcBbHGdZLhSlAgJxmYwqpMspavq7CGWEn5m0rQ=;
 b=PIbUT1r6LfTS2wOzIM6GPtbfUr1q59LNznZ7IP9u1leFL3MKBsXuvwVRZMqH+0V+BjdZSAwn7MBq6fDtAiQHsjsYGCp9mfWg/VOYizlzhmZV4D9AjZrbniUoX+0Ttad0O5gNO3IoXJiDQLF7w1xPme2btmPQOxV70uuu6Z0/7To=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 08/14] block/nbd: move nbd connect-thread to
 nbd/client-connect.c
Date: Wed,  7 Apr 2021 13:46:31 +0300
Message-Id: <20210407104637.36033-9-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39090222-d0b7-4e90-3c2b-08d8f9b27dc8
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24523AFB27DEE29A7C51713CC1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VeKyvazT9CcolKBhyekmzgGyAndcMGPSlT+GbImXYvjs5sYDf2904A581LrvInDtiXWsMXMXlQTeYi9HzUwNfPuTmwWNURDrw7TuMtCzO2Dp1hepGbdkvAm8tUrfXP+i7PxYWZM0tVKS5dUj5Zy9zdNgT2Hj1/tv9ypp+YyTiNCeh0hRQAsnb5ktc/mLDS8J5+u+y5d0gYU3rLjbuKOnWubhfhvZSq+kCP/nLdyHLJ0VC/wSxNeBbvnSA3a/nSkvyPRPteTOqpysiwoiP3DcKhfJ6b200ajZ3PA1w7wcQrz+14vPyxIEdewetV75aMBg2Ca5diI4iZAm/lpyk5jY4V49jPKnxHQFGkg75ykOx5HNbVimgWwqqpzxw3P9R++0qg1tvkAAPj19zdMehCFKxMmwLjayGyOCQwplky0NR+5cjVHZB9VWOrJMd3ZjYOkh+WCq8iXkcRtegGUaZAldeYKM14/PBbKRGEfD50O/4CBPV9FUh+ofNV1+/ZPC6d3znfnEwEAbEEAv5jZE4noI6+GCZ2jLYkzw0KcDG3da/r0DbeM+bRctndHVQ7/sUbAEdfHchlI75pf8LmCbm9ZSuaKnqSF2DY63nJexcN3DyiqHdDK6nv+dWlJ7CkNudh9uZGPWyAPQXapqDaQzesU4x5SOxaJkBZR2u6Z/A5chQhHe8YiPJSO5sni6N+96od3goZ4QhktT5DL1LAreowZvnoPNhBmc497ktNwVkK4IhY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JE59ZeWkzR8pk/+LMQxE/QuAzhdl3boJHOnEi+icEaOU+Cgo2WonLqxpo2rq?=
 =?us-ascii?Q?whdc/Z9hJaRya9CrhzbUYnld9TlwYUJRT5VpfLG7+5dHHMW753eS1jsUlozT?=
 =?us-ascii?Q?ZbG4qQaG2YHLAB414PM27yumIysCxws8nFuCqsWuhZcZpNisQb8cxpAH3XVZ?=
 =?us-ascii?Q?3hFo2FQshfE3Ys8uO3i8Jg51nHInoCITCm+LhJT68wy577sl2nrzNPQKDzc0?=
 =?us-ascii?Q?su63mlWLomLheBicAuK0U/N+q76jARUq5lgvXifg8IuRuPdOlfYpUvfCMI+5?=
 =?us-ascii?Q?m+RQrStJNN8hn1MwAhLfs84/q4RLfcuMbI6u2eKT+xTs8d6Jgtguk5/rhMpR?=
 =?us-ascii?Q?VEdmMlTA/W0UgIb5aoPNdClu1uCx69C/PaBI/W6zCku2glXZz2pMHGYtgIL3?=
 =?us-ascii?Q?IWUWByJfDv17rNUy+Oddm67WRBN4UUbU2ZjBU1YCUQ/u8a1e7RLu7gmnlKDP?=
 =?us-ascii?Q?d6K2g4XfcNW1YHOpooqd6Gxq1Glod042F5X1SFjGAT10rR0x9rGmBV6Bwsn/?=
 =?us-ascii?Q?Ra5JwRIrKC0x2niq+8FJw7zoWZQc7m9AKHrdxlxt6HU/jKFGjBoG9Mm/ozzH?=
 =?us-ascii?Q?e/GhrgkObx7PFlo3obZw+bYTN/krhqQlF5Hv1Ej7Jzrs6YwMlQu7HJ6KcG1X?=
 =?us-ascii?Q?9qNoa5M2bbv7Xiu+1JOiPSGzZzoBoUKpbpQFvv0jxR/rWbRw4XS46SnaJPW1?=
 =?us-ascii?Q?pqrRkd7f6qVoJrk6/1HBu0OwULuI3jIpFsr1hg4LSdalf4okQGgN2Fsr3bsc?=
 =?us-ascii?Q?fvtBrnC7Nt5o9M2j21iBjG1xvvxz7YBSnGu6BnHDUWYd6TBO9GVUQiGXm9nB?=
 =?us-ascii?Q?i1OJjlceZDtYvqca3lWWBWdQIf4bNNJ/lkiASgBpelYEZZ9j50jcswBBq2cV?=
 =?us-ascii?Q?jYuW90M19FW8ETGCkboNZ6XuVuIELIZ26lJPoBS5PjDHtpDF5tvn+jSbaC77?=
 =?us-ascii?Q?1d9OsnZX2LMFesTB6aC9lyFoHTI6cQi1tWgdToTThsN6dNTw4EqJGbLP3S1v?=
 =?us-ascii?Q?pCvzSrSpgBtThgAcvw3xbE+YM+4RewjuMqdrlEVZAU5LyCFYY92jWh6nctRA?=
 =?us-ascii?Q?EtylNF32zZoVUCvgmzQU4G4lSMwJ3APOQxneBJFjNChvw7X3/DE8/c2z696o?=
 =?us-ascii?Q?FpTLzxj7/bvjRX38Ol48+iZDov+v52wOrYWH2iJ79i4aU88K3FlvvrfQV6jr?=
 =?us-ascii?Q?y8+kE/P3mWugnhBihVeDQZXSeH7qLqSR0HCiX6r3pLeDxY79g9fwny9RAM00?=
 =?us-ascii?Q?uK+8SQ72YGwTAw9XGxfVADv7n8EtKNDl/aE9Pxvl55GoPpCNofi8Dho2e4Rz?=
 =?us-ascii?Q?pirSjjfLv8KypXS68FKnep40?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39090222-d0b7-4e90-3c2b-08d8f9b27dc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:08.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BpDHT1wztOKXV258ILOOqsmmqVjCtgoDFI+SoaUiFdA5UFaXggRcARKiwtOMT8Le732S2BjS0g4fsDvv1opWVEcKA9DNGvUTX27vC8kX4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

connect-thread part is not directly connected to  block-layer. Good
place for it is nbd/ directory.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h  |  6 ++++
 block/nbd.c          | 46 ----------------------------
 nbd/client-connect.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 nbd/meson.build      |  1 +
 4 files changed, 79 insertions(+), 46 deletions(-)
 create mode 100644 nbd/client-connect.c

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f34d23bb0..660ab4c266 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -406,4 +406,10 @@ const char *nbd_info_lookup(uint16_t info);
 const char *nbd_cmd_lookup(uint16_t info);
 const char *nbd_err_lookup(int err);
 
+
+typedef void (*NBDConnectThreadCallback)(QIOChannelSocket *sioc, int ret,
+                                         void *opaque);
+void nbd_connect_thread_start(const SocketAddress *saddr,
+                              NBDConnectThreadCallback cb, void *cb_opaque);
+
 #endif
diff --git a/block/nbd.c b/block/nbd.c
index 4e669d762a..ba281e2d5a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -101,15 +101,6 @@ typedef struct NBDConnectCB {
     AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
 } NBDConnectCB;
 
-typedef void (*NBDConnectThreadCallback)(QIOChannelSocket *sioc, int ret,
-                                         void *opaque);
-
-typedef struct NBDConnectThread {
-    SocketAddress *saddr; /* address to connect to */
-    NBDConnectThreadCallback cb;
-    void *cb_opaque;
-} NBDConnectThread;
-
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -415,43 +406,6 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
     }
 }
 
-static void *connect_thread_func(void *opaque)
-{
-    NBDConnectThread *thr = opaque;
-    int ret;
-    QIOChannelSocket *sioc = qio_channel_socket_new();
-
-    ret = qio_channel_socket_connect_sync(sioc, thr->saddr, NULL);
-    if (ret < 0) {
-        object_unref(OBJECT(sioc));
-        sioc = NULL;
-    }
-
-    thr->cb(sioc, ret, thr->cb_opaque);
-
-    qapi_free_SocketAddress(thr->saddr);
-    g_free(thr);
-
-    return NULL;
-}
-
-static void nbd_connect_thread_start(const SocketAddress *saddr,
-                                     NBDConnectThreadCallback cb,
-                                     void *cb_opaque)
-{
-    QemuThread thread;
-    NBDConnectThread *thr = g_new(NBDConnectThread, 1);
-
-    *thr = (NBDConnectThread) {
-        .saddr = QAPI_CLONE(SocketAddress, saddr),
-        .cb = cb,
-        .cb_opaque = cb_opaque,
-    };
-
-    qemu_thread_create(&thread, "nbd-connect",
-                       connect_thread_func, thr, QEMU_THREAD_DETACHED);
-}
-
 static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs)
 {
diff --git a/nbd/client-connect.c b/nbd/client-connect.c
new file mode 100644
index 0000000000..9f22c41a34
--- /dev/null
+++ b/nbd/client-connect.c
@@ -0,0 +1,72 @@
+/*
+ * QEMU Block driver for  NBD
+ *
+ * Copyright (c) 2020 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/qapi-visit-sockets.h"
+#include "qapi/clone-visitor.h"
+
+#include "block/nbd.h"
+
+typedef struct NBDConnectThread {
+    SocketAddress *saddr; /* address to connect to */
+    NBDConnectThreadCallback cb;
+    void *cb_opaque;
+} NBDConnectThread;
+
+static void *connect_thread_func(void *opaque)
+{
+    NBDConnectThread *thr = opaque;
+    int ret;
+    QIOChannelSocket *sioc = qio_channel_socket_new();
+
+    ret = qio_channel_socket_connect_sync(sioc, thr->saddr, NULL);
+    if (ret < 0) {
+        object_unref(OBJECT(sioc));
+        sioc = NULL;
+    }
+
+    thr->cb(sioc, ret, thr->cb_opaque);
+
+    qapi_free_SocketAddress(thr->saddr);
+    g_free(thr);
+
+    return NULL;
+}
+
+void nbd_connect_thread_start(const SocketAddress *saddr,
+                              NBDConnectThreadCallback cb, void *cb_opaque)
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
diff --git a/nbd/meson.build b/nbd/meson.build
index 2baaa36948..da8c65ae59 100644
--- a/nbd/meson.build
+++ b/nbd/meson.build
@@ -1,5 +1,6 @@
 block_ss.add(files(
   'client.c',
+  'client-connect.c',
   'common.c',
 ))
 blockdev_ss.add(files(
-- 
2.29.2


