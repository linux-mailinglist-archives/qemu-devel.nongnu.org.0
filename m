Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF858C82E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:12:39 +0200 (CEST)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1ca-0000Ri-Lu
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y2-0003I4-N2; Mon, 08 Aug 2022 08:07:55 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:10881 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Xy-0001SH-Qv; Mon, 08 Aug 2022 08:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf5wCUyt9e+ufpt5ldADmX7lqkTnrC/uMntgzLkCsKqCwrOIPQiyHyPPTLChj8/P7owXIWnlRV7UHE0Jboa6+h6coaVfOcEEPdRUAXpgyRkmTNkXo7B4b8YTRMHKFucHDAzkElwvkdUgaeYHYE5VBZtwgmHIfSzBAa6zQF3dfDKU3Ze87oH+mzaIQNQtVBTrWGEtCwXAi9FVMN8b1/JgilHWxp8yyIjpf/l6vhpxqIHDwyMzwEo+Sl/598x6e9rEunXujWWCnGu/diNTGReYBdDonMDSinxunAfZVbbB/71Cte8JbwIvZti/efYfiO5SBM84aQQZleO48KclhVHbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgRGQwf610QJ3ZASdRH40FzTi/051uU7KYKerSYOSBA=;
 b=R41+/MRg8+JqWSZUx84ZDNGitwp+s4hFbAR//GNG4lig+Ok9Z+bZ7wr/UI5UjEcMZJEb0kCNxE26NyrYNl1+zJ2Wd75cDf30lJXeT8enbAwVOHIpBtkLOo9IflfAiWSKym4ORTETjCx6l9Bp01kF5aMXml4k0lFsj/eXnRbRlQcsZ1SmOIvFWtgOPnETsjDDsbWowZG5W5o+J10qK1lsQZ6CrkRqO0fvhGxsX+zf+iBoLMPqqrSZ5fCeAWegsiddbCi7St3k7/5WZ8chiJ9gF0FfFFradeXHaoLf5fFRP1elc9PnIBMy8Fcf0apYhl41/MmdZd2euwlhnYIVGKRBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgRGQwf610QJ3ZASdRH40FzTi/051uU7KYKerSYOSBA=;
 b=SOe74NNi1cyDnPO5JfasNFGqmrTeEJdhF8Ykh0qhgw4gomLvtV9PPGHqr9cjJU7kXrb3qa5yer1VPMkrVvPfAMzdHHyGDcdHCp6j6+GptJb27mOJsdra3QOq+lvaWPa0F1v2Kq1DkjKDpDZMQ0aesmuAolTYrCZJywY0FaJkQxkRgFgt02UgNS9vhrOLVtA7fnVYbBa4i7J4yK3yNAhjhcjgun7HZA+wiiYLLuUxl2+1tZvyNR2rlMjT8aiAEoO2SyZRtxeUxRzuu4KfLtor3JvEm6malO+xOSdwbKgQRsv6wReP/8j93Zsyzr6aom55xq8f38ThuHzR+NLu6/5fRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:43 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/9] parallels: Move check of unclean image to a separate
 function
