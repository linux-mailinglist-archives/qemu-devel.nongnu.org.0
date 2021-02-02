Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7DE30BEE0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:57:59 +0100 (CET)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vFm-0003Yj-Ob
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8t-0001K0-G5; Tue, 02 Feb 2021 07:50:51 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8r-0001yT-I1; Tue, 02 Feb 2021 07:50:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VreWFfkRSlKxZmZyjezD1++iLR11Fgfe2NwwNtMh2gaCA8XFEUa+QykK9GXVTIJ0Bpp3lyUjTodx/IrS91zkM54n2IYTMQY8cikJwwb0MfD1656WaneaOADKR83/VsiIasxPJ7XK6IypBCsbl2pajXRbLUcQBr3jJHS1P3QYvh3CW1QbuzIAWG16iR101ddE24lAKjcagKKgOaIQ6PoTIBoIdqmRCMKE9oyemNeYg/lG2O2aigYbc5vEZltlySsUl26+/TBmJsRBURBJd7FTtKouL6Js1JTPVFhswdHkxn8u6V2ckvrg7JMNoZJ3fzfrutfDvnIaksed4AezmPADbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tT1fFIogUV2Hjar0Ka570g9bZoFu65NRMIOSdWnyOk=;
 b=d8GlRUCFjL3AksvxzGaF3pY2QJW5B3sAnV9PZzeWYyTjTuKqtmd/bhU/w2FSMH6ShSjRrtYeC+y8LiUrM27EaSA4zlaWFhF4QpZ8ItqUn32/ceT4x1J1NPZJK+ZZ01D2aXVX6MIdEafYN/aTHppSop2KP1Gio7aZxeiEa5pVMyzfO0JrCzDe0/1suB48lA06ZCH7RvzoW4gUptRrN62wMPt4E1BKUwA0pV+IW5KFX+xRFqNAWUUNRmK6PNyCxyVOw2KDgALLaGhGdNetyASJAJcqroxdw4BEj5Q7jFhaLvJX/AyZ6xBegbofahHOP8+/+Pn5vy//VVszd8FVK5Tt5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tT1fFIogUV2Hjar0Ka570g9bZoFu65NRMIOSdWnyOk=;
 b=uJ0nvanLni3yJXkz72UlXS8mDw6MxmTh16TjwItj4dYpS2piApzK4h43ryoWdrLlWK9vTn1yYQD6xaxd6FOtwJmX0/CXUjcKtVxFARshBAxJT7Qgbw4N/rB1BWdTBYLXrNJZPzKagvlGdgDgK4aPSJC/lmaHf40mCcUirPjcfOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 07/14] blockjob: return status from block_job_set_speed()
