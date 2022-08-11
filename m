Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1AA58FED6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:10:03 +0200 (CEST)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9ow-0005Ue-7B
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gO-0002c8-Cb; Thu, 11 Aug 2022 11:01:12 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:46683 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gJ-0003b2-3A; Thu, 11 Aug 2022 11:01:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0FmVZJxxbvUAmlXCW8sL4NQdbGuwCKkPHqX0GNlb8S6umvhpqVxUiteoI7DxRmGpUWNAR8FeBmEwzonUvGuqZ5tNx/+OdgvFWOKTDToHPSrjbIu7HpjMVwLSF7ZATU/Ah2eMYzWDByzgBTAifmJAsGv8d++b0k+J19i4TPU5RXNYpRON5Q+Drxocuc8B5hkFM4PGfxinsfHQo8kZ8HFrCsXi1jeLkArVC+BdsRsars83NWu1AVMDp0M4aCza8vBpf4eIT542VdxQtXIdSLYbdBwVkQkyFNjaQPne4Lq9AN5QKoDV4nGSzV9KXQaPYMU+oqqphD+FFTA634hRA3gPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkDouN95P/PFj3O2cKgHIPUjY5i1SUwSZABfTv3B9qo=;
 b=I2r8eLCpX5PuU0W+CVi79lqYL6TsMBQFhF+iif1c73zrQUG4K2AuWWWTKAn+po4D10TCZu4dcw3P6NdK/MqaYhkQprjBjapTK9BCJOZDkgDePftoQMuG1IxaV0Ftzi08Xeyi5Eyi7oB2vNovbnzhvmWIGuI8lN1dAKZNE51y7OnL+zL+EQtUlme0RUcNqqxn3iWF6uJtunYoT4DydmN1jSMR2/fTSDmeRUdpeB+g9MOPh1wJEafj6SrcE+ru+C7fRNpDeGi1by094kDbOs9FQ6PEnm5crUIaWOmTqyLKI4YGZPcb8jKsIk9uQzrimNCj1tuSMnGL1EPBtbuoNhot5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkDouN95P/PFj3O2cKgHIPUjY5i1SUwSZABfTv3B9qo=;
 b=asAxbXn1KSBlzR1VQmyyB7V0Tml8MzmVrT+i0TslEGmC+/hNfkbGFKpqax+zBxw2f+/v4yzyfaiXtA12hxBGqI3tbdpdJ97x5XjqFlh7ZQLktGH3HkncyZDN7g+A5WOAzKl/fALsp3a/Jnucd9povqnNmgsFPRa38ThMQeoAYqEKgPfTnO/14uoQKgU80CjanIv2Q9G33P3Td0wlhS1vmMtFkPKVMRAWVPl+8byryz0/sHg4nMd5CHlndzRloJofWy3jSyskD4xDRi31OKMCvrpfHtAmvaX9HpWVJHyRBCGgVofGlspdOGn62pA8ibiC8UQqA/u9NkkE0AVi80nROA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 15:00:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:57 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 4/8] parallels: Move check of unclean image to a separate
 function
