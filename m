Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63224AC66A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:52:47 +0100 (CET)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Fv-0006oX-24
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:52:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71a-0001w6-Fc; Mon, 07 Feb 2022 11:38:01 -0500
Received: from mail-am6eur05on2101.outbound.protection.outlook.com
 ([40.107.22.101]:1216 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71X-0005Gz-MY; Mon, 07 Feb 2022 11:37:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOP9ZDK98txgaxSWM+CVEoI0KFCWzWiGF72zuk6dXE22zd4QX9/a1BeMQcLNO0dEfni3StqB8iPch8W2RSZykyBkMnTEUc0Fv6N73WD8zzlvWA4kDpN8W9JHyf9EZC3VSqSRT97qqxsN906AUV0lqhOKr+mrWfUks0pvt16FbTs03MNWyJBOjLsuGMKccN1wuoAog5eD9y/TouQOD2rihha5f9xyEO2WW6CpYNIEBIwx4Q54/oIwf3xKyKwF4TlzAZp3V7i20tRyIJb4Y6pPP+ygJrH3GtzEBmslzm6tsHl8xgD/cFI6wtZPI51fyvOqhEM/KLhBw6SXC53R39JvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqxVebqERuPjgngu+3mg08lAPznmZ3tXdJj5+2tXJqM=;
 b=VXb4iqfhsxToEaL16GaXzEztuEAvxJr7QRziLNk4ZlyXzVgo98uy0aRjnSCD0SEkJPnZ2dsBMrPtkbdBHt3wXVspYQau49TPHEUBJ5xcB34SsLudX91RNyV2DWXYkeIEkFMtQpbBshwH/xQXE4d1QM4rFuP+bXUJjh3eoIT2M+BLWR4ssnykaF+f/yS/ixoBfL3//iRoXApPpRCMX5FtHiqgKJQ4+xIKfRTBy/uRR7ss1L52n3Po+qGJj04jZfP2pnT8TzESM43dtPL1agWKzMu6YT8lym5jXERRm0Qqq7I3U85jMofY3hNLkEFLvTYL/rsUfiKi/a6X/5AyPt3DlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqxVebqERuPjgngu+3mg08lAPznmZ3tXdJj5+2tXJqM=;
 b=g7FtQGpyT9ttZW59MskNNp2judKFB2+jr89fbjhnbV2U/23B+om2VMumaoBmrT0ykYQaiLT1MkC4tO+IVlBOUllS1wHgn9FGne+6FrMgoQBxXc1r7Q5o2vBnE5C7RcZ3rhyOUbz/0xMXxVE+xFGfwcfjTt73iN81IWh6oSuKR/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 07/14] block: implemet bdrv_try_unref()
