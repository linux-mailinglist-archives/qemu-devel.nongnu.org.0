Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41F3DDFC8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:03:33 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdDo-0000u5-DF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5c-0003I8-Lf; Mon, 02 Aug 2021 14:55:04 -0400
Received: from mail-he1eur04on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::709]:64771
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5a-0001rV-CB; Mon, 02 Aug 2021 14:55:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oICEjIL8fXcsHzHHgl0z0oQfcvmN6XrtBkD3Krkt+LxW0T0kG4Z3fFY/r2Kh1TEhWj79bUa0Znies7Fn7/KaLSmllCALa6jCh4bPEPXNdPs2nHME5BgIv+eBxPbBJo302gBHZW2gSdUMsADg3eAdwc4ixbg/GE6YV/ElGZ3rAFTIStdiKIrlbzwvaXzGTHuuLMX/noqc6GhLp0zf0Rfau3/1TFZMTi78NjqtKZqwItcPfafYynbrxyEZc4IP7Sr06Tfvwavk00pLFajRCm5hwhd/Ki34yTilr32f1c8zDx1Balzz9q2/41+vSEDBSzoWjotRwf6qHEvyS2oHhVwqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0hKrwwPg2w6N3LHbV3rmwn+cqjVTFqeB00+Z8lsTL8=;
 b=SkiMujmzZDXoLFmXC1CVj5Byktd0CUJLMJhbum6BWa31b9qdAR+OwXg9E2zRdJHmV2HYM/BCqVtBsb3AZBWhB90HpVT+wPEgxbDZtZoiFDkM1nj0OrgMr+hckthzqNfELt/XuW64vZJynYliyTFgexlrDAAfpMfNe+Le3mBlyzr/Kn8/M+pxmNe1alf6V8tNGHMyAzVjFwL9EWADZsXl2UZBzEWG2GajJh/3ysCglttzWh0fYgXTPvnRXFpQy53iZsjwJBiLFy+0brZMqAhgETst5V0TSiafcim1v+kTKGryk1UWgbtkWy54vEQb09Lj1Ww/FwOXYjqq9ITOP3Q8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0hKrwwPg2w6N3LHbV3rmwn+cqjVTFqeB00+Z8lsTL8=;
 b=u3C0gkq2KZ0n5jiS7ZY/Ucav1NhGi6deyCBWd1gunALX84trzPDMJplQ4V1Iv6cmr3XfHPHj+TpzFWpfEbAfNkH3BXkS4jdGdl8YtVD9SqzOtq+ADtqYjjPWACKEitKlDaS6Z9+ZbJjwL0NaRpOKzedR/Zwf3ODK4nOTtUf/MGQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 18:54:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 8/8] qapi: add blockdev-replace command
