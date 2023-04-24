Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B156EC8E9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:32:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYT-0007dQ-Ps; Mon, 24 Apr 2023 05:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYO-0007ZA-D1; Mon, 24 Apr 2023 05:32:12 -0400
Received: from mail-am0eur02on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::70d]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYM-0007RT-Lx; Mon, 24 Apr 2023 05:32:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFlHB1G61qlGlovHmYiDhL0T8NutM+A5avxqCOCMjlYheN54OGPt7dbXTtfA+bY+1eRsuhtMeLFnIKkEYqGdpzxq+iSkJd493ERRu907wV2otAEcd9sCwORBfksOv+X2jmRkNhccCpi6FEPkWbEyau8zehTUrY+Y3A2glZi8I4ZGSOLiS3ddMb4P8f9S+6IASQsRPFyjWKFMeQ5m+LtNnGBesjpbMKc1lA6a1PBVp1mHAeoALQzOhGbZA8/P2LXl2YFxo0RA6doqvAxttFFj08vNA9wYMgjZcWKDI1Iyqjq52hGpNOs+1SaM3f6K2o3YyCsm0KhKyJCegg8/NtKMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXOwa/L67joB3+1DEfpVcK72jpfn9Lr1WBBHTA2x4Wc=;
 b=S2TLmEwfJ+bSEYwPb4hArQys5rKQ+ZlK1hY3ZwILFb6iZNAM6ZAT/0q1xtOTNUzn1y3eAzSxMYKOiEK75ukNU3JTgy+KDZ8duk2uw4S+WwDst/Xk8LKS3kBZjhrIlRBUSbp9SfUz+iade2XuCVsZyUaGGdmo71Fa842SFv0pNSJ0xSOITpk6D9JOnUBESLVphS64WqmhAK2RqZNiWScTDOjt10V4+LhpPI6xRuTT9/HuL9hPHnwTzUo9VOL0zo3Gy4YWSHHClPG8FUD1Yi3BuwL5BNQDUbMCYTiexHqguFFA3Dh1i7HK/iiJFDAjK8b7L/CwiM6fNQXzmWPOdtNGIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXOwa/L67joB3+1DEfpVcK72jpfn9Lr1WBBHTA2x4Wc=;
 b=POQVLNn6npe4lozRJ5Lf4lEj0+2qKgzy1UZvdN1w9PttqiWRzXx5DiIKzBf57ubXwUUF02va457dtDMphQz6c/yLbOJ3ah+1dyV9SJgKxnK2qDtXpntLZp1nLgrCTBh3bUiI47OjtG64H30J0Ilyugwz9j3GsuWU6Wk8ami9KWIhp2/3vX1MqcB3RrijDE9tI/5U0lABKHXJ5AWOH3rPoHnP3iRI7ype/zIJHdjLU00nHmUwz1Y0MR9yaDFng/iDdGETWC7eC3HMsnBNMQRLDa5lYNI5UO007gVlFk63XCvINASURx3QxK8K6kQPQGu0AUDOYH4IYPQhw18uPFg12A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:31:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:31:58 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Date: Mon, 24 Apr 2023 11:31:36 +0200
