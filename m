Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B14AC722
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:21:41 +0100 (CET)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7hp-0007kh-E2
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71Q-0001h7-J1; Mon, 07 Feb 2022 11:37:48 -0500
Received: from mail-am6eur05on2101.outbound.protection.outlook.com
 ([40.107.22.101]:1216 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71M-0005Gz-Fn; Mon, 07 Feb 2022 11:37:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKgILKGqp1PSJ9faRXHfKOA8taDgf/pshek8mmabOv6ZDJsQDu5hBWT1Wh76qcM10JneskmRcav9jRYR77IUSumQxIQ6fDJj9Ox89aY3rF1ZgLbr/+VKo3+XEVcWKWNsUXWyxMXG9mSHD0O9romH68Fr7DbrcRCa7uybA5MXgZITqFefM2wHN/1V54w0xk+cduebxWTfwBlmbfO1Pu03ztM/eDGau+F5AV8lrIR5NYiubCoKBfD2PRPWBNsk7un3GE0GT+Q0aEled74jjKh3krn5Lc/FofvnZXW/zQ31dIuryfJ5bUwQ1ne4PbFvTsYnpscZiZKyMU8sC7zxAseteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6EErcn9fPaTCAN1xOePdKnlFzFGd9xI+8zfpXeWa7k=;
 b=eWBMFBmxNIEP/3F5rxpXODaxxoPNXX5ZJ+M7f8/2VdFzBKRviDp3FeFB1eo3nEqeph6vNHjcoEDGEy215V9SWOtimk/KkXy5B/ABDsN+se4wO8tT1mUV606J0lTrEYE2BwJ3pvvSyUZkj3Z4DD6fjZO6+wi24Cya2JjH1gh7+z7Yu1Cqgp+kqBLsoHgPgenzdO+ZY8e4Fb3Lj5yg16uROAUB8fbK+Y8pnQtyUKvBfRRrSvT86mdd6HUT5VTO59o5bNbYISIpmzB/hbun0w92aVlbsKkuL/Gf4lS4C3pL53Eb7nIgdFrhhkhiJhqsCkfrHRnHsPSrdMVOoF6KV9RYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6EErcn9fPaTCAN1xOePdKnlFzFGd9xI+8zfpXeWa7k=;
 b=jCT9ylAMut42B9xj19EzbJK5/EO3xg1CijdZp+6OnBOYIUX4tyzsTLEDaXLtlzSNgl+uc1uhmzIAGKvEKIkV40EwRaSIbccbOqZWZYfIf5cuyX5e5hNAIXGU/2twkMPYaIU3E0Dt0kq21jzfZEBHLFfZmWnng38HPwCE4AC3Bhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 02/14] block: drop bdrv_detach_child()
