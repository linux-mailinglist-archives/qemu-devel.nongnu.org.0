Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C9398A64
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:26:40 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQtL-00077F-Ry
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfV-0001NI-8B; Wed, 02 Jun 2021 09:12:21 -0400
Received: from mail-am6eur05on2138.outbound.protection.outlook.com
 ([40.107.22.138]:12054 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfS-0003Pp-FF; Wed, 02 Jun 2021 09:12:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcMYPpE2HbNYnGVRz3TpNTrkRIoRcV1LYZmM5dkBJ9Aa834AQlJvldQG4bTS6nXJHpXoGJWsN1CTY0iRxaCELVwHYVv/g5xeVpFwrLVQxoJu4p+kVRG4Qy1Tavh7rLic0h8dHcSIoW3F0YtLStkkvUqfLmL3GIF9sOXU0T5wBUjG5rBqaLbPXHvNx95OheeoqtGsEEBQyTh/mQPdaEjHz59jVHhw5PKwhBJYTvK77ENAAQNPcNH+62+FduBwWtjHV0N+CuejiEcZrW4np6/vXK689TGcb/nnV05rQ6tNLQvAcuxtgxkaPr9GcOOYYOcSBN6Sf1StO/H4ZOUAut+YIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdC11N3Lp8BlMzO50aHxEgkk+BSGk01QtHBfkIoeXxY=;
 b=bKXStD23aPOZ7U77NY5FWdA+Y2REavsymnijhtoGW38ynAW1b25EM0X6lwqKcYaRmXwDxKeyKBp6Z5DO0AQ5IgLB3yoNF3PKiXMiKwLlnbJ8PCGOq4Z+xMbGkv/EF8blgmcPXZ7xrlLAA24u75IuKUGZvYiOXhiYw/xBsYCuR81osQUFdClcu9bdT2m0Kk9ixDxKRjIcHOA0mR0mq3ZM3iMwG/SK5cwD58xym8CXtd+a8ILPOAA6ProxAQpDqKqyWCsVkUlh2dYMsOvhLji0FXVrQz7zLURhpdry+dnOaWc+ClH7HzsnY2AOb8MgBpPA/tjzHbrWdFQaVWv1NlMXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdC11N3Lp8BlMzO50aHxEgkk+BSGk01QtHBfkIoeXxY=;
 b=Q2v5yIZPGFskz9RWbG49MBv0BvHNxueijqu5pddmnPFQcm+LXOXZLQMUg7ar58nmfT8WnFlJu66gJRtDcZ6TDexoFSDLFSOD+bnDDLS37pbzTc6xmO192noBBVEdDy5mvuhdjZvDbezqGpnf7/UOFrMis1kQZQ+Zq7A8u+opJ70=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 22/35] block/block-copy: make setting progress optional
