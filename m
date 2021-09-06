Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB140204E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:10:41 +0200 (CEST)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK0u-0000Fi-OS
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxh-0005YG-Ox; Mon, 06 Sep 2021 15:07:22 -0400
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:34209 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxf-0002G7-98; Mon, 06 Sep 2021 15:07:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1VShAPTCASR2q6orAYhjSTUcgCVe1YsckwD2vnErj6SxOsNUksNfVmK/XZO6QD03WnbZclo8YjchYoCNyygCxO3uG83peldTk+ERUv73APDbSVKp5v3ga/2cbsuIw9IW7lRmb4W8RXyWA/s467Ob2ut2mpLFumNYjczQf60cQ74ftcrpGykwgo8MDIGM+khCkt17W0zzQynQ2PwPPuR0uPmfc5VTNj6rdcFzAFCtblJeeieo8rWjuoT9tOTezPvWVJtcQ2fLyfT8vN/ybQIh8376adpT5b9Qt5OZEIEbfBuYUMwuxcLlUDO32kUyZLU1SHYJfsaewgH7Fwt8ZCziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ya1gebwDhN1zv+ILH+mlU2bpF/HhqFfKifxzMrBTwrY=;
 b=OQzmQpNFEMgY5g/EONGZHAZjl5VjIw2ln/EC/ja70//YExGWcyfeTi/SwocCBiFXYAHAnx4LSsX3SGIrs8aO92vQ3HYBN4Djr2i6aw6ob2lZUKRp1g8BpOx4eCyyhJtuz2g2MMCBntIllqOLv2uTQ9SEfZE8I2GkDhDy3LKIdNIGhht8T2Z7uhf0m8ObGVUkkF5OmU6jierFQ5sR9nYc4ALkYJHCTTrc/k0+4DOxhQoigRU3mRgtwX9mcEf0TXhJi1GYM3WBsr8z+19fs8BvDYwlDleizR7zaZPJgPTYmE4rrWkVTmnwTv2fM7xyvQDDxvIzRb6NxuJc6skwUIajEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya1gebwDhN1zv+ILH+mlU2bpF/HhqFfKifxzMrBTwrY=;
 b=R5blL1R+XbZi0gi4CNiK6Qj2l/oMrrSfAqjGAU3qlt0B0pMLPbCP1KSqm7PX2MUo3VdrtetVFHRKEljxQ7DhmctJCpc88wmuRNL+FG9CzWNgShIC/c/l3+kX5U4h7mUdIFTeEk030XMAsmYxFCFswK2EULhVI+EPI5ZUO1yecTo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 3/9] nbd: allow reconnect on open,
 with corresponding new options
