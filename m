Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8C36DBA0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:27:34 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm69-0003wi-F9
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyF-0005qP-PU; Wed, 28 Apr 2021 11:19:25 -0400
Received: from mail-eopbgr00117.outbound.protection.outlook.com
 ([40.107.0.117]:54347 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbly1-00021X-EH; Wed, 28 Apr 2021 11:19:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCee0sQgSHh/DqVj26VjXarY4EJP/SSWNGWNhGJdsyO6wvfboXtIYNxGYnkCj+uND50UhmULNxoloBwZHkU/+EN7Pjav7X2hOdz/2WOhs23fA5pDUizewvaG1fLGZvOJ2UvaOv0QcrH4YLAZZH1EGGgLEvq8Lb6svun9qwubK3fsoE/G8Py+hH5+Q1t5QySHOkolKnv9mBn7f79ok+ZunUqsk/t0mrKqFUnjEhqpENQYbyMrwDTZDJKi3tu2CAiPnnfF61SG3x1A+BTl5EL+7/W6S5IphlEmbw2eIg0y0kY1GAlbDDk4LYw9jTNLUzvfog23/XKoBuy8KXcYGLz9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poJvTxiIQmarTZSzrE9CsjRXbs8JYbvVG6G9cOdnK78=;
 b=O/sVgx/spkFRD8KHtd2h5Fp62IX6naeb9YVzq9ETiXBrLb0tQ1QUpD7s61SWZGh7AnjLtgwZNglQwbw0/n/3MICyclFlgzjmxtZ/9vz43MoasX5HgdrSDMriET52jUHOVEy05uchJmLJ5Y8oA2d+x3Tn7FO1yXtN5zGjroJ98SFLGcvCU6/0FLwB2BSclm33OskZ6zUx7EWz9u7CP4sQsHnBn3epD/K9bH36l3D63qa65Zqs6gOnB4tLr6MOBN/Bu1NBNnLfwfdx6QIuv+Wghwqv1HAkzpLSqm6k4pD+NnAbOR391NqOMsD7FF8k5UGQZuoyTzIChn3CUlqN1SQSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poJvTxiIQmarTZSzrE9CsjRXbs8JYbvVG6G9cOdnK78=;
 b=jhPeG43bzYcWI5Pgx9PQ58Y5e77Kj7u/sIZRggxDCUazkidfvfrtommAp9jM8slqhryjAeYxr55s4hFU1n9btcHPs5YmJ7OuBPya+rfCMk2dgVuqj2D8cdbRU4OqRp2xP7zwYfIAtIuawCFDceogqiWglOAM4b59Sh4p5gD13Hw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 18/36] block: add bdrv_attach_child_common() transaction
 action
