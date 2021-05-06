Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0960375579
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:17:32 +0200 (CEST)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeol-0005Z1-Q3
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelk-0003MG-NG; Thu, 06 May 2021 10:14:24 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:28385 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leele-0004JH-AF; Thu, 06 May 2021 10:14:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOtOUdmTHwkvFnZ1xCBb4E3R6v6u9855pamSC4O4Iezvm7KmXfHgYlY/7rAQ9eayXc2UOp5wVzqiuoO580Abtt6TEAsHmPoGQC+SacZ7hssGrSSu8mEUGn+dyWImjoShAqr/1hGoEM5wnaa+yNpd2SyeO3Yevqjlr5kJbmd8JcK2eys/2u/ckTahzCKZFFzYGaou771bsb3zWfIvX6mvmnY7muNAC5GVH+YwZMN79vm8loKZaNVS184hgD3W7gcTHMa7kbX3dNQQY343y0abXz0G8ZocorA8vdlWkaJKY21mnm2nNiR1/GcsgrrDvfDdcSnZ+uh00O0xbiVACVzTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNw5siKG9gLgnJIgYfTYIrmAfaN6NJxFBqE/IfISWNY=;
 b=Y8RePl/HV02D2009soh0xPbYlE/cYoZnzMjAp8yZw8dyBgKtZqnxuP/6ptc0jJhm/axKLALvJNJfGWXPpf1EVl4sD8LE/StAhPSOW6AcXXI9A63MXxA1FR2qroY9KP0UOwsyq7KLMIJTkiF0skIr7BBCar+kzh7tcLahaXM0HMngOjlCt0vR0FxEQpHDHpqF5+uWei/L0j8lH3nKsvhAnPXHEQvmpYBNvrtbILwK5kpotlKES4b/ilSaeUkaSpRNE2m5HCs1TqUmNE/jbqdJus+/B5o1J6cA+3lEzqomRUA1/ZQ1gnHhOqhR+TvZRZ4Pq0d3rdjambxYXQlwULDSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNw5siKG9gLgnJIgYfTYIrmAfaN6NJxFBqE/IfISWNY=;
 b=XxMqDcfM6yxsHIS4WzoYjUXUiRTci5PpcJFXHCcnNkVv5Py26lJWemQNvfyOEy1id+vjyBX0HnGAW3f3RUtn2VKwvFoV6Jzu8p+rFm8jDjwkfcp1kpgnuKkopnRlkpNgATNHbiIyuRAJxFrzv9aAb0P7wRE7whgDEwUUnUpIvgQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 14:14:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 4/5] test-bdrv-drain: don't use BlockJob.blk
