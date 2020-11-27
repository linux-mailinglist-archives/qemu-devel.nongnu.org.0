Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D065C2C6887
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:15:11 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifSo-0002Vk-RX
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1b-0001no-8A; Fri, 27 Nov 2020 09:47:07 -0500
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:45281 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1Y-0003QT-AK; Fri, 27 Nov 2020 09:47:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsZw9e3WA50FjbzzBBxOgT9lQkBaLKzH+S6lcepRQzqW8XWZR3vc/1HqYV6xPIqcpcxGthwBSWV69P/EwQi0QvGojfzdptvZNMCwOBBU3NDvypzRaHcXDmngI1c2ixqM/zMuG7fXQ4HVEyI0rWN4rM7bfwCsf2BSBaQsl2HQrTbuouY81wZUhr4DTGGf3uAw/XWu/KrGMlvbsRxqzGzPo/cT5VOgZnqfvl1DJzYck+eqpGcVnxFn7ehvtvWlyh8sGE1DMFzwac8i3YSQ3GjStt53pGrAYO8nwiBxp3zNYYjnGD3iXEQONQJ8s6Npoi+oFBi/n+JpzOPb1qjrTtnveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P106dAQ2jVkdzBj/g1QlgvIhycpj121I9rl/opg0/Ls=;
 b=TcOptyo9Iu7iVPZiZqGwGRDyha5Xfs46EX2VE30synLfUlGIZPhKZWjKSQAm0vX1h9XEA5JSqhi3A2bpN69zjA/Rci3yXTpfO7P55S3gNS9UjQYxtiwfPGyN8AgGSjw7Ls2+xDeoxs+vhv6Qkgzvr2/1xozJFl60LRlQgOoQrPt72Poogl9GXR6L1jIIqdyXwQSGPT5H7aQjQmzOkdf61ajfyEejgJnI7bLqeAjPM1jK2PlraZMdFccEfAso2AxuOtn3ZVuk/7n12k51bkokkrFBMNVzaR3h9GrVFNqb0OCDNWyHVtVhmDcdQFllKGmZlJTZOmG2XRf16n4QXqcSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P106dAQ2jVkdzBj/g1QlgvIhycpj121I9rl/opg0/Ls=;
 b=nbzW4l1mczOA9HUukz1mwu4TOoCYhffdJMZRvdAE4p2pdfW5Ht60cgi5ZGafYlaMog4CGSjeCU0DUAvJB4qjHe8v12D23Wzxu5tDim/1ZymTGP3bOtXwpQRmCr/pQypQvLyDXu+pxsrsz39ZOj7zvsowIkKPy65ABoP8NIk5yXE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 36/36] block: refactor bdrv_node_check_perm()
