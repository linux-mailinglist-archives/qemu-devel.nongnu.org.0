Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE236DC84
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:55:32 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmXD-0002ub-9e
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyj-0006PA-Sw; Wed, 28 Apr 2021 11:19:53 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:24602 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyb-00028J-FY; Wed, 28 Apr 2021 11:19:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCz1NFUrJzdM7zeB8957s2BYVG/4GtkMT8sdJMOzI7E2VGJ2tL01uZTEQ+xYLUjbVS+VppXr95R4BQ0hx9moclmcM/0q2438QD8CNWrgzJykR9Np/vXnjniDystFQh8YrHfMo2o3A0e5/oH+GFSMKz9FjLcXjG5skMi7AwYU6AKB1eaAIP92O5DoGLCXQ23pvpB25CJTWoRJlYSGE14ynDBWTPdhDEa1qh8YC3v/gEF3Vb+Iexhvu2sfCcsBPMH+6V6kZwTvSGn9oBmS5tPVtWuQ/EkCsh14uGlxvvXD29ucdQHvyeaE8rdhHJUDIFOg8YoJbH9FjTfDUdbD2SBvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6vuoQIe0tQV7yLL+G4SjbAzhdWhbluMfu4NnBUWWuQ=;
 b=NAoapUUk1h9f9IqsZzlI+EATZzybusYA00vterNmj7jqCn1U4PvJP9Z8SJiR67m15aFlRRGEovnLZjFsapL7SdnUbGt2FusZirt4Tr46Nxz7Mrzqv8HmGQqGap/nSiM2CboyiF/KOsJ+RG75+rBF7zTBDFnXJzTo49hVkbrIuLSZ1KHSu2cG19BWbRMANSjKfxi2EEkN6REmosSigvOj4cWJRlyMDKtrjR2YahiIOnL6ywMZObd+caylsN4LFnRn6ita1PbmMgHAyU3JfNWzp2b7Mn8+6tOUzsRIoR4Du0OAMSUAvqoXM5UeXfDGyV1Yy0jHjzjRVdkjr+bqva5Qsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6vuoQIe0tQV7yLL+G4SjbAzhdWhbluMfu4NnBUWWuQ=;
 b=uIEzU1/dT5jLLWq2IjDUMEPSDLSNiWdZAs2qmtjvOimJN5pvLwcgdaMnPTAzQ2Oc4ojrhe/VCXUI6T+K7Tf3icp6mb5/enz7J213ZZ2dgMw0IDTpbdDuPnV3ljXwBX6JDKdGO8UJ8BVdcIOVS4WZkVjsOTI3pUVFGS2hQQNf00o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 34/36] block: refactor bdrv_child_set_perm_safe()
 transaction action
