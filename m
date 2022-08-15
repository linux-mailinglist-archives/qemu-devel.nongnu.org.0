Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B42592B2A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:18:51 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWFH-0003r5-1m
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzf-0000VO-G7; Mon, 15 Aug 2022 05:02:43 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzd-0000MA-U9; Mon, 15 Aug 2022 05:02:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pndkdz8//oRyPVWJ6Q0CeHtaDk37kEZyZbotZCaKtnGYpBgZPZ1nhTXuXglIq9I1obA791boh+MuAYbjhSLg3gf4RK+VWAFS8rHpTS8DZw+lzx2om/fZXKddv0PsIqpLcwBk7Nl3LpvEfYHtCoEh6tsh0ofz7hfTMRbT3kIq8S+MLAg/HhovOo1DDAVxQApGDpIQCCz5xVjoAjJdD6+e6mF3fsV8zF5AGbYVwdbc3Np0Uo8HDrfY6eMEmoqC15oBxIFIJEYzwGzMBh8McnxfB4aHoNaxd8Q2TtMq3VB7TfaiCuBC0TZz5rOfR4Gn3+bnEM5JOj142T2HfoD5ecDcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgvfI3PPVxfxVKKDZW0ldeBUcwKVgqJ627wnjdmGPZ4=;
 b=Mf/VtzoYDePA5plzDG8ot6NRYmCORcIPTDnvT5ylWiMjiBgDwm3SJ6ybl/5cYMYibGCg/Pd9Cm+r6pqQfq/iT1jkHYJoZPSiCP98Q6NRzDtsclG+cguW2J4jFiXpoY6PAkBldmOdsyMTNe+W8y+FE+pzg+39aXT92cIv31CAlL69k1oI7l6R9xWjJtb9X1eeRpg/rRmVgW99oJrjYi62RfC101Q5Q9z1nDlRoLNlaXZAkn0FNmhKKk/fakxH2NEBzob/U7OXG8CJmITSOjfNp6hbfTnjdFrYqLvbcNH5U3P28B06eGS9Ilgw66AHTqnVrAvbiLuWkQb6ERi0uacsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgvfI3PPVxfxVKKDZW0ldeBUcwKVgqJ627wnjdmGPZ4=;
 b=zygJH7jfJFypHAMZs+ggNgn+UrSVzv5TKOzXhZUXu4tLjG/sMhdcUoTIrDEv2AzPkhlQ+EQV34p49W25e1Bjw+JK04VVFA1RFHBHrvburF5McNBOsrNAgYzDhKLV4mQCcjeySKEtlaB4nhVA6HBcxN2saeHUhzIOBRwRkKI1hzd10DhWMTDMko3/gPGARRGZafLDGESPsId4MdiAP44soNEYtEBtpQWvkaSIi3wB7niFyMVRUU/63kIHICCe3npEXZeznGiDMwS9x60TB4jQFqfM6blNhmRG+i/wrZQQrbUpl9VgXJdd/D75ogUJ+dXG4xF+TRbsONUZWkmLARY2qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:28 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:28 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 4/8] parallels: Move check of unclean image to a separate
 function
