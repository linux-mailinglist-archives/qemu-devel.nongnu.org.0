Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB23A2B1B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:07:48 +0200 (CEST)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJTP-0005Mo-5Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRu-0002BQ-Ij; Thu, 10 Jun 2021 08:06:15 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:15424 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRs-0004Nw-RD; Thu, 10 Jun 2021 08:06:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpgtGQMOilFvtYLnZ24nzozd5CHtxBjHctmPgAXCyqLJyGpQcvzISx+OQu0yKj1dNJPHhlRDIPzsACvVxwtiAHpC2K+BJ7Aavsz3eat1PkDMckfs6SmJBe/0FAIaFZ9ucGbCvehw+GQ76aYR6KUwPkQc1Ogio3zXNVT5gbqa4LJwv6Y5tjPqtdrfqhFxcvPsR60LbmaeUhfiXFOZ48u2gmXrj2yISATVdRNYOHMbvxHvNIVsJT0QrowJLMi6Jk2xcnI9tds2Go+YWaZISR4nTj0lxGrxHo8xGufYFVfiwS5B83tdVGlr3s9AwBMD2zqo4sc/RuRFIVWQadv0vsyDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K6v85Em6NlHRpNUMJVT92lfLPbH5vPdbKcny2F2KZc=;
 b=obkI6C8tNFOqh1c9BCVOnkGRd9Yh1RMGMROCuozd4y0kDNiQCD/BJVhfh5CEg3oLQTmM2rTM0giA5sudilpoKyPM54nTK9N2JCD6Zzwoqh6zGCvx6wo5nIAYb/I5biYQ6WvmKJ0ksDmZmtsgn7w4gd6Pbt4JwkJhhFp0tKZ6YWtEN0mdfnZ6LrgEPZVSixaRH1CEB609ey589NR6EeEvyup9e3x2v0CtTgQJIxANdhVjZ7zNsZ9jf74tOhaSXcD9vFqtRCZEh6TPc1mLikrjiO1ipVW7SQJrK+YVQTQA8d8I3rmi2dqbFssHxlktzGdUVOBeAk0H8RQL56nwaaDvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K6v85Em6NlHRpNUMJVT92lfLPbH5vPdbKcny2F2KZc=;
 b=sCS6nrriSf+wpicz8iyHeXnJF/glKOTkOCnTHuiMEs8cXBGvFR4MvJ8jWg3U/MYzjjbqUpJyVMgAijTx5g7AsEdhaf9NDed2ijGcr6aWhQyfvoP6xHVtqp6Fh26DxjYQvWg/8649vGoIYIHDzu90QJFVpRebHNbeITtlGPRv0Ks=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 5/9] block: bdrv_reopen_parse_backing(): simplify handling
 implicit filters