Date: Wed, 28 Apr 2021 18:17:46 +0300
Message-Id: <20210428151804.439460-19-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad2ecb31-3431-406b-1c0e-08d90a58e8bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151F1458831BAA7889F4617C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4pihkdJVpgy2G848wL4Wder2gQkOd2Mq8w6/Y8WQ7lMn4tSMpIS1KHFqrAvQejCNlCH7XhyPEWZtw3uIQrHg0Z75q3Oa1URZMhg1GzoCEYj7g29E9kNwof9NCuuh8P9s8yk6mqxNIgpit0fNySaQVMQjj9N+qCpK3FN0GrpEDrUU/EcIeRsXpg3h7SVuV6wRy7bB2sviLgnJa9Wao468Jsj3SvcFmaUr6AZ6Ytm/AR/5Gydu3FTuK/L2O79fjmUtMSnnXuwhNsxc+rjI9ZFj9eu8R6tUK/KH5NlDJ1EfDVBA0F88VX6jmzWdb3DxPaEEhXH2P3YbwE+YvYVxpe/fEVYcQioc2gANWUAmmfU3YgRMzkfDDOqK8yeBzJZbqirOMMRTFWPDeTBVdS0yzU6fN/sRA8mAbb05OrU/eXVIFA+RfXqMKGuMczuy1G6eqfDLjO+LRr0BUy9vL1hgbxA3lTuWCkcWdGqP3o1pz0ecPa2k2/VrNKFLrIQjGqfiFNN/6W3D7yoI7vP/xE6TAVutNURsU1+qgjULmQ0j+8Txge1nhlu3aPEqbP9aLMqLZuLWkx4vcK3lCHz7D0j7xJLen2eBfGoiNnazNsH3uMdvVZN6GG0rIdXQssromk8vv/dHO+CwM96ycKx0zTUoAC7oys9AJjWh0Y2E8UuI0X4INR2ug9W7Aay5/uhYiYiNo07
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ECHraDMK22/hxaMN4vbtxiopYLf/w9x5+9O5gMwOZmgRklNYUEPNdnTFT/4h?=
 =?us-ascii?Q?I6oz6edBi9kExWN1JTLAVs18NICKtbT0i/NIhGM8RIfx9J8R4cMUNG4ff/tm?=
 =?us-ascii?Q?Fcvf1FLRP+7tknJ8m+xjykN8TeKgDOVRr6Lm4zmdlyhSnIvW/j/X1zARGccD?=
 =?us-ascii?Q?TOeB0IpqYx/H71a0lqaMzIduPg/f+8qObw1AdndBEXpaCRIdDRk2BQvUzTzc?=
 =?us-ascii?Q?ev3sElPLWlENIbG6TJBPl3jbS+x4ovhIHWIq/FcXxlGB15MLeigasiD9Pg4V?=
 =?us-ascii?Q?FdJ76ExKCg1jBneTGDmOeJd6KJgTM7NyM/jGIAu65bYt3LJuFxgxS4kaNDlB?=
 =?us-ascii?Q?9/n8nxz/OjeIb6z55S+J+1FcThfSqztyA6QFrMhVhI8345BzuGoxnooJaXq5?=
 =?us-ascii?Q?c9qlt6MITt3EenZNhfzAUSYqfaU2Zs6vc14gEBZ2orbWMGwZFWRxBcrUh8Od?=
 =?us-ascii?Q?8XSmcW8Y2YK7wiLhMFkpIbib0Mqh2bfxEXaNMqQUwEgMOtw7YICnNFHZB5yf?=
 =?us-ascii?Q?f1mJqYv+H8vCGfJWzXLzZyhMZyjWUcI+tSCV+XIaqxOKdEWxeB8D6EQMItTB?=
 =?us-ascii?Q?X5hEDEkQdjRKxL2Rk8ocetr1P0dCHiyMmkIsxWGr+6Vl01oCJECb7yglF62N?=
 =?us-ascii?Q?zBztkv9yPqgN1kLgW2s6RRjmXgggvT60LoH9pt0qJhmjOaU+Ib1gwm9qaic1?=
 =?us-ascii?Q?rf/n7T2f1PLj1Omd8Qdu23JcLk2TGJB/01Q8g0etNWXSMuHp0iL9nKv3IHVI?=
 =?us-ascii?Q?FH5+3x+k2p1zmIM8dg2jD7x17vUOr6p344UJTdaurh9gTSBgcCVYTUfKBWEH?=
 =?us-ascii?Q?ZN9ZwVa5MYiElSEzKc4/IBmjBPTYbkBBEj3gkkglbjY0XL7uqqr+/kZfmta+?=
 =?us-ascii?Q?+OFt2lm4LGc+5x1Z0pxDZZjFHlPVpOA8/aFIKxqo0+JcCqHEoR/oGv/49MPA?=
 =?us-ascii?Q?1bPsT689mhS9IWmPxHN6C0o/sfbOlXqBpFnNnpe5XUM/xgE8oWMKrFJuJ0S+?=
 =?us-ascii?Q?YMsf76umNIBWE7WNj6EO7MN1WSptyCDHlwLWRLJq+ra8E3G2DS2ADyzU+cGK?=
 =?us-ascii?Q?xb/YBDtTl6OxwMwuYLgAPPjiJ7EDKeIX0mZeur9TprWssFELAH6MxlVoK7Xf?=
 =?us-ascii?Q?ubZUsXZiVmZvRTJmNnScs1F3R4Bp6H+uw5hPhUpAeH9Ku07R55jUQzlV8y7t?=
 =?us-ascii?Q?UmF3lcSfGmgGxIhVyUIbMRteMmLqvQg6nPllNiGE4L5dXHl6zzLK/g9Mn8BY?=
 =?us-ascii?Q?4f8Eb645wc0LK1Vh6i/lVG1KorD1Nl3PSyzq1glxWPXt0XvH4gelF8YZIVlS?=
 =?us-ascii?Q?MZDhyzoEmFZKpHSt0SoJitGQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2ecb31-3431-406b-1c0e-08d90a58e8bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:42.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEXrSSpiJFWFgbNHU28rhTdNDvjhhRF2WqXBgVeXif8vuZo4MApPmWbYCeKFHKGfpkkhVre+7SF+TQuReZr/A9TVOxgdwsEVbjhy22xpSqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Split out no-perm part of bdrv_root_attach_child() into separate
