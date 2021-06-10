Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09213A2B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:07:57 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJTY-0005wF-ME
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRs-0002Ah-1k; Thu, 10 Jun 2021 08:06:13 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:15424 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRo-0004Nw-C7; Thu, 10 Jun 2021 08:06:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTjMeNW9lLw5GC7xqoYwwDEQqQ5JLOsHqIhoKpNbF99at+y/9N+yU/bcKGiqhfJOhf8txu5R+0XAAlL0vBy6YCLaX/wI0hRCZZSbzJg+8yvS8zTCi/PhSszJOd5/hKe9osW+VPFoi7nkjUrf7Cr7pmwWrv62Ld3Q1i/Bw+iL4VRdzbokYoshyXJHINDCzukjGho0Xjf+4jgx0ORekqK4Lq1t+Jun4u5+m7Ji83SMQSzupv3AqUDamdWiz/cE0tg97V01ESxQpbffx9DummWztLuG24t4RBgyY5E+7qOJS5t0sQt76g5x7jLofucQN2QBHeSXnxFbUp++56cFf3XDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLwvfeZNR0GMOZYF69z0AUqFyYqMUbRgkzxCNO3jgiM=;
 b=oAzCQrF/8HcYiayTgeknJ502uad1gKoh+8s32YzbBlMsV2buPBmrzbfYniz7G0G6IUOzU6zaGhkjSX7HBrnbxribRZcQT/a/06S+2HHLWD7pfuSbCb+KglAVwR+mBa9MUrmb+Ga2fsAia+BjUlGLEwgMR0jYNBFIZuNEIJGI3I+TZ9CODY9BGHelnuLLJOsz6z38Ny2cf/ZkZEoXJ5bzngXe6hT1V3n0Apm6g+Ei690DdtpcFfesrOQupvhIBsQWlb2oP//GEuF7TmHyOiWx+9op/nh5gmmLcHMJ4zgbjML/HXZ8iffcRevFXCAeyqi3mlBD69kTQKksYXY6IgVxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLwvfeZNR0GMOZYF69z0AUqFyYqMUbRgkzxCNO3jgiM=;
 b=UbH62RoZcUULzmIQS7L5yDcpABLdirsm6eEvmhFWuolE6k+VmwfEIKQYZwgwy7g6RPSejGSqXvy1rGKlPbOj4VbLTEjO5T4FfWppcWcf8w4KMuiknimlemNerPLl6x2JjtIkv5lYDD6bczR1xTc/dpHGMylr2YLBmFP0y6gc3Tw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 2/9] block: introduce bdrv_set_file_or_backing_noperm()
