Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A053D0C4E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:14:38 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69FN-00078x-Ma
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697a-0007Rl-Vt; Wed, 21 Jul 2021 06:06:35 -0400
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:9313 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697X-00020O-Ja; Wed, 21 Jul 2021 06:06:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMKBgQ0lw/2fwppep5hcvHTj/Tgv7NvdNBtCECm09anf6ASsGT9lch5LaWbAAVxH+lKIkoaicSnAJRJigqOSWFfye65Tx9NziOPiQg9gtVX6bAb0fWD0HFMvnoRw0XLQQtznoBkzkgQVYa6KRF9Cfzz4s2k92Cuw8bRSYAFOmzJTsxrQJ3AT5yv9ZhbabAPj+Lspe+jETT9TV7tIfPhk6Josqq/o+FZtDiFN3BzgPfHFYNRM2IvvJVM6biKcTXwmdU0ebxTfZkMYJUh2rw0PZsTNAP4CKD1uSKMR9RHBltYyob6+Gdap4RGnuYZz6+owpuZz6Ad46VDpgTrd6oLqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdhI3jas61W6eDqKfiGqglulIfu6fcMcdOH6AiSUHAw=;
 b=ebMFMZs3GJTuCPjY75sKwGhghYUwCGFYoOxxeJwdD5vJgM592HbHqEQPc/UY00y/0l16GcVuz84mZFD8GShf6ihT77w3eu6+1+MsM95GzLpDG+RElKHVf0GIxFvj82HueNvCGptiBszstRsuBpxp4+AT7xx4tYvRvxA9oC2sAonmbIIk4BAy2fxqxM1cAbKFQsq6uAFOu4SRxwEXgyE8+qQTo3OY6anoZoSO2SO4kBqmA9qz0S9Oo+roNJNp9/vF1FyBSHVFEf9isN8c1AwY29mFJbq8kxjDLVKrvjOnoYHyQEQoVUz2m0Y+59Ha94wSO2N8cxhZQMlJpsCtaf5K2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdhI3jas61W6eDqKfiGqglulIfu6fcMcdOH6AiSUHAw=;
 b=vP974jz8J8wpKVtGJPe2OVRyqNxFBaOnS0dFDw64fJ/pMVVwOxQ9+fDiiPEtRbLURgStJ8XpyL0zLJQkTzOCDRkP1vORv//uJxqorBRAZ94noHya5yKy4P0GVKyfNAeS9ExxcvCAS1AJIRWnvEl35RyOckdPCTTkzj04PJux8Wc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 07/33] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Wed, 21 Jul 2021 13:05:29 +0300