Date: Mon,  8 Aug 2022 14:07:26 +0200
Message-Id: <20220808120734.1168314-2-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ca6f7d1-cea9-469e-f792-08da7936998f
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXErBvJwN9FqIdMKFX1wuDYLohxCSaYmbHtns+cRh4VsJ0SrkZNOKy5T6KcEj1P/+iosdcxfjrMD2MX+ZXtS4RHNQg23AHQqsdSY5iGyeVZHtDkh730C7fPGq/PfeazIIgv1SyDPH0RS9GubIVjMNhrRDDiiSlcJjkZSMbuNB0bSZLLFH6vj2zzJO1YLBE9CPZS5pNk4sD7fficG0/AMILlv80LpPjZN36hKMiTGWAJAcpd5KcOFIb3HieWKjGBuwFn6lLYX1bFULxtmpuGgnuWrIFuFykbgm33AbhD4Kvm3bKTk2y50W8vGTMOZH6gxOIL52mDj8rs9HT3O2c8JKEbJEKCoYFksed6tFiFy6kLOdiF/TdQZ6aUv4uOSj8rokKfZF3Sf9a8zw7AA2EW/5e1WkNlmmw1c4z9sJqDdhJNUeOwIOIr7mDP4Y+3jBWZP31wpngljks4CuiC+cWM8sOA0VqTfZycXxlli9eovobvPVGrvP5H6sTxX/UXRNt6s8i/2xu28TZoD44Xgdye8xBLG+/0XoH+hARla4x/hiEc14pZhUMlJ+KmM6N065Q+cqFc+2G/MTEX9tl50F2NuwPfXW6igITe9TyJ6L7o9H3Chh8c/8CBByfje+6HSrS0i+mcbD6MSUQN20nX/kE0MxcboTR3160Zfr+JpA8UIt0swIgGnKuOb69oZotViZf4J8+xWZ/yUeWS0hwgz7t7/XnHfpVUo6roe6RZxF/4+56FxLGUBieIuEK+SFazbTvHEzuh7MTAGFxqXekypFfROGMi+wHSdl+fi6SvPo3Gd5Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJDwTgZuQXxKH5nCGOC4VncfT30PTg+VGM+ksC7QY/LxRCb42cSL4yPXKGjm?=
 =?us-ascii?Q?OXlVbXRt+qDVlr5/H/82PvIUzZxWUeXm0hpkQCWwduXN+IPGRGxfR5Hj3BFT?=
 =?us-ascii?Q?eFQ4Bj31gDxGrbPyUeALkhep0YJMMerADPDKe+xtbAW3Z6VoXcXeBPFk/Sf7?=
 =?us-ascii?Q?I2dTcxTteic2AqirpenriiSJGjISAuEzPDBeoKxj55kho5FFEDx/URuo8WSm?=
 =?us-ascii?Q?qXw21Vx9HJw3w7nR7NKyV7UzR7Uwb1dCf7TLUtLuQxjGIjmU5TOuFrnInUmg?=
 =?us-ascii?Q?pP8SG2CvIclWuEH8droBciGsA5z/XgA8FfSHTcOU2u+Cy37uMw3SljyUX3cT?=
 =?us-ascii?Q?YOX5I4I8y/LYOpFl2yQ9AK/j8HNFY5HhT2Uaz0CcqVbffaVLdK1Gj05y120X?=
 =?us-ascii?Q?83cPV/KlpCrdmHajk8QAHHlhy5TqjDk/E8ITBVP9303Zv8om+thSm4Axpf6C?=
 =?us-ascii?Q?aNeu7DrzcqJoZZMIJ7L2ocmcOuWgdW+C6dEathdBPXzgQ3a4tQDieQbfLbkj?=
 =?us-ascii?Q?FiPMlsPg8ZwuSROl18eWBoWkaIv1GW8MR86X18ITNd/kXLwiIxRSu08HFwcc?=
 =?us-ascii?Q?BkILpH5nY6mLSUm3C0Qs1AbAIiMB8rRlw+ep4VI0dp7FXQIIhu9V+5sF7w4z?=
 =?us-ascii?Q?enSWPXZ2ERBEbhwq+LQNU36jJJ7FGxnrJH3XggrhtjbKfoEhVqlYNUzDkc7O?=
 =?us-ascii?Q?j8ARb2QuYne1g7ujnMheib6KeFUbXUlSzmBeba2p91GP7G7MvCaFGkZ8QRHF?=
 =?us-ascii?Q?rj38XAvfu+j/VOzQHb9Pqt5i8Lra3HprBTVmOWMf2nC5Wpp7MKLccxIjotGL?=
 =?us-ascii?Q?OBkYqhfWmRdcCROuMAkxdEHUXElrJkWKKwzLJKq7qIjn+le2TCzpmD8URXVS?=
 =?us-ascii?Q?D3l332+npwW5oS3it9ZVubW4p6jk5AaBJYulRiDM8ef2upXI/i1SOKKEVu+1?=
 =?us-ascii?Q?vT/k/w2SHvCcmMC7UFZm1DnVJuxvFkB3W30zNm/8NNFwqAjhU8Qshq014u4p?=
 =?us-ascii?Q?yEhoOM0/A+6aeP1KaNM6XXxLFs0FHv9l4f/oU4ipE4sHNj7QhkqHUdC5CiUp?=
 =?us-ascii?Q?fKm9tpVRvdRZQ84B9vn8eY2ilGXYOwahfxsKSbGJBB9mdU88FaSQhEAnoHho?=
 =?us-ascii?Q?YVRPU6UDfM6f9/ZWF2NkqahNBekZcyeNQRfUL401+cJyYiWlUvKQlVx/7Isy?=
 =?us-ascii?Q?7ILzgYV5/MR3n8x9pxvtEtIU9TX0hzeegoMG6iRMz3k94w1IBd3MVOQbeD//?=
 =?us-ascii?Q?yCvB97lNg61KUfPpKy232LxGvl7Kcgspo/ZG/IFbruvbNPbEfRNeONOeljwy?=
 =?us-ascii?Q?TPbMST/iglDFk03aP+02bLtb17jneJhAKqD7DazVOI4xGwa7zHQu3wm6/jGH?=
 =?us-ascii?Q?xJyeJyckbB/Eczf/UWwxVFW2x021xAFYla7oEbJJnmrHAkG5XeiqZ6i2zc2Q?=
 =?us-ascii?Q?NNQyJXyUJk2ThQkvbj0AdnaT1sAACQOkOakbLnutmUiE3cI0G1ggusdk92fh?=
 =?us-ascii?Q?SvmnCvKn+QwPWEdO7ZbT3c2LZA7urSTv+IqsvuHdf9oyptWYPIX4EreF2+rW?=
 =?us-ascii?Q?U9DSxQ5ERCUixO3a7IzMcBxGmyx+rOYUJ8tewx1/Ron0f+OMn6ORbfGlqVj+?=
 =?us-ascii?Q?ncfp9jnaPiqQus9LK4MJQqg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca6f7d1-cea9-469e-f792-08da7936998f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:43.8984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ck++NpcXN6IHl1lQP9LUEmq+xw7+zPU/37gTVdBAZ1qaD6Eu0HsI5QHyjaRu4cB/OvCrfXZPUxSlO1kOErVOjpAL0o4D8S8zn/Be76F+14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.132;
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
 block/parallels.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..108aa907b8 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -413,6 +413,23 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (s->header_unclean) {
+        fprintf(stderr, "%s image was not closed correctly\n",
+                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+        res->corruptions++;
+        if (fix & BDRV_FIX_ERRORS) {
+            /* parallels_close will do the job right */
+            res->corruptions_fixed++;
+            s->header_unclean = false;
+        }
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -431,16 +448,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