Date: Wed,  2 Jun 2021 16:10:55 +0300
Message-Id: <20210602131108.74979-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cbb2692-f7e3-4644-7d2e-08d925c7ff9d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693BD90EA3462C1439030C3C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrMdLK7Dw8EJjc6dC39i/bsvoe7OEERumFcxfhzFBuDoR0c2IkbXEXXO5RetZFWVOn8qnqPIqVHajjPf0L1UqmLGXXs2QTsiqNQ5BqzGe5DsRo86YWVZsiKaHfdgSxZOMr379E4aQfeIZLNQKbdsF1JBGHAgg+AqxG0r7D3fCl+O9LC2FX5lxSO5rGq3wEmP8aVv+5Z0wG6mgnuFqp9wgKKxVEHJcFtuGa3j4w19wRdys2PFnhsdkZ5Kq5CdQhRTNTPP2vMkUM1s17Jhl0Zy40MGloxMPZT8Uac6wEB7UeArmKeiHzdbp2ZwJTmXKFT/sZiTxjznItXbj2ffJBoKH06XpBhgusMrefVHyPJcT1M/4BbhvmB77ZSIbr+puBxDS0xPOOIK1/zhTIjrUVR9vO1ZXSr5/278Mc1AsMoILYBB8x6iM1g8aQsCtNW6YnLu0Qkwhv7kt8LSKK4ZmC4G7QSG2GhJLeVIpOmIMe5opd++LMyIx/SUtsT/4NB947gkN035X60FDwBeousFb8yPdownisVwwwIWwY3wvWRT6ubwzgv+5QjUaia4cim56ArdLSbBpROJyIR4dUIstPPIKfD3JNwF7ltX81dhub9a1mqO+ExBv6PKC4gPLgDZIxAwT/6zSfOvsb+rWHKHTKZVAYNaz4wiTtxQ42htjgwdo4vRu2fO86/YGpX/wOfXtCq4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cIMALtXueGpcJencF4txpyZBdOJGXdrIvqkfRpJxvfFnXVDjYFwaS06diZrj?=
 =?us-ascii?Q?CFaTDKORzj+kt3ufjtmuQX0GqytVEan579668j2QRcibXdPcUK+IARM4jeFk?=
 =?us-ascii?Q?nEpzChGbNcY42hxa9Had+dMwZisgsfT5KegbqLZ/q+P98RbY2JGHkV7w1bBV?=
 =?us-ascii?Q?XoRzbaHPtbxkG+YunURp1ZQ4jReJqqbxCpfAohy9Llim4I6PwRTdlRop7SaG?=
 =?us-ascii?Q?tf+J7WjEHctf1KrCL484p8VIg5r7QJHhDhE9y1R6AhUlxKAH7pyv/GfC9rGq?=
 =?us-ascii?Q?bwW4Vx7/xukYI+9to2No9ZAXeQfi67i7dno2YZOwOt3Mteedg4nGwl/t6p1C?=
 =?us-ascii?Q?jeRQoQbuAdi0E7+oa3NCyFqMHddONKVoPxMxAAEvJ7gErHi+UR89AeVkCBKv?=
 =?us-ascii?Q?lABJk6WRRu/+n7qerAwSqH/gsahTk5lx7i6zbfgJqx7/tD+aHkbhqpwkFPny?=
 =?us-ascii?Q?i4rQcDmNEulNCGWTlbWCYqNTOHIW/5ULeJH1o42L3mBqo+bese9aMYyTlBdH?=
 =?us-ascii?Q?iYuLGBSsl9iBdtbkmK4YGqVG/19HC0itdcfycTHlm/6uLaIXP6bzRv2ltbI5?=
 =?us-ascii?Q?SQtfKH/3vZ5Yl1HUeYELxhg09VQdO2ua/P684p/Q63j1klU9hNkAZKUPeWr9?=
 =?us-ascii?Q?SN60w7n8TYyabBSqygBd1IpOq6z/V7DGg0HPXyr+Xv0GC0N1V7mLXZCbhg7p?=
 =?us-ascii?Q?uUip2ZFQPb3F0wOsCMdAeC7DGXJ5U5UA5+QIguEhpy7J8VnlLR/u9FeLmY6L?=
 =?us-ascii?Q?+UgkdO97nf6XExs4IvaznLvghD8lLec15dnPTcuAvOT1rwrK8PbnX8YD12ag?=
 =?us-ascii?Q?/OsrjGK0m5Hl/E+KY4FfuaFC3hS0nOx7bqNeV2H96VhZ9DCSoZcxwL6oCG6W?=
 =?us-ascii?Q?iwFov7Sb0OMjU2FrXJoLpDIGhS2thtsV0LWx7qicuUGgIf+eyfby5upkJrfF?=
 =?us-ascii?Q?WRNYtMunBxSk0iY27s+kPmkJywrHA97WrduChMnjMnRhnsLIN7V3ZAdqhS65?=
 =?us-ascii?Q?qUZnwD2H3TKm9YltEB/oxmwsjf1n/co0IN7B92jfULhd6KoOwZKsF+gfMJO7?=
 =?us-ascii?Q?Vg7gGldgDion79jSryklMfC1le9vMOPswQS6FnBnsrkAuIsjpsBjRo0mCdP3?=
 =?us-ascii?Q?xvpGiy4lXB/sU8EUjLgrywBVPDs/8VPmJktuzZGpTvwLBfHecsET5cu0RKWa?=
 =?us-ascii?Q?/iscrsimZuL1QVhTjWisfjfh1B8vPt+IdvCFE3OfPhDtX/EMQy1SVzdmtIrm?=
 =?us-ascii?Q?ac5TvhSd7AkvNBsHyyXMuVGBFEwx9MnGeD4rFPLW+8RSMpbzEBQY5mQV3+vw?=
 =?us-ascii?Q?e1wHjINcAJnR9RabQS1HtVLD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbb2692-f7e3-4644-7d2e-08d925c7ff9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:56.7951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JA5LF8ZOhQWoZbkP216/Es+TeHK6Uu1SgEYdCt/jUsO5i4fqgUHUGnE+jclFMn3xVOc7bKgd//OPynYEy9GCxX1wD84v0Zsp1+Hqiv2tV8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now block-copy will crash if user don't set progress meter by
block_copy_set_progress_meter(). copy-before-write filter will be used
in separate of backup job, and it doesn't want any progress meter (for
now). So, allow not setting it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 774f5029bb..5ee0f48a94 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -544,7 +544,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
             t->call_state->ret = ret;
             t->call_state->error_is_read = error_is_read;
         }
-    } else {
+    } else if (t->s->progress) {
         progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
@@ -648,9 +648,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
     if (!ret) {
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
     }
 
     *count = bytes;
@@ -710,9 +712,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
+            if (s->progress) {
+                progress_set_remaining(s->progress,
+                                       bdrv_get_dirty_count(s->copy_bitmap) +
+                                       s->in_flight_bytes);
+            }
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.29.2


