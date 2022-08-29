Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474D5A4765
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:42:48 +0200 (CEST)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oScEB-0004Eh-Ms
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblW-0001Gb-CL; Mon, 29 Aug 2022 06:13:10 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:32646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblU-00066Q-Qx; Mon, 29 Aug 2022 06:13:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZQuNE1/8xgIMgiQXkHwBW4YZQwETU0yz6Pm3uigO5wtLK0KfaODR1g93PcVuJOjuhIdMJJw6E3Vi6mwHWV/goYN5wPTJWBNtIwMHKznFd0DxCjfCr22OZwYdbas8uFCMlK6O/AP4Z9KxEV2HBtx8entUEtHWJOOlSpyzXGCR4+w/I29sGT84NZIAlO2P+3j8CRDghmXaYeejRuAjNFEGDqaBiBs4NN2JDBdOpe+VF/XTsJ4a05ZJlzHmtHyYwexZiizkTZk+Ypl7sc/Z1t8tohZsq/W7Y7LMyQRKPNjjvOH3anjFmLax5zWTutyrqVofSmx1CL3UEwmjHvTTI7Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=b9mqK/+oVXb5XjtstjIXEQgKk4V769WvBJ9KKY0B0hJRjxwesF46lSUiI6Pa3W+LrS5m/Se+14lzVtcK5HWrNVoKncfXwIIyjYMXs0qSqx+M0Y/h1tmseF7QAa3Ybxya2lBMaomHn7/Y9xcLJaEbg4P4ljvKk7+gNNtQEj2TdVB1Sh1CguJ/YuXrGKie/KCMzgffiXP6WZkOzQXW9YYNcWX07YmY+uMJD3CDsCE1rpvdWjc0iHQ5XkLUbUKa/0XOZ67JnSNwNALJF7fnzZXNZN5ftOx+IH6qjZZouSUdAhsLqIIQaPpcZQxys7wz+zYfVQmxDmkWm8QX0f8/5n7YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=M+dzMC//wCsQaXFiyJ1pbkM5pqGLIIMmOJfmVf5ImrzXam41GF+pEMOE8qBie1Tfv5ARyrBdquug8WJQ5ANRyuQ+5Q/icAf1oY4l5LAnM7oMsnSQE69rO9QJwgpBtCtOIlQO7mxD0LF6pbP6+V5mBuiur2RXdbfaPdZcQj83XCkKVx+GgNUKx6kUX3ZX098naIe1UYS8RDuqfd1oqh/RhiGW+GoIoFEVpagSeShUMpSvw0gsH2wm9IXw3umSfO/pZaIXbslEaxXhxrqNZfAEpfQ4hTY3ar0qI7KSDukETJy2+GlVDkoThjRKUcxUpHGMOBH8ZflAbxrVnfAeYV306w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:13:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:13:00 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 09/10] parallels: Move statistic collection to a separate
 function