Date: Mon,  2 Aug 2021 21:54:16 +0300
Message-Id: <20210802185416.50877-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 744c51ee-23db-4818-ebc9-08d955e7010e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB427820ADDA89E5EC84219A53C1EF9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liuBp3cPwGarTRKSf+7WxYnt0MUTuCbY/QFz2xtXrfRMblWRWbjmtEj0dlZwVRPhMps6Sa33gcR/ySaxX7SXbf08XHE9Ff8s7TqnBYpTVn4JuZjQDtmlTieSp/Tw5OK05Sjt9cXZxsoS040pD6D6sbdbDQ0oduhq2YibRLNF6nptKKAJ/XbbSiEYy3M1vVWryKooiEIIO52s7otlgk+5/s+4Cfs/ump2+dbVIpfQfrSxWddlO1t2iiojQH55ep2DHvWHeR7BfXYfN9bMWR2yR97dDGCXGg6tPHcm3EfbMk9jFW+H/B81vU9BtG37Y5+wVrMkj1LQ5AdpUIPrYAoIh6gPuWvlNTC0W6Z/1WhurUkgu+nrSPe0/RZUZV3vkAfGdSoil+SsnWFh+Vdkavvm/pVu7SHaFzi0CYGvlHr+jileaAPBgxm9Owbx92BvhSC/tf0E8o2T5B4aSl/0oPTf2sgDRCYplYr3JRzWnB/peC5GnqwAsi+9jaKm9U54MAyxDO3zKw96VZwQpiu4gCMvBHxMP/5sCArESIegieLnlWT/FT/1G0gOTuCH5JGTsZG6FTx7NTG3iku7seHYBwURdufmhfoqTjLVcidznHa+MElhdw/UX8UUidhWX1vidz0lE4RKnP15W8U+gae//P57Zjc/lswewW+/lp2Y+9X4cIqa9XOJEkIuyIpE1VK/ygkSwsDsejDB4Kr76Vowh43Pow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(186003)(6916009)(52116002)(1076003)(83380400001)(8676002)(6512007)(38350700002)(38100700002)(2906002)(7416002)(6506007)(2616005)(478600001)(6666004)(36756003)(5660300002)(8936002)(956004)(4326008)(86362001)(26005)(316002)(6486002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hQstUbTND79yJQIZCvORcxT2qptP8pWqdtshlzYFsUjerFVuVPNX7Rq3ssJH?=
 =?us-ascii?Q?IaiB1DhsYRQuY0t5bJUgGteeSNjyvKamPOOz06bUNtYPsXzeH88WVuvnVWr4?=
 =?us-ascii?Q?I3KmjUZ0/0rQQmcdfw2NfAKMXgmhdraGGbKhQzHb4TnZHjydFaci88dIdtSu?=
 =?us-ascii?Q?lXD0VngJBa+u24bs3OZoc2Z+BenbLaqQzjND5eErZwhhiSqvYIDPUDuT3md6?=
 =?us-ascii?Q?AIm6QmbOM4/6lBicwP4jgPxOBjbgtfc5EFYKBdC9kQpsZOl5+SPUt0NM83Ey?=
 =?us-ascii?Q?LHSgnXJY6/QjuIsJ0EiIJTuWXZ1lC1J7BN3L4tj/9PvJ3cWpn8y8X3LXVpO+?=
 =?us-ascii?Q?eH4G+j2KhGdqAGm05F7u26cyUk8hh/LXBwju+ZSX3CQ0OrurGWcgEDHxQf2T?=
 =?us-ascii?Q?K7DoHmmw27uMqhAPlwAFaIJervYZNLsd5NHOSBlJTke6ILk++tsehkTzPCv1?=
 =?us-ascii?Q?dcScSqTV+gVjgYaBXuBF7PMono5KfjrXdIjo0yTeMnW1MEOzY19WKkRLzAXP?=
 =?us-ascii?Q?XAxlImcdCuSoGU8tpsGMb4JZo9E0s3++OZHijuXneSA1D0rB5Zp/n0wdAbgv?=
 =?us-ascii?Q?jjsojBwT4lbbLNiD3Znu0+ZGEvjky/F9DM5oyQuInwvJkZZsmZDC1pfv2dDP?=
 =?us-ascii?Q?cW65J8dpZ0vLxJfZG9Fay+3ftk92lOqTHuw1WlFY48m980NPZqn5YREBfUCq?=
 =?us-ascii?Q?LRG3CkXngCLmr4B7Nn2zTg/FX8DYWmjKbmHRkEAlhAZSV4928gnLExk5PP0u?=
 =?us-ascii?Q?pb0ruSByv1yPG2sm5LXNBDSFPQESmNTTqMfcOiHONP836aptdqq8BP46KOnH?=
 =?us-ascii?Q?Ic/Gsfj7/cAIkYCYYGi5QNgyuKf7vd/BORbcw3wGkTgGhjrcG6iPRVCAdx4V?=
 =?us-ascii?Q?l1y7wYuwOJeebfs5fHw2kcRtGcH+EfUFk1Xiuq6iviomKYscH9tVKmsxojGp?=
 =?us-ascii?Q?tqU65s9ZF63KUKttq7v76VwtkQnFKRsaIzcRnE0R5sGC306loqHU4chDifiF?=
 =?us-ascii?Q?cNN9i5zv9r7iHgtpbekbVK7aZn8lI4zfXYnD/Uo7LB219spE6QzOnYM1ecT8?=
 =?us-ascii?Q?Yj6nshCbSLYLCdvCqsyFMcskMWmFMOtMDsey3QyGKEAhDIK/zUPnFTWO8FTT?=
 =?us-ascii?Q?/AKAqOtwOoDOg4410/O4gRCzRHSUvTwdNZMaiGljgs3Q5zvCK1DqHz/4J5+M?=
 =?us-ascii?Q?9pDBFWrGsHxviL4Oy3McjxRfQvuYM1ACO6M6I13E01a8USEKUt1GOnjnrFNX?=
 =?us-ascii?Q?l9tfj8d5c5JVoq+EtYeP+v4qs9DPrAPyP8JjoJrLRT3TuC9mSjShW/e7C9gM?=
 =?us-ascii?Q?7VxqWalCpJhdbarjKWp50TdQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744c51ee-23db-4818-ebc9-08d955e7010e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:49.4850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mhfll8Q729NFmwyxYFb8TErY1chtBJO6cbPLtp+LV/kucs0PgGH3Mpg2stTZ7yfRhXWn+XrTg51wy1cNvoh9UwCIoDkT++0Cm5hm5+P2KlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe0d::709;
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

