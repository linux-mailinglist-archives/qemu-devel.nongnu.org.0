Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E54C97B2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:21:08 +0100 (CET)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP9vf-0005bA-Dn
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9pS-0000ak-Tj; Tue, 01 Mar 2022 16:14:43 -0500
Received: from [2a01:111:f400:7d00::71e] (port=41121
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9pR-0005Ia-AI; Tue, 01 Mar 2022 16:14:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6IxSIu4pO1vdGid3ViAlP/m2oWumVCIq35Fl0mg+HREoEOub8098Q03xWieOZ6CZs2IPJd239QVXtgSo5UWoCNG5wUo+DCUCNhCYv1KcYwbO9kbPdx/FRoM8n740LiifDmHbaeG3XYeQZfrVc8fIrJRij4npHMW8UkOM0tncag9qshTd6qGkpFNfCJyko8nUgKIJuZpnOHMt9moGSmeTZBaA9ZuvcROjnAtiGxlfNd7IqqFJ50tcmo5jvsQyaFSYzhB+hqLryxz5vL0jedIbeF8EiZsdLhsZVlDLrsu8V/KIWyAaoX9QkpZMifEoYbveTIIcjFaOY/CmHHVAbzCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0ce+Mr8EdmswMIcKAkOD4+B0Gvy2v6O8Sr1gyhC8PU=;
 b=cXHOlQsnPqzIlKR8y+8jHR0hVpDJ8QpaE17AdvfTxj5fUu/rqx8wP5IJKCcMhjbQlyRgKqVFezJKu0QwQR5JDqMGBkFeJCTK+O5PM1cAQDRU1SRWrH+sCkIa6i6k9Z2138nKxHd50tH3XZFl7y70NQBhQ7jJeP/vd05/DJZI/CqdcESxGhilEIm4R43ZTfSegiSLpg6SNmtZnhKIsmsbE7QC7P26/9fAxWopdBnydlO2fBK5LwCM6QJXL5yqvGjr1mnBlQd5jxGuWHPW8iSXsegcQDnq0PjaqIcJharS7bwUEFUcLdG7SXRYx5Jy2W2Ygd+X5sQXhRe/15AH3CxKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0ce+Mr8EdmswMIcKAkOD4+B0Gvy2v6O8Sr1gyhC8PU=;
 b=gZpuawWqK7ZHVxsogBlfvLxFsa5rAbfhXPmZKPttS477BnFA372KPF22CwrGgKwRoQWq4bZoLHePUBKnPLyBkQrR/ceBNN5pdD5irauClhPjMyjyeBAz87CHPJRcCxaoVKc5WP2KZmWXwjnCswwrO67fZYeWl5MGUwuAE+qTD8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 20:59:45 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e%8]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 20:59:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH 1/3] block/copy-before-write: refactor option parsing
