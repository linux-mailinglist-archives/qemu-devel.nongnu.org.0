Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFE3824ED
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:01:50 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXG9-0006ep-BA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0H-0003wz-C9; Mon, 17 May 2021 02:45:25 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0A-0001ta-4I; Mon, 17 May 2021 02:45:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVjwGKVCn2QEqLpU/fuIqGH9K+3cMzghRaidoF5v6NP1Y7b2Fn6nuu1/FzWXAjLrpFauxbpW84lboj6Kq5Ny0oQcghWMToZBiH1YxI5ZUSHeRjTADmy10ZbT9cq774GFm7n0lRYgRCbJOSE89xlFNaPR1IU1F6FJ2I8WFHYeyV8CtF6Q9tjqhU3XBtO4w7iMgw41OquvYk8riYEbpa/9wDJIkXj4F4kVdPZct6nKTL02lNPaIEcBFTJz9mBvl/Yqf+1v60mEoKp+P1aNFXqkKgDGMTUnYcTB+emLbkwikQkGyWIv0F3+DjCqatsd0OJG4dKo2+F4ExqW6fpVJn3N6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnvR79PeouFPdv1Cxp5VlTSC86W1JSFVcCHRYrvgwdM=;
 b=DTIs8ltwa+plFPg8wPkuKsAxwjFix3wPJzjp9zw25htlXhMwT9292ZoPAZW4ORzdAUJyd3ZMag3n+qtJfRmMYlDRoO+7Lj752qhMCm5XGlsjiYke65H7FSUGIFGzr+BMqqSKbsmvLU6ZhCh/S11dJtfGyaf86mGByneq71p03npkoq9judUWvPMvt+oWIlblwT5dyoIb7SF5sV+sSRS2lHDvO/oWICJd7oiA+Bm2yvlMIv/zrNOHmljm+nFZOwEnSPEmef2Ijx9lMfcX2K0MXJMbgYcqi+fgzXnY8o4DyugKlkSRFH7nWd7K0evajGmZKerRxuvqX3qC7K6LMvoNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnvR79PeouFPdv1Cxp5VlTSC86W1JSFVcCHRYrvgwdM=;
 b=fO7PJHot1w9Fn7Ms6tsml1gXBtcOMmmUocv72CBppkZyZ9ZVWZ5Ytr5V7n2M4AjZ6qGY8/Gj4zzHUa56Mz9TdGsap/YFXrX5An0teqZgZQgakLDD8vW3J5zEk3RS/m7u6AXKfRCfuNkcLFb5jDzEcVx9WBCB1i7xrJgIKlxBAuA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 13/21] block/copy-before-write: introduce cbw_init()
