Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2F481649
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:27:50 +0100 (CET)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ec1-0001zk-8F
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWM-0006bE-0c; Wed, 29 Dec 2021 14:21:59 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWK-0000B6-E1; Wed, 29 Dec 2021 14:21:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJm94KsBxt09+p1QwhlOVC5weDUhUudsGBsv7reQgHOIEDuVF2OpQsaC9s90fzq0cY3BO5oDAXExyJ1l1eZ8Eo/gwMgmRBKeeeGQSzTCLAHVVaciSZU/4qZsjj/vQmONy0Bg982YCARYeCD9AakhUEFgGlifQh5PF16H6zCKn1Om8O5HnDoA6eKLjXqXV4lHF/1fkXHZsZwyceHH1orcQ2iojNOZMg4PecG5KhcCUq0c1CXe/sI/EBBdE+b4TH7yxxtU2tPO8sMzvWvnuvPIeUBVI7xZX1HT02dUbKlLynOFgsaGutw5wLQBuxIeDN1xInl7qdzILh2So5f3oD+feA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LugQXZRFIJJbi9090i2FngjK5u/n+mcVD1os2YRaKWc=;
 b=Ffbv4wUscWwfeheh4Pxxm5qm/ekSYUM7Zz7CLmC0FV5C8nrv9Dc9oNeRxymumwQT/LoxehccW2KhYv6QnQ+x+50FlvRvF05x1gxXl7jODOiwsubf/BhLyk8G8XnUojzfIvhnHR+B4FW5n6xHehMMoWhHjOicGha5S465ycNu3wxcb5kJ3BGjYXyrnLi914Ym/jqbbvMK0lAR9X9vbYeVDkVBrtm+MOZVcIVEl88HBvL1T0H0joVrKOamvY1IgUeppz3SiF+IsWe8wuVO/Fbm87d4Fg3m2+0X6iiRKGhrnW1IeYs3Zx+Yx9zTfqFo36zpQf9A9mnyDUqIJcfhxCEasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LugQXZRFIJJbi9090i2FngjK5u/n+mcVD1os2YRaKWc=;
 b=A2TB+ly/25+3UWS3bx/oEA+5yKsVSBbrbd3ncAor2TGiFi+G4XrtixyqKoPh51Sas5KMgpPObTTcCHdYvNrSE3bRCCOBoM8N1m3bClHkCR6FZ5cvsz7RiyWYBCohwXgXZpuqc/zdiXzO9lGwAxB9FlBgpPQqq2M2IFjJeukWF6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 2/6] blockjob: implement and use block_job_get_aio_context