transaction action. bdrv_root_attach_child() now moves to new
permission update paradigm: first update graph relations then update
permissions.

qsd-jobs test output updated. Seems now permission update goes in
another order. Still, the test comment say that we only want to check
that command doesn't crash, and it's still so.

Error message is a bit misleading as it looks like job was added first.
But actually in new paradigm of graph update we can't distinguish such
things. We should update the error message, but let's not do it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                               | 190 ++++++++++++++++++--------
 tests/qemu-iotests/tests/qsd-jobs.out |   2 +-
 2 files changed, 137 insertions(+), 55 deletions(-)

diff --git a/block.c b/block.c
index 6040b9dea0..4d5c60f2ae 100644
--- a/block.c
+++ b/block.c
@@ -2955,37 +2955,74 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 }
 
-/*
- * This function steals the reference to child_bs from the caller.
- * That reference is later dropped by bdrv_root_unref_child().
- *
- * On failure NULL is returned, errp is set and the reference to
- * child_bs is also dropped.
- *
- * The caller must hold the AioContext lock @child_bs, but not that of @ctx
- * (unless @child_bs is already in @ctx).
- */
-BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
-                                  const char *child_name,
-                                  const BdrvChildClass *child_class,
-                                  BdrvChildRole child_role,
-                                  uint64_t perm, uint64_t shared_perm,
-                                  void *opaque, Error **errp)
+static void bdrv_remove_empty_child(BdrvChild *child)
 {
-    BdrvChild *child;
-    Error *local_err = NULL;
-    int ret;
-    AioContext *ctx;
+    assert(!child->bs);
+    QLIST_SAFE_REMOVE(child, next);
+    g_free(child->name);
+    g_free(child);
+}
 
-    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(child_bs);
-        bdrv_unref(child_bs);
-        return NULL;
+typedef struct BdrvAttachChildCommonState {
+    BdrvChild **child;
+    AioContext *old_parent_ctx;
+    AioContext *old_child_ctx;
+} BdrvAttachChildCommonState;
+
+static void bdrv_attach_child_common_abort(void *opaque)
+{
+    BdrvAttachChildCommonState *s = opaque;
+    BdrvChild *child = *s->child;
+    BlockDriverState *bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
+
+    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
+        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
     }
 
