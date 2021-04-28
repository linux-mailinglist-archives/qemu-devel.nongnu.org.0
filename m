Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE636DBE2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:38:10 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmGP-0004fb-Do
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyU-00061J-6L; Wed, 28 Apr 2021 11:19:38 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:24602 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyQ-00028J-N7; Wed, 28 Apr 2021 11:19:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/oPCKCZQBOgubJAqqtTirV3wZjcuh6mqpVfWTCpukQpmGpOcQunvQgelhb6pD5kbVUXI60SCch5q08i18cZXjXqh29tZjc0wJ6WhgQuk7PUhUnEJP+TVDoXDY5TQiJA4JxAcqbDa8tiu9J9zf0Y+0iVRN+dAZEJ4Ni2NqOE5n+Ahjk9sLA7olC5mLCVLAApiHbIj7qRw9Ej6SIDHiQLsGGB32NQTXUs+sNPX+RDX9qDx9i28ed4/SwDboJRCECyxaV+iSZVoWF7SgvvonqMuPcpMJQUfnA9COA+67VSextS3nhsysqktgKIxP3rLt5bd641SM4c/UvZCivwfAoiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SrOpvHDj9uB+6KY+IBytWoxfYGMZ+pPaELcA3PGUfY=;
 b=bskXAUSRZlWscmg4GOs5c+IOIYTo7qbQfoy7rxDNfJ//v5mBWvXvluYGIiOnigrFRQEzI0ejWr+YekhecGCvb6N4UuURX0tVhmwVfLjTEQoqUji9zfT7C8dEIXg3nERKXsufH99BK3rG0+lB1eY748huSN23EmyXzGSktXjW/I6jjxojYkDURUzh8zum3e5VhsRmWBIxMKwHxqaZmhTFc4P8nGd8MEAodKv3mt0owYc0B9niSP8X7rcn7jd/NFJrbU+DPtquTuGJ4XWLeJ2mNmOJplBi0e7ySYyr3bnr28rkkuZC4choJX6pNZ3ddTZWPZ6PDs9jpAlB5I9dXcyDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SrOpvHDj9uB+6KY+IBytWoxfYGMZ+pPaELcA3PGUfY=;
 b=SMQEnxDo+7qcuRFvQaHQK3Sp+Brdp7aExU/hABBDz4SmJJ5MsSKkn9f/lBfXLwgg37OJW3rew7R5zXBo1G4jLeRR19QtMaEKNKz6Tk3sg0DuBdfWbSq4YzXUlPW0bvcE/MhNyfL52xofUfn6uXqLzVHQFxaT9gjINXb+I1JiGuI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 31/36] block: drop unused permission update functions
