Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C7689378
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEE-0007M5-Hn; Fri, 03 Feb 2023 04:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE7-0007EE-E3; Fri, 03 Feb 2023 04:19:26 -0500
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE5-0000oK-U9; Fri, 03 Feb 2023 04:19:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHGppeoYHA6vsSqKnJ9pz+3YBW05lVEfTX4N4rCpV1zs+CQysLfQhSRHoHtAdxk5OtOW9Lj+PRQ3PHLu4s5BsgQ6LySSFZJrdEyJv+co497Bgjn+rDwzacDVdIbs5nm3UgM3jFpDQwYuLgEqHGpw67fTUCC+dhVv7wYwbcjbacMO70nJcGDt+mDyi2wOi2TL7+9uN1zttlUoH3O8k+VkcIqvyQa9Tlb9Z/PRCuUFr1KQNVGHvt58WLQVFkJ/zlpoBwzw1bLZpEqPwbKWaz2RS4KhAkR+Jg4mc5W4Y8tZ6CeExoQULab6M13eFwgfIf8ojBwbhPE++SXJP13LlxekfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gHhZCeePkWzYtLuDd9N9Uifv0FsJ7yzg+b7tUqfNGw=;
 b=EgUEgzh4Ua5C57PqIXfItRevIolXecSvVTZcPLKqrZatOm6g40RfVW+Wpkfhll5KWhsA2jeGy8nEbPnfNXoCso3CNzIjT/aXdo//995PSRDhMU5zSwYAfZE4vK+Or9s/8hqj3DvOEoluZTDm/tEp3z2f7uuWJekhnuSbLZOPKtuayFBlaYo+lZcKYWZYE94jOT0j4QBHNUKf27Ea39EODkgr1QhDx6NhbXokswxhbi1Ax40q1YLr39BkOcX1Y0peKuEKZHVr0yOSx49wWfzIQsGPizCDNN7XDEn4gzSipe+TwVYUno+47Jm3SrtsfKr0aPtuZ6l3F9Rn7Ktdpr1gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gHhZCeePkWzYtLuDd9N9Uifv0FsJ7yzg+b7tUqfNGw=;
 b=ICK2zze5st5RIIsrJ4ai40/qRTafz3geKW7qDphJ+/p3TvHscgaE9gFFqvWRlTlRY6UDWTwKqeb2PaZQzDY2+hztlCJCoXAV/wWn1kk5FcRanKh8iyv++MpdWVdHVNBDzX/kg1bomtn8ZohuHOO6fm9MiFeDenico8ebgqugWJ4aLGBY7g/ic7Z0jJ11JZ9zD9DYzg+sTHV5YmfXFZUN+V9ccm6iIA3CPtsEBxU++Qj6l69xHr8c0ImzpWz1Bp58fRXwnTCXusrYJqEh46huYRBSl6sk4RT7jc5wLfFARl9QHvx0iNMDSs2WJ7umUx0+ibf3TlRRGmHohbmjtkLTgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:08 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:08 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 10/12] parallels: Move statistic collection to a separate
 function
