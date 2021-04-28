Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6036DBA4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:29:59 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm8U-0005wr-NH
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxe-0005dn-I1; Wed, 28 Apr 2021 11:18:46 -0400
Received: from mail-eopbgr00101.outbound.protection.outlook.com
 ([40.107.0.101]:18563 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxZ-0001u5-L1; Wed, 28 Apr 2021 11:18:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrmMiPFZmBqQ2XpV9MmUKSyc+NtOW8qCL+DjiOS8C7/CxalnDCdKIatsDEUPAfLwt6hK2eppFmPCKLhLwVqOaoMTyo46YNFHeISxjRMMHM8iA3+0afuySplHjwdpAPPS6d/UWPrUWPWZTHlD533+WiZmnvfORFKnzJrQlSmkk/BLusp+Iqxv6MaLeDjVxVeHxWcRE2OawsHFJ/Z2YuQiLyDW5m/o84KznHNQQ8rb75B1c6kFPJU3ImIeokHS4vUm6W6+9g81dflNT18HyyowpSBbyMa9zXJMLTUtO+ZhTl68i44jJqV4wY3SF08M6uxI/Se3h1xdZgdlHNWGMIz4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZ03eK7yF2VPdbxRI1X8bZWX8vB0DuxkCNnLTEorQ4=;
 b=hi3IdBgH0Z7wjTQyIZic1O+BFpZp+X7mHZ+zg9BoXoYn6BMRoOhVtchjCeL5MV7b1wEiMg7R61dhk6PqLretabCA+ZrlDoBpfv6vW+WEW25XlLwxqvM3am4ZyM0toW104MK3AU0Uc7ULzfR6nqdBqtnKoP6CZ005nIQU8T7rtNRnPVfpQf/NwZojZDovxbA9uIWnFkz8DlzpfBgWg3YJF2N5+W7iu7aq/gGjqtTJ6j00ZuUsya4KioY9aEnLQ+nuM2zw1NBBxSNmwvGVOQ8rBN5VB5/OmcGbcxJpX9maRHkNLGJXz44TOaMAJSBtOsWoJYoA4ln9/AVQRhbS0albuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZ03eK7yF2VPdbxRI1X8bZWX8vB0DuxkCNnLTEorQ4=;
 b=OlBMKpzREb2tJAx16ZBYU3QkCQlG0YrXuPgsvkbwOSNfa8LINViw0AHF/7mEynKY7h1cO9+7tJ55bxavx8BSOEa5DLUEs8APyBDbDCWTY8izRICDwaywLMGyIXhUEKP/A9EPewGr9Wfk7yMcEmNlAoWoKbk+4zvhCg6WOsav/J8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:18:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v4 12/36] block: inline bdrv_child_*() permission functions
 calls