Add command that can add and remove filters.

Key points of functionality:

What the command does is simply replace some BdrvChild.bs by some other
nodes. The tricky thing is selecting there BdrvChild objects.
To be able to select any kind of BdrvChild we use a generic parent_id,
which may be a node-name, or qdev id or block export id. In future we
may support block jobs.

Any kind of ambiguity leads to error. If we have both device named
device0 and block export named device0 and they both point to same BDS,
user can't replace root child of one of these parents. So, to be able
to do replacements, user should avoid duplicating names in different
parent namespaces.

So, command allows to replace any single child in the graph.

On the other hand we want to realize a kind of bdrv_replace_node(),
which works well when we want to replace all parents of some node. For
this kind of task @parents-mode argument implemented.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
 block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 675d8265eb..8059b96341 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5433,3 +5433,81 @@
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo' }
+
+##
+# @BlockdevReplaceParentsMode:
+#
+# Alternative (to directly set @parent) way to chose parents in
+# @blockdev-replace
+#
+# @exactly-one: Exactly one parent should match a condition, otherwise
+#               @blockdev-replace fails.
+#
+# @all: All matching parents are taken into account. If replacing lead
+#       to loops in block graph, @blockdev-replace fails.
+#
+# @auto: Same as @all, but automatically skip replacing parents if it
+#        leads to loops in block graph.
+#
+# Since: 6.2
+##
+{ 'enum': 'BlockdevReplaceParentsMode',
+  'data': ['exactly-one', 'all', 'auto'] }
+
+##
+# @BlockdevReplace:
+#
+# Declaration of one replacement.
+#
+# @parent: id of parent. It may be qdev or block export or simple
+#          node-name. If id is ambiguous (for example node-name of
+#          some BDS equals to block export name), blockdev-replace
+#          fails. If not specified, blockdev-replace goes through
+#          @parents-mode scenario, see below. Note, that @parent and
+#          @parents-mode can't be specified simultaneously.
+#          If @parent is specified, only one edge is selected. If
+#          several edges match the condition, blockdev-replace fails.
+#
+# @edge: name of the child. If omitted, any child name matches.
+#
+# @child: node-name of the child. If omitted, any child matches.
+#         Must be present if @parent is not specified.
+#
+# @parents-mode: declares how to select edge (or edges) when @parent
+#                is omitted. Default is 'one'.
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Change root node of some device.
+#
+# Note, that @edge name is omitted, as
+# devices always has only one child. As well, no need in specifying
+# old @child.
+#
+# -> { "parent": "device0", "new-child": "some-node-name" }
+#
+# 2. Insert copy-before-write filter.
+#
+# Assume, after blockdev-add we have block-node 'source', with several
+# writing parents and one copy-before-write 'filter' parent. And we want
+# to actually insert the filter. We do:
+#
+# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
+#
+# All parents of source would be switched to 'filter' node, except for
+# 'filter' node itself (otherwise, it will make a loop in block-graph).
+##
+{ 'struct': 'BlockdevReplace',
+  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
+            '*parents-mode': 'BlockdevReplaceParentsMode',
+            'new-child': 'str' } }
+
+##
+# @blockdev-replace:
+#
+# Do one or several replacements transactionally.
+##
+{ 'command': 'blockdev-replace',
+  'data': { 'replacements': ['BlockdevReplace'] } }
diff --git a/block.c b/block.c
index ae8c8c4032..3bcb3152f1 100644
--- a/block.c
+++ b/block.c
@@ -41,6 +41,7 @@
 #include "qapi/qmp/qnull.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qobject-output-visitor.h"