-    child = g_new(BdrvChild, 1);
-    *child = (BdrvChild) {
+    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+        GSList *ignore = g_slist_prepend(NULL, child);
+
+        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
+                                      &error_abort);
+        g_slist_free(ignore);
+        ignore = g_slist_prepend(NULL, child);
+        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+
+        g_slist_free(ignore);
+    }
+
+    bdrv_unref(bs);
+    bdrv_remove_empty_child(child);
+    *s->child = NULL;
+}
+
+static TransactionActionDrv bdrv_attach_child_common_drv = {
+    .abort = bdrv_attach_child_common_abort,
+    .clean = g_free,
+};
+
+/*
+ * Common part of attaching bdrv child to bs or to blk or to job
+ */
+static int bdrv_attach_child_common(BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    uint64_t perm, uint64_t shared_perm,
+                                    void *opaque, BdrvChild **child,
+                                    Transaction *tran, Error **errp)
+{
+    BdrvChild *new_child;
+    AioContext *parent_ctx;
+    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
+
+    assert(child);
+    assert(*child == NULL);
+
+    new_child = g_new(BdrvChild, 1);
+    *new_child = (BdrvChild) {
         .bs             = NULL,
         .name           = g_strdup(child_name),
         .klass          = child_class,
@@ -2995,37 +3032,92 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
-    ctx = bdrv_child_get_parent_aio_context(child);
-
-    /* If the AioContexts don't match, first try to move the subtree of
+    /*
+     * If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
-     * try moving the parent into the AioContext of child_bs instead. */
-    if (bdrv_get_aio_context(child_bs) != ctx) {
-        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
+     * try moving the parent into the AioContext of child_bs instead.
+     */
+    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
+    if (child_ctx != parent_ctx) {
+        Error *local_err = NULL;
+        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
+
         if (ret < 0 && child_class->can_set_aio_ctx) {
-            GSList *ignore = g_slist_prepend(NULL, child);
-            ctx = bdrv_get_aio_context(child_bs);
-            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
+            GSList *ignore = g_slist_prepend(NULL, new_child);
+            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
+                                             NULL))
+            {
                 error_free(local_err);
                 ret = 0;
                 g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, child);
-                child_class->set_aio_ctx(child, ctx, &ignore);
+                ignore = g_slist_prepend(NULL, new_child);
+                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
             }
             g_slist_free(ignore);
         }
+
         if (ret < 0) {
             error_propagate(errp, local_err);
-            g_free(child);
-            bdrv_abort_perm_update(child_bs);
-            bdrv_unref(child_bs);
-            return NULL;
+            bdrv_remove_empty_child(new_child);
+            return ret;
         }
     }
 
-    /* This performs the matching bdrv_set_perm() for the above check. */
-    bdrv_replace_child(child, child_bs);
+    bdrv_ref(child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
+    *child = new_child;
+
+    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
+    *s = (BdrvAttachChildCommonState) {
+        .child = child,
+        .old_parent_ctx = parent_ctx,
+        .old_child_ctx = child_ctx,
+    };
+    tran_add(tran, &bdrv_attach_child_common_drv, s);
+
+    return 0;
+}
+
+static void bdrv_detach_child(BdrvChild *child)
+{
+    bdrv_replace_child(child, NULL);
+    bdrv_remove_empty_child(child);
+}
+
+/*
+ * This function steals the reference to child_bs from the caller.
+ * That reference is later dropped by bdrv_root_unref_child().
+ *
+ * On failure NULL is returned, errp is set and the reference to
+ * child_bs is also dropped.
+ *
+ * The caller must hold the AioContext lock @child_bs, but not that of @ctx
+ * (unless @child_bs is already in @ctx).
+ */
+BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
+                                  const char *child_name,
+                                  const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
+                                  uint64_t perm, uint64_t shared_perm,
+                                  void *opaque, Error **errp)
+{
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, opaque,
+                                   &child, tran, errp);
+    if (ret < 0) {
+        bdrv_unref(child_bs);
+        return NULL;
+    }
+
+    ret = bdrv_refresh_perms(child_bs, errp);
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
     return child;
 }
 
@@ -3067,16 +3159,6 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    QLIST_SAFE_REMOVE(child, next);
-
-    bdrv_replace_child(child, NULL);
-
-    g_free(child->name);
-    g_free(child);
-}
-
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 5f41491e05..9f52255da8 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


