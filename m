Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3D33F3DF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:14:23 +0100 (CET)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXsM-0002UF-K6
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIL-0005SJ-9L; Wed, 17 Mar 2021 10:37:09 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIJ-00079x-8J; Wed, 17 Mar 2021 10:37:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoGdpBwTDKEgFDVPFvLXI5AB0/odpOcSz8Q8a23kAzSyOi7Gqig5oyG4ByQmdAOsu/qnMTxgX06RlvQbaWpYDcKPrhLfZEw1f92DA4+FNh3ZfFcyyXkjqEYQ/71qA5WMpFBxUsICRPQHD3FZMa0DWOeY45YQct+O/G/n0ntyRLTmyhecY/lXCTPdwimcVfSadtgMpuZMNeLgK9K0MJwaJnAmxZ+2jrCHf4AUNQDzy0Y9y2AY5lY/qGeEe609FylC5o/GpkdmcJXiKo0NrxhilENUFmsNgVQYBussqxDCh6NdBGxKXdFPf0054stS6MP4rwKpq5SCb/xJoIXbtqQPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnCgXCMPoieBYHi9QqQCw3FkX7fX/1go7H4/s/BCtbU=;
 b=gyRc9kje1uXdu3N1PwvhmWoM8JdGHqA0BYwF+lgbr0NULfR03+OxHm+7dDO0pwdl7I4F+7iPu0k+aU9X70/L1Krkbo8MoPYy72xvuMarrUP3ZZ7MQgLJB9L0R2S5DkCmQIcXlLikFZ56KZNL4A+V/NiXCkOqEv9P+hVt7vW6RhRXcN7cdKDW/0QjQRAMW39lvv/OJSN/1uXrCYdgEt8WDLi/dmI9SLzLYQh8JW8CMHahOrCkd7JS3sGU5f4lf8aI1Wb9VJ60oqkW8b2C9xFcOfBNNzMJ9FnMOTGJ3M3mLU0jL0zHJEayXJlwPAEyv/P2JAEtrTqrN94UUz6E/wtd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnCgXCMPoieBYHi9QqQCw3FkX7fX/1go7H4/s/BCtbU=;
 b=HfdpPV2IKFg6UfQO2n5vQKaWvaT/EF8ymoIYMghuY2JA4eway74+xckJTfBrpStqS9NZHGA3JiZAlf0AgUqKpglYf2WXFsO3qC/LFdicngd8w/4tSypm88DM9B7w4P6ICvOPaxVk30w2XFjU1K6GkJv+7Cb7B1Is1OVvZBy3P9Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 34/36] block: refactor bdrv_child_set_perm_safe()
 transaction action