Date: Mon, 29 Aug 2022 12:12:44 +0200
Message-Id: <20220829101246.343507-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ced4e93-8c9c-4270-27aa-08da89a70d2f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYKNeVPnudkDGWWyZXdmIF76V6JL5vbHQmJcnlF02ACI0LWHt+fgIQzts6jWIFoWhM6MsSuIOeTJzAV7cKWw0zidnmnz4OkqDRW1E62NzjSM32rp3Cajg3xzXlpnubWTTnnh1fjatStuwDChZ6CpDlP8Qn3GofyH8n/c63FrcoVFy4CUTgz/Ko3cTMBh+UIZnFw0Sn3VcOGuLm9xq1QksYHaXQxoCLI1vdtKSLhJPw+WgFD1ZtrE52vw5A3UU+NHJJy8zQ/InUYDLEA7mTOuwQrxzFR4bowyX29qdCjhHNbBA9OeCWa20A69Dzc4FEm3fPyHZwjRL20LRdKxFKQmksT6HCfEcoyAhABeV4M0aaX/e4ZyclPSmUOH6y2FpNXU6bBMkpXyEpaKOXpEHzi4gsuliOO9AgyednTRs0ng0vu+MzAJPZpQDCsvN/ieatOGkwqJJt3bBwkjSvEg3FGNzLfMdxEm3c0wetQ6ftocVGEHjgQVKqc8xO/Z4+SsH+aVnltRnHMYXs/zzktWwtT/KPfoGNBumayHh3OZAxUB7QqHyCv3wHV5aMw53pwuvYFMBzfnfq5ipwZPU0dgKx4imlc8hP+RddxmucyigJ/Am1fU4nAes4ND5J+fGL+NBGcA48B61WAISlhJUC8R6MkCDu2G0lxAMpTdQG1TAQj+Zlr1EP5haBTq6GIHXH2vs5OYVgef4/j7bLXZ4FQyQ+ieWT6EMR/ZVkbc3S1R9UIAaBqg1cSAls3WP5Cq1I2b5RfIISHZGX+IyEtIWno/qLtiFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TEIr7+tZE7lfzInxYdvDhfWTxI9axJvdemI+wav7bp9nUnJb37ETwh0+oxc?=
 =?us-ascii?Q?phu8blFt3oVM6DY+aOKOAidpGvR2H58bmrPWGdtcQjS6mEvN0uD/eqPeeqlu?=
 =?us-ascii?Q?P0V1r/2nxyIamdoN989gcZ5hymdvHnNK8B3AZ+mD8Dxm4AbMW7xQ0hcwh0ka?=
 =?us-ascii?Q?ia8etke4On5MBLCCB+yY9nSgPN2lXO/r1bcmx9UJAkseWeXr7Dbj24NQaUs1?=
 =?us-ascii?Q?3Amxkyy39melfeN+B5SUUjAb5EabRURkWW4vY5KnkEe0kjW09fCcomwQ4vd0?=
 =?us-ascii?Q?v5xvRqN2oyStFpd33g5SpJiHVh0K6PA1IGEflm+7D0FspUJhUCMsjLI2pg4a?=
 =?us-ascii?Q?pbDYp+UdgBFWSc0fT5nT2uGOsxsdhxSukGc5YfhMxkTqQVz/lE4yij05m8yi?=
 =?us-ascii?Q?zvWpPsjndhqU5qvvgnbPavgSwqKbTNMyEb0YBG0ee2QxeJd53GFqh6LJuKVE?=
 =?us-ascii?Q?VIR35ZIee03939VLe6lffHwWpkTxvUvRqsmBzwX+tUWhBhgmikDnfCbll7MW?=
 =?us-ascii?Q?Wcb1++zth/BSr0ifJav0yTc7RIFVOBVmX76G8nC1/b9jtJQCaYC2cF8eK7GR?=
 =?us-ascii?Q?J7qWNwT9qrfafag7eCIQnlCAKnYSeI9flF1ZO/kWStG1Fu5j5+pQzqSI8gJn?=
 =?us-ascii?Q?QmMrHH/9rLywcCGZiFgNY9jWwCKWkFMgdSS4t1WxzlrUaOrvCmfAR/Xd4UQn?=
 =?us-ascii?Q?vSaBmtPwo/uPOjtyt6MvT9y0UPVrFLY22KV+368COxXPEx4PgF04BvLQasW6?=
 =?us-ascii?Q?roPBlpWWNLtHFK+iv/4YyzNq2LAt39YResZ8rNxObk+ZXxPNqGw2KPzWy7gd?=
 =?us-ascii?Q?zpRFmQOFZkLU9VAN91NCRH7hOeI7otpIulgoBEUV4mi3Tt6GUDKMx0FWD5uA?=
 =?us-ascii?Q?3u9Xrj4N4sqqfW1VouS1yS10U0hYFFIp81FFdd8CYd4WzhaxlUCcgfZc1tQE?=
 =?us-ascii?Q?1/oGFlwjAFR3VDnKjg4y+9RGEVT7UaHKyWd+AxheozWCiUMxV/3aZSYaSy5u?=
 =?us-ascii?Q?kE3al3PpSuW9Ama2ch/goHfY18kkGYSYMyNYoZbJkTPRQmq1liNtERqzauCS?=
 =?us-ascii?Q?1XAyl8V5ndF8EDND7OjHLMFoGpN/2dvBLJfJcq+J+ayzPQEIzjIpiSY2eaw5?=
 =?us-ascii?Q?FnjfpizWMTNfFCvsbCArl0feAYo6X9cUhAnUwTmzjklatdcwTqLxTz/9hFY9?=
 =?us-ascii?Q?bZWC1vBas3Fdz151Dx0aNVNWeSVnvvlbmb7vfWsqmSPfZxPrBCQi9jBntN8L?=
 =?us-ascii?Q?W72aZJi3qr+JUO56f8Z4JX2PnXfYKQ0JohODOYvdge4z2HWmLVQSSGNv1nKd?=
 =?us-ascii?Q?I1udHbYuh3Xy5wOmF2bvdwLicD/UjzvA06rrXwNRckSHUdpwxnVdvX53QMq4?=
 =?us-ascii?Q?QI0Xq9z0WBAqaeXrrnZ3HGRG7AOqVFkABwyZweP+XaxzwZ+4eAh7QZ4wALAD?=
 =?us-ascii?Q?D7rh0zFS8BM9zr255QPoQbi/9Q/CDXFf3Nvm7pKpb2aC1HIe+pAVrB6TivVA?=
 =?us-ascii?Q?iSqej1fH7ocs0HawNrjaot1uVwpQe+eB6/0PfEeM1WuoN7/gjBVYIF5u8kM0?=
 =?us-ascii?Q?C6qhXVZH4qxtBI2gQxEdeWNyqC+zmGcJqqNotqXNXMOd9okTVPVlSJbb2+uO?=
 =?us-ascii?Q?8bGYHZhPV5LddAdHElqSKVM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ced4e93-8c9c-4270-27aa-08da89a70d2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:13:00.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHZca0H4nuLnrd+f10RMEn0gcOU+GhWuf+OxEU0a9Wz2hz5REBb0bLC2eG7LHahnuEdQkegMnkN3qBqy85TsKANdv9YroH9whOor3KZYep0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 1874045c51..eacfdea4b6 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -526,47 +526,56 @@ static int parallels_check_leak(BlockDriverState *bs,
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
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
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


