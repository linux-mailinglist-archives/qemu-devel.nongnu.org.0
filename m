Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F804467EE1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:39:13 +0100 (CET)
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFKq-0001FP-5y
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8u-00015W-Rf; Fri, 03 Dec 2021 15:26:53 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14661 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8s-0001cv-Qa; Fri, 03 Dec 2021 15:26:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuzUXjTFZCy3Qt9OesAYQojxCLbZXv+FO4duUEkvMBCLT3IfHAZdrW6wanZyYLluPXRTJicTim0LBav2+k344WD6iI0sW9uEGT4rM6CzFrbSu5DRVG4hrYPtyDM5KLd5zmFURzmYreomPGW+YBquuBbFPeFbBHSRtEPNIxcCwfagnSksNV3zfX7kZeaxM0Cu0E+4DuunvL2spWozTxc5+QQs8tkcWLOpqWT8l+Tc9a+sMZwe7mH4uTWPXsZUPnzkb7cZVWw6X3VUbKaTsYOURdv9u0zkW8BzWjcE9f4RwV4ZWnHNen2A4ZIFDzuY7mT9zgSdhFJsxfxotaDuIXPtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9Nc4I/1HmU7AlQC1CAHYouh9KxjNx1KeO5ILNaq/nM=;
 b=fmppWEKs8rNVwEQm7cHIF0h+VMd5xnIiYYJxYJHiAMbSOj11kWLfreA7gQ42UO9hISMJ6zRGR78WcVogyhVhnPDlXVQPeJ2iZdfhIkJ+f0oQmCIucGfg9MSzKPpB4IC6S2rqE6YNZA4xfp86SCyLEwi5txVg+Ym5LgizRKTYua8yXVDewwmOC0tPwNICDFv60CDsV9F2bkwbmc/KRBzF0L9mjGkbzm+whM/b0XFwwDEmn31pqDeeDBgLg0hA9m7c/q2xKymBCEnOSLA5EEHgNHJ2ePz2ZQ0NYquNkfHOB4JuEL+NebwLIopPLLuaFYFIdVydxGklJ+3fl70Z9eb10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9Nc4I/1HmU7AlQC1CAHYouh9KxjNx1KeO5ILNaq/nM=;
 b=Ap/HC7KvJsAKr+NeqoiaBQZ2BOidciHw9S+f+TssrW//62a/wFzPyGzaA+T7kKHpJvClbADWUrPf6dvnFvek4ZbbEPBzE0VctP4QSCI/+4l8yTdG+WRYPFc0VQ/xm8gmzQwmxQ8z9LKwonc7r1aVcSne51Lhj1cvdRlNWmcbN3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 06/14] test-bdrv-graph-mod: fix filters to be filters
