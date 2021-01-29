Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25A308B02
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:17:20 +0100 (CET)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XOZ-0008Rg-Kx
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0M-0001Xq-4z; Fri, 29 Jan 2021 11:52:19 -0500
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:29349 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X07-0007OV-VT; Fri, 29 Jan 2021 11:52:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkFxHtwza4uwDKEu8ypnYJHP9flcCIMT1rr/1/avtipApH7d1vO6UD/c0dCVR2EHVIk8tsaxEHT1lVCWn9xsHPFJeuHUgeY3HwXEV3uet7STvWnXmb8sigFP05py+xfKU7WxFRlByS2LQekFb8woZ9t6SEtC+nZaIcPs91nlZ0utXH28MuZA4HWupw3lr7hBHJmCSgd4989JmJ3UR/NoeqZxuq+YDOLKUOxi4ZsvfBX6yDI78igFVXy+ptHkudlyf/zFmjq3DI9GgBqJbBdeNFa5VU4DuJ0CEpFXVvpX7u4GWWRq3iKnOEDG2aI3a8McL7/hCwuom8ohoSqNwj4HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyMwim8yPEUIbanVJxCv8TO8vczyvOeItKq/9B8heJE=;
 b=ITOdBUuiDLOmPYErF6hIp9MqbwEXUa1xr76WHeBiuCqylUTWDhzUk473qJQBHT5I2gQM1us+sJ3w/5vSUqu/Qz8pvd3G8mSDuMMXiSFzI2faLvNCDZZBVRue6yduOBn4bk+IY7IsWm6sBn6ubFzTaHTAsfl2hhxduTKWX9pBvJylYb0dZBNyFGFmjNLHfvCKkewck/GosFafffr4YezrVNlnMUdRcDAWxJi+GuhbZ/qhCu0ZYKwJ1jj+QlgKFGoE5H1UZpOW9E00kxo4b3LshcgJlR1ObcTcooI37LqQKTMboPEtBPEJvj8xhTKcmingv3+cUlHTNUZVsU9+s3mhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyMwim8yPEUIbanVJxCv8TO8vczyvOeItKq/9B8heJE=;
 b=DPli5vphhIZDc6uSWSmUnquGDAqEafNkMXv2ZvvtOG9UFVEv/MwoTgwOLaHIr3vbFLg6ZMX94hcTgoHMN887ooA1Q2JDVonwItGsExQ0Sui+sRJIBSr84WfqHPSXbgGQfBphqFamNgQ/pgEJMswJVhAC/Fo/dgupvAB0K8VVCAs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/7] block/qcow2: use compressed write cache
