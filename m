Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510B4131A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:34:01 +0200 (CEST)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd68-0008AM-4J
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctm-0001lW-DA; Tue, 21 Sep 2021 06:21:14 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctk-0002LA-Sp; Tue, 21 Sep 2021 06:21:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae61FhVJYwzt1OLaaK+f0r7bSD7y97ny+2wzTzI0Pi7VpPzzwn7dhxGahRwdvhEXkZ2TLuWwVY+BjZmyWTd4BOa7c4zXWf+d9HskEwFLXEk+5oa39OqZkLDGNximnnjBY4ylbee4nCZ3zdRn+XBtafhSr0lI7SgpIHr5OpAym5ozFIOtWCwZ0pOgXHsKBw2PWHqfMXrT2vQDbAmI2XS2iEQWHRjHgWzgolJz44hzutMPBjsZY+FFXTO/HhnF2UPVJQ7cq06E8j615I2vEqLJrYXXcUHEP3nbZkM44lDqq35XQv6DyfUhF1d0/ZvWfR7l15LQH4/zOtl78PTvYx6C4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2xvaZssygm8Bh7rOi1eUrBCnt039W0hM5xTn0rgu0DI=;
 b=Cl6wr0eHtzGW5egPgPqXoU/EFpNl4CcPPpHkvoRubSKigl0JvWCL/kwzuKnoTiUI44ehaeU9Jfg5/o7O8UyEXhgQ4qnhRdccA7Uxx48o/o2kvdFhu021//J3YFn5N0IlJ4eTVlceRHTiB0hWyNoUhM2TeoqYB9QqN4ho4MrffJnhajRrrFN2d81e0lWI663KrQ2j2DqysjVT4TqWi9pxWNzVvE0xhoN8kq/L7UY6hjFb9hUWcVsPNF6ZTUOmAFNF4MiUu28WwpLqJiXygI05r7UX9E30QN8EHw3glOby/g1hjxVLyAARlictJXnXNhAg1FGm957pHfhm3X0LDZZA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xvaZssygm8Bh7rOi1eUrBCnt039W0hM5xTn0rgu0DI=;
 b=PYA/Do3xR/zVL8MA4voUO0iZoRqNokVjNAshaAHZg4tTMO+3Iwe3gAeHX0kw5dqTuVBq4k8TXqv9lj4g30oiPtVswOMlwrfQo/IDKnyf6YXRuSdmSl7ststStpz4f0DZnngVch7fRhFLybLAa0RPS4rgeJd79PE6q3+coS9Z/hs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 11/12] mirror: Do not clear .cancelled
