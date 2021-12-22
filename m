Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780147D744
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:59:38 +0100 (CET)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06pt-0000jA-Nz
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jf-00083K-Gu; Wed, 22 Dec 2021 13:53:11 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:20601 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jc-0004am-IT; Wed, 22 Dec 2021 13:53:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ6Q1RuAxkpcAaDM2qTmxFoCkZFfSO9OXq+GNiQfj0XiJclOokH4g7yuhiOQ/WVA7H9UfdIDMoipOLq3FLSnxreeLeioHcYIeoy4rYxf4b9KoPtuhlHb1oFhyIpIUW3nGdG46JrcHEHc0BNbRbw5PyOBZda31PVu0D4UkZEtH9cbuUWkxGn07lvNx/c4yx5b0lX/6JQT8Z4hhjqBFNBBzvqjvFO5bJ5uZV8gu41V+CxalPj45gUOG+ZwyoKg0nNGp2YvqAC+5Jv4fJN7ILY43r5llFL6p/HDNqvFfc4JyUTIIEWUGhkyWU/JictPl5usEQ4L62wRjk7bzpVyh9djgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VavSDBMwSDdH8AXDwSgAmWw98hO6nMUhGhE0g+6XmNI=;
 b=avCy7HIN6kBFxKfOt05LKZ9H2ZOIf7ZOe4qReVswsDIQq4QIrqGMLS0qDUXpXzm1R2fnjpR4P37aDKwIAHo6llJQD39jX5Sv1VkMSYlatHm6qYnFV3dd49S9VJLjClEAxmnZQnHk0nOm7SDM1NP0o00zL8DAgCaXWDW/3osMpb0ruTP/C5PvxjhSDxhw76fbPMhIsFsGcC9fgKnXDdjhcRiUdSqba6YfJpQR071sN5CUfctLHi48GftPYfbGLrpMLwqFpL7BAaH91xkBFIkzS+fND0TtRo9Wm0fDCy4O+B3Y9E0X5B5sa/Av6nKdSycUjwRM7Vw2sOqPDr9x+5BStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VavSDBMwSDdH8AXDwSgAmWw98hO6nMUhGhE0g+6XmNI=;
 b=D4uBL32CFjS+EQXyUWjWLK/k4Lg1zoZZLb4sxjVnX0gnzOoAguHGXPl3nRub/MG+8p5CVprg4JZMjEsdnj/pkZ2IFo8bOGXIsvtuzhHCuOhaJKNUYm6Js9GsRS6V9D90013mqwDj/jZkaLQltEV59Aa11+ig7ydvIZW8erd8k6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org
Subject: [PULL 1/7] nbd: allow reconnect on open,
 with corresponding new options
