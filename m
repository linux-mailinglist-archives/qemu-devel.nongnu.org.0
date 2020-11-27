Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D22C686E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:07:12 +0100 (CET)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifL5-00011z-CC
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1F-0001Rn-0g; Fri, 27 Nov 2020 09:46:41 -0500
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121]:11777 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1D-0003Hm-2a; Fri, 27 Nov 2020 09:46:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsNfWxT8nvgMj87GwIVcKHmB0GpEya9SUKIJFh7HytOsLH2dlB86AHvDn5qG0om/sDdvYMyofdMuF1zuAeQVfyfj5NmUe/uNW7glBydnSEDHfY3wasp2ky5H1k1nPRDh9PN6+Yhsely8Uuf9s5yLIuYpbNPdYvaKiJhb1L0h9XJtQI7Us4ER9Nq07TkCaubospykuOS++KbwlloZdvWG8yV/NySENft66Fx3gXqINanbkVb99yI9BCygP/P87a79eu+weDwm4HWfU15kXLduAKa3tEfPL1QZS+KY8gghrLtODC7wRc3LjZGgbF+FXq5/GtptUSPzbwSViLhXkkTVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB3T/KkLKWsrPZVheEQXOV4bic1dR0RSBknv9x9sjk0=;
 b=FWMZ6HKNRsrBmayyYL5bFvUPv1RLJKknW7Qs5v7SWuhF1JS/IhDTEPDwsXHbPpFZA+WpTXYXNvQwhRXhkWSQid5dl9IjgJmde4k3dezrAae18EmB3SQjLGHjbeS6W/LJfPM/QG2BUm8wbg5JObUM7z74OsVfCSbA9FQbDlDxxBl3hHsVBiHryeheZMcdZ6SHJv6HbBih4p42JmcfbEnQ+bhOZaGDAi4V6hnqCiBK+eCuQXtvgK4XiHVAThl/wIpgjIUa5SWYa62NNMn33kVIIrTlhYLcCbYFl/xOR0/TljyDoLOxHwy06XzVRlYTl/Zs5Nm26IPQk9+QMQMNYvfBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB3T/KkLKWsrPZVheEQXOV4bic1dR0RSBknv9x9sjk0=;
 b=EPTTqCxSEWIT7XhwZaz/U2SlAK0OqlaBHBrJmuQ9d5QgwwuGmMpGjHt+hKcBIyfg8DteVnTcS1L4mqHOgZU5qYgKyAa6gL0rl6yXGA26IO/ZlxyrsTgVwnG3c5Oe9avkNzFYHFD20qWFfwWOyBKZlqGGnm3sTMgQUmT/jOal08k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 27/36] block: drop ignore_children for permission update
 functions