Date: Mon,  7 Feb 2022 17:37:21 +0100
Message-Id: <20220207163728.30362-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2d607b-1e7c-497e-0f86-08d9ea5828b4
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288F3178E7DE076EBBF535EC12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXEtA5qzRVORQj1iCl/DFeuDIl40ABZ+6RBO825kDh+phNahzJ7xkYUsCTi7aDc773+OyEtoBuu9lISkXp4uaDcomOUsTJ25m8dPCnT+1YvZ/gEEv9aLEPxVEtvD71MFsMbnR3MH2pQhTC8ECfrKtjQs6JEHDrThtBT5Ylvz06ErMe9LfHbXK0OXxWPWEEC0Fqs3Tbk571tD4HgWT/xRpl0qv8mmGFi+Lj1m5NDIgIzNnZlrdMOIjHStz6vH8ch7yBC6TTKy+yLJDJXM21zwB4F3TVNl1SdbfO9YXGnrCSZdn+dz/F2JIrA3IbpR4CwYaI8hmK6V7BIyYlFWdyNDBcolLuPZ715kUxQOHT7p9mXtYX0b7qWySEdBz/cOPqsSsAhEhgTud4FmL4WZAnTaXYM5+l3tuSmOWVRUXYT3gJ/fR8S/iFaPVBBb0tLJBqFJXz5E3Ex2VGUsWrN79FwLMo0Q2GRgqtUyJyctyHQ4FvtRNFzny+2R4SWWK0PztqHLq3YZLJREuYNy1R2a1K1pixbVlZX7T+xQjgOzQhrwIPn/7RRN2C4Rprew1fxj91X3oHvvpmIMy90EI/io21zP7GjnuFAcIzxzjRHJVz9Ool4bmXRHd3JYorjlI7lr+fyVqUDLVdn6IQ/U+WcnC4+Er1izpuVdLyj81jiqcj9bIrH3sUJ4JeDgpY3pPZu2eFOmsK+ya1AOMBDxaf+qoNWuBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXVSckxz1orleZqwwDwFXIh3y9ot3xla/vthFMrj3XyMcl9ZDsPuPRY5/lOJ?=
 =?us-ascii?Q?rT45o3m/D2YuZxsxsbvQT/2MCg8ovm+qdawBt+Y0piJxiZ9DNH36xZ3Kz3Tb?=
 =?us-ascii?Q?LWVan5uFuY2SO8Y+SEiOOjeQf1dm0MbYPmhzHBJEMMlvKeoViwF73t/QmAtH?=
 =?us-ascii?Q?2oemHN+7luSCr0+WP0aZryLH2M8viuONZt4lQCraRSYRKhKGBGvvLsQU8ops?=
 =?us-ascii?Q?9qsm8zXhY5xY2oR424BallIIU0JHyBrO33ZlkqI5eLUOzC/JvcPSREWNhYb2?=
 =?us-ascii?Q?66L43sLpPYOLQ/fFNRmm1JF2e95E4u5e2qPWsdNHYM+PW3way2K/VmMVwCeh?=
 =?us-ascii?Q?AzlEvmH4P4so3FLG3cFCHd+qrj1Ca+GSc1cZRMZW3G9amtFT3TZ8ZHp1dnNf?=
 =?us-ascii?Q?tuv9Ti1MQbL8LlKxwHs9VxItD5n/w14adwAtD+Qv9vN27A96YjYdpzMXgAHo?=
 =?us-ascii?Q?8lb5Py1OMKSazS+xnb0kkT17mg83TAE4tbqbITrQdz7rOgWV+9VxmLJ6/IG0?=
 =?us-ascii?Q?RrvWscshYOfBz5khXLyJpgTSEmnQd4/5p+KlpcUOSQtGe5p0E0qFuedDlkEi?=
 =?us-ascii?Q?fD49GK9/8N3TCEseOOIadbizBNnFjQxGMFp9b8mMBDS+XERrGeMdR3+vBybL?=
 =?us-ascii?Q?xDw2DYxztTPKznfzBrQZO/jRWDD893estMWO0J+5RCMcSoSgL0gVouxcAjfG?=
 =?us-ascii?Q?W8C2ryulYsJDuSeraEW4x1GT8pP6w7q4BVpU764n5GGHBQu1uQxW1vX5lqtj?=
 =?us-ascii?Q?5lh1jFctDHQIXcGhwphW87Vuv48cHnr0kwyeeHPwQNFctEJmqhJDfXew5gIF?=
 =?us-ascii?Q?bFUTBjy39jd+XQNi1NKBCDxT1aZEcmlFB9PEc+DEpQHJjU+qKTEt9dKCib59?=
 =?us-ascii?Q?5wpw3/4wKbEh1+o+jVuUcmYK8PNdf/jG/MOmWKo/YPKGepvDsAdYmPzqP2UQ?=
 =?us-ascii?Q?VNB/uKRYr/N1xyfZn3bp8S0hsHLErRojZXClVmgHLLZmlGuJWJ8ubmtTW5fq?=
 =?us-ascii?Q?ZOZT0hAExq8A/fvrQgVPKUCgdS/4+RCED5Vj1zVsA88XmR2kl5c5Hx28IzJh?=
 =?us-ascii?Q?eVMl/e5HcZ5U6fwy1JEYLwTYsB/jh0UF5sXUokSF7BPwKGhXdNuXtAVLsusg?=
 =?us-ascii?Q?ptW59wDnIxMT90qsS1D2SZo5lWTZ1o8x6SA1jlaecUTnO86ixRCyYrLPSAm2?=
 =?us-ascii?Q?7TYaFuzfu0tgdnJNGJ9DlCWXF2TBb3aVjD6km+/KtxoZTVKF7hS+COI/jvNa?=
 =?us-ascii?Q?vfE1Ypn7ZPtsDTDsl3cn0ebK6jtQ1bLBHmwvnrQvv+0bZqiccNVgDUU7NiRU?=
 =?us-ascii?Q?G1SqONbTayaRNv3Lpt9aD3ht9tZAwzYWeaLbqQ67loh4rK96zRAF4A5qsp8+?=
 =?us-ascii?Q?0oIUpC35692STRHmhI7LwGK5Ku2xPHOPO5/ORX/+H2ujpTxUboOuYb41a7z8?=
 =?us-ascii?Q?ctvhfzkQZ17XQH8BZFZ2XemV38hokiNuxtodW2/AHM9W0/MxteQS6k6LqDwE?=
 =?us-ascii?Q?E9taFQlMdZiJd3hQMMBA2xLci1heHR14zDjLW37QH5Yy61/iOHBij27b3o91?=
 =?us-ascii?Q?OwOTw2r5M9y/v/wzU5YpaHZMeTPJJylnNKjeZbnAnuL8bWBdiNYBP0t7fFWu?=
 =?us-ascii?Q?T+L6pA0/wIwnxFAeZciS/9fIcx9Fssu0V3HltEFFNjwEj3YmHEKktUg6s8/Y?=
 =?us-ascii?Q?oHS3EA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2d607b-1e7c-497e-0f86-08d9ea5828b4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:41.1952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp9qvz7m+KtQsoO/g5gNfCmi8AxErKAtXVGIp8Kanhr9saj0NGvuwULljD+da11XZx4n/12MsK7S3EIsIAZ6TZDbQdGJBD7S769Jf5Jy5Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Received-SPF: pass client-ip=40.107.22.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Make a version of bdrv_unref() that honestly report any failure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |   1 +
 include/block/block_int.h |   2 +
 block.c                   | 247 +++++++++++++++++++++++++++++++-------
 3 files changed, 208 insertions(+), 42 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 768273b2db..42d78a7a31 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -672,6 +672,7 @@ void bdrv_disable_copy_on_read(BlockDriverState *bs);
 void bdrv_ref(BlockDriverState *bs);
 void bdrv_unref(BlockDriverState *bs);
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
+int bdrv_try_unref(BlockDriverState *bs, Error **errp);
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
                              const char *child_name,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 767825aec4..3126868633 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -188,6 +188,8 @@ struct BlockDriver {
     int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
+    int (*bdrv_close_safe)(BlockDriverState *bs, Transaction *tran,
+                           Error **errp);
 
 
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
diff --git a/block.c b/block.c
index 231d1fc3ea..187732c6f8 100644
--- a/block.c
+++ b/block.c
@@ -101,6 +101,9 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
 static bool bdrv_backing_overridden(BlockDriverState *bs);
 
+static int bdrv_unref_safe(BlockDriverState *bs, Transaction *tran,
+                           Error **errp);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -3084,30 +3087,60 @@ out:
     return ret < 0 ? NULL : child;
 }
 
