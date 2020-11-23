Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84E2C1588
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:21:41 +0100 (CET)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khILE-0001aX-Fe
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICu-0003xi-L0; Mon, 23 Nov 2020 15:13:04 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:5972 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICs-0007KY-Q5; Mon, 23 Nov 2020 15:13:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPBYlj2B/YFwksn+YK3ezRwl3hyNLd8fPkSaC4XWPAC8kWZS7l9yaeX/f9oev5hasspTB5eKlH+Zj8kESNlCYpApFBumm0Th/kTXEcgKqCUDH9HW5enSMuo0mdgo1vpf4lK+/HbdUetf97i03oPipmpCzjGf4hZtstccnx5XtyvKWQMVJQ+JIjipZ+lusSEvSl9Jh8kqmUAHwQHuxf5ybHQ+uXwDp8shVP1eqkNZS7cVpk0zbeT2LlMqVO8E1BeQFA1FJtygNGR6phpGV7JkoxUKEVMJwWmAVvIOEjr7QZmRUZ5SR8GE0XGFjE3SYR2oCTEyQJXDuGuunVF4M+tNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz5aFpP0pFNJf+XRHJeM2GHXaL6TNAk3uERb3fkjda0=;
 b=I61WiLV59KRtol9LZQ25gaXx9GTIqQmwbBq7YL6kox0lFD82GAhGYjpRJsshDLAH6szqpjKDsM2OSfIsTdAFwJ9AkXrCpbBbWM7raS8ita+yvzFYZ7ze7vIVpTdbDRaBDS+fcCJRItZQ4zNEEYdo0u/O3fH9vstZIgY6XbBjBIHnpjxwtJBQOEjyh9Rok12MYjX8zX3pgc84PU5pSItK+NPRLk74h0+ZBVFuZnBbh2vERDA3fhtka3W0ISscvzoU4qYON0tBap8DUVEm9nc1AG8IOUTxEXQhk8DcdYgNmhGY9FRC2Ctfev1x9yy7hFaZk1NfzY8YZYpV/kPyyP7dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz5aFpP0pFNJf+XRHJeM2GHXaL6TNAk3uERb3fkjda0=;
 b=mEST9runa4LolnCWHlwO6ROyjwmfKIMlg5OWA/nn0VRHMY0+S//DFZLZObfoCqgzXGOq5g5ttrGAcn/HI73FBUV7Dk+mxtlCGUMZJn5I2FPsHhxD9GCs2aHhYNbhhcwySexv7BzrGxvCdtvJZkKc6u7n0OY/i4zsTsMmF4wFkEI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 02/21] tests/test-bdrv-graph-mod: add test_parallel_perm_update
