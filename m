Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44B33F3A7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:48:57 +0100 (CET)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXTk-0000wv-3M
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHf-0004au-BN; Wed, 17 Mar 2021 10:36:27 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:28737 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHd-0006ux-EX; Wed, 17 Mar 2021 10:36:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdeUme95+4yebyOoddQVksrcUHzOV2n3+EBYBbtoKDSRI+Ndh5GTVV02femiGaJIIayyE2PDBR4JX8OcGM9jA6JApAaA7iHtLLMJ+Isj20pdwAIs1mOuLhDqOm7SIDwbUoHzfOj9yqSjLb+ZrV3oLRYAuLCVYsxzzTBkoGWrA9ykEsNaqnt5xwA9evlYalR+AkM/WkSSMwiX83jRYlFw4j6UHqUZvFrNedT89hjukT9HFLAqUzU/Q3vkWmh59jV84XRlNUjCFuA825ikHwHYTJ4MM2/Nu8Ps43XW7+34LyYmFVdMJkcAUHYDubBAroGHSjXS4uYzxXRnxb4uxNrrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpRvbR0wIk1u+mqbe+3IGqgyETTOJ4zPJnwNMWDLSLQ=;
 b=IanWCjZwEsGcENULYYtUGGivkqwUYq/clwWcdKALoX5kWf4CiJESrdgEZMbU/kL5MPe4oJ8ZMoqopH7wX5SPz8YQjYbNtzdNa6qv3BJGfDvAUSB1z+Y8ciRSlG1KZdhAFkldZtgVDZ3caodiYXjTV5EltZk34U7eemc6HZaUNXWy0uUjb3YP1gkT9jWdFPn/EZfOpj3jrOBVm2RzRoXDy8uibml6Y+wuWJx+/UEzzjXx01mwR95bEmdwMcIAeyEXZuCvdDH5eGO5u/ecIS82GoOi6d+Jz97HvALGue1C6kkxsTbIpls5240Wej2Wq/Wjeqt3Ld9gsNdqmCZ6CRSGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpRvbR0wIk1u+mqbe+3IGqgyETTOJ4zPJnwNMWDLSLQ=;
 b=sMm104LbDqvSoFYyVwjuA1VdfYSAzpvyzn6j8ZovB5awL1f8/SMbvXENWqcgdU5hwkGgg+QaH2Rtpt4GFjlGGlth0TKydYisQU/3VFebzyxjBWAcgsQlr847QYrfNXjUhmj5gJ3xlM7V1qX2ADCARN3yDA0abWKsUJVHYmgSNxo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 09/36] block: bdrv_refresh_perms: check for parents
 permissions conflict
