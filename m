Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9033B4413
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:09:05 +0200 (CEST)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlZw-0006Tf-6C
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRu-0000pT-KD; Fri, 25 Jun 2021 09:00:46 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:11041 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRm-0006HJ-JN; Fri, 25 Jun 2021 09:00:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3n7jWkPejGr6YFkb47msv04LCr9vE7WkIKu7L4m7oy/wzWtwuCcE4oh76R/e/f1mFJsvaW/fH8D8lJOXafuoVNr05ZMy4Tfi6EaePP3YYwkO+3ziVvFkU/r824hpYRsOMRweHe3Ew18haco5HD5QLzjkoAfDgyGbRy61Que3Psvl7Y8FNoLWD9l2ld5yyc3F8yY4Z7eVtPtGBbB9rxV/Df4ydIdC2HFN+5HYVyYwT5WrsLtReHTQShFN5zVImcPqNo670ZXmnpU7pjk4u3rHLeO5hSauP2i9Xw/Nq4m7M791hX6gAacE8kPxYzTAnlKDGaion73MUKolLikvfdc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92WIHQRtU57MSN6F4jTY/wP78Ka/Rn9M04Xp2uEV4sc=;
 b=IeknNCbi9M1+0dSBMBJ5wuXwEqoryEz7I/Y5ONbjIGq/WRbI5KoRrk/1f6VabHcKVtoRGEHPB7XuOXKx0L8aYc6j1R9zJGNPPkStRD7Ntk1Ezs5RwY2PLduDZzF3XsW3Rp3gYeP+ktHItpRkwIEU3917astT5j1YHk4Mb6mTCr+UDeO7U/UNAltE659TRr1ssfgMx2XtZicD/BFoAXaDy9yJwEGjouDhEkp5Mr+7VKCCsijqYD1fxN0k/qxonX/YamAehRR84vCW59MftrH4AKY75bc0sECH5v7y9DDfiaFPamiDL9k25cc1ourht/SOwQDLUP6+OksVYHZHb8g0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92WIHQRtU57MSN6F4jTY/wP78Ka/Rn9M04Xp2uEV4sc=;
 b=HYYh5t99UHaLUfxAj8kh/Lq+997xwzTbfVcOeT531ELewBOI7RXAKDVq8ZGRIhJBhXNDmku/tnOIMP68anNNJw+m/uZBP2U6BXS5IIZ84xPGFUNxgHW+aeSVrd6mWDjctok1sUUWTufAfTQlpLfrF1Yp1E4ZjNWoBtb8odN61u8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 03/10] blockjob: let ratelimit handle a speed of 0
