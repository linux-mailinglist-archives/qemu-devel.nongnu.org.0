Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CE47EFD9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:39:05 +0100 (CET)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0meu-0000Xa-3p
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcl-0006Tn-Di; Fri, 24 Dec 2021 10:36:51 -0500
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:56161 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcj-0000hE-MT; Fri, 24 Dec 2021 10:36:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5RdSdP2efPmKgUIwPW/MjvlgU1GYyed3aDJtid3uuTgEmZL70jLntZDd0nMYEabQoJV6vmXay7UidLteuiUBG1DQEfpTCUTMv+f2DCBX+WvkWM+Ruhu8FddqoldmShVpWHAfKe5bYgRDUE+y2LWgp8hXyaa6egjAtm5bWC/2hN7Jjpc7UjAjAvcM0/pegE9eYT/SLT125F1qXXTlFxZqGWnYmLvAHYVj0BEVJQ6ldBToZbtEXpUipCDHtdF/gtmrT4j2DxKYarNEJGSD/D2mpmNKgMDrWDJdt4dkT2IeXh9K7wZNwfBiV3hwZKfWntRTPNPjvY5iH4FLUluru3/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcE2bvCY98TxRSD0z0xPyFqMmGn5y9sm3QcYhqLALBk=;
 b=ZiENMiiNkEUODnhB5cjhJSAHeEGpHqszuebP8K9iOcWbEk6tMDQRneeGDq9QKKZzQZ4V0/COQ3dr35BdOEzp4ZwV8Fu+/3HSZn81fV/N8zCfVOUJK46u4JRqaZhiJ52Wgzs5XBXO3cHl6wdHjkwP3SMEJpwjpD3WiZFkazEiAgP6sWp3IEp2gBQ4+2SOTatqq582aOdWUURhimtsXSQk64+jElFGSPNmAARwa8ZN9U13wBxpSXQPEISxSeLK3/vw6cyFGT1O03KA/ADKiU+51wDXRVJLeiKyC6Ivh/xIpb7MVvT0QYC6KgAL2E2td/ZB50J2J9b70dU5YAqBZZEBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcE2bvCY98TxRSD0z0xPyFqMmGn5y9sm3QcYhqLALBk=;
 b=CHluJl7KAJFzoxzUgV5sVr65vFM+JCCmzwcNWd4eat5oWY5EaZ/EZAeP40AQeejxfxePZTa0VJQJ1WY8vXS132Rm26/ZFuzbEQha3bu2bNIGwSbcbGRRDxdjyj/PgsOSuMZaywfaHoPwE9ZfKo/XE2dWnIzSO3+D9T8maviPRI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6769.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 15:36:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 1/5] blockjob: implement and use block_job_get_aio_context
