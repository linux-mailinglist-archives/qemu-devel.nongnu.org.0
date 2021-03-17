Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9433F3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:57:13 +0100 (CET)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXbk-0001kC-N3
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI2-0004rY-Jo; Wed, 17 Mar 2021 10:36:51 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:8481 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI0-00075m-9W; Wed, 17 Mar 2021 10:36:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7A0gC3e/Wdwew5BpvDh/X9MrMu2kHL3Ad+5cH2V8deUFhBSINnLoWTS7gZrg0bv3ROSWLiJ04A1IZZ7WRinLPx9VmhoUQEWFW5NSjXmD3mEC9kRYqUlegYQxfzF8YvRvnKVgbfizMoTIRp2xGNHYtp+4M9CqLCAya3NRFUXTSzmbhpHgTCtbv9hV8rMSlpoNaiOhDklhYLAeWt1REb5pSf1dPEJ/DKACQk6EWvkrKlUDeXE6ch76W+7lIkBJfR08F0zzDUdla9OlIyA/Wd2yTWEoEwHVgJlRShffKP9QND5yrWovg5MxFir5EkhERFTEsBVqeOjMATwGl9Zhyq1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4o44sMPVdk7/3XW0nSEZeUWV5lTGMB1JcARlZftjrA=;
 b=F1iWd5RcjxZtzkAHCseYh6fDC8J9moEyOJlpxP8sbCyhiyqgJ4MCc3b6fN7lC9085NXc6yQzgmgNEoczFZ5SZL5xAkZQt6ufhHmIvjcFhE2HDQFn/34eGnOnxJRE52i31r6qkgwCSKWEtAp2QToh3iSB60Jl9wbw40in03moWydnuYZN73SbgWW4bk9vUtZWStK4xg3mbSh+IgWI8PTYkiszOAJ6IS6h9/S00jr2oTb1pOquLuT/AsRSeXaxBCz3ULUyy+O+yNwRMWKfGAHRjuQTfmH5VFEiR5oY85Ij4muIR25or7eBHmb8SE26ggqogDxgChm9obco95ZXSTd6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4o44sMPVdk7/3XW0nSEZeUWV5lTGMB1JcARlZftjrA=;
 b=jlgXvecTf6xW671dJ2fCRQNraqKIVEl3nt8NqtPGQ4+0uMb0nzgToqqTQp6AuvBv2bBxTYpUbv8dUJsEQRvmx6VfRKUrXUFItRL9Bq4o3gzl++uAtfiryJfXG3SyapX7BO716lRe/GL09JfZ35lbaD0qdktls9cSiVkdE33LdkM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 22/36] block: add bdrv_remove_filter_or_cow transaction
 action
