Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FB58ADAB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:52:50 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzd3-0005X7-7s
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYb-0006nF-JW; Fri, 05 Aug 2022 11:48:13 -0400
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:43843 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYZ-0003rS-Lw; Fri, 05 Aug 2022 11:48:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juAeko+7AoQOH05e4n+IFxYwbOFKBeh7YSD+ICwuyxNmmlijwKOnL2mEcQbUQ2GBOumdc74pn+vbAFZK6296IYLGnNCcjnnIxJcjIROxXeblRcmOgsCEMDLLzXOew9R95cnkZhO8QZjZykmumgr7rGW6yHk8gE7WMLKpzu+VvkC0Mup9UCXycW0cN/hd4P/d1EAI8DiJNsTzDdAGm41UGxC79QxXVF10Z2YVZGkepkb9NrCQYfpq0IzEjLFR/YK1anQybueJpKFwlUKSOe5gP1iAd1TIVNLTzF46H3AR0K8PN1LH9xVaHTnS80h7XOMwNb+gVzQ4oHFgFoqiSiiGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/7aAh9jQwQ71wO/iN0x990fKzOvywBFk+QaXaQIEDE=;
 b=SIBQQsEJefRMvlE5DVx2ESL1nKVI1Ou6mKCDKGmvBOSjqy6hTNBwXhWYYsd+aB1efRsxqr+fvIzI5aoQRVX7/6wyIBviCdl54IBrlrdfTfB9lq1jbO3jEXQllS0ftqYpLEZPqCHIoe07KSHLulJ4P6bGxIRfv+3QKkliti8IlmWu2azYMtfzYc4sfKFB+OFuhM4tOC+IqUX83LWSQCISpyV0dwSbTIGfBoox7CAqRm0J/8caLu5h3aaqoVRf6/HcIGf5vLodYjPWudaf4R5DAxE8EhwTPe/Cq6cRaFK1jLb3fDKXMujti+gxbq7XfCvreWske2rvyxpjixwN/Wayfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/7aAh9jQwQ71wO/iN0x990fKzOvywBFk+QaXaQIEDE=;
 b=WFWnB//nV3rgdvm3GmhlF263ajhHv2BWE2QvZn0akCxFNTTGKif+njewqUmD2ssntn5jkRcccGWF2UhFbCBKQg50rWhLjJmaW/hzFYO+W6qLhEkb0ESmyrr8Ze91ZAqPYmVFhTZXM1skCiTzEDpYkFYo0Id/KDXnL5On2/Lt1qSY65x8UOdu1kTGq4x+6Nnjnlrwz2JJsYG1k27Oh2pm+GyQj7Ns0ghXjWfb0WFU767nvlXrzrUAe7mw3Qq8GV3swfGMGsjI0G8MhngB2mGBwToqFj8NaFEGTDSpmaRS3Z+DzsbUaH0lqAsSaN9hwbJ4aEU8SJlE+qhROWSoTSJkdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7668.eurprd08.prod.outlook.com (2603:10a6:102:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 15:48:01 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:48:01 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH v2 1/3] parallels: Put the image checks in separate functions
