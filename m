Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB566B241
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PB-0001kv-Vv; Sun, 15 Jan 2023 10:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P6-0001gg-S9; Sun, 15 Jan 2023 10:58:41 -0500
Received: from mail-vi1eur04on2124.outbound.protection.outlook.com
 ([40.107.8.124] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P4-0001Ko-Rw; Sun, 15 Jan 2023 10:58:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLlLlwvrWGVkAehlX7RiFiqO7/m2rr2ysliv1WpwEVq2oYgO/4GwD5nw2Azhx5DoFhXAgLZdGn8/Vx7dd+jxFl6bp+OzMmLKf0PELzEMoC/pZLfMMZ2rOF1rbPbhOciXtqAgUaFXcxQsJHNax7XT7NKh8kd12hQaN3SfJeKpmqTRYOgqP9VuLVEKcRNrSc1oiTwzgB22P9aeI3z1yySg6QFO8xw4HQJ4kt1d2hGHrl3Z8MLtdAI1D382hyfignkeNpdRGUVh2u0hUywUdIRYkCE36Bd1r52itcKX2+kXEb9cNOVMua+QB3vQvXXcWdQvfltfJPgpaG2AVgvToyDH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnMw0iJk95r7t6BWG5x9Pl3zlvk9K+Ts1+f0QrmubT4=;
 b=eGbcVGQrnp8Hc7pfIqtvJqtEnhzotPdQXx7GtCL0cIQCIkM3LXbg+qmxF5mdfwybjzFE2d6Fg/wg6G1Wvm0ke7agS1gX/FMk1j9PXeKJPQy6HNMusUy1b+vC9bmO806ll6TNESbaU65RlEGPmVpYPARHabWdJquxCQvumIqB3zHkIIS6DJAF+7d3FFL+dG8NliW3w+ceJlUZZ3aYyFhX6sonrTZiFggiFdAe+QXT52Z5z5PM5DDksrOemRNGoR0oPBChpnQ4AJNFsFcrIsxghrlTbJm1F9dW1v6VUjr6wFi7S+4pDQKV5tX0ViV99d4hW4m5TCZDGmBClnXcUx1dIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnMw0iJk95r7t6BWG5x9Pl3zlvk9K+Ts1+f0QrmubT4=;
 b=NKpC83xE03/Nfla7rgyYFq0bczWmaFr+Bvx12aet5SrxX6gePDkhmRPh3EteCWIFh02LIlWtWsQABfdeZTfEQ0cTJPBc64RqCdUTQVJ/vUnXg8d66MqGEZ/aq4EjiiH4yRUHmwXGw4VHSbj6Sv/Pm5L/pmmuJutl5PbETvKJIuVLm3ymQumFQiTpSg2Oiu5IKIEesfVZ/e5Ej/O/rM7Z3NsBGL5XGzs+G8/wjZ3M3Ks3EcmTV5z/41RwN8yKPtLUmkjob51sleF0e/BU/9eEdpA0Y0MaO1kcsbbSUvgn29ykdAbZ8npwN8sQjxaDli5aQuYc71TBtkbRUTmMgyhtJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:29 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:29 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 01/11] parallels: Out of image offset in BAT leads to image
 inflation
