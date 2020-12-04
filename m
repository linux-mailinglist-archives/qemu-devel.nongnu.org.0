Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B82CF6B0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:20:20 +0100 (CET)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJR5-0005Of-QA
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFv-0003fa-Lo; Fri, 04 Dec 2020 17:08:47 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFr-00024O-U9; Fri, 04 Dec 2020 17:08:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW6jUysGkFgBBtRYlvB/Ik1iYz+6qmgH62owoOa+5ElxiQhgkJe29Xt8dtOgSCFIge/fl6sR5wNvT/KXsROgWMZWIaTyjIBGm1AJmXc+CUioo9ZN0++1ODhP4/Ei0wfCoTDgzBt94ohA8zLEsoixHxfnQD1daoXrzXCaK/S/qfr1RaLsYN1NW7yJWjhmPePJ2kX3C7f84VkLDjaJRFjmxGkzWSztq44EOvSEcguIkWkibqH6z4qrDsF5uhlpIswjBBGXlsIKiKYnGDm600c/gPN0JA/9Kp4Kbb1YR+6deNHM+9yHi41NOrL95ZkUnE3Xm5PlmWdB18ovSJbCBr07Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35dbujSPCJ3TtkzoST0YH/FjsdamthGNlinRWLZiKYY=;
 b=CQvufDEspXfpCVm/Rvk284IeizYY5aWiwBUOtq7ULl9sE7wCc3zhOJPoNiuA+D9RuEhD6buCxw9OLpSA9B+9LgEL4L+RcAz4EzBRd1OFI0GzL1HrmHRRSiM34QL9kesmzcqaarXYEDb9Q/t8yG2FPp5evrS2yyigbXdv1joGl3sUakXYoH1HHMFEEuo3Q2ONqWF7umB+i+SgmmHtJnfbAQxB9hmrnNoEot6ncsVDRqPPflSykiA1EZT8bXrpDK3q9eBZ0nhyvZzdQchffQBe9NJKlpGbBQS5VtxofENaZypZWwnwe33xfDRgpswwfsrgWKQN4CblcfzgMxNBeIvWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35dbujSPCJ3TtkzoST0YH/FjsdamthGNlinRWLZiKYY=;
 b=ET7dDtrPz2zVSZhE6Mj3xwBIppltrIf5Darl09yTSmY1dbMHpzwVhZu9j/tLJ/+QjbNh9YhnSlfa3hoOyEp0q7lAXH6tWhFp4/XZYXeWuI/xX+3Q1GmbZrsbjkjhbfCTNZjQ6hHCc9JMAbIldxyd2DVG8Nv5hUi1EZLxAwLlfoc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 12/13] block/stream: add s->target_bs
