Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863036DC9F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:03:11 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmec-0001yY-RP
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyd-0006OJ-Kv; Wed, 28 Apr 2021 11:19:48 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblya-0001yK-4H; Wed, 28 Apr 2021 11:19:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX1WHPGP+SaIg4gS9/W6noP6njZeF2vqdd0H0/xuTjPgFyPCtSv+YazuG4Yz9jRb3eAwkZwHIJcQIwtr7dqbNLPdZMYt+AcdFmSL6DFY9eUHmtcSDO4u7d8PYOhHpMwWB47F63MJfp/8A4X459xS5JviwqTdMa/A1z9W9+SI9VxJIWI0RSIBTIDRdWdvjrTFf3figgfLPJXjo/0hfA+W9ZXDQTmmtaHPuyYSW3YCyiBJkh2DKx5TynRbEe3SynWqqRXuJs9gCwUad12j47wkp3eD37zkNARkplukXTfy8o89MLsxvp3t1l+73kRsAZVgO5nmRHDPoTNqryod1jatDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Nxy7Ri6MvPVDhnJg8XbAFLfpId9HfdKoK/k90EIyg=;
 b=l12jbULJ0BoL4B2qMGIy2ByM3acrvNTw5WaHDElOO2vNmKW4BeNl3g1PvYA+KzHEJudTGG2/RELFKT9yJJLvz9BhPFVVkon7PaFoqnhtWLwAWeJO7Qcw8RYLa7+NGjNMm5hneAXLuziDvANgFzzZhKYen24NzDZ3JjDkLFl6vt2pqC8R6fkJFz57zYkcD3Wyf0aND3O0LnvLqxlKIwCGqc9ww5+DTGnVEYtO2cn01Euuu8OV5Kf0ng74RwOis9JvgLJPAKXFFOFuh0jPPo+dobVprMO35Lya4dtLwq9vV8t52ZTrHVvKd+di6t/frozloTcbtuM+aCuUufjteIxR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2Nxy7Ri6MvPVDhnJg8XbAFLfpId9HfdKoK/k90EIyg=;
 b=jJBTqEUmenQOs8L1T5fxm14IWgzwKHVs1RTR26oQolIVCnFlGyHJ5JpS956zFBO7J4J2PqVye9QFYALwrzloQr+ZIHd+WnL8inCkoBAosme6g8UKzxwU/HMJ7v8YEYbWaeFmiNZ86S7GAusPz/Jtq1q2Gn94ucDN6IqpYxcz//U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 29/36] block: bdrv_reopen_multiple(): move bdrv_flush to
 separate pre-prepare
