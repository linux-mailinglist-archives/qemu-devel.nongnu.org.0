Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0435736DBB3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:32:38 +0200 (CEST)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmB2-00084U-UI
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyQ-0005u5-MP; Wed, 28 Apr 2021 11:19:34 -0400
Received: from mail-eopbgr00117.outbound.protection.outlook.com
 ([40.107.0.117]:54347 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyH-00021X-Sn; Wed, 28 Apr 2021 11:19:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd5Hd+kLPV27FYjJJcfa4GkLYzGpviFw+gAALlnkrB2Nom1zWtTSm2cHU9/TTQ/brC77+lAsLIiNADZkfIrQ6r7fTKIhpXO+qF1x9qI4D6cVUkyqBxDMyiVJ98qtMziw+hlnFfE7ZBIxdGSjPv20hDuNXpKwmLypXzui1wAWvFPwWneHUD+2026pdC7vq/2obPDjxtMpW+WqkEIOTbpQ5Xw9sMG6yUOhY1uclrQyR0RPHVCveyhn75iaukd+rJlCohFXYIIgg+te2aoriLhl+tlGMubtMi8gDayjcNqRb6emIecrkVTbWbE7EYwXawFbOkSXhPe+XGAgEArxT8ch2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4Hhb+EKNCpg9gh9eSFoazzT7ocW2ZXLvMOlyOx3YOc=;
 b=BlGFujPegZNmU3nAbAJIJBstMe9UCQyTl19r0nwCEZxTWZD8McgHK+vWiOhqYR1pOlc+jgu2qB/dPkdUgILcL2Mb3zfPcA0tbvyS54K7yoiocm6iUM4BZwNx1/yl89H2Ub5HbtUwzmA4BqoA77e8J/gBk+f3Zy5LuWbeXgCVWT9EqyLtoclXBhooh8PYdt3q/iIooCxZs6wtSywmb2RZY0E4pzFdpzb0gO5jL4Td6ScucEy2LT4AhUpOCWHUb4XQ1dU+9HxGMGR9VgHnrtzadHdo9Wulm0vfDMG3yXc7F7LkMgxwxdVczuRJZNg2GZyQgTnIretru/WJ9kf4o+bmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4Hhb+EKNCpg9gh9eSFoazzT7ocW2ZXLvMOlyOx3YOc=;
 b=CKOk7uPP/SOoHKitWnb8HiwdgTWgeKCvSE3vu7USOldmsa1bD7DebUy/ybCau4Ix+yB6eTX3Lj6SUFMxordCKkJtosmFTXdJu6/JJ5L+OqnPU2NcShVl3EQ976fHqv4Sysoke7VkJxJngcXQUuHUT8CobrySVOsdhRILilCtM0c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 21/36] block: adapt bdrv_append() for inserting filters
