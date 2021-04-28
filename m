Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67536DC20
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:42:11 +0200 (CEST)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmKH-0000UG-IR
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyW-00066f-9h; Wed, 28 Apr 2021 11:19:40 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyT-0001yK-5x; Wed, 28 Apr 2021 11:19:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyOd5vWWCWt6LCEjE49fqZ3nPhBnqwESBzmyNrcbU+s/hBFjVWnCQqLEjNn7nFGD/BvWWa5XrWqvEF2AvkwpGa9BkVOMaHv67gU+43BI09fgLaW7oi1VaeTYuiv5AutzmD1PVxniMN2cc0fCEX6TqmZ5k3elrPKS5LtjVwzl8UYsL8ZGaSK5YGCBAV1YnGtbHt4K/nN1qw1NLxMnwJ8aZaZp4SDmbR8hTcXBFElBaAs0/IIoysUSdykkbWBBi1u09g9GRpCMZSPcwVper4T1mvNo8For2xHJtkATR5zmvK9qRF/fQYXDqAk9eW56vfOPrD0WzWvug3WKMX2kNUSOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl8sILmQH9AKM6ypd9qNtoATqX1oWCZ00FmgPSosNrE=;
 b=aPbbwXHAddk8qao89aCu1Bfl0KmCuioJAsvKrQzo6GhzKMS0vMXOB7dCFu+BGPmRv6iFPgCuRcKSIojp7PIp/fdc5xuHtYQBVM0oKErIYHW09eV0ndg1qdVoGyttkeaBX6IiZ0KOAqP56Elu4EeEUAj5j7L28zd0jpv2ihB2GgX2J8wd/ijxg9zM8fe+MXNRWkUlMnCkpLkXKIxkuzwu3CLSVTxCnXHI5V6vFZm/kFLTlecT61TNcrlT+aJTwcpqty4Ccf45vwvrc0dGfDYI+aZIaqCN1hXJAAi5ltGQVZbuPD70yZT+/iLTjavreiVHHKNNWnBQBKnPCLoo16d2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl8sILmQH9AKM6ypd9qNtoATqX1oWCZ00FmgPSosNrE=;
 b=GnAdobaFp2gEBTRPwGDyWug4VotIwLtaiKDe9qxE+Z5hqtAQxowFrerpbZ8rIABt9HRMRPguvA3R5kGbJi2kUlSj+vFF7iCoGm3dXZZKxw4k/fZnoHkohGXcPs0DVZJ09K9GNSTW2N7m93ktReEgnMw5fu1ElkvdKvgv0CEJ/x4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 23/36] block: introduce bdrv_drop_filter()
