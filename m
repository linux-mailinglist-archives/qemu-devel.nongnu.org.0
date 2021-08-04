Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248073DFE63
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:51:09 +0200 (CEST)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDYK-0004Yw-5N
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMd-0004pl-KE; Wed, 04 Aug 2021 05:39:03 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMb-00062H-SD; Wed, 04 Aug 2021 05:39:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnYpIbpwu2umNn+WNUi9IwhEQugfST58K9pnarT1vRuK6+tMjFqOB+cuQPJE0s7EtSFWmJEcoLd2BBUnhlLahQSEqcwYbTJzcA8qxIiJOJ6BXDHz/c7XP6ThhyQpgM3D10hcW2MHI69BXYrmPH5Q+w+R0+fMfBcHq3g4FTqyF25kEv5pZO9qqiNH3vC77Nohb2OxFORv2FAfzdNLhadclrJFPhtsh/3yJGzGjbGHWHfhGKjngeMoJH3efDX7RpGCQ/2NaOFbOiOfb322l8kyuW1hZf9VGXV4hEZeU99jveV/S3EOcMkbZA+y8Ixu3yO50JzFmZeux3FM2s6xJqVlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=asPayjXL1nSOy5Mmijb6/OaE+cY6TWhZ3R6z+gcjEiz0UyFtDMriNEwJXDFQ6UH0dwZ5Fg1vLLBlF3W+g3PEW4wonZ1vqJrsMbp9L4Oa0HWXYaZoD16DOJqzbt1i8TDsD9aacF7p2FNt82briI9w2akrE+X78WRfOZmZx5+NYpIwY7FTfAp3CsxIE++XGy6VKIp6Oir8JqMnavD8Bfd8M9FJ9Pu66AlkDl51ibUqOAR8jhmyeKIiBbieT1BQVZTws0/AA9TRTyeYK5gqJ+QcNrJD2hokbnBFMwRfSwABLW1DC24MP4ZRMTw8eMYzK7kGWMBbq0LNLy1LjvmJfB9mOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=cqkskzpDPS5UmNLnLFkC0NRxO3/ZzMsCR3LFkX0qEinsL2SbTM+7Kyr0t7lZfFvG8C8w+8v6oMS+OIHFyQv9334fZfgoU6pImDDpPuWB9CrCH6pJE/wNkMcQMFTTQk0nKj5r1CRiOcis1+YIL1WxYWbG0S25JQ5tZb0+Mef2MdM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 13/33] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Wed,  4 Aug 2021 12:37:53 +0300
Message-Id: <20210804093813.20688-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0009b9-67e7-455e-1276-08d9572bacc7
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032DB65C6ED2D14EFB092D5C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BcZf3k/Nepkk8T/Ibu1rkL8dXMpwFAKoVv97kmeITARO3yD38TRMj/ZJPzgTVqcyEM1VKOlUjm7flbzh2jOi7ANNzg8V/7riFMnRMg3WHA5ozB6Z3qFlFxBFPk5ei4sLQlFEixoH6iuRPOngvzXnqpRz2fwAytRH3U7hEvMdd8gV9g2zFPuNPS1jFJqupvNS7M6DvXuTaCLtYuwCzhWZBd627vjNbDUo+nlWIYUaxmrvA+8EKcyHV5pzrFb0luIb8TcpX3PLUx3FP5Uan+94WpGVcj57CU/H5vGpdH+k1POuyLuJnEFHvvS7WFlFnQBWNARIosjQsdV0Wxtl0mj+Y+fCjxWQ6ZyKo1Thtq7j2NCXlxRUCaS0uzA8emaxbTilCACtfB+VKT731YefNWvJxTCpTUNQe4Hh8amFPy4e824kFQDpNTEcs0Vaot9O275MF+fws9FRMYGE5IqXG30ljP1AnC8eUdq0oJO/h9PRMathfFLxB6iyU6k3nILJA41oiY9EF3O626+tYN6qlXu3Rw3xS1y17bPaw7Wm8yFiVjmBu//TdhRT1IU6MYEuYaucpugbRr8+orgFl1QvcAdZiuFPs1g18R/qn1bXl3XdGGMH23kDjjwXTxRLNMig/A6vVEbXKK1fPYFNb2KPvAZ8jGNKamx+cOQy5VyGZXbExXXeLeKLcoR8XLKo47dlR8SHNT729J+VLNtH9WtWBBHqHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ikF9qrTPR7dczyzpoKYdLOv7UfZcaFClCrRWkv+qFJf3sdUZd2qc9CPPghvV?=
 =?us-ascii?Q?FRPXW9NGTDydggFufM6k19PweQh8v6fgnHKWUUOwgDvuAeAjNl6eaSfJmDDg?=
 =?us-ascii?Q?pZ9vtSWu49ORjIm3eSCzNP2DBVOOzIXUeNoQaAxQmTILzDpGca64cJZVP1J3?=
 =?us-ascii?Q?WmgBJtOo/1IqPEKIIybBDsTUvUWpzQW6wAGEWz7XilCWNkS6nthBMeca1+eI?=
 =?us-ascii?Q?njg7pDvPuhdaz84cn0CR/1DluOwfMNstGsSCwqkqpm7QuVmP5wy/pbCZ0MJm?=
 =?us-ascii?Q?uErlmCbVBlvpGddgdr4UHMl8IQXEGg4uQvB0DuLXOGMnSiFPAayRjQps10RR?=
 =?us-ascii?Q?9mByYdtcr66+DQ1K7vb13IsGCl9f4lZIs1yMh2zmCadX43F8UiQ80NB9amOh?=
 =?us-ascii?Q?/8IRQvLJ+BUwf+vZDrhsMXeGbM1zVt+nbqTfW3lEmUjvrM/ZJ/fAjb6UP4Ip?=
 =?us-ascii?Q?pQT4F4/+JV3itt64U+wK5lYnybyXnd2q4uRFQC8oe+roIiBSnL55yEmE62bk?=
 =?us-ascii?Q?ZjgH1fpavMwIOeBHZA8ckYK/NvcmA3VS4CCkbE6s4vqyEZJlbxfgcM07EW/j?=
 =?us-ascii?Q?z2EGgAP3tg/D+EAc2Ao7mBwDQiloEEd1ZvU2SecXpyKYhfMx3teRR4te8aU8?=
 =?us-ascii?Q?HrijBU1SYybT2hvfrH6p++G+Nc1icXsJ+fBEnMYcwzkYgSYxlCCJPfVJ/Uj8?=
 =?us-ascii?Q?8WBP6bMKQ6Y5QJwFEwxXMi/a4LkxLqkYnkm06aCzSVWmCiF9sgUfsqms4nPR?=
 =?us-ascii?Q?p6/ycAVzYzQqFSBaq9SAYvopZZaMD+s1Hizcz/Mq2Z4e4gPlQDZMQ0XSk1Dq?=
 =?us-ascii?Q?hVflHeuES0J1BDsYkyitZjwgtYjQKAL7s/qFOzpR2nd+HgEA0JWlplRgcMcV?=
 =?us-ascii?Q?Dtzl515+9mLQWkAguBHnjEGAi3Y447rMPGK6zgtikO/dwniFjRBpJd5eyeXD?=
 =?us-ascii?Q?G7DrRCSfDI5+23peNr4BprThEUZf9zjafn2rCNqFlMrGxx8Hav7B3oNxUV4T?=
 =?us-ascii?Q?ux4jIeKgK/CBe4wPuNUl1nq62sNp4g1K3CjuPaSoAwpSbDpxQOwUpV8Hkovo?=
 =?us-ascii?Q?DveoFYJ3C0LX2vUgpvCgSz87t7b4oZNIGoLcj+VPNg23AJHFqripVzMLCu4O?=
 =?us-ascii?Q?TpY6kStLhwHk5pNgJnIw0oY/LqDyECV1MzcFDcjRv48NN+5l61TcZjnyNqqM?=
 =?us-ascii?Q?QvPz50fv02ESTx0J2Ni4RRXpbjUvdnFuO6DKMlDSnGZXcKn/DwDXx6whJSuy?=
 =?us-ascii?Q?/x6j24ILJqEGOJ2JoB+pQqlpKH3Xc6fQu5jU6S4JW9+SiKHzwL0lnmKj7E/a?=
 =?us-ascii?Q?56rNRuWy2UAfS7Q5ud6179Ah?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0009b9-67e7-455e-1276-08d9572bacc7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:54.5156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9RT2KW8DFPf4baBfEJRwkT09Pt8wIeEGJU1UPrzo1TqMWQAEV/+9ex6ljW1tpI6UiVWqTZbvZZ5CbcE+g7DvI/I4acsHKxR3YM5ifF5gv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initialization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(top);
-        return NULL;
-    }
-
-    bdrv_drained_begin(source);
-
-    ret = bdrv_replace_node(source, top, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
-    appended = true;
 
     state->bcs = block_copy_state_new(top->file, state->target, false, compress,
                                       errp);
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
-    *bcs = state->bcs;
 
+    bdrv_drained_begin(source);
+    ret = bdrv_replace_node(source, top, errp);
     bdrv_drained_end(source);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
+        goto fail;
+    }
+
+    *bcs = state->bcs;
 
     return top;
 
 fail:
-    if (appended) {
-        bdrv_cbw_drop(top);
-    } else {
-        bdrv_unref(top);
-    }
-
-    bdrv_drained_end(source);
-
+    block_copy_state_free(state->bcs);
+    bdrv_unref(top);
     return NULL;
 }
 
-- 
2.29.2