Date: Wed, 17 Mar 2021 17:35:27 +0300
Message-Id: <20210317143529.615584-35-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7125bba0-4687-47f0-3999-08d8e9521aa5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216ABF66153FF36FE192F1CC16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXzmPTsWBsj2nwTtMcUWt6rn2lAlvAqId/eer2C653zuyQdHpO5+naCs4pom9zCiB+5ifvND9FgCGBawqKRfUVBdHIULGsZw57RWLrCgDq2zUjwynJK59Ui7cv/9SHGIrWfDGZVMTC549gGvUhemJipeXnZec0Ypmin5OsEsJPVaafLP9zHE9EhaLEa8EX0tLLDD5keLfIEZBiZvy/WfAtYkGYYslHa+UVNmhOSBKIVJ80aZQdEE3CLbymHzYCzDYGCF83OL0ZdpHmsOQQgi7ToRKY8LfZJGSnykRY4nShD4MWQRO8ES1VvE9gw9Wnrin4402OuS8f+ey12VmRE3uW6ZJ5IOET0xhgftQib/oScO0igEuAtWbFswE9aVhUUNolutBkAYaljdb98ksIMreTWrCzZHp/URkZLetg6ObE1BocShROwNCJ0YlsRhjPUTl485YgKoLxjnp+ZT+1d7ZxwJ/7IYJwl+Sn7jnpmfN2HA4Iq5M4V1CPiz8xW0IQBW0X2DF9ZEdlruhtiizS9Rzwlo/wdSV8FHXbX+a76tTRKMaWqzPtp2tz/zeZ4hjGDWi/SoQAtP52RZKgypni0xskJhcZmIlkLpnjO2neJAnwbw1+GqYE6zqqVTny5GIER3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Jp+JR++dA25HoGJu0Opywmx9X2CIo12rmu0ThyKIFZ4wL+c2Uy9yBvIWVDp?=
 =?us-ascii?Q?pdDZ/pftRf1V58Qarh3tQY7Lik6FxH2k4tc9BIe6/6WTi4zLFUVjGiyIiA4s?=
 =?us-ascii?Q?PNW1YemZvwYWZZ5wBqwX9FvzV1aJaaB/gFq9CeeaCNFp9jx9xlwUcXRCvF0G?=
 =?us-ascii?Q?1X7XvbKGEjZQZVoWnhavGFSbP1rkNKSYR6664xu17AQLSa+GB9PWW9jZU3Sj?=
 =?us-ascii?Q?NgMz0+gZrreKIjOFgYRiOg62gzBUJj1zOMsGqHp2EriVNRYLX2Pwrx0dHuK3?=
 =?us-ascii?Q?6+65vpJJJE8+9I5zoTEjBAn0DPkUiR4DKNsEPdZajtEqEI1CuY5ec4EjULaD?=
 =?us-ascii?Q?5+qg/rlMILm9EOXQeCdUhcHkTbh2pqPQM2h2jRVmCJKK0Zl10vQ81gWx+Hk+?=
 =?us-ascii?Q?Eeg0CivRNBr6Y/0zRiRAdILxrMbVJw7ARcTWmDPawYvcfwyX5XMMKpTHdzVg?=
 =?us-ascii?Q?fJ4KQrbD5XX9voO/FqDNc5EAgnWwniUTIS2CCzPoAWzHWdrOzXEqtBHFx0/U?=
 =?us-ascii?Q?Mkgydm3zB/kYw1a4Y/iz7fptWDu0g6m2qutcqYoTd73E66Dq+EX0Suo0syfY?=
 =?us-ascii?Q?ZahElu6QXokfQw3Qb/+kYYc8Pj0NZF4AQQb3DJTz5n0vMYcX5pf6NGiXoFT9?=
 =?us-ascii?Q?3I0V7ilPe2Gl2mWpRlsB8bz3W14M5lQrecIrdbPW+Bu4iGWmhgekSZWh56E3?=
 =?us-ascii?Q?+ErOnYgVlHMlHfBeK3xN4hr/M6rwmpwK7OPHxa1KnzEMy1BqObLkCJ6RI8eQ?=
 =?us-ascii?Q?Hi0OTytFZSE2z+FgeHYq8y3k+UqnAfAXKS238z7bYK7oUcaY+jRysR0OggFV?=
 =?us-ascii?Q?EVlTZ9/ksob/ElOW2fUdFnaKoq0Zy8++f72PKRIOAWc1iqHHNRu9NZMVnzE2?=
 =?us-ascii?Q?M+P1Qe6XAKMjWCdIti0s3uNhtmDl8Y/pV+wF++CJDKo1rhg3PAV9i0ije4sd?=
 =?us-ascii?Q?cixhdktiTlbF+kVuTGtpU+OEUZxfXNO8QqX/4H4j3s7Q4IjEuv4wEZhWR+46?=
 =?us-ascii?Q?G9cr3v9QgWU7q3m1ZkEO06Q9yLiKqOfDAgnP/V6atqpU3VQSISg9DD5oxUJe?=
 =?us-ascii?Q?uT/N9NU1gN50cxxcyZCbqUXeYKkIn7ygOtoEuI2r6mwLW9joP2ANs4O/VYpD?=
 =?us-ascii?Q?iiER9p14FuhOQyD/6ON6JR+Iz0HMoyQ+3k896RXbVGnqgE/Qq9nOBEQNz5CH?=
 =?us-ascii?Q?xTutXeLcYIVcoQpxdwPbTlVRD0/V23bCp8nz98gZGzj2Q1qP2kXsYnVD4iXH?=
 =?us-ascii?Q?FVPfO8n9KNpkifB5hGx/fMnfceRYabzs10p/nspLpTTtOeOfNs4/4Sl4vXnh?=
 =?us-ascii?Q?DEU35eSH/8TJAdHx7YZpN/eD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7125bba0-4687-47f0-3999-08d8e9521aa5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:51.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbWhuG8i007YZ/iXgH4xA3SZhFHFhT4dFKwne+AE1MXtir/fJYgVHdw0rd9F3f8wwtwRZs2H2MrLkSkQX04MypyZcL6bOZFmUA6gGPT3Jd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.128;
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

