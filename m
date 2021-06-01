Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F521396E62
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:57:44 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzHT-0007Hp-H1
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCj-0001e2-1w; Tue, 01 Jun 2021 03:52:49 -0400
Received: from mail-eopbgr60092.outbound.protection.outlook.com
 ([40.107.6.92]:42213 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCg-00061a-SO; Tue, 01 Jun 2021 03:52:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYJbXWuSaobvrefqfRuX2NK3Wmdm3uatSDcBemme+jmnAmLNxhko4NYg1ssLLmN29PYb0Q67YTZpxybRsqvMcfHbKhoOi+FxVP9u/AX5pf65tx7pwDHAYVTNrMcuL5lGXltDgUP/8URl1khxcW7I1VLYkn6GH0OXNlX2flDu70w9U6HOF8z5ZaW/bBR4U8LcYTj4MYXVLgNKNltoVAHwS++g+uWWsyA6z8srqubuEJvRSRV0YCYJKrttXopr48MzQFrChkps75dGmsBRVcOe3OTvRKsh0kOIjIfAFzEuHrhadDUVnm0w1194+l9RNp+Md4UgTo2R8la2NC817d6ocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ugDrx6656I21Q9+4KGzbnRyP17ZzGk3HQ7qlSgaZ28=;
 b=kjZEX84YDtqRs2gVQq/7fbxAeI5VkL2qr1RMLo76jCIZuMJCt1v+IHYkRdBAksnseRbBJ+qFpcdoTILkC5pPh8JwjZJZ/YUgHr0RY09ZKJAG9yyncs6RFmUy4hRS6cH3raLi61nDFdc1nCRuLisPsI2rexwiSqBt7eHMbXmGvN4FnxzUV5Y79QoiRMIgSVlI33CVfu0yqR6viCw7ojIvTkXigiSM2B1tG0FIfT09DggqboxqBfyV/L6WOX+wKdbZVMrUOAZx7vgL5DZDpb356ijeFcu8ynknspIBF7f/kS+0V5box/qxxum0yXfn39bT9J20o3ZaPaY0DpXxO28aCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ugDrx6656I21Q9+4KGzbnRyP17ZzGk3HQ7qlSgaZ28=;
 b=nRTvsFNvduiryYSe8ykiQeR0odjWCWmM4hVcbwo2AjjzQr3VBK86p9TjaVpA63+EN+9Aw1fKkVlSUPHh//c1SObQqaQgWprXP73sg87EjP69G2NM0UIFJpmOw2JWrp4E7fKBMFux2e1WZLa3HmCXuontfx7CJfkCRWz+BgoMPqo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 07:52:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v3 6/6] block: improve permission conflict error message
Date: Tue,  1 Jun 2021 10:52:18 +0300
Message-Id: <20210601075218.79249-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601075218.79249-1-vsementsov@virtuozzo.com>
References: <20210601075218.79249-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 542ff7fb-f5fb-40ee-7ccd-08d924d23b5b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502494E07FE7A3532A7A3CCC13E9@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZP8R1d8vUrzs+ihyhqMiZmv418U543+zGypbI1a2NkgnuF7qRQD454PG1Z0hTHI78K91I8bGF8CYUOy/zK5KOAgQfRyyry5zl0jf8tomGcqgFNxCj7B+Zw/7PerWNnEIXdZdW7WxE8TThzdPFnva6xchBjPBavymI7Y96uwutGW+F+Piu5ywoL0FWjZH0/RSYwH4CGF6q9qh4Fgvx9OkjDmj41vgvZNcqp5qHiCY8PXEl8/ggCczzMdhjpjA8Yr3p1JfQlAvqH3vqDrbczuJ3R/cuSnWvBnxOEMqUV6+Bi4sV+ecaEkRvL6VHpuXPfeYuJCjNXpu1PXeZjMDBOhdSv43z6wo6Ld6gHVM8cnByBhIaTr/6m3Pzit6bHGaQi5yDixjEaVxJ1ADNstmmXujmMGKLUicL1llzX1z4qzeUPBZXIWiWaPNGPLLi6lSQwOhjDk2FOtie0q7nryPEZAPgljldBS4te4ecJxK4AUFKe3vJMdigluhY8WAwJSdcMgcduDhpfboCFqL/9z5zfvB9CGqV/CHLgtr91eOSUncY+jfeLRe3ZdQgIYWDr2lHhpVsd8fVSVArzSoazvfa0CU/3bjDoZ9Gva2CfrXZlO3iu+xn9J+0qRB9HGmrgb3kS5leIuIERJXvUZN70QhsD6VDjZmIFThFOnD/UjcaNoIQ3jh7vvpciIA+oU6ESXJF25c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39840400004)(366004)(4326008)(66476007)(6916009)(36756003)(186003)(2906002)(107886003)(16526019)(38350700002)(52116002)(8676002)(316002)(66946007)(2616005)(66556008)(478600001)(83380400001)(86362001)(26005)(5660300002)(38100700002)(1076003)(8936002)(6512007)(6666004)(15650500001)(6506007)(956004)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TvlAEw/EMYqnZCUBIjTI96wAGJRGj8jnM0VT88/hSqHB/JZx2oR7jgLYWUlK?=
 =?us-ascii?Q?HqdV3TJFsz1L/ldGMNqabL3DCisrqR635/xoBuc4zoLcMqA7JKeiSepqP4Zz?=
 =?us-ascii?Q?7oTq98QMb5xg6uZkh/vV6PcE1bHhYijyJ6JRHebgIPBO0/C1SoYaMkM/xIGS?=
 =?us-ascii?Q?eZeszW5pAVwQfN6oHXSwPblJy0Avg7Vc4hpWyT9jfSNRSg98IkuoivJkua1B?=
 =?us-ascii?Q?Ob9YSSzdTW2JLbgrE8ueZrqMhTDlsdztkVRxAit6Q//Q4jxU3ArlEmoWr1Jz?=
 =?us-ascii?Q?++92jN7MrP/yDbMVakstrVpznu+0DM/kBfBUcAhWOeM8Y4H6KDZXtOJYh+HZ?=
 =?us-ascii?Q?URXiFX6XsPoUl2NwwWuqN+3Tmk4o28qiOQlvHkndm5ckA2Zt3AIa1HH6IB9l?=
 =?us-ascii?Q?InDhFAyJ68Ja9kgO/ZuAw0SenICicognz+5IuQv2ZovAdknHHwfxeKxA9dfw?=
 =?us-ascii?Q?pVF7ExOLPXOLJBUc9RXri0l47kU4guzEaH0+yirpp6SCEb4vv1kGqAKLfK9Y?=
 =?us-ascii?Q?7N0rLEisz/SfGiyYUB2w0/ZaCyAWbkWluX3WV87XVSikpZ4n7HHXoB1/hxUJ?=
 =?us-ascii?Q?AyH8Vzu6FzlWIOnDs7yZVQo7hQ0kdW5GWM7AqtVmxeMPjYI4IMmZKhc3O12Y?=
 =?us-ascii?Q?FzxIi1RImKF/zYIY52tWDhi6m6IErsJ9HNYOTLnVNlgLZA/IruZs/bsnodky?=
 =?us-ascii?Q?GjirIQthWF0NYf8THG7fZ1u97FGgwsBsVd0xQzhSn4TECATVdsASWHr5r9GA?=
 =?us-ascii?Q?C0nrHSdliC8SwsmnK3pGwXUtUF++9uq5tLoqdRUYGEvcLezxeEF3FkscMoig?=
 =?us-ascii?Q?yzLJo4u3wukToMn4E+ULrsQeie2jY/QqJUPhYg5ZOXkqqptkC3BZeVbstVAG?=
 =?us-ascii?Q?yU0IYmbj/a2UHBAuJXyGm6lCoj2f1ZdfB+sZBpUPK5DQtXRswzbNvBhrmCSe?=
 =?us-ascii?Q?srkU0htMEJ7GuAhdlzntUNvhedx3I0ZJ7Y/rcrxRJk0KIk/U6bZZuyLaRqgR?=
 =?us-ascii?Q?/xPNH+sV3Gfr6eMivzr0aa1wIeC+VixAC9lmWiOjBNOWJaiicXATe8qh0AH9?=
 =?us-ascii?Q?ZOpPtu1YZ1+oFQ+Sp/KJgm3uj3UENzegi9Y9R7PB37EFOqQ757Kz2a0Tl8m1?=
 =?us-ascii?Q?bGCtNKs5x5hPYK9+V4VJNYgrQfZz/tYF2/FS5gYJLh8Pg+i6sii8DnEAR6/H?=
 =?us-ascii?Q?lWOqQ4oVlT9keFUwgpa8wuinMxKSV7s2u/km5syFdkShvCXDj1EJA0ZJW5hr?=
 =?us-ascii?Q?38SisFxZHFyoaKpAxAGNe8kTNBtvg1mgJysfp4wY0TWKiGwc6EpnXamfSXOI?=
 =?us-ascii?Q?Q1LXoPwNQFewI8OdHcNTI0K8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ff7fb-f5fb-40ee-7ccd-08d924d23b5b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:40.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfkLlCbGGl5X9/XQXv5Bc3V3ZPyde+IED/Ipdftu15omY2i13ejaIP/zgh2fmd0NeNckypaeHrDHR5X9Ch6gyoKzsJryvVaiOBDfbnELPjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.6.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Now permissions are updated as follows:
 1. do graph modifications ignoring permissions
 2. do permission update

 (of course, we rollback [1] if [2] fails)

