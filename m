Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309C36DB28
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:23:00 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm1j-0007yW-4D
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxd-0005d0-Pb; Wed, 28 Apr 2021 11:18:45 -0400
Received: from mail-he1eur04on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70b]:4079
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxR-0001qz-2V; Wed, 28 Apr 2021 11:18:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8NS/tRg6MMXsrXyHcOjjYWAMmKUFiO0UxTuSNbf6V+9F9WFb2PIEBsMZwlzNuQGMDQ0QdUV1c5OsVhC7Th6ipD014QYLyKX8huDXj87B8KPmmzdMQy9Pi1AClj3FxBBT8QWDx9wtKmLZLXvD7c5DuQdlIxVgxFEr8Y5sBqN9lTnPAV13fWbuolY18ABAKfwQnEmNKbqcciPBF4SRfTYcKXGMXH7mvYTPwIbAgpkZEsRmWn1Np0KgdokvWtD7ZwRbvaNXJD9YGW4nNRj20L9CcNJQLSao8QWPxTwfcKm2QL/4cPjQd3ZHpShgJFj4Qf7H/8QWgXeSmoHzvWHh7Duvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALnNZmnAEFAZssrODvUjQsaqnE2GlowmRIt9dbt0SRA=;
 b=J7AdPN1m83Y0jGLDA695GcoFz16PoJIsIMQhLdD0sUpSyF3A14dvwq4I6s2BJNBITPA/x6HG4x1MUhcZqp3B6LFn/c6VIC0Wpqc4ju3SunqfKMHxgl5J38i0AbIeCHN7BlNW+Tx39YLjvVV4x6ZvtZ0DqMG2tMoV+NumLEnIFIaq2FkAjQVwlk2dG5QijjSAnH0evCr4+NE+9zRasKdIuiYpJISir2yJatJ/K0pc7p+HSEjRuYHiW8zxzrqkcd9TGxmeDKqdXdZdDiCT32DFj1WehFhBRS3BJH/99/+sP+m4ZsAVCqBKJgtXrdcqgE8jQWOVlCGpO8274htWXBePZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALnNZmnAEFAZssrODvUjQsaqnE2GlowmRIt9dbt0SRA=;
 b=PpIFtK35NlNMt/N9r3mUmyTaU8LhGmthr4/+f/nr+lz1Dm5u1upEDvMbf4LY8mfTH1f3VdMZEBeWKZvQDQ+hApztFes5ADqLO+rFVCqERgGXJ4dGV8G4XKi6ge7zE3/YioRyoHGiqf5O+SXthQd6pJ7PFQ5VY4PB3FlY1vKgrGE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
