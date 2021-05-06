Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415E37557A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:17:34 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeom-0005ag-TX
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelm-0003OT-Cw; Thu, 06 May 2021 10:14:26 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:13665 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leele-0004Fk-IM; Thu, 06 May 2021 10:14:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSpv1AE87XGaD5bKxfpYisb6WfV612H5GH2A4xbw6WxoSvuugtQQCYdP4fZXZTPTkxiKKtEGSaGtFxBasHdwhsJ9kJujrt8w/DXI3ZXXhz2nyHss/yix16NIuxIn5AkjvHnVFHGci8zuVhkP85vX4Un+R9b51hJrJ3LB9Nul85WxwjG+TJBKVLbLNgsYAyPi1YcEEi/9tQk7vnDBEVyf/uZr9uvQSyR+tek+mLf2zg+xKBW0jHi1bdWsyftXglsDAB8KnL90od5AUMcm5geF83KCEREI50mS0EjlQn6nKgdRCjrUydh5LX7zGEApjf0VUXrCtnvE0Z5N/DKWYfqVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGfWWHRODj1PHh7PS3HwJMLPZWYiYImBx6l99RnydFY=;
 b=feRwPK2L/Jj/Sv4zL0W8rXUe8//Lv6VSb2J4oPPKbUs8I0W8NLUorXUqr4A3W9KWHb5qwryncfV7938DxSsBBMKYUHirOEExp/mKPJVJ6mnYNCeTSEUwOCAULn9NCq91Je2LuZ+Bv3hfW3hDZdL8EnqLT3H/f1qd3x3ouHYYFDVn6uW4gyxpaZ1Ix5C2+itwcTppK18OMhV1njf41BkN7zLzSpswMWUnXKAWENpJu1cC1gQlacHfrNQmetvs3MocPZgQspeKJIDhjoMG005bnY65k420BFVj2B1iKyz1HaEt3gdBt3u6tvYShfdIwbtNRsnpMV4CCzzLsid6GfGiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGfWWHRODj1PHh7PS3HwJMLPZWYiYImBx6l99RnydFY=;
 b=twsmLduwnKzkhmPBP3RxDzKSL4Hct/9Pf8MtKbUCFuEQkjH5md2xO+XXaGV52/hmmyI6vLlGAB8APOaZO9qiUGY9CoM4lz+J6wujHlZZhAFQ3bNDFSNHnLLnMcn0U4DlFR0aihp8zBB+tEwdpV0yOaAwC68uElZHsYlO8n4v17Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5205.eurprd08.prod.outlook.com (2603:10a6:20b:ee::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 14:14:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 1/5] blockjob: implement and use block_job_get_aio_context
