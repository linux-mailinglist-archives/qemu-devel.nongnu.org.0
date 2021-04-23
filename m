Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB08A369C3D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:52:27 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3it-0000Op-0L
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y1-0005Lx-72; Fri, 23 Apr 2021 17:41:14 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xv-0002m3-5Z; Fri, 23 Apr 2021 17:41:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0Qmx74U/2ocJAuK0z8Njscj3WeKGMV7GgQPg+1hkoqJ5/keYzxlYyNvE8ukSSDnuCNAI/6s39f+AyhHrpN9Yk7m0s9rT9tTpu8KegpaYEt6JyeGVUW/jp6pCB0RuKSdkSNF/9nwVB5dR/u4RNIG5RF0bi6wU5sf8RKQ5WB9iRNLA2s2y+dExuTSYznvut/9NCMXpvPF5fVZMBW3oEYFGvuTvXzlKnKYXfR4kxhe8RHCiIRS98Id8FBN+m+45Tdgk7+3M/gAlw+CEqeAfKJhRnFyxlwMfTpY+VSrWvom6HV+mLSWTR18qRcxpdv5l/hXApsfInL/x5JjQ9ExIQ7WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejffH2BXeykb0UAom+794M1nGPysIzTmJ5B+o3zqIn0=;
 b=BDZkoI6Gb3mWO8DOr8SOvPeSF8hPLcV6wt25kUjoKkwXMeRj2QD5VLIIbcFKxwK7QXU/haH7WpOvdRwSTxpbU4em4/s0VfNcm5oEKH57Hu6MzM2RMf3HG9tzFyv2m4L9xy0i8r8dwFKmj+/HWnxmXOYwjNt1L9ZPHul6JwbYvhoGf0qs7NxUVGGhdVy7lh5XjimhvPZH3D/gMCigQ43NSK9crVnwANYWNV2wfvPaXEJs0dJGtDY7RkKtprmnVwKAI9x6leayC7P58Q7q2UOcDX3fN3VKg6zR5sBI9zB9USk1/zXmy3/HR+pyz3AaMFCPhJqula2aTrAV/6dHFTIYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejffH2BXeykb0UAom+794M1nGPysIzTmJ5B+o3zqIn0=;
 b=kKQ0VApCyiz5h6zMZEAtdLcuEZCCYWcZ7myqakSiOq2Z5/HDZ9W2YY2BEO/zVCn8FDaSoEYtYWYBOCx7TKH6M5v4Zf/jHrAqwhbuPwq6l0DtWesxlKx8Qi+sbp/G7XpVBmC5L67Il0XK8qNtqWPKgf6A2l88Oy5tA9nNLeQKtng=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 06/11] block: drop unused bdrv_debug_is_suspended()
