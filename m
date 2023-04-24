Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C196EC90F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYR-0007Z8-8b; Mon, 24 Apr 2023 05:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYM-0007Ya-0u; Mon, 24 Apr 2023 05:32:10 -0400
Received: from mail-am0eur02on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::70d]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYK-0007RT-5k; Mon, 24 Apr 2023 05:32:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM6SOFogrpR7axsASi5tIyQcLtCSSa8301huXv+dYeXlQ29aE4MWQ2oemGDsrNPB2/liuF7TadwJMbkEJXnFXlLA2U76NZE77FB5fg77ReKr2FWj6JLmYodQr+2/HOs4NqPFUktt/5lohnMyI92zATx8ROQbw7XqBY7G1/ot+llyyQ89jIwvLp4t7pYMHKjwWYFbabH1fGQU4UbSDqQSB6/fZKeZS2lQgl2CKvns1R0ySSaHT4Zk2892JYLp8RYrkHEJhI5CzzEqASljb6mW3l4gLmjK4WXc7rg1SWikrOaOvPvtIbsU3VOe211iCWFFhMpL42C2q0HwI5dhuFvFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CawKWs8LqUW9xPfghs3zWz7WiYV7vklzsUxCh5g8+mc=;
 b=KZEFr/KiLEx37K1mKeb08anhf3DNVG8+vc1vvdfRChp2M+nlUGIgKx0Rmv2cjpNzR/wYkLjO2rYs5/yitJSeLQ75QFrEH8ybibNtwwaPm5sKnswu9M7wpIyRUOXflCmuoloSnQqnWHZcB5iOiZLDkpLCviyWIKGmj3tm5uBCZoCbINgii2FFWCThdZCb7R38ljlfla5uco4NITFB/42EVXSAUEnWRDP4VCeLGC4wgwz/FrEvb2FQhRbYArDMA8pNLia3BP0/qRjshmrxBgaio7w5S+wsVbOtEU6TbCKIoWNf0+vwbJ9mjVGmtNt52jKgK2z7Au3EiZbaCanfg4ikyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CawKWs8LqUW9xPfghs3zWz7WiYV7vklzsUxCh5g8+mc=;
 b=iIgrL8FpVlR2lKn1spb8o5u96kAFcZGxYnG7CU0CibjnIrV3lBYrfe7hIpT0M6gljQumzPPPbRR1+1UFStLBzM+ztjKi/CBtEq37tx52P76vV4Wge/aED6jnQyXNk/81Fur/f2S3nL7gd8vjINWIRyHzFbhuzgzvxu8k3+SiCX5J4peSMHjfTecfY643EnWh1mfXXrN+bOYz/Aok+hCXQqYMTnjC6mgX/+o6NkIlyg9z2xBtPIQEG2Rtp9QsBTdn44e2++n0WriBiPdI9KOk3rSSqS4sA2iZIW0UjIdJootZ1J6Fpy8kE5T+aCGYkWl172LDaEkbiGLtZrDcIEZPtA==
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
Subject: [PATCH v11 02/12] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Mon, 24 Apr 2023 11:31:37 +0200
Message-Id: <20230424093147.197643-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1fab0470-d323-4cd8-8e4e-08db44a6bfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7LLjs2wuulYMd9wC90upQY0a/BK0ZtDYwYUeOZAb/m0pxxUSre+RTZiT9RtZNxeUFr3xkm4iqbHzoY0DKfTjW6IBs2Fqu6dbelX8AGYmgamrN3ulWuD6VU8QR5KYdaxsSKf+p1k9aRfSPw+h6m0/aP3WSsIeGahoPyLnr4KWuDPOepfmOVThWXWCNLrioTFsf8nKNojS3NNWktsTw+/SoFlfOQdDji9vX8vC96yEBYzE1+q340jq+ODpucQkaRrQXY65SUtadzZdYMvkDl4AuHP3kKxj//WzkFxxyc+0O5hq7zlmmMFAma/Q+pkuUChdtep3RsqkPXw5EBU/lRSaUrHEhSukd5Q2Vv1IZuhGSTje2sAs8PsTNw/wyhNDfK2rTB7rfLs9qd40/G8DDzOGxHzuD34rUx88FW8H1OTGzwE0fXlqAavGTUBv8U6e+1IGctL308Iq9+Fh0WSCDObMtzhRQK3FjOeTqXxqxPuOcbpJMOgLVSfnXD48lf0ykdmq5G48PsxjHQABJ9UyMnC4Aa042AY1RJtPq6+jehQY+EXYez4uX5wj7e+aPHBzQszQzE+hrU/SqU0HPUaGp8HiAFPh95c5PV6yxwomMp5LA2AqBKifRMOODqWedgl7g8i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(4744005)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TKEGcbFbLrRXqY6ngf0Q73LWAItk1TKU7ve25DtB0mRyBaI6urmPcfbemy/G?=
 =?us-ascii?Q?otQEIwDCYCKlOubUzKm4jx1b7tvovT34HTYleLM1mi0oKSip6YHMlhobAQO5?=
 =?us-ascii?Q?J8tjK6VeaRwRtI8niUwuULHDkHxjqaGjdud7FCcX8qsLI60J+/0yO/xgkRS9?=
 =?us-ascii?Q?oP9CKVRtawMmOcNhaBbMeioofx9ZIpZQKi/ToXGY6xG4WnZcjvCyQJA2WkJe?=
 =?us-ascii?Q?98bP6eBXTktGepEPLYKuBX34kH6Rhjxcmyhw0A2VNPwZ+kJ1NiSHpC5j5O95?=
 =?us-ascii?Q?YsP64nw7+gs29dZ8DRkqg8I7yL/amINn6iDsrHoU53M3zdnnvenrBIsTu2Ea?=
 =?us-ascii?Q?ixS8ajnLdhf6xKxsZGV75a8sJeLUtZMNnoC9claz24QCUlpUG5dcTXkYdwkP?=
 =?us-ascii?Q?L/TIajtOPIU8sJJCZckjGyXXwqsbPsDp5yoFNUMgW1qIOMM1wlWh/WBzcYcv?=
 =?us-ascii?Q?gmYO+EIyrPZDE6H8XudTk7Ztxtqdfsa442BmYdAsEtYnHDRUadRscfQOENYR?=
 =?us-ascii?Q?zXGQ9NOoHiznf2yaxYxAL9lIEtkQmVWG1Jv6ELH20TixL4FFLSykbbD+C0f0?=
 =?us-ascii?Q?oSsHRFXgB515kBBhq8eRm7vQ3h3sWziVSeavIdj2mTTqwG92QiQcVp1iRhwy?=
 =?us-ascii?Q?UBvRbyBxWtnnM5rw84Z7GmrgUgujkcRlv2y963CclKJLiIZXe5ppK7MyzTct?=
 =?us-ascii?Q?WJJlhNPe78gdSfGrqKojmw8bkryKnNc54oP/yZMuYmwdOKQSa6rDBvfpPz+I?=
 =?us-ascii?Q?okZvAyA1Q2Oabn3e1gNMYtSiJjd1AdkLRo/0DEWh7beF+ksqXg+I1Mg5lGxL?=
 =?us-ascii?Q?hfjBK6M01O0kifU1PjZN/7VAt0fPX3CXiY13UyIqLChhGvdYzYfYmtIFsaA9?=
 =?us-ascii?Q?K/NC+Vl4wbxHVcrTPpx6qpbHQfsdZHCF+LgADfBSOZTBkQSFU83xnUx/WIUh?=
 =?us-ascii?Q?z9lNS9ugeYuC9e6Rejp2QRvhklD7IR8VCRFQDRj904t5IssZ7DmT6bAlQudL?=
 =?us-ascii?Q?fMEcfOXrMIoQmS31evMyqXFdeNjXTvBN9J817lGclYJjsy4qvPkQQT4sgQYo?=
 =?us-ascii?Q?uZGO8r103k0oeBNniSPDlD9SoD0A0RqfS/k9eQizmFV1jh4aezJiXnZZ3248?=
 =?us-ascii?Q?gmoE2C8hEqGyHxEo5JimtgTlW676OhAlJA4H4ZmXwk2DBeWs3eJ5lmmPOleZ?=
 =?us-ascii?Q?McidY5AF15jrX2wILWFh6pZLgY4WRseEXeW6suVIDocA58uh1/PJ76yeN/Fg?=
 =?us-ascii?Q?auAxFS4+Rh5Q+r1CLtkncxS9Bn0PZtIYP9WK8CL497fc+uvCmqBKByXY/ZKp?=
 =?us-ascii?Q?k3Dp1DrKMOvSp2XseeSUiu+xATDGnOJMOmCzaYdI+TRP2WLN8xlZZvpzh1xZ?=
 =?us-ascii?Q?ay3PocRC1pwotgyknnF6wm2ccQqJz/T7W0szlIRfQsR4oLbpDrvvfsSkcxEc?=
 =?us-ascii?Q?zDVhnOlmBH1do3zmGUahQAVKDYLNKODR1p7q3T6Pl1uBGkMNxcbafV89yw1U?=
 =?us-ascii?Q?3o3jDrmRst/IoQFS36YaakSDfaVILcSDAqrCm7/qdXgkQaNU4FRXgnbseh0u?=
 =?us-ascii?Q?8yHIGiJfjqXYEBm/Q1hdqsviLGlU0zbXohMOVCofJsb1KSRLCSwEQXo67p1s?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fab0470-d323-4cd8-8e4e-08db44a6bfd5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:31:57.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQmTt5nqtGMIh/JvSta9CpBr28vtqGnCf7d4RT3W6HNPj7BvEcePLg0/W+8cR0sxbvNBjoy3NB7VLcsp81QwmntVyYMFrobGBU4UYr+KMnI=
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

Don't let high_off be more than the file size even if we don't fix the
image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7e563062eb..4d6284a314 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -462,12 +462,12 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