Date: Fri, 29 Jan 2021 19:50:26 +0300
Message-Id: <20210129165030.640169-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00834972-3e29-4450-d7f4-08d8c476281d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621DA08EBB2D8D6EF6251F3C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a4dReTWVmdu518xNc+HM+F+YyKuYtiCZQ8zYfSL6+OmmAycVyeM0GihtxRAbauWYVRjv8YFKVhaQaspLciUODo6efL60ratOydJz9qUqy7oEYG5VCnM0ZUKCJMO7gORCkZan0nEXdLorVUoVBCi/R5xWt+LnRVvOyQvihJXDQ5Asu36GK+HPMWEwUTBGWUqBPR49y6Bab1vd23wRQw4Vn6teEwSMZUecm78ngZAi7XKpDZluyZuEinlx1NE9AzFIa9/b9McWS9JzFHK+BKxPKtODzn0w0TgSE3jMcHz7i85wcItKGlblUYQ4EikPronap7Ebf9xqLrCD2w3adcriQ232dOoe5c5Wsi24CdKXdb5+FtwdnJlm/KAhntSdol5CUCgQ4wkO7lkfdH6Uymsgc8EqGla4KdNI3xPly9NzCtmjvDWZ69i1837dgu7sRTKbRRGjyG6WQRGsy3RCwJEVIZOvyrfJ9Mh9bmUjwTO6AdiB6AQdINhjS/UvSS0No0w1mAzulUTJZxTyP6holOjwMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(19627235002)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZiChEs49V7UTLt4txUp6resjmF8iFkziK8tdVukGrt3OTmi9mwqlMQQysET1?=
 =?us-ascii?Q?SUevkBvdZG+3UIlq/xMgWHb0dmG+b1l4V5V2QsM3zY6OvSXvT3bFh2QbS69D?=
 =?us-ascii?Q?m4WSWK9N3LCrk0zIwGWbmbuPMb3LvEisnPUSJV4RCeB93T2ul5BVZordEJly?=
 =?us-ascii?Q?28X3TNCrSjjjp4LK3rWaWssWyECQ1z3U8QLxm5zWnDG/zpOEDIEG6alEsthD?=
 =?us-ascii?Q?OiA0zcFa46orhwh6S6xHqaSPLfl/CB7zr4YIdRVOZJEaVaiqZB/ASqC7mz7a?=
 =?us-ascii?Q?ZG3jp+y7Qc7SngRYcO2yYp90scJOmUyudbgtYv7c/0XGtvh2UCDpNwx4veBK?=
 =?us-ascii?Q?aL/CiM0jGsBDYtq1y7dRqzERoxTau3mmeDduFV1+jZ8YvpyZKyeQ4xF0dfFD?=
 =?us-ascii?Q?L79zHyWQX5rlPgjif8d52zaOCBWzO4Ch/yLT+VGEHynPDhmnQZmm+RSgsgz9?=
 =?us-ascii?Q?wnL3wV68QYiww0xIdt5UEHX3cKtvrNuO+gy7AI2kfDAFJj//Xq1G7Tnl2xbg?=
 =?us-ascii?Q?aqU0MOmYlMNdp4Qqwxz9C1kVh61PACpsOwcLD51wkOoa0KmZTXGHoe88sVzh?=
 =?us-ascii?Q?W5+6TaysWxpMpABc2/WqT5WH0Hbzvv52pJRwFmK7Um7EDOkZoFdl+gL4n9y2?=
 =?us-ascii?Q?XqZaL3mqxp+xnKu8HT3eJGEEnHUyObelMHsRtkqWgELK3ongYul81xlxuRLL?=
 =?us-ascii?Q?8YUDVzzf42QQ3Nw8yB9q5CYFoiChd6F42j8sRf69Ffx9MqehLi3Ik8PTJ8dS?=
 =?us-ascii?Q?ga+aOxdpI/lBWW6XtnUR16uAL0sKYLTrs8zowoO/OiblrQT1vFym3sNlrhUe?=
 =?us-ascii?Q?6Gc9JxJTI6XUaa8QJ0Kym1ALcwhDd9p6jf1ueKUu2QV1a93KNMehoNzDlmrQ?=
 =?us-ascii?Q?zoFmMdzHYPnaGnGS3Bkov5WE15gDzTo4jBjZRNLUGKvjjDwZ4CO4PhaJwg7q?=
 =?us-ascii?Q?D0mJvwmdVsumOPF6BEe4z/gCvF0kcRzUTJJWtaBxnIQ+3/j3EMf0BkylHmwo?=
 =?us-ascii?Q?zpMs2D7IxpjWGTr088AeNK00b+qgNn7bm0/j9GVYJXMVaUjVx0ZF7l0sczLM?=
 =?us-ascii?Q?c1sCbd+H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00834972-3e29-4450-d7f4-08d8c476281d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:43.2747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V73DYQMuv3J/jcO2TNH0vsJ2BR0gAl9EDm1yohvYQT8haptUWFx+iL8wPADaoH1ijN5FiDRmoBC73P/RISsQ8Uy6ZJY2CWCu1jC1+YXD8V8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new option: compressed-cache-size, with default to 64