Date: Sat,  5 Dec 2020 01:07:57 +0300
Message-Id: <20201204220758.2879-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f37637a9-ae33-4f41-9090-08d898a11f0f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407260367401E26037B87A9AC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeAUssEEoU2cZYf/pRGYTC+PmpwCnS82o/G4bSgP2AIg8cEO4wDYcAxZXy7uYyNZi2SXB4M1/4v3Kl1qAPh7nA6HAudYCIjxZJ9iNKcxKDBQ4h5eq+3IiiVJiNldiVy9cZoS5EFOkMdjyOoSZ1K2FqUxnkIWqRf0zFpWs4+dEBi3bIYs49pAcvfDpD+27maa13xbGR3HDepdbelp+hj7xQktYwjYicutrfBbwyMsl/EhAbBUHQcK3LU+SLx9dsbFipJ0QvOAGsudS5NUwuEhihXsp2olpYpfRKAPQApcGPDIdHZ3WpyABr3HGKofeQK6NQSM0A748tO1aHC3dCRwwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(346002)(366004)(66946007)(66556008)(1076003)(5660300002)(956004)(107886003)(6666004)(16526019)(26005)(66476007)(4326008)(36756003)(186003)(86362001)(6506007)(8936002)(2906002)(6916009)(52116002)(478600001)(6512007)(316002)(83380400001)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VztQcnctMKThgjlHr2rs8q1D3qIYOwX3qr1qGb+Gy5/5RsLqA8ya1kK67aEs?=
 =?us-ascii?Q?omONBXoeqXHceWsMTI+ryIYL5zkkvuLa1dzqFsnpl/sYEBw8+qbvJkf8c538?=
 =?us-ascii?Q?tDfhNEiI8fkZ3CY9XaLIonmXvHSEP40GCfquuk6gMLlVKwRlTWDIVZk71DPF?=
 =?us-ascii?Q?PBlaMQXt889MDa6GOeZwnFUSNNcLJgeeH88zp9KM4u7jX6nnpkHW5GSlSYRK?=
 =?us-ascii?Q?Xc90tnNXtBJ12gE7BvAlCRJaMS9SQtbe2Ymp41jFONgbKfpLuxAUhHJGOyD/?=
 =?us-ascii?Q?bDordOKXhp8ICg1a8qeqnuaGrt+uQ9L0wKzSGqVvfpQtpCKjs+za7z/jozOm?=
 =?us-ascii?Q?u+y0CUX/WESKznSJ9JTNVw1FoNebw2I+1/Cz3ArcvMVqsHMyPwcoEFneTaQo?=
 =?us-ascii?Q?dVW6yl9Ks7vOsHDCfL+VpXv88mWJhgODoRNOO3rNMf0s8YHcWT2ytcpGPmAX?=
 =?us-ascii?Q?vGmYk9sAi5O9cdWakoUOFJgaRnIMZZp9H4lud/fNCF1LKCZP2I2qr2gm9wMm?=
 =?us-ascii?Q?HCOZ0KUz10xaJrBG4DV/uHdSOceJ/hgkJGCtCnQHtL/YWXhvCDVuX2cqeU4V?=
 =?us-ascii?Q?hUOFn0S1S92Lnv2EJl9Y4AI3h2P3JY3ZxyZJHoEtQ/MvSbpfytT29HgKMVFX?=
 =?us-ascii?Q?jT+BCqgRholiFsZW/++brpPuD20TAB1H3i7liGN0s2AfD/PA6xCaSziCPK4J?=
 =?us-ascii?Q?tYg/vgWiRdsIYr5woL8nInBP8oAgD+bAYkY3gIJ2Alq4sO8y8HuqkrxwnDrb?=
 =?us-ascii?Q?e7a+03xfPOa3nEICuD7g6LBhW2ed7+0Fjxx7HCwDNRJYpE890QnMvgpx8y27?=
 =?us-ascii?Q?SJgfG1WgxxqZBTLHSyda1N3DIisUK6whOJkIbyMmyrr0MvEB1AMtboYg9/B4?=
 =?us-ascii?Q?l69gXxyffj28hP2+n/ksm8ayPGBHQBrkNh3DZ5vcZurdDlCG6imdO/KC2EFX?=
 =?us-ascii?Q?pru/wn5kJFGstsR2/1+5CTUoR93Yww2BRZ2NZFtf6ZXn/9F7o+PTJRdhJX2s?=
 =?us-ascii?Q?R5yA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37637a9-ae33-4f41-9090-08d898a11f0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:25.2539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLv5rMdNwzFb4vHRsqZv6LdH2semZNPw8wgrIc4c3laIpgcuWRNY57yjz/qFMiwr+0IJlrlbxEY6meoB+pglw4ucNNrDGNw163L9oAPC8ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Add a direct link to target bs for convenience and to simplify
following commit which will insert COR filter above target bs.

This is a part of original commit written by Andrey.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index a2744d07fe..a7fd8945ad 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -34,6 +34,7 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
@@ -54,24 +55,21 @@ static void stream_abort(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
 
     if (s->chain_frozen) {
-        BlockJob *bjob = &s->common;
-        bdrv_unfreeze_backing_chain(blk_bs(bjob->blk), s->above_base);
+        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     }
 }
 
 static int stream_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
     BlockDriverState *base_unfiltered;
     BlockDriverState *backing_bs;
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(bs, s->above_base);
+    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     s->chain_frozen = false;
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -111,13 +109,12 @@ static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
 
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
         blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-        bdrv_reopen_set_read_only(bs, true, NULL);
+        bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
     g_free(s->backing_file_str);
@@ -127,8 +124,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
-    BlockDriverState *bs = blk_bs(blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
@@ -141,7 +137,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(bs);
+    len = bdrv_getlength(s->target_bs);
     if (len < 0) {
         return len;
     }
@@ -153,7 +149,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
      * account.
      */
     if (enable_cor) {
-        bdrv_enable_copy_on_read(bs);
+        bdrv_enable_copy_on_read(s->target_bs);
     }
 
     for ( ; offset < len; offset += n) {
@@ -215,7 +211,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
 
     if (enable_cor) {
-        bdrv_disable_copy_on_read(bs);
+        bdrv_disable_copy_on_read(s->target_bs);
     }
 
     /* Do not remove the backing file if an error was there but ignored. */
@@ -330,6 +326,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->target_bs = bs;
     s->bs_read_only = bs_read_only;
     s->chain_frozen = true;
 
-- 
2.21.3