Date: Thu, 10 Jun 2021 15:05:30 +0300
Message-Id: <20210610120537.196183-3-vsementsov@virtuozzo.com>
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
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02714b27-0c62-4171-d0ec-08d92c081964
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277FDB0C9E3BD4276402731C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMlWvUNxv6pcuTTcgqJrUec8UKMKWNuoTwcvdyCO4QUY4KpfRit5XwDnOKTho1jNLb77WX2hMFC9cTCEME6Yw3FurAMWlqmiALZKA1lKLyPEDufHoCCYfop6s01MlJ3JBFK5sGAbQlYdixqkl+wxO/IC96Nxn2O+Pn/UdcGLknUbk/cJ2yGSn7XcqjXR6QAVQAgOoyiSPjRSLr7cM5PNXC8vD+zLiCG1tbPJz3xFvFEYHOWNO6lkTMww9+0WBJc8wgl43g4zMjLm1zoQl+t/74J4d8Cc0NjEYkijOIzbxNwsxqY0Ex8W2be8gISVdbXQsG1392X+MDP5l+rQAuo4O7NYlZjEQVJdIwIUmJOm9/dTse/12I/uQc2qPtfYx9EIqZ0ie6c2ga5fkgPK868exYLffS7jMrAh5J4hQPMP5gYB1Yqa+JEfr9k5pTgvUSjx383qIju9T6XgXHajg0Tx5fs4LqYdsWEQ4ueNS+gVuDXBapXWjVFvUMEmebCxBOU4/zyaLGtAbnEbGN8mLQg4NZ1B7HmBhBo38YEzhUGP8hBuA9ee8x/USaYCwC6/5R/VsCzjmdu7TB5pL+zZspCJ8QEfaTiN2+kL9hrh984IuWHWoM91oO6qWvGDYL3kuxNAg0f2DCR0T0f09Vp3wULW2tbpYUrgaBalPbsLNn0eJVb99KPbe5hAuF39ZNlRLOFl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E3c+UJSI3QtN7IV4nvVcFd5DzWJGt/U9okEknunPk/FFdT4hDWjRn/HaOYdO?=
 =?us-ascii?Q?roOrbNmgpaAgIfXMgw1trDXJTBTtAquUyqMvb+oblGIPi93sUGI4G87XcTp8?=
 =?us-ascii?Q?d6e0S1uNMpCI1/5oCZTT1Xi4LQJshNMig8OZIzOo02TZidAz6dlUOxtSAyV+?=
 =?us-ascii?Q?sLbSP5LDZc10XOC3AwcD7VSZo02rLB+YTli6146Qb+lZTr5E4mDKrzC7MN1o?=
 =?us-ascii?Q?mUIPtAmVQAyKxtMlL31jNivTTGOoTDeAfnHk5dMq9eb3TPVhbn98JJwXo3ch?=
 =?us-ascii?Q?FY/ahCzW+xo4MmOysk9DLA3miPA1r7QNTxSkIAc0yc1oq6ptU7SJuSDv+ZQ7?=
 =?us-ascii?Q?ryv1SQJArlLnZuI/2v8S0giK6ICRFYq5SNC/iZ6qsmBUzCvwV1/wmtMvR9rO?=
 =?us-ascii?Q?wTR1ewJVRhfPiPVP52of2yoBRV7rlZ+/m3b8Bk7/5DTah7Uw+IOhpxtvE0h8?=
 =?us-ascii?Q?pC1TORgC5aMPYcFf2/ymSDO9swB99Pl56Z0XsBwdAIvyjc6Xx/8vfVR5tz4g?=
 =?us-ascii?Q?GrDeJ7YYI5q1DHdnEFrcAFiVVjx39538VuTpvK+zkG6wKfgqNWzywQ/MmLiw?=
 =?us-ascii?Q?hfZl00OdrEwOs0aCCx0mD0fi54HZC3Ty0v7MhnZ2hU8UDM59DKoeXlcfe746?=
 =?us-ascii?Q?/9FDJyXtR2Hyev1wiia+Qpy6pRIYWsgTI529jIJ0vKIAHsLU7zglYILbiUKB?=
 =?us-ascii?Q?Ny+DUsguXVJdhbhTx64Eic/leyukglO6/JfxCo8NvkcRF4/LNpmqxVFnKwAx?=
 =?us-ascii?Q?ZOPVcFpmtnA1xU5dj7anvu4O60HsjhtYC1kfYcuRINY+k/wrqSdZLrmGTBrz?=
 =?us-ascii?Q?d5ZMpctYZaZX/Jnu5zxyxdeTtDJwcfKLOi+PFlB+cnRxz51lbSgk2MycmvlL?=
 =?us-ascii?Q?Fey2Z/Uw/bZ2IGbTPPzGV1dDttiXUaoCDjQnCclP42n51xfSpQsjuWwKlN7y?=
 =?us-ascii?Q?vb4tKfIjEm6wEPIRcgFazAu/YseuvmnqH9GUESQbhjK/c1UN4wVDZjZ5mTnL?=
 =?us-ascii?Q?0DPluwnGXPOuIkgxuuHFiPItMrsz5TH44PW0pSapbA2gVg9/5as9JLrOPUyZ?=
 =?us-ascii?Q?ETyQ6gLEdrRD44E5pDWqo7O2TMzNtnLuuCZ7xUq18xU3EjaEhqY7DB1rG3AS?=
 =?us-ascii?Q?f65sv5epXL97AndaDafw2n4l2U74Y9Uiyw39pY/yuIfWp76dzPxOq6iwZ+oL?=
 =?us-ascii?Q?BQcZviorPMDEcDFatpBe7UdqBj4QZyJo/bKq6ep/+W+VtWd+ZX0OvZYgRXfh?=
 =?us-ascii?Q?5a099g1XXLiIm9/evHaHPBod5QQBT6ha3J+89ofbAMOqoJ2bVOLl440CI9Yh?=
 =?us-ascii?Q?pWBMqHihdIF1Oww0fcutJ8/E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02714b27-0c62-4171-d0ec-08d92c081964
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:54.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy2rKAvZxO0FBikDlxjmpb0YInUQbAlPTyjPbRrAgIHnSTaC08fFO+HLWPVQAxROIJm/lWhxKrHo2AwOeLz8XcrOVmaaR6nZmaHx4ZwXp8E=
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