Date: Sat, 24 Apr 2021 00:40:28 +0300
Message-Id: <20210423214033.474034-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3101813c-db26-4105-b9a6-08d906a07a23
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637436E24808A058B73794EEC1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDRZmMt7Qyhb/RqEFuFjbx2WzH5ZgTqkE0rVeuSxNZWAAE69fxmbKXFXaYRd7cfgxNueA1eAXIGA93/jFojMj39Tqmyyio+xck0/FZOwa+2W2yRbyMJynNW+Gx97K4ICDKVTsVU0dETL36dySHJWTkjHFGSoYgEbhvJLwLBmfFcAkTHgaacV8E4YWBelP38VF6m/PBQKRE0MQx6pRni5IDCZfbyWDT6SFRjZwuAnfHgwPOe9bPBa4Hgddd3GC0l/3mqZ3OQwZ2sjeqTSkIqdWK0RHJLNWILpcAx3sOs1VblUtJ8TkqP6sVvVQgZdfjP5ERbKgt0Dc3nIyy/Wlo6WBCll/InORE1wiX4NvPQ2hOmzBevzul+oE8aaNrgsDH74XO+BYj1uJGEu5OZharSi+XeKl12DM69GAeYxQXTIul4DkmdYITNCBNP1n0kV9bjy7jXchLoWrnqx5bD3m4ss1SFVnhuNInCH+esJQFZ7B+l95UJVfpdR1w0Nij3DU4JzxIGOTQOK8cNOJ1AiFSnqnZ10lkYAXu8yJEG+yBUlXYsWHrdPeo4VokCn3optWkuJTw20Vx/ZwoEieCKoqVtPp2CczxBRQ7F1GzRfZUW+XC9VVx+tulrlg/ylugFscuhBGH4oWSH8aKaTODt6aP53dug3GsNX7No33pjyqy/tQ01BuFNoZF80YLP+jIN4rRjQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ykw+BAJOiEwQT5EWiHPqOOnRrLvn4IXw4XfCMQMoRpYgKSlQhpWffUj3EOsd?=
 =?us-ascii?Q?Vw5/0dlDDxagwfk/+lo6JS6AmIqZa03Z2PlwEAzUlSvaP+zjslKV3RenD0P4?=
 =?us-ascii?Q?ivx7YM+huGqfWvvkN0un3LNtX6mgM5s9OPifDgHOLUszkNiSgOTERr0cPc4T?=
 =?us-ascii?Q?ENziXwQuhq8l6kRcuu4FI3myVIwxmGaIF9z73YLUxhnx2GjLxmnrlLyqT6m4?=
 =?us-ascii?Q?gQZSDpHJAzJyS4LKuHzRl0eYjreQd6A/ppIH4V4K1Lr9R/aIROKRG6kEStRN?=
 =?us-ascii?Q?1TjJ/z9wEB/sLLP9ufr+zX9BH12Kdk6efPkkVCJ/GJkMSuN7teLC0r4P/CIW?=
 =?us-ascii?Q?CApAoJbTEhQh+/h+sZjMeggziDrmi5Z9V8tI2yfCLktFiRHakwUuXLr7aibG?=
 =?us-ascii?Q?cqxhQ77C5sahlWrUrK9nYIFS0H+g/KjOoX9IohgYOLvb4GVuK5MzZs/74IOZ?=
 =?us-ascii?Q?3pYniEnUpzobIJh9NRNxJKsQCbjlB+uHhKCaHIkQG+X1sw15mMtpr3o2gFdT?=
 =?us-ascii?Q?Oxf6AYS/iwbZ9iFqDnqnUmF1huV3FKPi34WtC/iVwXsnnkA+WocYgx44bKm9?=
 =?us-ascii?Q?sHQTdc6qBVk7eKUHKPjn3NjoVEvwbJsZa5Mom5+zT3Eunokj+ardZ/SzumNF?=
 =?us-ascii?Q?uFP0Y5H3AjC4LOuGoJfBv9AhWHlyn0HXTzzquGYBCIVeogTUBAMORIG+0ed8?=
 =?us-ascii?Q?K+1RqMc1JrotfFenW57RzE2vWo595l7emKw8X98GleCYT+Sf61H104NbH9jR?=
 =?us-ascii?Q?cb60z2ucwbExKutBv8MEz+M6yC8UT2qMWE3vS6Q/gnyxIzugvCabeGjYjnzv?=
 =?us-ascii?Q?pcQqA9Cme4P/3dr9guiZ5GxPlIOx3wQST0jkDHPrDXdu1A9G1reSI39FnmBD?=
 =?us-ascii?Q?HmgEbf0ZTKu1DhKJGUfENJnB6aw2a/6iCu45byZXxKUr8iSCFv1/KU01a5Xk?=
 =?us-ascii?Q?ceFfU7IRH11/LgU7MUSS/amHFUv+/HLNnGJJanNQsTJNJMZwMDuGSrlzXubW?=
 =?us-ascii?Q?iil3DQj+1ScW974hxfBQs1WLYZqMQymi+sz766GImM3ivUhuBlgrcWSyA8lI?=
 =?us-ascii?Q?DKOMgcqaT5NAdKyOcnwzhuBjDmESZD0pbuLZtGNx2u2QuMiej13ZopDbJvYB?=
 =?us-ascii?Q?DLod0JL8MxCH/zA+2eSMH84A6ZsxFC8RbCovrHKnVAIzpHMC8fHSh00KIAmB?=
 =?us-ascii?Q?/ZnaKuvcaDuWTYM8jassDRp+1i87M4kpOokAJfLfIfmLp70+f2whhA9gxn98?=
 =?us-ascii?Q?LV5QR1jUkYd1gGROFW2ZXYAn0uWw2HyoymtL7S2G3MtdtRCoQQ+BpqHdRPCs?=
 =?us-ascii?Q?rqwpk65A52Ks3bjwmeERMPuY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3101813c-db26-4105-b9a6-08d906a07a23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:56.6378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDiFJsOKsPAA5nT7YrfEGXidElataM6/FnsIg9YNgM/2obU2AgmeblFlgUBOcuC4I/132pT7vg5m9ArOpo9OOhw6gz1uyKLY6wuboRa0h8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Now it's actually substituted by coroutine based
bdrv_debug_wait_break().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |  1 -
 include/block/block_int.h |  1 -
 block.c                   | 13 -------------
 block/blkdebug.c          |  1 -
 4 files changed, 16 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index e133adf54f..fb1897c1e8 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -647,7 +647,6 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
                            const char *tag);
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag);
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag);
-bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag);
 void coroutine_fn bdrv_debug_wait_break(BlockDriverState *bs, const char *tag);
 
 /**
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 89e6904fc7..592acc960f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -501,7 +501,6 @@ struct BlockDriver {
     int (*bdrv_debug_remove_breakpoint)(BlockDriverState *bs,
         const char *tag);
     int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
-    bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
     void (*bdrv_debug_wait_break)(BlockDriverState *bs, const char *tag);
 
     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 3ea088b9fb..f026d710b7 100644
--- a/block.c
+++ b/block.c
@@ -5689,19 +5689,6 @@ int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
     return -ENOTSUP;
 }
 
-bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
-{
-    while (bs && bs->drv && !bs->drv->bdrv_debug_is_suspended) {
-        bs = bdrv_primary_bs(bs);
-    }
-
-    if (bs && bs->drv && bs->drv->bdrv_debug_is_suspended) {
-        return bs->drv->bdrv_debug_is_suspended(bs, tag);
-    }
-
-    return false;
-}
-
 void coroutine_fn bdrv_debug_wait_break(BlockDriverState *bs, const char *tag)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_wait_break) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 10b7c38467..608d1d5bd6 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1062,7 +1062,6 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_debug_remove_breakpoint
                                 = blkdebug_debug_remove_breakpoint,
     .bdrv_debug_resume          = blkdebug_debug_resume,
-    .bdrv_debug_is_suspended    = blkdebug_debug_is_suspended,
     .bdrv_debug_wait_break      = blkdebug_debug_wait_break,
 
     .strong_runtime_opts        = blkdebug_strong_runtime_opts,
-- 
2.29.2