Date: Tue, 21 Sep 2021 13:20:16 +0300
Message-Id: <20210921102017.273679-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e855656d-4212-49d3-91f1-08d97ce97a01
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631535869F3836CF5FD4140C1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CPZa5l9sUxkdWc1fzF1oyvqnnUiZ4mTDBN/I/k7Ue1yw1pYB6zCZd/Mvpwp/ykYVPfhLPoZ70xNTNGKFpH6f8t5c74g/dhdn+krBI7fIaK7fy9JphEKaUlc9G3Nme1gKzkMo0JuUAQGX5d1hQ+qMB97EB4TzgdvH5WfQyhNPDwEemHrQwYbqsK10YyoysYkxaJSNzUSW+SjhZl8JS3pUepuVGAtL6PniOX4v7zWgOJn7b8ZF++fstx0VuarOE3RzRCOCLzggXxLjFA/xK0/rVbYInerC0Zr8qKFuGrwV98NtMA3Sfe4lF6Smetk9q6PZ0YsV8+T+GWKzsImrraHbGVR44r1hy5ytS6GZcCnBF+cmn0kAlbFlpCWmGd9yfkSD01Tcr/dI//c23mnVYgoNpR8Y71n71uGfODjIAxaW3aahmgH/ogNVeeAaVcXHSS94f8MJ/uYelRxfAqUQurEiT0Bu+KJnH+51iT//O8PIP6LNQYQ8vXqJOFTJOHoqsoMVR4bSxjmPKXJJIIga+09tvQUWiUNaFnFnlANbLcL1oksRlhCgrN/zP0mrC0Ql2CG3XOmUvVqMXhAUo0fZYI+Pq7dWl4IhdmBk+DcI8R9T82x60hFo8UmJLJqwRe+565F2hgeL3IvRs6DaENT6Mqk4TNfqLSfHWAyJbw/kFyq/kV4xx9ENWS/4x4eFaH8E6u1Nc3mYVgEHTXsTB+s0AhjRgE++WC5UlL6WJcenFHSl1NA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQ+OYrpHCp4zugiglH/1uCDVZKW7RQHM2c07PnX1flxpeUhYqt/lIHWanSd3?=
 =?us-ascii?Q?XHWpmbS7pQATvoGeacvM2uRbeMSpWwVdC4Kl+JfU6y3T1KJw/rTpHnSXMZ35?=
 =?us-ascii?Q?RuxDiofwlyoXn04Vd63fDbgsyTHDr2pTOrBs4uNs47dEhyefHP8NI/3lFvKB?=
 =?us-ascii?Q?ZVWteZ7ap8RG24N5p8bk00V+XcAuRb+8XCIEpXK/E14mPXzLAyggsXUdKIAx?=
 =?us-ascii?Q?sltllM7DIe47CYD1tCw/aIxZCD6J+GBy51xe5H+NYaJW/Z8fpk9eBc/pM0WB?=
 =?us-ascii?Q?OSuQ6YlNOKPlol7hCoATMZPoxGPjIHlTfSoo6tQpfNpi4cf5AwjUArQjutdM?=
 =?us-ascii?Q?PU/ZYNWxo4oJEk0BB9X0QrlhtGlw0sPANHg6ns4oagshJtAf6TEqi9tkhUgO?=
 =?us-ascii?Q?e771GapRU3Y5MI5Hu3794w7OrA4mB7h4Q++HWi5SFyVR3BHM8HskoDy/Fi4s?=
 =?us-ascii?Q?6tOQ9zT3Dukjo6ENaAl/ncQTG8OI/JHVCvDHi2k7OyxOgy+HuUJzXMKUEU5O?=
 =?us-ascii?Q?6F5VVYKqFPSyN2UWV1qd311Mbd37u/kFA7Hvde9X2XMhCrd74LUS0VYUItga?=
 =?us-ascii?Q?HjWRePTfKDvdG9bX2idI9sYHkb4vpl8z2W70usJgQSSGQObByw9x8mxcgdaX?=
 =?us-ascii?Q?1d396qxNpyROW8hyNTBxC83VtygpI9BcQuI12On8gCQMzIFlCsHBCV0BK5h2?=
 =?us-ascii?Q?nOwEmdcxOc5l38K20o6wRc74ZHeGv6+Dchq/ooTEDq1VkMiHvn1RP2xNVBh6?=
 =?us-ascii?Q?AYsqjVIwrsLm7tiIf4tlLXV5Q7o+J7Yr0WPIpdqsWL5+pTKQOYpQCf9e/oOF?=
 =?us-ascii?Q?19itX0zPiftIqwEHs1hrlyhYepFOKJghj7nWTZ6pMUfJa2+4qprZ5tb8rX81?=
 =?us-ascii?Q?jk2zqQ8UOhFteZNovUt+hFvzIBV7zCpm6KvO+uiIo1iy20hT18zYHkZ+1gce?=
 =?us-ascii?Q?QzYMxjEVdtzNHSxd2Liy6FObF/ps3suo9HRNC1/BI0SLksfeEQH9mpx4MPq0?=
 =?us-ascii?Q?Kve45n4+Td6h324CJuayURBB9SyTSAz94K5MITsF/+hAzGK6yab1VTp5oyL/?=
 =?us-ascii?Q?weqPgFP28o61ItR8jMOlg4XPScCsnSpdFBqitcpYgvmHLEou2zRYaYZoSEPg?=
 =?us-ascii?Q?7G11NLPdqVcrCPoEr/opRVqZ1ccbnxO81B0Gi/tcbvMxUjTU9J0kOCUKmoxJ?=
 =?us-ascii?Q?tPpEQi75AFR3+KAOCa+muE8YAtsaOpaxn8+gI75eB12QeEvNuy3GuHRBYqDq?=
 =?us-ascii?Q?IvVCcm54XGYEbbMIvOTh0ijgGEoQkx4PgrLW+r49SEYvTr/782Lq1pCSY/JC?=
 =?us-ascii?Q?8Xu0J/S07Cm+iDE+zO6ZBpPt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e855656d-4212-49d3-91f1-08d97ce97a01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:46.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUVuEJQcr9lh0awEkWej/LoWfUISdF3MLcIiyxmEK4JLW4IjGeo3n6dgSDYjmoKsXC+GDzVtCPfQNarbKDmmezqO7GZEToOQPt96E9O9tms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

Clearing .cancelled before leaving the main loop when the job has been
soft-cancelled is no longer necessary since job_is_cancelled() only
returns true for jobs that have been force-cancelled.

Therefore, this only makes a differences in places that call
job_cancel_requested().  In block/mirror.c, this is done only before
.cancelled was cleared.

In job.c, there are two callers:
- job_completed_txn_abort() asserts that .cancelled is true, so keeping
  it true will not affect this place.

- job_complete() refuses to let a job complete that has .cancelled set.
  It is correct to refuse to let the user invoke job-complete on mirror
  jobs that have already been soft-cancelled.

With this change, there are no places that reset .cancelled to false and
so we can be sure that .force_cancel can only be true if .cancelled is
true as well.  Assert this in job_is_cancelled().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-12-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 2 --
 job.c          | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index bbf5815fd7..bb837db46e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -946,7 +946,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
-        s->common.job.cancelled = false;
         goto immediate_exit;
     }
 
@@ -1085,7 +1084,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
              * completion.
              */
             assert(QLIST_EMPTY(&bs->tracked_requests));
-            s->common.job.cancelled = false;
             need_drain = false;
             break;
         }
diff --git a/job.c b/job.c
index be878ca5fc..85c0216734 100644
--- a/job.c
+++ b/job.c
@@ -217,7 +217,9 @@ const char *job_type_str(const Job *job)
 
 bool job_is_cancelled(Job *job)
 {
-    return job->cancelled && job->force_cancel;
+    /* force_cancel may be true only if cancelled is true, too */
+    assert(job->cancelled || !job->force_cancel);
+    return job->force_cancel;
 }
 
 bool job_cancel_requested(Job *job)
-- 
2.29.2


