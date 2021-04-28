Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EB36DC31
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:44:53 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmMu-0003RB-Fu
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyP-0005t7-Nm; Wed, 28 Apr 2021 11:19:33 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbly5-0001yK-4g; Wed, 28 Apr 2021 11:19:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUM3a4MIqTgUBr2rkYVKIiH+vju2YKOfnBQ2gMxepNF9iVljk37vR8aiMLYfjKyq1obi0u5ik3jZvlLP6UZ78aol1Zlnbe9GsTxGacIRb5qm6YRXSoBfFk29Dbid7vEr7Janb61pIOb9wPU2KjNIO8dNbS2nm9YSvakT7KrLwZkH7gDwZj40NztpX5yqo0ggRRB5gVzcxX+CjV64hN90seg03xj/Y5A9JcxVqImiSw8Y1TBZ1ocdQE4LxjLs8gMrWVUMpdJcbbIRY5TXJF5Lb/XelU4H9QUh6cmTkz45ww9OObTQGJXADg8Cc93TNISEFBhiBKFD+oxQiTRilPpUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsHmWo3F0UdqxtzaO97RkxUrfH3slXbquvVxC86SmdM=;
 b=GrhT3ZxssHTgxtI6FzhT7EzqxVxOORCkkN6932+lwpUQz3DEw3aervVnyO4xoDdOcrkTl4gAUTfqvDnyLk2StlL/XqEt1dRfroNDZcQK1aOI4aWXe/T7R2X5s9BDpy4/4FEjPVZh8cqi/K5N8o3XF7DvVZuLDxAuFBN+MveTFw5XGuTkP89cT+ZktUcQGq9uKLUvsG2BzonwbP8X7ICqQZKjprX0hiYSMkNaxx8hrb1P/3I7pRV8ISE0QOkTeTbE/RpJ+KCiKnQzgdL0c1+ehn5jzjJbvXJtiyLWSDdbzXXkaNdsrXn3Aqeu+cNjmBRA4/2UYP58JjU7OV8QNUV4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsHmWo3F0UdqxtzaO97RkxUrfH3slXbquvVxC86SmdM=;
 b=LBxU6+UDBo/OrkFOY9jUs1U17IbKRky0qrJXNXgXeR5d+YAW7X6ao6exI5j1XDLFENKxgUWCYXcU9beN3vVKQnvi9dhc398bQghM/LG+Hileye/r4vMV1eyWuW9wnZRgapWcPqCTJvu4pPp4WGqj7CTGv0+R5DQ4pOHTA4rKH6s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 20/36] block: split out bdrv_replace_node_noperm()
