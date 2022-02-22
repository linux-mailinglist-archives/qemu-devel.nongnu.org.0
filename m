Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46B4BFEF0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:37:17 +0100 (CET)
Received: from localhost ([::1]:46286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYA9-0001OE-25
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY74-0007CZ-Sf; Tue, 22 Feb 2022 11:34:06 -0500
Received: from [2a01:111:f400:7e1b::71a] (port=19233
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY6u-0008Ol-RW; Tue, 22 Feb 2022 11:34:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtY8neayWKW3thnjsUBIIAjNhHcozbbCWVNda/+evHcFJQririgS6AqSpqs/uaTLEjmM1GAKPR8N4YThxxN4pJN+DoGKIkb5Py7MHo6wpUObJbb7cROUVIs0a4IbV3wHbO1SH+3PVFYbA+UtlbbGcvzAqzIYMkYGjCpu+5PiSOE2W2ePFkknIuAeFjyP74tv7cX5NudUP0Eh6ULDvZjQrgPCn19j4bP2KINOq6CqenjHlYgPLfw6uzJT3G8RDqNij8A6Xl/RCuO9daToLjPdnOGy50XyjULhvB82adzbNB3/SnI16Q2DYOfIKqaiXSyEDdlG11naMC1tjalEx36eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJuYOFqs1zlwp09YsceloG+aPalq+WwZl+C3t4wKTx0=;
 b=lqFkyBi2JAhI/mjIvxxYpdYnnBsXjMLtMegt0pbeX0QTmQMw8iKUXT+IjuYdH09+ODPWWhuPFUm2obMw6r6BqKy/EYvKkS8nlqf1flyCSwoRr60N5tEsmboLLOoiJRVZ4Q7gOF4DC/VO8AQvbcTauqif7bJtXTTUaXHu5EkBbNk+sPFcW0D46S37MQT3+HGz7z0x2CnSppKe1klux1XjT7zRjbCkBVp1RuDglf9/fbtLfljVKei5gjblPpsCdPk0LJnhL4q9++MhrTqrpSGscxUxhmJgvHV/xxY9lyG0IxbFIpW5qlA9Az04xgCnDF3p5OB8kTRQ4Fc8t5ECBW1M+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJuYOFqs1zlwp09YsceloG+aPalq+WwZl+C3t4wKTx0=;
 b=q9SnHfdfDmd+s85JWLQsxmQr/4/AZrXxdlJd7FR/jt0iVSmSiUcryu8c/fLwzt8f3tND1u6+LLq657TEMOww92zpRknSGhKIyPVctqyDaqLzq0HPlnoFoMPuHZ6mQemWv+vO4KORJThbT9jlq2pLummtYy+v4uzwxyoWwc4kgoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB1669.eurprd08.prod.outlook.com (2603:10a6:4:30::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 16:18:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:18:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 3/4] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Date: Tue, 22 Feb 2022 17:18:32 +0100
Message-Id: <20220222161833.1453641-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
References: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0401CA0023.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::33) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 460826d3-aa5b-4fce-ec54-08d9f61f03b8
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1669:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1669351A84D0F163AC2B5C88C13B9@DB6PR0801MB1669.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcbmqwNcbJHi73cSh87xyR6osqoe/e7OYUNRIbCrfvXEJFEJrg4hbZBB+mSRo7h+Xth+6rfLf9wsObKFnFARMtRUVZ8GVHwI14naDJmvB1c70cON1O3lsoGIqXk43iyhILg4GDvN6fhJ/oNmVtsjp8tdZDAbeXm4tR39S6sN+LpBllY0+Hv1N5dYEOSb+OQUUNfLrol33wrNYwZxOjAm4ehUWKtkGGWJCvQ7mOOCGZobmkyiXxHV2hLLuryOfc11odMS/iGSsMSLKqo+8gFXWV7ksSgVHNB0NNzAQ64UnLcaztc64sjtfl4lvSU+4ufGGH3OuG6deMoKHSC/sh8pQ/5MIIs+ScvL9W6VGSOqBn4kxYmJ7qY3Yg75QAQcBLQwZ0vWxNrwHP9heKy9EG2bCnCYXqnGpacbIJSV7O1XOg5mGcMKQcnWCYrAlwIFi48C6SL6Qhf8wjz8buCxxz3H5jRRtl5HyOCfSSXO5WDCXwYyutsb6EzsKeSlFamx4i5CAtbZQWaXvP27y/0SX2x+SbGjoEn+QyRo4BQrnLIobH05CVwGpAQQCjZ39JkDrehLXlJeDol+SLwyeswSNmeSRzD9FjM1hXqNJjNOptmoeivdyBxZKiB4gDs0S8Fi9njJPtTEWkf+Jron1YtfvyJ3NDnbtpwrgvQEy6SS1iZoIA2PiYmHvrhfzFcSloBsuLlrxCucybZ0vnvwUWI0AnjS2v/b6hqt9mopMn0yTnmnbEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(86362001)(6666004)(8936002)(52116002)(66946007)(6512007)(66476007)(66556008)(8676002)(38100700002)(2906002)(4326008)(38350700002)(107886003)(36756003)(2616005)(26005)(6486002)(186003)(508600001)(83380400001)(1076003)(6916009)(5660300002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wmAYcquBhaWcLmWQJ5TuXc695oAAqEerJovQ+D9yG0J+iVxviOc+TFHAXeL?=
 =?us-ascii?Q?c2N2UcUE60s1r2iwiSlJnPTTKoOhICyTDOiZd+598QxQIgnPfzEGYj8Qk4so?=
 =?us-ascii?Q?rd0RtnbFdBtxSTSSIJQO5ednJxfRl9hshURiq7YMHhdkM5JoCWe//3Ibw3uY?=
 =?us-ascii?Q?JF0yxVLi1LiEh0azROFFNrLmUQAgiuNPva3Mww58nJ5SLdrFwC6L/CQ2V/YL?=
 =?us-ascii?Q?6ORy09q0PphmXtacWaHr9G6Aozf0XSBAeY7S0U0dCyk4Iz1ODbhYme/gc5J6?=
 =?us-ascii?Q?nrr+IFbMdGpQjDxklLvFHuY8YfixBbWaOlfxkUQ9ztw4DAurA0N45z1ezvqR?=
 =?us-ascii?Q?GEET/Sak520mk5KpvdPYsA/AD3KYapezIhs0ZyEozJpNgHk4mcUMTuGk3Pbl?=
 =?us-ascii?Q?3D5mijypCqsYud6n5/WSBbAhxY/EbL2a7aPFTaF1/KSVrU0MVWMoSeTS3/SL?=
 =?us-ascii?Q?RFhpzj3a1aHHbGbK8PaUJEJstnvii2HwGch+Ekg55A48Gax8yesm0dZeTKxD?=
 =?us-ascii?Q?vTRwQiczepIIy6eSOq/7sItfTC5tbM8Aa3qjOvcs6OkAYAS+teR5PxRV5505?=
 =?us-ascii?Q?ZFKGjzqQpip682shRNzBwMpRAT4OCWIXpFK13sOf6CotlMcEInv7Zq7fRZj0?=
 =?us-ascii?Q?Iu0azFAABZiQ7KfY/fYbWicNzb37YiyAwZdCB2L6r/pdQJQWQaSE1i3O8CiQ?=
 =?us-ascii?Q?oxTn1Mmds9TliTwpXPIKZzLtcYJa6DvKpAng1OnT0tb1TlnfC9f1mz+1yEsB?=
 =?us-ascii?Q?cdJ8fiO8V4afH36N7QlEjFP7VBX4Cdei8rTse73MnY13Y4bOSeBZotGLrarR?=
 =?us-ascii?Q?UMyc4ptem2dJqz3pmbXIEHjXBrJAEwprQDpZv5puu3aA8jQ7lCBHxi+E0y6e?=
 =?us-ascii?Q?JskJITNgiw+AKKpO6aoBuga+vEl4YgsObSbbkJBbvXLurW7+Syrph15cGR2M?=
 =?us-ascii?Q?0ThjLKkRjQkDULk8Y6FCLZcLNT0hCdKC9OrvGqulUWpirylRCOGmfILHp2iO?=
 =?us-ascii?Q?dwb6kmUQLRdkhVselNEUzwarf4Cl/pz0/0SwnXN+QmHKdrpoxZkpf5Cmecu/?=
 =?us-ascii?Q?ZFxJNsZ66QfYlHtLhCCsya9OvzQoqA90m9iUIkVNXJw+yfGEkgGm1j32L//t?=
 =?us-ascii?Q?3wuAktSY2RQhfFYCUqFvfCtfry32872GD1k3xTDY4tXZAJo8q88CO3/r5hoN?=
 =?us-ascii?Q?aGOvmsY6DrD08L6j7ZlZzdAC8w8/CckjOV080Cnbo/N3Pp68f8RLIi/9g/Oc?=
 =?us-ascii?Q?YIFjmkSXxxX3I/lMvK9zPE1xf4gYZnif0Juz1SX1h4NCXkZi8QyLvCHR4KSF?=
 =?us-ascii?Q?29r2roTyBE8xTk/OEVje53tMsN6SJtKxEbRCL8gdPgGLbiu1FNwUg5CUHqa6?=
 =?us-ascii?Q?1ZeaUEwO7iOiCnmEWBL5LN6CrzNw0u7NeAij9Y1FwrZXPYEnEna6/h+wlJNS?=
 =?us-ascii?Q?XczfG0bcYnOKXMYz0jSCnev3Ci4n4x8zf7viKyZ4AXXqOA1RTx+A2nE+DQP/?=
 =?us-ascii?Q?SkAye2bDlSTXEtpDIFJ8UhVZOuTWbYz6BguZ1UhJhAF205KHCsuZNXUfLmIH?=
 =?us-ascii?Q?AHSNpQ8PDMViOWx7SOT01d1absS+BoK6hgBuGOKfk8+vd4N68ltLrVsV20uV?=
 =?us-ascii?Q?oNuq2XvLKDZwNnhKpjg88cUq5DdG6U0d47lOH/jDYF3BuxbkOem0YO7oDtBx?=
 =?us-ascii?Q?D/mM8Cj3l2SMsrio80Ku003WCJY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460826d3-aa5b-4fce-ec54-08d9f61f03b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:18:51.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxxsfr/0ukvcQA7gUyPfIKxu8vzSJ6h2mZLcxPasUlbdhnxxlDU0nurU7rnxFYVgW+3vKOaIXKAHWYB9KPAnwVmBredWKjhr9wb9ukqcGA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1669
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Still to keep old semantics, that on failure target is unchanged and
user don't need to restore, we need a local_backup variable and do
restore ourselves on failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/monitor/bitmap-qmp-cmds.c | 39 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index a94aaa9fb3..175d2ca449 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -257,20 +257,15 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
-    BdrvDirtyBitmap *dst, *src, *anon;
+    BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapMergeSourceList *lst;
+    HBitmap *local_backup = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
         return NULL;
     }
 
-    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
-                                    NULL, errp);
-    if (!anon) {
-        return NULL;
-    }
-
     for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
             const char *name, *node;
@@ -279,8 +274,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             src = bdrv_find_dirty_bitmap(bs, name);
             if (!src) {
                 error_setg(errp, "Dirty bitmap '%s' not found", name);
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         case QTYPE_QDICT:
@@ -288,29 +282,34 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             name = lst->value->u.external.name;
             src = block_dirty_bitmap_lookup(node, name, NULL, errp);
             if (!src) {
-                dst = NULL;
-                goto out;
+                goto fail;
             }
             break;
         default:
             abort();
         }
 
-        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
-            dst = NULL;
-            goto out;
+        /* We do backup only for first merge operation */
+        if (!bdrv_merge_dirty_bitmap(dst, src,
+                                     local_backup ? NULL : &local_backup,
+                                     errp))
+        {
+            goto fail;
         }
     }
 
-    /* Merge into dst; dst is unchanged on failure. */
-    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
-        dst = NULL;
-        goto out;
+    if (backup) {
+        *backup = local_backup;
     }
 
- out:
-    bdrv_release_dirty_bitmap(anon);
     return dst;
+
+fail:
+    if (local_backup) {
+        bdrv_restore_dirty_bitmap(dst, local_backup);
+    }
+
+    return NULL;
 }
 
 void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
-- 
2.31.1


