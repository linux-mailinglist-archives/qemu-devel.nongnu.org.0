Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B638B1CE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:34:29 +0200 (CEST)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjkl-0003wi-EL
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZo-0005sL-V6; Thu, 20 May 2021 10:23:04 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZj-0005ik-OE; Thu, 20 May 2021 10:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LREivY4QZ35ED5uMcdRnIDc0WCVZd4OO0pwh3qTQse0N6gm4eBc7aOhkolkLRIUYRKrIdxRcKIV/8In3J6KwcEhpHTOvV0YWf1RpDM6XpXDjwfZiu3kNHT1/i14P7v7YneYiySdev5Q8R+h2xmBJckC/I3zd4tl1gAGZ84IA9orFn7vnCrezXhAi8IXw2RC5PJg11jTYyjZhZ1RPX1tetLsDYIueiUwBT9cl6mr+BZ5dq1Js0//1LMlL+X3wiQN/tvER3m+Uh0cHbJ7PyLzXebx2e6n2jVDsVdJKG2CnatHAKYuyrLp9q5WBF6BDQ2i0eQDXkyp5LCyGedQ3Rq3kTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZgryinUWsEnTniRHXmcXGv8tiYyMz+B/34hKyg3WoQ=;
 b=R87kMcvz4rjwkMrZeeeuFXDMu+LqoV9hwJ5h5mFNDXn/IDwIfgiHuVpS8pKrriJByzi+QVd5RSR/poB/fE9K5nCdZbceuC0/HBs1gDcrkHOHfSHdwnAK+UwOa50gCl3gbibHuDBd6COiT9EzPfxd/MBr1OADh1jsxkfO5+NJMY/EpWPZ9/4jDSrU6CYaaPhdrczfG/++49WsmjLIz59UxRyAIZPKsZBDG1uwip7iQRWTMJYWuNtNbFJDfS8c9fILjh5YxhjmixhW4WzLyhjyvToVWwCHqPN6S/48OKJHrx2UlTKRJwfcjGYkIwTBFEnmYwLNFSzoVzmX+w2oylEeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZgryinUWsEnTniRHXmcXGv8tiYyMz+B/34hKyg3WoQ=;
 b=pNkShRlgoeUFoQnTE+7JitqAZyoblIb7jYPKYGWRa845cR0VajEkG/5nPLvu6Eh0IIwmrVrKiqzMRHgo2YiuocAf+jebUqzWEoJ/+ZXU2CMpomcfJfemBRxRMFFg/L4XSWZtYmUVRIPFJg2dM57M76rOGnkQ7fjhiLkfWg7uXhk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 13/33] block/copy-before-write: use file child instead of
 backing