Date: Wed, 17 Mar 2021 17:35:02 +0300
Message-Id: <20210317143529.615584-10-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f3fdc70-90e8-413b-3460-08d8e952051f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544EBF971A510660F1CA1ACC16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6giYb/uLaLRKIH0xmDJveT/551CClhcM59p8syZFPHW1LfZ7qI2n8lqdNitn+LXrBYtunUhDusKEFag44+iYzxmjYSWLMsG1KyNGS48I7HptyGDd8j8nE8Z6rBwGJkpleVHNo0wQFWIXhs4/gQMbV9cCVt3WD0jxJekxOSrJaiuO3KYhgxI8y1KZ/zclYPuN6Vp6VK2duaJr4RA/vwKamYtioIeXFnm8qQ1Ijz47KqQ3cdrPm7iIc57kwwgRSFJ9E7JKIrW9vgSIxu/IQUAPOw35rT37giBn5+M6bldpvCxmYznTVGKZE7i80A8IadWe6ASKy2ZWXZ7h1FZClzMXpUMl3Qg2lSx7uHB8325qPZOCxi9c7xLMNFP8Jzq7kshvAfCIB5Y813cRLninWVJuLGI8pLLEAM9f+7ikGhb4FWaAjkArl+9OQWw2dG/cFdre75RQZv2Pj/EIlGlI7Yb84XsVAgbrd9YuRM59do+nZNXnXGZEP1fQkPR1hqFY8YFip2IuxBsSHU1DKTBZq5WZGoJsJ1BiI8Kslad7f9WV0I0YYg22dzN8VkWqbAIFaNn+pGbTb71YLiGA+jetJo0t5Jfr9LLgoPCPgEVQ3xYlqS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tpitBqe3SQ6LZ9BuPZ6z1lmOo+65CIk7XU87qS8Wnlz+AzyuXNPC0uKVyNsp?=
 =?us-ascii?Q?Z5qM9dB/3QYd6EZclCN4NSSLPrF4Iyb+OESW9vwngP9dzxvWHdGuXa4yf1j2?=
 =?us-ascii?Q?YqSLgciLL6J64dxFhYFZGYj7XuXCs7/w2Tb4GtjEJ/vA0HvDfOaDKZmVnFpw?=
 =?us-ascii?Q?u61n+7HcAtmNLnlRdFinlYD52FmVQjx9OYrV9Hju3PbnxKPbNlJt0wyJroSB?=
 =?us-ascii?Q?H9IUTHoqGodo1Gp81r2YYhZFqZJWIWuYeE0opoEqcM1DvOZI6GyleGOIQNgE?=
 =?us-ascii?Q?K5yJ/r/qrYY8OReieo3FMqc0VfRUuXjEUNmJJOhwEG1IyyhFbcEtjwbFDkTZ?=
 =?us-ascii?Q?cBCnRwfLI1K/RWlO5TRd/8lkafLQ89HNwPA5+EZia+gnHVY2AI8gKQHn9WgC?=
 =?us-ascii?Q?e3MD+jjB7pOffi6p14gfvn4nu4mitBdNVCjt4xl+wbRMF6bGyRQiHwII6OqR?=
 =?us-ascii?Q?ynyKEQ+o3sWNj3YVrTFtKNOLST6mX/VNpEOt0e5ZQvFuHh1hbXQHM9yCJhRC?=
 =?us-ascii?Q?Nnbm9c9fXzIyAVP74qQHaPTh+ErDlHCXFgp9uT4dbPiOIKOMGZPuLpSEmRK+?=
 =?us-ascii?Q?Q8AmCW0Ibaig1njKkvvm1vwupgnke91Arw9yUkPNy/OiFWvKDXyQqBQncFTb?=
 =?us-ascii?Q?zvP/wZIu4Lwi6RJVcCnYDt+mG5Ys/E3w0jaEQlhHH2+CI/C5CpYJFrvKl/Lg?=
 =?us-ascii?Q?U1G/N791pYnYnumQowDzlvM+UQ4NrWCLat6YdFZhxhjWavwWoo+YzNEUJGsv?=
 =?us-ascii?Q?J+fRxRSq/MJZWtWtJbD35DPwH0S7S9MOXz1hm4dxoASWiwBEIyZhNl20uSmp?=
 =?us-ascii?Q?Nj+jceFMFwIVXcPUizPQELAk0Tce+vh0LdImGefX42ERkhR5IIR47lBoz6A+?=
 =?us-ascii?Q?BjpZv7jGsX9HY1Yfgr7CfU1dJaHBViNqqUkDbiiiNhqUvKzxBQnzmm/lYafo?=
 =?us-ascii?Q?0TKy52DLcc+g93JliAE47v4aVOuCzIleF9Ai8POJMq7yLkzVtOM6Lji1LUTM?=
 =?us-ascii?Q?MpOqTwjLn8NCbNoliUlvvi+ZUtnKFj/KZjXIRZDj1XzxrKDwmbiI5bV7lnQk?=
 =?us-ascii?Q?RAQk3TamNxSVBzSzJaoE6/huv8L7vjkTqGxRpIangxzGGanK4GyXHak8aHJz?=
 =?us-ascii?Q?DWbORZ0fSXcbR56ed/spWhU1joqFKD8ch9jWdPZIVAeqpGDFfkHxIvrGSBMA?=
 =?us-ascii?Q?UyFZBQJYCAT6SjFP4Z2Kf66ZOVRJZkxhgyTpvZF+MeFp0wEIRD0gqQFbqewE?=
 =?us-ascii?Q?RbDtvHxywajfOtVEST5nzVjT891KW9Y+Sm75L8OMw07VBeIYbwucUEFKGsID?=
 =?us-ascii?Q?TO8Ezx/1Hab+1XVxgoJkM8Cv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3fdc70-90e8-413b-3460-08d8e952051f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:15.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LMduClia9cW08awq8GfmjU4d8xkXyBUrIbMchxSnxsnzjFmQSVGVbDXjeJ5RYkUjl3DABtC20HqdfVV65hwes0pj9E2SnX6YNxv4MU1he4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
 block.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index b951ecb5db..69db01c2ec 100644
--- a/block.c
+++ b/block.c
@@ -1992,6 +1992,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
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
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+{
+    BdrvChild *a, *b;
+
+    /*
+     * During the loop we'll look at each pair twice. That's correct because
+     * bdrv_a_allow_b() is asymmetric and we should check each pair in both
+     * directions.
+     */
+    QLIST_FOREACH(a, &bs->parents, next_parent) {
+        QLIST_FOREACH(b, &bs->parents, next_parent) {
+            if (a == b) {
+                continue;
+            }
+
+            if (!bdrv_a_allow_b(a, b, errp)) {
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
+
 static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             BdrvChild *c, BdrvChildRole role,
                             BlockReopenQueue *reopen_queue,
@@ -2169,15 +2220,6 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
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
@@ -2321,6 +2363,9 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
+    if (bdrv_parent_perms_conflict(bs, errp)) {
+        return -EPERM;
+    }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
     ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
-- 
2.29.2


