Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D266B23F
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PB-0001k7-B8; Sun, 15 Jan 2023 10:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P8-0001hk-GA; Sun, 15 Jan 2023 10:58:42 -0500
Received: from mail-db3eur04on2121.outbound.protection.outlook.com
 ([40.107.6.121] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P7-0001LB-0J; Sun, 15 Jan 2023 10:58:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4woVqtbF4LGoI+7IzH5ejLaMaVfQzAF92PBCPy4nqrk8fWB1ou7PdX2e+H8WzgKlTotPNeYQkJ1l9tKAXqyH5TgdKCNRgTG8D0JO8uFpf1KT5H3cR9tUhSmpz2pBr7IDnbdqhRy8giuj21yPRXfO/qaKZqjhGcZhB9mnRGHrfkoM4oKB0CaK9ZjnGtCtuRvtM+0/NJEfLlwTYXI3EA61l1SIXDbsgR/U8Ly11fcxX4MTszsVcmbMPAxRrgVgYKQfA7rXjqRhCjCTT5OFpDncnNtSgSuM77Gp7Nw7vTRFOAXrYspetOp+KZgLRxHXJszFV7df5MQqJPjIrGx0sRJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDgKa7HuKyvAhu5FpswFKxZlrg/HxXRtNCC2Jn0YsBc=;
 b=MQAWsQn3W+xCfQuFQknnEkj8CeZWx/vY1K44oL0VhEnOC6p6JU4k/UhOqOuZJEB45teeiYBuwqDH6yMa4uuQRJFUFqmvpRgTqUEAw26xVjwl5kudfVibgAmsYu3cu2S+qKUhck6cdv72vug0iijmWfUBLHGnST1OEzJacHKm+eE+UK5z9zAvqpK502ZwlwTh+NMoGEipAI9W2C310eKUvVDALsAc8bigsyBrVbJBlMjhQnDEMNFdQZdep3qBO5/DFHSfJrPRk2SkT26dDC5QtsXNE8Lq8DG502aVUrfA/ZOwGkPmKXl3KvgXT10OUS12YTIGxgbDlS9LG6G1SuAaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgKa7HuKyvAhu5FpswFKxZlrg/HxXRtNCC2Jn0YsBc=;
 b=UR0uJKr+W66LzNSkrn+ljdFEHIHkiWgMZsMwiiMj8jvpfalJE2RO75aUvDMffHVoIkO2AaQWqCuhsjDsLLhQvOOfa+ZYGgByLe/wNP7RBDxiozVS7BS4sQ0lBIh8AayvMyFBvB2pir38sYIpMYEkcsmcCv+XE5yApimrtt4zWPPnRBQVe0KKrsz789i5/sLFn8TeFBQ7wD96ZzBN6uh23FN+tTCUWLHgPIATmeC//FR/lmDYBOHWAkHxrbdISW5IkFHgxeOWDvApWcBkLe47RARmxpuQYu8p+SVLTUs5GS2oOovmkDwvPPCIPKSQOB29iVbk1r/UFGdILD/FMyQsSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 10/11] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Sun, 15 Jan 2023 16:58:20 +0100
Message-Id: <20230115155821.1534598-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaa305f-8d99-4c4d-0948-08daf7115b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZpIQbhcy1tpjuL1hx/aS1cebkp2FMt7maZv8wegKg56AucFJ5bAyLLxkG1reukLZS0kNC4KVne2GExdGmz1n6XbdoK2stsyxcJEA9FF7Wpjpcao6jOZhrama7DWkkyJpuF8D61s/gaLW2dTMGAOorUD0Or3KQZ5FcGbXwnd9fy9jGNdMrmexAI5hEMw1afDakk4GWst1nihuwiXAS7hAYnrJX4KddB9r2HOjpboutoWX5A0CqcDOYSamwtoHdDkTsXCV7Gb8TYozm8qcNRKMbipPev48ooSvsHwae3MhS8uKfr25Qa93NP2NAsQoPHI2dTMtavZSckYQx3EIzsvQXfEIui6w7RmfoqkOLQ/K5ZHM76AV5V6KvJJp1fk6qOfBp3WXMHvgv8LUYc+BnLhnf7Tb2LPIOuW3p/VEhFX6PlPf14Xud2FRnAJicSvdoQk1QY9jdadpElo5SKwK0uf4Pj+cGwb2HiKc5n+oZJ5dAxc7q5K3mLTXDIvdvnB2V16WwfIgWUHLlrW7x7ONXQux1tZPXX6bbg9xuy8PNKLuHk2LoxpdsxHKIBjjyfefZnmtE/q97ccQtvIyYoMH8hfCuojHMKeDF8zy3HKv54Sua14mCABY/sKzCPr5Hi9C55xjYgMUMxoAFefkPw0TQ4V7MWsp+O9ck5ecO6CG3ODnsfjPfPtgkAEk2Fduw2/q19AnJLPf8s+Bbib4iR5lCrDng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T3saCQQOfS+tBioYXpl7Ta5nFnKMxQm4GsCNoIAawGRKLNpI8g09JL8V2XBg?=
 =?us-ascii?Q?2FxFemI2xllLc7EcGxvPBBugVHylXIxm2LBgyqgJ7UChtnhmbMhyLS8TkTKy?=
 =?us-ascii?Q?mFLsGTz2qrjPNpdCcl03HfpB3GgSukvlouVP8Mx7Pbp4KBvRCqx1WbhbDDij?=
 =?us-ascii?Q?QQhQvfxeG6WCLHf5ZGfY7y4qkANt6BAZe0oMEwGMHyMcOhaFtAsFNbvntwia?=
 =?us-ascii?Q?E4EmTJ3pfj+DJI42zD1ceKYF4XFcooB3EQXlKVFVr437k1QFNibJLIHH9xiz?=
 =?us-ascii?Q?p6xXqkcWruj78XHbiqbG8JOpqDD+9uhWCARg3z7Ud15XJIU6ec2qmb1rzJQS?=
 =?us-ascii?Q?j7DqazvfUqTueRrUZv2HjKxmBm/Iw+i7SwidUUJvHnA2XIdRRy+UrDdgt6xY?=
 =?us-ascii?Q?fWLJChAqXQV8naav+VVDsopebcYZryrXg1v57Lq8DrPSGpluTQ4Isb3QRvPW?=
 =?us-ascii?Q?DFtzeDgT+V//y9+ZXkfXXgj9LVtDdr0+4rg5/FC0QGZK4HSQNkSUVrgba0Ef?=
 =?us-ascii?Q?HGns6F1aXfbmpPQytbusqv4foJA/ZBOUQsh4i/Pkhzcpvfk5QNjgYUrHW1go?=
 =?us-ascii?Q?MHJAlxDjTLjacrxbeoq4SARlcu3HN4AS/ZuZXYvDkNut3AbgcdPoxwT8VKJi?=
 =?us-ascii?Q?NY2Pvfd1jaeEAPQYD2Lgv9Isetk+ZpgRLCVljPIajMRNRc84opksVWOLVXGp?=
 =?us-ascii?Q?iZX3j0rYPzKVpYeQHxOiRd7QOJ4DWEaBY67y7CgqQ2uGfLfkuKWvzciOHFJU?=
 =?us-ascii?Q?ksHW0Wy9JcFFCOH9oEbNGOHz6FfKPDG3ZzME8vuOLlk6zle7orOQ+BHLc1L5?=
 =?us-ascii?Q?PH1wbUfwQvz1e46nrFEMd6AExTIaizeS3c7smVZk2cJgg4j3cvUAcVXzvw+w?=
 =?us-ascii?Q?iBL5e9Xx05bJ93tegU8FyP6UiMIhVjJDfgNFARVqfTRkHQzVyrUOxwspcJxM?=
 =?us-ascii?Q?vj1VvRDCK2GpenqQP/o3Asdu5z2yGoq/ZKuijJGtnd52Wsb90fM/0gf8agUu?=
 =?us-ascii?Q?CDZk1sDy/d5XvIKHmJxpcglPVXgtokSgQARYTR4qVWLgpA8aihexMx0gMHTE?=
 =?us-ascii?Q?O7Dirbp9htej08AAiT0jhHwEJX2/NPmyrYRxtXS7UaSz63Jgeb9aNLFPkL4Q?=
 =?us-ascii?Q?Zp/AQS0gFrhiah11sTGsz2RNUKtRfIyKw7FpVzg/EwIUN0p1vbnFdB4qXa5i?=
 =?us-ascii?Q?GX4Ln/BK8XF3jxmkVLcHpOxnmfOJuw0F18xG+8V6Og0tOpgONpT4DXfoYm6f?=
 =?us-ascii?Q?kv3TKjvYffKoCoQx5aJ2+Z4ZFQmq2cA1VWHOHXfVGMt/X8q7fcj6+mU3lpuL?=
 =?us-ascii?Q?yLGuMP3xuGQ/DJwnWFUmA0Yevq+ly9XoB3zfdqJ+HPkC/A50LkrP/qWe+Vrd?=
 =?us-ascii?Q?k9ugqMSKfITx/nYImcAZ89ipMM5qeIkLAF5SjKsHRBVGNjaI8JYo7TpQTyvP?=
 =?us-ascii?Q?BlzWO0qwgn4YLrjoYCPZL4F44T/5qsmDDsCwTsG2tibRmJD65qcx9crA2i5m?=
 =?us-ascii?Q?FTnpn7YvsQo0ldoI232Z/AbSJ/ECl6a94+QuOjOCLRq0QPJYLbTh/Y9WeGNe?=
 =?us-ascii?Q?ujIwiVl1hFs5mj70LqmEnEg3smp2/OMBfsGLnIR9n1xgQ3x4DHgpZcXJq21n?=
 =?us-ascii?Q?X/BpVGmDuC3ZpqWe6Nh/b/M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaa305f-8d99-4c4d-0948-08daf7115b51
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:34.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuqMxweHmOvfc62H9Fn7fLflAsaWBGvQcpHiTUa0z4EH4seiRJql1WJn3CeGEr5apoUutdldxim20K12dw+ivp8chKsvgIji/2Q1F7I2UB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6e7f140e06..621dbf623a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -561,30 +561,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


