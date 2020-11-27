Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE42C6897
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:18:55 +0100 (CET)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifWQ-0005fz-PO
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1X-0001kY-J3; Fri, 27 Nov 2020 09:46:59 -0500
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:45281 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1V-0003QT-AI; Fri, 27 Nov 2020 09:46:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmGug+wn8S4VPn8Gj9qoQD7JuK2YFlXPIZIHeR1VKsuKln6CavsJp4Fi6fe1S77dLnh42oiZ79ujDnUdjNx2GefrbKMYHmqvjnPDXFmfbM4cMCkR6bBbLk67088IIVWzGnLTMUMnVZ44aM1uo1ODWhf+YQ1D6XUHdIS4jucIoK9mlwSOgvvoIDoaDD3J3hV995XGHSGe+ErtzSlYRbK7SbAokiWM21m0Wf/3j1kEbFSrQ+va7/hXFx9X7fEY8GbYwithSdSx3NVEBki9JFIr0Mj+lldnXmNGUTn+Apt96dKPtqgij+U1pkmeavbcZPy7imdG/65C7a1vshjB3tNfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Wi4LZ/JF78wVhSNOtMLL0OBzm15MZU84ROQWPq5D84=;
 b=E3KiajKMzki/Vj56xuyUa7jbcaPyTjQsE7+EgeWnCf06ysozfAoxI7YUD5C5FACHFrm1wmM+RRsc7CFuWzfZTSY9Qhu8VpK9j05U756AgtanOCybu7YD9MZ9ikbBbEWNM8OUp65F/iEd1O7lxQL8wf33I4p7YwuJn327+n3UDbftucWjTOp7ULz+P19uUHoN8Lai0s5Mg9w8+fVm2s1EvYSnugfl3OEB6W2P9A4jRKFAmI2LUIWHW8H9TAR17bcHhU1aOE5Dr2wxSKzKFoXV2OjPhQYy8570wAHXBxP4XBnpGy60vZ8cX3b51BWMwzfY6Ro8aek063E7nByn6fQ6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Wi4LZ/JF78wVhSNOtMLL0OBzm15MZU84ROQWPq5D84=;
 b=CPD7FQYGTBem/55ZxTdGtMMtQYz3379v1apFtpVa8AQfXRFiOLdRwJ+bW1Du028PIfkpAV84EqTXAoROJiOkkLgUO2iNq85yQp6nEkmuMsYGvBfDiVFHY7DoF9cTfexE8rgwOpR6jJfX28sHFdLentKrjmcfoGTNJA2rNXoHpzo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 34/36] block: refactor bdrv_child_set_perm_safe()
 transaction action
