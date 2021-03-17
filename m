Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB133F3B0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:49:46 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXUX-0001WC-5r
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHh-0004gb-NA; Wed, 17 Mar 2021 10:36:29 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHf-0006nM-Tw; Wed, 17 Mar 2021 10:36:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noxbsRoAYEcnIs22hq5Unp2fCSJ2aBZPHFN+vv5KOI1L0q0deBhZN2cjIxpXGswRaLZUkcQA9wmJjgCQydCyiHuvhOC9VowhCT0NXYo9BBnbnP9c0+0G62GUXIz2AKmFEw1WAXybjN+TmoxqK/qp5FUS42H6ZxkiqIL/0SSClcGnSz35ZeFSW7OeWVJWipohO0UG9b3G9ZFIdNeLjLxsfpOqbclGQ3hI5kWun/rtcJGxL6tEATXpZNb6KqXOhqxK3sOUTL81ZXtciSmsk5bj24DCvEfXwYDTNuom+KiRD694eH1xVInQaJe1smk5o86fOu90fQwv6eBFkfRBODeO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVoUbX/2NBWkFRZH1DnLqOgabO3gdj2DysRzgJZEeUI=;
 b=dFZBgtqTVtBquv8higDWiiZ4HuzoH3h+Kp6Z9sK8upiSxV5cGEs7BwOmOsJByl7Ty7npFGrePQtcW56iRiBQw3AakG7MDfEQjAt6JTy8LSOKVOl4FVASWlQ5BPt/Aq9oxfjFnbk/MpeA3DCJN4AWUSoKNQkr/nm7LRg5Grl43udJN/+jQG9ZY/O14dWh1oJ4rbKN727tuAXKdI0OMO/hMU6r1cJihANxK+vSp3sLLRy8x3w4UIqh/gglzy+CuJ/dQeaNgRc7MSPMfE7jm7Nk8QFPrgVWIWPLBqXK1bJJnQsdunhVRMJ7YU3Jbo2GtaHdzIgbZvlz175AJHeSmg2oqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVoUbX/2NBWkFRZH1DnLqOgabO3gdj2DysRzgJZEeUI=;
 b=D9vzMrTnw+554YapbWbATExMtDXdEhaE0N3UTby95MwqLglWawg6EDPRK8kNPhuUlmBpUxa23ECCAdF02EvU0PMnoEURWDrInTSzpS4opAR6l9TFsexbOuhFxMA1dZAeG/HWp55deN/h5KmfU1KgDX1CQEk5iGo/IpjMKLoKQ0I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v3 12/36] block: inline bdrv_child_*() permission functions
 calls