Date: Tue,  1 Mar 2022 21:59:27 +0100
Message-Id: <20220301205929.2006041-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
References: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156945ee-f3fd-497b-b9f5-08d9fbc66a0f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3710:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3710385D47AE0F0BCD46ACB6C1029@VI1PR08MB3710.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1e/Fhq4PC9neBFpiHBljLoL6ZaibU//SaY7l1+IFxXUUoi/Fw+/Cn8jwt5qEWd2pbJ1RIl5BLXVLnRFAzuHvMbwVMJzWMwQAn4vrU4sO9AQKiTt+erOywXxSO9nghU1XrN95Pc7CFE0xlQqaQwcNBOXrvezg8EQgsoWaYPbpRha3x5z7jr/fNrW/WHVRcg3M1Sqm7ftgg9A5s1SmYgT1tLKemWOkOjtSbQYW1bh0YVnlwVG47PESJqHdjldC+1Kckm+K4o1OwxfoKFf68TBklBvB5zuwLrxlWeYwTU5N38m7VTKOLXYNvDWJ4giizLvABF8c0QIo+x4tuBZMzUIY2CPAEcKkiO039QaYnYp7DEjjA5OvhSW14rn9dNauW5ZaZOFUdUpy2LOPLqzLPrbI0LvMd/NT8l5ImIESapMaT7ehGFDnlWRzMaDaro9jGiaYH+rkPtWSglzGMttLlb2Qqdh3t7TvWj36aH06eBew8OrnV9l2DIgrqhRrJKFcfBOWsJ/ZHTvIdAqXTH5XShb52eTClMaZ1kgUEq6FkZGJzKawY/GD+LzElbwPTEXeKvqHe8s5wa/19RtQ72OyaX7ebLMsBoLvwBvn2jodRbJjVaGin1Mh4YTCy8MZywWTcL0gvMUcP332I0yjyOwTnNhXmg86nfCqtWHjB6TlOifnVFoNfX+h3i00AIbBTxpE4yOWZ5qyLCQ+Nq8t+4e6xPh4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(1076003)(186003)(2616005)(83380400001)(6512007)(5660300002)(8936002)(6486002)(508600001)(4326008)(2906002)(52116002)(6506007)(6666004)(66476007)(8676002)(66556008)(66946007)(316002)(6916009)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WBsDVWEVIHn7ez7dkmjf1mQi9V9ic+TcuyR8s2S4O8V44y/2zdz2xL5or37t?=
 =?us-ascii?Q?YtUG/nxBztyN/z8tEZIKPG3pDXaLEQDTwr2slNCD/vWtML03ICAOMn4anwzt?=
 =?us-ascii?Q?AMqhJ7Pfn++V9UO71OOAEzpVVNyFY/sgwsGgh/1vl3aYbBueomcAk0W026DA?=
 =?us-ascii?Q?8YVrh2LcHLV9VtoeNEzsEFfxNuMjJpQNwvMSAXmzulOTyxM0S1nhy4/RJSF8?=
 =?us-ascii?Q?dNo8V9FXYlq3nW7dR7r0Lv29yucVuOFVIMrQ1blG4hHZ2LOodCHyviK1R8+l?=
 =?us-ascii?Q?qE2CMGc7KO3xuhswtSI5jFtSW8b8Fos/liv2ApQrOAHtyo/Xwgt8q1KD/Gf1?=
 =?us-ascii?Q?RyVJPe5i697G0yHLYJZyBFSTiK0FsGJNPpFmb5pu2BXaqAAvuY+w7oRwJetR?=
 =?us-ascii?Q?NuTD3Ph/PHTs7vjIMSVKJ9mi+L5/vO31Ijbu8MD8BH6FOxtdchzP2Lt3eZY1?=
 =?us-ascii?Q?AQyK/3z6u76ehULRAdPHCtNc0VDMBY99U8FR+0/LIN0H3W2YKcnj654uo36R?=
 =?us-ascii?Q?GyowH+Ehbgf+JMkiczDSxeiktnDblyWZfiGtLKKnat3ppF4zOftRrZTxprFp?=
 =?us-ascii?Q?Gt/Wcrqh2aqv9LO1yKWhKyxOtR6msFTAERy4q+IJxROtpgIg962CYskCYgne?=
 =?us-ascii?Q?UJXPbGo8RPi2KEdkmoVCIuFYL1+grPtElSFS4us/1RhIjqOIiYFm5OQmaaei?=
 =?us-ascii?Q?80hE6shD4aJYlULGhTgqpTNakdqw9DNRutpCu1HpJpeN9jMGRpBloH7cdSRu?=
 =?us-ascii?Q?eZKq64LghCCF2tqGFwxzKZ5UZZjRiCTOzIruK8KQjRwUi4wRLsi8ePzxmRUr?=
 =?us-ascii?Q?U4dk3vIhkl4Bz3ir+HqSBqFf1qfxwg0GxszV2p31j9otc9kq0auIauUz+Qa+?=
 =?us-ascii?Q?gnDAt0x1wWhE4lB4rI1SC49qCfZG78/mMpniEnZp/fTfkqgpUVYsBbcAmMIV?=
 =?us-ascii?Q?CaaLsYRU6Lu55LAnIcbGPlotqKDxg5d/My6b8RG3cdDSp95Usw2M4HjshuDf?=
 =?us-ascii?Q?MV+xqXHjOZlK3WkXaMnr56zv2eZP3PszK0fLrYtG4fA/YumrmYqGwiPvJ8yW?=
 =?us-ascii?Q?Bj2ISj/tsGpAyVfO2ZCLm9X0+WAB7QkPHxpQYBJyWGw+3OX9g+Y1GOiSrr6Z?=
 =?us-ascii?Q?Oyszx0gZEeE5dXaAiGWUKKfV2HCA+AF5Tfn25Szei6VhO/C88LjNjHFeSIor?=
 =?us-ascii?Q?bHFXFvHJ5jJZeR4ecwKZTReufiyyWZrHEndqGyAwopqfhrRtyFCHryTxPiFZ?=
 =?us-ascii?Q?aOlDIg5gK7t1A+aO7M1BIgvoMeky/7pFW27yx49Sbc7OJczOw4uTEfnJ+E5K?=
 =?us-ascii?Q?Z37laUtbJQGgrAr1B5EFdk4jNp6LtkbNoco25zNEMiv1coT2NKsb5Ot6gaRr?=
 =?us-ascii?Q?phyfpIRS4bSmqRZOTpo22kRBJQyUQ2LWOAxGZMks2UdTig3DDMgdHLp+ZTay?=
 =?us-ascii?Q?TDAgy8DQ/k1UhfxGwajGIUiFqato+jNrDA30BmOAyO/rf2IPBsIk4QQ025fP?=
 =?us-ascii?Q?e66PpLrLjmqz1GDBrrydqE+LcxjjtZ1ZatjT6O6W9XAFUna4T0eLs8WGTegP?=
 =?us-ascii?Q?ZIZ7iZVc9wGZG3/73qZn06VbclaZUTcBHFq7Gmz5E2qiVmQt4EW76tU0al2Z?=
 =?us-ascii?Q?HHXoqvNfiD5+kTvhbWEVslyafKRR8+RB2+l3GdnvEawYac8K2dBMzyBW5ZeX?=
 =?us-ascii?Q?XFZxFL1KXDNnLuuzdZQK3y0ps38=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156945ee-f3fd-497b-b9f5-08d9fbc66a0f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 20:59:45.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a/AiziPSzC53gvcVIG15mbOXKSsFpIg4GY7FL15fG7lA+OSi6RwkjC+6odrtv+pweuYKCj7NR8RxtwSnEgyeD/NdIEKYJFSUVgJO252vlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We are going to add one more option of enum type. Let's refactor option
