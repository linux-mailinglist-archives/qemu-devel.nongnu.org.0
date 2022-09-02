Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796185AAB17
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:15:21 +0200 (CEST)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2lk-0006bI-4p
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2Qg-0000el-I8; Fri, 02 Sep 2022 04:53:38 -0400
Received: from mail-am7eur03on2106.outbound.protection.outlook.com
 ([40.107.105.106]:6145 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2Qf-0006Uk-0Y; Fri, 02 Sep 2022 04:53:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+pWugWu4xTw4+FpriLmaJ7J8nJFDDjrA/TRH+o0N5kLgJpBAsmKCELH0WtAJccT1Ai/fPv9KwbRwHHi4TgkCSEbIQJnNRTFdJVG0EEWkzHAyO3PXH8w8Sp5WP7SGecFiqxg97fnyYB3Q7J7I8A2YUu7QVneBpztlPEhOyHCRRYaRZAE8drT+RkcLgOSg/dHS6UzdM8dHedvqLJ6EbOcCKkclSK7v0RkqSQzQuQw5KFyhv3XlLacu1QIw79FK7cVHnlzdYnzjYacHJGfD8EQIAIkjeyy7g9xP2jIFC/S9W2fpVqx6ljDgEDpyUYN0p8ni21x1299Yal5H6yWJrhxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y7otRIl6bti4vi84MYgqEA9oZlJpRmsQhOklD3sLOI=;
 b=e8/gTD+ZwI4siu+nodsDZuWwLf3rM5b+pDsQWn8D7u5HHu9p/hwYYoT3rLi2PmrZBRubaca7VJ5dkHFkcdUCOLMKibShEW+72imtnVaG1EVb1tFHHxOlV9aC/ILUjqGhLKJk2+YwBoKMBOeqwcaQMnzeL2O8Ahu0TXObQ7BP9OXrZz8Amft7xKX0gGL6jb4kt6kBVdcJHxYeAmaS3h3GRqQbHFSO48socppCWaH/bgTtrZJg2RT8zhT059yL2nDrQJA1CIyG1lkDpuaZIdk/Z2X0/k0RP6cMHgo/mQi7P0YX0C4Aq+aJCxlwTtI5Ad3Kc/w0NDEVip8fc5IRXTmIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y7otRIl6bti4vi84MYgqEA9oZlJpRmsQhOklD3sLOI=;
 b=JhTYbLL8uu84Opc2AUMAclQvZJh407fKJOJt8Dg4Ld4w1AMjD2o83uZE4xjftv6X22TrjoWurV6A4mEFli5YHwHLKokeOMNi742j4x4AKK5+rqeKHLfMGEeURQg2rNqKvsmr2iPUQXMGD5NRj2e8g21tkuKm+mRPUnzCQsos6FE74vCds/QTBjihQjgz067V8vAKmIekzoK2pU27LATsnx0IF+7efeE1AgEBlgmFaBGaY3VR5OvMLG1pit0HeByT7yLTTBODkXVZfyMuLqBCjDXKQnvM8GSQPCEtRZAxpeRh+M6OBZvxMNjxvW7rR60rn2DgLoWP/mz54QtE+a+/bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:12 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:12 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 5/6] parallels: Replace fprintf by qemu_log
