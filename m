Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814C5A4655
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:46:34 +0200 (CEST)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbLl-0000dh-8T
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0i-00060m-Ae; Mon, 29 Aug 2022 05:24:48 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:38848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0g-0006gk-HM; Mon, 29 Aug 2022 05:24:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJnmJvqHGvJxXaU3hGA3gMxirRoT4nmVGhFlkqsAUyKOCWQw0eRk2VjnUoAE0WeNbI5JjZdXECoGjVII4x94Wl1b3lW+Zl7tmbqBkSJxfdvX/X4FLMHno8kN/QyzMJSnjd0DA+OYmHuZy1F9x3WUR5uG/YLrmCTvkbJJfHztGoCme5Od2noQrPZhWxIxNIcYYWgHXMYQjq+pTqxd6ySHEm82UHqQzmub+YfmstoX4t2wBjrIGVHd5g/lOd91gJSdlrWsbWmJrp55CeAjkCk21L0eteHr9jcWlsTaweKdMisEb5ZxFmt0AKKjyelKTiLsMvL66XDmQ9ZdDXblheN37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHDIe4Iu3ENxd+Rq6crXwWLf1mk2dxrBPElvAXWaSC0=;
 b=NhggNx7ubWRthHlJkNaTV/BpAoB/5l3yzbji63A6NPvnjWRF9eMsNapwBXgkDjjkB9wrZew6Mrw18T/Kz9Ah0SnpIbhxppsrk+T9akPMNDXKI0enSvetCWlhf0wNJREiP6CXppRo6kFERnBf6f/eEfpcwjfpkrHIiv4RwqCWSVW571OYcGOEmhc90/pm6ZgQw4REJxYDLFmmlPAdZnNSeHQMXZTFkJMgYaZg3pgFMIHOttqRT9uV9KazHwRuH9OuJo7bxlpQWZz1pMhOB7Kkveji6rmQipOM/nfmo2OUl82Sfr4Mehh205GGqD6AejHrcg52KiPhss/z7LBMK+Y6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHDIe4Iu3ENxd+Rq6crXwWLf1mk2dxrBPElvAXWaSC0=;
 b=exttNt6oQ56YBTUJSzNFW48NIRNjra1y0k4c+7k8svfOnvxd4+G3geqGIA+F7zv8x9qO2VpVAcD1jOdW1j/+PngTTQtcHjLr3e6cwnEAJ0P72tPrkbZtB9E4yOgdzWD94LOP/EqQqKQQtHyqLPtsDYR++k8F6u9BSGhYLkLQFfQAYTU4XruXSYgyn63K9HHh/5pibJotAIHamvqbIJiNmfquHNJeeaRE8sPwoPsoyuNkkchwhUEqXUfP4ZPkHnRuuAfxRBuF/mQePzPZgMyeenWOBUwb7MvgDf4CPByebhskdJxxx/+pgEiSZrE7qY6v4vqB7tH287pYlkg68spwIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:33 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:33 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 07/10] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 29 Aug 2022 11:24:16 +0200
