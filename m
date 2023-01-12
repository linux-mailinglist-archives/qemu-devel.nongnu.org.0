Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C336678C8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:14:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5o-0003w0-P8; Thu, 12 Jan 2023 10:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5n-0003vS-5K; Thu, 12 Jan 2023 10:02:11 -0500
Received: from mail-dbaeur03on2097.outbound.protection.outlook.com
 ([40.107.104.97] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5k-0007HH-Oc; Thu, 12 Jan 2023 10:02:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awH4Cpf7FMcUDtvNNaGnwsB5+o1W4Xrbth1HVXuNAPEWUFXpo64MEZEUA6/RHITpD0QsivuGhjAMFYjPxLFN+ZaeItPhEc2UJiI7FQgYMTBRD1L/u2o2SRDM1ZJWN7pSpl+ercJYDzhi8AHeCw3TnOnY0v6ZIMkXeKAS+yNgZclrw820LkelYcOB9CLoZ5vR0+reT6ZwhymGCCPTkDZuYzRTBV0gclbvRSppEe6w0KdQUpIOhFkJv2JQl19nsUa9/kRAVXXjGPpYORFNCgUS/ruZlm+Nc5FTJfjQSpKzsWabLUMpH5D4hKa5aXNBdf31Z1WQShAa2IT8tfRlMPHChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUElRbeHtsoooHuKbSdvtRsKlpc02IIkINX9kMA5WR4=;
 b=PQL+4epQtsYXgYBMJOWpDGSKLK0/xKX4BwowqFYTY1Vrq62CsIZZZduaGEwamOK02h8We+trk6RbZLdSKvf9qvCBYjXH3hG/uLYjidqqRKpgxrObe3QUE4r+dc1ox51PMbAi8bBdp+QdGx6amMBwtDmfL4MIGUa2OWGEf7+Y0niGwGNRvAssP9wghGr1dvUxwpYjAwdUfr+f8VrYktPM+TVxrrVCECoUgcZflsCkUZZa6J50ylOzbQ/Hsa06/7AsDIXHuElB0NYCQkxAkqW7M30hXa2m4eUdJ35PG/cTaKrMWVOk2KX2pvCrVe1Q5MRCJoo/6VkE8TGdpyzy00afAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUElRbeHtsoooHuKbSdvtRsKlpc02IIkINX9kMA5WR4=;
 b=O3CyimrW798cJU/KtXbOhhcpsXP3rpYkaWH4h7DSDVD9l4v2X/om2npP/L0wk31kG7M222XLrB3wXS+hTR5y/2PLJ5BvS3Ao3zDZFZEeQr37xnT4yRygWFD7dZSwEI0Wr9cB/vFsBVW9G0zSV2pJDxH/9kP+B0gAK/at/ZM+/6fJYedt0jEdlGe+1Etps445hPKGlNmoGfzjPZA1irFBA9+dboFTX5Eln4oSaPxeMezled/HnpHETTTDKBikgBgtsCR8WCL5jtIJmA5MbZDEV+YOCq67duXLoZeXimZvmSRUmYelCZPTOofBXDgQcOrEbEzqU5Xo+1NLd94+CfYatQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:02:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:02:00 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 5/5] parallels: Image repairing in parallels_open()
