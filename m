Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99A6EC94D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:45:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsjd-0003z9-NS; Mon, 24 Apr 2023 05:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjK-0003vD-87; Mon, 24 Apr 2023 05:43:30 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjH-0001KL-Nt; Mon, 24 Apr 2023 05:43:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc34MyAa5EjAkRkmOQNm3ktr5S1eKH51ushbOdMQd7ML0mcCFFbEYn13vS7GB/nm5Umkc3Ct9MtypLCvsh9qwEru9yDNc7rnsjmLpsV73JszdE3MlXW8Q+C4/G4dxbGVTOiJJ6xrOmo8vxqytQ3JlVMYf+5QunkHcgOBA1KsNbqC3ILJ6XG3t8KtIPWstW/G9XA6tPVvH07WffcSJuWdlCbhsP4/+Uss8AC5pULn34l3OdDaQm8FlQ7THuNvkelNCD/CErTul9ftAuukLeQgA6z9nJFtSb3uQHf/8abU6g/W8lLQYe9D+DrpP2mfN0jEXZCSx3zmdikPCj8f3pKCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRo28aYJrfGHkGD1Gs4r0MZWxvh77uwtx5o5Gt0sUnA=;
 b=hHfAJEz274vWYR0PNgakarfjpZJdUjWdQRv1XJTeTJN2CwPPArz6MjApcJ8s55IjvJEtPTdFJvK1EnGeAfbBnJZyAjCIYzppHosznL+oDJ2CLbxHuETt4LgUjdqnpjtglWNB9vW+3C2NUQjQSPJk+B8YJf5W3I76SvXCeePwOothXgweG+1I3Uynlx1epxZwBJFl9ali263q7y1k36OmOulRpq8u+cJ1ZuGrXb9XKvmj/lBINaXyBLa9XygYuPHjwgfmZ3GgVNLPqssbKycMZoGxG4uascA6ZNuEGAZNlNFPixtY4TNY5YGa4cro3wMKNoqqHlt15CvgP9JDml1meQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRo28aYJrfGHkGD1Gs4r0MZWxvh77uwtx5o5Gt0sUnA=;
 b=eQP8RmprOv2cua3OXMkVYo1q5A97NysAGUW4t6JtgyKk9owKQf+blSSesVKn3ro1j9U9/ulbv21DYXgwiRtrFhRQ5BK+rU5Hk46tBRExW+eF6/tV+ieh1gWxX47enbKyABiYe0KMIXYCBaQ83PnxMUEaIdWwBd6QmlGSrCY1vqdfCeDXpsNQzJnjtOWEQotBJ9OVTXL07Qzgc7nTkWRaz23uwR40WBetJq5wZNJ9hEZD7OtCwn1s7d3Ssz9T9Sh/1H9S/V2n+0TOvh0Il4Kypz2XLxHXg22r5M8nsve6VK2vmXKoEcJ7DlX0K3GDi2w+MKST9tJ79vrIOD2h50kkUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:22 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:21 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 2/5] parallels: Split image leak handling to separate check
 and fix helpers