Date: Thu, 20 May 2021 17:21:45 +0300
Message-Id: <20210520142205.607501-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b13105-2d09-4311-bd85-08d91b9aba06
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354410726F64D883F8C9D568C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JRBK4HIwu5bfPzLwhMRogZwM+iMMmROvhZ9HmmxmaKBQNlN/zYgxPSwL1f056NElFkzy0tnC1ktf3+9Q6LgbnYgLRtU8CznxYxvEXWvZeLgbCG/9FQ2wBTl8byCp38pc1DVGP5t4/klt2gmOyLkFqg6nWo8M8LRsbiD56tvGmE4zvY8mM1XqXYjcb4RuU1nRjN+KuSxMrmXQUIwDRgJZ8gM/+aF3neUYrw5V7c4GMC9Ahw+rnvF6yckCM3qgVpcHXgfAfEUO3VHjuVsNDPQFpWu7quUMX43fxqxweC4Z/ZCHD/71a54XLz41VUBD5tQ3zQs2743SZUdVCyK8uSl7mZh7NHFyqW9s+JT8Ow4K/baixrr9c2nJXfK+zrgwqkV3GdR5kl2GILilCd7FE9IxpC95szsdNdRQSXsDpUuAyaMZTAilRYcUs8/UD1aXODjKP8oAb1Ft+kq6PxP3XOrWzR92fCx49gOFmlcCpck1v8KIPBH+PmMWzRrMvIewb6H+mf6P2n696ZhKUbzrxMuZmUs3Suje7C+4nnc2UtkGBUUbLibNh++MVHztQ1XPstGuCeB3MsXA0h8JkJcm2ewhnxF5mYN4f4Rl4GLcJFq8Pp+5/h3EcaaJHP80tPA65E9jmf5VKd0Mg6yoV09rZY4nmp4kq1sYs+Uc5GvQ9Y1d0M4I7elkETcw6bbOUh5RwxJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kUIcY5lf5w9ehuG5FJGp7YP07TKI8uzazAWG6gXzwOO3jsnzar7AJQxZNnIt?=
 =?us-ascii?Q?CJ5hp2BHa8gp3FSsr3j4aYYRqNWv4Kk/CA0aO9ZXm2upMjar9FV++ap3DMAY?=
 =?us-ascii?Q?ch/opHHh9onSUKV0c/Id/xToHGlJ+OOYB1v5PSrV3RmzLBRxVTwH+bk7aCWw?=
 =?us-ascii?Q?Mx84G6dr6rDV4ShiVesBZUTK+uVYVENM4GpUbQ8trBeWOvhxZcfScDrhQvAS?=
 =?us-ascii?Q?B6WpcD05jdo5MTU6ktpEbF7F/ek1Xb214UBWNRb6gx4P2vCKC5dwRgni4DNu?=
 =?us-ascii?Q?eTbinwGaotOZh1R/Rle3meRSyxNA14pn336u1mrrVLXUr54P5E2eKKgvywLP?=
 =?us-ascii?Q?CFMJFGPsL0Hb0idYNTSiAjbfDHkmvsdWNbrpl7ijxBg+gPpKKPTipH2bH4mi?=
 =?us-ascii?Q?T52IfIfOaoffXEGsCKtGg8jti0wp1GhdRJrPTZc9kFTg6H1KHtidzKvrHd7i?=
 =?us-ascii?Q?92lb8PX0wckL6FWKuiP++WK6hF15Brrz/saJJt/IvEKUCPvemXkiSWvlMSIe?=
 =?us-ascii?Q?dc+3DAgav3Dk00iJrScF4oQ8c4DfpNH+JSQ0YLmIJnN05VonQLA4EPrAe6uQ?=
 =?us-ascii?Q?L84cOkhK0qs+7fmFsS45qdnn9E9JUoMN8n0N2DHoijDWRdq/MJGwOzb7QaoM?=
 =?us-ascii?Q?9qrmA5kt2j1Iz0n1ak/Qw2cfenLJjxl9U0UVrQ+0tODtcU1++Ff7Cdyx4drF?=
 =?us-ascii?Q?qq88U6uUZ8Nin/FdStnl86BsfKd6+F/RtJIQUY0QcmwXbfmc3J21Q/Ec/XiN?=
 =?us-ascii?Q?RzbBeY88DCbuetxStruS+GeiJlY8MLqj1y48sIkT1BiRtfYpPMSvAlgxagXn?=
 =?us-ascii?Q?6IgVHCUxUeQFG/m6f6A8g0MJL774qTE9c8jyA8Nd8pmCMpiB+aByeLhCmhx+?=
 =?us-ascii?Q?0eZgpwTa2b7Y/GRgQkM37xI66CMnhDFS7C60WZjc8kzgCJ+UB+06RFXL3LgN?=
 =?us-ascii?Q?JbTw0goPPQ3e9pCypdah8NTO3moHVxhVaIsNeLqdajN8PAXdQahFhV5z60q1?=
 =?us-ascii?Q?5NCSWbaFSstyVMbr4SqFo0oUognT+8G615i5Vvi8JVdbUSnDnPjApfygKwcu?=
 =?us-ascii?Q?+1OiLLVDu5qvBzcPJu+ghVKIe6Cl0p0EraLo656wrUrfuyCM4dn2FhJQ5a1Q?=
 =?us-ascii?Q?RyE8gPmespy7YUzKE2s9hBCreAtElSnU7OwyTzScUhAYX11Q9fhn2T4R9Lhz?=
 =?us-ascii?Q?ZWj3FXPkZX5TO7K2kOp79Ot17ygI+V/uxwtEDLak1CNVDUU24yPGM92X+yDL?=
 =?us-ascii?Q?dqDNyR/Y6CLGyhoc0kABdQhIfX6MDQ+eYR8H2q7FgYorqEjq6asCy2J75YxN?=
 =?us-ascii?Q?8t9+HOFBPEyImKbKaFHKGjTF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b13105-2d09-4311-bd85-08d91b9aba06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:41.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZE6YgpxPkuRFj6KGKXFkjbTlHWKvbeFcoZASErF0VehrJal3/X0asTnx110nVx4z3DXtmSMSvfYZlvWItm2x04B0ZizgP6ozlKfdG0asTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
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

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