Date: Mon, 17 May 2021 09:44:20 +0300
Message-Id: <20210517064428.16223-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72d1d230-4311-4440-d0b4-08d918ff4c9a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434112EAA26426415CB72E02C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TaN2qC12R+rzzMSZ3XkSIvl7+EeLi3WpyOFPHdldnTWqXvqaA7nuF7DBlQdbUrwrOyGDop3rzYlxSu5AxaoHLo/q09SaYAzCrw0Mu56WgNdIjP0T6PlBtul4pnPcoypCL9rJ2glaJCufcNcNnhX6YlLlybM5QxTHjLTo66QhVsihH2ZxmvfLbVpOXudI3M74gqu+WnwvrNrc+0mJGY6OQwXAkQu1jYaO1dW05zBO+QA8mRsdB3Mifu/ZC8YWuJ4pX4pq763rNJP1lwTxMeNSXgRPazNpU7rS5tKTYoKi5dDxRySN4IbItqrdfwXw9vihtyr0ms28DwL5aWrt7sPW9O6ui8I7qN+UclRpKVYP+Vg5d7yRM2HqAo3Mt9KtM3LXDUdBBSbtCdy1XBVNHXfyDXb7OqUrjeC0acYXn2KRGz8rhAypbdccHu18WVkZ0n7O7HSs14YCPRBSlltHwQTASFjjYd3OX7glfOCTr1WknhMjQxJCzPSZs9q3mqZ6CvHy5vTnwkg/x1XjMS6trtZyoWflOuCzuMNSm5AGZhA5A+DlIfjd94l4GBfG9KkWEdvoHaa4G+6NR/OjAHW0HARZWATh9ucaid2ZO14MIgblBrPc0U9bXLK9pzhkcdm21M1vwFsPHBD4YIsQGqU1CgY71cn5kmtZimNrKoqlHneSujAkPFel9f4CGTlLqSVavMRk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lC+Ny2NyP/tgu21o15f6kuyyEypH5pPQwpfWwoKZM19jZoDfSqKEEZyNqyH3?=
 =?us-ascii?Q?2wdOd7BIzAleu0WZRFG8S9vT04tJEBBgcMPNA0VtKcPBjbuwsCNo3pokJGgx?=
 =?us-ascii?Q?g4DaRPIp6zXlpsdYQOah/ycgFF1NFhQUS7yA8COn37O0giGIZcmYHJeUNYbz?=
 =?us-ascii?Q?OeDvk6DWB3Wknx1gPYWkuZKJMG7v8gkkqV7YmFNIZIVVMmDRHdLnnbI6D+Im?=
 =?us-ascii?Q?GCFxWEp+GYtCXHPu4FkSRrkzMbq9Mq2969UlMQwl1Phj5NPiH11wmy+iuKoE?=
 =?us-ascii?Q?FbKN790flerS/36pb+ngokLbv3OPHsr2BusExSJdSJWZTL2FA3RHjXW4FXsf?=
 =?us-ascii?Q?qfoiaaiORqID6J6y7USV6aWe/IgsmgbQAUHp/nLcFYRFrrucVCromotU6SYF?=
 =?us-ascii?Q?ToH2eU4/ajcUsw6uEdU4nGqDrKdxs20PmZno3J+wl3CQUPmg4Ru11wabzqll?=
 =?us-ascii?Q?EDepkxQ6LyVlpXaU3aQ7/tbK61WPq+T4RhSI79lrNt8ETRHv/AmaKlV6KUnG?=
 =?us-ascii?Q?nAqLqfUg/HIpB6UFGboQJ5jkfzr0NFceUHqiKNsZd17/DtvUJlcsyhUH82hW?=
 =?us-ascii?Q?6nsqHvkVGd37Y7SG2/GS9mkYZlSBsgiyPV+0NejXVDmSDW97QpMaJoo64nXb?=
 =?us-ascii?Q?WjXrx8Vdi88cuk9RndRb1yAm+/cXTXaiuyJ0zn3DsQ09y/qi+em3MLztB1Ja?=
 =?us-ascii?Q?RwPuNZKwwCjxLKnXZI4QwGWwlnyNfXhpuyDA0FkgmYjMoAQ3UlkENdGjtcuG?=
 =?us-ascii?Q?11mugC565XC/xKHlRP48OY2bVubG+l1ju/pKh16+6i5hdkO70J2A7tCYg8Nx?=
 =?us-ascii?Q?qF/BKiAoOVFCcLR8IbBfLPYbKcCKFyCBe0YtUNm5i3ykpElM9UUq+6VKl+FT?=
 =?us-ascii?Q?rdXCyfd3d23sGDmQIrTng498sCM39TW5X3IPaU2pldXqFvoEQt5wQGDXrfLO?=
 =?us-ascii?Q?vOdrdLf7z2f81zMWzLja+X0ZDvMus8MlHwgPzEoz1sRHkK8M84s6ZrOA8LrR?=
 =?us-ascii?Q?4lWFV5PGkt0HI1qDQ9VKgL5l4NKj9GlzWqzIhodYaxUxtUEDtR1+4WUCPFdr?=
 =?us-ascii?Q?q9Ia6lKSfVLQyLsR8IYHggKwwE/XG+Z9XyoZu53mw8MDSLgD77CR1Lt101XM?=
 =?us-ascii?Q?51likcKHgVefYMfag8AzzVrOM5Mbt5paJPY63+f2seH5AJNTzE4/n2apN6tD?=
 =?us-ascii?Q?nl9xToOcsPc1pddN4pdYTb3Uydsy0V6p/aQAdv6Q/XPTcUdRAhV5A8jbAtvz?=
 =?us-ascii?Q?pD4v0RqnoNWc9Zxn6lcaegEiOHyrNwGll0QAFbXLdo03vBYP8EV0k3UvmTZ1?=
 =?us-ascii?Q?ftQe0hvuf/79RXC8kM7Pt8Fe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d1d230-4311-4440-d0b4-08d918ff4c9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:03.2956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32dHKwSmP9b+H2n7A2dwALGLnl/eDs57j5A5ISLasK8LbeeUL4dZqQ8XflXnQvc/8FtXafaH4iJixTv+mqpHqHYEpgE4AhQfS8UVc0ESzds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.124;
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

Move part of bdrv_cbw_append() to new function cbw_open(). It's an
intermediate step for adding noramal .bdrv_open() handler to the
filter. With this commit no logic is changed, but we have a function
which will be turned into .bdrv_open() handler in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 73 +++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 35a9aa163d..94b1357fd8 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,6 +144,47 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+                    BlockDriverState *target, bool compress, Error **errp)
+{
+    BDRVCopyBeforeWriteState *state = top->opaque;
+
+    top->total_sectors = source->total_sectors;
+    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & source->supported_write_flags);
+    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             source->supported_zero_flags);
+
+    bdrv_ref(target);
+    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
+                                      BDRV_CHILD_DATA, errp);
+    if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(target);
+        return -EINVAL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        bdrv_unref(source);
+        return -EINVAL;
+    }
+
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
@@ -181,38 +222,10 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
-
     state = top->opaque;
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
-    bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(target);
-        goto fail;
-    }
-
-    bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(source);
-        goto fail;
-    }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
-        error_prepend(errp, "Cannot create block-copy-state: ");
+    ret = cbw_init(top, source, target, compress, errp);
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.29.2