Old interfaces dropped, nobody directly calls
bdrv_child_set_perm_abort() and bdrv_child_set_perm_commit(), so we can
use personal state structure for the action and stop exploiting
BdrvChild structure. Also, drop "_safe" suffix which is redundant now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  5 ----
 block.c                   | 63 ++++++++++++++-------------------------
 2 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dd2de6bd1d..c823f5b1b3 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -813,11 +813,6 @@ struct BdrvChild {
      */
     uint64_t shared_perm;
 
-    /* backup of permissions during permission update procedure */
-    bool has_backup_perm;
-    uint64_t backup_perm;
-    uint64_t backup_shared_perm;
-
     /*
      * This link is frozen: the child can neither be replaced nor
      * detached from the parent.
diff --git a/block.c b/block.c
index 707a8a7f8c..b7cded9826 100644
--- a/block.c
+++ b/block.c
@@ -2101,59 +2101,40 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
     return g_slist_prepend(list, bs);
 }
 
-static void bdrv_child_set_perm_commit(void *opaque)
-{
-    BdrvChild *c = opaque;
-
-    c->has_backup_perm = false;
-}
+typedef struct BdrvChildSetPermState {
+    BdrvChild *child;
+    uint64_t old_perm;
+    uint64_t old_shared_perm;
+} BdrvChildSetPermState;
 
 static void bdrv_child_set_perm_abort(void *opaque)
 {
-    BdrvChild *c = opaque;
-    /*
-     * We may have child->has_backup_perm unset at this point, as in case of
-     * _check_ stage of permission update failure we may _check_ not the whole
-     * subtree.  Still, _abort_ is called on the whole subtree anyway.
-     */
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
+    BdrvChildSetPermState *s = opaque;
+
+    s->child->perm = s->old_perm;
+    s->child->shared_perm = s->old_shared_perm;
 }
 
 static TransactionActionDrv bdrv_child_set_pem_drv = {
     .abort = bdrv_child_set_perm_abort,
-    .commit = bdrv_child_set_perm_commit,
+    .clean = g_free,
 };
 
-/*
- * With tran=NULL needs to be followed by direct call to either
- * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
- *
- * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
- * instead.
- */
-static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
-                                     uint64_t shared, Transaction *tran)
+static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
+                                uint64_t shared, Transaction *tran)
 {
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same c twice during check_perm procedure
-     */
+    BdrvChildSetPermState *s = g_new(BdrvChildSetPermState, 1);
+
+    *s = (BdrvChildSetPermState) {
+        .child = c,
+        .old_perm = c->perm,
+        .old_shared_perm = c->shared_perm,
+    };
 
     c->perm = perm;
     c->shared_perm = shared;
 
-    if (tran) {
-        tran_add(tran, &bdrv_child_set_pem_drv, c);
-    }
+    tran_add(tran, &bdrv_child_set_pem_drv, s);
 }
 
 static void bdrv_drv_set_perm_commit(void *opaque)
@@ -2333,7 +2314,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
+        bdrv_child_set_perm(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
@@ -2432,7 +2413,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
-    bdrv_child_set_perm_safe(c, perm, shared, tran);
+    bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
 
-- 
2.29.2