Date: Fri, 24 Dec 2021 16:35:48 +0100
Message-Id: <20211224153552.2086061-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93c801f9-6e2d-4fb0-a639-08d9c6f31fc5
X-MS-TrafficTypeDiagnostic: AM9PR08MB6769:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6769A0A0A3048BA25E25C32DC17F9@AM9PR08MB6769.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtXcOlsVUziq401DvdQBLf9bUTiQXaDwyAXf2aeePR3jTPhwtlFD1dcLDkUKz2ms/Z3FscjeYNCn4LcJBGfF8qn2xVNJMMwmUNGV1SWPs6it8tZSJl3Sqe9MXdbKLstlviNtLaiosqMr7ZfdogsD5JcR7wCfCIAcEpdxM00YyO+vW+oeGCZYgVHj9YKTdD6yp8DqR/UbZhOLhTFLVUw0mLBuZU5Tiq2lcOHbvqsYOqjKd9SAtM8f6xGPfRYYWcEx3cB9CgjwQxLrfV/b/mY3TrSFY2I7xHzaaYCCb4qsneud7ZTQszDkJ5t7l2Sku+ZJ8ZxXWA/o7jvh+Z0bmbpP2I8vM1t7z7D1jBUuOTprlFRFtHzkUUSxHMA8tSnJ8gcMq/2Vb/PCjDMfTFnxZuAf8v5qtzZzLoICOfnx5lSJWG062Oec4b1cyrcsHJPAg4zcNRBhZ2UQOpBcSxBJ85GKMdmHTn/FJ5Taqcdv7ebp5vYM7sTmO3nY0joVOHqv6Mm+jVF5HiKMC7S7Lau0zq3Mnv1tDHT5yA/dONOP5EOHbcHoR7VFCMJ7h5OKrUBXu9HYScnfcym9a9lYoYOGZRdzqEIq2oB3QIQLOWfzXz9xf81s9vp+GBm7jmTq7ZG1E9vdR/JqXU6Ys1Ntm1FrkzRZg5CPSjQU90KIvWe2Q5SbW3jnAIP8hpFNOQuAEMKuOSS9xozOaTsqGZO3D+L3r0Akrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(26005)(8676002)(6486002)(6512007)(5660300002)(1076003)(107886003)(6666004)(4326008)(186003)(2616005)(66476007)(66556008)(83380400001)(38350700002)(36756003)(86362001)(6916009)(66946007)(6506007)(2906002)(508600001)(38100700002)(52116002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jo+ac8zH+NIGjNueNUTcBgm2CHXFv5iFJdCjMguCN57FCgQFpTqCUZiddAf7?=
 =?us-ascii?Q?AA2v1oYsH6V359wNYj+AqVyR0ZifVmmCOJuDJaTzl6nz0M3LLF8ZqJnGIp9a?=
 =?us-ascii?Q?5YHfXxa5zvQ2VD4pKHgK/fuzjLH6/jBAt65iJZJlSC6yF4RXo9vEMiICLbN8?=
 =?us-ascii?Q?pqvbDTvWWNpfo3h1ZNneZ3DZG7zosv0d2Sm0spducfyc19rQvtmT/yoXuRsW?=
 =?us-ascii?Q?Oqu8lDTdTSt2LvT/P9bf6MbyvFlVrffzuzDdRqSL7gqfLtQSHPwXlHv4b5ev?=
 =?us-ascii?Q?IxQssOusprnVwK6xqDitPpmDnn8eNWqNIRjPEGIJh45bwKCaMkXBlpjmTol6?=
 =?us-ascii?Q?4YDoiHJeV8xyO2YBKvNMn7/oSXt/VcjjDVb96wK4u/5hRHA5rp2IXcQLVmBf?=
 =?us-ascii?Q?eumB2S2PS98DvdK7AZDwipxQJnShDxyiIWPwSbeKkWY6h04SxhxqDpgDRUxX?=
 =?us-ascii?Q?9CwqoQdLyCDpNWJMZfA7YPXCzzYujhubiSvPURM0pESupM+/7p2R5iQBvbcb?=
 =?us-ascii?Q?y4wmLzbZQYPDHqnKyePLBjHTRI0S5eAttK4xofpr0s7biL8PYFi2QPfz6K50?=
 =?us-ascii?Q?NclvvYfcCcNl2zIVJtphzVi99HVAKNqI4vsc+J7in8BikFpALNJp+TEiUvSy?=
 =?us-ascii?Q?jjZgG4dOadsi8ytay1UnuvE16d4ujAc6ZsafVBTFGS55+jrQSNrZtEjZZZMg?=
 =?us-ascii?Q?rU2Avg+50yAPAaa9G7YOJe6xX2+9N1sxEtl2e9FJT5K/hRHs0rZqLBX7YUuR?=
 =?us-ascii?Q?cprBhm36N89QB8SbFP37f5iUkg6ky2nQMpSMMFoqiucPgnM9bMowF2C4fr06?=
 =?us-ascii?Q?sBGAFMN3pou1uHRqMXkNgzGuLoVT8aNMylXC5VgYp6LFEpFAKjVBVOpIGuPt?=
 =?us-ascii?Q?j3aRIvRoHXJJqqj2XQBCzzEuzwZCG0jpSZcf2Az+fPw2TK1lZPbjfn17aJUM?=
 =?us-ascii?Q?kLPVZRZsKPRnJMv22dIg0YWuJLauRMmoKZAUpzDqTuXeu5bnYwSn+zAQu8c4?=
 =?us-ascii?Q?Yw6323Y4Ne/mqqPPWoRe+ibDOEV//Bm2SsLyBOFSxwRmt2TWC5hkb9txCdvi?=
 =?us-ascii?Q?qKgfjtdTmjeOJuaF2OdJgbLsWBw0ykAfCmuhMo3NMhUCiqTa1wljRRppyesN?=
 =?us-ascii?Q?ydzT6IeARj/SlrvJ7Wl1bMvSybtYHjb9Mt5FGsz7kO8cZbGj2pAgcVb8fGRD?=
 =?us-ascii?Q?+9g1icos6uo09AHjDanaagID+gKUT/6n41Q5BzMVMOeoHIsUTgVmsRdj3r1a?=
 =?us-ascii?Q?EM/EH5vGFhLuV6HgBxUJPm/zWPnZUXUzG2Tyb4cwK3ik/TchRcz+X9I9Ii5m?=
 =?us-ascii?Q?NF6qaVC+gWPcs6sYVuklc99SknWiZZ4fhSMq5IOL+4K0q5TcI2qnf7aYHo3h?=
 =?us-ascii?Q?Mru3KHCwDjUQLcv+dPlexdWP/sVOTCILzp0fGv57OJhHMz84s0ZMzieYJsxI?=
 =?us-ascii?Q?6NFCMIn7MC8OcamKbm6yOvBPMRF8WSXhuN89gi48v1HOWt7WyjX6ESDbGuyI?=
 =?us-ascii?Q?p2UBW3uyJPiTYFaOwjHmzdiJqNxfxFPH54TMyNYeSh6a8vRV5/FlrxlOxwVA?=
 =?us-ascii?Q?ryj/ck6UQvlcy74390pMt8jIP8CVoW8jV9TRqm6s6yYQtnLR//RAWcC/Em5O?=
 =?us-ascii?Q?+qJR3j+XalzKMi+bOgVQpZnZ7SCI/YnvIfnMBhPLKUchtLGnFlphxvvbcgTm?=
 =?us-ascii?Q?j6p1RpIPTV2mxzwazY9XQmOGFmU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c801f9-6e2d-4fb0-a639-08d9c6f31fc5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:16.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtamZt5ufLnga3bItIPek1HHllamMVOybB77IVCIPE9LSj9XTV0jkPmTLWQrexh1dpc6EjVH/5+/0rZUplOE2fLfTZK+bJU0LknW3x1TG5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6769
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to drop BlockJob.blk. So let's retrieve block job context
from underlying job instead of main node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob.h | 7 +++++++
 blockdev.c               | 6 +++---
 blockjob.c               | 5 +++++
 qemu-img.c               | 2 +-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index d200f33c10..3b84805140 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -173,4 +173,11 @@ bool block_job_is_internal(BlockJob *job);
  */
 const BlockJobDriver *block_job_driver(BlockJob *job);
 
+/*
+ * block_job_get_aio_context:
+ *
+ * Returns aio context associated with a block job.
+ */
+AioContext *block_job_get_aio_context(BlockJob *job);
+
 #endif
diff --git a/blockdev.c b/blockdev.c
index 0eb2823b1b..b5ff9b854e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3315,7 +3315,7 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
         return NULL;
     }
 
