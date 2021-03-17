Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B506733F317
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:40:24 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXLT-0007Ik-Pn
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHP-00044T-En; Wed, 17 Mar 2021 10:36:11 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHM-0006nM-6i; Wed, 17 Mar 2021 10:36:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTPFBEBoUZPLxV+Q/eb92EkhB/n5R6R6mwD7lcby4LZGxvm5aZ6bVO+Aw4QUEQfbAUPt6gVR+QOVsJ1ZfEb4uQQy1NgXiPdCi2Eu4eGgI+njiTQ8SVnl8xuPQ4+hMESfoW4ppNih+IjIUoFnKB2LKNcsrKJIJxCuugHjm3G6RU95YMC+huW5xF6xdkgHjQbOZz7SpAN29gGJ9jE166Cr0fhNJB8Q0wclQe272OG9aKHQKQqUiPevVtjVkpPaDi6GXXnfBWMcPHbXSMNcz1RhAhQpaIFYe0Z2v3Zh0cAvZbDOeg6dszR18YGC97vNyyz2yjOwdS4wR4TcXCDzh8KHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfJ3cnscqs+XhUUTMe4Dmzlbcn438B4Sz5qs6ALVado=;
 b=VcPPKmtqEMXGhfbxXRNsCBh9ioOSIIzzpVZK2mkZHN2g8eXmtzGd45c0JhHUQ6GRluLcSJNuAHu9YwNLj8bdT/a9qJqW/V0P/G6z7Cp4ZhtD/Cv/ShjKmQlQA8dQAHNX4nmAASzNEWb5jvEbPIzPUWKe3hPHkU+EGsR7HQgXY5Fv1Wmk5uVzgqjtwv9g1MjqGSWg5o6Se/SAyJfc/5vxND8wAlzD/uLjytjXYEBw1QqtvNM1Zwjo/dT+O+Q4x8NgOgfWbrGxzMbn3FjfU2vZRRgyrNAal/b5z9q30jJvfYh7kg73Z5eNj5QuFvIwx9CGAAXu594Ny0J8jyqeWnpqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfJ3cnscqs+XhUUTMe4Dmzlbcn438B4Sz5qs6ALVado=;
 b=UprwZvxuAGE2KOe0VjX93ttNC5W4Yz5DP9YIdNaZ/BpQMqx5SSU+0Ye92Ma5CfDYfWK/rIczlyQJTLyYlaU9MgMJnBbRym6cwlZ9ASoE+SVQGP48EVDQN+NxU3eXIVbPjnYxNts0S/EXuJ8zSRZ949iJrT9FbUgWWC6KQiuZsug=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