Date: Wed, 28 Apr 2021 18:17:29 +0300
Message-Id: <20210428151804.439460-2-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4694347-38d0-4eb2-8528-08d90a58dcbf
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909A94B97D1FA7F098FFD01C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f2ey+kaRuUKf47A3uxe4DQPKTHKurHezOqMPFS9n1t2j7T56sAdadIw5a1rl9oNSM47XBtM7Iik5aIbna976/kQL5u71+HBfhDQv+mcPU/EZOKHacXXP02IlNNtYiJOTAjFebiFOt+IG71I3TMAEkgQ3PjhSINgw6HL68BM53xRBJzvj3Pmp10onleTto+XuVtOKOdOR0Sd5XwG31XAnlldtN1YfiiAn/xH9cSdrmv7aSJqrEj1vydd+++Y2tANMOHqP+y+9i/QQ0Qse+IwTEh4BWGvXcI3C+4X2ocQi2ZU3OIsVcdcfbTJYwp4kuEiIa22YGKi6yuvzxvB9696FRKaESC5RBoFEVB0ERcd2PE9dlHca8FuR8qBHaRwYspszedQT4kcy9hWRRNxdqsC/zKrVU/Vk7zSUD/UADYPx8Sw7hMISOBDIbxFImVRGTiEt2w/Na5Ns1OEVUValTtkK6N7EHOsZ8xhfnruwzg4bsKaysKQqzKjMFIbG8TekiRAbPayDS5+5y/Of2IZxdk2PK2S3/uEHCPbh/IeNyzwhNLoVneMpKu3nm3hJDg7ieBFNhkokhunBLEvu6DCWyQR7zJf8qjkSqFUnwZg7r/Fdt4MHQnycjlfFXDFxDM/f+24qWQ6KHXKGXINFb1mcsCjD7/ZqSApdInN30r7s2x/BIsP/Fvy4FlgKHBPrwLFTvUz7Na+/7VBnDLrdCuCMM1/j/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3knerLlQY/49RwPV3Z3oG9u96dHsQipvi1n2MEeZZWOEeiq6COpTZuKKenPo?=
 =?us-ascii?Q?6kTXTai5ii6ONmahbazqkBLq5cwT/d/ILZsKHzlyI2Th5MHWf+KwDvfAHj1P?=
 =?us-ascii?Q?spOINUTgvJtTpIuWcj3l5ut1UeW/LLYQ8yONjL4Ng39EyFbDuqeN+r3qeGZ7?=
 =?us-ascii?Q?SGBP5TZattfBB8Ibw6jrZ3Ut7wxk6xmqS/xZgtZc61u1ENdlmXJzC8Mhzctn?=
 =?us-ascii?Q?BuI43rT/DgAUBxiXPVV1iJ2iq16RNiyKwWMr66mGFkdIwbkvF4MNtnTeenMU?=
 =?us-ascii?Q?w18+d17ZZqcAISxoNFwkcETSZHU8T3yFtbEDSf1gnELxPA4LVng/rr9PCDGg?=
 =?us-ascii?Q?yWKIx+IYOJ9LOu4Gf3srS6FAEwts3BTEjCNDBDNwZWgQHIHdISZKFZSw8bxs?=
 =?us-ascii?Q?kji4uMp9jkHHvNQnsPALopaEy5ILWQNNvfdmT89tDoNXS8zNQg8gwt9CTrPh?=
 =?us-ascii?Q?VhqBgJ2ds/d73LDOl8184hVyMzPA1t2zx73uHV9OJW5DuKMSKL0lZwsuz4eM?=
 =?us-ascii?Q?qkRJjQpbDum6BB30WeMo4oG9xE2PUnVd1AEy1DJQsn5p0xsKqyb4HsIZGcSb?=
 =?us-ascii?Q?EUP+FnsBumseVmX9/CM4Xl2JblhFBkxaMEbt9DUUdGEwC9eoibQ4sb7KQd1k?=
 =?us-ascii?Q?Nu+QdczuhFachuq3HVj4wgLS3t3upO0/40syIPOHsXN6fUUdiSIElOH7uqzR?=
 =?us-ascii?Q?8TYv5N0cgtvzYOpu3dkrpKMScUHwxj1CnHbJHkCmfhht10GhUmT8EAqL0e6q?=
 =?us-ascii?Q?CstxrS1CQtN8JEw7/MwwcAT63jfXGwOnzv/uYUVIJuUYT+FKKu8OuAsJF+8K?=
 =?us-ascii?Q?aE1ixeHinRqkWNJQUOSEnd47ePUDV9XlLWndkDHfhwStJHuKmFTluIgXkGAW?=
 =?us-ascii?Q?Jpmf3wxg5JEF2ObGN1+ysYykOvbMp/20ZZZp+4LLS4P1sG6CVsPxiftiTyue?=
 =?us-ascii?Q?t1QV3yHih1C/R3/TqzNDXpYpoAEKBDuarl3GqH5/XihsJa/eeqYFXB5bf1aA?=
 =?us-ascii?Q?K94yivkAemmOBUW7+zPKuvGmw+3gYGteTyxrgt5WdRw54Zt507CinVb9tcO9?=
 =?us-ascii?Q?ekyZ7eGNaYH5PZoI4411zl6PqkL91cyDq/PqOnB9lIzALxv5QO8CHdsfBcA6?=
 =?us-ascii?Q?h+F3L8ycKEKVDIX5sTI+wCWi3P3GYXFCwqU1BF+XPH61f1SM6eyEtCzoYFJ3?=
 =?us-ascii?Q?tMdNVR9NcWxhLjRWIKdAC3RK5xPS2myt2N3Vj6DSB9mOQ9GQid4PRyjDnQv/?=
 =?us-ascii?Q?g05sdV6v8mud6ibVNQrG22N1VgC9OVGdwZtNq4sq2sTLLKUyF6qkDS3Oy1nV?=
 =?us-ascii?Q?zYkAEzLgIbLNWSHrOfBHHWy1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4694347-38d0-4eb2-8528-08d90a58dcbf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:22.7674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+6r0AEjxIGd1EBiieFeNQ8sKFaVV0xSc+Q0SBUnp0B+mJWbYSjFTos69FyC4SzvSc88sxUjjm1n5vya09QYxCiTtJELUYPs7I/6lnOUfYQ=
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