clusters (to be not less than 64 default max-workers for backup job).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json   |  8 +++-
 block/qcow2.h          |  4 ++
 block/qcow2-refcount.c | 13 +++++++
 block/qcow2.c          | 87 ++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 108 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9f555d5c1d..e0be6657f3 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3202,6 +3202,11 @@
 #             an image, the data file name is loaded from the image
 #             file. (since 4.0)
 #
+# @compressed-cache-size: The maximum size of compressed write cache in
+#                         bytes. If positive must be not less than
+#                         cluster size. 0 disables the feature. Default
+#                         is 64 * cluster_size. (since 6.0)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsQcow2',
@@ -3217,7 +3222,8 @@
             '*refcount-cache-size': 'int',
             '*cache-clean-interval': 'int',
             '*encrypt': 'BlockdevQcow2Encryption',
-            '*data-file': 'BlockdevRef' } }
+            '*data-file': 'BlockdevRef',
+            '*compressed-cache-size': 'int' } }
 
 ##
 # @SshHostKeyCheckMode:
diff --git a/block/qcow2.h b/block/qcow2.h
index fbdedf89fa..b86aa06006 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -150,6 +150,7 @@
 #define QCOW2_OPT_L2_CACHE_ENTRY_SIZE "l2-cache-entry-size"
 #define QCOW2_OPT_REFCOUNT_CACHE_SIZE "refcount-cache-size"
 #define QCOW2_OPT_CACHE_CLEAN_INTERVAL "cache-clean-interval"
+#define QCOW2_OPT_COMPRESSED_CACHE_SIZE "compressed-cache-size"
 
 typedef struct QCowHeader {
     uint32_t magic;
@@ -422,6 +423,9 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    uint64_t compressed_cache_size;
+    Qcow2CompressedWriteCache *compressed_cache;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..5720591460 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -899,6 +899,11 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
 
+            if (s->compressed_cache) {
+                qcow2_compressed_cache_co_discard(s->compressed_cache,
+                                                  cluster_offset);
+            }
+
             if (s->discard_passthrough[type]) {
                 update_refcount_discard(bs, cluster_offset, s->cluster_size);
             }
@@ -1110,6 +1115,14 @@ int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size)
             }
 
             if (!offset || ROUND_UP(offset, s->cluster_size) != new_cluster) {
+                if (offset && s->compressed_cache) {
+                    /*
+                     * Previous cluster is unfinished, but we'll not write more
+                     * data to it. We should inform compressed cache.
+                     */
+                    qcow2_compressed_cache_co_set_cluster_end(
+                            s->compressed_cache, offset);
+                }
                 offset = new_cluster;
                 free_in_cluster = s->cluster_size;
             } else {
diff --git a/block/qcow2.c b/block/qcow2.c
index 5d94f45be9..3997d8c143 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -808,6 +808,13 @@ static QemuOptsList qcow2_runtime_opts = {
             .type = QEMU_OPT_NUMBER,
             .help = "Clean unused cache entries after this time (in seconds)",
         },
+        {
+            .name = QCOW2_OPT_COMPRESSED_CACHE_SIZE,
+            .type = QEMU_OPT_NUMBER,
+            .help = "The maximum size of compressed write cache in bytes. If "
+                    "positive must be not less than cluster size. 0 disables "
+                    "the feature. Default is 64 * cluster_size",
+        },
         BLOCK_CRYPTO_OPT_DEF_KEY_SECRET("encrypt.",
             "ID of secret providing qcow2 AES key or LUKS passphrase"),
         { /* end of list */ }
@@ -969,6 +976,38 @@ typedef struct Qcow2ReopenState {
     QCryptoBlockOpenOptions *crypto_opts; /* Disk encryption runtime options */
 } Qcow2ReopenState;
 
+static int qcow2_update_compressed_cache_option(BlockDriverState *bs,
+                                                QemuOpts *opts, Error **errp)
+{
+    BDRVQcow2State *s = bs->opaque;
+    uint64_t new_size;
+    int ret;
+
+    new_size = qemu_opt_get_size(opts, QCOW2_OPT_COMPRESSED_CACHE_SIZE,
+                                 64 * s->cluster_size);
+    if (new_size > 0 && new_size < s->cluster_size) {
+        error_setg(errp, "compressed cache size is too small");
+        return -EINVAL;
+    }
+
+    if (s->compressed_cache && !new_size) {
+        ret = qcow2_compressed_cache_stop_flush(bs, s->compressed_cache);
+        if (ret < 0) {
+            error_report("Failed to flush the compressed write cache: %s",
+                         strerror(-ret));
+            return ret;
+        }
+        qcow2_compressed_cache_free(s->compressed_cache);
+        s->compressed_cache = NULL;
+    } else if (s->compressed_cache) {
+        qcow2_compressed_cache_set_size(s->compressed_cache, new_size);
+    }
+
+    s->compressed_cache_size = new_size;
+
+    return 0;
+}
+
 static int qcow2_update_options_prepare(BlockDriverState *bs,
                                         Qcow2ReopenState *r,
                                         QDict *options, int flags,
@@ -994,6 +1033,11 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         goto fail;
     }
 
+    ret = qcow2_update_compressed_cache_option(bs, opts, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
     /* get L2 table/refcount block cache size from command line options */
     read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
                      &refcount_cache_size, &local_err);
@@ -2660,6 +2704,17 @@ static int qcow2_inactivate(BlockDriverState *bs)
                           bdrv_get_device_or_node_name(bs));
     }
 