parsing so that we can simply work with BlockdevOptionsCbw object.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 66 ++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0b6d26605c..56aa7577c3 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/qmp/qjson.h"
 
 #include "sysemu/block-backend.h"
 #include "qemu/cutils.h"
@@ -328,46 +329,49 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
-                                    Error **errp)
+static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
 {
-    QDict *bitmap_qdict = NULL;
-    BlockDirtyBitmap *bmp_param = NULL;
+    QDict *cbw_qdict = NULL;
+    BlockdevOptionsCbw *opts = NULL;
     Visitor *v = NULL;
-    bool ret = false;
 
-    *bitmap = NULL;
+    cbw_qdict = qdict_clone_shallow(options);
 
-    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
-    if (!qdict_size(bitmap_qdict)) {
-        ret = true;
-        goto out;
-    }
+    /*
+     * Delete BlockdevOptions base fields, that are not part of
+     * BlockdevOptionsCbw.
+     */
+    qdict_del(cbw_qdict, "driver");
+    qdict_del(cbw_qdict, "node-name");
+    qdict_del(cbw_qdict, "discard");
+    qdict_del(cbw_qdict, "cache");
+    qdict_extract_subqdict(cbw_qdict, NULL, "cache.");
+    qdict_del(cbw_qdict, "read-only");
+    qdict_del(cbw_qdict, "auto-read-only");
+    qdict_del(cbw_qdict, "force-share");
+    qdict_del(cbw_qdict, "detect-zeroes");
 
-    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    v = qobject_input_visitor_new_flat_confused(cbw_qdict, errp);
     if (!v) {
         goto out;
     }
 
-    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
-    if (!bmp_param) {
+    visit_type_BlockdevOptionsCbw(v, NULL, &opts, errp);
+    if (!opts) {
         goto out;
     }
 
-    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
-                                        errp);
-    if (!*bitmap) {
-        goto out;
-    }
-
-    ret = true;
+    /*
+     * Delete options which we are going to parse through BlockdevOptionsCbw
+     * object for original options.
+     */
+    qdict_extract_subqdict(options, NULL, "bitmap");
 
 out:
-    qapi_free_BlockDirtyBitmap(bmp_param);
     visit_free(v);
-    qobject_unref(bitmap_qdict);
+    qobject_unref(cbw_qdict);
 
-    return ret;
+    return opts;
 }
 
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
@@ -376,6 +380,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
     int64_t cluster_size;
+    g_autoptr(BlockdevOptionsCbw) opts = NULL;
+
+    opts = cbw_parse_options(options, errp);
+    if (!opts) {
+        return -EINVAL;
+    }
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -390,8 +400,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
-        return -EINVAL;
+    if (opts->has_bitmap) {
+        bitmap = block_dirty_bitmap_lookup(opts->bitmap->node,
+                                           opts->bitmap->name, NULL, errp);
+        if (!bitmap) {
+            return -EINVAL;
+        }
     }
 
     bs->total_sectors = bs->file->bs->total_sectors;
-- 
2.31.1