Date: Fri,  5 Aug 2022 17:47:50 +0200
Message-Id: <20220805154752.799395-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c287df1-027d-46ee-ede3-08da76f9e068
X-MS-TrafficTypeDiagnostic: PA4PR08MB7668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEXQfIAor7X6YTqSB24KbclwIZYaRKcI4NFDliSJhNi0uD6oM5owbjEfD0I7TA5Xzm6q57hG3WaRe4F+aCuOtUpZm5NtYMLOACOYbNvA43Pyk5KIc4cd/lcJMWRxQSKbNcgS61aP7hJDTkiS+luugz/X4mLNljF4tjgh/qtSEJcTmgDach7eVhV6glijqCDDSjjA95VT/Gq8yM4+K0F/NdOvMi+ozQI+A+NDRzwyuUUnDz350XTdgknsxQBFSJH67wUCJrxuJNGgBCcZAO/6s2uL5Joi1DeXIud9mJ8RswpsvjbH0EYoVazUoTWiU1abiwbYzbkqSjiJZ2v2jhspiZfcwZNiM+FdEEOcPejdoBMGFVwp36/ojFFsCEhLRWB9cPGyPvCEFSfBtwJXIAjynAisX6bmSIyAGR+L97dJSNxwJxI7JZNLAdk8sJH5mA0CmoyHu+Sx+hDlcEAyLsHLwQYwAVoJRPBM4hjSGrWk9YwlXTc2bWOGPlBgq0N5YxDygq/xxbZevJcrct5H+24cw0j7xvt0p8arnd2G0RsjsHxXuayr/RU9hYkO2oeCIOGVekq9NqXYqVN8pk2cp+YJpn9Ehw3zZFJFQFpzeZFWKeLT+8nUteaHgG8cHIFCCdWEx0SffN/uRpBYeVviXXcU3xzhxDA0ASq56/zqIZWbhkowMvMJISd0Z0+42+fRXTSdF3a+/1TMvEyTZS4+55HkVXF4yVoH9qmDhScx6nax+eeI38ZxOIrPu8biLRHZ5paHB2+xwq9v+TxDIEY2p+GZsoaZtQMYje3v707lm5nZZPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(6486002)(8676002)(5660300002)(478600001)(66556008)(66946007)(2906002)(4326008)(83380400001)(38350700002)(8936002)(66476007)(52116002)(36756003)(41300700001)(38100700002)(186003)(86362001)(1076003)(6506007)(2616005)(6666004)(26005)(6512007)(9686003)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?clD6wVpOkw7tV1FCt8OQ4q7n3Y4v+oV/87oiGwoClUJwbbtFExAiKmeb2jIq?=
 =?us-ascii?Q?EIuSL/WqWtEjXsWa7jflSC7qfZjKisauwPUb0uO8Z1YLI3RSFlUxGCtsN+Ag?=
 =?us-ascii?Q?dqmTQgEo9WO2VAPSKJOvew6wT8Sdxui3IX+Ok1gLj+3iesSS/7kz3a28RYD5?=
 =?us-ascii?Q?KkTXjjfzeEj1SbWQJU0wFYlR4K/2Q+OygSXbDLwxqVRID1ForFNwl1DKcVg1?=
 =?us-ascii?Q?nXhSv88ZM6WZ84Wv2NGYk5d1DuypmvQzKX893QxhjEgK7GkTOAXWpB+M/PGQ?=
 =?us-ascii?Q?dZ/VcNGaJGYm2c/5EBCOWv2p18OOvP5Yz+C+sbw2Lkf3qr2UQNR33qivtQ3x?=
 =?us-ascii?Q?jno6yeKon+JGbYkjTptm2zMlspLpDt3UKmG0t3IxqsojnxAcHMNd/TqCajjb?=
 =?us-ascii?Q?aH14fHHzBf+nB/R+b7Uqi0/06jfzmIuNpxttVPF+DTfoC96VyktSz5IM7M65?=
 =?us-ascii?Q?YuOxGFWmcThEWfWDizLrHtE717DkgSK/sdPTA/p3TsOnzlgtrs2Hue6B3UJy?=
 =?us-ascii?Q?BV+ifoYAUgiUEJwo1+j8XW2WupROUbZDFIrQ46G9topN3GDGqmLg5DrdqBDP?=
 =?us-ascii?Q?2ohkrOY9WjeSsovufSPnZerZLQ3OWcqBw656rzKZ5TNEREeDygZe5soVevnl?=
 =?us-ascii?Q?9hH3zLLiIZou0QzPvkbIPFpFN86QYeoujO3c5wpC3R/vh8GiClOB4GLmXLSW?=
 =?us-ascii?Q?kuAgCJGNhFQyvsITTUIJKXNk/uyJ+OS/345etSjGrmiuZiFDcnQJr9KfL+C6?=
 =?us-ascii?Q?sbJOeVDuULnbbqjDwaRhko8DkOIsA6qfqa21Vz3dJimIjwsTbWyJUJcmQFZs?=
 =?us-ascii?Q?p7ip5rjIRyhLr0RFszRzZ2Na7H7C+wsSTQlBliag58a7rH+cD5RoTpvAeoFO?=
 =?us-ascii?Q?e6igkMtQMLNxI8sSIbYJeJNzXuffskiUBiJewUDRdm8wTyN63Ds+30prgh9s?=
 =?us-ascii?Q?1TzKIQVCL7EvUp3cs9GC5UqRp5GVRIbz8qEW9pf8lX/Fx+5/HTuRAVz0L1k1?=
 =?us-ascii?Q?3EEYB6CcTiuOHmNorX3bKNw/MhGRNYlREH/KqxcM6YeGWxM8k9uSeaK6JNtS?=
 =?us-ascii?Q?riLo2hhTgkNyu1ca0ge5UnvUEvQTN30c95x0NcOQOugpzqXTQP3Zq2s9Zprb?=
 =?us-ascii?Q?pTOdPkMin1c/GYU6D1nFcqPY/WTf1cOKGssW9JGMCyNROS1BmZOMVdP1Ok8W?=
 =?us-ascii?Q?AkmgY8wrfnq4jI8aNWJprpi467OwswOq8vW0NMwoWORHFbc4JUXfRlihtEt7?=
 =?us-ascii?Q?GrnYiXtIA8ZbuCKhN5I57BqpNbwuULG7EKvW6sAc/K/Isw5ENe21QAi6VVed?=
 =?us-ascii?Q?5Q+3Qugt707WhUjjqt01wdKXtg9GBxk8kaX8c6mnBJXs/GE4QrCarez+3KOS?=
 =?us-ascii?Q?TlObjDNM1MXHN6WXtr5APcWZEGR8QcXmwuYtXMecssK5UUoPlsOHISLaFUcQ?=
 =?us-ascii?Q?ZQolk/k6l+vUUpOVRHMNs1paMh+1RmAO6OMYbusoOFgWpBnMCO4+4SYQhsPP?=
 =?us-ascii?Q?xg5F/25egnjvF5ZTHMNdODpzDckMB2MMLFGhrrf4w+1U1mRe6RnbZYJWLxs4?=
 =?us-ascii?Q?jfqn0ynkwV6cGdqSjgY0NkUUaNe73QT9DU0jKZXVbWknV759wFadVeHYMeXN?=
 =?us-ascii?Q?7S0XIIlFGvTk86TDlXoGI5c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c287df1-027d-46ee-ede3-08da76f9e068
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:48:01.2218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EOlST9ebPF95L0BxhTmpo1RMwAOjJMydYRKasgC9pBk7uWcKnjypK29VDEHVoX9qizqUcZkaCr1fx0qGw6i5PpcJKbYLhkqUQCutEx1Tzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7668
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

