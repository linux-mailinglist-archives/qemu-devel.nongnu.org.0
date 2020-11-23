Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAF2C1580
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:16:29 +0100 (CET)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIGC-00062r-GE
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICr-0003ri-UZ; Mon, 23 Nov 2020 15:13:01 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:5972 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICq-0007KY-1L; Mon, 23 Nov 2020 15:13:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx0g0+Mhfc1QRAra5aKYIG3IP2uL6ghgZrGlTm+QT54UFWno8Yu/ArktPe2Ncnv0Jwi6PiIF3Yx67iWsEu/Dd1PDd3R87gyBnQ8HkWuk63ryX1YtI1Ct4b36JUbevoKyYaguRD0oYHWZsXL+1OrCOJ7qNTfQdUifx9x7GQSWMQNZueN/gdFIK2FdNG5bQrB1zr+LDRwPM7mau1hSeC8GSkI2Y1bn+9dO+X/gf6/yOgBEmZUEW8NhpXTdWjp7kM/iUwSSimEkkTSJuLJ9XmRW6tu6QgCy/ndzZrfU12p38N9qLhTcY8Cyv0TzpQkxrL9QcsTkoRIe4bfPC5OZ04uL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wge4ZgvegXxFD6ruH4YaXHtuKd01qth8OrBLxBhBQtQ=;
 b=mE92bMj8wqi4B42jYgO1G9K1DlOWiIgCrnCLZPBZ7xIFdvixekmgatiYeXTGmS18aETTqkosfJIcMEg4I8pC6V29sszuS2c7oC2eCPjzyEPxj0KECjVUXB+vrSWW+TVPCzVN3GeNyZ0xL0BmFAVE/aKpIon0oTseV+oTP9D8/2hOHkFycQH9SWcx4LPZnzRm/dWYkCJTnMWJVe/eC/mXHB2990kaf/2f+iFAXiFMgAc1KjZwSgiotsy4VJMZ7juMXXkO3MK5aEhY4SAYpGAQVWCKzUf8MyudNmlMIIBHw1Ytd5AoLgyPCESQqQn7ijd+IJz+Wk0c+iYGwXgCJ7b9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wge4ZgvegXxFD6ruH4YaXHtuKd01qth8OrBLxBhBQtQ=;
 b=gdBQAApX97CNNBRLXDraoFmWf5gSNx1cm/a5lHIhcLM8jZQeAX+Y83gegUACWVtIzfMgXpSg44aATgkKv7N+/gyhnimJe6st7CkO2vo37sN20eB/8Oh2Fc23u3e/g2WSk9g7tAp36c5Sy3g9fixVn8FbFkrKsQOxfvYVPzNEjUU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 01/21] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
Date: Mon, 23 Nov 2020 23:12:12 +0300
Message-Id: <20201123201233.9534-3-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a214a04d-a2c7-481b-bb93-08d88fec26c9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690D276541CFB6DD29A98D8C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgfifS0jH+7DX/Z0EWT/2J4/4hpnbn/M73C3oX1YPWF9UcWZQ9CfQ+OPsHEmFbPf7dCib6Iqawijx3Wx7CO3o39A/fXn3bpzkQGZz+1gxjaClKjuRQqkVxGN3lo7ntO6Qa0o5jkSsSFdYHK9nhDj7wOkPOzUQ/E5XnYw7S/mxnk3Uk0HikCTNLjoTrIuF5/vvgjudNEzrOfi5p2oO3pOjKYubOUzwizWfrOa+UTe0FWsi7rLxeRGP/IX9TK57F2cGNdVzQWHe+TGTgsET2hCycab1VDDPDR80oIQrouf4bYsrgSBI41MemCVXMrppF44vvj6Q3dJqmC5lKupR09OXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: baXPMohUAZmbOhBEdPILqK6cVgilYmK1x/QfXcjkeq2JjSOyDsN32LCLDy5RuJtiR4WCL8ARsiDYchJKNntB7gqiWzjmvLgX/h3AuDNTj8xMsFjpARfm3mEQZk3GAAfcLzkpOiKxPWy0UqqH/34+QKynqZCDTDy1QmcYAMe7o/ZZQiaH2BRz+LWSIktKDUpbcrB910p6UB7dKUUKjVyyEmMPHPz1NS6JwDuTR5SpxTjjiCrC2qw3o0WVqem6wKYsbac3oW/zn15GfnJ2YS0qaR84YX+sYGMbjNzCuR/9BZ5PLu1xkPGLzDXBYHgrEwtroJAkG3x1zoImF9B4Of3hQIbxnzuTG7+lJ2S4PBdJpZ2MWO5vcNkXA5zLe6H2Ai4adUkCebuB3Tc7TzfGDXWQWsob0Kn9Wjn+GQzbsoz1e61jME+z+fXv/ybZ3wh6St9EW+A28N8pqd4/oRnohWFuxYL2P8sP1w3gaSSB++55vZU8a1baYmz7WD92UqJVCngNiFfoqwofKVVRbWVXrjg6qgShtfrXxmQA4pJN+qORQ5KBxPlIthdblN2/6hhMH7Zz2IRPBJyVhHKxrVW9KFlqZq7JAO7F3kRCA8uQdyozBuye5NSnivyDTLEGyTpTgOgFeKOic0ID/8rE30zksuysUTqD7pxnL5rumAQC4spi6MBwziR/YK5CET27Ze1NIEI/H6cVkBflUj435ENNBVC2XFARTs7D2YNw+Y0BbUgH4O8Zmp0Y1IvhFr/Xc3X0jaAPeMuHFsjgEQae/eSfcR6ZU7mHt1rTn3Lu0Qz0LfSp3vjWfT34ks6F67Oi6MKWDOf9O6jnddi+1/DJBGAxgYZbl/VWyasftXszVCBXI8ideqaKTjrf7UyKRaVnnAfQKyH8lAKqnrTM3U+lkn+4JwVn+w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a214a04d-a2c7-481b-bb93-08d88fec26c9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:50.2059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KTbAOzGGai3efZS4UCpJTy5fo+aIEerC44x6MIDudbRnhIrGIpgaSIkDhJDXQJDv+jikaTvk6/QjWkqHwAeQ9sdpVhwAd4WgnayUOqb3vM=
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

Add the test that shows that concept of ignore_children is incomplete.
Actually, when we want to update something, ignoring permission of some
existing BdrvChild, we should ignore also the propagated effect of this
child to the other children. But that's not done. Better approach
(update permissions on already updated graph) will be implemented
later.

No the test fails, so it's added with -d argument to not break make
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