Date: Wed, 28 Apr 2021 18:17:40 +0300
Message-Id: <20210428151804.439460-13-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48806cb0-87c4-4010-f041-08d90a58e483
X-MS-TrafficTypeDiagnostic: AS8PR08MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB635798EBD12947DFE0848F4CC1409@AS8PR08MB6357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ht4tIhgwWSBt/RFXkxk6w79e+EsWrrn0S1qVa8Tq9RvnyIvJzqkvGZ0OQ/HeAhUoVfdOLQBAXvW2Bjt4RAJK569yYDa8r/hgOTPa0xkJTjyAV3ysanrXagzvwj1VLjHMOlKL6QKbZcwPzEFkcX/EiCEiDkQp9PywiJfOhl8BB5eqJg296ef1974982fbjkw7QDy+t/uUu+W9F0PWX/pYWd9s+mNrH5NBpP01qvyAjcISLIMNCIjuUncpSZyMmtsypX2DI6Z7dWFvk6blP2+UC+P5TOaajtiYIZBgUAq6xBDUr6T8JfVERNpfXqVIKMO9jHCEEf5gquPzUWvQHk6j2f9STB8ve25t1I+wii4RTWt1YDVpJmOWXiexlEvSUjhCO0mimHursFbTxrGbUDdGbfb+ga/NG/jqVvv3o3ZX96kN1E35wicCTp1ua80KARUmZImEPJZ1Ka9Hz5To7YN2y49aUX0sf8iFalwlPKp48MVgh3/nb00XrATlmHkRXdYsozGqjWHc8aWj/1ELvVSiIQ48xGCg7a5fUAa/epwOlLgXXhL+4J4FS9zzU6pqX/IkLsI5vSBR+V0p1gD2295eKF/WQMZwky6V47daeTQokd9MMbvRwf97/adRN4G6+ZQdCMi8TrnMnbtu/09cxQmHVnGvzlTSrcnyWJw4/OikrBB+Q4FfXKsvd14H9seHh8nE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(376002)(136003)(366004)(16526019)(38100700002)(186003)(66946007)(26005)(5660300002)(316002)(38350700002)(6486002)(66556008)(6506007)(6666004)(83380400001)(66476007)(36756003)(478600001)(86362001)(52116002)(6512007)(2616005)(1076003)(2906002)(8936002)(4326008)(8676002)(6916009)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sHZrlW0D8na64hWKZTziCN1c0CKJM//cZtppd5rNq4a7RLMPvjybEvmxp35p?=
 =?us-ascii?Q?sAYWGgmz4F1L7QoolBeCJBp5O26/Ikug4c2z/qMxYTidtg+KXm53AByWgQqC?=
 =?us-ascii?Q?3UyRhEszwbObRyCdF4FJr1OjSu8x6lFaHPZtkw/i7Jho7rP1T4W9X8andAl/?=
 =?us-ascii?Q?nRhC669QX5CGN8DDz2S/J1C4+24u04Fv3lAkDOB75F2RZmlISlSA8O7y4SnC?=
 =?us-ascii?Q?Mt3jIBEoo1ZsgYNgljEiCyo1wlv/wbBpgi9TfOzMvK8D6PfRMfOh5RBecyQb?=
 =?us-ascii?Q?ZkeeTyW+zBquF4aotDkU7BHBHkHjwxCRYWeO2EdcX2m3lyxhLkFx1BD1ezzQ?=
 =?us-ascii?Q?HutGLF2qCaE5U9puxlHZeHaN2H20chHP1vvfKqSMYkpfU2y1Huzg2Xx5PAci?=
 =?us-ascii?Q?OeBNvjZCKlAOFyEG+ff4f5ro6wKNEnIhXD2DjmQW67ZLu02ChQH7x9OBZXHx?=
 =?us-ascii?Q?/DLw0uWo2agEFoUCm76NeyPNqqQtNAkCghAnih+4oEheEwGYWQzdb+IdUgC3?=
 =?us-ascii?Q?xT2MOD8kHB8942YCj5gyhV0ZWJ1Rc7Jd0rh1woqvxlnUBZVJl0oJCUCShikH?=
 =?us-ascii?Q?dL08R6MEXxXx3eGP2gfXANKcA2dF+nCwRjOOGF041BdwfF5GHkNhGz/VsnVE?=
 =?us-ascii?Q?pbgVrXHloJvNRMGOZ45HUeY6Vpzy6UgIfE7Fn7QMXclHNf/qg9+m5ve77/xQ?=
 =?us-ascii?Q?axVjt+gB1ZxiE1pTdLCi4xv3wQUfJlQo+zdyvGomzX3zVmLCVv5cg3A3o8EL?=
 =?us-ascii?Q?EklUqbaLSWGpBDWjqzhbQicks0YdyfyCy8IxhPSOSDPuAKrOuVL01YVtNzSN?=
 =?us-ascii?Q?zEKMEFhVlgWt5ydMclEf7WK9Y2mj2UVjQ+gwPJcGwVLcsROT5fRRaDE+M6Rn?=
 =?us-ascii?Q?7WpeSQ8wUViMQKKtM4GNe2+dX2FPIbhtgbl+E+VNWF8HctMYx3NhehkFIfwD?=
 =?us-ascii?Q?B5YJbvUIR3yeaP4jjemt/+KCFTApil9B5loOfRoUMw84V6/kNTRU6ixJDgOB?=
 =?us-ascii?Q?SEa1qzspUv+o8p7aiehTi9LoVZCZ98hnlviPfEN4dvlNZY7Gfr8V3F7PpCHX?=
 =?us-ascii?Q?NEP9OTR2xX62wb0s9m/hlZhGKRXS5cwv5LVnhUd++Ev99WedpiXhj8noBsbV?=
 =?us-ascii?Q?JGmKIzALwW2yDqeKSnksrnfIXA/lbARTpKRacR1nQdhUJJr9Vd16/IeGLtoh?=
 =?us-ascii?Q?dmhkCbWj9muCN+zvpo+NEYnfrE3l3sAMpncNG61aPUe/juFXWC+DVPFa26L7?=
 =?us-ascii?Q?3OOQSbYYfhguboq0sj7L6As5pK90SRGjbkfC6FTNDCw9h81Oe8i3+7qLQvX6?=
 =?us-ascii?Q?6n6eVyJ5uFdRmzyU2mYGQwZQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48806cb0-87c4-4010-f041-08d90a58e483
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:35.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roksWajSZysqpeJqB9JHp2oUEGhqqc7dEcGcdPIhT/B8akzen00oOBvDX2K8Ll7KgN6Q1Rl/uPCHGujV2TvgkViEmM1sEF8Lbcr8uijkWv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
Received-SPF: pass client-ip=40.107.0.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 59 +++++++++++++++++----------------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/block.c b/block.c
index 4511766825..e5af4cdae9 100644
--- a/block.c
+++ b/block.c
@@ -1974,11 +1974,11 @@ static int bdrv_fill_options(QDict **options, const char *filename,
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
@@ -2226,15 +2226,21 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2261,7 +2267,8 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_abort_perm_update(c);
+        bdrv_child_set_perm_abort(c);
+        bdrv_abort_perm_update(c->bs);
     }
 }
 
@@ -2290,7 +2297,8 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm(c);
+        bdrv_child_set_perm_commit(c);
+        bdrv_set_perm(c->bs);
     }
 }
 
@@ -2398,39 +2406,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
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


