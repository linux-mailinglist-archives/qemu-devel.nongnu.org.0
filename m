Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7358C84D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:24:48 +0200 (CEST)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1oO-0006Kf-0i
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y9-0003U6-IK; Mon, 08 Aug 2022 08:08:01 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:57061 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y7-0001TS-M5; Mon, 08 Aug 2022 08:08:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6aQji5stGlwfihfKILtp+L6YtQ8YjtDvcyW9BcOvfgF1zJ3rHbVDGqYJtLOAXBtPHn4RKd4taSfBAxGPQgExlJYSCrqaGb9eoPtMcrijn+b2hxHrGAq6NxRtJNCAzQbw10psSeCKWw/54lllzCZe48SmlGt28a1gL3JOuvzh/mySMljiTN1Hzo6OsKkzALoJ9f5mUbYXPNg5S9L9AIOW4jBfDO/qdjJ4Dcxo4IFMxFmLQqKWEIMW6o9vSTd4n6amu7TFKnFYjKNEacWh8eLwr+pQ6IFiPYuUXuljWhKINluJwQNYPrzPqI+hmaRMgRjFJkZnh79JG8kqeibVHy4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kkBbvM6Bd4jjGVn7oT9aQjamzY+He1u2YUCafs1kpk=;
 b=K7sOrXOSAWdYH8k5TwZjOJopEMK9omvQAh83H99gG5IAI83f2xG46d6XwDthZrX3/6AYV9BalDI0BFGerZ+EQGUSJVQcMEV1UqGKevYjVM7fxPHYIZorM+IkQ21vxbZCdbXSO6X3xUEXp5jZD+Ga0OQ1GLgns/SRnEToKr+6VH8AP7ApI8hfZtOMVxnHTllkCF49hq0cxokPXjx2SlyDE6I03XsIpRK3YPaEfhPyY8HUxnZeg5n6HWnmR2oSgW6a5LatoEJ2/K+ECVi4ZUplWK8xmcIASif4XJFOVfTXcdnfg5guspStUism4mk1ytagbTaFu8C/jdm97JkaCzVT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kkBbvM6Bd4jjGVn7oT9aQjamzY+He1u2YUCafs1kpk=;
 b=htGSOjSYqy6DVdp6GhVjsT4LeToa8KQFWTXdEodjdqtIVSedJZ9G7CXxTrIR/6PM1leLrY5vgjuEMfUCkU0yNWhWfjdkopxcrHXd/d3JjuKXagPrZhJksYT318FcHGlRmMgvS/ggiP0mud3oPh/kDT7hzLcYxbxeZt1OTXzITXuyT/46onyIm3iMaNasFJzfqrBD9dNH9y+kIGHMf3Hi+NOvEjXGpTF8MBzgDEk0oRq7pFnQptBIq3MfagOuw26UM2ydoSbq5EoJq5iKwhceGdDTQyxtDFy4l1a1Z1v63inaKKywpw8DW+Ze/g8ERrbKiSu9nN/Q2I7XYdgwO9iCwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:46 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 5/9] parallels: Move statistic collection to a separate
 function