Message-Id: <20220829092420.341050-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 351721d9-3902-4138-33f8-08da89a0488c
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAhDTJ9/qvyCdcf556laRgI+BaMtHrLFFk6d3cRLCc81TsIPks+OSV97sB+4MLM2/fIzH+zuIbUwpphPJRmIbowzGulRKps/W1wIBDTqxkkTXn8Oa3ZdDuD09DGBelszhuVVQ10wYRNc/sthlOLuhGagfN2LW4yKvob7IRTjVLMJfNr5d4oWGLAg8byvC+8JiZzjEHsqG/L8yX7JuprFeGWUCpNdjT2MqQ7IhWBd3AK4dspxCUyJ19blb/VUg4kL8jOT5ZM0U3D61xCLc8J72SjpVCrS5jH4gMQzjVadKl63+bX1QuMuXj0c0sfHwdbpSSBlB9DXe9VcBY/NIrEn8wkYhAxCspP/RtPfuf/jL2uDjmN02CcHE2iqNhj2IEAx+sPgrN1/zrJZ9powyJYg3av/xVgt/hGSHPycByMHnTKgYPX77JMRLyp7qD2SQUzeZspdUxn8imj9phSd/I9h65gZqJpbTGGI5ajPFvnWYDMCj6wMnidL5a86X01d8fZxfNm9m4spmqcRQIAS8QH0wIxy3yrh3dGtbKYwWm6jIx5TLWjaaWqlNvjRKCFkmaAZfxVe1swCKSPyHNxqyjVXQxuXeEWLv/UW4kaCHk8BGzLZk3IIvM8eENhimGkItuO3F4J3uHAPIK81MaTKxo2EdQLO5k7EgQrneQOAlQAYzmaANAR8iYjKIscWwBcUS6hhKvdLuFrtkG5FzR31WpbFOmseu9/iRIBg74ELLDwDtw5YcnXckYKzf3pvCjC2G/ZSZJfAiwSOj3qw60s/uACqeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8NP7p7Qt3EoeQQhTqmOT/GkzaA/I/Nuenqh13s7UlGm3tyWGTFOWg+yIwTti?=
 =?us-ascii?Q?5QJR9h5m1JKk+aTcZXJD8PGS7x1FH/K53z8IKIeWW5pvsZOvREvquSGb38ab?=
 =?us-ascii?Q?OGNlU0/aVwZpHLT8Btlxcw2GLNFcJ29iqDjLSav6rUR5WZ2y/HWHEryfNI+w?=
 =?us-ascii?Q?AzKIuQ34hU8babttCIx/gmbwrqdQ8Aon/lzXY1f/XFotAVNrmTs40rh8r0X5?=
 =?us-ascii?Q?aaUGBV5pEmsIebESBZZKHB5nVboaN8V83eeFd74SoUsN+xVspFc4MXr9Fm2H?=
 =?us-ascii?Q?T/EzvdD9GybPCEeTeoyB753e2XqvHmz2E0Ymn0Z30//0dwNcohiMpOxDfTIL?=
 =?us-ascii?Q?wQBJJjkAFf5Fxcl/L01xk3U1DXG84XjHZpkTi0wL0HEKhp6zn2R7qVIxIOPY?=
 =?us-ascii?Q?TnKBqcbvI8DVjW9KZkbpC87EUeXF0/Gb1rEad8j6rVunF7Naw/9DsSc3NVbB?=
 =?us-ascii?Q?DjR1o/FAXrxS2iCTiIELw+DynonlDfSBLvJitlRfAOfyGDalXXWoJgar7R6/?=
 =?us-ascii?Q?YG4ch7qck375MDG2qnPFK+BT/zwPpucYCGvtSN0byJxUhlfY6VnYelo0+4dc?=
 =?us-ascii?Q?lG1iwXrn2bWeNGUADVowyrSwfBfittyzsq/UrQ+l/6txGCNUoscp3PTUXPnP?=
 =?us-ascii?Q?RbYnIsc9AMMp85xO4pxk4lCFCa0UulyEHuF49Ch46hSbBuVsyZi1gcxI4F78?=
 =?us-ascii?Q?VJgTxtv3yGxcJUwpHK81OIg7l0BSztMuZ+lR3GbIRi44es2Eil6D+EDueKdB?=
 =?us-ascii?Q?GaTQ5QZYhFDTDhxQvcdfiGoXzbFs/0+H3lxSOzkoDWbaAaUFS/KCez+lkYDJ?=
 =?us-ascii?Q?Ilqx14hDZJoeNqIebXadIQoOoj9fTWvMh/ghPV/mT93Am10wJeqPJI+8e+d5?=
 =?us-ascii?Q?DPjc8WPMylCo6TjJ7sun2Ct61UN03dF/j3DpEJDAV5gSgyPap4nrRUGPbh/U?=
 =?us-ascii?Q?RbIFTZ4h1aX2HnSM+pEzf17k3zTjBkrnMa/ogbhG2QSbPvzrRLCJsO1VqOpm?=
 =?us-ascii?Q?GwxGsTTI1xJtDr9yyZWDdSKCkRo8WxCdV6ZI7iUkX6ebzZZeazErKKaHr5o3?=
 =?us-ascii?Q?DexRP9ifQrYntxdjQkbMTFjiuCD8gfBomfmC7oA3ePP4yuoQIrCeVvWlkAiq?=
 =?us-ascii?Q?DAmYH7/DywbiN9zeUgnqRra1z9HdTAN0QKlc48bT1pBLwx+HuAqZ7g+alsLr?=
 =?us-ascii?Q?TI57ON4eFkeSG2GWTD1rzSvqMjjWgzBwLgsWMT0C+NKsJfDGgHUS7EwObIrC?=
 =?us-ascii?Q?UxYB3+flLeE5HsKWTxnjKdWONo9gQTJBRSrhlpUue0jTlExGZToeIHrsVMqC?=
 =?us-ascii?Q?rVdwdHB6LPYMumsrirp6U5VOsGMITg0RbbDuMtsdM+IhimDSLixpACRnsWoQ?=
 =?us-ascii?Q?Tt60eMBZXVCQgypRrfBYicYfZpUmpRyeMWTeImRniqDioZlLlWvMIysKOAsY?=
 =?us-ascii?Q?IWm9hL5z0NQlnjSgg6U9jHPHE7M8nFOeCJPJVrVPLqodE3VZ+0H4zzEf9ig5?=
 =?us-ascii?Q?TO6qnC1c+YvzQ3hZe+qTgeNaxpIuD/EmoV9ehNQz6R18TsI8rk4xqNQiL6RK?=
 =?us-ascii?Q?Zl18zQDyU7kNlwItzK8F31eDbBICiMwIko6s8/ECDpEJJpEGHhQEDk5JmWHu?=
 =?us-ascii?Q?CPwAkPUAu9Hem1hJQrXWg78=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351721d9-3902-4138-33f8-08da89a0488c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:33.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hZNRNs17Ch8oKZYLqbmDpsxVf5iplo8JRkJ/vNQX3UmVIjvIPAylX5QUPlj4nSIvOLenLvhrbX5F/2r5aF253h3pw11fgoaYa/PNSX3108=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
---
 block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eea318f809..f50cd232aa 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,13 +438,50 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, high_off, size;
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
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+            continue;
+        }
+        if (high_off < off) {
+            high_off = off;
+        }
+    }
+
+    s->data_end = (high_off + s->cluster_size) >> BDRV_SECTOR_BITS;
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret = 0;
+    int ret;
     uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
@@ -457,6 +494,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -469,19 +511,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-            }
-            prev_off = 0;
-            continue;
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -519,8 +548,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
-
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


