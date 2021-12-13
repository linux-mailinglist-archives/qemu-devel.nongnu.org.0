Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D42F4730AD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:37:47 +0100 (CET)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnOc-00044B-9T
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK0-0003ne-8K; Mon, 13 Dec 2021 10:33:00 -0500
Received: from [2a01:111:f400:7d00::703] (port=2464
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnJv-0000jw-NG; Mon, 13 Dec 2021 10:32:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRe3f1nZB2IoM1bBB/uHoMZCeqABHpBcu3tABYVR0V5DqfI3pYGezYTsGM+t7AeXP0FiS3JTzPOmbUPdQ1y4ayPATOfGSmjnYQMvU0dYPwQuqjU7fhWiED9LgCAn8l/dQyrHA9zcoIQw+RWKrsI5IB4YfEbWGNBA5ba6EOAkCJqTa4tLAzouVDo2zOhVHqhKGbHiamYL43pyVQXLNG+bg+/Ydx3vVE/Ww/lYa1BlItyhxl4MkwhEMRLzH2b0smnCkkJ/j99Y/3j4OeBm6iNQvW3aRuXfsJBxTYNsUkVg8uc41n9NAIz3lu3mocv5c5R0clikzRh2ml3tAhqsnGm3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C3PYtNkL2c5qo5udAhGEo97xa6gl21J40zzQUCEELc=;
 b=msNnmBIObKHZcMTrcYMano+KHWQTbLILWZ6jxkFPJuDYZK/k812uHX42uY1kbrXzrWY7wn8iMU17QfleP1SMnFMJ+MIw1ZgsBtQU04LlX3m+2LkiNc36KDx7iBUfG+1PomlNu575ex2MNNyb6EBdOEBsp7vMx7EH1ciY+1el01BtqBzqY9aHTGaq9b4EYqeDb8D80eTRJxUCLUJBXd8mP1GRWbVzmWb0SefuaIdY5ZJlxhQCA4o2E9mWmQtZCPfBs+ze3+nu/+ZMGdW8h6Wm4d2r3uBtABsQs00bXxH0zq4bWcHQu7ieck6KQk6uV/hny+22FUvzS727eZeCp8YLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C3PYtNkL2c5qo5udAhGEo97xa6gl21J40zzQUCEELc=;
 b=R97L/z+7Ewq2VLiQ/aaUpNf1qbqfGiCLYUPnmk0m49zmlDX/jg7/oDOy3tCEbYWZkyFedubcSMENEAuWaVZ2Lrs2ISqmms1a6YIkmxMxwZuBiIs9xYHfw31MtqrujVq5bmJHbqr+KhZ9Uh9HNDgTsT4geOjsdpQvsHgHL0UtI9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM5PR0802MB2516.eurprd08.prod.outlook.com (2603:10a6:203:a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:51 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 1/7] nbd: allow reconnect on open,
 with corresponding new options
Date: Mon, 13 Dec 2021 16:32:34 +0100
Message-Id: <20211213153240.480103-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac1dd801-ebfe-4424-b6ca-08d9be4dd2aa
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2516:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0802MB251639C98A21684A254058FAC1749@AM5PR0802MB2516.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bM1OoFFikkyaLsO6fWlMC0qoplVCKI02eLBkFbLHH5A5fZwiuPc4nq5hxv1vyTPcTepH1aH7XugtFRoG/OOuvrb2ZGQVdonbQN2ILZ3DIzFhLEjfMHtthxWnfCtsDFwLkfddHmzOEe0psn9n98j3xiiXhexlIXT720/q3dNHREDxPBnSMg7uc+Mmpg4R8OwY7S1mDQe8+QyXxafExq96DRUZAF2bTr6mmZxxFMhz9j39R1irnmgn8jVkUQ3G7du6OLBcPE/wTCrSsHuozU0ULRyL1sgyOeoff8r1CqCVkBVpw15rXkAJud2kiCjrmtEjA9hA1STjyR1aUi1gbkXkP5CXPGw/dIKQ6pwzW5p5pBlu1p/owUGZUaHuRaa5sKbnuaelvLB9KVtsFd5eo5e/pF9VKTnp8AfhFdd2sLmyCPNlYJmHu85n+JcOlm59fIB0fKPH6Q1BHVnn2NK0tUbftzisVnTudePSD+g7WrT5NI/8EcJhRcRvoGsUsC09AF+8qcMW2IB0PEY/uJ8G7CelZQJHcvQR3RXeQ/dkgnOHabxecLKtizcHYLqv/JuAN1AOngQTc+HPyJSulUQRIH0qQUUlB5ChDl+zkvG+LEN7oLbGmu682iOaOuwlx8WD759WqSoTMV4f4ohD1383VuILGKVa7Qb7DzPJz4khd5xS95iWbfkzu17XpjnhgOZOkRV9rQfNm59OuisUIuxLyoOdZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(8936002)(6486002)(66556008)(26005)(66946007)(186003)(2906002)(4326008)(2616005)(66476007)(1076003)(316002)(6506007)(6916009)(52116002)(83380400001)(8676002)(36756003)(86362001)(6666004)(6512007)(508600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSAJFoF2yqWrgfC0QTZ8K5rlCf4cp7uWzUoaY4HXr0tEZpjx1YsQjCq7F86h?=
 =?us-ascii?Q?Fk0QK5wDJAmtD53armXyR2xIvIq5Jj0jo7lBY/kQBbCYsd+wiucrYkf1EVl0?=
 =?us-ascii?Q?3uWgqVjX1/KqLDphcfMrOIddT0OET3r2CwVAmDFMCb0Sjehc93qqSX9L9VrZ?=
 =?us-ascii?Q?1vmBRhciHjT0MJ4w5HVVvtPoYavjh+WfXTkHiX1jWlZhbKR+mrKeqJICn0dI?=
 =?us-ascii?Q?D7/hoP250TZhTCoFxzNbMW/Mfz5+W4D1woiRg4mcZvDVxMDdJradGy7dkRpt?=
 =?us-ascii?Q?MFp3kBuU6rvXBtF5Glga72PQpdfrUIWj6OqXTLOwwBgU8NN35JYMVVcDwwQ9?=
 =?us-ascii?Q?UZY1dnZcj4Ud/EFEXic1KNmSXVykrH+SqCa8Bp+/yNk9+AJaNvB8G3GUHlUk?=
 =?us-ascii?Q?0Vw2ZTaKW+xAW80UxPFARzx3R+DPSMhKBOiqBIIJBFvem6QXUQYCd/qcj6en?=
 =?us-ascii?Q?u6lJwvFBIN/1T7RplbxqH2j7DE/iDgu8rCP8FvHG0dodjzImhAurISCRRCsb?=
 =?us-ascii?Q?0NMLCU0pqu4Ahi6HuOtvbiFBktfLqkyI7IQgOBvKHfH3u6rrOwg+NJRiXwxE?=
 =?us-ascii?Q?pCK6bkRPych3OdEoc1LOJgAfMWZNOLBcXUdJZV52kLdMVWFrqTDXdafZ7v+t?=
 =?us-ascii?Q?yaIXAxTRWIQuyypz2S05yRwBqCY5YkBDLukKNS0At9xlBXh1pXMF8QeX9m+9?=
 =?us-ascii?Q?CK7+1mkhAXObiVS4dOzHB5t7nHAyn2hsYQtnDJzLOIlwC3i6pSzg5SIo8pTf?=
 =?us-ascii?Q?JpslhG0PSO4n/8IaEvfRjj01yuOBTsb2vq4rOeL1N4dAm6fJOlKxhEjPW1Ga?=
 =?us-ascii?Q?lYfVXrBzZzRgXfJVsL2cyghZjLwsNwuslfkkBguLudWu7kuVMVYXBV3kUmhq?=
 =?us-ascii?Q?zO0FZyfItMsKXPmcoVLH6v1UZ2MhozFmn8o56PeFrHkP1h67Erav1gaXmUx+?=
 =?us-ascii?Q?pY+8IKpn33GotMmCyMtkfDmik7tYglvIW8BTAZ8TfkxUVYNGKbjbYhHERb3N?=
 =?us-ascii?Q?070UuOEqq/xE3kEuuKs5ygUKRj7EMuWsX6Rquel7vMuOzKin74CBeIBYyybr?=
 =?us-ascii?Q?xhyN0fNf3WGVCelxTNIQT6PUNfz/9+3dj9O1Xv8tWt9VGzGcFhQDe+KJ5brR?=
 =?us-ascii?Q?oIimrEuXwaaQzbhQxWSOm7BG7QaSlAiu6Gh5jUDj/XhI+yb/9dpmsviXotl1?=
 =?us-ascii?Q?+xwb2E/gEMoX8tpi924pwug7htznQcn+yTqT8VYHnkvP0eUsYLCMI7fa7yUV?=
 =?us-ascii?Q?H38ffxvL3OuZRElAoSFM0i3VO8/2S8BB7Zt2++jQHef313Me0k26tGrygnX6?=
 =?us-ascii?Q?wwHYqKQPmmrC7dhTc3TYCDJtaSA313UiUzXf8erY63vKtqh24Mg85fimDY1c?=
 =?us-ascii?Q?PW2Pb+yyrgrb8zq+scz5I6bHHzFkof9BxIJceDCWd8//T8UGks3QBPrVuMoa?=
 =?us-ascii?Q?E8Wv7XMZXrtQ9VKrT+Fo4VvP7/u761oEoUXfaF46Cj6s0lHhTU76yqXsDVNX?=
 =?us-ascii?Q?78heaentDwQXmrrZh6yCvTnObhyCocTAw4D9mSBqTyFD1DF33NJMtaaxH53q?=
 =?us-ascii?Q?7pj+9CkftugTg+c8IngCzNWNua+c0PiHs9pf+id1cFMbP7ZB84OA4ZnjLMEz?=
 =?us-ascii?Q?YI7jaaIHHu9D8mjFsZLczIVdASRWyGkGKiKAF0UbaxneKNpg5a5A3EZId9M0?=
 =?us-ascii?Q?FnGH+vlrAjhYYasC8wO/MH5l9yk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1dd801-ebfe-4424-b6ca-08d9be4dd2aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:50.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukGP53mpY1QLp5kdIpAJY/fryZqwt4b4IyZ0xYWLhive31Ujt6BJiRdLpKvHGH0BsAXdO9Efo1OlJsfKBOOggOO+zrkyYbJoWAX3SNKsgs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2516
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::703;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 1d3dd9cb48..8cf82417a6 100644
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
+#                Default 0 (Since 6.2)
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