Date: Mon,  8 Aug 2022 14:07:30 +0200
Message-Id: <20220808120734.1168314-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3c9de7f-098c-46bf-84bb-08da79369b4e
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oy4lEBtwhWKePoBejnS1uJKLL9zmi0jhW5A0PKUeefc0lomDqJUNgrXgOh8Z4Ib5zCiMTQgdfnHaRI8RUoKAAWx8EIUfmgGShuPvdlainAOHZ/CerRWQgJMZOBzOPvU4LS2xtYklZFx1OJLgTqV4ujs3Trb1xH+GSZvbx1IJ9eBYk4QHMBqJ5PykDZ91dBTMraDa6guNbZp2epgS4U7tQbY+G8MVcdl75TFvOeUeCh1V7qmwnlsgZnSWt+UNGzNCFrkQwYEJ94gk9ctjA4b9vkt7juQqJK3qnvVbH+bZUP0NJ6eutCOLKrKUHtMmW9OrLHYr1HtqxU/bAovCPcvkpcuz39IfuDjAeBlBCYn+Y43ZuuAnUwz+S0hFN8nQ6jAC1IQ3GMrvwHOpQFY4vNzye+xWeuLwyIUGCGwTO144QdAOJpF3LNz75BiOSsKwuz0Tc4NU+iHSUwqd9EfUjeftqr2GaoHlUedFUEUln0ehJcuY/qo52fGSfS7LXCHTDeXRHBJF/AygSAM06n9Nqm3FMctnwIk3ZsXyUiuhwuFGV1gR1olrCV4qK7SpfyNhJ6iyTfk/ViNsewE3jHmyH5GDEH6NEncxcEXbCa6gFVNqfPUxWjn8mzHZ0P/dgRqUej0x08agiLSdm40V832vDyVrAo03grWk7SrrTvT/0WHX4692S89hAQStuglerwhDtNIZJ1MvLHyA3RbT6oKBJQGCK252e7ik4/jG0gGNjheEA/XmvfcDuOVLWwGTxYR0zpxpH3R7Z+lmZdmstTB5hMHH5NR1zviwnECRVsMhUDhodZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H1iFDmoevvTLNuOaURkTtILEIR87sXE91C5yOo8fzZ3DnwI0/nm+RZ/wX5Id?=
 =?us-ascii?Q?hEfFJFs70uqAWo0P5sDGGTGjs+tWfb3nLMoKHcCFZDdZStFDnIzn8VgDw10O?=
 =?us-ascii?Q?aVX7+xZQRGfccB9n7sH/m6k7C72O24whRsV75Tykp4HjSTtOxO+EKuaOyzpU?=
 =?us-ascii?Q?HfCuNXUA4gcvcn30oX9ArFIA6yTHLaJlocwPPZC5SR9W5AWXsWbyCt1rf8nr?=
 =?us-ascii?Q?VgoY+PTb3HLkz3rfLMinrWxpqosVJrGycTk9d7gk891/uLjhIsLZp6ubveIB?=
 =?us-ascii?Q?ac5Tj7aLrzPufzQzl8qGC1E4EZ73jPFoy11u5uOn5oR7YB3SL11yH47TXuvs?=
 =?us-ascii?Q?KrsE0cYnS41W8RoF0T4uOLDesyH07Kclhq6keJQJBWFqWhunAYBG1rJYMkN/?=
 =?us-ascii?Q?08NE5UZUdc8SyXQzhUZypZ949adNgXSozH7mJw8PcaDiaX+w68ORx55fcxss?=
 =?us-ascii?Q?ndeX/GKi5ci+3Sz0MiDfJ6wScXsYGJSfgK4FMCiHv7Ky+Ggm2gpIgrrLbdoS?=
 =?us-ascii?Q?4rVQE6KRj5rLTTXhLhfZfPG+0aHHQHgU5xHXgIytGnJ8D2SVS7H1Bi1U3jvk?=
 =?us-ascii?Q?YBRzfS4CJL1y5zvm8jdVm4iFCGlUJuPrzdgEglgahzCMc9zKDZkag0sHRWEo?=
 =?us-ascii?Q?m25TiDlPTggh7apciJqEs2TRyHJHkIpnflhkRx2i2U6vmaFiQRTjYJFnLtut?=
 =?us-ascii?Q?Xhma2mb3ElQ05NPtjy0yx6nnm5xJiF4sv0lTo3cCDiICaYtjQfixEUzyP99g?=
 =?us-ascii?Q?GdXDSDdq4DFY3XZM9gz3P92/9PcqeVBxFPbZ9t0+vKsVbB1sAjZ3OChb/Bb5?=
 =?us-ascii?Q?SUUgvs9pVd/M8/1SLP0PmVFwd1NdOX9n4zXotm6n8pzh90gsldimX9ykY6n/?=
 =?us-ascii?Q?ix7GXbf4Tip3dyLGhNxX87/7uzuD519EAIEKdmfkrpr9R3uuZa+ARV/rYZRK?=
 =?us-ascii?Q?061ho/3sJpdPI27rCtA5OadBwYokcEJxHdNDDCvERBO2cGFXD/pPrsiH35ob?=
 =?us-ascii?Q?Z+TLxGWkSy2G02YyDlvutHjPIlQuI2eEsJmySmM+OFgOzBgiJgSjquRVE3sP?=
 =?us-ascii?Q?72JJA+fqfF0xdzdDfWqcboCeG6RbJnMmbjGjK7K18sra8guUfCA1PwV/5vKS?=
 =?us-ascii?Q?MvquXYXBoeGGSMtZeAieEc3JRIhgs38WJD5j8D0BrGIihKfIxKdRv2K1Nkr7?=
 =?us-ascii?Q?aE+7iqmMa0D0zh1qq+DZFH4pf63V/E5sLNwSzNRKdg5eNyVyRYhTII8jNrpH?=
 =?us-ascii?Q?exp4ONOztjhWfSCUy8XjoPG8aVP/76NIquc2tPx04dvvVg2lxhIEaiF59p3n?=
 =?us-ascii?Q?6U0YrIXRxd68EvyUo/W4oWyU/4BRYYdI1DJCPTITAFxO8cX1sCzCaLJ1qT54?=
 =?us-ascii?Q?GgpBCHmHo4gBVfeQHclv6r54I+bxtsuhFhyFDjgLu+3XD2J0/N1/ha2aK+Ri?=
 =?us-ascii?Q?0ulm5uqnRfFj43vy92TspXWSn0+OPfwqiRA2IhQyHSLBUCb0J+HQP0ur/cuq?=
 =?us-ascii?Q?2Vr67O0GWgzHxfvhTAMC/EQ7WAlE+SSYgTOTHygFuIDqY8B45SEa4jj6bYNt?=
 =?us-ascii?Q?JEUoHci8ILnBzYpHv8LASKg1jYwpa4YHa769XWtdGhPjSz89lFvngYgZILBe?=
 =?us-ascii?Q?d3sjHzwv/qBrRLQjfaAHwT4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c9de7f-098c-46bf-84bb-08da79369b4e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:46.8249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIFdv8CXYY4fcQLmjX+actK3WIk8LGuWhLRWkd4sFjt9PBQnyov209LF+q+wJR+JlHhll+fZHV3764qjxmOCutl0bkHX/UjdKSB7+Ni2v7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 0edbb812dd..b0982d60d0 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -553,13 +553,29 @@ static void parallels_check_fragmentation(BlockDriverState *bs,
 
 }
 
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    for (i = 0; i < s->bat_size; i++) {
+        if (bat2sect(s, i) != 0) {
+            res->bfi.allocated_clusters++;
+        }
+    }
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int ret;
-    uint32_t i;
 
     qemu_co_mutex_lock(&s->lock);
 
@@ -577,12 +593,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_fragmentation(bs, res, fix);
 
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
-    for (i = 0; i < s->bat_size; i++) {
-        res->bfi.allocated_clusters++;
-    }
+    parallels_collect_statistics(bs, res, fix);
 
     ret = 0;
 out:
-- 
2.34.1