Add the test that shows that concept of ignore_children is incomplete.
Actually, when we want to update something, ignoring permission of some
existing BdrvChild, we should ignore also the propagated effect of this
child to the other children. But that's not done. Better approach
(update permissions on already updated graph) will be implemented
later.

Now the test fails, so it's added with -d argument to not break make
check.

Test fails with

 "Conflicts with use by fl1 as 'backing', which does not allow 'write' on base"

because when updating permissions we can ignore original top->fl1
BdrvChild. But we don't ignore exclusive write permission in fl1->base
BdrvChild, which is propagated. Correct thing to do is make graph
change first and then do permission update from the top node.

To run test do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-exclusive-write

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-graph-mod.c | 70 +++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index c4f7d16039..80a9a20066 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -1,7 +1,7 @@
 /*
  * Block node graph modifications tests
  *
- * Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
+ * Copyright (c) 2019-2021 Virtuozzo International GmbH. All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -44,6 +44,21 @@ static BlockDriver bdrv_no_perm = {
     .bdrv_child_perm = no_perm_default_perms,
 };
 
+static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
+                                  BdrvChildRole role,
+                                  BlockReopenQueue *reopen_queue,
+                                  uint64_t perm, uint64_t shared,
+                                  uint64_t *nperm, uint64_t *nshared)
+{
+    *nperm = BLK_PERM_WRITE;
+    *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
+}
+
+static BlockDriver bdrv_exclusive_writer = {
+    .format_name = "exclusive-writer",
+    .bdrv_child_perm = exclusive_write_perms,
+};
+
 static BlockDriverState *no_perm_node(const char *name)
 {
     return bdrv_new_open_driver(&bdrv_no_perm, name, BDRV_O_RDWR, &error_abort);
@@ -55,6 +70,12 @@ static BlockDriverState *pass_through_node(const char *name)
                                 BDRV_O_RDWR, &error_abort);
 }
 
+static BlockDriverState *exclusive_writer_node(const char *name)
+{
+    return bdrv_new_open_driver(&bdrv_exclusive_writer, name,
+                                BDRV_O_RDWR, &error_abort);
+}
+
 /*
  * test_update_perm_tree
  *
@@ -185,8 +206,50 @@ static void test_should_update_child(void)
     blk_unref(root);
 }
 
+/*
+ * test_parallel_exclusive_write
+ *
+ * Check that when we replace node, old permissions of the node being removed
+ * doesn't break the replacement.
+ */
+static void test_parallel_exclusive_write(void)
+{
+    BlockDriverState *top = exclusive_writer_node("top");
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl1 = pass_through_node("fl1");
+    BlockDriverState *fl2 = pass_through_node("fl2");
+
+    /*
+     * bdrv_attach_child() eats child bs reference, so we need two @base
+     * references for two filters:
+     */
+    bdrv_ref(base);
+
+    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
+                      &error_abort);
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+
+    bdrv_replace_node(fl1, fl2, &error_abort);
+
+    bdrv_unref(fl2);
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
+    int i;
+    bool debug = false;
+
+    for (i = 1; i < argc; i++) {
+        if (!strcmp(argv[i], "-d")) {
+            debug = true;
+            break;
+        }
+    }
+
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
@@ -196,5 +259,10 @@ int main(int argc, char *argv[])
     g_test_add_func("/bdrv-graph-mod/should-update-child",
                     test_should_update_child);
 
+    if (debug) {
+        g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
+                        test_parallel_exclusive_write);
+    }
+
     return g_test_run();
 }
-- 
2.29.2