Date: Wed, 28 Apr 2021 18:17:48 +0300
Message-Id: <20210428151804.439460-21-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade0501c-835d-48df-eb1f-08d90a58ea0b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151D440F60158CF6034BE0FC1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rrLHrbvvorXuKreDIkxpvvHFyxVJBuftRgSpWD3Hvi2zGLYwmY2f5rD8/GLBN3XoU0oRtDA5nrwQXnzUnyZKIVqRKxr/bF+H0RtHReHAU7szpSaIqnarrNWZD14qrt58WTfS1X1hQxpZWOPGAKippgzpshL4Yzj9nuIugcW/n/f58p9zD5rDuYp5vDXJ9CTb57oDnhpBN6TChHdxjRUAa9KQdCPwiWuM5vpuhUnERxQw+IdDtO054GYPuGj73JZxdzcnoOpoNKAoxq3i7iLAC72j2zReCSKJd+6YoZm/2bKTjQ+tqL+hWpIAxeOl+BbgGYGaLTeOruZGp/n91pRz89xPNsPWJ5PPy9ll9/y0MuHwedFBq68t+XMWeNgsgD5qbG3HxjUv27zt5I5x6VhAup0rBTipRooeq22YHgGzs3Ff32E2PazyhsmXao9ZH552QOX9n7rki7zmfT9/wl0k8nQOm2MLZySTn0EgwiiOp5BMLUMyN2SEKAUPgtWO96hyhkoIxCffUuzJ2OqmJ8S2OnCBZFXHCoGoQH8XuzNUhrFmIf4/Ixt5NMisDqMukxuUV3r5ck1P2rIM9JCD0LAze3MVv9pdq+kyeZJv6Y4JUtXB5FgIUizqmW5UJ3k+WVDgqLBG1qGVPXSsefbo9UNxUr3hAvXnyzVWnG1TRdTTIYbe6LecBvYJb0ttTs6Gg7g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bSnpOTudwRYerXQ640G4bg8pfUpExlSCQoSxOiLpMDhsCU3euJX8unNDi3ey?=
 =?us-ascii?Q?FYvzQO3o6xDoWLXEaziwg+9i1Gl9NVhrJu4uBtilYAfjyzHCheHEvQnH4+cT?=
 =?us-ascii?Q?bSr0pcTkwC8mULqB+Y4YPZLAahykJ8hU7FFy+RtMpBh1ZsZmoGvKexG3E+t2?=
 =?us-ascii?Q?Mx0XcLBvryM8EJXo2oAgCgbrfwvis4iyBXDqWZDy2xl4OOHpy+Qv7ykH5zgA?=
 =?us-ascii?Q?RsCs2c9M8r6PAeo58lmrS3R1b0mBy0YjhLQz53hj6wnR8UP3+c2kOoe5jR0i?=
 =?us-ascii?Q?LbRY0Jw8fEgiewZ/M2xf8BGyixQ6gh9+e1rX54Ds9rvWyfADCZAanZGcP5R1?=
 =?us-ascii?Q?EoyAS0rkU6ZuC1cauZfRnTCp08TeHSjcm0im6awHR7TBRqs036zv/We7em8N?=
 =?us-ascii?Q?MjnIuET30+pCGmwqeKzlycchf8v3oaKP5JALO9gwSj48xjTrO4aCOFKvNJJo?=
 =?us-ascii?Q?7D52i2Jf8eFz2ME733AQcHFzJBBpw+TMOiS6p6D+zHPGiWiTjfJ3xkpA2Rt2?=
 =?us-ascii?Q?S7Ds4urdzKBRqtHdLMs9gmG5SXZs2fy0sd3u3h3rGrHAA7OSSP6YQwI8THr4?=
 =?us-ascii?Q?Fy5c7H0Ofh5ySCfWLRB21XAonjDL0g4JFbn83M6RYCeWcFftRbNani27qzOU?=
 =?us-ascii?Q?3Ta925+rpIkw0BnJucjzYDBCqibhqw+P4nJGG+MMt78WAysaxQFd84xnH7RX?=
 =?us-ascii?Q?Un/LF/ApLUBdBUz3NPoMzBcxTLgXv22a7L3HUCYe496UC19wmnIg2k5T0yMF?=
 =?us-ascii?Q?N4xcxDvD5/h2lZZvCSvVxbBW2EiwCuPr4McBwQ5sb/SIyWGfYDTJ1/urAD8U?=
 =?us-ascii?Q?uI7/a8TnKbC7wUKUepv6YmKc1KNpv0tx7HM9EAfFHkKAC2xrFVAX+LfRJYZT?=
 =?us-ascii?Q?3tIsHLl0Z5q+gbuZgzMonhOpxL/MCk6w6xqpXdrLrLjbUK9Iob4poYiF6Bma?=
 =?us-ascii?Q?HPcuZeknP5dcSWJd63PyBGQ0gtNaIfaLAzON+5uE/lFpusOYsvyRcZi+BhD8?=
 =?us-ascii?Q?+5uBYk5sOBTXr0jEzw6/Oo6tun+CJMrMnA8coa4zlz67oMxr3MUNn+Ja6GMw?=
 =?us-ascii?Q?lelUs6iduOMX+n9frd9hIjfkgThQYH7DuqvqmojOEWRUQmV1hyKye80tkKap?=
 =?us-ascii?Q?LoNzqCH56wgHrPdk7VnMeGJ1l0IPbWhZVtyHQ6yzlzpzifhRZyDrS49P5c0g?=
 =?us-ascii?Q?A9gwUbnFVhaGvDjXXyKOnOCF9ZDa34JoKYkQW18izvzCXxgF5vN2OiOeleQ4?=
 =?us-ascii?Q?gKmvH/igj6weYmaq/gOIpBOQttQ4jbF2j8swoyli44YJnZP9poqdmUZkxlMC?=
 =?us-ascii?Q?7Io0oDN5cQBSNhEXKGn/8RVS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade0501c-835d-48df-eb1f-08d90a58ea0b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:45.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhJVaN8N6C5LeY8A8CtW493qVodvQu5cpZTicEeDVk0EgQyUqk7Kqg1wQiz3kn3Wm6UGrkJSKFWHuyuokYHUfgMVOO0R2ucU95qrz1AssdQ=
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Split part of bdrv_replace_node_common() to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index c74e6e7cc1..9283c8d97b 100644
--- a/block.c
+++ b/block.c
@@ -4991,6 +4991,34 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+static int bdrv_replace_node_noperm(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Transaction *tran,
+                                    Error **errp)
+{
+    BdrvChild *c, *next;
+
+    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
+        assert(c->bs == from);
+        if (!should_update_child(c, to)) {
+            if (auto_skip) {
+                continue;
+            }
+            error_setg(errp, "Should not change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EINVAL;
+        }
+        if (c->frozen) {
+            error_setg(errp, "Cannot change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EPERM;
+        }
+        bdrv_replace_child_safe(c, to, tran);
+    }
+
+    return 0;
+}
+
 /*
  * With auto_skip=true bdrv_replace_node_common skips updating from parents
  * if it creates a parent-child relation loop or if parent is block-job.
@@ -5002,7 +5030,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Error **errp)
 {
-    BdrvChild *c, *next;
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
@@ -5022,24 +5049,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
-        assert(c->bs == from);
-        if (!should_update_child(c, to)) {
-            if (auto_skip) {
-                continue;
-            }
-            ret = -EINVAL;
-            error_setg(errp, "Should not change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        if (c->frozen) {
-            ret = -EPERM;
-            error_setg(errp, "Cannot change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        bdrv_replace_child_safe(c, to, tran);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.29.2


