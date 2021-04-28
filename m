Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E94036DB2A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:23:27 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm2A-0008PI-MA
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxk-0005mr-HV; Wed, 28 Apr 2021 11:18:52 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxi-0001yK-5s; Wed, 28 Apr 2021 11:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZnmPNpUmEvk5qZYWGegZJiEE+o8iT7V8I7CAR72emzMmUDPbLOpoCLePV44RCE2//d4nCITxlAYS3N+tTMa1mNB5LBDkC4wNKZOrEr6LLbifp1q3F78emhMv5bwxlhiCt5Fldq719adEAChNj7fjhnSTb7ouZNVUYY4EshzQ4+SLtz0YXlX47qLTn6HIB1rXHuGH7x3SKczFtLUw36heSDrCS2rf9cL/V6/6exuIMRSYx6zVJrrjwM6DOMTeQlFJ6Nt0fdPQt9GOdiK5Xprs5NROu0d7pgNOWRcN4x74/JD8NZ85UvlgCBU4ILsJzemovgqY3PQ3kjRWblZETPTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbyITUVuwJ87BW9lZ1LfGdOE7xlaCRRV8Nn7wWjOdwQ=;
 b=E0gMxOgmsX8d8w0gSvt/OdfZXPz00t/dffiJTbi62tlrg8ZNAgtQBjQhF2tFagc4yx/4fa8UxtdWf9z/Yw6mfaZNYh0C2FWH9uJcpmrNG862AXF/6l5IbWkz00IUomyrtXAzjItcDSiAsmDImi+OMzYs3Mqj5o4wRjgdLYiqn1NDNdkLyU7CwG/STkgQ+w+5sBTdWyxZHVzm8F6/pn6iwbicqOPxzT01IA1Tf4Dfq5eTSQXTk26YyuGa9cE7EQ3n47T48BK643ZDI2bHxGkaS/vOI8+bI8ACsLwWvkcqAw9f/RAa66XskHRkKEKwE3j4V03trzSNfkosrsGH2Kn8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbyITUVuwJ87BW9lZ1LfGdOE7xlaCRRV8Nn7wWjOdwQ=;
 b=G1XliAplOMAPT/ztY4td8L/CFaYqMRBXcFE+0BinkeXhQHMTeN6cOH+EbCgWG3rdpy2Bu6ie/dvOs+g5KxZFZZ4J4azAM79dwEmHaCvCDCB9nRuge/WnMN9Zg1Kg6kKUxsQkuTHhOYZknkdfsvka1ILukTq1QrZ6g0S5a+XzWeo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 15/36] block: add bdrv_list_* permission update functions