Date: Wed, 28 Apr 2021 18:17:49 +0300
Message-Id: <20210428151804.439460-22-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b897bac2-efd1-4659-8699-08d90a58eab6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61518E346DADBE6BE1A410F6C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKO68srXQXDVfkY1KuHWhJVmlSj7IDJmudbWuIAgbcHC9fcxUBn2WfHMv6LIAdcJ0Z7OBKrU1ZtsDed7/bNsrM7kDDWdurBk9ocjRgKyLmC/pwi8zLisQ+w8PopCIL1TCI3/INApG8AiPw5OAjHzxgHki5eeNmuEkOArjya0RTx0i23L+LlgGpLXyWY9OZS2CkVUPCGiVXsrl2DU7gQQn0LHBbm2FmV/5TLC+7eHEdyOo48OHSP4hbjxPWAzW1Ctj0ATLhuEJ/zBzMonOBx2at+l2K1c8jXYnvV/R76vLhg7HkGjg/6XOTjKsIL76TLA4ddym5cDkh4xlRXu3lclzITHNQbsUVj7iWlhNxSsLARADA8w0vDu29KYv/YjsqetMlvIvOryyCdBY50B0pwcXUIbfMxkoN52RzNrAEl81qmM5QwW8qIDlpLpazfdPUatPbrpnlvLlAEgiWnztV5MwJ0OUczxuHfSZW2jrsjXlcIS3rCYC7juCfLcqAJXgsAu1h9JVgK/ULwp8DjO5b2O8ZOYxO1xNMy2I55ydy4Ia4TBeBmOlpocFwq3jJUIYTC9fgUnyu0kvEf16d89y9DEdGv/buFkJ6l5ydr8c/h903s3LGQSLYTD7DZtZk8Z4wJGn4XCmSZLSNEtzsPeFD002qDccabAOl7/lg4f9k59Twzdyy+T6xZVa0WGm/sZ7Udb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g1gpBpdZuHH4TM37QqdF3/hKJnaVcXmGdyzvuh63uj1VNOkcICEVp8VUqfQJ?=
 =?us-ascii?Q?hbidUPtQh1qeXD2pJ0NX8+rK2MQuLADkmtlvSFegZpWdvCI7+Zq8ACuIkHQd?=
 =?us-ascii?Q?fb17iidkeVORKjmSDHqTLySmMQEtyPxo0JUlW8CUupjK7WQRKulK7kRp9s+L?=
 =?us-ascii?Q?3bBKXGIxm8PGJXRRUlj2lFdubok9tOvar+Hf/0v4UwZ6KZkroE8CIpOZ9407?=
 =?us-ascii?Q?JMsGet+IHf9KJhq0dg6IYKPWlWaKBZrwEz9HgAB316n1AcJUCYvOaKgV9ZrO?=
 =?us-ascii?Q?UNtOjEv2SZ0/ApjKPSGwnh6sVuUsOwerT4msepG/APOFvEjTsa/5VzrQD8Gm?=
 =?us-ascii?Q?a+fR4pPX4GE5XY/OB2TvSv6DDN2t2BvAlGGAMy99fhZZn8fhnafl5imm1YNl?=
 =?us-ascii?Q?nugSg0mIVS28TwWxPGqqCt0oeBaZL+oy9GXInhGr6zU8xOZ/qqW+/sxzbUFw?=
 =?us-ascii?Q?SNqFObQnWgEXqrx6FN2+rC1h1yPDoAA9hf/RoSW4n1fTvlkLWCPEbzxIjf9v?=
 =?us-ascii?Q?zlgVUQukEy26HDcrWwWW6fQaS8KnVBO7azaXStmf8N/msXt5H2JMhAGbjbbF?=
 =?us-ascii?Q?17G+UVtkq5vLtWu3dPi5XdU6hRafEFGjBx60jiJILEsPzflp9dyf5NuVvrpW?=
 =?us-ascii?Q?DAMYjXGSj5R/ykKEaxFveiK9Dql6XIkyKPVfdzomY+DHAXv6ksjgikFvJB3f?=
 =?us-ascii?Q?Qg2dSPeHvpMLigjJsRXPNP/hAFphu7VCaALkOe/zepfx7xzuR3+rC3VSvZOT?=
 =?us-ascii?Q?pYIooBR1Sw6Usqmqd7cuW/osGMDeEokx4gWEb6I7juHvEfPI4sXbOKu8FLgL?=
 =?us-ascii?Q?hDZA458+IL67OsHL6zvmg8WCzGkGDtqTtHrfJ9iQtKkwBkcY/tyCnHoHwA3k?=
 =?us-ascii?Q?0fnaDHPhYHpU14IKKhEIiHJ0zka5SzeOhJ7jqJbMDAm0sWcx+m1tddoYtkiv?=
 =?us-ascii?Q?fiQ+wx8lI0p4RAg7nMCk41yZbgT3PWThLxiyxSngSh8fMJKvgfiFdWy1lhMQ?=
 =?us-ascii?Q?Jp6x/1sBEYYDG3pl9LCeE2Dtjgoj85adYKJzgt/8uiszg1ZkZ+vA64trxbZ4?=
 =?us-ascii?Q?Tii4XmSUmZhYVcE8k/set0HxAK1GmgTUlQu6HzmDw0F0MJu/ix1GobAVqRRU?=
 =?us-ascii?Q?/am8SpGfaRwchogzdQdlgDOv+IqjihVeFS5ZchBQTUS597zhW66/cBWUFn3A?=
 =?us-ascii?Q?wV0hp/xsm7VtF7CdSzbyY8XoRap82lQsnErPy7Tvyc7wlBQI+LhuGDgG7g1l?=
 =?us-ascii?Q?O9MpA3PC5sSpBKdrGv+NDRLZnRJ1rQ4CbgIFKXFDbllFR9TeTuZI+bv7AtnS?=
 =?us-ascii?Q?jj4TZv/kqGQkG63gAl0cVeRx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b897bac2-efd1-4659-8699-08d90a58eab6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:46.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXBTSolHXafKIiXJJSLlMspd7ewBrgoWPh705T5KYnLXZhb4u/jUs41Il+dkY29Yn2j0s6u77kNdOheNmhcuYmC68G5s60oHAz7xjprRKD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.117;
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

bdrv_append is not very good for inserting filters: it does extra
permission update as part of bdrv_set_backing_hd(). During this update
filter may conflict with other parents of top_bs.

Instead, let's first do all graph modifications and after it update
permissions.

append-greedy-filter test-case in test-bdrv-graph-mod is now works, so
move it out of debug option.

Note: bdrv_append() is still only works for backing-child based
filters. It's something to improve later.

Note2: we use the fact that bdrv_append() is used to append new nodes,
without backing child, so we don't need frozen check and inherits_from
logic from bdrv_set_backing_hd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 27 ++++++++++++++++++++-------
 tests/unit/test-bdrv-graph-mod.c | 17 ++---------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 9283c8d97b..5bb6a2bef9 100644
--- a/block.c
+++ b/block.c
@@ -5088,25 +5088,38 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * This will modify the BlockDriverState fields, and swap contents
  * between bs_new and bs_top. Both bs_new and bs_top are modified.
  *
- * bs_new must not be attached to a BlockBackend.
+ * bs_new must not be attached to a BlockBackend and must not have backing
+ * child.
  *
  * This function does not create any image files.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
-    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    int ret;
+    Transaction *tran = tran_new();
+
+    assert(!bs_new->backing);
+
+    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs_new),
+                                   &bs_new->backing, tran, errp);
     if (ret < 0) {
-        return ret;
+        goto out;
     }
 
-    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        return ret;
+        goto out;
     }
 
-    return 0;
+    ret = bdrv_refresh_perms(bs_new, errp);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_refresh_limits(bs_top, NULL);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 7b3c8b437a..88f25c0cdb 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -388,16 +388,6 @@ static void test_append_greedy_filter(void)
 
 int main(int argc, char *argv[])
 {
-    int i;
-    bool debug = false;
-
-    for (i = 1; i < argc; i++) {
-        if (!strcmp(argv[i], "-d")) {
-            debug = true;
-            break;
-        }
-    }
-
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
@@ -410,11 +400,8 @@ int main(int argc, char *argv[])
                     test_parallel_perm_update);
     g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                     test_parallel_exclusive_write);
-
-    if (debug) {
-        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
-                        test_append_greedy_filter);
-    }
+    g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                    test_append_greedy_filter);
 
     return g_test_run();
 }
-- 
2.29.2