+#include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "sysemu/block-backend.h"
 #include "qemu/notify.h"
@@ -7717,6 +7718,87 @@ BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
     return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
 }
 
+void qmp_blockdev_replace(BlockdevReplaceList *list, Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    g_autoptr(GSList) touched_list = NULL;
+    GSList *x;
+
+    for ( ; list; list = list->next) {
+        BlockdevReplace *repl = list->value;
+        BlockDriverState *child_bs = NULL, *new_child_bs;
+        BlockdevReplaceParentsMode mode;
+        BdrvChild *child;
+
+        if (repl->has_child) {
+            child_bs = bdrv_find_node(repl->child);
+            if (!child_bs) {
+                error_setg(errp, "Node '%s' not found", repl->child);
+                goto fail;
+            }
+        }
+
+        new_child_bs = bdrv_find_node(repl->new_child);
+        if (!new_child_bs) {
+            error_setg(errp, "Node '%s' not found", repl->new_child);
+            goto fail;
+        }
+
+        if (repl->has_parent) {
+            if (repl->has_parents_mode) {
+                error_setg(errp, "parent and parents-mode field must "
+                           "not be set simultaneously.");
+                goto fail;
+            }
+
+            child = block_find_child(repl->parent, repl->edge, child_bs, errp);
+            if (!child) {
+                goto fail;
+            }
+
+            touched_list = g_slist_prepend(touched_list, child->bs);
+            touched_list = g_slist_prepend(touched_list, new_child_bs);
+            bdrv_replace_child_tran(child, new_child_bs, tran);
+            continue;
+        }
+
+        if (!repl->has_child) {
+            error_setg(errp, "At least one of parent and child fields "
+                       "should be specified.");
+            goto fail;
+        }
+
+        mode = repl->has_parents_mode ? repl->parents_mode :
+            BLOCKDEV_REPLACE_PARENTS_MODE_EXACTLY_ONE;
+
+        touched_list = g_slist_prepend(touched_list, child_bs);
+        touched_list = g_slist_prepend(touched_list, new_child_bs);
+        ret = bdrv_replace_node_noperm(child_bs, new_child_bs,
+            mode == BLOCKDEV_REPLACE_PARENTS_MODE_AUTO,
+            repl->edge,
+            mode == BLOCKDEV_REPLACE_PARENTS_MODE_EXACTLY_ONE,
+            tran, errp);
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
+    for (x = touched_list; x; x = x->next) {
+        refresh_list = bdrv_topological_dfs(refresh_list, found, x->data);
+    }
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+    return;
+
+fail:
+    tran_abort(tran);
+}
+
 static void block_c_init(void)
 {
     block_parent_class_register(&block_parent_bdrv);
-- 
2.29.2