Date: Thu,  6 May 2021 17:13:53 +0300
Message-Id: <20210506141357.314257-2-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35d09fff-a55f-4d14-ee63-08d9109938c3
X-MS-TrafficTypeDiagnostic: AM6PR08MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB520555EA3A3D54DD49204DB9C1589@AM6PR08MB5205.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMcm8VNj8oNAS7dbQ4/8odC3Z7gwF0i68z8mVoFuNQ88R/HPFColmTQC8XV8ZXXvFzovV75AMytkdGAMzfbkAv8Rd1cqMhLN9Jtdk3BeDWckrsYqmaywpdjAsDTkgqbrzr9Q0JUpFvSWPwWUqwpQDlDl4F4MzZ6nSDsTl0L2n8vO+HC5lUInimdK/HUUu6IOv993hZrY3CQxhpkvm4nNss+6xC0TLVOJtjZUmEtMpYOPYGsDNBP6B8mXU16RKwHauJdH34bpSXsaoxNyOV3kwTRW2FfZxnxJvUKgnA0mfQ5DA+phT2g09bKE9nf4tCzFyA73/eM+oi124OiS0pW8szVnjjW8OcxgM4FCPrigPE9o0cTXrnZavo4ykUZjJzDxX0JVIOw4KrisWfB52x7qSuor2LP1+8SgpGC1ZApR0g3MgKhMXFoW0/IaJs+p47BUa1fs3R2HJnP+xHGUgRwNyhuoXqZO85rgUS1YUggSrw8RUFY4Sb2hM9CXXYjaGQPWxsOE2JSj9sZxVkiWT7eW/tsvPaq7f13WCa+PGWR9GhIniujz7Kk4+5L4i3E/xPq0VFcSTGqA0K7iM7TtSN9iTFELOJmvq0EkXW5hjpEKS2+tch6gUrLb88ePg7aF35R+DRLUAX1JfylUCqWCeTeH2DjtD7whnqyl4tYh/BYZCih+Y0f/TeRPc5lEMtFPdxMl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(66476007)(6666004)(38350700002)(1076003)(16526019)(6512007)(66946007)(478600001)(38100700002)(2616005)(6916009)(956004)(36756003)(2906002)(186003)(4326008)(316002)(86362001)(83380400001)(8676002)(6506007)(5660300002)(8936002)(66556008)(26005)(52116002)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q/MuGUp7Qde/pTCsZI2noyWnqC8/XJTFfKVLKq8ZP3TS+KcQJysDpH9vL+is?=
 =?us-ascii?Q?B4LSbYOuBCHgSsmp1hy9I0AhvK6/xU/x/p7j+rq0HzPjDeljb/eHLEY6AO9z?=
 =?us-ascii?Q?KttuTCmLSU4YeXEY8SvU80ovA9+pf/8/5cb0uOy9cFV25jf5RE9j7hkPp9PM?=
 =?us-ascii?Q?uSfZTkblEmdYT5jFYOlmN7OOjZnEnuWNj3QayZljYJEkzSUwqqGoqi9adgi/?=
 =?us-ascii?Q?KPp4EBe1NoegdGnmxoOM5kPuIBL7zeg+GMtS3I0YVX/pLiTY4+f98mMAYSHL?=
 =?us-ascii?Q?3hsXOH68iKLYA8eYFoObSFG2VrmUnSy510j5Ao/dMSERoJZCEQ5bQ6PQu3bo?=
 =?us-ascii?Q?Tu8Pi9vzXQosfECdGxldPwCWiRWiPDjK2CP+1mnmCbO3VO/eerVLdPn7HM2G?=
 =?us-ascii?Q?bGCfK0iCReSwk+QwLCpWWm+6wOE/N5lAms/KEOmFp0vcegeVtzUkeYxyJWOH?=
 =?us-ascii?Q?FfP3X8prUqqNUagGpdePOYYEW7ORXm+nkCnr1alsg1bMtJeUdG7YrvV/NHKE?=
 =?us-ascii?Q?W6AvfqSvd+KABgXeT/d/rhEQa5hspcnr4kI2NuIIgBuJeVmCse/YqnSCQaiy?=
 =?us-ascii?Q?6GINCW+wzK9R7zb1pTHlSbNISldrnUlmbvD7GxWhBFfc7k1KpGq0Rox6KZGp?=
 =?us-ascii?Q?ArjxO3VEDHQImDtw5qn4uoFAHEDCarGTlgI4U4yX1peXfzwU9rmtiKceATKv?=
 =?us-ascii?Q?XYKQgGBGJPxRBYoU2BaZ6Kg5/yNDGV5IXLyTDi79lxKA/fqreTLKLK1ggdLB?=
 =?us-ascii?Q?z3+FRDasBU659zmSzsRTRcO8/SNaCGaxV+LahMxbg4rsUQQmaOtpmbVuEXnd?=
 =?us-ascii?Q?ResmGk1vf+Vc2bBUVC8icj+P25pD6t5Cc6sT4YD4qJ64ZFDMyFPNXkYbYE44?=
 =?us-ascii?Q?IHQ+f+1OTb0X7qPSqYfMTaDKvR7k/4Q/QlnyJUYIaDeEC45EhVY13E3B09gr?=
 =?us-ascii?Q?k2qqeGyrcOAr/ag7R6RL+QM2V0HwLwjCPhRXJ/Sn5nVyqB4pBXcoQq2+Ml0f?=
 =?us-ascii?Q?fSl3JP7S6NY1+c+FcqvILPYs5xBX7MO2trzpGqe17xEBzz3rw1NY1rR7KFNv?=
 =?us-ascii?Q?Vsw7fyQ8rPUJ+TYNqKjImbmYevt3l3Krc89Hcvxomz0bEt5hjrRIBYEmAIuy?=
 =?us-ascii?Q?0+Tp1BrU5GzYGqODfzfbb8HI3I/PB+f1RMqMAm/DVMCiyTCHQ1NMsv68ef6Q?=
 =?us-ascii?Q?BLiTym1Lvpbha3oiMlud+9jSXQA9aFSXfbsgedJCZYj6/xd+vwPX1unbyAed?=
 =?us-ascii?Q?frq8PFp2unhqY5yZ5MrhtOy58ljJUxIyH0IWKcG5ZW4CIhqtbwLJozM5nTzI?=
 =?us-ascii?Q?N8P3Wseegm3n0Npu9gZJhHu4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d09fff-a55f-4d14-ee63-08d9109938c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:11.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMlgQ9NGgk2w9+IwA7izG7C3lFtB1WclRtffP3OXOzHMf2lAlPvPci3AVh6OZxqE5aDGlU15y5pYbWGpPDnWUodbMUiORjjkWmB7iM1H+yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5205
Received-SPF: pass client-ip=40.107.20.110;
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
index 834c2304a1..18ed8cd03f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3328,7 +3328,7 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
         return NULL;
     }
 
-    *aio_context = blk_get_aio_context(job->blk);
+    *aio_context = block_job_get_aio_context(job);
     aio_context_acquire(*aio_context);
 
     return job;
@@ -3433,7 +3433,7 @@ void qmp_block_job_finalize(const char *id, Error **errp)
      * automatically acquires the new one), so make sure we release the correct
      * one.
      */
-    aio_context = blk_get_aio_context(job->blk);
+    aio_context = block_job_get_aio_context(job);
     job_unref(&job->job);
     aio_context_release(aio_context);
 }
@@ -3710,7 +3710,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = blk_get_aio_context(job->blk);
+        aio_context = block_job_get_aio_context(job);
         aio_context_acquire(aio_context);
         value = block_job_query(job, errp);
         aio_context_release(aio_context);
diff --git a/blockjob.c b/blockjob.c
index 2fe1d788ba..2c168b93b0 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -534,3 +534,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     }
     return action;
 }
+
+AioContext *block_job_get_aio_context(BlockJob *job)
+{
+    return job->job.aio_context;
+}
diff --git a/qemu-img.c b/qemu-img.c
index a5993682aa..b690d3ae2b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -900,7 +900,7 @@ static void common_block_job_cb(void *opaque, int ret)
 
 static void run_block_job(BlockJob *job, Error **errp)
 {
-    AioContext *aio_context = blk_get_aio_context(job->blk);
+    AioContext *aio_context = block_job_get_aio_context(job);
     int ret = 0;
 
     aio_context_acquire(aio_context);
-- 
2.29.2