Date: Fri, 27 Nov 2020 17:45:20 +0300
Message-Id: <20201127144522.29991-35-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:46:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f044c396-2d38-4c84-1eef-08d892e329dc
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990CA7FA509CA0DB5E05767C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJcnO7pcw/tO/Tsp5zZsQ1GTylThxShNN2Z5Zv2wDMIF7C7QOjjmNPOftQgSJpzDNGMm3KcEgAwPDcV2uiQzyRJVL6T4rwh8e3AphG7wUaJDe54CVMvmdrttkMkLwk62ImUkLPAC2+wN4R1o8Q2kkhsZyE4UNtVDjk+UYPnp5xHlgT0TuTT465wAu9pukAiD0Bed9qG5OjxnfP4nFyFpi9aJgcSVZDAMH3vzdre4NMdPIxoJ8+QDfreh11VPFtEK7fYZLBWJWtGA3Z+DD5rTg17BQb4aRLQEiGCPQFTbV4zScdBYH0OrZKvs0ASDQtZkwKcazDJ/Wi4NqdzjjMxdsRw7DBEzKkYTYTGMHa9JACmTjwKK0d6TnlCV1G2uwpi+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/MGdlAzjNfUtfFSVE2yHgRD1LTucBgUPD5BXMY0G3qVMpmURHFLzEUFg6Yid?=
 =?us-ascii?Q?mKfueq3+ZIaYpA9Sd09IwVtPmT/AW36Wm7J0o4bxCDnhw3uQB5ErGzMnbwKo?=
 =?us-ascii?Q?ItvTaBETbvdHe4PtSc5v7/W4pdc6GMWY8ot+oIDvPxTGGa3Eo9axLGObCgUK?=
 =?us-ascii?Q?egUF+LeBNkrOGMXtIFPdzwZkDw9DlwPKg/SfvG1IlDr+poy6dSSvpkBCKLOk?=
 =?us-ascii?Q?JxidM6n9bBSCMKqSc/jewxjv1VA8C6YairHR5qDB499soNOq7toNUtj0MdQU?=
 =?us-ascii?Q?r3WOFOYUBezBbW/NB/3k5RF7PagqjcoO1HcJquYF3SLj8OQK6m7l5Fvo3LDQ?=
 =?us-ascii?Q?FKNDx8G3VWiw4TWzn9YWXBegl3A8fBP/nAU7JNoEcQpy4PWMr3BKALN1eRPE?=
 =?us-ascii?Q?vzycuFdQYF9ZFadIwr6LU3b6Stf0BR3Y9GKlW8iS1rT4h+shPBaVVGIEHyFO?=
 =?us-ascii?Q?hXETq3v0zDXer6m7rIPSb+HOaneQfD8/LmCCwfan+tjcx8odR9C2zXdxGyER?=
 =?us-ascii?Q?SM0Cdm7FKR6XDfqNUbf/aDZ1+VTH4ohs0r45uK3sQhqG2OZh8EUezcIZTXnT?=
 =?us-ascii?Q?m9EiMFsXHdL3zA1RgUcuFQDWGUbtq/dcf9wDP92YpF78W92m2/dSjHQRagrg?=
 =?us-ascii?Q?QC3umT3Auln8wB2yr32YzIt6mIv/LYlJF4DFuy0MYwuxDbjd27ZPzF922UqZ?=
 =?us-ascii?Q?HPFGvDH/2uhhpj4LKEwzLdo/srZi0Ab0cW0M/WI611zIRyaxpUR9frkRMJK4?=
 =?us-ascii?Q?5QscEesm1pGpO1Wvb1sonKvi+n7H2pM2VFAfTcbDxDVvdD1vpmHpQcuLlVYO?=
 =?us-ascii?Q?W9a4xFcMLm5Nt5LxOEa1Xlt+sTwCVhPndb/PtROj1a+STXQPMO4WjrFbBG46?=
 =?us-ascii?Q?dFeTlCH7bH/1Pxw1AfmWLUepFH/oE3ntIdbEgqWJqJd3nWmYOYVn9ZegBR6m?=
 =?us-ascii?Q?wBKJFWisF3p5pzLnCI8NQYPy1Aoy7BIxNZMu5FsKN8Lt+GNETTdVj/budEfB?=
 =?us-ascii?Q?P5qX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f044c396-2d38-4c84-1eef-08d892e329dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:03.2121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3QHOwzbU7T3L8dDndJlK2l54hfyy7JW5broBM3QKrELouVK2IXYow8h8tGrKRfKI8cO8CtV1BGlW5PReAExmvUvK2he6PwEOeW+XuHDxDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
---
 include/block/block_int.h |  5 ----
 block.c                   | 63 ++++++++++++++-------------------------
 2 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 24a04ac2dc..1e509db867 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -796,11 +796,6 @@ struct BdrvChild {
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
index 3093d20db8..1fde22e4f4 100644
--- a/block.c
+++ b/block.c
@@ -2070,59 +2070,40 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
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
- * With non-NUll tran needs to be followed by tran_abort() or tran_commit()
- * instead.
- */
-static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
-                                     uint64_t shared, GSList **tran)
+static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
+                                uint64_t shared, GSList **tran)
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
-        tran_prepend(tran, &bdrv_child_set_pem_drv, c);
-    }
+    tran_prepend(tran, &bdrv_child_set_pem_drv, s);
 }
 
 static void bdrv_drv_set_perm_commit(void *opaque)
@@ -2302,7 +2283,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
+        bdrv_child_set_perm(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
@@ -2401,7 +2382,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     GSList *tran = NULL;
     int ret;
 
-    bdrv_child_set_perm_safe(c, perm, shared, &tran);
+    bdrv_child_set_perm(c, perm, shared, &tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
 
-- 
2.21.3