Date: Thu,  6 May 2021 17:13:56 +0300
Message-Id: <20210506141357.314257-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506141357.314257-1-vsementsov@virtuozzo.com>
References: <20210506141357.314257-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0501CA0037.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0501CA0037.eurprd05.prod.outlook.com (2603:10a6:3:1a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f5332b3-1f55-4285-84ec-08d910993a99
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309B0DB96D2AC3B946FA128C1589@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:20;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFzEambUxgyKUn5I2yLOutuRG3M9d/fzsCnKfkrDTNgX7LqzyoSDpfDjHuhTAegeIp52QffLhhTPMvXYLgvM5xvq/qD3TRL0H9voXB4+UycvfWf5vX/n7E4gqjHgMrPoUkXoKRImU8JmY4jcMl/tHg7t2UriZIEEaaPKGw7P2x0G8Ex19UPOTMCyfyTm8r0Are7BD8NbNj0kZ+A1K0NJHcBvVsQI5clY6GVdB/dyKDwQXm/eXSw/Cgkds+5eIHwZZNEEnGPjGbJWJCK4O0QFpWBodTy2Yn3Ef5N4wWr5SQPvXK2lfLf7TZ3x3sJUGh01+kZWEHi/fjOWPp1CAhflI1dyVMCTFtkCkKR/87B7KxDhXZvOmt6lx7iHKoq/4mZpMRNONtfg+nr1l47t/e5oIpMyiCaBCoSwxaLBUFwrqVxXhgV9dU3jGIW63BUvMPrhQrVid+5oq6H1a9EmjeobRKQJZtWYERqQVItfcIA36rbwkGpoqQgAnnAAyRiSJYWuE1S1vCoYu0a360JxiT8dz18EJZSQIdPQliTd1RBsWQevJAyNi/mHr79CVSq2MFJQRNglhw9J95DAcnyXM9wZTtNOTxg4bYW0KKPHOBgwYrOTjhqDhKp+2e0gI9jx/XNg7stZ7WBl0EEltl4zBc9p0Rxn/ZcSV1868KZhwwouZaWcIkSZm9iOtg/1Y1tVDI8a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(136003)(346002)(366004)(86362001)(6666004)(8936002)(66946007)(5660300002)(8676002)(83380400001)(1076003)(66556008)(6506007)(26005)(2906002)(186003)(66476007)(16526019)(478600001)(36756003)(2616005)(6486002)(316002)(6512007)(52116002)(38100700002)(38350700002)(4326008)(956004)(6916009)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4PDtWbJoo3SCaNaCsUJpvaaB9jT9mP0CVUOHn+21mmePWdEzbiSZq/3Qr+em?=
 =?us-ascii?Q?2eny7C2czslZ7myLW65siWtP6pKFDeJQO0SCDPz5SB5gntbYoIm1i+oS+V9/?=
 =?us-ascii?Q?1JDYmsCiWzLULCdFWp5UY6YBnfRCbS4zOGqsyt5FafcbYO5NyCdEnHd4hNtd?=
 =?us-ascii?Q?KJGEUddjlzFW4jeEyuO8tefdvgKp2R+Q6dbR2uapIOhMohmnI6X5Zku1Lani?=
 =?us-ascii?Q?+m7PUoseq2Ez2E/Oo1dpHr9lkbnxhnFytsdRDl+6NjYl88aezpj30jYf3Qi+?=
 =?us-ascii?Q?094Qsrcnb+2d02dia2MyuM/hvRBM4Op5KQErmr3LqTUM/rnemn5fVbnsayAg?=
 =?us-ascii?Q?oQVALPwgzNIKQrYwezJ2aeyqRgm6JA7sly+sGRuVzPMg+eIEUicvDqdK+7yo?=
 =?us-ascii?Q?qqFmoEigS66Z+4/0Sbp5N0jMjewgp7/UitNbdLctYCDHBWh0nMTrHeW/tqZP?=
 =?us-ascii?Q?GMmdD3vuFUlzykGXtgBkq8xgKwfAU2pnO/yd06zdpd9mcfBcOeC+pTlWapHg?=
 =?us-ascii?Q?Pq6E0F0mkqI1366UEsWNxvholIFwS7JNjsS1+ljURwHzKwExU4evJ6UXNGYK?=
 =?us-ascii?Q?zp0QowyqUYcBZQ03K8Wj3XyIbZV/Pb2lb2sPc1x0HGhBt84Rd+rVRHnveH/8?=
 =?us-ascii?Q?CIAUULmKQioWcH+SBzmHyyUxLWaR5nFs9v3MvOlEV/X7fGpTpbevBWi8rR/q?=
 =?us-ascii?Q?MY5XwKFdkoXGAOdvFAmo6NA6UYMYo3yX1CcwbOZj43bWhxQEudKZnJPctZFT?=
 =?us-ascii?Q?91XXC9EJRfznix8ll4ZaFqK6HH3eWuK6oi6/b80UOcDQKL5QRf5dTQXiTuqS?=
 =?us-ascii?Q?WB4+49Fhk0MFxuJgs+kL8FNdcginoov4dUO3SWuC96dNmBm7NRdixruPw0AW?=
 =?us-ascii?Q?zbPAhQgzClHGkATU5nPcGLkqzFRUEANMZ+2KVR1gdc7tUZfRm2f/jB3krpzp?=
 =?us-ascii?Q?bp0TBXAqJZ0TAZn5XCW/W8mGJOLVkXZvpmDCmxLk84yOlWmUNmtvvoU2NWpY?=
 =?us-ascii?Q?/Mu9csPZmI46vbnJAQ0C6QrNZhEpsLm279vhaQDJsbm2kvD7reKIy3K2t95P?=
 =?us-ascii?Q?7GEQXLr8V0dsp6lROR0jhrFN1Vthh9lN0ylXTApJFkBTL/k3Ve5sj0bLZIlN?=
 =?us-ascii?Q?xigaj1sGTNSCvGGwBu5Rs+GOof7xh22e+Z6w/BPPLcHQbYPU8lQ3KFGD88AB?=
 =?us-ascii?Q?UBxoDLLoFdjQQuPMpUU/vTRcdY21NKOINMVQQyjNhpXkdo0wuZvezKuCv1kh?=
 =?us-ascii?Q?R/IDvDkFD/DfuGR3fxGAvDlJzerMJSw5XlomyH22qkvSaKsy7VBQyo/9jWxc?=
 =?us-ascii?Q?SVEXxxmn9sDQ65Lm8RgAh7Ng?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5332b3-1f55-4285-84ec-08d910993a99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:15.0170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiwMSj2uqp7O6T9Yy9AeZ5nA2KevAtLuBisJe3AnoHccCtxgBacw8iSv9MHqsp3JXQimwvi2UZtoXQYvtPNTv4SsCJBDj73/UkAcDPphQAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are going to drop BlockJob.blk in further commit. For tests it's
enough to simply pass bs pointer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-bdrv-drain.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 892f7f47d8..d7b155d13a 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -770,6 +770,7 @@ static void test_iothread_drain_subtree(void)
 
 typedef struct TestBlockJob {
     BlockJob common;
+    BlockDriverState *bs;
     int run_ret;
     int prepare_ret;
     bool running;
@@ -781,7 +782,7 @@ static int test_job_prepare(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
     return s->prepare_ret;
 }
 
@@ -790,7 +791,7 @@ static void test_job_commit(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static void test_job_abort(Job *job)
@@ -798,7 +799,7 @@ static void test_job_abort(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static int coroutine_fn test_job_run(Job *job, Error **errp)
@@ -913,6 +914,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
+    tjob->bs = src;
     job = &tjob->common;
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
 
@@ -1535,6 +1537,7 @@ typedef struct TestDropBackingBlockJob {
     bool should_complete;
     bool *did_complete;
     BlockDriverState *detach_also;
+    BlockDriverState *bs;
 } TestDropBackingBlockJob;
 
 static int coroutine_fn test_drop_backing_job_run(Job *job, Error **errp)
@@ -1554,7 +1557,7 @@ static void test_drop_backing_job_commit(Job *job)
     TestDropBackingBlockJob *s =
         container_of(job, TestDropBackingBlockJob, common.job);
 
-    bdrv_set_backing_hd(blk_bs(s->common.blk), NULL, &error_abort);
+    bdrv_set_backing_hd(s->bs, NULL, &error_abort);
     bdrv_set_backing_hd(s->detach_also, NULL, &error_abort);
 
     *s->did_complete = true;
@@ -1654,6 +1657,7 @@ static void test_blockjob_commit_by_drained_end(void)
     job = block_job_create("job", &test_drop_backing_job_driver, NULL,
                            bs_parents[2], 0, BLK_PERM_ALL, 0, 0, NULL, NULL,
                            &error_abort);
+    job->bs = bs_parents[2];
 
     job->detach_also = bs_parents[0];
     job->did_complete = &job_has_completed;
-- 
2.29.2