Date: Fri,  3 Dec 2021 21:25:45 +0100
Message-Id: <20211203202553.3231580-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29675257-08b5-4cbe-c6db-08d9b69b2b00
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3841C764BB0F54B4805DEE3BC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dof1M5ep2mF7ANUSDn1ZRytmhcCYEyJdw4cGVFs7OzlqjQTRQU0jazxkLmkdR7heORTCcW36c1q136cIZ3o9GXPjSaE8JBF8JdjIxUc0GTv0eVvqsHaO/0pWuNdiRuAg5WlbzwsG+ULmPZJcZUy0eFdG9g5pQ6u/HNJARGkBPHxhntdBEBN6fYCAMXK2sJFJiARvJIvY8hkWftMeMqGxgZB1yiip8bLjmv/uNXiXMTFKcy1WeqJW+l+BftoEiBj0KGQH01bcygrkzwh4zFr3l+NtyJMQvV3hd2R6DXOfAoJQIv1qfAYWPgcEHGmprAOSL3w9KqLgshepMrZmldUYRdJWE9EQrNPfjRqkNbrL6rrEvmoWjoLi795B6PhamCxssbjTjl+RNNeu+vVJJ7lurMo7HZ8YnutnkkTg4VCl/42jLjE9z8ABuDun7ByctWIlgbu9HGrmzYFxjP2iuXyFK6H7B2z74axxQDzcDNdTkcJVu6fjRNyfqzNXt7VXyt1O5wRxFbHkj8BplDFOG1uFuTtZcMz7H2QZydaXw3AHcoZUVY19fV0eB4wemFRRVc4uM/L2oRpD/D7pwvwqy5aeCLzqiBZzdpQcODZs6ImcyAzb33w/ScnhMJS5HTmqbTIOQ663PsF8hT04eIKVOchEmgy8uEdSY00k/8eLIckpCoq5LDVfl+8uZDonZVIitVDWWI91MwZ/iOkVNahUaKOTJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(107886003)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7kC+HdzBx9atKBrEJDdPpOD7vaAQ+9F4fPuZj2otW7axs2CQJ2BZCRllGA0?=
 =?us-ascii?Q?NXLLGLGmngUGCwbFY+FJIT7mm32IkiwmOPDSRjpEYbUS6CVD56vdWUruOtgZ?=
 =?us-ascii?Q?H/kOiqHFKCNSq/8ivFuxMDrQwjlHUXKIfCOEt2R51+ikBvpYTS+qtP3u/zOT?=
 =?us-ascii?Q?bnvwSdbQGv9qt9+O8RiBZiPxa8bifFp5p1JCvAb+kYyncoww4BapUsq+XnvP?=
 =?us-ascii?Q?lUbo34FYNd9DHiFD9CW7tb/k35s9QaE+qzCyHBdXfiPqP4sQpMhhqUgJqWk3?=
 =?us-ascii?Q?jOwv7tiWXcUhRhJ7Kiyu57pI7ZSHN2OkIVgdsHSpW20CvXrvRRSRE4OBmvpC?=
 =?us-ascii?Q?hr5QBl47MeLHkAa+a6bBaKCaoPdDnC9K/ahkZvc+vRtJRZAWVekHuWhAh0lX?=
 =?us-ascii?Q?84PDkwD9s08/3TfIddmGjMVxRXivyfULvoGHOnw4spO2VUuM4ojDuco48y7w?=
 =?us-ascii?Q?RM8hER1LG7khzdBnGbUf87UzaFld5WFB4gALWus9+n96DjKU9y4BWabJ1Nkw?=
 =?us-ascii?Q?4a1YYQnQHzh5VafN1XFhNwNwvJmKXt4LQPecVSXCab3rAhSr7Egf/oZPTDI3?=
 =?us-ascii?Q?PA2Oh4OqrlGwk7X1CTJ9Mr9RKq51WkOlqxVFBGVz4Yydbmh/1SzXk614nq2C?=
 =?us-ascii?Q?fWBh2Kn/YsxIZq1oomtGVUxN9hqXlcV77f1Mf3rq02YX1d0X31mYhXA/igus?=
 =?us-ascii?Q?k6KHA7+KaRV1Pe5LvViB+gulQrlYd6RbMVXlhpGdrC2bxTUNPdh+SsoJ1UJx?=
 =?us-ascii?Q?DIdSiPMOVPXvvt59lq5mIFop3bTE5199F9HKIKVM+ZuzZVJktarIp+SweSZu?=
 =?us-ascii?Q?QkTdviGl2xtcn6N/4e4OfoamEglXKBug3cwh+oy7XSJ0f/h6QzMNMe8YHNi6?=
 =?us-ascii?Q?EjmgZG3dalR9BDw3zM5SFpGbJan1ZgU7Mh9NxmhvB6nDmpZ+3XPsryCeDafP?=
 =?us-ascii?Q?hL8TfJNdgE0hXZuGkJXOND3nJgGSnhNcCmUW7kxv/X2RU1Dklu+0LDMt8DJ3?=
 =?us-ascii?Q?YCDzVBahoR/M5Wb0XkSOIaMM/0ZMq7qGivPCj1NCCwM/0Fu242vOp/8owCwV?=
 =?us-ascii?Q?3EbqjjwJGzg2xyE7IzBx9S+qTzlc86TVspbQ71RsAB0fHwW3+rSv2HXafHoq?=
 =?us-ascii?Q?hROLQB4YP1rYD9JCu3wjiV5+asWF2wPhgqcEQJv7iO9HrQacDpYCybPw/DAj?=
 =?us-ascii?Q?Ou/fjXz/Yp6O/geBXxuws/OFlgTXjqQkRLD+R1j0YSL7W1C2osIy2XhdyABH?=
 =?us-ascii?Q?DewVn9HuY46cFO3CkHe7ncin8XSn4hUZLmSW9twvlFQKrAWFH48Zat2B/sFt?=
 =?us-ascii?Q?igTbp8ktwF62LxOVYLvKFRrlC9RClI7JhnLdZ4WSbCgyJ67AtR9v3YTVw/T3?=
 =?us-ascii?Q?ShowDPG5Zl0LmMI28OgzBA4JWupQZ7SfwDIYMv7EqWO2w8GHt2twuak6YJjZ?=
 =?us-ascii?Q?lCHEvRNGRKu5zoEJGmolp3hccIY0FxCAGibzzvJrY7IjEJjszEvsmfz2FSMP?=
 =?us-ascii?Q?p7hYafJrNS2nS0eeqSONLY+y/zHmKutEMPG0gYWI2ffJza4Ppuyj+zkP+jaB?=
 =?us-ascii?Q?9tP6OF2UvRfuaZg0YO42Eojya6TylPZLf8SyJvEcC7IDKdYOcUtRrKHFTOoM?=
 =?us-ascii?Q?xiUnG12YZJmTcNaninuu2/Una5ltj/+3tVc4oICXw+fwL96s4ducmrfLlOmc?=
 =?us-ascii?Q?oFXbuw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29675257-08b5-4cbe-c6db-08d9b69b2b00
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:20.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY9FoYKHCSJ3aIoX/iqdeDlllLVKvWF7g0g7RIG8bCvRRi9K1s1IPC5/IZ6/Spam7Cdrnd3SAOBywfEEgZRpUXuqtMwgWPxDiYQhZ6Zs4qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