Date: Wed, 28 Apr 2021 18:17:59 +0300
Message-Id: <20210428151804.439460-32-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3527dbf-bcd9-40e5-5ebc-08d90a58f1af
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24190025B73ACF16FFB191AEC1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VsiYOqAXrr2c7q93lC6RZRH8qZSTuIhQD1+yeJk9R3eiNcrpDA+vNhkqO/7+IfBK99AzqJagyzLQkjaDRSspQKbHoveLpxfxMOJA9tgLQKNFKWISCP9+GZcgLR1+dhttCpm8ZMO+ApBwd8FYjQSUhESg4JAKyFQaLpQ5CrnHyLAgV/50lnIal8VsLj4uhSIxhQmTeAE8PXKTgsgFdpEIXEFOTtUXYJIGuwoZX5bn+TNxgd6m/uPBAgy93SLGIKSYa+RlpLGveIQnfnXUuRt7lToHOW12zsSaVpCzULMwU48MNWL0W1vMRw1YzFmWZCJL/v2yYf4i/5BC/jcp46OhgZGxo1MYP/sFLYNgI1Rn3qWSH89jqrz+BjNeWBGwCz5CM8amqOVvKqVMMinqchcgPeC4sgnv0mMkaiOyDobX7EzBx2OO8hy5azAQlkX3g+daJQx1Da0YG7CyqaXhJQ4atYGmM48tSEUTrNLGZ9ih9AL0ot8JLKxo/fPrWsKCO9xcfXBc04h7KG9V+/zGhcOsZrwaA5x9VBBzpLZ1fXF0nc0d5+O4Iwu/B7TkC0AoqdEJb/21oR0nObifv9b6MTKgJDM/I/r9ZKkhn6cmZOE9HvuWzAyzntpcmTMR1QMSZHk6mxi/vXp3BE/MiTaJPumAvnqr1gC4PqNLUf/aqRNTjlYTHg33V1OTAeZbF7qHpAAo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(15650500001)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MC5kRuN61D1dwSTJnxOtbuZufZY4a0rBbeM/1D/zoZTar23G9Mt9r4Fh9dA/?=
 =?us-ascii?Q?86oaF7DDonLWP7v2HA8nw0MVlhLML/JUaNe02eoxLeQtpvkaLmHPfdblQF0u?=
 =?us-ascii?Q?ZrpUQm4WSgqDU8Bqp6TfhoMretdLaMSyiPknPulpSJQDwy2lI5zlGBtUKaJA?=
 =?us-ascii?Q?aYmskrdg/vPI0ubE86VJBpe2N8Ntd3D3NpCqKB3yg9UdcuUtwUkQSO4xFk7Z?=
 =?us-ascii?Q?JpfRqB0/jluywGla+qmVpoqBCIJcGe9mMBDbiu5hJsKBL318yjuyZ34oFkdc?=
 =?us-ascii?Q?ZtQC3+jja7hFpg+DAmgaScclyEj+1xrpMg0FKpyYNSrKJdw4WCDxqwDf6vps?=
 =?us-ascii?Q?7HGxrEBBhrJJHlt2SVNVIWS1LVQz8QVaS/h/hpdRKrrWnJY2muMgETswjlBJ?=
 =?us-ascii?Q?BHSmX8fWMsmzGKIRdm5c+Ww8YzQ9yUdKMRVv5iEu8yBHq/aBy0gDK/t/LMvc?=
 =?us-ascii?Q?598fwMBQxHYXaEKV3DNqzrB2PfuLGGCgMEEvTOihNhE77ZE8+9a229iZ+zrO?=
 =?us-ascii?Q?RJiRFyxzv3UA0TFUTk7Hv7fdamhNHkNAu9V/MVh0J29H7S+kzG+7UI2CddPt?=
 =?us-ascii?Q?ip7qvDmGTRspccUYNFFkQsyCAw6O22c1qA+gsfegMbcqwdk530ReySyG5tnb?=
 =?us-ascii?Q?xW3dl8I3tZlkg1fLI2l7L3BkwgSveqJ9K/nAGIXPwgGnLy1ebD97L4Bid9Fu?=
 =?us-ascii?Q?l2Oo7pUC0Tnhp20MrGF9nJRH8oA+XmOVhPQ+YeId+8nSPc6oaY7o+9vGkeYN?=
 =?us-ascii?Q?QjmSEqWZk1+m27l1S1/nEzql1pisbDt1FQB5TvbsldLtPlqoMBzKFi7PIjWb?=
 =?us-ascii?Q?Itli3wOM+z0TmTXDq04Z0y8yOFWuTBgsVieYKsCr6W9tTPt6K50/x5l6vqvb?=
 =?us-ascii?Q?QjqLKLyHtFJri5dABG8ACwJ7PCcDjGtANpUgT9SGHFI1TK5GJYf53q78VLKr?=
 =?us-ascii?Q?naH06LmJn2MLTnwpzIMpW8YKPO4WZT9WlBLgMa8QVerC79Zx8Mm7nSeE4CTI?=
 =?us-ascii?Q?g1DSHw44YyUmu1hwe2Clmr5yxL/X3NyFuHNMx50yqQzPhwBVgkMQGHv+DQwY?=
 =?us-ascii?Q?unPhwrVYi6+iAFwzqUlXRtbSM0MEcR3Y1eI71X8fR3S18VLaW1MWtEy2dLZ2?=
 =?us-ascii?Q?QFYCK4A0Gpk1hedoPcljJKk0iBF8rcuRo44LCWr8y7gKhONd6kbxAvq8NoHk?=
 =?us-ascii?Q?ubzMVEboCW560EwTfSlUDD0w+wsUQ9WWjN1xn8yS3LDOtCfDTkgTUiB/QKvv?=
 =?us-ascii?Q?UsbY0YqiMi+faC117hny5BXWeYsanuBEY5gzYVDhtzi/1cx0QQUX9agXcCOg?=
 =?us-ascii?Q?xzwhG4HG7BvouCpANXgk3Cu9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3527dbf-bcd9-40e5-5ebc-08d90a58f1af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:57.9361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Z5kcWGj4MGzAYKTFsVcR9kwd53IFQBxsKsYwLjAm11YemyRTiWfFZhPXXpRLmdTBv/uF4sIml3hvXvmDhfZznkZtq6dFb8fExluwXJIc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 103 --------------------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/block.c b/block.c
index ffaa367a1b..bf7c187435 100644
--- a/block.c
+++ b/block.c
@@ -1987,11 +1987,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp);
-
 typedef struct BlockReopenQueueEntry {
      bool prepared;
      bool perms_checked;
@@ -2426,56 +2421,12 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms, Error **errp)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, NULL, errp);
-}
-
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
     return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
-/*
- * Notifies drivers that after a previous bdrv_check_perm() call, the
- * permission update is not performed and any preparations made for it (e.g.
- * taken file locks) need to be undone.
- */
-static void bdrv_node_abort_perm_update(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_abort(bs);
-
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_abort(c);
-    }
-}
-
-static void bdrv_list_abort_perm_update(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_abort_perm_update((BlockDriverState *)list->data);
-    }
-}
-
-__attribute__((unused))
-static void bdrv_abort_perm_update(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_abort_perm_update(list);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2557,60 +2508,6 @@ char *bdrv_perm_names(uint64_t perm)
     return g_string_free(result, FALSE);
 }
 
-/*
- * Checks whether a new reference to @bs can be added if the new user requires
- * @new_used_perm/@new_shared_perm as its permissions. If @ignore_children is
- * set, the BdrvChild objects in this list are ignored in the calculations;
- * this allows checking permission updates for an existing reference.
- *
- * Needs to be followed by a call to either bdrv_set_perm() or
- * bdrv_abort_perm_update(). */
-__attribute__((unused))
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp)
-{
-    BdrvChild *c;
-    uint64_t cumulative_perms = new_used_perm;
-    uint64_t cumulative_shared_perms = new_shared_perm;
-
-
-    /* There is no reason why anyone couldn't tolerate write_unchanged */
-    assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if ((new_used_perm & c->shared_perm) != new_used_perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-                             "allow '%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        if ((c->perm & new_shared_perm) != c->perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(c->perm & ~new_shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which uses "
-                             "'%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        cumulative_perms |= c->perm;
-        cumulative_shared_perms &= c->shared_perm;
-    }
-
-    return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           errp);
-}
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
-- 
2.29.2