-    *aio_context = blk_get_aio_context(job->blk);
+    *aio_context = block_job_get_aio_context(job);
     aio_context_acquire(*aio_context);
 
     return job;
@@ -3420,7 +3420,7 @@ void qmp_block_job_finalize(const char *id, Error **errp)
      * automatically acquires the new one), so make sure we release the correct
      * one.
      */
-    aio_context = blk_get_aio_context(job->blk);
+    aio_context = block_job_get_aio_context(job);
     job_unref(&job->job);
     aio_context_release(aio_context);
 }
@@ -3711,7 +3711,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = blk_get_aio_context(job->blk);
+        aio_context = block_job_get_aio_context(job);
         aio_context_acquire(aio_context);
         value = block_job_query(job, errp);
         aio_context_release(aio_context);
diff --git a/blockjob.c b/blockjob.c
index 4bad1408cb..70bc3105a6 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -547,3 +547,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     }
     return action;
 }
+
+AioContext *block_job_get_aio_context(BlockJob *job)
+{
+    return job->job.aio_context;
+}
diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..21ba1e6800 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -902,7 +902,7 @@ static void common_block_job_cb(void *opaque, int ret)
 static void run_block_job(BlockJob *job, Error **errp)
 {
     uint64_t progress_current, progress_total;
-    AioContext *aio_context = blk_get_aio_context(job->blk);
+    AioContext *aio_context = block_job_get_aio_context(job);
     int ret = 0;
 
     aio_context_acquire(aio_context);
-- 
2.31.1


