Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D82EFFBA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:07:56 +0100 (CET)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDyF-0007Gf-Gh
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpc-0006NI-FQ; Sat, 09 Jan 2021 07:59:00 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpa-0003dJ-2M; Sat, 09 Jan 2021 07:59:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0brRba04PJN7gSt2tcVO6RDMDsjHGg3FiLfi6e5urqxrU+4f+hckJI/hIvy5oljLMrZkE7e56F0eP4s0Tt1gWiwJ8gXFZgIHoqvYkDw2V+eY0onbHRbd+HsMraGFcg6jNd17lALCBQj0iCwpbzeIIPYDA0LZ/DRVxWbKwn97QBslvL6c2+KWUwv/t+9PCaIMakrTT91QzYQIdWZVYbklEqgLfQSEvbp2Ws+1ArH8ID1/w1ImMWQgimSZ2SjlPGO/CivWSrxj5DkUNQGYi71pUzNv5xJlejpT1Piuk3AruAWvc+TXh4OPPq7CO6/UQWrqXNAnQErVS7wBfIYRvPX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnvxXx4Sq6TeQbn0N5jnN92TmTyGAUWeEQWfXH5uujI=;
 b=YBE73nozYuj3li8+i37A3fAO2Rf26AyBLxkgdCn1y1dYsP4fazuOg9j5hy4XeFpy+jxAdEbijlPKj8ivDLnBsSxQTpY2B99Lx5PPJSIhsEr9fYodgHJOBLThkjZYWuXgT0s2nXa2xzhEX2qHJvFbYbFLn/6vu7R9YvJvBTt0Lf8kk/E8j9NFZaM/zE7EMayNE81NVTYAzlaMOGvy9HoF1xgbYUm2RGHaTrX2kYTys0YxNuMk2w+bdqMVWp+NZngBgoA5jWgX7v0s7VvoG20zaxCb2g1CRzB4uesPfrQFBTri/eJIINlOehh3GPGHH1nBCN0/JJXAyi69Gx5CnEzm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnvxXx4Sq6TeQbn0N5jnN92TmTyGAUWeEQWfXH5uujI=;
 b=DtwLtv4zpUHXqb1Q8VT/Bgfpmrg91nXwruzJWrGVZ5AZZnVz4Pnfc8AX3qtETFR8j0Q1y6aCkrX0Dk3993kdJ/gvt2VVrjvOcrnLeCxE+EZTzEPOSVz8vtV3aZPAONctKo4S9FjXvOWzuPAdO5S0tV3MyHRrjDy6L5KjT3hEbXI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 07/14] blockjob: return status from block_job_set_speed()
Date: Sat,  9 Jan 2021 15:58:04 +0300
Message-Id: <20210109125811.209870-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ceda92-ebad-40ed-8529-08d8b49e4ec3
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418649F48B9204D0B27E8BDC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfotyQLI1mikNRmdOvmlsTUgHbuOqCg0yU5bAKwGMR4MeTTnsaBNv1Dh45lY6WOoNIGbuvpAyg2ogc3htWYC6PT2+cq7SOd1VRkT0dGnPVFeLcqTh+jEPNcA55/bDDCRfEDGJVup1ruATYPop9GRx3pnYIk/zd4mfkz73IIEOifQ5QyrmtNUrWcU4tird4Gq+CvkP0XtjmERogWngyvnqPK5G7bWGvsEP2PFwqeJ0OXshVagtNsqIaFi0OjphkAq35/DAKES4toJC+SYIudYCfRZ2i1uMrvY4g+9ORNqjTOLO5DdfKiMUwZApVVbKu1CAkuFBbf+CPXJAdqcOf56Gigy2b7FNGk87eGY1F63UGaDehamrjAnGrtFKme6EgpaeANZfXsByz8tkmcPb2RxOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OI6Qs18sIAHoN0kI9K5aE73omKLakMUx7otEe7xlvU3NC7Ar4oipnRqWCA4/?=
 =?us-ascii?Q?jKnCoK050k6aDBAi24Lxfi4EzstbB/SIgFObB9nmYn/fBTbzOHida6YbKFxS?=
 =?us-ascii?Q?FC7oq5Yfk2cy3bYBNvVZdFgqYuCHL3823Ye6lZUp9szO+eq1mdhIzuqeJ/vs?=
 =?us-ascii?Q?NNUIsPmBRtOXxK0hYXsR146fFraspf89aZC6YjWYIzstIetj89Gd+edS7NJz?=
 =?us-ascii?Q?eQEJa+UBxOhI1JLSy1wZLO2fmDPYE3tbAzJSqt++9uKNRxrW0Jof5+D8UW2c?=
 =?us-ascii?Q?ipGhY31PUB7V3TTWJZDdOaLtIaKu9mwZ3YuacMcSuTeiJZPC3X2twj1Br6wM?=
 =?us-ascii?Q?fy1w5NaQY79rSklhGxtvJNyoUIF6zzuqqkPnTLBaeIyiG4Df86YyoPUk1XN1?=
 =?us-ascii?Q?Gx/EYKzPsPOwQehKTvI3pUEwmi6cU58AtEi1DC1quGyUGu0uXoF7Juj8PZn7?=
 =?us-ascii?Q?qGvL+8N0ULEUeF1PX9juYKrBzznMUagvS5irUPlwIW3hKx7cKQrEkvjdoim3?=
 =?us-ascii?Q?h212j+QWwUUJqfT5GlUF2XcIAbOVU27doBPAenzCVafrSyu87SIAOm25opmq?=
 =?us-ascii?Q?T1EGo09TdTCF41Pn7aHeGqEJdWHGA6oPtna7Eq28/6P6qA7KmlpdBs/U6I1J?=
 =?us-ascii?Q?Y0MNuxgNN8Q6eK/gigXBXBKJysBjZdLQdZsIRO+Hb39ZtbREBqozM+Qye9rV?=
 =?us-ascii?Q?ivmvzIe4bGfuVX1J2MPSJtYMeG2fxjgX/um8DOSsJtfL7E4Y/psylUq1j4bV?=
 =?us-ascii?Q?6aV6q05eYYaFBFDiFdp1HHT/hKxscbVSH7dc+jvwQdk1YSnwtrofGkM989pH?=
 =?us-ascii?Q?Y6GAlRtyGFGqJJ0tNvimDVcptunwBfmgSEJGsmRmATY7JIYQULTY6m1/FHl2?=
 =?us-ascii?Q?fSXo0JUQmF15XTfptuv4jOmlZzDnZHPR8KCYZq/7SyApwWrLW5L43g1P1Mlp?=
 =?us-ascii?Q?PYAADf2IApWOKBcj2Euv2JRgSeGe3zkJUYnG8itcvCG2YQGzpa/WPNq6XCM0?=
 =?us-ascii?Q?aZHD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:49.1965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ceda92-ebad-40ed-8529-08d8b49e4ec3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGoH54XMv+u3BMxLcSUHTVK5GevEXz5IFVkYXYENxWe4SzrHxL3sdUANH7vs7CQwfZGPEfZfEXenY5+kUhBw1Yo0WnJ++z0FmJI9+FIylv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
index 98ac8af982..bba96a89ba 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -254,28 +254,30 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
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
 
     job->speed = speed;
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
@@ -448,12 +450,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
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