Date: Thu, 12 Jan 2023 16:01:49 +0100
Message-Id: <20230112150149.1452033-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d59225f-3637-44fc-ba92-08daf4adf4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7dETAtkr3UofOMd5TdDwfG4wTN0kYp1mNk6LTPDC1I44l7dxPhNGAwK6D7EupepkxKKw08xhCHL/Cv7PYmoUNH9jeb9W5KLjkQ+jMX8UxOr2OMVeWxt/eDZ2DRnp+QQigV1b8H2CeaTj8MENMs06ySyPcqTtPQn0bSFEfftepRF1mjIIUGeCBKJmL/rtOPib9R7Xl/HV7SS3/0EBQ0D/LKpewDWIoXpa3m1N1aiMXmSifmVQK4eSgfDm1ZhekIf3xZC7e9fnpxitqhM2/DJE5aa//6q6JbM5YSV6athpfCV1h6u1/nQKFFhnUE2lHnjCtm/Le7tNbep1i+/Sv1hKO5lZ7cbd9RhMbYszUA4OEY/aU0knxFsuD997QSpSMyr7t8l9SricU9uIbr4+fhPMt+wn8tpv4z3ISj05u/GOZJDiQfbSSBD8CQU7FEuTT1nVdyA7423FpK+cWi2GCilL4FQR47RVVFmi+UHyyUc/lKFOty9FdiXdlANpzaVXzWWAlCCLUz1pwK7scCvg/3frXFYWu7paxIoIEoBucfU9M7QhWsnFtMzv3wsvE3EmBn5uISuYfMf+8/IVYIgal1z1Nxv8FmK9pj7WyQQbLUlV9UmRLdBkxjC5JpOnSeT0yqhWN579tTKfHROyUL8Okt/PTXVtKqcF5V4d5t9fcEDa3FsK4p61zuzE3uPbJt4GmG1wKih/8kQTwwQxjihtP8Kpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7DIHQRnZ0tMexYVrS2kobsp5JhvWqq7hjBrLWFgU6Mdynr7Eirr3AtaBMAl?=
 =?us-ascii?Q?w0YKObDrPl4EMXM06Ltp6suedvfkkicsw4K3qpVpHlm3huJXDQz2KgkWhBFD?=
 =?us-ascii?Q?a5mRFPbuZKMCXHP8m79U9VMbstVnM2nK08UXKm6/WZ84/fhvJ3ammAX9gol1?=
 =?us-ascii?Q?YuMN6B7iHJFb6stTIdGBxpn2r8xVD3pQVpIxmrsJYzp5p6z4fLySXPtUZBWE?=
 =?us-ascii?Q?nyMJACMHxNjn4y9htPdZxeP9VzhYKeCieB8jY32ue7qlyoaYNpfXj143P74W?=
 =?us-ascii?Q?1Z51RnspJ3WvvJeDYDn/7cUf4We5RbJK0DDT66scNw1N8m6+Jnk0jOwJZ4+j?=
 =?us-ascii?Q?elldaTWAIQTUUK4UA9DvxjSZkw4I2DwsbM9/obSOoOgfJsf1YVCvEShrUipQ?=
 =?us-ascii?Q?//nxOpq2S9UupceDPdJBUKzRlrwX4PNFtUP5k7xlMQfGy33bqRxIpxz7JF9g?=
 =?us-ascii?Q?MORW/VV80CIMSufBp3VuUbhACtyXwcu2nLkzuz9cKZ71pWQ9UnrbEkSCT3v4?=
 =?us-ascii?Q?mpSqa/MS17KWSrDvoXtAg3LS884cxaWyK34quk5sn74RF/UyErlN1U6w2YDb?=
 =?us-ascii?Q?oi04m0mLL75EPQ9QJo+9Xi7zEjYVFqS694r8xLVJT+2noXOtJNSCtYz6KVJ8?=
 =?us-ascii?Q?tXr5C6zsAB1yxkdiZ+I2kcK+Mus/ULbkChT/UPesGFKdY2FvNfpP2/ozdPdk?=
 =?us-ascii?Q?F6WzZMyaJ22TvlhQb4ghwe+IMRrSEBZrzMoiBZ5M0QQ8uxHS36+QDijZAYsz?=
 =?us-ascii?Q?MshFdofJTYUAr38NMTNShtrwTu5ZGFIByWfBQR4pl2ry4Ui+VXKpFnGPxXi2?=
 =?us-ascii?Q?AYN58+ROkxvZ7dBVXOZNSkV/lEMsON3hv3QDdeHEng5BtTccQjp66yKfjplO?=
 =?us-ascii?Q?ZA1/Ow9uj1lRtevz+doPVzNSHDqECfBZ8siLWDYnnt6Sr5/V4t7IAJ9Uhd5+?=
 =?us-ascii?Q?BUsvFCYRZpltP5yk23OhybIjOZ0D1dzW0Jo3FEE0w5I0L33AIRNVtRt3iOAB?=
 =?us-ascii?Q?47p8wri9YhSR90XRQOsNQn23+511BcVSH9x53BUDLvjo1u/Adwni6J+VcL6s?=
 =?us-ascii?Q?t30A8r9Selwv4W0xRC/2ziw1NsDaw/1HNRr7sWaHQWoWBSKdvtDkvAKgR5TP?=
 =?us-ascii?Q?pNqVWKWVrkCRHQGWug62Av2b0RLuE1LGBWGwhMvEtGqQsONnT6YTsMXmM8aM?=
 =?us-ascii?Q?SyR3AFlxUlN4BNRrXH6RdeFAhPYMDUZ9oWJxJuPl87NuA+3nWobEkdKK3tGe?=
 =?us-ascii?Q?RhoVuUBxGL3BOX7rcpeRHOlOqPhkssOxXNz/oQzFWanZGWnYI+KUQnANOPKz?=
 =?us-ascii?Q?QkhEOXxgM6OwyGQeENw6wLHJv1OVp+0JrnsSPTVZTrbFN4fCbP7vfhvGVwW/?=
 =?us-ascii?Q?8kbsdisclhvT4ob1P0ls8RgQNZURedPal4/twm75OkE0y/tnedn4/YS2fOb7?=
 =?us-ascii?Q?wmVLQewDEzZXpNU6nB4HzXfuf+DbpUQYyrY1sgVqeJJwyAuertDKHyRyqNbv?=
 =?us-ascii?Q?007eqAqHwWhynWDxZbuttDV306Jb0gRJ626JCQjcvx5yruZ5Nhi/Wu9iK9Xp?=
 =?us-ascii?Q?PxkzJUS6LXjZZn089hGtjEm4h37MvyARQXg020On6iOkBk8Y+U6++IJLL1Cu?=
 =?us-ascii?Q?oKkoKKpfddj+rkLkxqCvPnI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d59225f-3637-44fc-ba92-08daf4adf4ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:02:00.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xOj0HB97dxUni2oBE6vBHCYwN8lpoeppjYEIqlgAQf2jN1BbePN4GDJGCUKvLJyStPLNlaflFdq59WrDX5reXwRqhfSAFlIbtKEYCQ/uDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.104.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Repair an image at opening if the image is unclean or out-of-image