Date: Mon, 23 Nov 2020 23:12:14 +0300
Message-Id: <20201123201233.9534-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e475db-b727-4ec5-12de-08d88fec27f1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46909A143664B9B7D65ECA85C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxQfjEdt40M47pf6bzPPTNpuWrYbmYBNbyUPHOGIy5qjfqBukeBZO9cpepJdXP3qpURaLQHuL4PnMDiJRcGwMz7GfLyS6fCGeZNDdAuY3I20P1Kv4CO5QWWmhFnrAgqJgn9zavE9LT0W2YZiMuxy/y3cze2HgvTES/9PwvJlDFnrJBAVECetvSqmqO9amcyMIU1nLT7wMzH5iIRpEtjCHvDnxJFWjh9Lz/s614Wiq774pUrSN/2CUQiReNiDT/Eane+Zxbc+kY4BU60KU9aPQ7J1Phbw7Nn33d47U/2kPMRwaaDGKV0zUd7usQ7GqcTsbMxjxqagej+Man6OEbnU9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: dYhVtJY7XqyhG55ZZgfzE59AVZlRWLVt6RP5kUUBfn0ATJNHHgnWH7CBgKuYhsLb21KlwP+USanmQuPGs2MiL4Px7/OYmoq89j/KMZJIbj9N8OruBxTU+Q4mL9MceKbEkjCA0bS6Lr+VhLmg+AyFVbRkEln8lTHIkobPl6kqJJDWVrx4tiX4RZasovECjGePqpT0M/w04t1JFR8i2MHDT0S2S7K8Hkr0JM5n2FAQAdfRwmSy5ApBJ5fhGVhgWc/p7vL85yqUswvf8EqtCkbjouo94BDl6w59xp8KRh2E0AppYICCz/TeJ/Qje3+/pICx6gIK2dV1ZLgcxXIYillnnMdyvjpHjyMs3HzLkXXZSoUt01SOQCzNWvlYmzfA27LPhkW5fh2SoCqMhysQB8PoOEyz4x6hNLPIC3RIKDfOB64S8Lfzljcs74fe9bSMLitDr5j6HruA6AwKGOwuJ8Cc+lcee8cRC5N+6/0bSBDKNYMDIfzcvAcNHGCjpVQH8kgWSZmmhAdXGFJJ/ugLZnA3h+oh5PmokAYQndqT5EZMMnPCCOv9W3uDu5bBZ4kORQ9a0Oo/lw6IekRdvKUuKumzHJKHfnCki4naAHBk4a6X+3VgnMKSTfR3MbRXubsTmTctrt8FHrpB6TEsYLDmDbkDsTHs4LY1EZ62IJLEZGh3O0H2QhTtwxD2b0DH+MyBU3IVOiaNrqAt5onlH0yUs0xTUdbSAzJZ5aboH6d2wFrQM2bCtXWumqD5tvAkad8Xlw9NrPW9fT4S8jNBThDFrJ0u/mr8j+xU/tXPL+ShWLtc0zBU80ebHWM7BRTR9bmZuogxobWOs3tGSf4xKqzWmo1XdiTqQV++TujBrldKVvAZusz5NZm2ZduarCg0og5wtp1xmdHTEf3VTWv+NPvfe4l5sQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e475db-b727-4ec5-12de-08d88fec27f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:52.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoP0yu1ngUHQCWSdDeIWFZty4//aSOTvGqzdp0TxP1paoOZK5jVK3v5oI482az68Ivz8D5dDeY2mEU69uJ/qE8S+D4tDHqF2HEM/ssCs1hc=
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

Add test to show that simple DFS recursion order is not correct for
permission update. Correct order is topological-sort order, which will
be introduced later.

Consider the block driver which has two filter children: one active
with exclusive write access and one inactive with no specific
permissions.

And, these two children has a common base child, like this:

┌─────┐     ┌──────┐
│ fl2 │ ◀── │ top  │
└─────┘     └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  │         │ fl1  │
  │         └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  └───────▶ │ base │
            └──────┘

So, exclusive write is propagated.

Assume, we want to make fl2 active instead of fl1.
So, we set some option for top driver and do permission update.

If permission update (remember, it's DFS) goes first through
top->fl1->base branch it will succeed: it firstly drop exclusive write
permissions and than apply them for another BdrvChildren.
But if permission update goes first through top->fl2->base branch it
will fail, as when we try to update fl2->base child, old not yet
updated fl1->base child will be in conflict.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-perm-update

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/test-bdrv-graph-mod.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 3b9e6f242f..27e3361a60 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -232,6 +232,68 @@ static void test_parallel_exclusive_write(void)
     bdrv_unref(top);
 }
 
+static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
+                                     BdrvChildRole role,
+                                     BlockReopenQueue *reopen_queue,
+                                     uint64_t perm, uint64_t shared,
+                                     uint64_t *nperm, uint64_t *nshared)
+{
+    if (bs->file && c == bs->file) {
+        *nperm = BLK_PERM_WRITE;
+        *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
+    } else {
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+    }
+}
+
+static BlockDriver bdrv_write_to_file = {
+    .format_name = "tricky-perm",
+    .bdrv_child_perm = write_to_file_perms,
+};
+
+static void test_parallel_perm_update(void)
+{
+    BlockDriverState *top = no_perm_node("top");
+    BlockDriverState *tricky =
+            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
+                                 &error_abort);
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl1 = pass_through_node("fl1");
+    BlockDriverState *fl2 = pass_through_node("fl2");
+    BdrvChild *c_fl1, *c_fl2;
+
+    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
+                      &error_abort);
+    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_ref(base);
+
+    /* Select fl1 as first child to be active */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+
+    /* Now, try to switch active child and update permissions */
+    tricky->file = c_fl2;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl2->perm & BLK_PERM_WRITE);
+
+    /* Switch once more, to not care about real child order in the list */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -256,6 +318,8 @@ int main(int argc, char *argv[])
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
+        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                        test_parallel_perm_update);
     }
 
     return g_test_run();
-- 
2.21.3