We will add more and more checks of images so we need to reorganize the code.
Put each check to a separate helper function with a separate loop.
Add two helpers: truncate_file() and sync_header(). They will be used
in multiple functions.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 180 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 133 insertions(+), 47 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..a0eb7ec3c3 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -413,24 +413,41 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
-
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int sync_header(BlockDriverState *bs, BdrvCheckResult *res)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
     int ret;
-    uint32_t i;
-    bool flush_bat = false;
 
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
+    ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
+    if (ret < 0) {
         res->check_errors++;
-        return size;
     }
+    return ret;
+}
+
+static int truncate_file(BlockDriverState *bs, int64_t size)
+{
+    Error *local_err = NULL;
+    int ret;
+
+    /*
+     * In order to really repair the image, we must shrink it.
+     * That means we have to pass exact=true.
+     */
+    ret = bdrv_truncate(bs->file, size, true,
+                        PREALLOC_MODE_OFF, 0, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+    }
+    return ret;
+}
+
+static void check_unclean(BlockDriverState *bs,
+                          BdrvCheckResult *res,
+                          BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
 
-    qemu_co_mutex_lock(&s->lock);
     if (s->header_unclean) {
         fprintf(stderr, "%s image was not closed correctly\n",
                 fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
@@ -441,78 +458,147 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             s->header_unclean = false;
         }
     }
+}
 
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
+static int check_cluster_outside_image(BlockDriverState *bs,
+                                       BdrvCheckResult *res,
+                                       BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size;
+    uint32_t i;
+    bool sync = false;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
 
-    high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        /* cluster outside the image */
-        if (off > size) {
+        if ((bat2sect(s, i) << BDRV_SECTOR_BITS) > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
-                flush_bat = true;
-                continue;
+                sync = true;
             }
         }
+    }
 
-        res->bfi.allocated_clusters++;
-        if (off > high_off) {
-            high_off = off;
+    if (sync) {
+        return sync_header(bs, res);
+    }
+
+    return 0;
+}
+
+static void check_fragmentation(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t off, prev_off;
+    uint32_t i;
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
         }
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
     }
+}
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
+static int check_leak(BlockDriverState *bs,
+                      BdrvCheckResult *res,
+                      BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size, off, high_off, count;
+    uint32_t i;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    high_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > high_off) {
+            high_off = off;
         }
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
                 size - res->image_end_offset);
         res->leaks += count;
         if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
+            int ret;
 
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
-                                PREALLOC_MODE_OFF, 0, &local_err);
+            ret = truncate_file(bs, res->image_end_offset);
             if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
+    return 0;
+}
+
+static void collect_statistics(BlockDriverState *bs, BdrvCheckResult *res)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+    res->bfi.allocated_clusters = 0;
+
+    for (i = 0; i < s->bat_size; i++) {
+        if ((bat2sect(s, i) << BDRV_SECTOR_BITS) > 0) {
+            res->bfi.allocated_clusters++;
+        }
+    }
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
+    check_unclean(bs, res, fix);
+
+    ret = check_cluster_outside_image(bs, res, fix);
+    if (ret != 0) {
+        goto out;
+    }
+
+    check_fragmentation(bs, res, fix);
+
+    ret = check_leak(bs, res, fix);
+    if (ret != 0) {
+        goto out;
+    }
+
+    collect_statistics(bs, res);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