Date: Wed, 28 Apr 2021 18:17:51 +0300
Message-Id: <20210428151804.439460-24-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6cabb88-2098-4a7c-ab3e-08d90a58ec29
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615137041712FC1C05AA9926C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: grTn+HDLnbzrutHSWoRAtN0K+stP8knG2aY6xPD/YxUHP7Yv3yFvSEczpdAakxFrujKOZdgPcyv8V1+BwvfY3p6AWQzR8+kuRoK2Z0prre9BeRm6yWcVPu/LROgWvh49xRTruRfMh5Kz+xPh7BDuDmz6PZgDQ9FXNk6qIi8zRx5uXJ3qxDGtx6Pp1wUtZYF+FOS265mFch4AKT9wP9TzkkLi7VODuIVS9Hx2KFHu1vyL42zOM/dpUN1yOn+N7qobXsyltxqbZf59x7OktIRWo1KB6wA8YhHz0IsClebuB3AdSBn2uo6etJNwGdYo/8PZ2fpwUN3adI1pv1xZ/cQhPfXDhEv8w0JWu/5w5PehRQhVwkKoBBLuHQI7ws7V7SYOX4uQPx4e/QEVutOtlmP67lCN2oKnyVNEqRRr0O9y4L1wx4BiYfn6n2CF16yKRZqTkd4AYvbQBGqffsi2djZ1K+tewP7zeuSp9xu7MScr3uC0W8d3IqGy6qgx8beinDHziwhTZUCVnllMV7rhF5L5rfMJRyyg4P3q9cZiGYfVvR88OF4k6Acb4W0u/6LlAjP5Cbzf54UoEKixOdSfu7xLMvZcSlo5hu80SP9WRwESxrKyhfYQ3h22B933hvb+xITRH/wfdNtetHNoSoFwyUHqWVD3ls9tAqaYeZy/XRhfnyooCcmjAeLz9u1EBWoPiwsE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2n72g/EgLr/Lud41pDvQwc//KxD9eTpNzB6qF7KwPNLe61PPDXe2mFQA/s3g?=
 =?us-ascii?Q?dPKZqxHR3migDLVAR1NS5m94zHKviGpOeLKSOoO9g+BZ4Je0VJdE5F6Mu0iF?=
 =?us-ascii?Q?psk+CeV79+Hh9+rhLS3wi2i6hplBIn783zhTTsnUFE/uyU+Q/gYlpMNNchSu?=
 =?us-ascii?Q?rncqQmU9ikOpy+Y+sLcS74Q1syo29xFh9PW/alBo+Ry9L8TLhjG9GHA0u+XL?=
 =?us-ascii?Q?tU7V1ialc7ZC5cnJ88Ue1HuDbUkWo4oknzl0k1ogMfS515ZB/VxMtS1N9EWV?=
 =?us-ascii?Q?QOAfWK1mUwnqsu3kJDo2hvHaI/IWmiR1Mx2ZEhAR386sAY9GxRQfxtUW8gWx?=
 =?us-ascii?Q?dzY7putZF9gHf8yXf7q1vERpIABt9wNW/D8K6CnAX4EYBPVIV/sQhcr8CosE?=
 =?us-ascii?Q?ZvNJC8PI+HiECDqd4fChG/uLX3jrb1Rc/uomdNyhCeMmztxZcbCnskpDQoPG?=
 =?us-ascii?Q?obqCHQoR/Js1SPys7TRTbzqsIrgGMHlNx3tQrHEEk+k6Z+GX+GO9Abe5AuGB?=
 =?us-ascii?Q?tS4nQuPZfNQ4Yh0hdJWDoprQhFs0mDS4HEYgbh4J/nxHXw/muELLu6yRnifD?=
 =?us-ascii?Q?sxs3uzT2DP/RNuhuzzLFwsICxE2tFsPEromD2TvN7zQv6fEugnjzPHXM5AyC?=
 =?us-ascii?Q?Mp2XeYeqF0p1InX+ZjIiGF2PXVdP8OiezWkgwdR9PFOTuSGMFP5ecu61z7Xi?=
 =?us-ascii?Q?A5UmH3Un9EhIoXZ7zoi6FqZ+nT1b2RThFWmvQEthomWBvHJ8PFTyVxVhLD13?=
 =?us-ascii?Q?KOPSPL2n6tAdfNaqgWvKDidS40SI1ME1LBY/Uazvpb+fPFu9R8abKx+c4VOT?=
 =?us-ascii?Q?fbV64CQQLHmN1ZPpZhbtldrePHSFr15x1IBJtI7kDj2//uA8rQp+n7P9JUT/?=
 =?us-ascii?Q?sIAq98Miwf0Q9DSMv743ZMIY5sjHbMFa5ZhqW5Hzqil9M18DBASwV1RmGuwD?=
 =?us-ascii?Q?YjBeQ9klL7iGe8nJ2GSUzjRWXGtY8cytgBqIZe7Zfev+bOP7QhRiVGJsWkB5?=
 =?us-ascii?Q?MfXzHuO483QjUBFYpWHyVwYU+ka+eqHI8Jc/jpz1fHYD5acu92K4ZrSqDxs0?=
 =?us-ascii?Q?cSnGFtddXFVTbBU3gae9G8rnk0VxIQCFO4IBJYl7oFtXvb1eVUd+OylKrOM2?=
 =?us-ascii?Q?gJ81PgN09hwHun5fch5uZpRmaZm/X0CKvx61UMMWGIPrx3+X2fG7SxEnJ6bz?=
 =?us-ascii?Q?33Vh8XCVUaq2Q7jJwkN72JsrxdnU1fWoio9jLRT7NTfsezGumDnoTVrfTlUH?=
 =?us-ascii?Q?Ud2c/D6syZMp1DbQbhF6fxB4ePp607voEaacaTyurGGicGi4LRqdrg9C7lct?=
 =?us-ascii?Q?fOuP+aGBeMM4LJYDIUaz7uFm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cabb88-2098-4a7c-ab3e-08d90a58ec29
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:48.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPQ4P7e7iYqNZhIFVQKS9rtqT3LosrxEMsCW6tkVCnbN3dF68ryCPquDaFw49Piiif53tN6C66gbdVS39VKHs6W3MYicrh6VF1wHbCUszgo=
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

Using bdrv_replace_node() for removing filter is not good enough: it
keeps child reference of the filter, which may conflict with original
top node during permission update.

Instead let's create new interface, which will do all graph
modifications first and then update permissions.

Let's modify bdrv_replace_node_common(), allowing it additionally drop
backing chain child link pointing to new node. This is quite
appropriate for bdrv_drop_intermediate() and makes possible to add
new bdrv_drop_filter() as a simple wrapper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 43 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 16e496a5c4..85481a05c6 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -362,6 +362,7 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 2ea9cc110d..68dfd822dd 100644
--- a/block.c
+++ b/block.c
@@ -5041,7 +5041,6 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
  */
-__attribute__((unused))
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
@@ -5105,16 +5104,32 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
+ *
+ * With @detach_subchain=true @to must be in a backing chain of @from. In this
+ * case backing link of the cow-parent of @to is removed.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Error **errp)
+                                    bool auto_skip, bool detach_subchain,
+                                    Error **errp)
 {
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *to_cow_parent;
     int ret;
 
+    if (detach_subchain) {
+        assert(bdrv_chain_contains(from, to));
+        assert(from != to);
+        for (to_cow_parent = from;
+             bdrv_filter_or_cow_bs(to_cow_parent) != to;
+             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
+        {
+            ;
+        }
+    }
+
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
     bdrv_ref(from);
@@ -5134,6 +5149,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         goto out;
     }
 
+    if (detach_subchain) {
+        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+    }
+
     found = g_hash_table_new(NULL, NULL);
 
     refresh_list = bdrv_topological_dfs(refresh_list, found, to);
@@ -5158,7 +5177,13 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
-    return bdrv_replace_node_common(from, to, true, errp);
+    return bdrv_replace_node_common(from, to, true, false, errp);
+}
+
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
+                                    errp);
 }
 
 /*
@@ -5493,7 +5518,17 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         updated_children = g_slist_prepend(updated_children, c);
     }
 
-    bdrv_replace_node_common(top, base, false, &local_err);
+    /*
+     * It seems correct to pass detach_subchain=true here, but it triggers
+     * one more yet not fixed bug, when due to nested aio_poll loop we switch to
+     * another drained section, which modify the graph (for example, removing
+     * the child, which we keep in updated_children list). So, it's a TODO.
+     *
+     * Note, bug triggered if pass detach_subchain=true here and run
+     * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
+     * That's a FIXME.
+     */
+    bdrv_replace_node_common(top, base, false, false, &local_err);
     if (local_err) {
         error_report_err(local_err);
         goto exit;
-- 
2.29.2