+    if (s->compressed_cache) {
+        ret = qcow2_compressed_cache_stop_flush(bs, s->compressed_cache);
+        if (ret < 0) {
+            result = ret;
+            error_report("Failed to flush the compressed write cache: %s",
+                         strerror(-ret));
+        }
+        qcow2_compressed_cache_free(s->compressed_cache);
+        s->compressed_cache = NULL;
+    }
+
     ret = qcow2_cache_flush(bs, s->l2_table_cache);
     if (ret) {
         result = ret;
@@ -2692,6 +2747,8 @@ static void qcow2_close(BlockDriverState *bs)
         qcow2_inactivate(bs);
     }
 
+    assert(!s->compressed_cache);
+
     cache_clean_timer_del(bs);
     qcow2_cache_destroy(s->l2_table_cache);
     qcow2_cache_destroy(s->refcount_block_cache);
@@ -4539,8 +4596,14 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
         goto fail;
     }
 
-    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
-    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+    if (s->compressed_cache) {
+        ret = qcow2_compressed_cache_co_write(s->compressed_cache,
+                                              cluster_offset, out_len, out_buf);
+        out_buf = NULL;
+    } else {
+        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
+        ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+    }
     if (ret < 0) {
         goto fail;
     }
@@ -4601,6 +4664,12 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
         return -EINVAL;
     }
 
+    if (!s->compressed_cache && s->compressed_cache_size) {
+        s->compressed_cache =
+            qcow2_compressed_cache_new(s->data_file, s->cluster_size,
+                                       s->compressed_cache_size);
+    }
+
     while (bytes && aio_task_pool_status(aio) == 0) {
         uint64_t chunk_size = MIN(bytes, s->cluster_size);
 
@@ -4656,7 +4725,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
     out_buf = qemu_blockalign(bs, s->cluster_size);
 
     BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
-    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
+    if (s->compressed_cache) {
+        ret = qcow2_compressed_cache_co_read(s->compressed_cache,
+                                             coffset, csize, buf);
+    } else {
+        ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
+    }
     if (ret < 0) {
         goto fail;
     }
@@ -4875,6 +4949,13 @@ static coroutine_fn int qcow2_co_flush_to_os(BlockDriverState *bs)
     BDRVQcow2State *s = bs->opaque;
     int ret;
 
+    if (s->compressed_cache) {
+        ret = qcow2_compressed_cache_flush(bs, s->compressed_cache);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     qemu_co_mutex_lock(&s->lock);
     ret = qcow2_write_caches(bs);
     qemu_co_mutex_unlock(&s->lock);
-- 
2.29.2


