Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2336DC9B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:01:23 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmcr-0000Dd-DK
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyT-00060o-UD; Wed, 28 Apr 2021 11:19:37 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyQ-0001uH-1i; Wed, 28 Apr 2021 11:19:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs8CpNz0GG53KbBw5TGFcBDIfenJbYw58r8+g6G0bblHXeSLgFeQ3BxPtPCoBVj8F9RUiwO4Lj/RLDilbgG/h/1CX7IWqWTxvqPfYg8ZzH/escHSECNLSqj99MGaVjh4ypKlR4oZ6qCS68iNNJkWW8krf+al6kwxO/ftJW2bk1NvsXg4a8qZPN+jKubsAhdaJr1gEkgBH4BB5WxZ/RrH09IjzJce0G9mw5O6hJ6lXVsKXHXt1Q+6DcjzGrJ1DTD3iD6DMmgE0jBLZzEitkKi1+MF7euEOrbcCyHwUQZKFi3SEmk7sdQgUiuO+PdFa2+mh5okcMcxVNdSj6QOJTAEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSAF2JTxyz/yuE1Q8hvqdw1EIBZji12opwAi9KUDIxU=;
 b=UUh8Ova/bedh0SuXwOJm09HkjLYXm88lwWjmpeVSAazWHPh0PUGGdnSHOYnftjEDVWnY4ycWA44ZBxsg4qmuDwi80Yu4kXNnfMZMGEPHLZvPjcija/jzTl9OUGXo6tgGCssPf78CDYTSHAK9WoaitA+1oFr4Zi4fOQA0t6m88bdzMjCIFDxUHam2NXgX00Ppuj9o5xqkNnLXHCycGRdD7ceuPZiuqxI0TSVXqhX4m0uSWuAfdXYfME1rbDnuY/I02w7ahP4tgQ3wCLGsSiuOgOhvOAGj7Urrnuj9R7yuAqKWMOXvrTRZ1LiejZut6SYjcEX/RUON7QtWnX/854pI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSAF2JTxyz/yuE1Q8hvqdw1EIBZji12opwAi9KUDIxU=;
 b=piF98tMe6NyXCitqcY0m/jsKm3+qBBxMqsfi9X2lMN45LwOuMPUA2UTbh3EtmbmTCVr4M70/RZufraVXtQi36133apd0hJhCKMv0oE9mo/MQEwCJFEdZXSnZkYeNdK72Jla/Noj/TzbDt24/HUXAuS749ECN95/0afaDehRMx3U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 22/36] block: add bdrv_remove_filter_or_cow transaction
 action