Date: Wed, 28 Apr 2021 18:17:43 +0300
Message-Id: <20210428151804.439460-16-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1996a4f4-df6c-4277-ec11-08d90a58e6c5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61514B78BF7109F1B343AF7EC1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZVlviMMDLxbJEYsv7Khsz2Hv3SHWeNG7g0xfmJsXqiKwF+Mp8uOSoJYnAq7gXPF9qhihuJVaHfLxI4UPLFyKE08t5FsKlIouIqVm5kfw7MGkVZcZ6vHQk+FiFzAsDZEzc5LlMXWbPxQXoAItyXTYdWNluq/YelihAZwaBQ3Fu9Sb7RZnC2i6KdgKC5sJv7hWaSmEJjo+c44Zvemc0uvtRB6dlinh9M3dmyD9x7avLQUI2il8MYd3Yy5KXMtxMT3MKPTSKU1FLEWQZeKDWAWHOXpMZvNFri/c/eg8u3vec8f98WOc6OY+4wlcfriODVufvP6w+8wAm7L30gWzJ6m0yZ3nRPMV/OwAeFr/aSzVRRVnS/hDXfpvR5nbm+tcUljLiCn8lbdu9w29CY37JUjwb2UVbKLiTwIXnqa+QLOLDJZgzQXyqF6oRPqrAa1QlhYsd8npbqNODj2xTB6SbK95yamB9NwVt0miHIAWhInt0eXos4r6MB6esbprF1oFeXckt3x/HIYF5i0Zl+5oIDhIsi7rUibI89CyP3xdZPd6blOrObejLKEdoPnI0c46cc9QVuAY4jtmOXBFdee3A5gbkLcC4IVLrGl0ZsCdZtKDW7cnJNht9gg9gFpPc70KrRYTHqQ8gQUMikclVj6d/PQ6vPre/4wSSJSo/VwvgsNkg73w3oC/wOeXIkkbzZps88M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(15650500001)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oDb4+dijJdZjd0kHX15e9Eob/9R6V1vrbQ/4d/nBLsEJVZObLfRcjypVh3m9?=
 =?us-ascii?Q?xQr/EqZvPZsiusTs8wqptJC3Ydx+vNU8lp9mduHKnJs0JbKDlbG76CuLNzw8?=
 =?us-ascii?Q?JSLpf7/LKjLsmv9lEQI02eXIrxpsZGuPZbyO6fnVpGaXvh+74kQyXXchO6zX?=
 =?us-ascii?Q?o2PaOgunCxBY3vnGWPOOuRt8rnwnPuHa6wggBuQwGt3rvRxdTxkF6HY93SXt?=
 =?us-ascii?Q?iK0hP1x1F+hTXL7n0QRAOArTpf9y1s33xrFD/Ufma07ezJLAqdOttpZVYX9j?=
 =?us-ascii?Q?sLZRwfcSHxYuFRQQtPmLL4K8IBQ3xN0Pd9FQD8Tir8DiAK/kD0jeE3H/8kxy?=
 =?us-ascii?Q?VDkIL/hUDf7gPoGgoU1suOL5otm1JdWPHXldDGJMgjo0YIypAkAYxxAk6AXc?=
 =?us-ascii?Q?h1sHSEbc0lW46uFSObZqdQwdu0NiB8/AnxVTXwwAz/J222M3w0sjK4NMoli5?=
 =?us-ascii?Q?Cmc2LCFGsg3m3Fnl0ErJ8SJvsGS75jx3QBmgF/EkNfnGZcimOmxvLTNGtrhD?=
 =?us-ascii?Q?CuGOQk4Mp8o8T/vWzhWEKi2HyV+HN39NhVKjp0LWwrp3KZenkek22CvWiEKP?=
 =?us-ascii?Q?oBcnq/PA41mafRm/ZKcm/eSLuu+F9bp8BE+LYfweW8mNk5Lwb2s996NmHc2v?=
 =?us-ascii?Q?2u5b7B438UhvxUJ3OXbfaiTvEvvjrk0avsS5pEUU7uQsZ0+pKXo1KkAQIEtp?=
 =?us-ascii?Q?SuTGe1yhU/sU+BkLjrKTegYTvsJKl5f2FNwGiy7WR0WeeiWP2MOcaO3slj7u?=
 =?us-ascii?Q?GScc9xZp+IB0EGb8/ihnrcLsjscuZ3XcNQ5Mj78HvzC/3a4kSX5ORW7VW3sZ?=
 =?us-ascii?Q?CxnHzA9WGTcFPGTCFLxsuS86fWCxxELMXCDWN0c7zzyv8BAH3tNwEwE68rX/?=
 =?us-ascii?Q?RT2ttI+MhOeT+ywj0kbRa3ukQiQ3gttsweln8bsEd6JxfoBBNnYZxHQITy0q?=
 =?us-ascii?Q?yYaCn8yKhjlLvzXG6LWvWhtOL2lWJRKKWDHSKJhGjKafbggGlM2JnUAatYYb?=
 =?us-ascii?Q?O9Nd4m9wAJobHQCv6rwhjtj8Bu9vjT3dDYKHTDqIKLyqOnGrQKn8KbdM/zG/?=
 =?us-ascii?Q?ph8JvIJYpNaJ9CH658pogvjAythPkaOFSLipFky7+0YU9E5uJ1ZXtUIDakMp?=
 =?us-ascii?Q?qw5yvlkBByy1oXFFZCYnklHeozgwatxcP80gKIzcaPxz80XHKzPGI+pV2+nH?=
 =?us-ascii?Q?CBFc4BAvKpXqqc40oAtcDx8mmP8K0ASCgAAkS6OQ0eXyQrO5qsMMHnl7NKcU?=
 =?us-ascii?Q?cdsDifIhjh6184jzidYJaXkUbYSxaeCMbIfsSV8Aaz+DLRO1beHlp0zHJs/I?=
 =?us-ascii?Q?PPnLJW8fMAnHbqdrgArB77pO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1996a4f4-df6c-4277-ec11-08d90a58e6c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:39.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf7JiNFmsZH/XPW/RI1xj6hjP2WfPhtbx6qlNNJn74xjNrF+3vAJ4sOuDMGPdvokQKqEn8CSWjuqQ6/Hc6Yco0NZyn02Yao4jw8WOqBB3rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Add new interface, allowing use of existing node list. It will be used