Date: Mon,  7 Feb 2022 17:37:16 +0100
Message-Id: <20220207163728.30362-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebbee222-966f-4303-4fe2-08d9ea58275f
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB228817F2B2695294B445C1ECC12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLYPg+nvqKnJS8MQ/LtFVoB9aUgcIrsfZAQaEVegzKHot1YnzAbF2qNRRuDxW1X1p84nbWn6VbPdA/rzhBASrxN/fCV5GTEqoZQkUr3OYP9hhRmFXHM0t5k2PxVoRqBkIYDY+ceBBeAmvqdeUYBNR2AuIvVDUI2ksW9Ga7iUZfK+u8lfiTP1GK32d+AW5XO5TIftG85E7N/4J0Z+QxqiLNTbvGmIY8Sw2P+NQtLwUqQ+J7iTn+3jAdqW0F6eHXnSiK8/5GB5a6IwudgKZNTmjllowy5xCwAMvwiF70LztgecEdOkt5b7yAxhIcv0bs/9j5b0CwQaBUEiBOtzVv3Br4WKevZwL5S9lWnRZZzE9/M1gi9zePaHrTnnbQ2vnjMVCbD+nfdzNIec6hbyRae05LgxUlspaSoiCKXU+UgA51yXMcQ21C3HJ4+64Ol+9mZcUyP+OcjW6ru78erEVYzd9i9on+A+gY+yGM5LnOZkKlo0Y9h3M8hQkEEAVzXaoIRbc7iu6d0/1EqLrvSXxBHxngxgHkUt242n6hyUDPrC+yoii2fs19BvjYZppupFW+H/9XF8pcS62aZi7Vm+KPPDVPY4OYbzmY4Bhe6ktc0Vo/+IZwa9aX3Ms7jEQhiB/jPHTX3y4HLK2BqxvS3wUiuPqOSSsAEMFPmd9iaGtOmhPRQ1J0zApPtcI5bcpc4bp7zvZde3qRzKbkH80BAhLBj//g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZODEPAB2xQO3f6/qOQhvPzTNpSiS6NF/MnxZZEKIFWG16nvKlsyMOtuwTgl?=
 =?us-ascii?Q?y/7BiqHyWYpSDV2cKZrl5NpXfSg9kVGSVr7CI8H6NOvSREmEWihMuNKGuvlp?=
 =?us-ascii?Q?AIYygW7q4+83lTptEPg6JoYLG4zIqfKJBFKMM610FrbmycNSof4HKFHMoocz?=
 =?us-ascii?Q?HcGLafJ9WwH/gSwYM1TV/cpW7NowDJ0X3zwpLisASq3rKMQT4mF4Wm+i7IeR?=
 =?us-ascii?Q?dnmQ5ogxVNEeO11382O/wCdieVY43En7Gg/lyo5HqkryKEFeHz2AimEmxGTr?=
 =?us-ascii?Q?8VTt+s9UOFjDnyQNUghEHhptZgHFUiIUNJ/aBB7du5fto23+XcYf75J1INpN?=
 =?us-ascii?Q?rLXC+GS/HV4NtW9N2x0nj7pqhn/CgViylX05NSQix5RRMTRZuxyJSESleW6d?=
 =?us-ascii?Q?PzO51aYoDwfHvXfzYS2a/V9C7GKT7uC6AAvSDB/TE1oMcKXZ7J6jHIpg3opl?=
 =?us-ascii?Q?m/1ZkeWkPTST7UzhCNpGBJuaRyvZuwNlhMxum2ZuBudyXDhE1SruiIyMoQXB?=
 =?us-ascii?Q?Vwola3kQzGLWs4X7N2J7MzWxENLsi7svAxBVSuuS4r6X6QZWE34KbSc4spAo?=
 =?us-ascii?Q?55IpPfbwbrE53JxD2b2/EUn61GOmc8ZQGbaTgc+XC/+BMtNLYiI3Z+01Z3LS?=
 =?us-ascii?Q?xWQlmN6CxG7VtKhmPT7XGQE21aHhZEAFKOkj17SGNBeIL6nQpMNFt73cOHis?=
 =?us-ascii?Q?Lm4ap+LeAwW2QftIOV02++P4S40MZiNbIuYpdSsm7muVlW1IU77yU4wckKFY?=
 =?us-ascii?Q?gK133gBhm1C+medsDpILmkA2AJRBQz99JGJlnKPVAX9tMIQLsnDMgOSagkT6?=
 =?us-ascii?Q?6slNqk2SDf378UzUefMbAJJAbzuVwLFeKgjf+QP7MDGtgbz49x8FbVVrQIDE?=
 =?us-ascii?Q?mEUT3RtjmAa/bVJPyjCgdlGTd6sBwwDNQmLFC1YXshYEyUoVSKaHFmtoNpZI?=
 =?us-ascii?Q?0E1pjlqaxt8T83GEe4/ZODmgBANs9jVCCv2akNUjMMgWt6AwLonljXdkS14y?=
 =?us-ascii?Q?n4Ar/MFCltSaic/3NiVRg+eYa8Oko4n4EbzLPIJjjyRuascbI54PMho4g7Bz?=
 =?us-ascii?Q?jBvHFPi9DEGDfqtUYn5xkvmI6VuIRFEC/X8xBeUYjfl0D70/NqdsV2uJlJkL?=
 =?us-ascii?Q?j3xhe+l5ohSihyaFBw+6EOsllmBqLmNHBYbK9exx9MLMyPdrSIPiggHIXefz?=
 =?us-ascii?Q?YfB2VGBYVZjOupxlozxmlJIJrPJIqCOQvLW5JlbRbacjc9MYbttxcWEVb8w8?=
 =?us-ascii?Q?la+JZMR1X024QDjdV8/aBJXQ0ZekjODzqDqLyAvnlFeG651qTNdEzV6VCQ/O?=
 =?us-ascii?Q?z6AWPylni9t2sKc/0Y6ydQBWJXIp1xae6GCGtryhRKrzoSHXRDHHL8X2moO4?=
 =?us-ascii?Q?LGHeRBh/jo7yCxnHlWIdGhSYRxvYyJ7SwT4usjh6cWvzuSkuocugn2FWPiVb?=
 =?us-ascii?Q?crCilDnsh/5ljWOsjbfs6GQEBsMhbxsALpKiIQn8k418o3+BQTMgfBUsE+90?=
 =?us-ascii?Q?SFGLzHcmgdoAVpdYjqcc+UmpeC9BAG0Clq3eYrQ5iw8V4Mk8ZhBJF9j+Lj0A?=
 =?us-ascii?Q?UQEMUXAgI9G8FGn+UBv1fa2VB0FFZqisInpqAx3JgZ1IefAqRIKt3yeoUMuv?=
 =?us-ascii?Q?9nJBVHoCrfItkQzQE9jk5RtZZMvvHpwo90Gd1JKRz8Pz+ALicez+PdZDLtYX?=
 =?us-ascii?Q?gkg/PQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbee222-966f-4303-4fe2-08d9ea58275f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:38.8996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKC6DCEDHynVbfQmGV383CZ3Cib6lwTUIsiqcGubdyx795ty0M5Ty5tSjnL2RtA4LE+wRNRZgGfVmBGlsuvynttWz3hkzGlN6SJ9lVQUpBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Received-SPF: pass client-ip=40.107.22.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The only caller is bdrv_root_unref_child(), let's just do the logic
directly in it. It simplifies further convertion of
bdrv_root_unref_child() to transaction action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index d852daf7c8..378841a546 100644
--- a/block.c
+++ b/block.c
@@ -2948,29 +2948,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /*
-         * When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext
-         */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -3053,10 +3030,26 @@ out:
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-    BlockDriverState *child_bs;
+    BlockDriverState *child_bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
+
+    if (child_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(child_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+    }
 
-    child_bs = child->bs;
-    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.31.1