To be used for reopen in future commit.

Notes:
 - It seems OK to update inherits_from if new bs is recursively inherits
 from parent bs. Let's just not check for backing_chain_contains, to
 support file child of non-filters.

 - Simply check child->frozen instead of
   bdrv_is_backing_chain_frozen(), as we really interested only in this
   one child.

 - Role determination of new child is a bit more complex: it remains
   the same for backing child, it's obvious for filter driver. But for
   non-filter file child let's for now restrict to only replacing
   existing child (and keeping its role).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 63 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index d21c9e4316..89c61fe93d 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
+                                              BdrvChild *child,
+                                              Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3117,56 +3120,96 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 }
 
 /*
- * Sets the bs->backing link of a BDS. A new reference is created; callers
- * which don't need their own reference any more must call bdrv_unref().
+ * Sets the bs->backing or bs->file link of a BDS. A new reference is created;
+ * callers which don't need their own reference any more must call bdrv_unref().
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
-static int bdrv_set_backing_noperm(BlockDriverState *bs,
-                                   BlockDriverState *backing_hd,
-                                   Transaction *tran, Error **errp)
+static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
+                                           BlockDriverState *child_bs,
+                                           bool is_backing,
+                                           Transaction *tran, Error **errp)
 {
     int ret = 0;
-    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
-        bdrv_inherits_from_recursive(backing_hd, bs);
+    bool update_inherits_from =
+        bdrv_inherits_from_recursive(child_bs, parent_bs);
+    BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
+    BdrvChildRole role;
 
-    if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
+    if (!parent_bs->drv) {
+        /*
+         * Node without drv is an object without a class :/. TODO: finally fix
+         * qcow2 driver to never clear bs->drv and implement format corruption
+         * handling in other way.
+         */
+        error_setg(errp, "Node corrupted");
+        return -EINVAL;
+    }
+
+    if (child && child->frozen) {
+        error_setg(errp, "Cannot change frozen '%s' link from '%s' to '%s'",
+                   child->name, parent_bs->node_name, child->bs->node_name);
         return -EPERM;
     }
 
-    if (bs->backing) {
-        /* Cannot be frozen, we checked that above */
-        bdrv_unset_inherits_from(bs, bs->backing, tran);
-        bdrv_remove_filter_or_cow_child(bs, tran);
+    if (parent_bs->drv->is_filter) {
+        role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
+    } else if (is_backing) {
+        role = BDRV_CHILD_COW;
+    } else {
+        /*
+         * We only can use same role as it is in existing child. We don't have
+         * infrastructure to determine role of file child in generic way
+         */
+        if (!child) {
+            error_setg(errp, "Cannot set file child to format node without "
+                       "file child");
+            return -EINVAL;
+        }
+        role = child->role;
     }
 
-    if (!backing_hd) {
+    if (child) {
+        bdrv_unset_inherits_from(parent_bs, child, tran);
+        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+    }
+
+    if (!child_bs) {
         goto out;
     }
 
-    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
-                                   &child_of_bds, bdrv_backing_role(bs),
-                                   &bs->backing, tran, errp);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs,
+                                   is_backing ? "backing" : "file",
+                                   &child_of_bds, role,
+                                   is_backing ? &parent_bs->backing :
+                                                &parent_bs->file,
+                                   tran, errp);
     if (ret < 0) {
         return ret;
     }
 
 
     /*
-     * If backing_hd was already part of bs's backing chain, and
-     * inherits_from pointed recursively to bs then let's update it to
+     * If inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL).
      */
     if (update_inherits_from) {
-        bdrv_set_inherits_from(backing_hd, bs, tran);
+        bdrv_set_inherits_from(child_bs, parent_bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, tran, NULL);
+    bdrv_refresh_limits(parent_bs, tran, NULL);
 
     return 0;
 }
 
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
+}
+
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp)
 {
-- 
2.29.2


