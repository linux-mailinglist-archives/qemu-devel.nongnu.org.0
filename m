Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121736DBDB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:37:26 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmFh-0004Ll-EU
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyH-0005qW-Me; Wed, 28 Apr 2021 11:19:26 -0400
Received: from mail-he1eur04on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70b]:4079
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbly5-0001qz-5q; Wed, 28 Apr 2021 11:19:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCitN/kGYy2tl1+L2b/8BO3q822K60f5geeo0GO7GY6bpD4eTBQ0H6BlyDBlen3EmIbaPMe7gff6hrTzWHS/Ah7qLg64jrCxgkj1jktpzuPCzCCS59t7efYq1NHFyL/9ByzA5cV+crMewwm9lxgRtaCekBVwRd5F9JF3jKf7Fc5RybReuvZinpu4IjzM5IN817E3FOD+AxnKRrCJMqDVFwswaT/+Xu2WRpuCsYu8QB5yKi6sIU7ejWpXOLpzRj5kSBIuJfTYd3WFob1LNvOGwmqqmmbi6po3uXlmyq0XgwSVQbd9VPud1YdQWSRg2Gij9PuKH5Ea5hFmPE7es79WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDOdJTdq2rpFtzvJJwZAJFFvr/VxVMQyQbCcLQOjoRY=;
 b=R1nRoGc6dbA5Oq/qcObnBpKoakdWNGZIIGVdMe8ogMTn6HL8q+PVHCbtalO6u15oi9SzvDT53MxkEWY3niH5sINNO/yWlfROcSY6bQeOKnEN8WYo/E1ZHQX8OqoLnGzIxQS1/SY2uYVMTa2A3gclWyTTxcJjJb6gqJ9CEiYB3ZwlYFCH5Rz784FDjUV2jXCi5BeGeKJMfJLRvEylt2CE63uPiTOet3pAnJ4eTxFERVdIvg1U3EDhYdQdRGVjrZDjtnkdR8mgfzw2k9gbFwTnp75tqX1we/YepW4WAJBKNEFPnXvPL2lu0HfEFbKXc/7v3ty/SwejWKAU30uzVMC64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDOdJTdq2rpFtzvJJwZAJFFvr/VxVMQyQbCcLQOjoRY=;
 b=t9BhFDaq5CMurGW3inICnAfoCSnOwH0tb5tPxhqtfKMj0f6cZ9ChlGpcxZiWcbJQNa5abRR+Msbp54SVoFOa+cXJRAtkaF4/vnaQ6JaCuhvnjkPcExnEUtGBPyd/2Ua33K4nS2mAJdN6Ylwm6PyFu/Feq9QHOJcMTaZkiuJvbLQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 10/36] block: refactor bdrv_child* permission functions