bdrv_pass_through is used as filter, even all node variables has
corresponding names. We want to append it, so it should be
backing-child-based filter like mirror_top.
So, in test_update_perm_tree, first child should be DATA, as we don't
want filters with two filtered children.

bdrv_exclusive_writer is used as a filter once. So it should be filter
anyway. We want to append it, so it should be backing-child-based
fitler too.

Make all FILTERED children to be PRIMARY as well. We are going to force
this rule by assertion soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        |  5 +++--
 tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 9c06f8816e..919e33de5f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -121,8 +121,9 @@ struct BlockDriver {
     /*
      * Only make sense for filter drivers, for others must be false.
      * If true, filtered child is bs->backing. Otherwise it's bs->file.
-     * Only two internal filters use bs->backing as filtered child and has this
-     * field set to true: mirror_top and commit_top.
+     * Two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top. There also two such test
+     * filters in tests/unit/test-bdrv-graph-mod.c.
      *
      * Never create any more such filters!
      *
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 40795d3c04..7265971013 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -26,6 +26,8 @@
 
 static BlockDriver bdrv_pass_through = {
     .format_name = "pass-through",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = bdrv_default_perms,
 };
 
@@ -57,6 +59,8 @@ static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_exclusive_writer = {
     .format_name = "exclusive-writer",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = exclusive_write_perms,
 };
 
@@ -134,7 +138,7 @@ static void test_update_perm_tree(void)
     blk_insert_bs(root, bs, &error_abort);
 
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
-                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
+                      BDRV_CHILD_DATA, &error_abort);
 
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
@@ -228,11 +232,14 @@ static void test_parallel_exclusive_write(void)
      */
     bdrv_ref(base);
 
-    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
+    bdrv_attach_child(top, fl1, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_replace_node(fl1, fl2, &error_abort);
@@ -344,9 +351,11 @@ static void test_parallel_perm_update(void)
                               BDRV_CHILD_DATA, &error_abort);
     c_fl2 = bdrv_attach_child(ws, fl2, "second", &child_of_bds,
                               BDRV_CHILD_DATA, &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     /* Select fl1 as first child to be active */
@@ -397,7 +406,8 @@ static void test_append_greedy_filter(void)
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl = exclusive_writer_node("fl1");
 
-    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+    bdrv_attach_child(top, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_append(fl, base, &error_abort);
-- 
2.31.1


