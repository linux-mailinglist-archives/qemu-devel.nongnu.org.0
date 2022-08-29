Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF95A4612
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:29:53 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSb5Z-0003BP-0K
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0g-0005yP-VZ; Mon, 29 Aug 2022 05:24:47 -0400
Received: from mail-db8eur05on2109.outbound.protection.outlook.com
 ([40.107.20.109]:39455 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0b-0006h6-JN; Mon, 29 Aug 2022 05:24:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9A23D6/z5ofWFqAVCH2YCAXfL2FNhF7FCzsvz+anlUrjySzZOFIKSzBozHfcoECo9K8Gb0GBXn9jwfK8IsoguVmpn3RRfBYz+w9pgC5BlGgTTAjT/vyJ3Xqfag7zwMGh2RlCzfnVxiBnqTWheihD+jSmveJp5kae2oKH80amjvXgTRvik2xbSYh4axKMxmuYAmnMvHLDANeNzYlCWAUzMmPksthO7Pg6li6QKKoZbkln4uKarPyn1AF+qSBGWmGEUyTcKkci6JjNU0tkFvxQzESD7UGvD0iBY7FO5x6PK5QoMQNpnxhvpRIOPYN4Gg2MxQkXAJNP3IvSG+RqYs0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=Viac0oOKpiLQ7yS5lk/TbU+5TczKmuMK1CeOW83oX9/Z8mYxsrlNE89AxSLeGhzB8hxcjDn9NQTU+z3je7lStmg7UmrOiPRFafWe0WUbfZSTHM7JCOEWdyo34Ewv8KxhI1Szjz1mySkmrBcX12ST/AFp7YWoUNC3nN8+kk6PhLrpDeKv03O/KavYEWtv8oi5fy3KEHwRKgF7XIgDWddM9l2n76AQAkWdBV3sOUn6ftdIYtDEFtU7K4NfKoZUJKd9E6av6U3qReae1Lt7MjMMRpHSTakZHGjGZ73NgEFvKqZI94AKKqkB5nzRES77zXFsGGXv+BiMfUaEQ7H0LrtGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=vmotRUTOgkogFbuN1dTbYwSkGiiF4KJXA1LpvpgyMeyI0kLy5va5Wx/vQEOnwFg1bbECQhE0URnKPyfnh+n5vp2sDbfzKZuUUfG31TfYQw/7lm3RBqJcgWxyk1Yhg897DmXCYf3pFj6UV/9rDEZxnqPM1svMfNcZATnRj2KF5uFSCdkaZNRGHRvSvhL9ZFDIenvTmA+vOPJYiHHe57xLbGB+2ZpcZQmjp4fw+6Td9/xSrBvthXIWI6GhZxB23O2LgPHlt7+ahdp+PfGkju5iMAZzI3c8QAsaDlPkOJdX7VJiJwSxmp5hMDrfuUaGaVd/Wcfj76nzuL8BaqGZX5WwUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:32 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:32 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 06/10] parallels: Move check of unclean image to a separate
 function
