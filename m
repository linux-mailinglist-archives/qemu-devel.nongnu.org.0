Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3242C1589
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:22:02 +0100 (CET)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khILZ-0001xa-BJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICx-00043Y-3V; Mon, 23 Nov 2020 15:13:07 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:5972 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICv-0007KY-8s; Mon, 23 Nov 2020 15:13:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E176dOvaG5I99NmclEW0oqz0ZZ1IpM03ntwJTDqqJLzZPub0unRgbFAaBZpmTTgiuhTaiSPSy5yfyGHvVpIILaCN7+l7NT3XUnu+i0sZV+kzhe2UJIVMySiP6n0kJF0T6yQ8wy7aXytfVvcxrDyTETdu7jTmUfA5/+IV3NHZxiJxZbW85zM8Py0nFglGwpP5cE6XRGDbSrrN27Vpodz/pYBHA4JQVsOJytQrAS767oljLun88Me1tcSXjFuIlJJnuAxyycBcAvlTdP9XVPiHBQqvdMyDEMA83pSqUTfQ0rhA2fIk4uwvlWvwhhPLmFOTrwJmX0SxDdqS0HkGGEUr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikvWuy/50WHkt7/yEFRUZB081hvYavkR0VrqWqm2/bs=;
 b=eO2xB66udPkCYhJdbkeWqu46770oNYb7LQFGGI4k8bUNyU2L3VozaOwGcT4B+pMvTB8zcxjshs/ICBn6mNC11OwOqPTJ4y25IxOkP5i8UYKsm7lIYf6GDTlqPcrcJtw02v1P6Nn41QfuukQlXDgVfa2aX5XLSR0q7WqcRu0oBrkp/wovfJA9RWd31wXGdZZRf1ya5IyDrgL4e0A4oH0Kc+YiHr8O8IVe+vUlrlnCm0LwjMYt4KOR7aysLHsol4eAH3+3mTFKlMJK2MRpO+lwlmnI17dprKRWIw3R/e6AX8gHPXSR9qHdo4jQ5FakBUHjQuLt5lNmHDKh5NswJX8V9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikvWuy/50WHkt7/yEFRUZB081hvYavkR0VrqWqm2/bs=;
 b=wMRGlx+sg/GDwJxhvn5GEehlpOdmyMt6ZZGFBvhxiVWFXP/hmNzJ7IoINpayTTdALovaTHTQ3eTefYdDmLWelDBCLtkOpwq7G2bF6WNHKFJOA9dYpV9h39cP4TBjvyUjB/sZJARApleGQBFe2guxk1uy52yVKYJs9jOWZzbpe6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 04/21] block: bdrv_refresh_perms: check parents compliance