Date: Thu, 11 Aug 2022 17:00:40 +0200
Message-Id: <20220811150044.1704013-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2512b0e3-4203-4ccd-d551-08da7baa4c15
X-MS-TrafficTypeDiagnostic: DB9PR08MB6521:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9e0/VMfNLvY8biOX+cTwegFyl4jRXbwdIEnNwHlZb8G+yYF54BjTPnySdIWpqDiqhv9puFxT7akbexk0i4Nccc5sYnrd5YlGU0xiwpDh/AdWrI9pcFVNzlg7RBJNURMGUUSTwUBk+nE6JVJojIXzPmkbADiS/voPS9RUOrNmRNq7NCLOX4R8ec94t7uEEl6vaKbOGDaoNXwF8Uvf3o2a4YqQC6jHRSBiW9bbDpkRZZsfshOK0gSsOXrZzLnmJTz7WJj0HAu3hFVEOxgrUz5mAA6S8/GyYVbATDMtZA0uRuxTL12anbjWxCYY8HYWdirsNvzfQ0RQjHVL8IywP1wJsw0I+a4AGBGK4Idzdxss82QeBMq6RIYb/wWw78ktPU739TXBgfPNnCfIqTkVD0PVBrQsf7gNsioW2nscHMU22iTpy6Dfb1I+Cei2dtFervlvh2q6gO44Z24uZmF3dvdNSxl4m0XaRXFbQ856XuVOOsIqbfnnBj9Y+2YhCk6gkUpd9eh769pNDDk1fWZ8vfs1QmbSCgy1o9rHNIFtomwGvPPxwdoJN91b5XO7IX08quCMJ886avVcu3fyaTNbRqyZ452b/4Euzow4VsOLQjFBLK03JHA99TWn6VxzflgjHhkiLzmTvCFlti9o1KJOnRIRHL//RK5zzi3QmDI7/G+v3To/dE30xJX8Ejs0L7IfvZYxUReoLWql5xo9sn04cpYEoOKAK8f8JmGyoBifnn97OGtA60edBHYHvvPzp2BDAe7hXB3KLRv/g00moPc5OVBRQzH5fWqzoNlkQtUYipc3q7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(6666004)(36756003)(6512007)(6506007)(41300700001)(478600001)(26005)(86362001)(2616005)(1076003)(186003)(6486002)(83380400001)(52116002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(6916009)(316002)(38350700002)(38100700002)(44832011)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iTq+C7F3qlVjuzqiGLKUy355imaNYs861o5W3bUB/lG4a7JlhFTRyk8RcD1r?=
 =?us-ascii?Q?nEvuiXwGkW2q5dIFBTi/LH9V7AbNyV0/AZvsOCdjQ8sfU0dJsMyLq2XR8aHF?=
 =?us-ascii?Q?OagZGs6G+YwTAuP7c4jI/DikXMpujQiJOzXy68ftcuTq7zA4AuzRmgqWlTX/?=
 =?us-ascii?Q?hqZy6ZdTD2NKJeKTu1JeZzB/IESjWN6AGNvpJo+guQhFm9v25pKyMSvGrQkN?=
 =?us-ascii?Q?QuQDdy34Ln0HRFNPtKS7tiSK0rz6S4EJsQQFPbaS2vHkXNch6z7gIUIVz0sF?=
 =?us-ascii?Q?Lt8q6rwU+ndy3Sr6QHipP2Wfw/zLvIGxdswkiVNc6Qhn7yOyv2nf10dwBKLa?=
 =?us-ascii?Q?38pzPQRUYsiW7PiMmmmY8spCKa2T1bIST+Ec69OZeD9etlJuMhcMHZN3btbx?=
 =?us-ascii?Q?2h/MhNNfCki2ck/AeLgT1358+ZPlU080CXIXp0jyt+XbW/A60mRvjBy25+xp?=
 =?us-ascii?Q?rtG7gYjOasmxhKgZrfGheiU1S3/epW9SsIEg8s2jk5Z9ZJ0Q0D4jKyhBWTtz?=
 =?us-ascii?Q?duDycAvCdybNdeDJY0sJlgyrwo0NOve3UF+QQRIqdmgu2QA/dGyEAqE6jhl8?=
 =?us-ascii?Q?3QL058EXrNzaR6aaH8fQi1Cik2N/2iO1retQTCIJ3k44FQR0FCy+gnehVfQt?=
 =?us-ascii?Q?e9qICD9SL1JCDiLhuLCQBJewbSopwCSl6AYviYoJe/48JHFqdImcYc4wIzYV?=
 =?us-ascii?Q?8eFkexRGHZAJRW9DWOhZRH9DViAaXCwBa2+/Cj4KUlDXmxWfuuCRI0HSOjin?=
 =?us-ascii?Q?kyE4ak9cgqwDLfks08TvaGqyW/ZcRhVcRQujA3bh6C9sHWlTCmDDcoTBJ9GX?=
 =?us-ascii?Q?+DZXYVe6jcmPv0YMepRC859zmcV8tvZ08+7aSDTzrVLwgdqOAb1TBT/NbqdL?=
 =?us-ascii?Q?xuHGo1/5nF/jHYp6t0q/wB44OnCeeee9RJeZnYJ+6e12ZM5W1zymOkyfk3z8?=
 =?us-ascii?Q?KjVW3wG9YcNTc/QsH+QNKRIWHyYQesh7wBhD4ECm9QKeha9118JHjId1lfBJ?=
 =?us-ascii?Q?XxZOEkY/tTfW2mxpJuMctV6a1YC7uBANLK0HkvXDP2sAT5wq8WlB4EYssJc5?=
 =?us-ascii?Q?t0Hfz3OMIHPOH7VUhsNQRHN7PTEL0KqtJrYxIhMJlUdTbbzKaSR7xyHMvh/T?=
 =?us-ascii?Q?5Ta+t+H/GIrpozqMSQuLM3LyMWgQbCYbWpBMDlfVYg8V2kRx8+kdOHp7m7XM?=
 =?us-ascii?Q?i51c5ypur1SrkygtBYC2Im3qjsEPg4en/cJNizl+IbW26/tbXHXTmw7MMqws?=
 =?us-ascii?Q?pqsZM7PJ2KR6X6Wle/6lCyNBE6i1879GpmkVCI98cGvWyGPCvuDp94g16OW0?=
 =?us-ascii?Q?xJq17SfVQIfWTBhRvyJAe2NmthBbG2QOjbGkhCErLNfkqqK/hat37neZZSed?=
 =?us-ascii?Q?jCuySVWsPBSU2PS/AbmoHFzp9aj69d4SDviDdQZAPHLVBT+EVralfWnYYXvX?=
 =?us-ascii?Q?3cWUIbLGnhvw44Csgi3HZwKwlK2zZsG7lCtKYGZOTqULBl61eo+H8694WBBc?=
 =?us-ascii?Q?4Xrri6JOgv5/ey6ixxaWr76+W36RyWV8kjjz87g+ABMSrsu853lp+8JvcFge?=
 =?us-ascii?Q?rvhc0YJPw/ZO6YuQsA7qBZsie4xQ/W06MFqSsEL0D+vNSaSePn69Dbbo6AuL?=
 =?us-ascii?Q?rzOp3Xtfz8oHxotu8zgiZq4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2512b0e3-4203-4ccd-d551-08da7baa4c15
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:57.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGYUJ18vY3efy0oCgaVZBmTMzz0wxPb4ubQt4FvaC9gvLCKAqRDhmjvvEz+QzYJKsvHGvbVixl1nlH79nhaigK+EXYFRR7aCgRf1hy9JnfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

v2: Revert the condition with s->header_unclean.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6879ea4597..c53b2810cf 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -419,6 +419,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -436,16 +455,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


