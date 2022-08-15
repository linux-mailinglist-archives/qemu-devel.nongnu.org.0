Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC4592B30
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:23:36 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWJr-0007Wc-Ib
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzf-0000VU-MN; Mon, 15 Aug 2022 05:02:43 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:60736 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVze-0000Mn-0T; Mon, 15 Aug 2022 05:02:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzHJ6Ywueh9BNEr6xAeoe4bClQJcVB+m7ZknuUW5dt3jirKdVNjkFGbM1P/aE7KV4bpol3/PTSl1qMzltZWjk/5j0JzCOAc7Ts8k7fZ8brtseLrrHikjParEY0yQt2RfDJ4LUVYLhwk0Z9kQsd6IUMLmVcfDAwLW80f+vheXQEmWQYHPToHpR4Zo/BTrmLTponSaANqM5vZDA+T95UTFllGGSurD6CuECoNYOjfH3R8VPkSxpqxqjBl0V3ADZYsqLs5sKGRaoP/+qGh6/H2RzEVNscaBMeqgLyXJH+eMx91es+KZOjiBE++mLv00WkwEKZ/48W/3FNSGYhNhF4iZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KgFDbBT2cKH0hJyZWLKFPlpKhoPRkv5nZCGTmzztf0=;
 b=ffQHB0WDSrbDkU/lJ8SIwOK2qJUG+VArdUV6hdPKedEoz+OiEkSI00QHUmYbJd8fx+nnhUk/eP132buttDb751D7cv/DWo3MDJsKu6LzbmAKpEz0P2i/Wr25wLf+6ZGfgVU/flMrfDEpXszZsqMDnEKkCaODWsMu9ZsMUDtrH08+43Ovr7llpfVCA4aDrHKtULPbYw0hvlnPd/ZEW7M2iM8tXxC1rTBDnu8xMcULsO5liY1VMvvIUKiTvU9VKLCRsxuTQSAzsDLibYhDeNGC3YPehELorldqQW2tg7o5hwscu+yd/6S0R2ZnvMfLD0IVdp/dJIp0FQB15if1xNd+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KgFDbBT2cKH0hJyZWLKFPlpKhoPRkv5nZCGTmzztf0=;
 b=NW57oFa5G1nkVMA71vRu6r90RhukrXUdd/C+YNwfZbTgfcmiQqI8OEKhhPyx/QeJ0SRtxN6x7V+fDtOHvkOmCVCc9JYIKO4ntDfyin+kM4yKVGI4aM+cFjylt5NzIOd7ZigaiVoSD9gCINzNIZN+6khkWi8zbKIgvNcglYqB7xWyxAh1PNnquda0P1s0rKwspCC5YOGe8kfsuz+jfNV4FsILb4D8Ua3Ftd2BGXRfJKvqKxzg1duB+RXiuCPgw61vX2F8/XH0N8mxjRv8MyNqCi9Kdz7nI6ZiudI98Q9VYYRAB532mI5QLnMSxE4SBFeTOqOd27/oi70lI7ANcycVoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:29 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:29 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 5/8] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 15 Aug 2022 11:02:13 +0200