Date: Wed, 22 Dec 2021 19:52:42 +0100
Message-Id: <20211222185248.466010-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 823421bd-2696-495d-1f7c-08d9c57c4757
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB58579EE87FA15BA1D491CAECC17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Cr5quxcRoLLcuJLpQVcLL25/VmxqUMuBJ+lD0pMFcTInnt4QfbBQ03sK1G6QP2WzfIBi6PO3A+cY2+GSCSRN7o+rx19lT3B1O46j6649fRZYvNokUlrHuOyePOXxzr0IppMfo3osV7c0SuEI5GztBUstD3pfuxNN/0Ph+fMGwp3HvPFLNwxAmQ2ydhh2JNQI9TPtib5ogqjSMPRAnnzHQFUjXf4BZH8OnZrAicV8jS13m3Sbl+LsuMFkqXXqJCgATG73uCvVOEUTQtciR4boczZm4pmXnLHbmp1cduHR8Rw3eYlf7QqdQljwLwjSkHf3j5Pv9apQvA0cW2CoO6Og6vKQyjeAGPaA3c+CyZi9zQFyiOKDpU9QXmJGH6dZ95B3A4FOQKTZvMGWuW/OGdV2jgsY26BYIEG/QwSB3osKT/V+JQbA1XWQ5VM/OLWSqwru1HP8s9ShZ2VmSz9e1BWg1g6RAn/6uFQETsfanocJXjxyMv4/7As0TlIBEFlkjrMGon5V+yzRHgXioF2U1FAwnVWARC4zmTNYjT6JP1Khe5UIHAlmvFTprda/jGk9NmESdEnAk6tJIIcvT6PDKCXnBJDnKmgnm5DriJDZtbWsYBgURCicyiZyQ5UiHMZAP0f3k+DCzlozD/ubyucwJOQPDtVOMq9ZNDoirZKL+lzJMD+n9XmauVE7aUKcji/HxHGFcOzHUArIL6AkOQHyO72zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hbt0HQb+Lxnwn45QTrTsTAtoi1YbGHexYos+ctgWsr9Nn34/vqTSnZPhY3KL?=
 =?us-ascii?Q?Y7t7S34bC2fogom+5AeX0Qq50EmJyFOoG2gf+3a9Xm+ZHmqgtFiu7VQePtTu?=
 =?us-ascii?Q?VxcwL2L92IvMXP3tHKVBU9MlVO2qBoGZN0/pYst5ngg/U7JWnHS/XaHGLm1B?=
 =?us-ascii?Q?rKszNjQ5o9l5WgANRcVBXu+U7q61AO8VgVanmSlX3JP9gODVzn3llFZXDer/?=
 =?us-ascii?Q?/ZOpc6ELShJiDLbOVZq+h3zI+PWmxxu4TC3TdYNsISWVusCCR77NgNH/sV3s?=
 =?us-ascii?Q?kSybZZOGZK4RD5S/54c0s2apYr+AeOlDr8FRDo5EM9ADSWRjAyJw8hmVeD8s?=
 =?us-ascii?Q?Y+NVdFn00nsswCuZ0Oigide779aCAru4eg2s/MNqw6tuVubpOnYJVxCDZX2A?=
 =?us-ascii?Q?+6IkP6iEpP2eSBDGkDZI/2Q2O10hvHSMYGZwsFyIGmslhL9du3n/pIKAA4u4?=
 =?us-ascii?Q?j/ZMWb9c72Txos3V9VJbHeZGXKjwIhMzLy9i6V3qiDW+Rg7G9mUsfzinwXeh?=
 =?us-ascii?Q?XvoXOQOcUz9KcGAdOpzjK4xp19/KYsY8fto+xjimGM5L3I7CefBU+x5CMjNP?=
 =?us-ascii?Q?GlO8/3eFjDXAKh/yfD7+NhUCzHO8NwjrWszKmVAfXBlp5HMVERk7JcWgKxSm?=
 =?us-ascii?Q?Fim1jGXavJoqZETjl67Bz6UZUPtBE7N09Ul8EUB3lpHlWZXBkNCYZ7uGo0hB?=
 =?us-ascii?Q?wH/UJ1sW6YADxQ3CHv9lQrO5tp9gV2+GtVVOptQxdczzt/KPZC+VZBBts4bB?=
 =?us-ascii?Q?ipj8GWcCy1sHyA7bXFdmHU7LJIFQI/EmQOPTWNEcZrSSyQzhlh8nKteyj7ub?=
 =?us-ascii?Q?EX1QLDIuSz5VcYJKDS6DKb4zpg1DW0QBMT1q7ru8UHzj3sc3o3aX8EXGezvT?=
 =?us-ascii?Q?7eEfNAurYN+aT8i6V20WtLBek9EKJ3UoeD6fSE3QzMws5pWFXNrYOUSKqqF5?=
 =?us-ascii?Q?ah0kwFVjcszR1I4ZvR8AwUzRpWwQ6mLFUiDbRlCr9UCH/iYvVWm/Ylhnz4QA?=
 =?us-ascii?Q?8Q7NI/8Gu4zJaOmfd1efOxV/NCMXgfbCDDJtIgcVps2KnvazLH7WVFAJaWaP?=
 =?us-ascii?Q?dfXRjuT1j3rkKd/GkNrlBc3tOqltFjj1lc6GVNW21rULeuc8pehUynBmD5rj?=
 =?us-ascii?Q?2DBz8UBR83/gkhvAHACHv+BgX+dZtYUGhXa8tDoActG2gzcxkLWnD/rYpzu9?=
 =?us-ascii?Q?5RkI7Z1FLm8DjdgX+2q6oHlucDkfXHsrJ8wEt/kW/GwwqB/cyHeODmhQSeo1?=
 =?us-ascii?Q?1a5BtwtaMWvoiCLQn1WUxRn/r36lAkIvgaCJSaW6eXPJjFmEPCbkgnCtVhbP?=
 =?us-ascii?Q?uufzd3nOLX+VMkbtZc0iJrpkdybgCpz28ua9k5v+e5XiFUW1KHHfFShxZDfl?=
 =?us-ascii?Q?xLSfaloIgnram1vo7g576SRUvf3lRWU04uOwQgusHv4XBk9jigHaSpNQ0n41?=
 =?us-ascii?Q?vT8oJnA45mGDgC9PI3+KeYgJmEvqdI+8TIwDrVbz0EWNuVAycTWrmcIxrUYA?=
 =?us-ascii?Q?Qjpm9Wf29hpWn/gLpvfv0m5cQ3aylmVVU/S1IC1NXsHuegwyRGAqjJ73eqBK?=
 =?us-ascii?Q?p/cmd/N0vGCs03CQe4lESeJOc4PIz2YFArL8GdHDvDtJPtP+VZytm1ndcoOz?=
 =?us-ascii?Q?a7ZGbG3Tr5PUSqRZPP4/QXeF6uXeKkqOSIMFqeS+8fLfnbrJeGVF4jxCVJiM?=
 =?us-ascii?Q?cthEEIjPP+3eN+RNZ8LwbtZvoGQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823421bd-2696-495d-1f7c-08d9c57c4757
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:01.4706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52+1wWSsalGrn7tQEprIUFsWr1TxcGprSitOmbeEkZdvEnDn//KRo42zpxb2CrtDzKertG5+BfGfr6aoOqfiQvghzRZwDk8MBq0Vda5zDSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