Date: Fri, 27 Nov 2020 17:45:13 +0300
Message-Id: <20201127144522.29991-28-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36527453-aaef-4a1c-6c5d-08d892e32696
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078B2CB0E1FD8A66FEBEDA0C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftLmDpkbMFlwKUzZcoALnYzZRbXo9HC5ps5kzUBtLE+EF58EKYkXwFkaA7imum0U7GZ3wa7yhQAd1MNP1GpuuRIBKS2H9JTqIBmAuDGnJ02Hq3hGf6YQuQSFclDgasUgLuLGtd7Y0ABwWF0YIBRqgLGlkuTKA/57Vu/C2TuxISgUn5DDO9K/cjgcw3K31Arv36IQ7QpZOQaQwllox0DreWjjNzOPACRCwGGvR+d4D9lihz5Aa6z9LfLvT4WpbPgJeT+PoJsxhd7+gWvw0S59r29ZokBtYQxKiJWqPBgwW7BU/opbJyYw5mnYFkWilHHwUZ03nRyksCZ4hgN+g4N4kL7Bz4yixEnnb3FlW1AJyhvONIHCIOkQacOOAF3f/FmW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OdZ2d/m9F/wh2uVh68ALTjgbrOhC+XX/7eQHVvj4N4iMVtH6mLtLUP0XTq8P?=
 =?us-ascii?Q?Q70JKMTkiXws7U5Byavffyt6/XlnTyDxD1BRfg/9eKALV8XYudhbyDH1nUk5?=
 =?us-ascii?Q?SOZkUpV2pbtmIfBmPqtvFbuJJKDHHDPVsxFBOgzqeo4wkRhXXc++xC4/gHaY?=
 =?us-ascii?Q?5JEE3oSMJla4AD+yuM7CQRuhssEAGtbstbJtArjjWEzS5tqo5mF/h5ohPzcd?=
 =?us-ascii?Q?5gagVuBZZfdB657xhTsiLHvr/PddkDnY+R9Zr1Wn1eRsB0E3SdgDf667YgAj?=
 =?us-ascii?Q?7xgmUrlMxRfkpUgXb4QammY3MqlzctlOwHVNoV/uyMdXg0uPinYfUG7GVTEF?=
 =?us-ascii?Q?h01K6VE1bN98B184DSj0b6HmRvrBMBXO3sqEIO9u78YS+FcAkyzJYnWC5ltV?=
 =?us-ascii?Q?raJh2q14i4QoR2IQUc7cMQnDr0u6/IMiESEGnwuZXhK/dHNvzskut9FRa61/?=
 =?us-ascii?Q?CVTGTlRCOWR0DPFCyS2slpAt5oKR8ch/gqiRa/AJsUO/ioBzcES8vevs8sFu?=
 =?us-ascii?Q?iMShobcSZvvAhjssCO7aR/YaC6j+fO0rzrNVHfZq3S/92RbQS5a8hugqvwyH?=
 =?us-ascii?Q?AoddoIKB5ZQz3scymgYbHF+e4aJeW8qQCkwBBekcEOwbrncwdUzlD5S5Opt/?=
 =?us-ascii?Q?9z6zlG9SAkHObSpoOMXiuBg6pDcYZPujNw7j2rVOMudujulYXEeUFcupQhKy?=
 =?us-ascii?Q?DQ8PgqESGkBuzz8spQ7y15fqjqltjUnzLoEdtUigmCzdpiqiXm8XZXM2fKP3?=
 =?us-ascii?Q?VqbSjDsbVDHnnQowZ1+SJEkQctzwZp6M8jaybE05ARWDiKpU0QCAulEpD4ti?=
 =?us-ascii?Q?etn/eJQOEu+0vRWhCJebg3PojsgfWFvn1ZW2kCDNVkC5W/Nd5wJhAWpWcQXQ?=
 =?us-ascii?Q?/L5GK6+lRFTXAj/Gyq2uWYzWecrYgp2a/KsS6LzyapK9OqbTPRuh8XIQkxLw?=
 =?us-ascii?Q?H3khIrxmTGL4sZeqsallaDYYuXEWOC3T5ML7XkYU50u/3RdZArmBmTkJoNmb?=
 =?us-ascii?Q?tk5e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36527453-aaef-4a1c-6c5d-08d892e32696
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:57.7410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfbtQWEiRFWfC9iBHrPutYp9ARQF9760oy9MIsIHL4Hs0NISUFAFh84xX5ACgdSKrvuZZZ7bdwGzgNqXg71odh1CU+HsXoqBm4+jdqwNiiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.121;
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

This argument is always NULL. Drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/block.c b/block.c
index e835a78f06..54fb6d24bd 100644
--- a/block.c
+++ b/block.c
@@ -1934,7 +1934,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp);
 
 typedef struct BlockReopenQueueEntry {
@@ -2011,9 +2010,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_check_parents_compliance(BlockDriverState *bs,
-                                          GSList *ignore_children,
-                                          Error **errp)
+static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2024,9 +2021,7 @@ static bool bdrv_check_parents_compliance(BlockDriverState *bs,
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b || g_slist_find(ignore_children, a) ||
-                g_slist_find(ignore_children, b))
-            {
+            if (a == b) {
                 continue;
             }
 
@@ -2243,7 +2238,6 @@ static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children,
                                 GSList **tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
@@ -2326,7 +2320,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
                                   bool use_cumulative_perms,
                                   uint64_t cumulative_perms,
                                   uint64_t cumulative_shared_perms,
-                                  GSList *ignore_children,
                                   GSList **tran, Error **errp)
 {
     int ret;
@@ -2337,7 +2330,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2348,7 +2341,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     for ( ; list; list = list->next) {
         bs = list->data;
 
-        if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
+        if (!bdrv_check_parents_compliance(bs, errp)) {
             return -EINVAL;
         }
 
@@ -2357,7 +2350,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2368,19 +2361,17 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
 static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+                           uint64_t cumulative_shared_perms, Error **errp)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
     return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, ignore_children,
-                                  NULL, errp);
+                                  cumulative_shared_perms, NULL, errp);
 }
 
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    GSList **tran, Error **errp)
 {
-    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
 /*
@@ -2509,7 +2500,6 @@ char *bdrv_perm_names(uint64_t perm)
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp)
 {
     BdrvChild *c;
@@ -2521,10 +2511,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, c)) {
-            continue;
-        }
-
         if ((new_used_perm & c->shared_perm) != new_used_perm) {
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
@@ -2554,7 +2540,7 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           ignore_children, errp);
+                           errp);
 }
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
@@ -4149,7 +4135,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
         ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, NULL, errp);
+                              state->shared_perm, errp);
         if (ret < 0) {
             goto cleanup_perm;
         }
@@ -4161,7 +4147,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
                             bs_queue, state->perm, state->shared_perm,
                             &nperm, &nshared);
             ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, NULL, errp);
+                                         nperm, nshared, errp);
             if (ret < 0) {
                 goto cleanup_perm;
             }
-- 
2.21.3