to fix bdrv_replace_node() in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 106 +++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index ab7a4d13d8..98b7bc179c 100644
--- a/block.c
+++ b/block.c
@@ -2249,7 +2249,8 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children, Error **errp)
+                                GSList *ignore_children,
+                                Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2297,7 +2298,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, tran,
                             errp);
     if (ret < 0) {
         return ret;
@@ -2316,36 +2317,53 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+/*
+ * If use_cumulative_perms is true, use cumulative_perms and
+ * cumulative_shared_perms for first element of the list. Otherwise just refresh
+ * all permissions.
+ */
+static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
+                                  bool use_cumulative_perms,
+                                  uint64_t cumulative_perms,
+                                  uint64_t cumulative_shared_perms,
+                                  GSList *ignore_children,
+                                  Transaction *tran, Error **errp)
 {
     int ret;
-    BlockDriverState *root = bs;
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
+    BlockDriverState *bs;
 
-    for ( ; list; list = list->next) {
+    if (use_cumulative_perms) {
         bs = list->data;
 
-        if (bs != root) {
-            if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
-                return -EINVAL;
-            }
+        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
+                                   cumulative_shared_perms,
+                                   ignore_children, tran, errp);
+        if (ret < 0) {
+            return ret;
+        }
 
-            bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                     &cumulative_shared_perms);
+        list = list->next;
+    }
+
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+            return -EINVAL;
         }
 
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, errp);
+                                   ignore_children, tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2354,6 +2372,23 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
+static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                           uint64_t cumulative_perms,
+                           uint64_t cumulative_shared_perms,
+                           GSList *ignore_children, Error **errp)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_check_perm_common(list, q, true, cumulative_perms,
+                                  cumulative_shared_perms, ignore_children,
+                                  NULL, errp);
+}
+
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+}
+
 /*
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
@@ -2375,15 +2410,19 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
     }
 }
 
-static void bdrv_abort_perm_update(BlockDriverState *bs)
+static void bdrv_list_abort_perm_update(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_abort_perm_update((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_abort_perm_update(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_abort_perm_update(list);
+}
+
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2407,15 +2446,19 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs)
+static void bdrv_list_set_perm(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_set_perm((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_set_perm(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_set_perm(list);
+}
+
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2523,20 +2566,13 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-    uint64_t perm, shared_perm;
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
-    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
-        return -EPERM;
-    }
-    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(bs);
-        return ret;
-    }
-    bdrv_set_perm(bs);
+    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    tran_finalize(tran, ret);
 
-    return 0;
+    return ret;
 }
 
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
-- 
2.29.2