Message-Id: <20220815090216.1818622-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4159cf5c-2e81-466e-3911-08da7e9ce19c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATkH+ZwzMW2ME7EoXx4fFS1eURpXvluAq2eAVgzDSHcdLWrafv5yWLkdJG8Wet8ge+xSvVpeylAu62UxAFTVBu0aqyKPYlXD5fqv+j95s0H2YGBDl5DY07j9aoWssuQlm3XUH405KqxfeQYivBV8v/+FbhJrNgxTYtXm+XiqP8o58GZUS0fqj/YnlvD8y9y6kcJ/uRRXl0MI/BveEbM1rqFieqE+FldMLPk79xTCMolGqYZA2hdrPAAxxcAOAbG7tqHuOBiNsB+UzziDEbriLdev9xVecNkMLqpXKHY6t422v1FKVdzz7o5cls/P4HqUQS11HsVNAETqmhafmBPv0mo5Mymw5n8cG1CzJsuXoAHIEWrpuP0TE/oGZ88TnQxodaUlJvme7GXpDoDUj8xOKQSooMvVbTS2mvmjMqlF9Y809JO5fzNIZHA+jRqMVV8GfDcoGXEivIo2SkOqD+6ffq/TOA/muHQrCr5qqIftwtooHcXh/zwDk0vZbK+N/+qqbGv4N5c7h1BR7Pr776Rh137e46rM2GYYoV/k5cmR/pszzWSeXPcy0eHMsU0mb7YchSMZ93KcZtqwD4GGgLKvVz/NLpJu1U1Akn86flVV/Dy+I/K2xzoBbyt1zAAMlme8s5eR9U8nptxAbENaAweCfBw5a2D6nKTMEZ4/9/zkRGALZZ0ru+7ozdq8mBM+nT4l+fGF3Akiv4L3zqpd/U6BDcpxX27buScYghI2p6T29qy+58XyvqcBOOM0eGB+3AHOY4IQEcQSVHomcZ/WNEHGQNoC6rKtxlguNuP8VpR8Lb9f47mIEmET03bBsQUqo5rC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nWL9DhXPet2zxz5P6YLy+tNMExU3BbTP7D1VOZHTl2Ltne1KpEaf/1UWIeIT?=
 =?us-ascii?Q?hoEUQDcWibL2IPg9T3WJwzD97QHHBspIwwOaqWO06lKgL8C0f6FmPXp860Ub?=
 =?us-ascii?Q?bgPCzTom6mPX5apxH63rM/W734fbvLROkWni90ayRUuSINvlKPPO5iWU456y?=
 =?us-ascii?Q?IB9ef4TLGfG2RZ+jdGu8uWq49oxxuZ/oUqamDA/HiLfLT0sIwya82++2TO87?=
 =?us-ascii?Q?31iyXTUM94XbXJek6Srv6ZN+RvjMnjS9o5dLJqaQCglZyzVVNBzYtqDXuHA5?=
 =?us-ascii?Q?ysQtOt6aOyi+Hg00Q3k3oAsM7eFfAIN0oPDg4R6tImDvKP8RVN6po7VoEk4v?=
 =?us-ascii?Q?MHWoLPLxY54Se58bGlQYgnP0VfkZXqyY6i2DBw/AYn6Oc6KWhfjV5dvAUXut?=
 =?us-ascii?Q?nVTz4iShCwVcnNHNfqNP0pPHCqejdfrKFAAimfrYgTrDpn9vzgge/dXZD/yY?=
 =?us-ascii?Q?RQp+q/ib1jtGzMr9SDNSs/OOGA8GL0XlPRSKAjGWv0jNEeL2dSzBvMVBvqLy?=
 =?us-ascii?Q?fFj9fSjpz8FO2RPkXX3WVz2UJ2CjQHNbUUIAhCHe3bbkHhp9JuOucTK3SZw/?=
 =?us-ascii?Q?snCuTGn5viGyMfRxp07whTYf8d4Q7DvV7JnP+nvpIXoE3lIeM/lVxXpKIC91?=
 =?us-ascii?Q?LZ4gxIZmFyfr73Vz+C8nLV+ayqig1tgELsq5g3CLspj8kaAz7B7HQdoVJl59?=
 =?us-ascii?Q?GXFYwkvNpvwVkTmTWEHKRvLQ3BuuAB9nwh32s84NVoo5k/XorVI2KeWDwB+L?=
 =?us-ascii?Q?kHqZdDob/gp7F7soLXDHCptfBM6ebCse/q3mjO6Kwhuatg/DzVkka9serc//?=
 =?us-ascii?Q?UbxpFowgMF+RLnS35GTCS81O3ESGE7qyhIXGmxh/8agyuqrj9CIhDUqvIN8H?=
 =?us-ascii?Q?eH0jIFXeV8s7O6QoED6j+3T7HIzCAkRsaP5k4hlSzZFRv+kkpM0yeDx56NF/?=
 =?us-ascii?Q?r5KS3dMu50L/tpQsVJVe7j7hTw0aJbVwKEa5RHaymvIu8HLiGwOFpITu3HSO?=
 =?us-ascii?Q?uunVECR6eZx5muYklMCKqYPoC+aufuy8flv8JAthQXNEx37YJqtIZaEUNMrY?=
 =?us-ascii?Q?D7/KI0pDuB+krl9OY8EwB86FvdOBRdYzY7JdqBaq13a2Md1ppGp9INfhJL8b?=
 =?us-ascii?Q?Uys8po//w+FbvmBKLm+kBYDPXqgVRdBpWawAZ64/tVkvScCtNfdZzvz4HYtp?=
 =?us-ascii?Q?gbvaM87BYo84uM3lzBUvH4yQjNfZlpX0QeUO1ysUkaCzU8RGLvC6hj2Y9j2w?=
 =?us-ascii?Q?Oz/catIP9KIynvBk52kiOS6XD7+8kG17vyTpNt8GIC5x5qn4nU+UeubYO1ov?=
 =?us-ascii?Q?JgDT0moh3HS4juaqgOdoGsRYm6A5OAhJOHstqzTOweO2DTWVT+Q4v8CPBSJx?=
 =?us-ascii?Q?M94RLPFGfxHgPYuYO5IE5+unJ1D8d6+4jSbt1E8dxKA+jqCWU+Ge8U05l7gi?=
 =?us-ascii?Q?7adRloCNGpbwcVUJF7jyq8q0BCUbDZnRwNMzl8wH2pXcjr9KWcpuJAOMTkWI?=
 =?us-ascii?Q?+C1/8wXbDlu5G7TfUwvgCYy0M2FXLBu/AQGtI5h187QvggkhwUl8WXlQOnBe?=
 =?us-ascii?Q?s85GuUGuehM7IN8hEKa+eM5GtzSIB8Ngf70dRIGRKhW9E/37yzhJNiB7zCCA?=
 =?us-ascii?Q?Eg8ZeUw1j/mEJKPVpWagn7s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4159cf5c-2e81-466e-3911-08da7e9ce19c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:29.3643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/69ApEs1Nc8LVfdTmYis6aYkZV04ebp4+yqwNksYC+E6wmzylWgb13M4/88lb1ChW8kykyj3UnuD/RD3SM48buqWIgk4FkwDHOO6N6xAlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
---
v2: Move unrelated helper parallels_set_bat_entry creation to
    a separate patch.
v3: Fix commit message.

 block/parallels.c | 48 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c53b2810cf..12104ba5ad 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -439,6 +439,36 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
@@ -458,6 +488,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -470,19 +505,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-                continue;
-            }
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
-- 
2.34.1