Date: Tue,  2 Feb 2021 15:49:49 +0300
Message-Id: <20210202124956.63146-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dfb6dca-4c96-4722-8b21-08d8c77924bd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35445B5A8613D96D6E6EFB6EC1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uu8/Jvmw5UDXw2ZvhE0nvczkIJVUhMGbJAidtIQ8a/tJBTUl0ew+/QEJhR6UdgrCDYaTEhnB/c0CaPUU8FIrc7BWyoFI2KMls2/pR7rBs4ZrNwiu/pCXlmHLSXkmXtJrtABVzrkvb5bsLhEhM+foTuy34x2Hg6KbA6JeLS0Pd7Lyx5kJmqJMRAYPgN+cJvRlJRplwY6uxzv9OxjVcTkB7Zy/I/9uw2FfJxmkWQP5xyr8GlciN7swFyxfoDecBRL+JzuaswzrzFtbXgI816YgE2paReuAv2D/V2BUAGmONaIqG949AOxIg+7RwtoOJYr3VgOoUtomrjVIFPGG+YE/1sjXAptUd5S7iqhDdpa2z2o1JiN7M8BgKHa7We4LUg4imWdLU0nDqQMYUjWgoQZztwydx+wyiPpR0Em9v0QzRypzoEYLtPTG/zgsTxi4/Am+gv8lt0DU5goy5sx3EhK/iRoJQSImO/bNN6pheVKkP6BKa/Cux2wXMSTx2mp9xCwKXqG5NPORJSvT50F5TyjHgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?659hM8MXqYP4FFElJBoGS9RHHG4h206ET0nP2Wi+iRPaSgLusg5OpqPCQTq7?=
 =?us-ascii?Q?u86a4S1N3U+nLTqQrvu7ut4WveMoOJjLa1RiiK1I2imwk+RyPaybjRqRpPX4?=
 =?us-ascii?Q?0jkIH3oIfOgceZ8bLESmELwh9w1lnA6oROgwRXhCi/Ep40vpPaOrljoEwF8G?=
 =?us-ascii?Q?tBc6NN2ZTzDmyNJ+26TEPQi0pTZdZD/XG0Yth57iaye9+RCCqSfPOJwqW40w?=
 =?us-ascii?Q?R7wllAgQZrfY2gYAybNcsMDioe7Gt4e9okr8RERKlxZfmok9l8iUOzQQo/Yi?=
 =?us-ascii?Q?Ftj54tigyEsBTaWVtnOAC2FKlYfx6KvDIZeWXJ2MxVw9hLqgHcJPcs5MHZBg?=
 =?us-ascii?Q?PsnmeOb/a3zJm3D/FqN8BfkwZOjRW1GnsrytgodoIIrQsk/InXgf5iS6N7re?=
 =?us-ascii?Q?CNMw+oOcY52cDG5AuUS18rXrzPSOuYyhr2W/RJ9l+XconQokDITYKyz5tWsQ?=
 =?us-ascii?Q?SRYaKK/egpJ94US1NA/lItwU6Q291u3ajmZUg/e5/8aYmRE3xAG69QfEnBkS?=
 =?us-ascii?Q?kMwXxxVELzQ+eMMJ8fFItTlv+iV2lwJjH4QQ469hnX+BoZwj3B7SoceuXdlY?=
 =?us-ascii?Q?0lu+XQ3DA3ABIbkZKnShi8gxn8jXzk0TOqKAcNM9VXCNjDbFpPZ0YbM4/5/E?=
 =?us-ascii?Q?2hweI8mEeAnLtd7FmMMw9Oi2vz1R89rZ9aek2tYd8DMqktWa1GQ80iJemqsc?=
 =?us-ascii?Q?ZrOH8tg2/JeRGJz/VBONafrg2GDVVWC1vjESv7eETC8dZdXTL1HqejPYjWZi?=
 =?us-ascii?Q?JRnI7qQfVghLQgc5LNf/YT6YMovAOhH8q7A+80npZ/QLXJNcd9hSFa9Q1MI6?=
 =?us-ascii?Q?fEMELWR/UVOqLKN7vo4bTw7DiIv4Lj7UAFxKmj5ikhJTSZ6BAM8fYyBQl2BX?=
 =?us-ascii?Q?P7NULMSDjsGP7gLi1j79Kf3L9+kbUD53+IRNuQOsYiIq3GzCnNefgIsribRf?=
 =?us-ascii?Q?PURvJHsIAE5yaRj4hLNbXcjmAlFvy8znu8tPybbR1jQ78URmqq/u3FfexO+C?=
 =?us-ascii?Q?myalsj4Z6CuJvqp8hXLcO6aLmiIyKaQKn5V1SeZl1T+HP8l81z5nVCQ2zIUQ?=
 =?us-ascii?Q?BwHLDQnz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfb6dca-4c96-4722-8b21-08d8c77924bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:39.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /V5ADtQN8jDEacq338KCSpLd+CN4UbBGyuk7g1L2ARJg1bP8tQEMQzTXzxH2whVVq+Efln87NF6x8TJu0Ibpegj4tVOXiDZYQfIj1GXqiag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.120;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Better to return status together with setting errp. It allows to avoid
error propagation in the caller.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 include/block/blockjob.h |  2 +-
 blockjob.c               | 18 ++++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 35faa3aa26..d200f33c10 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -139,7 +139,7 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
  */
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
 
 /**
  * block_job_query:
diff --git a/blockjob.c b/blockjob.c
index db3a21699c..c96cf7c08a 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -254,18 +254,18 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
-        return;
+    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+        return false;
     }
     if (speed < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "speed",
                    "a non-negative value");
-        return;
+        return false;
     }
 
     ratelimit_set_speed(&job->limit, speed, BLOCK_JOB_SLICE_TIME);
@@ -277,11 +277,13 @@ void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }
 
     if (speed && speed <= old_speed) {
-        return;
+        return true;
     }
 
     /* kick only if a timer is pending */
     job_enter_cond(&job->job, job_timer_pending);
+
+    return true;
 }
 
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
@@ -454,12 +456,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     /* Only set speed when necessary to avoid NotSupported error */
     if (speed != 0) {
-        Error *local_err = NULL;
-
-        block_job_set_speed(job, speed, &local_err);
-        if (local_err) {
+        if (!block_job_set_speed(job, speed, errp)) {
             job_early_fail(&job->job);
-            error_propagate(errp, local_err);
             return NULL;
         }
     }
-- 
2.29.2