Date: Fri,  3 Feb 2023 10:18:52 +0100
Message-Id: <20230203091854.2221397-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: cb62c87b-8068-405e-b4ec-08db05c7b43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjlimofN49kCqEUgunxwfLYyVy3s/JROQeNTWuX3WS7Ul0rT5/JWIm2Ho9C/DIgDUvUnxLSC4ud0Jk8FxlviTIxUCDAmq0afYGFStwRfR5pyWcWtq7HfvfAeYowFJAfQFunnNqIbtYn7Fle1lPNDwpjeurs52RLVUdXzeme5cARnemAa6P/zHukkTc0acOl4xhjdiX8AT9hHeXK6xqYvX2MgNfzHJbr4aVZMqPdNHCP9GDkNiKrPJ37tXR9r5taedVRHKZIIOZIL0qK/FeshX/N7tF9znWPL1QcyqLVJ8sqLvsiS1GoM+by/OULINzOG51QgavxZomOq13hPn+ftRk/6q+Sx+o3RnUz2EuIGKCGPLbOMfaFIvdiWG5MQro1dNP8PMu+3rEwiRSuTqfd+2syb6AAM2Q/CsZfeM2buon4AjQ/BQL9sKquhrXeAUT6+LRogFRgf1mK/yrgz1xCFU/oDySQwGr+NnI1vRPOOaK9TcbsUixtR9QgCsnnd4JUJSdl/3CE/cUQXtSGK+eY2zwBZ+niLPAbtvJESnL27P07wFyew4jZwmU5/zVbEyRkgcnUcSevE0Z8o5sej1iCJK9gM0xWX49BZS0xa+UEpj+j+Fgb/Mpe3JzAyIKP7Qlbk0mGOfwCAJMOLEoowSzaaestc/HEcqLrKPy8VnjFekUXi3vJGUitRZR1ngItw+qpTvV37QW9JsdehSxFWuDLfWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rVhPcEb2G15ZGFxTR8BUan66+6cbSECccZuHCikp1swQupXRVP2m87RnbMo5?=
 =?us-ascii?Q?UZTVXfwCjKzYBaVgIginpmW0/D9w3422mUE4Nr/LuDygIzfWG00IbGxttQ7W?=
 =?us-ascii?Q?q/uDuSms/EnXwu30EpNt5iMnDAMyYMge5AQHZpDJVY58jKXOT6KIrT6LWHi/?=
 =?us-ascii?Q?oTmM2k1cSlyXZMyh5HyyIycAxaifzq5IXctYc4UBg/v18K9TillZWsErMhLW?=
 =?us-ascii?Q?hGrz420LfTa/crVY6HoFupRFACW/dIIApKm7ELY2ELk/LLoM/7Gn9+GxGh1M?=
 =?us-ascii?Q?EQ/k7Yid0bpSGoOlp4EMPgXqhtj8PT19CINBDMQYRs5oXXJ4WSZh69wYzgmC?=
 =?us-ascii?Q?X5LVp/Ogj0qaZY277v078F0OxF4wGUf9sFyx2/6fLDaUr6y4X5mOpvx7J1wn?=
 =?us-ascii?Q?nb79gHBa0kpyuBLyzttTeLy0lciYAw/C1I05cjeZLQfsO5C0owTdpJDTHKio?=
 =?us-ascii?Q?NxtP52w0+1YsZ0basRt9vf2aV9PEDmLdov2LbVRhKCHDGqwQZCSqEAzQUdhg?=
 =?us-ascii?Q?vIyOx14SgrxcOcrLLya6UHH4/F0wq01lvP+aKtd5VAQzBKvrEpJQce7lGsyw?=
 =?us-ascii?Q?EbljBNQRZ4LmoQ14Li1Pu6QRrCsh+hDgoTMwXhAboJzjmFZgpAn489PMmGTO?=
 =?us-ascii?Q?pG/42I9/SRmvOSEgHrojNQQT+DnhPbCt0t1FJ5a4gdkzdvRBefgW6s51PKUw?=
 =?us-ascii?Q?GOu9UT3agKOMjC015cSXxVGV3yIUsGVApAKeh8RLznuOvc4b+sbsZQ9k+UGZ?=
 =?us-ascii?Q?oZMjwMu6XRrHtacIDFIKiloQZrruZluLA0BOg9+WcdjR4tPvfyLjIQSK5kSQ?=
 =?us-ascii?Q?t73uYIfwjgRYIJGeMvopYZRDAMg587WbNqn2eyb+5OuKVTHlawAoH1FUgLwO?=
 =?us-ascii?Q?0KbBvcjEWF3DIJyCVRvqyviXuXDocXFPRYdoQDV2Yi/CYjG9xsYo28/Fg4wh?=
 =?us-ascii?Q?ykZlUHT4/RNpJ4Po1BqR8Cyc+TMvS8InAgsbHpRCY+G9EIkJiwJYmr5c1Z3r?=
 =?us-ascii?Q?6ZQKgywkByWB8Iw1e0rQeMg3AySWtvKP0HFp1jfmOF1gLoyhUncof0JDOBc9?=
 =?us-ascii?Q?jaXrq9e72MF/v3l0GeWPsBuqP9DMvYJGWmg8P6Mo1HoEkw9WtWbPJ15/8wCf?=
 =?us-ascii?Q?zNoFVIzE2ZpPkIcF/9FtlXHprWYj+Y7ubOOX7qGIv7YI9o4Dx4SPP1AAeFoH?=
 =?us-ascii?Q?kb83PukX3MwJHdGn+QyAcuIncOJ37L3fUpDx1ZOMd/92EymKERRcgvLNSFlL?=
 =?us-ascii?Q?10lgYPAyInLp8kZfnGFPhy+GcT0c+O+ftN6wLJQ+F2C87YXfbobvbFQYHsHn?=
 =?us-ascii?Q?5g3kCmczxnXeHS1lm1xonviIIgSn4prCHohQp9U6Kmmwcf/r83T9TLDy7bSW?=
 =?us-ascii?Q?UX3H8ovR/mfQIHhWiFcC/JcWn1Rp2r+LHv5a7JI0vEL2/uvvAw5Rvp6LRNt1?=
 =?us-ascii?Q?WCtiM3hMQAVwDtyFdg1gvkUHKuXp8e/wFrimaQkku0o3dy2z1OiWHJHWsinQ?=
 =?us-ascii?Q?fu9v5UDCREXVFjLvawuHmv4ac4UD5D+BoMC3Ozp2WET8yJPfZlSwjA7AEJwE?=
 =?us-ascii?Q?yyvPfno1tlrl5+8mNuFGp30XPcrlaWBT0HzTez/y1nmByMKwd/Q5zck6VwBT?=
 =?us-ascii?Q?9TobcDB6Qhk1qkPGoNzyWy8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb62c87b-8068-405e-b4ec-08db05c7b43a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:08.4527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/ZQMCnifwi5qfmcrcPBW/fXhfK61IKR9sf9/b7thtrcG+5bSldheLo+z8n0c0u7HxAcKQI5Hfnm636fxT69LYxojcVeBE6jayoLm7BzTEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c7d37c4580..3c38a0fd09 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -522,35 +522,20 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         /*
          * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
          * fixed. Skip not allocated and out-of-image BAT entries.
@@ -560,13 +545,36 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