Date: Mon, 23 Nov 2020 23:12:16 +0300
Message-Id: <20201123201233.9534-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf6d0841-62cc-4f2b-3d62-08d88fec2926
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46909BDBDB9E98F9A85ADF9AC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzwZziEqQe08BEj9pJGA0YSMcXsAhB94XKoyCoVdkgDWBI7UAEDI1JSuZ+dU22lQtm9sTiq2ah3DZkkvj37mM5N1P3n+Jfy/HOWtBOlxZfhlpynsKJp8Yrn/yJ8VruzgCseeF04qb76RPz7jy2P+fwBpqh2ay3iaIctR523AL8mJfDn9VN8KEGWnF4TFQpwSOfYpLVzEGLhwKU+ri4W2wGrwDgOxSb3BRPC42qVPwMFdqcGuI1sg52HT81FQ2SaXtNt/mQYdltIBqtUF+Z0M+843ziThdE453mFvcIOKUCJNscEwFR/IfpPYUQZdO20A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: r6H4Mlq1yPoAor9WcY+QqqN0tf8QsmrtKaXQ6RYGlhC3g9A235U1ZVwA6+DkFQqMgwAmvzIiZGzjKCQN7YE2muItZPOtPl++RKoSXRtTI7kB9xMkv4xl/xV7qhdgab/z7T0/B9R34dVIkwZdog2p6uq1RLCdk/gKrYnOJ5CrtvO5wBA+0Lb51Y5MmNhrOIUVS9bQkreMkAFrLTZ1aZc2FtURBumoyv3JlZvMacaulBx67STc/vkew8syCi6lhF25+dbJ/CCxgh1ZzuqXhhoew4sVgznHFnmQ6EPLvAzeNgIu3AkacthEs6DyE8W/OcJ3XNRThi5KOWBS+khwNc5w1MYeowFpy90lko00Pd92ZJKbOY4wk1mCmT5R0ftb1m2O55tC1k4klZniinyerLFL3CYX6Hk3tu/8hrD1Bl76b2uwtxdHZw4IByOxPzjlRll+wETJlgr6pBLEuOly/sRMW8US5txFHBVl0n14rmPZzMWU4e+/yl0ypcanNAkJM21yEJnUyRlthaTArm0SZRMJXUTE252NsCEss/twKT5xSBkqS4oMFl1EuqYs2xAUwYtIejcg0Ru+kBgnkUVW5Iscgso2pWrGaABwtOh/GGdxJWv2vEQgybhqE+LQqC9fth4fYl0ClbGrlI2SlNUkTau78MxDmh+GGcV36kEOGBF1nENsbG12Uv9JFHByHeZGf4mWvl1hBkaZi6sTv4/ODC5bo071ykWK1KHrayWiCvR+jft9rlqm0Rb+0TO7yao5M6HIUHj9Zn1JfjqLneZRLvAjpKt3X+qbYnpSAG9ZS3roltK4U0lUDylHNCiOBn8Xi2OrVpNTStnh8CcZKsHyFwqL05Yo0XrnKPWpH4OSJDI7p0nYuL3n5fmr7/I8yNEsFmAcrxRYBuQYrztA/qX3kPtXdQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6d0841-62cc-4f2b-3d62-08d88fec2926
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:54.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obwXVjw3LbuQHNTjJ/5QXtZPoxE2l/mKdA+FF3Boi+de6yv6poQUfUpzXaXtz+wWMpD/9OTjj21ZNKm5lv75c8sryOKOR/Gn3BiqKMsIeBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Add additional check that node parents do not interfere with each
other. This should not hurt existing callers and allows in further
patch use bdrv_refresh_perms() to update a subtree of changed
BdrvChild (check that change is correct).

New check will substitute bdrv_check_update_perm() in following
permissions refactoring, so keep error messages the same to avoid
unit test result changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 0dd28f0902..0d0f065db4 100644
--- a/block.c
+++ b/block.c
@@ -1945,6 +1945,56 @@ bool bdrv_is_writable(BlockDriverState *bs)
     return bdrv_is_writable_after_reopen(bs, NULL);
 }
 
+static char *bdrv_child_user_desc(BdrvChild *c)
+{
+    if (c->klass->get_parent_desc) {
+        return c->klass->get_parent_desc(c);
+    }
+
+    return g_strdup("another user");
+}
+
+static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
+{
+    g_autofree char *user = NULL;
+    g_autofree char *perm_names = NULL;
+
+    if ((b->perm & a->shared_perm) == b->perm) {
+        return true;
+    }
+
+    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
+    user = bdrv_child_user_desc(a);
+    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
+               "allow '%s' on %s",
+               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+
+    return false;
+}
+
+static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
+{
+    BdrvChild *a, *b;
+
+    QLIST_FOREACH(a, &bs->parents, next_parent) {
+        QLIST_FOREACH(b, &bs->parents, next_parent) {
+            if (a == b) {
+                continue;
+            }
+
+            if (!bdrv_a_allow_b(a, b, errp)) {
+                return false;
+            }
+
+            if (!bdrv_a_allow_b(b, a, errp)) {
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
+
 static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             BdrvChild *c, BdrvChildRole role,
                             BlockReopenQueue *reopen_queue,
@@ -2122,15 +2172,6 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     *shared_perm = cumulative_shared_perms;
 }
 
-static char *bdrv_child_user_desc(BdrvChild *c)
-{
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
-}
-
 char *bdrv_perm_names(uint64_t perm)
 {
     struct perm_name {
@@ -2274,6 +2315,9 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
+    if (!bdrv_check_parents_compliance(bs, errp)) {
+        return -EPERM;
+    }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
     ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
-- 
2.21.3


