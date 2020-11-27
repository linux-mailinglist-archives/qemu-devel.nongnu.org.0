Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF52C683E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:53:38 +0100 (CET)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif7x-0000zz-NJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0f-0000uW-EG; Fri, 27 Nov 2020 09:46:05 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:40192 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0d-000369-Gg; Fri, 27 Nov 2020 09:46:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1lr9Okf4Oiw41XTRS79q/RpGsB7XsuNEZljzdckibrS9KQeWP5OtptTqMPfMClzbHwiy6fsh24yzrerwmEMcSv6XnyYbjaQDaEXw9E+7RJj6g1WSHo3SDBbDfVgLWiQ0tqIQC6ucFQRUlXpuf7UQYnVIC+pko7wJVJ8ul7sF8y3vPmKzNcl/TB3ZDZe6WyMJjVDTc0Y2mh8SjTVt/YEkq3s7CSt7JSbS6p8DJLfN17esB/O9acanrJB/SXzhYf3iTU7VYLY7dRssHa982HPMRKZcuWcib4bO7eUptKXKDCwxP7Du9yf78/EcV4VxEWGkspE4s+J7U3xWa3z8BlA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfKrlBnM24PbMJMuiw42AzL42bQJiCYNW1BbgVgTT4s=;
 b=BuKynLKMGARHAcRkVDcbfUbX/36sFvaF1xCzZRRaAzleUms8O+DdpJswZSvGqH6AXzdW8yLMuZ2xvkjGRNNa7dpxDJ0zkBSY/xvwakxe0qOUDGteLIc3Itkk28MoH8Fryy1g9bMdzuJ22aMyrwi8dyUacLCUTP8FLI7L93vPah47NKC9TfGeZy5MbRm09FhRKwfGuVNKsGs+QKKAdOXPkhfL0XD9FZRhnrRj55wVlZK9P5rZpJ9pR+J4vcQTq4mWhD03zTFYD3TNN+Py61eSxLRuP8m3jsM2oWHwtBKjnYLwr/1/gP2nASsdjzhv5cVaqTMgieCvdWwtyWUjbjpnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfKrlBnM24PbMJMuiw42AzL42bQJiCYNW1BbgVgTT4s=;
 b=XQAJFnjO1HGBR75J4SvR7ECfpT3NZDrSZQWjvwpstiu4vpVhuen5JkLzThOD/vQnDPjvHlKZmJvGzGFvA5q/Q7nk850GcIo7Zev3nh+5MPVw+0jzVvuexQ9No0S6ou9g236a4e0joLEXX/q5DfTLMeVn0EUuFr7MfSoB8nZVtr0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5128.eurprd08.prod.outlook.com (2603:10a6:20b:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 27 Nov
 2020 14:45:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:45:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
Date: Fri, 27 Nov 2020 17:44:47 +0300
Message-Id: <20201127144522.29991-2-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c73c7ab-cc7f-46a6-b5af-08d892e31a8a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5128DA6D0646E4B082E307A4C1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iztLi3J1k88Zm0VsJWgP0lD3PLIBHyjcJQenhY4nmGkaNJXj7yvIfkwTbbXeZBhujglejEIdUHp2DtaOaGDfDUS2d7UycG54np8Nw9wGiegCzd/eIt1GDgN+9jnVKyARp08PQr3UtxcUsQZk2R8Wco8kuHb73zS2txw2mD9dwfOxgoQMj6oTHa58Z4CJ0vhWNxbxXO9S4B/NfpXfYZacU135CvTVoimL8msBKD7K4KlicbrHKPMYqCScOz9g9LdMyp1kaUJ0SRHq1QRgcBlWOPSZ0pIXuKBhn7GZS2CAwUsEc+XDSX2ia7MR6A0R30VOfT+/td4iEC96T4KrjIGvQYqB/G9L3R/Jr1l33VwxFtjVXmGcfwP0pdDFUU1el3N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(186003)(6666004)(69590400008)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zYBoRtRLanMSsyCXh1huDmhbAOVfVDky3KZRk0euHOEDqQY08QCLGgYBrke6?=
 =?us-ascii?Q?Gf79KliqO5Rvxz53D/j7sojzL8jLLNZQPUDd/ftazr28jWUaskHXPpN/LWYt?=
 =?us-ascii?Q?43o5Aa/tzHTyuQtwFXI9vmE1a1IpJXA2YRXhwq7+fLvbLZkuDEWGJf/A4X4p?=
 =?us-ascii?Q?/HS9riX/6DWnOl61ZwjCrAXc2MurkHfcqWkZ5L01a8Uu5s0mW72UFfVB/+1m?=
 =?us-ascii?Q?lDxUwKDEemj8ZaAe0PES7ZzMJLkhrxFlihAHLDEkMsBUH/cBER4xI9gWoR3r?=
 =?us-ascii?Q?wPh+ZxN3X9B6FW+jPEUeubwQbOasaltcHAJ+NsNt2A/Q1fRbXcIxLZ/I6zog?=
 =?us-ascii?Q?NaglgMl8T/SlVOIWPMwtnFzEwlJDA0YRJ49doFTdzHddGlpqMzXMe1X6g4JO?=
 =?us-ascii?Q?b9ZflFf4oZhFuGwaYOjQZsaY5rR588tmMTHqcFSJPO+e6ruRYLfvN4hu8ktA?=
 =?us-ascii?Q?kPD5l3yW8nQKYgm8yAMHgtERX7gO8bXt6UUzgdsUH1h3eKtHivlO3mLuGJsY?=
 =?us-ascii?Q?DkjeIwK3KSyaIOsPYvtCWMD0KWSuZ1ptnoTJjEjX5UCSCOw0ulCJLeZRAmNm?=
 =?us-ascii?Q?bWvG4QexNmCEzuVhV1DEgVV5iWBb1WK8mG5RdgIl4IPAgbiiwSKdO/3t56Xn?=
 =?us-ascii?Q?dD1+K/CFxF7NnOHUs3g5dd9ozB9+8tG2eSVE7wq+LgaJFuQ8awWqoIQ+vDEn?=
 =?us-ascii?Q?TJE8C8YKseG7ucXVN/iuyLGHlALBecbw/V9f6R9KmnANMJ02RyzyG5KsGDW/?=
 =?us-ascii?Q?ybFQd6XcHITkcDboykggrM/H5QuqRKrvOLuUSJo3iBXcQh9DCZs7oFgxR9w5?=
 =?us-ascii?Q?hHxQdx0jFQTEMZcz6THmstHzNsPBScspD99m0F1Hek2HQUyXsJ/QmQ2ct5CY?=
 =?us-ascii?Q?ZltMokfn2j7a2mLHEylQQmhPceEE1ysyrKCNP7Xp52er0ECxzkS8i4VfVWXc?=
 =?us-ascii?Q?B/cg4KwWky4r3U39FtAvr/DgKWGrAHDQMul3vcJ1NGie33WIhzQlwr0NN+FY?=
 =?us-ascii?Q?1TRV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c73c7ab-cc7f-46a6-b5af-08d892e31a8a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:37.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LthqGRy+ndqcceSckbyrPoOyvlHF2z+cfCX9lwOem9kEe663Ey4uLkkuNyDWy9QolJG+f6UYwS6Wv2Vpy7mp5duQAZos7TceEYF3F/POgQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
 tests/test-bdrv-graph-mod.c | 62 +++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 8cff13830e..3b9e6f242f 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
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
@@ -185,8 +206,44 @@ static void test_should_update_child(void)
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
+    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
+                      &error_abort);
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_ref(base);
+
+    bdrv_replace_node(fl1, fl2, &error_abort);
+
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
 
@@ -196,5 +253,10 @@ int main(int argc, char *argv[])
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
2.21.3