-/* Callers must ensure that child->frozen is false. */
-void bdrv_root_unref_child(BdrvChild *child)
+/*
+ * When @tran is NULL, function never fail and returns 0. Still, some states
+ * may not be saved correctly.
+ *
+ * When @tran is not NULL, first failure is returned and the action may be
+ * rolled back.
+ */
+static int bdrv_root_unref_child_safe(BdrvChild *child, Transaction *tran,
+                                      Error **errp)
 {
+    int ret;
     BlockDriverState *child_bs = child->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
+    if (tran) {
+        bdrv_remove_child(child, tran);
+    } else {
+        bdrv_replace_child_noperm(child, NULL);
+        bdrv_child_free(child);
+    }
 
     if (child_bs) {
         /*
          * Update permissions for old node. We're just taking a parent away, so
          * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
+         * fatal in this case, ignore them when tran is NULL.
          */
-        bdrv_refresh_perms(child_bs, NULL, NULL);
+        ret = bdrv_refresh_perms(child_bs, tran, tran ? errp : NULL);
+        if (tran && ret < 0) {
+            return ret;
+        }
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext
          */
-        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+        if (tran) {
+            ret = bdrv_try_set_aio_context_tran(child_bs,
+                                                qemu_get_aio_context(),
+                                                tran, errp);
+            if (ret < 0) {
+                return ret;
+            }
+        } else {
+            bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+        }
     }
 
-    bdrv_unref(child_bs);
+    return bdrv_unref_safe(child_bs, tran, errp);
+}
+
+/* Callers must ensure that child->frozen is false. */
+void bdrv_root_unref_child(BdrvChild *child)
+{
+    bdrv_root_unref_child_safe(child, NULL, &error_abort);
 }
 
 typedef struct BdrvSetInheritsFrom {
@@ -3176,15 +3209,28 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
     }
 }
 