Date: Mon, 29 Aug 2022 11:24:15 +0200
Message-Id: <20220829092420.341050-5-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: affab57b-2865-454a-ed4f-08da89a04820
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNFgCSoXhbSGTSjd1h8M/ND+JzUxH3jDa0/uwHEsmGwNcrzWIdyphfT5JqQyZdn8UkLZg+fWMUwu6/tHBA5neT5y3l3oetJp36SpuU154/ADFp4f03NEj9x2PGyDz8A7ldMp0R/Ruh4BEtavoEXfpppC3Pyv7SoM3C7g2rm2any5rq7Zdu7tq9FZcob6pxKMmdhhFeI9oQSTF6UjmnhTVFvzKh4s1uap6P6kEvnDU9oZox0wI7RC/g7OtfiHI7X3msa2lInM8rAeuOGzvFi4qT5luCusAvr8V6iXH3QKDaulZb2EbXCuqh7N493wHa2NOlRO9ioeSmYPfx7179sDnQ2XWlSc3tF0JF2s7U041wUSaKnID4wupdxBgvenrIITt2LScHg/KIBmz7oVrBgCN5w3lOvKvhgWUBCXbmtzdqLA3yz22yRCtDg7JnCQkrmG16dbm7aG3rkVZNLcRUGk/1X1HsLr8H1d5qmuChjfnEpdBNebNhWLH5vo9gtqNUAOnmXN+J9DsqNopdqqtTQV5DUlsTGP3DP2pxRs2HJ+MAuuJr+nsXFwq09ctq5RvPX6f3dmWHlgC7rZp9hcgdOCmJw2zO2J87jiClajSZShUuMSNSm5ZOral1ghUt8Z1+bajOm6E/Y7AgkLw5GmayBsI/5HBMuCG/vKTliI5TFuP5tFVmI651PUPVJ9aIMT538wPUDu2zU2yB1TcChvhcvNaar6XKJEHpv4qtHArg4NJLnf047eDld9DcVCrM+lrCo3y159xHwzNyHxW364gWVRkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v/vRHMpaBoM/JXbFTwOsPeeP+SiOrcDhzqo5bH3dIEHaVRqnQo7sMF+SIyQZ?=
 =?us-ascii?Q?phJ3i8RwHsIYfg3ptAtpgHjiA70T5rXm/SbFGHUXx4trAH8mQfiIB+ykrMsh?=
 =?us-ascii?Q?Z575zArREPR191LzMwTBxO4LNha9kx0efQ/hjZwkv+JJCkPIBXAo4OxDWGBC?=
 =?us-ascii?Q?vglywWIl/wuMCc/K9LFJIdH69MP+LtHTA349Uf8FRg9J2kvRgj5aTryPwID6?=
 =?us-ascii?Q?vskM0LUp9EdBcCaXNJxthaGrb7mgbQ4wkM/epy2rJ/WqCE4a0rM+VcHBZTaY?=
 =?us-ascii?Q?z1QkYkYYwzIdtihvDojsuBkFFrxW7p+r/CCv8SXK+g1GXm9YhxobXtAqOiOu?=
 =?us-ascii?Q?Co+QNCGpCawfaxy7+gCANkOgpgYy532Ms1xtT0UNFmjCMnbZfE7/G1UWxWQo?=
 =?us-ascii?Q?ueYRyYWRnpqHrXQ+peDuh1QZpHXsYou8Z4nDefW1Ym7w7Nc0YGIa8+3BUPHX?=
 =?us-ascii?Q?FyMwWxw6o1K3HEa1hQhsGprVKv8isTh3u+D+u7k3j3/EbW1eZ/kGl+fMYGnB?=
 =?us-ascii?Q?gSnaiAD7R3nW5MwJD9BJ+9+djqibIYHG23Ga4qZKHt1cLj6vCCngh9RUFzU+?=
 =?us-ascii?Q?BGeVRLkTFT1Z9MLSotUnKYL6ZIPfcfu06Hef8Jnl+q5Y+NJCc+BMXG5MzCT5?=
 =?us-ascii?Q?J5guTClN1XT8uGFRQZhvDqifm/5RhlmQuYKhr5JVCgBjCvRYSBJXw7rveKXz?=
 =?us-ascii?Q?HaI3in5I3RcVTBCs7WqqkB+dr2PszRoutra+zcS3eNE4dT/+1+DUt70fPXnH?=
 =?us-ascii?Q?T6fk9P2j5IAaaJWl1jkXQHEoIFX+K0ZDSXMAFAY+12kkY+ZQDGxJggroJg5O?=
 =?us-ascii?Q?KH3iBh+wGqxNWp8Yysj9038avdBxoV9VdRV6Q/SvAw9WOOckJePImfxOWUSg?=
 =?us-ascii?Q?p6Vh9KOF12CQZihulz3v6APoHDtF/HqYEz/4zX1oGRoGEeis62My2Qt7iUzZ?=
 =?us-ascii?Q?GH/CNDsHjHo/GogRIrId7l0tWNxn0DY6LNXK/BuzvNaz9cbUo0H/m82pDeZG?=
 =?us-ascii?Q?07RCqqHHgLf4TGcz503kBPq047+RMB88iHnaTNEDxsxTSoTQE6wo+GS/4CaL?=
 =?us-ascii?Q?M88GSK4Opee7iHTHbSqC5t5iBbdLZ9v3cc6tsbJm/cERpwyi1XdicxZ0wHjm?=
 =?us-ascii?Q?D6nSo7fdJ3oK+6/YbyLKJbx9shJgIS2EAyGhaVQ4O9pPSOUK0Axu/0kCC0K+?=
 =?us-ascii?Q?ICWqghMTmU/8z68xJhEwYyaa7FInC7uaf+zGJej7s8TLOnY6082UeQ4lJ0ID?=
 =?us-ascii?Q?a28oRDCagi3r/bfmuzy8idDIXHtSSG3wjAk3fBEmRHIaeKniFyCezLXsANgD?=
 =?us-ascii?Q?MHEfM5ptOaTPvV2WqjclORq6pp36AO99J2gnpJuXGXzoblmDoB82g2vHweav?=
 =?us-ascii?Q?QNlUMpev9LhVHIT2svlgoxe2bh+A/k88NhOsBRLP9oNi2dMY+9yDZnFH7nmf?=
 =?us-ascii?Q?qY7oQPdkoPzn0pPcPDJzsKWWHvw4RT+r2b86E7bZj+5VsGjXqvMxo6+4E47n?=
 =?us-ascii?Q?HQi6zsjd+p3yhu0nllCbPtYirfU7r1Ur/xOTs0jMxGawu6rhC+av8Hqzjduv?=
 =?us-ascii?Q?GhRblHGaf9flPhoOGqGEnv1x5d+YqLX6EfMauFeIA7GaVOf1ZKA47eXIXOUp?=
 =?us-ascii?Q?fbI7mQ7+ryKXBuFkiAOr5Sg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affab57b-2865-454a-ed4f-08da89a04820
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:32.5173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOqI/kIvNUigcRrJCmx2bGeYbgt50alyV812uMNcWvtgxLKcViZUOL4GYVz1W+pZLOLkS3E14KlMMFFy/q7m9hQjNyQq5STlmymJhwSmiTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.109;
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index b4a85b8aa7..eea318f809 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
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
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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