Date: Wed, 28 Apr 2021 18:18:02 +0300
Message-Id: <20210428151804.439460-35-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93947dfb-f9d5-4abb-4b03-08d90a58f3ad
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB241975C4B124425D02B0E946C1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIOjUfxXjiCIaaACDkAFsCP4e9Bbw/imW07yYVKR8qzqzojfEfaNJHl0IhkzOTkatIAnszY6Zo+hH6C0rDuCCdWXFyMtsX3jDxSlBRam/xlPoXx9/7nYRw+qzWGsfx0MNTVF5biMdUs9QUVcn8D3dvn8BMuNxsHYg5CPnw2OyMK0ZqRj69b+8IumJ1k0IjLiJ4XFSgUMozor3Ohubg0DFIuXcMft5g3fr9orHf9mV2U3R2sFKG3meaq0mMC5ujgi5dy8DSlT9AcaMveIjLBfVh+ckJXNWly2rYhg1k3em6pC6yt5PeZg5KlXw0uztbM+RWfu3YEciMazaBx79FAfzn8bPekm0wEV3WYYNQSlKKXfrtrZIwMm7ZI9dPA7P7oCLslMoQNQXSBRVa3wFGmlnRv71HEQgWAKoMjRTsyBglRPylSBxWFg7kHbAm0yiGam8WgIwnrSZwGMzGVidJbrmJRQ30iXO1pccqk2p//va7AFJHQAKqTzwUx2tyf+qIncXje4OY2MY3YF5cCO+738+INiduujRj18XYbHkjUuSGeDgfcLMxDP2siQepUu4CgvnULn9HPdQQ6Jrb0MvZobAud9dhVt9OsdnJogMic46F6mF27Qha70B5S1TNdonb4ftsOggZmhYxcn+6KqMqIFjAuW4fkqPSSKGjNE2rFrnCD6S+6sN/xgijT+dcH+yyKD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SM90a/hbC//jwVFQq2xgBK1Het6B5bfVquFgW0npix5T2/2msWTVtbSTkGqj?=
 =?us-ascii?Q?qFLQNhD3T7iSVK9FsSdyAxvdnHgfUgwzqO4eQQx2MyiD6hiYvABMOhE5UPvf?=
 =?us-ascii?Q?2GFY+PUWz75A0+mgM1F19r2P38ZpwN/TLFCqU8FMo8nFQ0wkH463+aywfmJD?=
 =?us-ascii?Q?KM4bDtgSGNDPeAVUWAE9wGuziLq1F1adpWrHXL6LysY/FHiPn8nzeOqA9osE?=
 =?us-ascii?Q?7eM3TXY1OWxozyadyAtSX+jF47r0xnfeGxXv85lFLj3OcxOc87wahEolJtAb?=
 =?us-ascii?Q?kUFxl2xNn0m9EmWfM8pa0tTZtjPd4PN1tm2Tl97wthrwqp4RCJpuUEExHfjJ?=
 =?us-ascii?Q?vjjKhg1NLnpticuU5m9KZ9iuTwfKw0uXGdlKtXyg2EyM/jbNUPQtugjSUnaQ?=
 =?us-ascii?Q?jtMLZGmpEkhMdcDwqgVc22eF77YvFeaP7Ykk9cVgUIoVF22feElOXfMJylBL?=
 =?us-ascii?Q?52A21qvi8GxuDV4hb4nN5QamQcx3km5rhIY0le/ZKatMcJUDBjEboByXIo5Q?=
 =?us-ascii?Q?3Fyuo4rw1x+a5J/2pq5djM7IVdEP/EKQ7j8gZzBO9kNYZK7466p4dC65Tr41?=
 =?us-ascii?Q?XK9v+8KAiueToBCGX88yP8dfsUPgIYG93DFiyXAmDOJ1HS4N3E3+C+0byN9C?=
 =?us-ascii?Q?hxgzJCzLBsaHMcqXKCXNILPEItyDd86ukPMBGFuaAnv2lh2n6NZqFY95Uyaa?=
 =?us-ascii?Q?XQCv8hqaV1oG4oxpEOIuoQzFkARYtEREkjAbFnvDSK8jkVEVqiGUHuefJcG4?=
 =?us-ascii?Q?Nxmt2Lt0EohUC3kuUJJbWR8gKmcfWBoO4DMcQPGs1mB9QE669IFwx6XdD8Vz?=
 =?us-ascii?Q?tquprl9s73q9bmqG5qdSyoMF/GzUaemM3ZhkEonfXP+Cq/OXLeG+mJPQ0GeK?=
 =?us-ascii?Q?TJFNG3BDsgrRE0smMFSU+/8zuU1zyS4Q7CMesaxrEvWVr0wpS1kApwHL6qam?=
 =?us-ascii?Q?/el/XflPLnhTEEkVZxyn0HSKOLuHZRZO+85jaYfNIqFlb1sF4x/KLdzkUPdT?=
 =?us-ascii?Q?jII4tRtXfoQGzFJUhDT9xWYA8adButaUWEY7aHlEHcZMmceMo9BTEYd7apGW?=
 =?us-ascii?Q?SsjPb03JRuHpW+mL2x95w9f0KXmAnNUlyZfaKr4CFS8oAZ/lPkVeoYZYp64p?=
 =?us-ascii?Q?IJkZQZxg9Q23UE+hsL2am58F7VEhVm/4WyzfFaZpbNfssbD1ouJLBpxHQXPT?=
 =?us-ascii?Q?jtNb5Vw7Kj8ZEkY3FggYfhj/tTcRW5GtUknyM3nSopQWxi11N4MURgPgWg1C?=
 =?us-ascii?Q?ZltvryMLGAMyO+RtHih6UrUJMbzHELwu6l5ZDFoDPr0nwBpdIHahN43bQ3JD?=
 =?us-ascii?Q?dADmOGU1i7NxIObYRqFyqln+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93947dfb-f9d5-4abb-4b03-08d90a58f3ad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:19:01.2550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7ez4DXRxkN+DJYrBTjoUn6t/TISbaLww5mUhtM+yHchYhjC42IKor+66DQ6cWNgaXsQWJpAwxHntfv9cvMFPCEGqupq61dqwEeUjxP98lA=
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