+/*
+ * When @tran is NULL, function never fail and returns 0. Still, some states
+ * may not be saved correctly.
+ *
+ * When @tran is not NULL, first failure is returned and the action may be
+ * rolled back.
+ */
+static int bdrv_unref_child_safe(BlockDriverState *parent, BdrvChild *child,
+                                 Transaction *tran, Error **errp)
+{
+    if (child == NULL) {
+        return 0;
+    }
+
+    bdrv_unset_inherits_from(parent, child, tran);
+    return bdrv_root_unref_child_safe(child, tran, errp);
+}
+
 /* Callers must ensure that child->frozen is false. */
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
-    if (child == NULL) {
-        return;
-    }
-
-    bdrv_unset_inherits_from(parent, child, NULL);
-    bdrv_root_unref_child(child);
+    bdrv_unref_child_safe(parent, child, NULL, &error_abort);
 }
 
 
@@ -4784,14 +4830,17 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     }
 }
 
+static void bdrv_delete_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
 
-static void bdrv_delete(BlockDriverState *bs)
+    bdrv_drained_end(bs);
+}
+
+static void bdrv_delete_commit(void *opaque)
 {
     BdrvAioNotifier *ban, *ban_next;
-    BdrvChild *child, *next;
-
-    assert(!bs->refcnt);
-    assert(bdrv_op_blocker_is_empty(bs));
+    BlockDriverState *bs = opaque;
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -4799,22 +4848,6 @@ static void bdrv_delete(BlockDriverState *bs)
     }
     QTAILQ_REMOVE(&all_bdrv_states, bs, bs_list);
 