Date: Wed, 28 Apr 2021 18:17:38 +0300
Message-Id: <20210428151804.439460-11-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f01d7160-1f6d-48e8-c95f-08d90a58e329
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB590925A3E1815A983F549B4FC1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypAdaSuS3Y4+jogbrxrO1U3SCtyt3nkaJc5b67ZBUeWhrzjzxF2V92NsNXq6Br5FOQpUXqMSfRI+IFQkPrtlbsmflJfu5th/6+aVMDdI1n1ArduYxpOlfxThOSBevZXLkm6kwnT/vswtWfN+9LctlbQ7OtxXpPwwsZyRGgyn0/pCKyKI8JfnahunVDVm9I9psEyB5jW8IyBg0qzK/wJDu6QTT56ymma0wEYS7VTTvAQLL2zwW7DacKAc0gSxuPBg7tQbD/C4QpyG/LKhfMHgWN4cafvzJwqchbzTS9PFKIw4KDZjLqcWbmg0aDHi0FOSfAgnyi2Ko7vcPbcKyZwkpKSbTG9nARLZvWu7lZZjJMlOBi7fkJEH7Mdjdelc3F6mYIOIJpHeMV+e/OeqYWKUweOanX5m9HZf8XVKqg/vkcNZOn7yUyvNU/sH+j9xgAsPI2o69UevO33gj0vf5Ev+yWR2jruKY2HkypMOpu7ntnG3rTkSqU7ERPb3C7nBUR+rE1cUNKUmeoyV1/d+laROoW7O0/9UZCDI+/eiAYnwcBQljpVRWn7IXUI0gMxHm1x7WJSTrYoLQk9/6Uoa/SDAD2YBNhspxjpPY8O63gmP7erVD2MFTGqcWeWkiGHSQniZL0i/oZCm5nvHxxkYxAd4Z40qAzmE6T7RMXmaIk+vYi49Nko2GWC76D4v2Hvn22ST
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yjjSl5Ukn+jEdusj0mFzuZxzMrFjqHFsdPweVbciBZEVjB/c1w7580vM/iWy?=
 =?us-ascii?Q?Xg/J7hCYbD/JnTzReD8TM77mhJcVsqDhepV4zgGlosbhDniKLkF+WaIGVFMd?=
 =?us-ascii?Q?GoYF0CDWV7NDu8i77wiqowtBAx4F2Pq7ipJigt1j9okbVsZ/iM8LrRroz9Ye?=
 =?us-ascii?Q?ex2ahPm/kLyNH1CDs42DuXTusGAynJ+ZpGtt/slExM8gQ6kjjnSg2xlgitd/?=
 =?us-ascii?Q?kelIJ3g7NpfGv3CBX5dRuwRo10zcsIONDgH2V4iq+8/GpxybJkCCbL3TXCNW?=
 =?us-ascii?Q?6x26GgehHhxmhBHZVQ7iYqtWWQDf80+IWSQo/uwkUyXGXHlf6pKosHPyFFa0?=
 =?us-ascii?Q?7QbYnBtVEu2aD+2+EFK37LoSogaQ2gFpNQLDWeNqwJ0m+xchVmKRAhNlInzE?=
 =?us-ascii?Q?si5g9UNTcPnoX3yB6xrYLuZpXV8FGt5rij3JDq3e1skuNM+Pp4YpG5Vz0ia+?=
 =?us-ascii?Q?RuA0+3nMJezVrqnFegLmD8Z3OHoFg/l1pjxfrQ/rJ2W2klMcWXeAW/tTGhtk?=
 =?us-ascii?Q?iE5qRWZ++4YSaXSFFKw2twJ7Jsut75ABTK+0Nzn0z2XySgZDR3fiwuVNea6B?=
 =?us-ascii?Q?SOGtSGRmb6JNUMR9pfcwn4xamg2m6BfozGQpfEsChDp+gRLUJ8aBUFxOoXYj?=
 =?us-ascii?Q?6z6qMz+/ByMlVy+LST8ghRWB4FPggaP+kTNLnCTfO7nPKh4dlnF3Tke4TOdn?=
 =?us-ascii?Q?PV0uv4/eP/X2ZE0ZWn9bEB0cUcBWeU2a7mGBl+4a06mBxPc83Q0tPwQs/QvL?=
 =?us-ascii?Q?ZD/PlXI84bJLy88bXE2EsH9Rn3T2bkpss6hAfsgol2Y+O7y3SILFJ01VItbW?=
 =?us-ascii?Q?w1ie++MIR2mkgien0tyyxhSy44vQg1of6i4HJLTuxH8XkLfelmBYbRahU7R8?=
 =?us-ascii?Q?V/1PiJQLID7/WlcOCSKHpxXdApDzk9A18fv5SqtMnmDj2z6+1JcxNWHi75yi?=
 =?us-ascii?Q?UUeeo7nBWfHiUUIBE3+TIcwx2/zmI4t6nKkPow0BZbyJDUY1PtiAmuAA2QAO?=
 =?us-ascii?Q?35mnV34d3FG6LT0pbvIF9V6f4OqilQV4wO7TporOvCfVaDUVE7gQd8wdWnI+?=
 =?us-ascii?Q?4IWwu2NJ2HdSL++lCQ/ayfBz84+vmCykfdvkZCy94acZ6Cu5R1IZOjHFDO0S?=
 =?us-ascii?Q?X6ODkZ7Mu0yDY984sfv7ZrXmRPDB6+AzKX48aDBDmMUcv6l0otnjQ/Ib+k2J?=
 =?us-ascii?Q?MLG90YOgMHn1hpP+cQbKngRiSgBx4xhSMdJLleEwNSGdtDo5HtxBVwpBGMlg?=
 =?us-ascii?Q?ZwaXOW9xW1md3n9eSbkP2BfY0p5pyF/xUPtG4BTDJ/PXyfta5AqcD2g76wGp?=
 =?us-ascii?Q?fRbbn77f1DNneeqHsHbYI+HW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01d7160-1f6d-48e8-c95f-08d90a58e329
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:33.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1ft8WQtNXeuFcNfbxTUAcWMbfPxNiHxUoeN2xDs7nRHOhmjp6Bk/KsKiI6R3Ko900GhracXwvE479XEwW/fJeh9mJ00K9Q2hjYuoFXdxmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Split out non-recursive parts, and refactor as block graph transaction
action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index fd621f0403..0ee0c2f29a 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -2093,6 +2094,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+static void bdrv_child_set_perm_commit(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    c->has_backup_perm = false;
+}
+
+static void bdrv_child_set_perm_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    /*
+     * We may have child->has_backup_perm unset at this point, as in case of
+     * _check_ stage of permission update failure we may _check_ not the whole
+     * subtree.  Still, _abort_ is called on the whole subtree anyway.
+     */
+    if (c->has_backup_perm) {
+        c->perm = c->backup_perm;
+        c->shared_perm = c->backup_shared_perm;
+        c->has_backup_perm = false;
+    }
+}
+
+static TransactionActionDrv bdrv_child_set_pem_drv = {
+    .abort = bdrv_child_set_perm_abort,
+    .commit = bdrv_child_set_perm_commit,
+};
+
+/*
+ * With tran=NULL needs to be followed by direct call to either
+ * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
+ *
+ * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
+ * instead.
+ */
+static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
+                                     uint64_t shared, Transaction *tran)
+{
+    if (!c->has_backup_perm) {
+        c->has_backup_perm = true;
+        c->backup_perm = c->perm;
+        c->backup_shared_perm = c->shared_perm;
+    }
+    /*
+     * Note: it's OK if c->has_backup_perm was already set, as we can find the
+     * same c twice during check_perm procedure
+     */
+
+    c->perm = perm;
+    c->shared_perm = shared;
+
+    if (tran) {
+        tran_add(tran, &bdrv_child_set_pem_drv, c);
+    }
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2358,37 +2414,20 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
         return ret;
     }
 
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same child twice during check_perm procedure
-     */
-
-    c->perm = perm;
-    c->shared_perm = shared;
+    bdrv_child_set_perm_safe(c, perm, shared, NULL);
 
     return 0;
 }
 
 static void bdrv_child_set_perm(BdrvChild *c)
 {
-    c->has_backup_perm = false;
-
+    bdrv_child_set_perm_commit(c);
     bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
 {
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
-
+    bdrv_child_set_perm_abort(c);
     bdrv_abort_perm_update(c->bs);
 }
 
-- 
2.29.2