Message-Id: <20230424093147.197643-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f5d360-b0d1-4238-4a9e-08db44a6bf4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvv302h20tkrhRb6nJsgOxV4cSz4y75qCxjTV/xpDEO8BBu9c4KKpAmpr0Zl8PR6JCAAhGbzKZj/CcjOIxm9mc7/LmPiXqyeWlCUVc+Lp0tihD4wcjuMYrbqwgZqO0f9UpTxayfNY8ItTySvl1PC0Tx1iqVi4ewMS4U+tl0qFIeMWhygxbxf9PJsz20egRQ9h0HJrxJarmof9cFIpoBRh1yExV9j2DJyY8Ylkw0fqlCX0hN/JDHLCUdJS35pPwgaV86tdgsTEC2sZc6j49N2UKQKTpArQ97qBXStROyj+jQjmnZaRImYHZEDiLnXdJ90FLogoIF/Q2nToZqdQFmYU+EvGBgN84lNoYxpb/8BGwaWKEolkuPRuY4aqGAm1ubDl21hvZfBHnfYRCGfLD9GX98NyrvcYk4WZLK6gu7Zg02v3Ovalwfg5xa+NVFfIY9bEz3rUeslcJM8G48h7oymrFcHX4R4BgJa2NyMqDGsKwLa4+rNgDT81Wp1oTpjxoNkIM2gMVsYu+iAOMARPsVtCXK8MMedYJcWjS16ViHvA2S864RsmL9EYRL90Xn2Qxjkls0Ib6/NGmFmsYHu2IIxYg0EacDoL993Ro58bcK4xgo3yp5m+ruwdyrkMv5vuK0s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jSQqf3YL7cZg7Oo79ojHnB1gzXF92GRYdaDYiDFHjI1mYYAFAxvIairqF+px?=
 =?us-ascii?Q?vEp4Ao/qCtQeJ6k8AKrBLSrK502DRy3tBdWKdHbSx96gxmuUV2izB2JX2M8x?=
 =?us-ascii?Q?52+ymMR3O3B0uTn3npMNLWCedCE9ULBETUkFQFX7CYruUdjvn+7E8DzpfwXT?=
 =?us-ascii?Q?Nnr/uDZ0bga31VHv5pFgfn7Lg6cTsgIc3Oyu4Vu+hjMfxCEDV9RSE2x4vRW0?=
 =?us-ascii?Q?00ZMOtE6l6dQyCR5TZCnXEF74n+ip+ggLmgKS6d2FxRfLeNaO62Xz8944/s7?=
 =?us-ascii?Q?YxMxa+lSvbHhCGEX27SPfXPsv59/Ye4lm6GP1N6KcWqCqnzvnpvHiS1AqvBm?=
 =?us-ascii?Q?ctWfexDBicsdO00CbvoWf0bSq+VidKQNXxKhIUjAz8kHWM+BDDxDgWMbP54B?=
 =?us-ascii?Q?8uziMBSiHl6Xxw0DSYqkB83JYW7p8CQojGf5ma5HgYrjFgO/RvGpD6N5WVCy?=
 =?us-ascii?Q?vi8XYBqTBOzqKk1oaGE8r6S9rYzIKHCIXGloOgCowIVitU982HRlrjKdVoAl?=
 =?us-ascii?Q?76prropHKQJUm+k5mschMOgLG+6OuzNIBIB0DLZY05aGyLQuz6mAVyktB+i4?=
 =?us-ascii?Q?C3nN89hYH8ugKp2o9a001AIf1weQGBxz+O9SdIY7W6UwQzLxUxm3o/Pr09Nz?=
 =?us-ascii?Q?OKj7haOnNWG6oq/Jna4kWSuZZ5RBMjQNMzLeJwi4vCi+Z85aGmMMKdA4sWCH?=
 =?us-ascii?Q?H0GYKWOUDoFU/AGQ7SZmDtxZbJWhA3IBBZVqetKZjTZk50+XXv4uerswuIoq?=
 =?us-ascii?Q?mPUigKV5bV0IRTe9LNBvWC4mFIUZ3jU021zkNaHHTu3wndUAGiovUiLqL3f0?=
 =?us-ascii?Q?mPyi+ETEtXEXKqlMU0sHSB9wnTcyfbPkOI6BkHYWSEEcmlAu7jP2uNbyTzpF?=
 =?us-ascii?Q?3EKin+zu1fn1uex/Zeo177M4zKU9RTBgJW9zdUY5rJ0dpqq1yHl2KofoCjIu?=
 =?us-ascii?Q?3UvWgO8XaOZVAEp2jwwgS6mqajmJA+Wd193jyMbCEzlpz5Tin6LcXNT2l4Zm?=
 =?us-ascii?Q?sLYQiSSnke6p3f/7QYYkAjOFt+2y9xWtmF9ds9PYxLAgGI3xBN6LQsL07RJP?=
 =?us-ascii?Q?YpdALofv3l1UMFaKHVSgWmguWJ2epk4lEMayXEkJqK5GXq6W/1IA7zKCasuP?=
 =?us-ascii?Q?GfSBOcbUWUyKdCF7MTYPxy+6foneFAsBXrqWcTBLiVXRiMqE1RYCpN6uf87K?=
 =?us-ascii?Q?25HhQ4RGbALrRnZcRBr4U8B7/XQ5YPmeAQYtbD8TbbxQwkSbYzKdcAyn89K9?=
 =?us-ascii?Q?fCy5jvKC6AhIBxNNXbO1gtLb0Tt3EIyX5OReHdApbblPLwrAVGWoQzY2lULk?=
 =?us-ascii?Q?Hsq2t2misq10om8ks9pQGPU+QfTdk21rVfl4cu9HFGOwA1DaXycJJpNnOeMF?=
 =?us-ascii?Q?Yea9z9zCDiNfhyWQM8oc/sYD+c4MBa16wAxtlQAW9TqiR0T7QF5L4XFSSSzR?=
 =?us-ascii?Q?yuO69YTaxnt91osYoDkcKSFi8XH/KuOhP9q51etnG37z1QWrL550k6pCh2ZC?=
 =?us-ascii?Q?CMeBOqHT++C5YTBwkzRJwwHPBDbik5DdOtqEhc+aOp8+6ikZ8qACcq8hZXIS?=
 =?us-ascii?Q?oerKmhdAudcdIhyQ5fuELz1QFlqVqrA245roL+QlHlRPDJQdgu2Zp/9PNWH6?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f5d360-b0d1-4238-4a9e-08db44a6bf4b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:31:56.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2dasGfPk/h6GvYKr9K9f0F/s0R3+QfCCj6lst/JZ47WZcIq3bamusB8w6dKETzHR2hth+0Kj8xP7f3MuHMOwDgqgWf/FTagj1qQBz7s54s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will
create the cluster at this offset and/or the image will be truncated to
this offset on close. This is definitely not correct.

Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image). Set data_end
to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 013684801a..7e563062eb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -733,6 +733,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_nb_sectors;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -742,6 +743,11 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    file_nb_sectors = bdrv_nb_sectors(bs->file->bs);
+    if (file_nb_sectors < 0) {
+        return -EINVAL;
+    }
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -806,6 +812,17 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_nb_sectors) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off << BDRV_SECTOR_BITS, i,
+                       file_nb_sectors << BDRV_SECTOR_BITS);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