Date: Sun, 15 Jan 2023 16:58:11 +0100
Message-Id: <20230115155821.1534598-2-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cd4919-cbe9-4dda-5725-08daf7115807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPOE943E55hOl3udQmITrNDQuXuDZdtN3qwSKoxjSC/T/5DOVJefOv0NgEfd/cYo9QY6md++Upz/lX//3YWxMOWfBoozflR+CxjhYB5Wd7T7KKJPH9YabBZ2WlVkUhgosNig/hWTtlck/L8YGhU0OkBI/hbCXVsrn0bmzjnQ024SkJpB1V4EsXxTkkFGZF2skP+HHTLEu1eBkGySqFMT29EfkX7dgTmiTyTMA1u47SuXWQs8Q2IWClnoIvUU/zWxTtEyM0oGv9qYaGkh77GpisufQg3e4NTp0lGwLosxZ5AfmLwB28Ea0du9z9oo7x92ZfOwrTBXHomW8N3qlk5hLm73C7LxmZ7FPhaLLNUiT1ZU5jUiChI7KvDr/IRq/2no+ShsM3zDg3WUJr1ZV9jQfCGyZaX0IxW8MEYpZhbb7RBML0ZGUJJYgvLq78KTWdQ0fAzsMmfD7qXX7ZNJZQEHgVCg1m0fO5N8SgafQyCK47JC6Rnw7KZaolDWKElJnmMtrAVakBW/ZjNySYp0G/kIsZlh12S/mfw7IbjwcCvRl0yL/OQ1aZCpKGpmQNm5zmRRTeDWsXCihPXhZb3mqmo+3uvDZPxQZe6EFBX5IXZQEBIsn5u5j5l7R+ii+7teOSP0oKm5V1rCM81Z3QB73K02SM2E6IYhuAo4MmZuYd1LBKSHHQLA5qK0iSO3qOM+zHFcEEYjFZvkzB52LHMOayhYPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(6486002)(44832011)(6666004)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsHe6jMHR19zIzfvQyE0pRPvBmPV31pAj03q3ToR24MRRjIhTsBmzITPMJjl?=
 =?us-ascii?Q?GR4DOhZYwejyeNrABkfYTlFVm6R99dIo/dDNd2qV0HBbBTiVhSWdzerCPWqT?=
 =?us-ascii?Q?ouO7qc4Iv5ZBjFQgrBdiYy3tnEUTX6pfrsNJbOzy1SbTwcBGtauq9g1bJp8K?=
 =?us-ascii?Q?2+4CNKTTec8Itv+6vrXcnUexjSuzS8HDHDng5eGOKJhH3ZkhkQgTHxObAvwC?=
 =?us-ascii?Q?9OisEqk1NP3XxamOi5qHWZzNensj1strcFG7phX8foG5ofIyVGJCMDlzCmJr?=
 =?us-ascii?Q?GvR1p6+ubwI2Qw4rM+M5QptZimIQTUXAPJZchMTJ52Z6vkQbnFJ6YiEQ3J3q?=
 =?us-ascii?Q?gl0qWmDMqvLscBuRC/vmprCKXwutK4z2mxIlXqBDm18X19jxsudewoV1xm59?=
 =?us-ascii?Q?lNJzvGgKnpTkscIaKajwfQO8C7473KuXJU6JS9uTjIDXYlLZWMaKQKFCT3MF?=
 =?us-ascii?Q?uz+E7FlH7NUAJY1vzLaNxs1f4ByTUZ2AXgpORyNZDAcJl5lAHaEEFeJdJ/30?=
 =?us-ascii?Q?ZwtSP6QfyWvUszmswwo0GPB/H6jyyvaDRg2856A5M2wiSbxYbQVb+CCoSNty?=
 =?us-ascii?Q?PNm9BQIiSc3rLv0nUAMsBfLXRZr2WapAv2u7CAql6KNDRXiBAwFId+ZADI6g?=
 =?us-ascii?Q?gh0fdsrtCfQQRrb3ne5eRhvBUAFz2kmuDDL9HpwjddoyIGQ69RSkXAUJ2Uqo?=
 =?us-ascii?Q?borUX3pa1yOu7Stu77DOr3GBhDzFofhHmKsqcW4dbsMiKq9Y3EZwrzP6tZpN?=
 =?us-ascii?Q?TepMt/JJwCPtOPInLd88O/+Dje27jm0y9VeHjw7uYV/PmHBFGDowuehcdB17?=
 =?us-ascii?Q?2ADEgvYTIyyqj0bsGCx5Qy7Bzn7e/tti4h0nA9JenrPaewmWHM8dLqpVRR3D?=
 =?us-ascii?Q?GgJd6F9gtq5rd6D/u8CSSt0Sfoea8rkD+FkRv96zMo0z1XG9cD3jzILvLvub?=
 =?us-ascii?Q?Hru6aHMikABzqK7tP9Q9D9QatHzNO/WMdUCA9K79CByZBjfCdQAsh/Yfnct6?=
 =?us-ascii?Q?PIPGbwJUAjhKxtvfOPUoQlEkYxKtFQ2hmjuP/NytHdQ4rw8Hy6iSo+y8wVYo?=
 =?us-ascii?Q?CoUzAWiNrWeh3LvRt5th7IypZl3On+b35/oR0m7IRdUat0yrq817vhrlbiPx?=
 =?us-ascii?Q?eQ6cBC222CuzoVwNq3RBAEEO6bYuVLmR/HWyLDlRagz1ptquHpBU+tRCXkrr?=
 =?us-ascii?Q?7lAkigVUl8F5GFGSYfsl9vtO5jqn9kUgvqblfjB7NSA6PmKIdU7JXv27gPcm?=
 =?us-ascii?Q?Ok1J2uBwdqCCxndE2cHSHEBa25KbiQJ+FKKlNhZfJ5yaZtOdf+R121WQLEAL?=
 =?us-ascii?Q?5Mtx83R/S+jLTvn5JCBH6goLPxH8Od14Vu/47NhSVXuVj6ytu1FHh4HhfpCy?=
 =?us-ascii?Q?qM5mPZll7HxohMCzkZO4jR4p4A/yu53AJlMyIovtCzU+0HU/LmgglEB0pmNy?=
 =?us-ascii?Q?Z8NLar5BBB6Q/SqzZvDlnDdxx4SmZXQiF7nXKEfd4kzVDkqUNpdspaBezrbO?=
 =?us-ascii?Q?1CfG2Ut5+NHbpHhjb6fcQeEDNHi/sa40Db9XROjpzeqwGOK3O95dZlxqU6h5?=
 =?us-ascii?Q?Gq8hRM1iqhhdBnL+sn/twwAMb3YPLsRDfG6CV7GeuZrzEDej+w60RZiVGF2D?=
 =?us-ascii?Q?zIfOV0ZryF4Ucj3DeJH3uHI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cd4919-cbe9-4dda-5725-08daf7115807
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:29.0977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtXfpxHMO/MCvi/pYGizf+gJ+Z4ldxD81wCVxP4qOHRaFZKyUaB9GbCMRN2xYU5jkqHkvDSaWOvnuxBsrKUqZXh4vGEweXCAaddscsaXBH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write
will create the cluster at this offset and/or the image will be truncated
to this offset on close. This is definitely not correct.
Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image).
Set data_end to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index bbea2f2221..4af68adc61 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        return -EINVAL;
+    }
+    file_size >>= BDRV_SECTOR_BITS;
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -805,6 +812,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_size) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off, i, file_size);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