Date: Wed, 17 Mar 2021 17:35:15 +0300
Message-Id: <20210317143529.615584-23-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2468b123-72b6-4878-c110-08d8e952106d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60385EBD3E2F61DBEA19F0ADC16A9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrmXX/5jo+45Wsau2qbPnsHpOHfeD0YFO4BpumfdccVR6xUFT3HbHI4bJ9h7sWN3SD4BpdUAYApvjenQuj7KzHXnIke1yxmqxWjzIirb8Zs88ErNiQTMZug5t56+pHcHt0lAxcQHqGsTPzDzAppaM+6vV2OosYMdlJqsxRtfco53oKTfycTi6NLPFxv6MZ68V5kmuPtImeXLx3r2IOPepjkB3IbZgmuO6DJiD/lEUBqTPvnz2jc6ZtUI4eNaGj1YZ4PWk/XxjlWNbHlCmyfKsYEfOlT1+ctp6wozFda2QXyC0PrUZa71aMKDFuVF1aOmxEsbylhnrf5p2RdpA8X8YdXQGqj9jmp6iObi35bEFtsFHigY+1HkwcOPN5Kx7g9FRVZIxt++TrXRXQfj+DauMU7er9G8sQtSqGCQ2bnXOxt/WbUQqZrJUC4rKEpNpeewJIu7EbBZJS30owSkbol0ZJNf4qiq8k7UFpvWP1p4NsoyxA8s4qADcl/xnVWdeGD9l3d44p+bQiN4izly6+qxYQ/sl5l2yNLuZlIFfThsMPvbfiffOm7ichvmPPIXxP9AU0YITXU2pEEanwJNQv2GbPmayFxkFN4qfXJ/kpDAVCSijfWy6l5RkatnUloAWUJp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(2616005)(4326008)(6916009)(478600001)(6506007)(36756003)(8676002)(8936002)(66476007)(83380400001)(316002)(66556008)(5660300002)(66946007)(6486002)(26005)(2906002)(186003)(1076003)(6512007)(956004)(16526019)(52116002)(69590400012)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ol6cLRa8RGWVoLDYnx3Lo6NZoRPUgYOSpLEm2n5vRMnzhOzZAZt5/YL6MoWA?=
 =?us-ascii?Q?k6wYymOeFAw4+KYX8LMKK4hIlgAcUmQumxGdTVL5kAObFMQqZaStA59OCYUd?=
 =?us-ascii?Q?8i6yIgxogNkcPUDQohSOWMRyDue9gvTqrpuPw5lRH2fAWix42qwUMtp+WdtU?=
 =?us-ascii?Q?HqQTYxEgVtZP1iiZO86Vq4K3W9jxJpOqGh++dFF427hNbtCug9WyiLx8pkmo?=
 =?us-ascii?Q?YLBzToPJKZyd3GIAQTKNAomZLwiYrbgvS+xNvmqNWzx9EljfX/wpLEc6AJwE?=
 =?us-ascii?Q?I7XBnQR3ZFOaAV7YBCO02/OsVdTNw6p4ggu6RAUQQI6CPcGfHA6tNVzpo7/A?=
 =?us-ascii?Q?fZ1JlgfO9YV8P3DpWnBFp9dp+q9+/aMddWEHOl5EPus8RRqrxkob3geqSDgJ?=
 =?us-ascii?Q?3QG1kQegku/C6wpO6hpqGsrYKqCFA1XF4LNEtBJvzzX61KWEYqTdZofRctD+?=
 =?us-ascii?Q?QSPPIUibYCZ4ds2V/PRwJW3eR4sWUMMU86rZh5k+GxobpktXI6QKoUU7RABg?=
 =?us-ascii?Q?GgK4S3exB1dj/F6efdPCJXRE886Jcx5a7NDi4VRZAzx+vJvb8/Yfq2QKmREm?=
 =?us-ascii?Q?shkZ/JESMAoSD6fay4BGm/rEG/kjx8Q04cRk1sRGmDR7WaPgFUHrh2AlNLgK?=
 =?us-ascii?Q?BCqWDWeSingSdvL4XTKMX1UYgH69wJpLm5E3vq7IvQ2KCyhQI5plrda/mi4v?=
 =?us-ascii?Q?yaMsN5WwaNGekustTM7p6QjbCBLzsY20M8GAbJfUCE+Gejmgiekugo797chT?=
 =?us-ascii?Q?RmHpwUc+AeYRrhGRoeFfUeLzU7rMfBvEwTOoT5Kbpgq8ZIF51T9w1Bjyw9o+?=
 =?us-ascii?Q?e1gTL7MS0WfemkYpSeFf5sPRqbBObG2jH5AwHQZfzuFrCOU45bZAJplYmXzU?=
 =?us-ascii?Q?0FcFCLcle96hhWFNBCfN/WOWGLuKmIHv97nhAg7YjYomqWQ6TewHtoNhwN8/?=
 =?us-ascii?Q?5gzFLLtEAF/TMQKzPRq6m7r6j0R8i1ycv6mreq9DhTfWGF+e9qxCHsUf5Ff8?=
 =?us-ascii?Q?ARlKSjGlzVZjLI/Jjy5QkkQdfdQ/KuoxD1qhdQVJ9zt8iffcMVUX6HPZcbCv?=
 =?us-ascii?Q?NdVToS/M9tc4gbv2SF/5n801ymRO5kH3BsVclCIewAn34ooVYBaGnVavs7VP?=
 =?us-ascii?Q?KU5qpW6d6K8jRIa+pwkQHitG/nqYuTe24hREOQujXapI17PrTm/gn6WDFjjX?=
 =?us-ascii?Q?+TqgXq7QhacTkv29Ukiau3sPMGpsk6wBiKHHdKUE3aM383cM1ZPeJm77FPwj?=
 =?us-ascii?Q?V+8H0hKL3BeKGm4a7Xg8ZiEl+GP3cGiTkpVsaEJhwT9RpBiZjD/FYTAzIHAx?=
 =?us-ascii?Q?ibSPyPmPt7RgT83w5m9Xlg0j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2468b123-72b6-4878-c110-08d8e952106d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:34.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5g29tDORHD+JHP1qwcN7Bx+bt19LizfZxRCKiEgQCsVDbYIANqYwLFzabXv45v/Df85c4S2HrFWMw6rhoQoO6vUv38fxRMpl8t/HPXAXmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.21.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 11f7ad0818..2fca1f2ad5 100644
--- a/block.c
+++ b/block.c
@@ -2929,12 +2929,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 }
 
+static void bdrv_child_free(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    g_free(c->name);
+    g_free(c);
+}
+
 static void bdrv_remove_empty_child(BdrvChild *child)
 {
     assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-    g_free(child->name);
-    g_free(child);
+    bdrv_child_free(child);
 }
 
 typedef struct BdrvAttachChildCommonState {
@@ -4956,6 +4963,73 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+typedef struct BdrvRemoveFilterOrCowChild {
+    BdrvChild *child;
+    bool is_backing;
+} BdrvRemoveFilterOrCowChild;
+
+/* this doesn't restore original child bs, only the child itself */
+static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
+{
+    BdrvRemoveFilterOrCowChild *s = opaque;
+    BlockDriverState *parent_bs = s->child->opaque;
+
+    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
+    if (s->is_backing) {
+        parent_bs->backing = s->child;
+    } else {
+        parent_bs->file = s->child;
+    }
+}
+
+static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+{
+    BdrvRemoveFilterOrCowChild *s = opaque;
+
+    bdrv_child_free(s->child);
+}
+
+static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
+    .abort = bdrv_remove_filter_or_cow_child_abort,
+    .commit = bdrv_remove_filter_or_cow_child_commit,
+    .clean = g_free,
+};
+
+/*
+ * A function to remove backing-chain child of @bs if exists: cow child for
+ * format nodes (always .backing) and filter child for filters (may be .file or
+ * .backing)
+ */
+__attribute__((unused))
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran)
+{
+    BdrvRemoveFilterOrCowChild *s;
+    BdrvChild *child = bdrv_filter_or_cow_child(bs);
+
+    if (!child) {
+        return;
+    }
+
+    if (child->bs) {
+        bdrv_replace_child_safe(child, NULL, tran);
+    }
+
+    s = g_new(BdrvRemoveFilterOrCowChild, 1);
+    *s = (BdrvRemoveFilterOrCowChild) {
+        .child = child,
+        .is_backing = (child == bs->backing),
+    };
+    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    QLIST_SAFE_REMOVE(child, next);
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
-- 
2.29.2