Date: Mon, 15 Aug 2022 11:02:12 +0200
Message-Id: <20220815090216.1818622-5-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4bf8385d-d2e3-4ce7-aba2-08da7e9ce11b
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75ucZajNHXQX4/9pabnRu8n7K/aRxyzgkehafMa3yoV6orAkRiRnEhicLIwWD6Ent+AqlbtZSXw+qBgdUuRQZkk8JaFfGBdYs3c5nNcX6is/tVAfsKBQuSvHmozUkHqdYBK3KaXkOllGDl84okzoopBiQstD8FN8FH+IrOk5pUFrlnAoVzqnCuwEvxQKyTfyUaKu9oedz9I0yhIT2hlVZqEKY3CWCsJAH+ZyN6i8Rq8atv9dpfJeD654VNjzfQsrdxwuE5BRek99yyWPx5RCA4sptcTwwhb3VA7M1dhMDcJcXjrVjQlT7BUz1dP9tkqIkkFGQ2TXKeRcGNWGYl/d0c5RQOubLiaINzKMo4HNOmnZ1JZengiQCHcw2EhSRLSD0kaam7U688ttLEKNo02rABcYmkS1zdoEftU8MvWRiBUo3Ta+kpOpxtZ9hQDlYfPAvAOoWDe3bZrT8EJPu9e1h0N20DzT9iHBblD5Iewv76y9kQalIxoXB+AeoioZvOhkHhcJAJao7PtPMJASjRXsLjbOFeY61uO1fjuD62hTMqL7fRiaHJOSSpBKhEtMTacyOPYQaTwvVly/uKejWurn/35YTu6+t/fCdzKzvLWnykudTRYJyG/sKw5QwPnLpV1SyLE/gGR8uutls2O1zWwQShY6J6u02NGg/DSxuPJpTmDG/154ckOZ0PGJWvPvwYfQ6rnY/yPULkfzFTQP2QWqoRlGdrsijFI2QVWCJJ6KO5mPjPS0Md8XsS4doEF8//ksMu3zPDTcAplOTReCbXbeeeKcbtD3Esr6XO4dQNmp46E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ninyg9o3J/83uSzdY+sZ+UBzBxw6cqjA14dXljL5xfanbG5GtZ8qEcvtm04f?=
 =?us-ascii?Q?VDEjW8WqkPSv4/tGxsNBGy0MILJoIli1FCgNBoGg6ok/iDniQwadHydAkcxQ?=
 =?us-ascii?Q?74ie/GWIuW76vbjroaIXc79StRaqUxzX7138JBVwIx6JB8OxFT7mtPw8h3lS?=
 =?us-ascii?Q?Lq3qxNRcqUxKUsxXv6cJawgpRo0F+3y3WjQJwRAjRizrU/KhV5Sz9/ABKkUY?=
 =?us-ascii?Q?nqK8vJPWlgBMKJGN530fu2lqfbXTUpL4zSDIgQDFXnlWkDxjn8+rNLcAL1TB?=
 =?us-ascii?Q?mgu3k6zI2IcYeqBgt4fQipYLimVYskdzQ7L3yod8nd8g5K8SNXcXk7b2lE/S?=
 =?us-ascii?Q?e2cfBHc1AwHkzAoH4lXST7wcfRttNn4lyg/UEmmhULW7oW31BEO3g4SgkreK?=
 =?us-ascii?Q?pEtiN01C07WfCbpNV0Z2dfkLc7325aGWnGF+4wN1dKHjSd+1atCs2Y+7PuFl?=
 =?us-ascii?Q?1At9nxl2TKhlA1uWzoh/JC8cPX0mZUPr8oG9TE8008AlEUATvlpCmYwaKdpk?=
 =?us-ascii?Q?2b8omgcwQErs+5q1W3WYNBZUwoI6qBneKyMrBQggtMprylwvwlJxrgoPv2Re?=
 =?us-ascii?Q?G+P8uwdnY2QRsV+xAEMd0dAhoObDEyCGE9wdnXjvMKtEDPedxfDevx46OZCg?=
 =?us-ascii?Q?DmKRQiykimt7OgxAyIJwLZcFyeusZ1HueWLQIRnGD3RUpNT9yc1QXbkR9uWx?=
 =?us-ascii?Q?eHxPTuNo/xLZ9EhPYEyJr8dz7ob1LP/9glUzcmmGJMJC4RVw5dDmiMOqinv+?=
 =?us-ascii?Q?UIGHwA4B8PkFuM6yqIGXkwqvqdPaJnVShB7X9COUAKExA1oIdUIxfiX9g/JK?=
 =?us-ascii?Q?wXVkCutZx1/8kw6uumLsPwVVDoLVh5Pznr1mkb3SBItQz4Ty4Jl1puHDBNiT?=
 =?us-ascii?Q?yeihifwUZ3xHy+a6ZzAUoU22ARdwYs9J5vIaK0vv+/OPDr5G12z4LdAoXBhV?=
 =?us-ascii?Q?uKUdnBn51MrONLwq62dbEYvmGaEtKFdX8WC8vPHuDmW6Z6NO1iGsDxabKBd3?=
 =?us-ascii?Q?/OX/9yMssJWtMvX+nWimt1avey35KKQ8lkJ4GuKX1jm/x9TXF8ymeYMR7hVU?=
 =?us-ascii?Q?NwJTRCexHd+RT9evWC39geM/qkhmFDC8gzZ56VVXVkGBa6edFL5G5EliLh11?=
 =?us-ascii?Q?8wU8XnAIfTf43xTem3Q6452YCYQm7yQCqmlYcNIwstroG53mdaL7XaafmU1h?=
 =?us-ascii?Q?0N5ueWLT3VVNHnzngslD7dT2msTP+EpMwSZlLdxTewVFaxbWZOWJj9iZ1P5H?=
 =?us-ascii?Q?sqzBWqVNcLtb+ArL4QAXshKSwPAhFgAHFPL3BfEIWK4D62O0e+xzHKrgiiQt?=
 =?us-ascii?Q?u700567AUh7T9Md0sSgD7Pt9YvC53vbx0GdKeMO/dk/9S8q0C9Vs65wSTcmQ?=
 =?us-ascii?Q?OwM79sXUEYlIjzLqU8jUQly9GBwIH8OxkR4DTDHRS4tPPCBG6OVmj10gz1wA?=
 =?us-ascii?Q?ndgnioq9OiNWyFDx9QzL5C5NnWa3KkQdi7L3JBKXJA2wWlCYK0K4wnY3/0jR?=
 =?us-ascii?Q?iFnXqHkhYQYZDF2roh/CAVYonwom+xP4Gftzp7pNxxDgCicdE4beVJTvT4M/?=
 =?us-ascii?Q?/p8IfYXWEMzcahMeMugrwz3lWQGXP3m1b+1wYVguteW/nQJ/9dsFArwSkTHu?=
 =?us-ascii?Q?pkPJKDl9mVdoXrMLXlkYHm0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf8385d-d2e3-4ce7-aba2-08da7e9ce11b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:28.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xsUPihuQJmHW587aAunCho+biYT9yiRyuhVKfo5Z6XFBVMB7KPK8EtzZFA91dMhA4hdZumoF14Cel/2MnBUwC07x+cRODaU0VgT4hBZaFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
v2: Revert the condition with s->header_unclean.
v3: Fix commit message.

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