Date: Mon, 24 Apr 2023 11:43:06 +0200
Message-Id: <20230424094309.197969-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d96bed-453c-4fe9-3c7e-08db44a8574a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1If2CrlnDSb6eZgZG8BV26gts6kAm/EXEYk6LKuW/1vHpbLo7bBxStVuu0S/4Kd4UmsqVMa4ypmUta8glz5K+o32P2r54Xkz5v5Y2GWpzcgvNElaqHuFp+Al1jCpl6vCxDJ8H6dn8q4EOQA3c3w6HBJL7U0dBTZ8jMUAKNjq7u1FyRs8+L3skfqY4xiJ6pnvh/DV0jd9XvKGmcgjKmjkNi+9w3CLX40q8hmsgdlNK9sJ/asuhkCUZzrsxXXMJIWgNcntaQeqJr4mxAWAabr138lvrunNhYmL0ZWmS0/UEG6lDbFkmfy3EVJ2zMcRf/JNls+TVOXl54BJnwZAPlpxCdsvE3/d4ZUyKJj/uVYIE/5VDmrqrsPI72PE6uRZ3iwxd6qy2Z7mbUxGCPt+ubGEtnZoT+Z6y2j0ZQJDHrlvn6ZMSXSollGkmJxpYq7qyeWUOSM4lxzAY+iaTvoeLgilNYlw2rycE0FMzcz/G31Y88O6Z67WAWxXifCFoCMMhKegS3iBdKpoEDHMXSnEBC6Arzlk0+OOnjIvyHg8JF62Nqkq0AyfA5pkpxJNRq7zHLGdaUJmq64JTHvCpW9y76sgRwP3wOQAlLE6iYV5Wyf+OTVuQMxqrEbx5W2XmXJZ/Sfp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2SEexxx0fzMSOMHwSxpXOXmlE9JNcjWGoERgElHjid4A1pG3n1GVefwVggx?=
 =?us-ascii?Q?JBqUCNtfXR3VtJcbr5LrSBjsl9igMYK2PBxA8mfOu0O5ktXOQI1oPXBASijG?=
 =?us-ascii?Q?sLKHbFhfi2lGyj6cdVbg6bRvqDgbKjwnUDicX9SSvEF+ArbgKizn2fXH98Gu?=
 =?us-ascii?Q?zAsvM+PUtbVif4P0lNwwBunNrdgAwZkOIFWrwAwhOGMrQo0GZsuecPEVdUsK?=
 =?us-ascii?Q?OeFmdJKGqin/GtrSBLeK5AKPQkr2Bc9KRBkOZKlH1U3AErC107bSAAIp3PaQ?=
 =?us-ascii?Q?72GuijvxaxE/fgep/JNxN218CfGvcV4LGXKtPh5Mb8g3Pv26uEsBtxId+fjG?=
 =?us-ascii?Q?KJK8Kmgmw2+z+OSuX3TuLsHqWOS6nLYXe8e5VOhaRWzKz5ZqVFTxVQQ0KltO?=
 =?us-ascii?Q?xqLB1AsKdqmfkp0LIFZVugAEkdjq7h1wcnEKOo4+PETkYyf6ceCfLGj0owed?=
 =?us-ascii?Q?TB++30FGjkuIyvDEaUa2O78XiZipPgMcCFOlpFlRWbCbHhalQo2/chgRhotL?=
 =?us-ascii?Q?7NmXi4Fk5kaVatwtIqhpu1rEdqGoQmju2Sh0ZVOtzsPr3x6BTrHv+NFquZ75?=
 =?us-ascii?Q?w7NI0PeHkNV3cT+b4ZtgwrKFQKzD+VEC8fNEgKhfMaS2mT8mrlQXi5tkgkHx?=
 =?us-ascii?Q?XYGY0QWWnwVSmpuWYzG/kUclISwV/GeB9gt8Fw5WPXCVEavwCINvvxmnJnFw?=
 =?us-ascii?Q?dqRY+y+UlpdiUdjqC0drHgv7ScbxdOpwbTarIx4H//C/3c4becXO4t4pUyfY?=
 =?us-ascii?Q?piN9gDtML8VjUrvgz9KgDiKv4ffMToQZ8vwllTW/wf6NGIbHq3wEOA1X1uUB?=
 =?us-ascii?Q?2b6+jMcSI/zGRGM0KG4N0HgT3gLNvpKMoSGm/Ev4QzMi8N4huXRhxKEGSAJH?=
 =?us-ascii?Q?W0XBABj4kEG9gF6BS8jh7RxCiYswHAc9bUxuV1Hd6t7z7Jv3D640u44BY37C?=
 =?us-ascii?Q?D3ctjW5NW9jdSTSnjPdESsBo2jhKNvR8PYT3igWhjbZp6vzYh2WOtwX1WV0q?=
 =?us-ascii?Q?3czgAlhcvumHY8X4Op4KW0MJc/skdQHeEInKU2yoQVxhmcYsQZFReNbq8eIn?=
 =?us-ascii?Q?j8IdZ6WZEMfW1sESjNCb/Hc/Kl7lKGWONcAI6df/9yscVKNgp1OktbHTEHsp?=
 =?us-ascii?Q?JSawkxJe/YxfM+FExagLSTS3I8iIh7pe524eIhwo4hG/UJ9Li4R2OYlJAUxw?=
 =?us-ascii?Q?tYAVh4YrCwdeHcOpt/nXg/cWwj9UMJ4T7UWoScOCft+QpM6i6oQ4xE6Voqgy?=
 =?us-ascii?Q?ap3dBK/mcH+9cdC5At6pnCBTTVvNLg61TaKnP/q2kMIP2Ht5a/CfYWT3UfSI?=
 =?us-ascii?Q?lPSSrwaw7jXAtzjbUaqCTQ1Sv5wdRwy42ilmVYSItYLXTDI0hy0RoFX4GBf1?=
 =?us-ascii?Q?wRHbUWI1vJddQUJM1QEhyMYensoQ2CBrBwuRALltTAghLkTUqCpQOqp04JIG?=
 =?us-ascii?Q?3xj8Yca6H8Dv8nh18GJZ9o7H1VqABM0lM+kqVvJ95YJfdnbyQJVkFIKdFJQ+?=
 =?us-ascii?Q?s+Jd4J9zuInCWkWs7dpYaUukkgORVFGzTMbA0+YMhR2zzi8NRgvhEUqccZbd?=
 =?us-ascii?Q?V8Pty+6oFdY2PhXnxsAWLQUYIv1vYASxe1nTUfdzLzWaJEHE0giqfbGrplR3?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d96bed-453c-4fe9-3c7e-08db44a8574a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:21.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upaUVgUHKT6C1Dt+X6X5n4WtviuTXLB41M+wXpNSB9o6jLjaMJNlchxXSly3PXGApT8zGGpx38VHz478LeJhooSg4dly5HxAacnn6Hk+JhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We need to fix leak after deduplication in the next patch. Move leak