Date: Thu, 10 Jun 2021 15:05:33 +0300
Message-Id: <20210610120537.196183-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 931ff29c-9b34-44c0-94c1-08d92c081b38
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277097081246F932ACC25B4C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6AocsElK7nXz94h+ZRexPvJI3mchr9T4WVF7sd61a/+nfe7BHt4+AjcM3Yvad0c8sjveNX8GDVVt0MvHV/snxbR50yRP8mVRkjFK2mXAupA7r5uiFhFjPtYlj3K+moSJg1Y6Rq2XBtoHkS4SFdhfmWd0YnBt6QS7fxd8zNxFPsnmAKNk3XJzTfu/m+8mrLvPy1SIiY/TNS+BSlQwKF/8bzoaAMRJMnR5OGepOvCJb8t+iRNSNBv66kxOZtksr0HCDZsNhVsmDTBpSWvP8BJUZYyHNA4IUZVpAuh4U9gIr9QqCxzSBVyKQX2V8jz17oYrHKCr5RTl/a5R5s8KuiSRGZQ2c13/wjyateKqI2INJy41+3zE82J2SFeq2S1tgOAJyy0wb3uMzuBVJAGY6zwa6THZnYhQfVRHPUPwpy7fsjwNDRxhdR8ZPCeMkfB0db/ZggvUoFwbZFavG47mniGQRgYPJXsN3DmFeuwrI+ZHyP5qDZpq8bM+2Ss4e0WHlLoHA+6j5Z5v2g/E+GYw1jQQJqTS9YJBiv+4AudiBiUm0Z193DmTYNcjJPfhHmXpAE4zPdh9cMUrpVtJYsVaReMLPlmfO1KuRlu3y6AeiHxNTvZeSBDcbW5e3fZrFyWxyjhAe7PHlFI31r6HZ3Kl3jE+xL0YFHqUo8oVSo0Fq0dJjS0XVKBEamuyx+ro4zt9ksuS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o9Oz2k2Ue9qfdOm7ThWZrd7iq2iDlN+dxqLnldDsQ03j3sQ98R3DZtp/ypWv?=
 =?us-ascii?Q?EI6BC2lxpCWuSptEBz41fWBPs8sDhVoR7456Knh8dmVeCvR/M8ec/QVTkiOA?=
 =?us-ascii?Q?3hec115t3XbdS39fWMJ+SSlYjeKnHpHto44Dq6TSdukmk8VJRxG7bfMHlkMM?=
 =?us-ascii?Q?Pexe2ZSMahSEnC97Yp3+ObqPH1yYD8IUIbtGeAv7qL4q1oUAZKoNgeTF8Nyt?=
 =?us-ascii?Q?is57M3NKm9t7GcuU6r+0ikMzLpxs3znM1VgS/0WWJsKKSm0pJjYWVDKok3m9?=
 =?us-ascii?Q?dL2ac3muoZ6oXyhnwbjPcHIoU8KH8ifY1EX9+wdBgTJjySx2BIW85UhuxItW?=
 =?us-ascii?Q?gHhLUj4SK45XWRC75VqLHBNspwNQFQfHeL2dsLVKOC7o0oINY7NmT1a3dGtq?=
 =?us-ascii?Q?4BNdaAp+Wr3vodFh2/33m+w3YAccV6rcryy/K7LZTXMiDy0zQsLZwt+dOYcF?=
 =?us-ascii?Q?l2dzhEAb32aux1pUvqjKuETDvv7uH/yexyEiUi1rRpi+qjfcJZbM9WDmudnB?=
 =?us-ascii?Q?NiaVooDzTaTo27mlByHvM/NlCgRQyCoOVdIM6tfskQyGyYEaDpW569XjvhFI?=
 =?us-ascii?Q?VHvcSwtT0/NW70454RvLxL7E5MlEbzNIFvE+9VuNQleByuxiRH3UbNuj2nWu?=
 =?us-ascii?Q?YX1RzHczm4IrugCyPG7GQCcyq6+MHs89GaAABSX2o0HWva0aLfty5V6aoD4b?=
 =?us-ascii?Q?WF/xdAA3QCU/rdneg8gXWnJO67i1ru4cNv+M9LEhTQF7HUZ70cKECKYxd6iF?=
 =?us-ascii?Q?mlz4VXAcIunbxoMsHsX+1vBF08HuOx6yrtQTnCRmtjA/BkkitFQZYbYSWnlM?=
 =?us-ascii?Q?9f/veSf3gRDQd4uVxRE5DkD6SV6Z87F5swBiLOVNi7PljtSEcZ/O3sFkQ6N7?=
 =?us-ascii?Q?aYSsBxEK+bu4YS1KqBHQb54gao2Mc9LnKAfA/bCvzfogMyufc6yT25L5j41t?=
 =?us-ascii?Q?WpCglWpLoj9pDF0yFC64Amos8XznLno3tOEnwLzMo+xHLz6PQA7LgTRrhNSX?=
 =?us-ascii?Q?62bpiEHeWK64YPz5Y9OXmtXD/D67qVP5FwJ/Ex1Iio4h98rBHQdrq01az0Yq?=
 =?us-ascii?Q?aSXDAo07d4Cs13jhX7aJE9T4NCmqDDTrX7NJHpWgyp788C1BCQSDl6QGpvDb?=
 =?us-ascii?Q?jy/CCaSs+kxeybnOm2uN9IH8SIxqitrDFJLN+4L2qkG8fJ+fVA0E4RIlb22R?=
 =?us-ascii?Q?F75ebTZPycxDq/lK+YeusHrC8grdO5dW/pd4qRg/mJP5PRIwp3p8oZvNrpzK?=
 =?us-ascii?Q?qIsXds5HbayPISVzIhZFBDG2it4hPA7gOBwE3VKv5sRTcxXWeYsphG3+Ms2w?=
 =?us-ascii?Q?Nu0PrSHlQc6UvyBabok+cMLJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931ff29c-9b34-44c0-94c1-08d92c081b38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:57.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7UWZIGFloEkz1Ag1GFUsAxJ9rbf1onxMoiZEnYP33+v8AKREoP6qBcj+9n8CJXk/WkJG0WqBwHOCndcCcZyvWc7KkzEcegXJ//sQ3RCC4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

The logic around finding overlay here is not obvious. Actually it does
two simple things:

1. If new bs is already in backing chain, split from parent bs by
   several implicit filters we are done, do nothing.

2. Otherwise, don't try to replace implicit filter.

Let's rewrite this in more obvious way.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 53 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 37 deletions(-)

diff --git a/block.c b/block.c
index d86e26299e..1717e5cb98 100644
--- a/block.c
+++ b/block.c
@@ -4237,7 +4237,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *overlay_bs, *below_bs, *new_backing_bs;
+    BlockDriverState *new_backing_bs;
     QObject *value;
     const char *str;
 
@@ -4266,6 +4266,18 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         g_assert_not_reached();
     }
 
+    if (bs->backing) {
+        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+            return 0;
+        }
+
+        if (bs->backing->bs->implicit) {
+            error_setg(errp, "Cannot change backing link if '%s' has "
+                       "an implicit backing file", bs->node_name);
+            return -EPERM;
+        }
+    }
+
     /*
      * Ensure that @bs can really handle backing files, because we are
      * about to give it one (or swap the existing one)
@@ -4283,42 +4295,9 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    /*
-     * Find the "actual" backing file by skipping all links that point
-     * to an implicit node, if any (e.g. a commit filter node).
-     * We cannot use any of the bdrv_skip_*() functions here because
-     * those return the first explicit node, while we are looking for
-     * its overlay here.
-     */
-    overlay_bs = bs;
-    for (below_bs = bdrv_filter_or_cow_bs(overlay_bs);
-         below_bs && below_bs->implicit;
-         below_bs = bdrv_filter_or_cow_bs(overlay_bs))
-    {
-        overlay_bs = below_bs;
-    }
-
-    /* If we want to replace the backing file we need some extra checks */
-    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
-        int ret;
-
-        /* Check for implicit nodes between bs and its backing file */
-        if (bs != overlay_bs) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
-            return -EPERM;
-        }
-
-        reopen_state->replace_backing_bs = true;
-        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
-                                      errp);
-        if (ret < 0) {
-            return ret;
-        }
-    }
-
-    return 0;
+    reopen_state->replace_backing_bs = true;
+    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
 
 /*
-- 
2.29.2