Date: Wed, 17 Mar 2021 17:35:05 +0300
Message-Id: <20210317143529.615584-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc9faa1a-a340-4747-0e55-08d8e95207eb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16505ADB5E07BC560C9B7F0EC16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0e2iIUPjBPSqHFceA/1ZVmQWrhvQUhu6wt3A+PZsrAZeKFkxucG+6SCmRsIkWF9cXgLyk7rh9eFh4Yq8D+rab2+2XKUb/55OOjrfYCeBMhGmi7xUh7o0+sm1ZCtH0ng3YxUzIn4xMyzBrpkJNMLYIZ50jZIS7/dAVyB3gnoiNtyLJYZmu8m9tpL2M4oLbyh3P4VeQBBrk15kK9llCWCOX60PK+8b2vQ/0apsJBxdmA57EQuZdXlivxwFahoGQNmu40burzYBRRoiAFA0nW1UPpcJgzl78UsW5iRwELZ4/XxfK9pFqh0Wx1WCGJKMB8JGRySSJXhVuLPI+A1d7ZVyS9WXO/0aDiiQjJRmprasptroC3avn/4jeqwvCrBZrcNPelIb7mjESrFo2d0XjEkPLoG3Pj+Fk/UBaWkJEWxEDsF3zzy45y/EztQBMTVmEkXI1t03rqU2TsQ0C0UtW/IOeNxDR7In5Kto3604TUShCW3CKdVaJ6iwdZks2ACmvJMgs0cWwBirbrygrUbcDp2xIIcbil2O4H9G4dc0F8olx325rIBI3fl5m+N3OJODEQv1rZVwBx4SkgGfPOGehaviqC0DU88s0wTwBgXY8PLl0WzrQD3zDEHAaPdBTHjLAD1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YuV462oIn7/iKygyQIQ1cPGG1QykBYfUmEAWoLoyz41jie3tT3hreUwMPTBN?=
 =?us-ascii?Q?pDHE9UiSFtx2RZajlHTWauitviPOjlfCqEaEVUX6TLysAuAjSuwAwye3X6oG?=
 =?us-ascii?Q?Yi8XWZ84S5xjRcfth2HWW9jNUudZcBCvceNFFJSmdB/FdDFTRMqQ56UrnEpF?=
 =?us-ascii?Q?qxnn+nJ1sv8XyoU1LZkihEugcMreYRmVroLe8Set0uJvaLzprnrx+UPMl9u+?=
 =?us-ascii?Q?YInQvNlu7PEB3aBBlUy9ibFcMOv1OQMxNcBJz0k/KtZMk/YUpA6oMsHAejbt?=
 =?us-ascii?Q?fGLxMPrXUw+wCuuG0InGeSwVV3L9M37nsTLIlYKRiKvvRARZMNRbE7z8uyzo?=
 =?us-ascii?Q?cOODnm0DtGr+kzngq5Sidq2/BNbtq4WBLYPhhamsiNI7BxXzuuO4L6ZhyyX9?=
 =?us-ascii?Q?QzZYCTiJZuPI9lnXYgBFa0lGHJyG4JCMQomdBpuEExda+0XOfRtlV3HereJE?=
 =?us-ascii?Q?CEt9Nri4q3aaIQ4aMHfifNzsja+4085E+/Ypokt+prFoypGlnCO03oAtIHXj?=
 =?us-ascii?Q?BTKnZIQLiCUxljcriF1/i6yBUwjmWZ0h1DK1BJ+35HOuHNyuEX5dEGoM87Zs?=
 =?us-ascii?Q?OBKmqTYyknV44XwDU3om6rkGAYgiT85CL1DJchMTYYEiATbkusdMA/13aeA7?=
 =?us-ascii?Q?jwMw0H2XeJ4bCFMp8EFHmFNXiO9ngJ9BceoS6vJwSlD6Y4G4mc6DqMGAFVf/?=
 =?us-ascii?Q?WfpOrSIWuxvXkNdaNumbPqDLMK08cP5tYxpOAMvh9FYSNa2wJIHWlZPtYHD3?=
 =?us-ascii?Q?Djm/QGEix8zBLCu+vukX5ei/SCl/Xe5gaFRg9vmpPZh2De5XaSbE8bWkltj6?=
 =?us-ascii?Q?8WdRrNmtr7nBmn3Mbi21Sw/SKRo8o2KZ7TMl30Ga9DHALmy30sJWyWAshwiO?=
 =?us-ascii?Q?dR35auIPeG28IG4KCVhLif2t+FWwVsvBWfmjMe4SGWpX1I5tgO0rejET+3JQ?=
 =?us-ascii?Q?u2SIls7DDcmYb5i8K/mAobqyLlD1dg7gCvTZyuS77iCVcj7lAKkxwwOIc9mt?=
 =?us-ascii?Q?YRBS9LqCHgl8fCMrqmPTypH1tUglig7OQfORcmG2KlG7hgoHT0JcwkpoxCLo?=
 =?us-ascii?Q?iGw25DhUEqUC0LuICWO6kpZvVTKjALWS8RN1Ga/eqcWP/R76GB3faPYYWk0K?=
 =?us-ascii?Q?qvY0Ss47M3noL0N/iKoqnJdYt9RfMqPIX3DbDaAgOTK6bF4XDxAbpyx6I6ZM?=
 =?us-ascii?Q?QeSrj8Vg0SYSZ7qchfjUmFXOLUPwsmQbdGYe2ok6IfUo/RLARBLelZKHP70C?=
 =?us-ascii?Q?PY178nr/nelrry4PyTfRWd2wq1AJWSC7KHb6HJcfhdYrvFX8EGblhpCqxVnz?=
 =?us-ascii?Q?v16K7b6gm9V0nh2rkp3Z7qXU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9faa1a-a340-4747-0e55-08d8e95207eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:20.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBq3htAdq7++eTakThTHfotLJdxaZGOSBKc7OGo1fdE9+c8R/ZCRPHFUg3jMIx2UFxVH51Kyb693Ef9n7TfG7QLjjL7b6w5EEwpZIwWjRr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
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

Each of them has only one caller. Open-coding simplifies further
pemission-update system changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c | 59 +++++++++++++++++----------------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/block.c b/block.c
index 1f10ce1861..29fec1ffc0 100644
--- a/block.c
+++ b/block.c
@@ -1940,11 +1940,11 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp);
-static void bdrv_child_abort_perm_update(BdrvChild *c);
-static void bdrv_child_set_perm(BdrvChild *c);
+static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  uint64_t new_used_perm,
+                                  uint64_t new_shared_perm,
+                                  GSList *ignore_children,
+                                  Error **errp);
 
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2192,15 +2192,21 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
+        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    errp);
+
+        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
+        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
+                                     cur_ignore_children, errp);
+        g_slist_free(cur_ignore_children);
         if (ret < 0) {
             return ret;
         }
+
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2227,7 +2233,8 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_abort_perm_update(c);
+        bdrv_child_set_perm_abort(c);
+        bdrv_abort_perm_update(c->bs);
     }
 }
 
@@ -2256,7 +2263,8 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm(c);
+        bdrv_child_set_perm_commit(c);
+        bdrv_set_perm(c->bs);
     }
 }
 
@@ -2364,39 +2372,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            ignore_children, errp);
 }
 
-/* Needs to be followed by a call to either bdrv_child_set_perm() or
- * bdrv_child_abort_perm_update(). */
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp)
-{
-    int ret;
-
-    ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children, errp);
-    g_slist_free(ignore_children);
-
-    if (ret < 0) {
-        return ret;
-    }
-
-    bdrv_child_set_perm_safe(c, perm, shared, NULL);
-
-    return 0;
-}
-
-static void bdrv_child_set_perm(BdrvChild *c)
-{
-    bdrv_child_set_perm_commit(c);
-    bdrv_set_perm(c->bs);
-}
-
-static void bdrv_child_abort_perm_update(BdrvChild *c)
-{
-    bdrv_child_set_perm_abort(c);
-    bdrv_abort_perm_update(c->bs);
-}
-
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-- 
2.29.2


