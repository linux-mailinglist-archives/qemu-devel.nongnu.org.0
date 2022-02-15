Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F44B6CB9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:52:00 +0100 (CET)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxJG-0003vO-MQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nJxGF-00031Q-My; Tue, 15 Feb 2022 07:48:53 -0500
Received: from [2a01:111:f400:fe1e::72f] (port=7399
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nJxGA-0007u5-TK; Tue, 15 Feb 2022 07:48:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uduq4PtchdSopNR5OIJfe1PkKCJe6Z+g3kXZfpBOT0SdozLgSIJRmdNjHtAc0WBU1jmT2BM3e49mv8h8FsEX4fF9PuaGTVy03Tu8Z/T5CeGh1qZNWaGphIyQOswJVRizASNCYKGdclw7wzqo1Fx0VuI0JLQ1MALP7GVyfwCa5VBWoIuCbaqOijqWY3pTVv/6ceL/1au1Msndz2uNI1evU6wmB+5vnLDGv8I2sZ3CRYE7izkO5mKwvp8OnWn1xJH9AoS2oIB1MYR72aPJcS6JFBBpmqcXihcnqvUl3mEuAcsg3Su4fR5JCl1qsqiWyz4vSwhFdBlmBpHc3G23eb2aYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeM2D1hU8jH57sJjhGUTO9Rjf91kxJPnVA7XNNxa5MY=;
 b=CkHeG/pvx+4y7pm7lN06tp4qArKUxUkdBksC5MfmJhxVQGxNAGnpBC0MaoJsRy5doo1ZJYdHcJsqedGxz0t2hK+YGEGti8+PZWahlwpoFHxEj8yfnrrLBa+waoO5ZttXt/o21KLELvmglib3fEAHVRm10n2A3gdsiH6+YtxwF/QVLO3vQKYh3SOW0+SPABxzIjZG9EVs65xvoYR1DJ4Wc/6wNC0aYP7Xohyo9q5tXL0/LvfdeR9dd9Emx9GMok5z8daNKuN0m9ol6u7S6bG5gOUmjKXb+pMGizAA9mFWeX9YVP4CAeKTsr4AfSvbXmM1w2serECASktVy2b7FnchAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeM2D1hU8jH57sJjhGUTO9Rjf91kxJPnVA7XNNxa5MY=;
 b=Omz37Y8wQHFEIOzB7PKpgYpIe8G3X9kqy2gKcpZ3up2n0rh8hTggLUOtGfEWs9eWoRxrrz2e31DbXtpqL/0dklqhe1yEtwEj0NDLMjHSJGuKnXxH4snMZiMiT0ufF/6N+T9nFsPve0Q4IoIdC3SN1u+iFwJ3JvJHRO0jyMlFABg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3727.eurprd08.prod.outlook.com (2603:10a6:803:b7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 12:16:18 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 12:16:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com,
 "Denis V . Lunev" <den@openvz.org>
Subject: [PATCH] block: fix preallocate filter: don't do unaligned preallocate
 requests
Date: Tue, 15 Feb 2022 13:16:09 +0100
Message-Id: <20220215121609.38570-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0019.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198995d9-c739-4340-bb77-08d9f07cf86c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3727:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3727A5192FF99B2BE49F0B0AC1349@VI1PR08MB3727.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNFoyHqJadbJdQEoT7g3efqnJZ7durKzeNhntxyT+HfFU0UTmCk3o2v4d52sZqouTPNJpoCm6CdIptmNfg2lKJyGLt0xzy7yzflpVhyOwupj57DaeQeCZEY9vlvgmBEeGyvMkys+q5HxZU4YygYKpi56E5EEdT38XLcO8Yuo+6KY6y1Hu3MOSWaTzhTNIUHI0W9QPfSSOlybHayXVtUZpQeAyAZxWhI1cZAqZyzVslbIQ6t7xT20O0MbKD8TESpIpjfArNzamb0QdWI4jV+d43jqmHjd8alqf7A6VYa6xrDsprfTn2FwpENVFwKbtWQxXRsGUvNqqZUSHEK+x9ojCpOrY8PnWRf7Kd+kHVOhCIYkCUCDWEAYB2qTdBcVjI3LLsT87jUCmSSva31MsQC107QvcEq4OUc5lw8czNGHLNqCtEyYYBaSjgZB4Z8I4JLclLVAghN0jghbfj/Y46xirVLCCnnDhe3mYkLZOkzGe8rM/jakN1ydFm6jQNwADd3zaBbBuGO2GYoHS0k8DKeRuqPTcoubesjeqmla+z6DFU6zHGnZvV1jVGYRnAp8vpkxly7DRRcOGr3x61i5VfQnsouOGEX4/UqGNNm1fDe4XbWptexqW2sIpJFJaqefwvPG/dYG/EfzHZV/zrEfv+iQtAOhIVN7lBnJ7m/3B2VrTySMO9Tqov2EGO9f6/SfBWFNvEboFN7ZIoVJ5IlaoUGjUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(52116002)(6506007)(8936002)(6916009)(66476007)(66946007)(66556008)(316002)(86362001)(6666004)(8676002)(4326008)(83380400001)(107886003)(38100700002)(38350700002)(2616005)(6512007)(1076003)(26005)(186003)(5660300002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2gxBMrdu4U1C1K5Y5lm5Zdx/9Nbj5tjU2OOM1663+2vr4mHhvf9hmpAQQi/?=
 =?us-ascii?Q?qnkkuy/iVuLO11JPA0oUM5UJU86w4s38GCaF96OPTNp2yPnwgKtLXtvhSr5l?=
 =?us-ascii?Q?xHMJ+Ygn7gM4rRQcQKr+3QGbyCoUy5xSBRY6/uHFH1xfQBI0NZCwjN9IzfC1?=
 =?us-ascii?Q?86KpNr5YKjpWRQ+rz23E69ajKuogxORX6yc0jWWUemgtMkXGK5f7PqmHrBE7?=
 =?us-ascii?Q?1GFrRKCLw/o4yTN89WagFCtMPp5tJZG5jAENoLmv1spuvVYwVxQ6/3Yh9N8N?=
 =?us-ascii?Q?ZZHbtNbTfEx8mqGSyYL6jicgM960V01T+xoDBKTHgOPKYdIzh58BWZrouOpU?=
 =?us-ascii?Q?OvUe+cUlYQDWAILJZAWKFol/nM6GbOcedpSqt42qHAqOHddXpUpKXgm8wVxb?=
 =?us-ascii?Q?TlxfYYopGE/9q2Eg91qeWt/9rzlbjgUt21tYXCVuJbUkXld7tpu0H6kiEWvk?=
 =?us-ascii?Q?prt7Lgzmg6YHWAOOtaCdhy00WqADolPdVHxrOn5Po+867YKiHw7MFs3t0qU8?=
 =?us-ascii?Q?hXaxUt0aLv2+3F3nsyjv3CkOW3jbQ6YhrdluCR1/iFihrlm+noIMIRO7A4ic?=
 =?us-ascii?Q?txoQj/DL5VfkimEOG0u/C5gN4fTl8x7WXBESaz4ec1bmaIIWNjxrQoyTHSFA?=
 =?us-ascii?Q?bGAUDurxdqTO0MGB9BC/bmZrhE0gGZlEVFQr9CAooNcH/eKJEPzv9gX7P33c?=
 =?us-ascii?Q?/i1NurkFC3i6G/y8vag1nlD5+HhI08xIgq644i37RU/q88hq7KLI1ZX01GlT?=
 =?us-ascii?Q?U4JhYNU5t/zAJFWpGqes6B4GnaK7NXxKPshBkpf9naF9+9F36wOnHKJz4A5s?=
 =?us-ascii?Q?vk5Bt/QtoBKhiIImMKSDQvrqk66uFTmJy21kfJV2EY5OkjBST8Mu64PIo0p5?=
 =?us-ascii?Q?areSI5c6Q9jRFEI79aoqzjAnqYFQ22SH2L7NAnxjT19bHNJl47fbUgkdd66x?=
 =?us-ascii?Q?O7cqJDdn77RcSaXhQLruy4U48BniyrDcA7/jbuTSfeW93rXvAHSeNY7RTwPP?=
 =?us-ascii?Q?Ct9zvaAF0NV+aitHQNr7Neqm2Hi2jWDWZP+SsvTEc5fdFH3KvZW/l6pg2Lyv?=
 =?us-ascii?Q?hgKpJZgPRabqu1qv3TArokB8FQLjMPu110k6rp3yYI+2CR4Z2lNLWG+Vrg55?=
 =?us-ascii?Q?/d2Pkc1wRehiiIWHI01hLB3kP8TrpSFdFQf2mj1vWoByBby6M3vs/7WT+nfe?=
 =?us-ascii?Q?WGoWR4LGfxEYyssroxVjYEOUrrldhDko0P/h2swPF/Ok8Rx+/zu/j3/12dcN?=
 =?us-ascii?Q?P6KLpT5wA0Ia9tC0lIliXkuleZUJj1Aw0/vxxl/wJFvwBYRM5N/ee7TuZ6+N?=
 =?us-ascii?Q?DTTYMmfBPUPQNB6MS5428c2DtGaCcsh8WOAYwGd4l9YL4D2cHGrX4DS3QntX?=
 =?us-ascii?Q?pTRtjTYrxNui2jcDgzN9KoZjpImVRTiBDFtGMvMrvFoWfubhB0JJO6/7QMDo?=
 =?us-ascii?Q?hwRBCMdGqT1n8Ar9/td86HK4UzaVVgn9PkV658aDP0gjsZJC2N0ZkNxmIOgi?=
 =?us-ascii?Q?nrnHcfzQx9L4zMadB7vQurykiDR3tb5nTYJ379qLkqQluLMhOv2YaR8Ues/U?=
 =?us-ascii?Q?V5qtJRkOawAqmqI8c74Ui6yEVyi9OrNbPvPiQ5zaHFMfrW3lGYquuvmoWD27?=
 =?us-ascii?Q?6qPods5kmvIgeqwc0HYUhNCBHYNf6tsYbnofm7L8dGs4Zy9vQQCFcSqrPtOx?=
 =?us-ascii?Q?MxWDsA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198995d9-c739-4340-bb77-08d9f07cf86c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:16:18.5539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trzXDg6Ij9VYXlHi+qjWmF45g+R7hYcztGmA5kNIjz42ZkoZ9k+hkmXbTTnfMK3NS/22iIO+psU8GRw4L+BngceZAhrPlGe39LMMR7183pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3727
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::72f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::72f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

There is a bug in handling BDRV_REQ_NO_WAIT flag: we still may wait in
wait_serialising_requests() if request is unaligned. And this is
possible for the only user of this flag (preallocate filter) if
underlying file is unaligned to its request_alignment on start.

So, we have to fix preallocate filter to do only aligned preallocate
requests.

Next, we should fix generic block/io.c somehow. Keeping in mind that
preallocate is the only user of BDRV_REQ_NO_WAIT and that we have to
fix its behavior now, it seems more safe to just assert that we never
use BDRV_REQ_NO_WAIT with unaligned requests and add corresponding
comment. Let's do so.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 include/block/block.h |  3 ++-
 block/io.c            |  4 ++++
 block/preallocate.c   | 15 ++++++++++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index e1713ee306..f73203af4a 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -83,7 +83,8 @@ typedef enum {
 
     /*
      * If we need to wait for other requests, just fail immediately. Used
-     * only together with BDRV_REQ_SERIALISING.
+     * only together with BDRV_REQ_SERIALISING. Used only with requests aligned
+     * to request_alignment (corresponding assertions are in block/io.c).
      */
     BDRV_REQ_NO_WAIT = 0x400,
 
diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..eb562a1cb8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2173,6 +2173,7 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
 
     padding = bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
+        assert(!(flags & BDRV_REQ_NO_WAIT));
         bdrv_make_request_serialising(req, align);
 
         bdrv_padding_rmw_read(child, req, &pad, true);
@@ -2307,6 +2308,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
          * serialize the request to prevent interactions of the
          * widened region with other transactions.
          */
+        assert(!(flags & BDRV_REQ_NO_WAIT));
         bdrv_make_request_serialising(&req, align);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
@@ -3328,6 +3330,8 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     /* TODO We can support BDRV_REQ_NO_FALLBACK here */
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
     assert(!(write_flags & BDRV_REQ_NO_FALLBACK));
+    assert(!(read_flags & BDRV_REQ_NO_WAIT));
+    assert(!(write_flags & BDRV_REQ_NO_WAIT));
 
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
diff --git a/block/preallocate.c b/block/preallocate.c
index 1d4233f730..e15cb8c74a 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -276,6 +276,10 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
     int64_t end = offset + bytes;
     int64_t prealloc_start, prealloc_end;
     int ret;
+    uint32_t file_align = bs->file->bs->bl.request_alignment;
+    uint32_t prealloc_align = MAX(s->opts.prealloc_align, file_align);
+
+    assert(QEMU_IS_ALIGNED(prealloc_align, file_align));
 
     if (!has_prealloc_perms(bs)) {
         /* We don't have state neither should try to recover it */
@@ -320,9 +324,14 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
 
     /* Now we want new preallocation, as request writes beyond s->file_end. */
 
-    prealloc_start = want_merge_zero ? MIN(offset, s->file_end) : s->file_end;
-    prealloc_end = QEMU_ALIGN_UP(end + s->opts.prealloc_size,
-                                 s->opts.prealloc_align);
+    prealloc_start = QEMU_ALIGN_UP(
+            want_merge_zero ? MIN(offset, s->file_end) : s->file_end,
+            file_align);
+    prealloc_end = QEMU_ALIGN_UP(
+            MAX(prealloc_start, end) + s->opts.prealloc_size,
+            prealloc_align);
+
+    want_merge_zero = want_merge_zero && (prealloc_start <= offset);
 
     ret = bdrv_co_pwrite_zeroes(
             bs->file, prealloc_start, prealloc_end - prealloc_start,
-- 
2.31.1