corruption was detected.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 67 +++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 5c9568f197..74f6d00ffb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -753,7 +753,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     return ret;
 }
 
-
 static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
                                             Error **errp)
 {
@@ -965,8 +964,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
-    int ret, size, i;
-    int64_t file_size;
+    int ret, size;
+    int64_t file_size, high_off;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -1044,34 +1043,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->bat_bitmap = (uint32_t *)(s->header + 1);
 
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i);
-        if (off >= file_size) {
-            if (flags & BDRV_O_CHECK) {
-                continue;
-            }
-            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
-                       "is larger than file size (%" PRIi64 ")",
-                       off, i, file_size);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (off >= s->data_end) {
-            s->data_end = off + s->tracks;
-        }
-    }
-
-    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
-        /* Image was not closed correctly. The check is mandatory */
-        s->header_unclean = true;
-        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
-            error_setg(errp, "parallels: Image was not closed correctly; "
-                       "cannot be opened read/write");
-            ret = -EACCES;
-            goto fail;
-        }
-    }
-
     opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
     if (!opts) {
         goto fail_options;
@@ -1133,7 +1104,41 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         error_free(s->migration_blocker);
         goto fail;
     }
+
     qemu_co_mutex_init(&s->lock);
+
+    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
+        s->header_unclean = true;
+    }
+
+    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
+    if (high_off >= s->data_end) {
+        s->data_end = high_off + s->tracks;
+    }
+
+    /*
+     * We don't repair the image here if it is opened for checks and
+     * shouldn't change the image if BDRV_O_RDWR or BDRV_O_INACTIVE
+     * flag is present.
+     */
+    if ((flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) || !(flags & BDRV_O_RDWR)) {
+        return 0;
+    }
+
+    /*
+     * Repair the image if it's dirty or
+     * out-of-image corruption was detected.
+     */
+    if (s->data_end > file_size || s->header_unclean) {
+        BdrvCheckResult res;
+        ret = bdrv_check(bs, &res, BDRV_FIX_ERRORS | BDRV_FIX_LEAKS);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "Could not repair corrupted image");
+            goto fail;
+        }
+    }
+
     return 0;
 
 fail_format:
-- 
2.34.1