fixing to a separate helper parallels_fix_leak() and add
parallels_get_leak_size() helper wich used in parallels_fix_leak() and
parallels_check_leak().

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 86 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 25 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 60033c1204..ec89ed894b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -482,43 +482,79 @@ parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 }
 
+static int64_t parallels_get_leak_size(BlockDriverState *bs,
+                                       BdrvCheckResult *res)
+{
+    int64_t size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        return size;
+    }
+
+    /*
+     * Before any usage of this function, image_end_offset has to be set to the
+     * the highest offset in the BAT, excluding out-of-image offsets.
+     */
+    assert(size >= res->image_end_offset);
+
+    return size - res->image_end_offset;
+}
+
+static int parallels_fix_leak(BlockDriverState *bs,
+                              BdrvCheckResult *res)
+{
+    Error *local_err = NULL;
+    int64_t size;
+    int ret;
+
+    size = parallels_get_leak_size(bs, res);
+    if (size <= 0) {
+        return size;
+    }
+
+    /*
+     * In order to really repair the image, we must shrink it.
+     * That means we have to pass exact=true.
+     */
+    ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                           PREALLOC_MODE_OFF, 0, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
+
+    return 0;
+}
+
 static int coroutine_fn GRAPH_RDLOCK
 parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
                      BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size;
+    int64_t count, leak_size;
     int ret;
 
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
+    leak_size = parallels_get_leak_size(bs, res);
+    if (leak_size < 0) {
         res->check_errors++;
-        return size;
+        return leak_size;
+    }
+    if (leak_size == 0) {
+        return 0;
     }
 
-    if (size > res->image_end_offset) {
-        int64_t count;
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
+    count = DIV_ROUND_UP(leak_size, s->cluster_size);
+    res->leaks += count;
+    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
-                                   PREALLOC_MODE_OFF, 0, &local_err);
-            if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                return ret;
-            }
-            res->leaks_fixed += count;
+    if (fix & BDRV_FIX_LEAKS) {
+        ret = parallels_fix_leak(bs, res);
+        if (ret < 0) {
+            return ret;
         }
+        res->leaks_fixed += count;
     }
 
     return 0;
-- 
2.34.1