So, on stage [2] we can't say which users are "old" and which are
"new" and exist only since [1]. And current error message is a bit
outdated. Let's improve it, to make everything clean.

While being here, add also a comment and some good assertions.

iotests 283, 307, qsd-jobs outputs are updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                               | 29 ++++++++++++++++++++-------
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 3c0c3964ec..3f456892d0 100644
--- a/block.c
+++ b/block.c
@@ -2029,20 +2029,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
     return c->klass->get_parent_desc(c);
 }
 
+/*
+ * Check that @a allows everything that @b needs. @a and @b must reference same
+ * child node.
+ */
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 {
-    g_autofree char *user = NULL;
-    g_autofree char *perm_names = NULL;
+    const char *child_bs_name;
+    g_autofree char *a_user = NULL;
+    g_autofree char *b_user = NULL;
+    g_autofree char *perms = NULL;
+
+    assert(a->bs);
+    assert(a->bs == b->bs);
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
     }
 
-    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
-    user = bdrv_child_user_desc(a);
-    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-               "allow '%s' on %s",
-               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+    child_bs_name = bdrv_get_node_name(b->bs);
+    a_user = bdrv_child_user_desc(a);
+    b_user = bdrv_child_user_desc(b);
+    perms = bdrv_perm_names(b->perm & ~a->shared_perm);
+
+    error_setg(errp, "Permission conflict on node '%s': permissions '%s' are "
+               "both required by %s (uses node '%s' as '%s' child) and "
+               "unshared by %s (uses node '%s' as '%s' child).",
+               child_bs_name, perms,
+               b_user, child_bs_name, b->name,
+               a_user, child_bs_name, a->name);
 
     return false;
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c9397bfc44..c6e12b15c5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === backup-top should be gone after job-finalize ===
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 66bf2ddb74..4b0c7e155a 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': permissions 'write' are both required by an unnamed block device (uses node 'fmt' as 'root' child) and unshared by block device 'sda' (uses node 'fmt' as 'root' child)."}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 9f52255da8..189423354b 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': permissions 'write' are both required by an unnamed block device (uses node 'fmt_base' as 'root' child) and unshared by stream job 'job0' (uses node 'fmt_base' as 'intermediate node' child)."}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