Date: Fri,  2 Sep 2022 10:52:59 +0200
Message-Id: <20220902085300.508078-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af215f82-ecb7-42db-d23c-08da8cc09168
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjyzXwIYrOZPyDCMGKym0nFVgTZbazRGvlkBJsW56NwLqpWuE1WSRVSpBMgqXyirqXiBR38CQH2mlgFwZP/K0qRfQgB7PvwHgpBrrozbqYG4SC0hSo9GQ9VcwCl05qEJFvGgIqd9jT7/xIPRhjicIkf/NCyiVVb0x2wn6A02EMyVSZNSqTJcaBNINiJ17h7CTq0JMduLTGbXC3c7T5NkQTst6q1WxQqPc7ocA8tz5arA2H51qGMiZKf/JfVWuRZ8JBgcWtFOyRnmy4K8gezQMk5TTbdEfFhv631jqeoA0OXLCXDHa6gxsh2cyzhU7ZDg8ZI+3yV15rMtEZpUTOxuT5jdij5o5ygVBwKyzE+z/QhM150Qc7xDnG3ThqmderXn5pO10n8yGwVCGRFtSIIGDdfn79HVvyUD4InlPVWxrHOpSrjfaUXnJU7cWoMoyJkqcx2JIpXPGg4T85y/rRPUSqVXeiR7zUpgjpfUXvXuhP8XziTTuEQ/HyjblmlfFBN7JmFHrG5HgB+XPFszhcjnbyB1DMWjildgW9S26o9YSjSNYR+aFZ9H7I1wL0h6aX9HQF60LtsKpOBYa+BDEpgdO9e2B+q6wsstCIqu3I2REItu0/UBghrNMk7BWju+2E3zTRB71glKzOEy/41PHgy+RFimEawH3ifIKvzjkYVzpYaQAFFTR/R5DXwQ+Te45gCaiigrZXolmBXTV0SJdCC1x/MJqlDw5b6eT4KmQz5goabz1tu8Eim9H+MztL5VpNyc4ROfgv6O8Q4C97Kq6B80Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3AOh0Gf4TmHQzL5VJPxy++TETj8512sp1B9lT2Bmf4L3gSu5A39UQW+sw6Xn?=
 =?us-ascii?Q?X75/4Ax8cfxQN3RnZzqNKC6sIpcJKVji0emQdqBac4zJ+i0RHfwxAIhkr7tp?=
 =?us-ascii?Q?iyYqiTsocGy34NNPKMa9PWw/WT1bb3VOTqRkdzV5L0psjx3dG/fQryfBSRkt?=
 =?us-ascii?Q?rp2Lii0Ynz/icwN6M/K0879K4M00BrDVxoZbd7GxrGSpg3QZSH4f7KdAqo9E?=
 =?us-ascii?Q?EB3xGTt4HskuE9cx0dbIl6yEHXyP9pG1rmRJgCCK70caf/PQRpfuxEBkmIXD?=
 =?us-ascii?Q?dM4ZGz8rYkWY63/CgcvlWK2OlBlShh5j7oUcWtdVvcH4kaiuInUcBi95BtZO?=
 =?us-ascii?Q?BjK65Hy9PqT+pjzCw49r5eds33kBgbF367oG8aFBMKi1xX527I2miDKPMfAm?=
 =?us-ascii?Q?88wziV0ZHRF/+wQlVOjb8c6Bnw4co0ygJaT6RxQAajJPFL1h06DcT+B9A3T2?=
 =?us-ascii?Q?HuNq6FBiymkXdZoNJq0uf10PoIDY93VT09bdEpny8Edf8mUJuDWi84/RsN+U?=
 =?us-ascii?Q?nNNwQoU6jEKsCzVHICCFtPuHf6auzOlKD7dzy3S8+viL+6wuaT3En+w85rha?=
 =?us-ascii?Q?kJ1xvo7C9aGGfbXbHpe6U1+sSjv4ucsPiGh3XUqst5tV8gss/4T82NcuMOX0?=
 =?us-ascii?Q?RXt5jC3Cspp5qVKPmgf4Lqlr+6ZZEzZiDNGusBuwqzHfe6oBwaV+4gf1GaVF?=
 =?us-ascii?Q?iFHIWdUvX20pc1Vd0g5ZXWWyrIEEL8+DFsTt2cyqRx+BtEcmuxAxWcq8JbrK?=
 =?us-ascii?Q?24tdV3N6ZSLtggeCSlpZQXk4hCGq4WsvXnbXb/8zncGx2fXempN44UorlTTr?=
 =?us-ascii?Q?BovzsQE3+56rXyl0mKLOiiY5P+MNaHqvvysn17ktxPUlF2ju3l4HxA4Qo9Ze?=
 =?us-ascii?Q?LYkpp0tSCklQoU0WfESJiYXTRFGUuVRAZg0yNdZcFoH1o4J77hiGNm4+jBMZ?=
 =?us-ascii?Q?0F+cr8kY4kPlMSnu4nUVVITNnuYusi6C5VjyxTtFIJYL1PppSPaF7zt5OZym?=
 =?us-ascii?Q?CsestrfpFyMaFc8eQBiFpe32hMuDN/JjgJ55IV39c8nUJUvy5x29urWRUgCL?=
 =?us-ascii?Q?GauUMflkWYfn0lUFAjxNl0nPC6fslavmxXKIOfbuLjQIwrM0SsvSNXki9KPI?=
 =?us-ascii?Q?P/YVjns0xUgRTaitpJTi4yFKwRUKdZs77lJc230kh06glMkDIkNcpT58IzLe?=
 =?us-ascii?Q?jDiZBdKoFdgZwCntlbnVpG/EzJXoMh7uqIDA6dIA6YIYPccX307A2TQrb+f4?=
 =?us-ascii?Q?2Bqx0qL5oN4ZHwuWc/a+OAXiXmQoyc6UL8CnTgD5bXLghzBPxxrL/zgSkTa8?=
 =?us-ascii?Q?38oTEHMhjkaNA/huNhB3jHICSmRixsh9El3WLRf7LgDR9sxEs5sxHLtM92hO?=
 =?us-ascii?Q?XGhRNhPZfRFfESR+jIaTnZUOercV6MP8lM9iL4+3J4rAT5uVUKchTAu9TrhK?=
 =?us-ascii?Q?3BiuSEz4QsR7Th01PBUp2V1Wv0rTQTK1s49d4lSBXnXkIMcGobwUhCE+UZys?=
 =?us-ascii?Q?CfztYXy+/0UbgzXVTwU0RoZIDf8hV/LwcufS2akui6XXFXVwyXhfUj+Ku3NJ?=
 =?us-ascii?Q?H5CwnA8Ulo+rzxF2hIRTjDexAIhABJZ6SwtsLaxxGDVLF+sZyOaJWCva2T8S?=
 =?us-ascii?Q?wtKKiNIVxKNlO5vp4RsOB5U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af215f82-ecb7-42db-d23c-08da8cc09168
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:12.8146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmXAATpNFCOe7C453OWNOCTspxwmJ7+Yr5rtcXKWPBrA2m4+gxcGhqujF0OEgp6z0X0l/7K1PScApC8X1fipa4Mp3ZngPhhNzfru+vR7p/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.105.106;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use a standard QEMU function for logging.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 688aa081e2..08526196da 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -42,6 +42,7 @@
 #include "qemu/bswap.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
+#include "qemu/log-for-trace.h"
 #include "migration/blocker.h"
 #include "parallels.h"
 
@@ -448,7 +449,7 @@ static void parallels_check_unclean(BlockDriverState *bs,
         return;
     }
 
-    fprintf(stderr, "%s image was not closed correctly\n",
+    qemu_log("%s image was not closed correctly\n",
             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
     res->corruptions++;
     if (fix & BDRV_FIX_ERRORS) {
@@ -476,7 +477,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off >= size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
+            qemu_log("%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
@@ -549,7 +550,7 @@ static int parallels_check_leak(BlockDriverState *bs,
     }
 
     count = DIV_ROUND_UP(cut_out, s->cluster_size);
-    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", cut_out);
 
     res->leaks += count;
@@ -600,8 +601,7 @@ static int parallels_check_duplicate(BlockDriverState *bs,
         cluster_index = host_cluster_index(s, off);
         if (test_bit(cluster_index, bitmap)) {
             /* this cluster duplicates another one */
-            fprintf(stderr,
-                    "%s duplicate offset in BAT entry %u\n",
+            qemu_log("%s duplicate offset in BAT entry %u\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
 
             res->corruptions++;
-- 
2.34.1