-    bdrv_drained_begin(bs); /* complete I/O */
-    bdrv_flush(bs);
-    bdrv_drain(bs); /* in case flush left pending I/O */
-
-    if (bs->drv) {
-        if (bs->drv->bdrv_close) {
-            /* Must unfreeze all children, so bdrv_unref_child() works */
-            bs->drv->bdrv_close(bs);
-        }
-        bs->drv = NULL;
-    }
-
-    QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
-        bdrv_unref_child(bs, child);
-    }
-
     bdrv_drained_end(bs);
 
     /*
@@ -4843,6 +4876,88 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
+static TransactionActionDrv bdrv_delete_drv = {
+    .commit = bdrv_delete_commit,
+    .abort = bdrv_delete_abort,
+};
+
+/*
+ * When @tran is NULL, function never fail and returns 0. Still, some states
+ * may not be saved correctly.
+ *
+ * When @tran is not NULL, first failure is returned and the action may be
+ * rolled back.
+ */
+static int bdrv_delete(BlockDriverState *bs, Transaction *tran, Error **errp)
+{
+    int ret;
+    BdrvChild *child, *next;
+
+    assert(!bs->refcnt);
+    assert(bdrv_op_blocker_is_empty(bs));
+
+    assert(!(bs->drv && bs->drv->bdrv_close_safe && bs->drv->bdrv_close));
+
+    if (tran && bs->drv && bs->drv->bdrv_close) {
+        /* .bdrv_close() is unsafe handler */
+        error_setg(errp, "Node '%s'(%s) doesn't support safe removing",
+                   bdrv_get_node_name(bs), bdrv_get_format_name(bs));
+        return -EINVAL;
+    }
+
+    if (tran && !bs->drv) {
+        /* Node without driver is a sign of something wrong */
+        error_setg(errp, "Node '%s' is broken", bdrv_get_node_name(bs));
+        return -EINVAL;
+    }
+
+    /* complete I/O */
+    bdrv_drained_begin(bs);
+    if (tran) {
+        /* Add it now, as we want bdrv_drained_end() on abort */
+        tran_add(tran, &bdrv_delete_drv, bs);
+    }
+
+    ret = bdrv_flush(bs);
+    if (ret < 0 && tran) {
+        error_setg(errp, "Failed to flush node '%s'", bdrv_get_node_name(bs));
+        return ret;
+    }
+
+    bdrv_drain(bs); /* in case flush left pending I/O */
+
+    /*
+     * .bdrv_close[_safe] Must unfreeze all children, so bdrv_unref_child()
+     * works.
+     */
+    if (bs->drv) {
+        if (bs->drv->bdrv_close) {
+            assert(!tran);
+            bs->drv->bdrv_close(bs);
+        } else if (bs->drv->bdrv_close_safe) {
+            ret = bs->drv->bdrv_close_safe(bs, tran, errp);
+            if (ret < 0) {
+                assert(tran);
+                return ret;
+            }
+        }
+    }
+
+    QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
+        ret = bdrv_unref_child_safe(bs, child, tran, errp);
+        if (ret < 0) {
+            assert(tran);
+            return ret;
+        }
+    }
+
+    if (!tran) {
+        bdrv_delete_commit(bs);
+    }
+
+    return 0;
+}
+
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
@@ -6571,18 +6686,66 @@ void bdrv_ref(BlockDriverState *bs)
     bs->refcnt++;
 }
 
+static void bdrv_unref_safe_abort(void *opaque)
+{
+    bdrv_ref(opaque);
+}
+
+static TransactionActionDrv bdrv_unref_safe_drv = {
+    .abort = bdrv_unref_safe_abort,
+};
+
+/*
+ * When @tran is NULL, function never fail and returns 0. Still, some states
+ * may not be saved correctly.
+ *
+ * When @tran is not NULL, first failure is returned and the action may be
+ * rolled back.
+ */
+static int bdrv_unref_safe(BlockDriverState *bs, Transaction *tran,
+                           Error **errp)
+{
+    if (!bs) {
+        return 0;
+    }
+
+    assert(bs->refcnt > 0);
+
+    if (tran) {
+        tran_add(tran, &bdrv_unref_safe_drv, bs);
+    }
+
+    if (--bs->refcnt == 0) {
+        return bdrv_delete(bs, tran, errp);
+    }
+
+    return 0;
+}
+
 /* Release a previously grabbed reference to bs.
  * If after releasing, reference count is zero, the BlockDriverState is
  * deleted. */
 void bdrv_unref(BlockDriverState *bs)
 {
-    if (!bs) {
-        return;
-    }
-    assert(bs->refcnt > 0);
-    if (--bs->refcnt == 0) {
-        bdrv_delete(bs);
-    }
+    bdrv_unref_safe(bs, NULL, &error_abort);
+}
+
+/*
+ * Like bdrv_unref(), but don't ignore errors:
+ * On success, if node (nodes) were removed, it's guaranteed that all states
+ * are stored correctly (for example, metadata caches, persistent dirty
+ * bitmaps).
+ * On failure every change is rolled back, node is not unref'ed.
+ */
+int bdrv_try_unref(BlockDriverState *bs, Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_unref_safe(bs, tran, errp);
+    tran_finalize(tran, ret);
+
+    return ret;
 }
 
 struct BdrvOpBlocker {
-- 
2.31.1