Date: Wed, 29 Dec 2021 20:21:23 +0100
Message-Id: <20211229192127.1772134-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d80c48c-30b3-4d2e-92c9-08d9cb00733a
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB227699993E52D4B435A51343C1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvlLvS4bDlkBIWIN95aihYJOjkrPEWXk4ITa6FEyzJMTXXtfEpjcu21hK2kYz5E6lYoZZmP2uy4Zkr57kBsrEKi0idiPcILTSs7UH8mEQIRODgQJhpF8CVfBo9zayr89zA/9GR/A6Tsvg1XXHH0pHNo/Y5RTarceUSlcnWPL3h4XW2gwM0YPCfFOvWQAtvI7XDY8YUgQi/F2kJ5SWGjroMWiEwjM5+Du77HK9yXPB7QS4bH4ik8e0Ijw9ESaGCUWSJRWnpnfcBSPioGxx1wu+GKX5w9lx19hUmmQBuy7gBdpb7U0zNwZ1P+45UY+pABkZSZgTN3T3XAheEFn6T2jdpOixWKbVmZ8yQoJT41IMjeKXfnEEaeeOB3n+I3pxUeIRoQ1fvJw4Wb+/VW8NK1H8C/iiHO4YlBfj5/TYpSfMiSgCrqhTwdfEvM6M2jpT8oUa7kx/KFCDAXWjogsJJ8vOTdr03R35sjv3xoiuWVyCJ4RMEGuckCh0wzkMe0Lmk6ENhS0QdNQedlxOh9Fzv8ZIMd2ZCD0fnYN5FEusXOjkWDdjVB1IInQFWGprjAVgp7xHjenVJZJvFUvqiD9z8B+qo5xXOmWwxwNtOlWT08QjgvozIt8AeNy/8xqbKzxgYGI/icyxMDnIlwWHjCe0hty3C4hNYvrDdnP9uC+og4GVkW/8FtI0ORj2BwgH9co9NhmFTrgxvZgyom1fQfCRhoSlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(6506007)(107886003)(316002)(86362001)(38350700002)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QPIe/JVVGZmxQcgDLa/Nw1N2XM51bsvobffpfozT+ZnJ7gKUBI4ypr97kkuo?=
 =?us-ascii?Q?N8CLW0QwSWNkvDYwpXgzid7n23k7M+RPx8ruY9g1kgWHowgj8zeabWdpa/+M?=
 =?us-ascii?Q?fbJ+RZxEBdgYbwNrbermHbE/cFiNDhqCJNDUMdFPNcdemiRNfzntc/ta4JBc?=
 =?us-ascii?Q?DKQ6dVcls+u2YaEJ9m1xA5JxgKuSm0dXGgnd57SApWeo7ijkgcc9zSa+p4Hg?=
 =?us-ascii?Q?WnjThy61itgvWONvRXKxy8KTxi4XEIO9bw5Q+OsioKzzXpGlgRlo3PmFRMUX?=
 =?us-ascii?Q?FH7FxLQLv3nu8ljqqQtKBmHlVypma7xYbgpB4bRnukRahaS3BNjfVMWQLJSo?=
 =?us-ascii?Q?W/0bQNBINmlsNsV69nfKOK4/kqBaT+HKMaVN/5TUbZ+cmG093Mp8FqAGAC0E?=
 =?us-ascii?Q?V8a2u3MxuaYaLv6DkBfyv9vu+3oOH5Ig71vqo1XQXw4FjFAo/tclYqH/aqXs?=
 =?us-ascii?Q?xzhPK9Wcpi9WQI9zkIRia+juHu8mQPIGJCF6c3jEunaHfB2x2YGcugdwGymX?=
 =?us-ascii?Q?5HUcVJhFhlztz/5KUUDfrk/YL+IaepNvW/fXSzj5eMimfIiNIK5RgN3MYVpf?=
 =?us-ascii?Q?gcMhHxmUn0lPwOX4trr4egFF0x7abtWpyITUgXRuMOcR2mjdoMMzGvbh4TPa?=
 =?us-ascii?Q?H0LuHIEUuiHVSxnengL58Tuv1oWvzUjekRAcADkpGaBodHwtdeGuD1k4/BDw?=
 =?us-ascii?Q?m2nY3dp6oMeotndXl7hM7FRXTKd5RA8KzQFpu+lNXPsVm+Rf8popv2rfmJsa?=
 =?us-ascii?Q?WlkXzJ7bgUomeVevObuMQjQgjGu0/TzvDGewHu7ZyZwIisKhSzvzDzQHlwT/?=
 =?us-ascii?Q?CWZFwsvkhLCdKAu+g/JSe9cRYL4sGmCO2zJaa1ugzwaiDsVUkCZnFDd7TVAn?=
 =?us-ascii?Q?Ei3E+9Ca/3lh9UBhhrnYnurHbXp6e2ojZvormymBI2+4FRy0LH2n9YpEY4fC?=
 =?us-ascii?Q?jWZji6wkejgMtdBaMReQgMhy0yJH4aGR8K4FH6Tg9S66EToXpgi7ZVHwq9M6?=
 =?us-ascii?Q?MB1crW+dhMy3q7snXy9WsDmONDXf2tZ0DUQQIXAhqrUnpzZ/zpThYt5nKd9G?=
 =?us-ascii?Q?tLK4gsF3D9RGL21bRgaK/FrUiw11P3BkBXl//YgEcj5V9Zsl+MGcZDlXLlvs?=
 =?us-ascii?Q?zUiXO/BVRf5gMXzEI2YJJT6GN/RhX+4BO15aLXJJNzcOXdMNTNSLQoMuTe4+?=
 =?us-ascii?Q?gexnhCdMnlzCFI9K+VwuI9HYqIGiUHWpNBR87nSZuyktu6zh+UvEWctJZyxC?=
 =?us-ascii?Q?2ql5SAkZy3KlveX9CfV0vLcdA9+Nz+sxbXX7pGsicannnuU69r45pG9N4lZu?=
 =?us-ascii?Q?h3gWZdvZQKD6fLfr/0UeyHBDBwaxz0raIWVB+zyuxcnlgL0pruF+ywTpbfzB?=
 =?us-ascii?Q?MyxawqHRvKeX/k0385ADzV3AjECbuVErOfEm9FiVXLWVdCrrr8UVYBz/Jl5H?=
 =?us-ascii?Q?xUqidSt5oS31r6xgUuabiHIJhKd93OHI5NHe8i8+htscWEnhdGJ7ip5I+hwo?=
 =?us-ascii?Q?K/kQl8Jppnh1vpa+t5ze8hi6ElQt1eOsDDBiWFqibInDxh1TbdWAYJ+JfuSu?=
 =?us-ascii?Q?BDHXKVUC6qGcjMFxy596hVZUw3XOqIfS0AwLP0hRRYaQGmiHlOpvpkMuQut8?=
 =?us-ascii?Q?Yvi2uCJlL8hh6n/qM3PLsiUdXxSZyeLfuDJ59N+0WqAfpAuFR36NwrK6XCqF?=
 =?us-ascii?Q?3HegMIx6EW2lGGYNEBvzaw1qgYU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d80c48c-30b3-4d2e-92c9-08d9cb00733a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:44.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl0crHR+q+SrOF5Dq8bTKVZJgU2iIlI0zflZhIQtX05UydQaT1KCJIAsCegtNTNocd/yG77atUuJ+Q0iYx46Oqmhnf8DGxnGHMBpFyg8S10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
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