Date: Mon,  6 Sep 2021 22:06:48 +0300
Message-Id: <20210906190654.183421-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43724654-8ddc-4689-255a-08d971698827
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60380D6415FFE0E8270EDC9FC1D29@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+Yp2yxC0TcPSpOtp83dNY0rd5Doz4ug4rTusM40cZnPID8hmAudxBiCTX4ft+YC2Yjfn+N0Tz15/6CRHqvDDRpJIXS4Dl8q6JRLOiidkyxjrN9NJSrAOehwNNZ2WchlJRfH+GicQL6njEqj8lsUzmHuGpIhbN4TjtROj4y2xAggGEB5gU2+0xUcVWdWpNkxjoHF4g/diVnxwAEzJWsBnrFjxyJUE6U4pNgszz3Resrf4/WMJjRRzi81vmIjF6S+PTki+l7yN4Vq8oQ4Z3L9t3bPFEoARszA+RsysodVieZTodOKEkmfDkqFEbfSTHP7Bc/uZfM2wtjhLm30lgE7/TPLogHLtRZ+WM81WLzKoXdNdD4TR6WlZ2WfTcjFI8pxmN8qBVXoxAgQVKcDxCdrBT9PbirD8YZT6neDoEJpO0ULG8tZ4rIdrrO+4z41UVNnwwsxs4hYbB7hdC7LstYUmBPQWXTWck9wXSltZoUkjYVaT343FchzFrR+uh715/TizFIzd8HQVeF8BviUHCpUACkUQcpMJYZcaYgasOZMuVqG/KZqmVmjOGzz1VyPP0J7TuIvDsWhiDmChIOuE1Zev+Z8TmU1rxsb3EjjzUerhPJSJ7bwhVLYMi7cIj1ZsWA89gv2MAJVct8rxRpJ+YYGwNIwM4kpFxYzvs+Rh5I0u0R3Fx7HRVCW2YAOCgQKyNjhah/C/B5n/HbgFlt50xn4Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6916009)(8676002)(6666004)(2906002)(956004)(26005)(66476007)(66556008)(66946007)(6512007)(186003)(5660300002)(316002)(52116002)(6506007)(4326008)(508600001)(2616005)(83380400001)(38350700002)(107886003)(1076003)(38100700002)(36756003)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmcu1b6B8R2U92boNKu47OYsskUZkPWIsIdqXuRZg38sQF3EjO9NGK7pyget?=
 =?us-ascii?Q?x7Mg5rfaq/ViaWnBrx7WWQ54N617j8mQVvtzDRLPThPfhZ8klGNC+WPtVjD8?=
 =?us-ascii?Q?pj0qwh89i6xo5P2QnKzJw4oBpYsZBKRj8/uk9A3VmvxVFRb0AsvsHkO35pU9?=
 =?us-ascii?Q?gMuPKwduP9/Xmpn7bfOoQqMG9UnjFpJV0vKA07bAjokKFkfyGOPCzsfXM9Pu?=
 =?us-ascii?Q?4VOj5mSnoN8wlQi4P+t1Y1lKPVcE2mUWVSZ3pCRauUW8ps/UdAqE4Lwbf8rr?=
 =?us-ascii?Q?a1gUT9cGYKftG1im5d+1JP/G8u/lizAXRRSFKCDbA71srhOum791Hv+XZK+X?=
 =?us-ascii?Q?ZLgtDUNCJIbqrT4GMjHNx38dPwhUSZxmowy0swE3GiUt/q8mPKNsEXUFYfrJ?=
 =?us-ascii?Q?6V3z/1PacXLjtYQrJEEumJSdUHjEHrP6+g+tJ3aiHaWYlo02kWJf8NhqX0rt?=
 =?us-ascii?Q?l+otJc2M/H2x/1nD4UCh/edu0zKp1U5Jlh3d+9ePenv7EDIZGC1nurDGiqSs?=
 =?us-ascii?Q?+Zsv3V+MWQtT8GXOf5E2BJcJlEu3pLYaYTIbCZQt+eorLoWuMez6Z3h21ar0?=
 =?us-ascii?Q?XcZ2pCDVF/W9TuMBOCHQK4CangBUs2S7ks5o2SedlbpxEtYKNwr+Iq+Rme3d?=
 =?us-ascii?Q?Svpw2/kiTqlkN63U9wmBI5zJY7Oik5DuYJMGfRVfxUCfxAE/Lt7Cq2oa2iP4?=
 =?us-ascii?Q?QJjOpyBUVu9gYadw67qO38ZdhvgEBKLux2Rpe5ncAnmjgbSy6iLjdOLsdYln?=
 =?us-ascii?Q?TmwhD+rvp2IGRqnyWK0royiDZUYSllsGEaktg0JNwJcjA379jJBMUYnf8rEw?=
 =?us-ascii?Q?MX7Xt+2oi/uPmwOwcF4/SugYqQONYUKwGWAbXjIFsYDt3iRNBimCafxr6g2Y?=
 =?us-ascii?Q?7GCf4Ecid5cH829HlBRCtsZrcgK8yJKygaT7+cgQVVoNFlz1/Kl8dZhOR9v3?=
 =?us-ascii?Q?Aq/Tpajw6Zk90+Zpg8d0LjCqW6saFGWU7WyjD217LKHezNmGh/kuO13E0zCO?=
 =?us-ascii?Q?LVMf8stzuNoLmJM3L0ss3xa/DPJ3XHcvP0lMqGc8+23A1NVRv6/peb4FrhK9?=
 =?us-ascii?Q?tbxuJ+cFgLnk8vYsjssztIG5V2qPvtYzFyNvbQNHlIuFkZ7HB+qkxVnWNnsX?=
 =?us-ascii?Q?5qyp8mRC/oZs7KKWHj5GHP3QbzzE6HbDA5C7o+t52erUcTD/dtk/hpUs9/fQ?=
 =?us-ascii?Q?UXK7ih0kuePXo+qgoZGoqUAHUkmsJ7gArL9CHascK14xDORxw4pqWcvoeAG5?=
 =?us-ascii?Q?nz2fKrFvdSPRYlOwFoHyLPbXsfvtxaqHSsoddiWkf2F9/91xteuEIzEDyiMh?=
 =?us-ascii?Q?RA8t9AQ1DaPAkZhw6+2VMosK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43724654-8ddc-4689-255a-08d971698827
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:12.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70yP7KKiqJRF4u9yuY317uyj/mRNih2/QdiI93yWPXmoAnz167g1caZV1iuMAEYefk01WLqVv7vnD35VAdRavJ7e6uHqe/xeZW4+Iq+xaN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.20.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

It is useful when start of vm and start of nbd server are not
simple to sync.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json |  9 ++++++++-
 block/nbd.c          | 45 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6e4042530a..30d491bcd4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3994,6 +3994,12 @@
 #                   future requests before a successful reconnect will
 #                   immediately fail. Default 0 (Since 4.2)
 #
+# @open-timeout: In seconds. If zero, the nbd driver tries the connection
+#                only once, and fails to open if the connection fails.
+#                If non-zero, the nbd driver will repeat connection attempts
+#                until successful or until @open-timeout seconds have elapsed.
+#                Default 0 (Since 6.2)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsNbd',
@@ -4001,7 +4007,8 @@
             '*export': 'str',
             '*tls-creds': 'str',
             '*x-dirty-bitmap': 'str',
-            '*reconnect-delay': 'uint32' } }
+            '*reconnect-delay': 'uint32',
+            '*open-timeout': 'uint32' } }
 
 ##
 # @BlockdevOptionsRaw:
diff --git a/block/nbd.c b/block/nbd.c
index 306b2de9f2..38a503102c 100644
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
@@ -1737,6 +1765,15 @@ static QemuOptsList nbd_runtime_opts = {
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
@@ -1792,6 +1829,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     }
 
     s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
+    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
 
     ret = 0;
 
@@ -1823,7 +1861,12 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
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
2.29.2