Old interfaces dropped, nobody directly calls
bdrv_child_set_perm_abort() and bdrv_child_set_perm_commit(), so we can
use personal state structure for the action and stop exploiting
BdrvChild structure. Also, drop "_safe" suffix which is redundant now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h |  5 ----
 block.c                   | 63 ++++++++++++++-------------------------
 2 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dd2de6bd1d..c823f5b1b3 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -813,11 +813,6 @@ struct BdrvChild {
      */
     uint64_t shared_perm;
 
-    /* backup of permissions during permission update procedure */
-    bool has_backup_perm;
-    uint64_t backup_perm;
-    uint64_t backup_shared_perm;
-
     /*
      * This link is frozen: the child can neither be replaced nor
      * detached from the parent.
diff --git a/block.c b/block.c
index 2362c934a4..7b2a8844f6 100644
--- a/block.c
+++ b/block.c
@@ -2135,59 +2135,40 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
     return g_slist_prepend(list, bs);
 }
 
-static void bdrv_child_set_perm_commit(void *opaque)
-{
-    BdrvChild *c = opaque;
-
-    c->has_backup_perm = false;
-}
+typedef struct BdrvChildSetPermState {
+    BdrvChild *child;
+    uint64_t old_perm;
+    uint64_t old_shared_perm;
+} BdrvChildSetPermState;
 
 static void bdrv_child_set_perm_abort(void *opaque)
 {
-    BdrvChild *c = opaque;
-    /*
-     * We may have child->has_backup_perm unset at this point, as in case of
-     * _check_ stage of permission update failure we may _check_ not the whole
-     * subtree.  Still, _abort_ is called on the whole subtree anyway.
-     */
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
+    BdrvChildSetPermState *s = opaque;
+
+    s->child->perm = s->old_perm;
+    s->child->shared_perm = s->old_shared_perm;
 }
 
 static TransactionActionDrv bdrv_child_set_pem_drv = {
     .abort = bdrv_child_set_perm_abort,
-    .commit = bdrv_child_set_perm_commit,
+    .clean = g_free,
 };
 
-/*
- * With tran=NULL needs to be followed by direct call to either
- * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
- *
- * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
- * instead.
- */
-static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
-                                     uint64_t shared, Transaction *tran)
+static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
+                                uint64_t shared, Transaction *tran)
 {
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same c twice during check_perm procedure
-     */
+    BdrvChildSetPermState *s = g_new(BdrvChildSetPermState, 1);
+
+    *s = (BdrvChildSetPermState) {
+        .child = c,
+        .old_perm = c->perm,
+        .old_shared_perm = c->shared_perm,
+    };
 
     c->perm = perm;
     c->shared_perm = shared;
 
-    if (tran) {
-        tran_add(tran, &bdrv_child_set_pem_drv, c);
-    }
+    tran_add(tran, &bdrv_child_set_pem_drv, s);
 }
 
 static void bdrv_drv_set_perm_commit(void *opaque)
@@ -2367,7 +2348,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
+        bdrv_child_set_perm(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
@@ -2466,7 +2447,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
-    bdrv_child_set_perm_safe(c, perm, shared, tran);
+    bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
 
-- 
2.29.2