Message-Id: <20210721100555.45594-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3710a3a4-34f0-4932-e265-08d94c2f2f8d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168C20367EADAE27ADBC4CBC1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QwdEHXI45b1R3USzlR0VlQzDP2iA+odE8VydGMdx8u5H3yWAUJerxrAssap7cG+kAe5D4EjilzWSqm3LbVtbk3dhyutO/0/u7MzfLR8/ch52KqrH53EktedFEEK0bx+hNTSq/p1kYL4jiWHc8IH24kCb19DjhxZH6ZsbGt5V//L4ZP9Zzh1dKPfCJhwT0dPVmDgPdPiNrxbHQ5HD6XUAtNhqrxOfavO8uFo80DJcwLssUDavD5A700kIdcAuB/9UtIaA7DotI0He5ihOIhrJq2HEfzWR227WTpjfdFNi8j4yfjFUms92nNCk4Ny9aExedSsRbOjKvOFNOI7GYviY8D1NT1rckDYAousTRAfgjJy/9vrLc4yfEW3a6au/DcK7RG2/dGSE45juGO72q0z5yScfIq+7O5BnAGUgY1lmNUJNLMUEvByeSL6gwCI1wDW2Fn1UFXPoq2Um2cubQlMdEsZvKGeNSJNZO0OMtT+r0vYbKx+GGehANLA40XyuR5JitbkeSdKONOiBSAzSWW9BdPcVe9fpUdsij99OXROkBiA31v5fNNgDPWJxtUehcArXCSXku0FYMun/MT0USuGrDssAOS9kJP2v530+9GgVh3aSVEbhWxMzLFbwaPhEnUFO1dld+gKwsiCkSF4mzoTcalQTmRzcLM3ZflQt323COseymcbUzVSREcvYmlMMHCUtTFGHwo7L3KEL+X/h8mg1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9URcdB890T7Ro9fdpVdWbNeq8V5Unm91SohL9j07kzy7VSA60BbYvgkxa8Ik?=
 =?us-ascii?Q?vvf9CjASdHpwfXUsxomAfFORUOBD/zfbxXXXo8gEXnoahCyS4etdBza5w4i9?=
 =?us-ascii?Q?lW38bPLUj2Khyo53eaSzBAfM1jMTSqk/v9pKFuKS6A5C37Z5DjQUuYZZMdif?=
 =?us-ascii?Q?+kNk5rvTVj54QthnzXRxiRazVfKFpea1gNzk/iZabjjwfyPsEmY/Mu0/Akwj?=
 =?us-ascii?Q?WZTMaBcYPwVMxKKRxi54LCu1rI6OpkLTZCd6hNZUsMZhRcDtwKh/4usxCcii?=
 =?us-ascii?Q?WfWDnWQkLWmQtx68sMXkTqkKmQ+DWdkh/iJSx+1nOjRNi5HnOZ5GOn/IbA4K?=
 =?us-ascii?Q?sRIshkDd0VAPUlhEY9WI+Y+sv5yyAovxg3dDS0XTF/bYhyZHOweCbWslcJj4?=
 =?us-ascii?Q?ICfLxkd4ws2FlK6GLKOMT6dR20Lk5O1dx1R+60oLTALvgJdBIvxiumianld5?=
 =?us-ascii?Q?yqqBvdGBgQXATOn5aXMdejf6XNzkUkl/L2l6P+t8s6nZizp7hYx7UiV1s+Or?=
 =?us-ascii?Q?1dfyN6FotF0JO5v6Jw6NiRLuqSf3dXKoA/ya4z+qQyiicsYjlhrxqunRzKt6?=
 =?us-ascii?Q?c9+Ss75YOfF+t+ZFB5h2pssGO6BCqcFCyaV90btNKVjennjcxj+onCMp1uz4?=
 =?us-ascii?Q?vR0kmcMzyNj6nWk+n6fYBrNQ2IsS9tK8BmuCbIS9UIS/EksUfyfh1/Ep8fPI?=
 =?us-ascii?Q?qCspn66bnZwK0W0n2ghyloFzB2EyzywCKOCXDSKvTmemiUhmXmwB7nI+cmCw?=
 =?us-ascii?Q?GvsLbUudAK8ueh3oFoMVPvpIIqOjS+CCiuwK2rLmaKLoyH1TXJ1115pd1NBz?=
 =?us-ascii?Q?7laS9/OUNQ1+S/EQF4duTBqPMmJjC8IXmLj6ZnvxfFV5Mqk3QceajqJ2ZkE4?=
 =?us-ascii?Q?13tQAk9WnFYunwXsz/ZiVv/9ss1OFc/N2d3KbZo1OEbHZPcL2uE782ydpOrM?=
 =?us-ascii?Q?1eFfkSz75LRALYrAdLTtC3uY4ACKtJSxJ7R3SyI4OmF0OFccBYy4gIUT+utq?=
 =?us-ascii?Q?nUGogBrQO2dp29vueXFDTo0IREefP8wHaVh+i+ZZSV3NTPthaYJUnhA4fUkp?=
 =?us-ascii?Q?3F1q0I/X3dD+MjIHXQQKEw7W4Lto9dkZ++0H4l2MITicG/55Iurksc6Z73nJ?=
 =?us-ascii?Q?XknGpNJcMF40UvQGzSLOLLzWrxnv1qCzeNDtlH8S1I/fA3gAF1lMCOX/KLux?=
 =?us-ascii?Q?T3m+vW2YGiwsTb32M2bWH9/bJPP6IakANt8l3rW+TmGIwxNRLjOSczx1H4eU?=
 =?us-ascii?Q?7tjKqV/hP8wX/KV3556NhmVa8CZGzGJKmK97Pap5Eppo+q/jyzvFI2oyQHdT?=
 =?us-ascii?Q?Q1+ndfHN5JaffFuMKkARbnHm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3710a3a4-34f0-4932-e265-08d94c2f2f8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:19.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBXzqV4kqiQEDGXAi8cak89dSs1TaZc3JVtlH/o4JUu2StlPidQd8zjd2pCxSyGQh2NNee2d50stNRJClJ6tgObHNGsk3LDISx4Y4uKloFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 ++
 block/block-copy.c         | 50 +++++++++++++++++++++++---------------
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 734389d32a..f0ba7bc828 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -28,6 +28,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 7ce5e3d657..469f992c0e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -315,6 +315,34 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
+{
+    if (compress) {
+        s->write_flags |= BDRV_REQ_WRITE_COMPRESSED;
+    }
+
+    if (s->max_transfer < s->cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else if (compress) {
+        /* Compression supports only cluster-size writes and no copy-range. */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else {
+        /*
+         * If copy range enabled, start with COPY_RANGE_SMALL, until first
+         * successful copy_range (look at block_copy_do_copy).
+         */
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
+    }
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp)
@@ -358,32 +386,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = BDRV_REQ_SERIALISING |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
+        .write_flags = BDRV_REQ_SERIALISING,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
                                     cluster_size),
     };
 
-    if (s->max_transfer < cluster_size) {
-        /*
-         * copy_range does not respect max_transfer. We don't want to bother
-         * with requests smaller than block-copy cluster size, so fallback to
-         * buffered copying (read and write respect max_transfer on their
-         * behalf).
-         */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else if (compress) {
-        /* Compression supports only cluster-size writes and no copy-range. */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else {
-        /*
-         * If copy range enabled, start with COPY_RANGE_SMALL, until first
-         * successful copy_range (look at block_copy_do_copy).
-         */
-        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
-    }
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-- 
2.29.2