Date: Wed, 28 Apr 2021 18:17:50 +0300
Message-Id: <20210428151804.439460-23-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64db106d-36a3-4b37-49dd-08d90a58eb79
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615163E5AD559D0927AF6441C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utA2zFhJ/BEWimRQBaw8L54WjJ5alTTY3a0IWx7yZWPAUVyiT2KZdk8+zT5PKQDNR2u2m///Q6fwJHNSIlg5xe/HrypChRXPoa55OVV5vxHsqJN8/xg2ASlkfbI+uHo9SeOpamAuAWvrf119P6xn5KHWvouBzilmREsxzcTe5c5xs/xFzvzMq9BAHnbpjewgJLsy8bxk10Hch+3bAkIbw8HISuqn6T/jQ90fq4o35plNE0RpNKq9JoTqD3rb6XgWDxW0cIXBy3KN9pW1z+0Lc7tVi28gbnm4PP3tI8xCEOe8flsBOBd1reEZ9teU4b4EqmHkuzO3hG0XaRVjUX5c+kH/FOXni7EBVIDq0R8hslHeOLaaXN6GuC8yxqAGPHRDiJEqwqe7zahW7yk/Nv24VVdoHTaTgD1nCpyTjCn8Rfy9TEOmTndBzCKHKKDbcDBsutZBdvcdAeU5fR+YcwdSo/cxFth34LqaTbEsUfapTgplGxQeG9Z7DNQSPkr4G7cgg85JpNlFVlKnV98gJAAZH7XkT+503UHL7zFc+6bd5b6jf98Qis97oQ33Cy4+FRM6ijhKbKbUHKMdOEt+IS4Ad5WdyfEMfijM3g/G1D2YCqzx4YyMQEajzUDMyCmrjk6lj9qdTVjoS0oJ4PkZM3Lpv0D2fraS+3FCzl8yyrEHbYW2iyA1FMNBUW4KS1pJ1Lim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oBJ9FfJLuAN9kG99RRK2oYgdqDky3rgdoVtizYlzErjrGh88614BKw0Pxmag?=
 =?us-ascii?Q?1v6AFOKwfThir7x4RYZQ1J315PGBcfoH5wD2rY25J5fwllIFW5BaWUjmV3yj?=
 =?us-ascii?Q?jC3n5eqGiMONDjxcKJaFH+KvOfN5prFGOLrumsc07uJELFoRtc4W0OfAHV39?=
 =?us-ascii?Q?3Cb1u5f5i4UhhVhoWPJQeEkGttHIZdAOdAJIRSkJg+B/RK5enlYIeEg/zekI?=
 =?us-ascii?Q?NIWg3NGmBJ66PQlm/ndGuLEPHRxFjN0Zj5qcLgbooEbhn3jeJqp6y4fnxD/T?=
 =?us-ascii?Q?baEtu45YN0AM0f+iTUZQUE4PLsMVOxothnIbxEpxxT8BIdjv50RC7996rE5x?=
 =?us-ascii?Q?9rYd5i2jNQJCTJwgTqRADMlX0/ktYlsZf7Bzm6ZxIdvBdfu9OLaDzjK0DxId?=
 =?us-ascii?Q?ZlYVDf5UlYXzbhavrLiLR6Vhw3+k70/OkZw1hfahwDxFOj5dROdgZ3/l1Aek?=
 =?us-ascii?Q?WQNMvLvZ8hYo16XzTiQvB5I5KVXWdwCPTDRxjOCUFhzWWlkM51l/tTZp8tKw?=
 =?us-ascii?Q?oaIiysxHTQQW5nc8x9Q28kvL2gSIqljziJuO1tu9Wlb33T1wV/ev3fYHpo4w?=
 =?us-ascii?Q?Yc9yEy8Esp0cqhRt48/B755ndRq/Co1IZYFsdIly06iG4cK+tgVhbAbjVLdu?=
 =?us-ascii?Q?ri9t2xYJloKV3dJ38AlgcLd48cvQyIzcDD2fQjl2+7P++wQGr7LZJhps8cPx?=
 =?us-ascii?Q?DtidCt+zNqX1rm/2LBYcHZRPqZaWI7yD06M3OvOV/yGrOprLITL1ALvPIEuO?=
 =?us-ascii?Q?E4+pjyuX0WaMFCQpr8nhMn3EqrS03/S2B7xezPgat9k4awuK2HSgfRDYTOig?=
 =?us-ascii?Q?pZBPqZINyj0vkReVExm15YzIlXpjFQbpPvHICX8YyHjClzRpQKv7lCH3U2fu?=
 =?us-ascii?Q?3prhtsNPEmor8kJ78ZuMcJeTVr6NsUZ3AKFKfYHtj8l3tMshs4n9+RG1sV6Z?=
 =?us-ascii?Q?bg2n2+tPj1ZOrBKQZ7ZgRY3a0fAg37V9mktGLM5Qgdn3Jl14/YR/y9/B7QNe?=
 =?us-ascii?Q?Wdlh1yFZ5VC3Yk/At+haOxsaX8KGlHNJUVfdtCoAkWypDEsZHLVC5jIh687O?=
 =?us-ascii?Q?xgMNHsYN1i4eeJlIYw5wLn14BSEKfKdJeAPHhyS/GA//ZJ2C1fbmO6xM/7qO?=
 =?us-ascii?Q?OuQsH59xYKlr+y8eBkGm/QgvH5En6a5AiajHYdzhqBimli/XQZ5JtrRloa3O?=
 =?us-ascii?Q?kcDSKw81XHBjFUQHtHU2vZsueYbJwK7uKcRvl0Pr40xsQwnP9Pad7I9T/4SF?=
 =?us-ascii?Q?cNQUmjW4YGFnPqdiFZWkNDsMVjrmNw/Ew5HaoguqBC8w7QzvHd7b4YZ6e9Bw?=
 =?us-ascii?Q?GpY3C8SYS4VhqRcyp9w1Fr3P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64db106d-36a3-4b37-49dd-08d90a58eb79
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:47.5193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dch2x7xdoTdRBEoZdgWvIA8RPIpN8vn9P4tC24E9p55Q6JtGnD56n4q5T+CBuE19A6sXm4wtYRInzhUaJGQjBUjFd/Y7WK4KU4BTkxMRyB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.3.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5bb6a2bef9..2ea9cc110d 100644
--- a/block.c
+++ b/block.c
@@ -2963,12 +2963,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
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
@@ -4991,6 +4998,79 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+typedef struct BdrvRemoveFilterOrCowChild {
+    BdrvChild *child;
+    bool is_backing;
+} BdrvRemoveFilterOrCowChild;
+
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
+
+    /*
+     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * because that function is transactionable and it registered own completion
+     * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
+     * called automatically.
+     */
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