Date: Fri, 25 Jun 2021 15:59:59 +0300
Message-Id: <20210625130006.276511-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7edc98f4-6be4-47e0-71ea-08d937d932c6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652F63B30D3C390F11BDC4DC1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJHEhI+2+X9/HBxWua9y+7DPaaVm80LugAn6zYtRC032asHvvZith0mWk09TMi8tBlSyj0xPPiEbG9V1rWex0CTdy6WWWhRJFxsabTYAtQWtDJR3V+iGjoXDnO6vMn81zwiS30YEvjXqP6CShg2Tq0NUqdy1PHB+2h80QErSK5FGkWSdoPi3Sq0IkiG3XEnWMe9VBVqpyNaoWDBrQwhO9P/8FWmdQlRTVcLF1tGEjIe6Mz2MsIQKRKdDPVxAsglXUw4IdPyU195n46WDtq+QQRS98K0TM/e5qjlwYWzIG96pYXPVsk+dWu9CLZ8LLpCZgHQo13tnWwwJoGYdjt3xKmAck0M9b/P76fH7JSl/lEDmFVmxXM3Ur8cid0g6HLFhkQqFa7KekwWGy5ly7g0Wpf7P7Y9xuTexckwuk/DFjZTT8/U8GW9cXxdA90wlQ2xS5CpTfKQu6gRy24pvmNpVZUFLffJEaAHTgmSVuN1Oeu34lA4JCnaa/+LO2zaZZr98rAIzlQN9hCvtZDP3wnw1GZpCfSum2LqpFiZ73eEmsQQBNhTgzXfuP4IUMAHZ421G3Uv6rMVyAbk12kTycdyewBfWU0E0Ail6G+PL9COouEbELfWur3jCZldP6IVFv1JCjVKH2mvvKPmuAkxtLRyDsLw5rgnTSOQA0KI3pZaY/wFXAgGXkq+nYwLNNtEL82cyNTy3LrYLMfP0ibNA0loupUEV7DIMt2n9SKIyF5XQBnyU8yJxN9Pcl1z8tfnIHFQg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6s7HDHf2vMvzySvABnhBlKnuoKNtXIkWQYm1DEYyPEYuvtadM71+XTuS6yy?=
 =?us-ascii?Q?Rr0dQH3pkJGKzCQU2giODikZKBaX5/gzV/aoek/AgwTH99CjXs82PcC8ZQPu?=
 =?us-ascii?Q?tUXTlxDwm/2fyyMzmT/X2PL/qI3z8CBUlU7hefNlZNuFGNday2s2jaIADpIM?=
 =?us-ascii?Q?61IavDyRtdCnaRM1YHwYzkF2y1N8wrEDGfE5KGG3E4V4r3j5vZ4Ahjgq8jIH?=
 =?us-ascii?Q?tuIW5Zu/SzBtimpWum3t1rBmDYIPkmo6R0BfL5xKjJE7Tx48aoSrhQ9t9Uv1?=
 =?us-ascii?Q?1IcxssfSwpmLdPOfjd3/BySFHJpKe1u3CEhbcquiUySW8+4nl3AUAv9BJIF7?=
 =?us-ascii?Q?fAgxLJU5oN/KUB5VV3HTIKInAk2esY+bDfJNm4xGSwVHfMfl3VbgYoq1+TRI?=
 =?us-ascii?Q?Kw6lb1esSfqPO99LcyF2Hqcc9gKxFqGLEWS478VeT20brhM6utaoR37brFFp?=
 =?us-ascii?Q?aWiKmwF6yvmdQfxxzENflTH8YIWabvBe0es8tPM2+cYr/TMJyv6tWzkCVjg6?=
 =?us-ascii?Q?ADOK+Ptk9t+l74bF7EGImErvBBUR4Eq/xvPAALcW/NLzp/yu9yDL5uCsnQDD?=
 =?us-ascii?Q?83vLzlEMY6wuaOcBK1E+uAoe7CG0A2nhLhCObwFqz3cDGCzO3ucdFb/HqiAM?=
 =?us-ascii?Q?Bi/9n59+MVR7S7BK73icO2KGzB9JTVB73M8MFftPg4Yl1GDhcKCMrTJMMgpW?=
 =?us-ascii?Q?2LAiMyjWE8eVxKLI0olRw3+G3KarMWf8X40syyk+zYHpdRqL/NFOYYaXgDfQ?=
 =?us-ascii?Q?1WuV9u7CKnHLD/OfTCqv98bvN8yvtGOMRA8u+3gSzVsndej1EZ4bzf0cfAup?=
 =?us-ascii?Q?xic8xul4z+lMwHtZVFGNvwXt8b8qyiuqV/D9T3NIbYpfV8D0FVhFNP03L6Y7?=
 =?us-ascii?Q?AD5D9AmIZ14RARLrIUJU1iCPgwGGUOcEEKniXccbMFwf6/APHyeQhhAokmfX?=
 =?us-ascii?Q?rSNzqjkF2WnjJN1qUKbCZEr0qmvDqW26QaVaOeUtt0rnk476BWbirYFHtBgp?=
 =?us-ascii?Q?M4RtEuins9mdqc6f/pK0uQWrXbinsAjmq243LXtQe6AAhf8WdBG8EKbq+2w6?=
 =?us-ascii?Q?qauuPfQ2A62M7Otz+0HdnuGEPtHIGxI0piaztY42jycKBYlJzy31ei2AkKDd?=
 =?us-ascii?Q?Pnjh4OkkoxfZVxIkgcfhKk3E1Ja7rSMKTmYGkfI3wNqnJ3c9dY1IKFkTLWdS?=
 =?us-ascii?Q?oXJb5Y2PhqEZgv+Eqpvk+6eLc0iCoEbk40aWFwMgzgKXOrvrSnAu1KrRKSks?=
 =?us-ascii?Q?BTdv4gbUs7/5UwHnKAvnOpxn/FEqlmFRR3jzc8bHG1u+jO1F7V0mHUPTvjfU?=
 =?us-ascii?Q?MAgLufruPg1CRrVgDP+X798G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edc98f4-6be4-47e0-71ea-08d937d932c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:25.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nByO9CVnuUbCDHnW4fyUfszEvfGC138cFxagfX1w0uOe7BLC4B8M4FsgpYZf4NNtYMTp+UYxCN1tVeZ41lWjx+IIqR7Qj+SNClrA4aZe5No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614081130.22134-4-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockjob.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index dc1d9e0e46..22e5bb9b1f 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -300,10 +300,6 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
-    if (!job->speed) {
-        return 0;
-    }
-
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
@@ -472,12 +468,9 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     blk_set_disable_request_queuing(blk, true);
     blk_set_allow_aio_context_change(blk, true);
 
-    /* Only set speed when necessary to avoid NotSupported error */
-    if (speed != 0) {
-        if (!block_job_set_speed(job, speed, errp)) {
-            job_early_fail(&job->job);
-            return NULL;
-        }
+    if (!block_job_set_speed(job, speed, errp)) {
+        job_early_fail(&job->job);
+        return NULL;
     }
 
     return job;
-- 
2.29.2