Date: Wed, 17 Mar 2021 17:34:54 +0300
Message-Id: <20210317143529.615584-2-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d0f47b-df02-4162-b14c-08d8e951fddb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165085B760449F8F4A1D5560C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8a+d8Bl6M827HPGOGlzrBcIZqFUr6lFLRxkXUSc+EKdbbx2f4nkLZMEodIi8iiA+EWYGwWg69fp5DLoy5jBF1+VlzhTd+izjOGIseoo8jmQWza6O6swyv9N89yLKBH0WYrr+y+G087PbLCOgGX2pkeTLmjvd3DXgCCAh/2nApHR9UTIRgx9PNcENGMbRId3U2pcnC//gQJizD9H3BPR6wdAnxABFIKPO1K8knWc9tyKUNdio1xD7U58u9DdtjH2h8gx1JZFJDINFR5dQ/gf9X2Er7YUTvk44N/t0HBfXUdIeLRb0nS/dHgCUG8yANhK29E7kn1pVlkEIKmfgQx1UWmUfdgmSxsZFJ1eVilANmsw29CTMwac3E/dgNGA38NGDrM1JyiWC5OcrhTdRCoRXnp7ASXcd7e38dtIaFzhQfxj5P3v2aABCBNVNl+ng+N7yiRJydkXXTciFnOsrcJeyw4S7FhrlsUw2XihXTkuzsWQ2DXnFclQh2JPwZxOqnxf9r/VehRocgiDSS2ccpWagY65EOqpljX6wI2NhLao7lN9Yfg6xRIKjnxjW18N7mPmckHAzDaLlVCp0jx5DNdb3VIrp77/yj3GWZX1FEIJL4giuQ5/CLPxlXPl4VZ18v3UKPjkl8hLRk/zYcPzx5THWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bex8u00amsj81V4AqXKENZkofuQo4YL9Dg+hHzoSl60Aud2pGQStsLPx6OBk?=
 =?us-ascii?Q?AorNaMe9vcSixsHk1lLJmSRJ1tMuA70L85VwI3fiqI1o2H/4bc0TaMyvvwjk?=
 =?us-ascii?Q?QD2xkzfYe2BaxmX0m3bGkENhksWD8NPmnCJv6NSDkSpUU4L1KBybfEN+l2vO?=
 =?us-ascii?Q?Pys2lk6deab+v+uGKehI2OPs2iuYdhYjJijOdCYuxTD1NzQ5nMjpAKYLwKrU?=
 =?us-ascii?Q?47PQ/gZZtkHCldR9MQTOZR+kJDoGtDci8r72PKW5YVPjJARdKcV6Ub4mPeiG?=
 =?us-ascii?Q?zAtftrdNyBphYq/4UMQaK9xQ4tiaW+3Oo05KrIQv4ikrK38oP4EkbCSgWnCr?=
 =?us-ascii?Q?/XI4jn7mGyfGtdc86cxkM0CzVd0L5VKj43FB8hSMBWvqDxkkuMIOOavEkXxx?=
 =?us-ascii?Q?0J4iO80QspdDECyYkYXXDVDsN3Yuza+HVIS+DMu+GKwop5E9E1U+Rqcr6Tr7?=
 =?us-ascii?Q?aU0CXY57yWCy4F/DQ3Glgx/LWvNkbcE8i1ctkIt9yCzck8TkHF4eWGfmrMYJ?=
 =?us-ascii?Q?j348qkLgOEL8Yvy//cABaW/C0ytOmP6BueKF/CgemFcJA1qDmGO4pOfkTECs?=
 =?us-ascii?Q?IlPQiXo5ZHGR6Mv0KJ1PwnuhtAf+aLW321wOffC2aDcYnau/qb38XZ3QGYFT?=
 =?us-ascii?Q?oGFo/e50iDIJhe/iW8VbYz7zBkLSiBFuWwvFP9oRH5wc85Z7Xg7F532HbV1U?=
 =?us-ascii?Q?DQxImOdlxiiSj405mocfqhrFo+66QrNiJFT59Ji3IOvkOmzW4oxvVsLaZR4g?=
 =?us-ascii?Q?9G504FmtiftK6u5tXccFsiO8L1+8GXeJazPgAWDSVDWLKENO09DEolhqigaR?=
 =?us-ascii?Q?f6Jq4yXnNJj4Ha5YAMe4633uVL1QdihBErecrXJDNhhCCRTLF1LgxNExNjoB?=
 =?us-ascii?Q?FSrexlLbM7snxt6G32G6vt+jO7+a2mw/t3n3SS+r8Rqk6wnxkqlfU60CYQbo?=
 =?us-ascii?Q?Xd7zC4XXaL9Fq4qa9ECW4amJp0chIRpsC/y03kjGFeQlPkVpq3hbLnC7h/Al?=
 =?us-ascii?Q?l7PnNqFQUef/8tWWSX0D+GvSjLFjrwaIN5gDwf20FANkMfbCSU5iHZZbtkRE?=
 =?us-ascii?Q?UrLNwaOHODLxw/OcNbyNsguahsdrT6N7RhmhZTKXGe04EWsILgrIGn9vWPRt?=
 =?us-ascii?Q?/ke2RmtcIUHCLXyZ0lPk6kx97m28F3/A4PWcdOXa1eCAQwtWNVOU07GKQLfS?=
 =?us-ascii?Q?a99/25j7Laeg30ga7F/L2DRkllpQ/rduavxBuzcPIIiuFMsc9Je7Q9PSGICZ?=
 =?us-ascii?Q?o/JIMEELkAonT3NGt/AHO87XFw0ZRl42l7oHckDVuXNJ++G/e/GW4ee1l0IX?=
 =?us-ascii?Q?oq66ES79sohYcQ4btlbHpxdB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d0f47b-df02-4162-b14c-08d8e951fddb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:03.7354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWokP7kEFBtctDYpDxA07sSSjG8o+qs5zXueu+20IrOwY2FqUxvQIZBQm5Me0eKjpvRJCm9T+8ilF3ceQJwYBiaF3LV7zqpt37CcNmnmOac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
---
 tests/unit/test-bdrv-graph-mod.c | 70 +++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index c4f7d16039..4e4e83674a 100644
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
+    bdrv_unref(fl2); /* second reference was created by bdrv_replace_node() */
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