It is useful when start of vm and start of nbd server are not
simple to sync.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json |  9 ++++++++-
 block/nbd.c          | 45 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1d3dd9cb48..bd0b285245 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4096,6 +4096,12 @@
 #                   future requests before a successful reconnect will
 #                   immediately fail. Default 0 (Since 4.2)
 #
+# @open-timeout: In seconds. If zero, the nbd driver tries the connection
+#                only once, and fails to open if the connection fails.
+#                If non-zero, the nbd driver will repeat connection attempts
+#                until successful or until @open-timeout seconds have elapsed.
+#                Default 0 (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-dirty-bitmap is experimental.
 #
@@ -4106,7 +4112,8 @@
             '*export': 'str',
             '*tls-creds': 'str',
             '*x-dirty-bitmap': { 'type': 'str', 'features': [ 'unstable' ] },
-            '*reconnect-delay': 'uint32' } }
+            '*reconnect-delay': 'uint32',
+            '*open-timeout': 'uint32' } }
 
 ##
 # @BlockdevOptionsRaw:
diff --git a/block/nbd.c b/block/nbd.c
index 5ef462db1b..63dbfa807d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -80,6 +80,7 @@ typedef struct BDRVNBDState {
     NBDClientState state;
 
     QEMUTimer *reconnect_delay_timer;
+    QEMUTimer *open_timer;
 
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
@@ -87,6 +88,7 @@ typedef struct BDRVNBDState {
 
     /* Connection parameters */
     uint32_t reconnect_delay;
+    uint32_t open_timeout;
     SocketAddress *saddr;
     char *export, *tlscredsid;
     QCryptoTLSCreds *tlscreds;
@@ -218,6 +220,32 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
 }
 
+static void open_timer_del(BDRVNBDState *s)
+{
+    if (s->open_timer) {
+        timer_free(s->open_timer);
+        s->open_timer = NULL;
+    }
+}
+
+static void open_timer_cb(void *opaque)
+{
+    BDRVNBDState *s = opaque;
+
+    nbd_co_establish_connection_cancel(s->conn);
+    open_timer_del(s);
+}
+
+static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
+{
+    assert(!s->open_timer);
+    s->open_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
+                                  QEMU_CLOCK_REALTIME,
+                                  SCALE_NS,
+                                  open_timer_cb, s);
+    timer_mod(s->open_timer, expire_time_ns);
+}
+
 static bool nbd_client_connecting(BDRVNBDState *s)
 {
     NBDClientState state = qatomic_load_acquire(&s->state);
@@ -1742,6 +1770,15 @@ static QemuOptsList nbd_runtime_opts = {
                     "future requests before a successful reconnect will "
                     "immediately fail. Default 0",
         },
+        {
+            .name = "open-timeout",
+            .type = QEMU_OPT_NUMBER,
+            .help = "In seconds. If zero, the nbd driver tries the connection "
+                    "only once, and fails to open if the connection fails. "
+                    "If non-zero, the nbd driver will repeat connection "
+                    "attempts until successful or until @open-timeout seconds "
+                    "have elapsed. Default 0",
+        },
         { /* end of list */ }
     },
 };
@@ -1797,6 +1834,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     }
 
     s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
+    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
 
     ret = 0;
 
@@ -1828,7 +1866,12 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->conn = nbd_client_connection_new(s->saddr, true, s->export,
                                         s->x_dirty_bitmap, s->tlscreds);
 
-    /* TODO: Configurable retry-until-timeout behaviour. */
+    if (s->open_timeout) {
+        nbd_client_connection_enable_retry(s->conn);
+        open_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+                        s->open_timeout * NANOSECONDS_PER_SECOND);
+    }
+
     s->state = NBD_CLIENT_CONNECTING_WAIT;
     ret = nbd_do_establish_connection(bs, errp);
     if (ret < 0) {
-- 
2.31.1