Date: Fri, 27 Nov 2020 17:45:22 +0300
Message-Id: <20201127144522.29991-37-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:46:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc99c12c-f924-4337-04e1-08d892e32ad1
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990F987EFD19375721D9894C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KmM/Rvj2yxhJfTQ8MtD1rkgRVXtBoU3mUM94ObxFO4UefwryOQobieaBDnBFan5Jgt+x7jME52b6nqMYsgt3dKi14QaCpZD/SYk64AL3fXZoACKasMsGc65e3HO0YOCG1omXVaHUc32cdwMiV7xpoK46V3CZuwUProv4//SX2B32lYsNrZHdnT7XgfxaAEfoj7bqnOTHA613QKtj7a1SnK0tNxhd7uYn84/vNNNPtPOXtTCCi+melzop7N/oO4T0bfbxPsu94QL37CeG+nKIg2MDB7xRJze6p14aKG8MeXMNdBDjYvBqF4oBSbrZydUPICv+QXJR7R9TXmhJ1TQBUqAF/iKOHYBuUNw4cTwN86OdX1IIcY6MvNDULayxYKo0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KLyPIukZKagwrHIxVVzOqXktKYy/aF7xuX2BFf1FTT4fM0Ih6/nKSYr58ecy?=
 =?us-ascii?Q?EbendcdPt7hcD0aRj8BqvUZ+TDwTFmvZUjN8rr531iIwB0mF7bv1yiqyrsYB?=
 =?us-ascii?Q?S63pWuX0ktGQLzOxFbT9ci4w90eLT/5coWxwaHajU9dupYhiexbCLlUQ+EUx?=
 =?us-ascii?Q?JE/cXvhCEr4KTJMorA5DzYPwo82xIlc/jlUpI2m1/RMbGjvjXYd18iGFUquC?=
 =?us-ascii?Q?H+ggRqiZvd2Bo9vhTs5tXb3o56UqvJRlRAOyRfNPP4vcwEWHeN6MknfT4667?=
 =?us-ascii?Q?OQ7ByRH9/Jojc5m9A8KsCyjivScZ95g+9tmzYqB6DOu95fMnLme0F+WHKxCI?=
 =?us-ascii?Q?flpmobFN/3KopFgSu/QfjTP+v3ZsL6WaMKkKYar+q5oTarUMH13J/HMhGcqA?=
 =?us-ascii?Q?V1m3ySYYfkkgbwt7k+nZeoLqHNjC5RCpgnLuIY5kJhStqCzxeDlU7sM4zsAc?=
 =?us-ascii?Q?dkEQF95XhHj14Ihfbj/EWt+G0r8+y3Nz9V4A9VL75pEk/8NIvU3j6g2AHG12?=
 =?us-ascii?Q?dSfMaCfnogpoM6ybFd9ZJGvXossE7A7DI2HXaUmvyG7GvbMm3rPcy/CVGhkP?=
 =?us-ascii?Q?de1hkCiUrvi1iT1Gg/ooQzOvgTjtcoJj8FvAIhuQFBYw3jkK1bVR5Vqbl2eR?=
 =?us-ascii?Q?aZdJDtyWyoiFGOW9e32XTJMYm+QngusiyjFDxNJN8KF9XnpHfRcldeeGoxJz?=
 =?us-ascii?Q?CqCu806Mca6oM9pAofF3j49LYO5tMvFXXhxKi7t4VYrWM/i6Pk5dZ34nhQtc?=
 =?us-ascii?Q?/ed8W/k7qTEcyYIzc8vmLqFOOJkMTLNXEka05TV3coj4IKBXVMvVOH7kKZ6R?=
 =?us-ascii?Q?JwQHcokEtPjb8CSc/t/OpclDwHG42ifndZ0u6RdcmI398eHJF9SG6Rw2Lpba?=
 =?us-ascii?Q?MjhVEnJgaB6yalE0DVVc/QJUufBETYpT9v9jIHhBpkmXhseSk7pkK4jwDnA7?=
 =?us-ascii?Q?AMNiOAk0tysjCHOnYLX+DT4vnM1ZLieYRrwfXEzDw4k4jSCWWpZde7vXyGDf?=
 =?us-ascii?Q?BeK5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc99c12c-f924-4337-04e1-08d892e32ad1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:04.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLcRUHZaNAIa9A3kwNkkG6NSK2RSTn4Jn3VqdWy9E3nji6lbOZ8oTtrBBGdMYQB4qANo/2bx5gUKMMbgUpdXJgdlFa9We0M2CxW+TJvncX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Now, bdrv_node_check_perm() is called only with fresh cumulative
permissions, so its actually "refresh_perm".

Move permission calculation to the function. Also, drop unreachable
error message.

Add also Virtuozzo copyright, as big work is done at this point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index 20b1cf59f7..576b145cbf 100644
--- a/block.c
+++ b/block.c
@@ -2,6 +2,7 @@
  * QEMU System Emulator block driver
  *
  * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2020 Virtuozzo International GmbH.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -2204,23 +2205,15 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
     /* old_bs reference is transparently moved from @child to @s */
 }
 
-/*
- * Check whether permissions on this node can be changed in a way that
- * @cumulative_perms and @cumulative_shared_perms are the new cumulative
- * permissions of all its parents. This involves checking whether all necessary
- * permission changes to child nodes can be performed.
- *
- * A call to this function must always be followed by a call to bdrv_set_perm()
- * or bdrv_abort_perm_update().
- */
-static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                uint64_t cumulative_perms,
-                                uint64_t cumulative_shared_perms,
-                                GSList **tran, Error **errp)
+static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  GSList **tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
 
     /* Write permissions never work with read-only images */
     if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
@@ -2229,15 +2222,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         if (!bdrv_is_writable_after_reopen(bs, NULL)) {
             error_setg(errp, "Block node is read-only");
         } else {
-            uint64_t current_perms, current_shared;
-            bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
-            if (current_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
-                error_setg(errp, "Cannot make block node read-only, there is "
-                           "a writer on it");
-            } else {
-                error_setg(errp, "Cannot make block node read-only and create "
-                           "a writer on it");
-            }
+            error_setg(errp, "Cannot make block node read-only, there is "
+                       "a writer on it");
         }
 
         return -EPERM;
@@ -2293,7 +2279,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    GSList **tran, Error **errp)
 {
     int ret;
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
     for ( ; list; list = list->next) {
@@ -2303,12 +2288,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
             return -EINVAL;
         }
 
-        bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                 &cumulative_shared_perms);
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
+        ret = bdrv_node_refresh_perm(bs, q, tran, errp);
         if (ret < 0) {
             return ret;
         }
-- 
2.21.3