Date: Wed, 28 Apr 2021 18:17:57 +0300
Message-Id: <20210428151804.439460-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6428581-5071-4c79-0781-08d90a58f05e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151FC7AFC349D8A8AF5EF76C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkCPPI++HASB3m+QoG5N6R7VqCpGdP7lEEXh6QCOkC9QQFvvahyJn9UmiWPlnWCkBHoPPx1M9dYZQyUbCcyE5AyCvSOW9ifuy3W+gC0v8tyVCjr+EDkHqlLKpmnB/W5SEoOARmCWjUGQuGPGm+os8VyoSz6B7hRnECq7Gsiud0dxBlVf2g9mlB/8tVvKvTYtZei4QF862mNGSvAzdcKTfMpf2LTmN5Pgv7qipmbUxjJnAT/w8FfEV668UQz1qY/Tym0IqWsz3kPNZaBx5mIX5M1VeJDc9k0WYrJCX0dlhCM1OUP8FIcoRdFiwAu7SeM3uAnOb3xULCx5ExIi13OHYYYImzLqfm+9BWNnDIal1m/Bty8OhWGtydTBXWc2IP/UOk/nXoB3RZTIwIozt2HONTTJbgrr27QO6bG9z1ztc5MDWeNo3riflVTbmq4dI8Au2T8041llfksp0ksVCKXKkxWFELO/OAeV+4TFknOJ/bYdn71+kiU9h/n2emf7urqDJLkzw55AiC+39wP346Psvc/saoY9zwq5YhBfA2j/bb0Ix9qVKva7HxXiOaKn0sXOUEa6ZyIC43YCu6+LlV19Ci8RnpVAuLw6oyOeNTIU3nogMF2Dk4j2tlz01W224ePsXg5eNRhTkHXIZjD776/TJrU8Gbz2sp7zsrZr0fFiF270Mooar4MA6JMxcr/6ZeQ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2QpJFAMp22lxrN2GrFRn72hFu8MwfaxoDOj6qHbDd0LcJM4YGcavPrn3m45F?=
 =?us-ascii?Q?CLzccHiaKBK1gP6l7tYbIZ+KRDfYWp6kxGa6TuPrx9DBC2Ev4gI2ZVPegyGS?=
 =?us-ascii?Q?6ce7NCPxto7BbmGT+i2wZHUx3D/sUAG2A/aJHSkD6omP0bYCHlE4SO9yW3CO?=
 =?us-ascii?Q?6JqK4gF8fZCDzy+AiovCIENG+V5LCnLo+PX0U4Eyjvyy4OdLNvX5sXLAOpCS?=
 =?us-ascii?Q?n+OHKbZXJK12ywYCBZQ9qpQGLX81i5RpNIZkH20j4xziC2X3pSR+GR8qqhXh?=
 =?us-ascii?Q?NsC7vPsKCwVw3tJR+qO2pYfoRFPfyy9yc57eU1xvT8oYsPXp1f7+pKNj4aYe?=
 =?us-ascii?Q?jbZt1Jch7O3sBL2fjZz309Q8WXJlnLQwtUpGRqE1fQO+i7o2LWE5vqzEMwSh?=
 =?us-ascii?Q?QVHHjLSyL+LyrH4Q2PtzzMRu1/pIjklb5un93ksAsWQ4gX3h1aJ+MVNhWQNp?=
 =?us-ascii?Q?QTjAb95mExLLySiIjveaEjtXVjdC+mzUpYzEYBl/8BK4xHrxsXzBjkTSYi+6?=
 =?us-ascii?Q?cQ4Mv9lRL69Y+OhyHj8NQCW4bpcVTfo/oPhE+6Oo7aYeUbp5r5Eg1gEyTSLi?=
 =?us-ascii?Q?Gl6hKCEtl6M2gCsSLSfK7/VvEs23ZBEUCSKOmU/qRVKmWFFJzWX7vW4KRkg0?=
 =?us-ascii?Q?2jjkbfQkU7F92aQCr3T17+ltw0KuCVyNCprCKM6zgXjaMhns2XfNsDexjPzH?=
 =?us-ascii?Q?g3cUMaOWgN2mEzMGmNLyaHn3FoVUOgPFX5cSNAwzrfeLGL+dSwCPiQ+2cBrP?=
 =?us-ascii?Q?0zGlA8dYkfyvm0Mv4/OgZaZ5DU3XWfSoCyeKPspi0VA69RnQR0Q04hbS5X6W?=
 =?us-ascii?Q?m1Lzd/En1wc7VRMth8J6tDjVLeJ42uFKreJFgDUZg53ztQX6Lz1mBL9sV5LV?=
 =?us-ascii?Q?crqDZOOCKpKJiNb50BK0le7XA/7UdrttOcu54aY5d3OhqOtGtuDGqbx6FGdt?=
 =?us-ascii?Q?V12zoMC1ADw8CLaKdr6eQUHYZDQLRSXB5bNXb3JLXsh0ygrxTfT7sBJEIjOE?=
 =?us-ascii?Q?x0An8yUKuawUM8lqCAV9U8LeQfXwCLeRhLNKXYmiJ+k0OZmyUbf0AXc5vIu0?=
 =?us-ascii?Q?3Wh+uJdK+N4C/kOJ8FzkHxgX8XaKK/G4f50T/TiSSrL6DuSIF+dRQwDKAfSN?=
 =?us-ascii?Q?GNYgfyqdXpkK0cmbqCXndK1u0OpLVlfOTm/5d3gGc9DZEDfyT+bG2JsaKJSe?=
 =?us-ascii?Q?yl3sTxtWOhTv6yYimhft+OThbY4hbqFKJx9hkO1q5R96Yp0xvuagX1xEQp5q?=
 =?us-ascii?Q?Ed/mqR40pUCeL9Ht37Pu4mNFY3mL32lgLd0DmMyVzI/YdG4c5OogqpnCFDHx?=
 =?us-ascii?Q?ISwl/x1LuS28uBZPe408TpLx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6428581-5071-4c79-0781-08d90a58f05e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:55.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXn4VGxWJa4JpmHADdxfb2+tUtSqI4ctLjwhLeB0vO/lf42EzHkRQ8x5NNgZCjxPHOclovBvSMO+X1q4PmjlxVeLL28jk29jNQEg7eqbLYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

During reopen we may add backing bs from other aio context, which may
lead to changing original context of top bs.

We are going to move graph modification to prepare stage. So, it will
be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
non-original aio context, which we didn't aquire which leads to crash.

To avoid this problem move bdrv_flush() to be a separate reopen stage
before bdrv_reopen_prepare().

This doesn't seem correct to acquire only one aio context and not all
contexts participating in reopen. But it's not obvious how to do it
correctly, keeping in mind:

 1. rules of bdrv_set_aio_context_ignore() that requires new_context
    lock not being held

 2. possible deadlocks because of holding all (or several?) AioContext
    locks

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index bdfe59d94d..357ec1be2c 100644
--- a/block.c
+++ b/block.c
@@ -4274,6 +4274,14 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(bs_queue != NULL);
 
+    QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
+        ret = bdrv_flush(bs_entry->state.bs);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Error flushing drive");
+            goto cleanup;
+        }
+    }
+
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
         if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
@@ -4669,12 +4677,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     bdrv_reopen_perm(queue, reopen_state->bs,
                      &reopen_state->perm, &reopen_state->shared_perm);
 
-    ret = bdrv_flush(reopen_state->bs);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Error flushing drive");
-        goto error;
-    }
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
-- 
2.29.2


