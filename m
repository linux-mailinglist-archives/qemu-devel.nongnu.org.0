Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E875A413196
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:30:06 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd2L-0002ds-Vu
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctg-0001fs-UG; Tue, 21 Sep 2021 06:21:09 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctR-0002LA-4z; Tue, 21 Sep 2021 06:21:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQOSv9tsjmSAOyvjZ8Gpg6etOnt6j/xDj5xqIPXyuGg74r/VoowEGf+98YiBQ+oFUWMDg7DcYbutY8pS5Kd3Wv26UqQesmMA7crw48cXmKMbFjm93q4+nWRE9QqkRG7Fihxp2FzQS8AIfuLSXt/H2ekHvxVYuqiQDa0pSdHRgGhmZwHjSdNW3UWNFRjL6QiSbTUU2SEJur2J3apr+cDWQvbt1WDs0xOxNQnN0bjEnBH91q3Ty1e2ySUjRH3lhYj3h54apAfM422S10fmxM4QfnYpm/oFNUUk3Ym3FsJ39hFRlRxSM2R6IvHnB9S7W2NEfBn8u/8dmWXPkekLhhYfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XQNFKGXBvAZbVAEPBOJke/CZRitq4Ze9hYU8Tucj3PA=;
 b=n5y8YclADkAm8yDdt+JRFdW5qe+KkJNNt/3WUKpeA0huRqwjt1fOOGIPTQh4jtGK8wnRvdxd+8BkB+bptH6MEbsx6o8ssbQlW7dIpNu4gnGc/xKmo1S2VRvqQx0it6gRBf2Hhhtju1sBXoV5Y+Q8nTut8L1yU2BQUizcZgPsXDTJKxRW3fcLUPw8AmdwmWtCVDR3qHxWwQSyj9Zbg/UEm7Aij31BTcnKqhVhHQ44k5LJ5xBQLBN3Fp0JVpVhEP5jKMVg3rDQ2DnlPt2T5KZIQYGxKjVRTx5QWSoWRhMuzFPoz2vkntquVbaKtq7DLSUs8scouLZDhhnVFO84Rv3xYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQNFKGXBvAZbVAEPBOJke/CZRitq4Ze9hYU8Tucj3PA=;
 b=JAl5q3DCZ49Z6E8ir0cfZMAOL+io5+9AOzAkZoJ5chIj1MwmlzDPjG1+BC2xqwfiKnf8rkzmPm3UV/hW/WRGMeNCqhJPF/jE1TpUFCwVmVEf6+yFnekNDOj6OMmOkggdUhPGJbkV61xQYdTe48CgOUoGofRg5LnrFb4UUxdG8E4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 03/12] mirror: Drop s->synced
Date: Tue, 21 Sep 2021 13:20:08 +0300
Message-Id: <20210921102017.273679-4-vsementsov@virtuozzo.com>
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
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98f7d7ba-a543-48d8-aa52-08d97ce9748c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66310483CB0787FC2ACD50E6C1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YMufcraZepNbiEqcA/aGbdBHR3r4DHF99Myyw9y8MiVqzWKRlmnPqHMS8FUWYj2A7XiWlKOawUqmeO4sXT4q6aZJhR4zyYe9jWg6gQuLfYpyajbpCAoYeo0ux+zNjxn8zkgUhNy6BB9ux+s8Htk0MBs6nyNTKKF0eutcbmVgGX9izcI+Nsh7pTPQKkO8oS2okMWyepXJ6AFFjzOfibu50BM9WOyh79zkMFPr+xwur0PWdYJBPucxV2PwG1x5hAwdUgKNJj/y055W32Sd5YUekaWYLjfFQwixP5iw8WqHjfW/odF7mk6h/C4BxA/za1dswU2cExxYpTaXDB4MhGfwjngLK8ZLy1uBtUSX3aFIOpX66LOGyAXFnItxf5xPlRyKOQEvsJ03DT7QNl6MQJynqhENqokYB7T/n8OTUZhssmTH/qyaJYXqxnoweDxv/4UAXrCG4zRxcFHGBSVnQCwNksn+uWgP/Z1s9WYK/9un7F60sYBt820SOPrA9BUVIZFBKAHL7s4u3EBv1/Stdr5TJUzPV8GOMUodyznjhvUKgJfndWORdoQ9vxFMJQMD20Q7xOu88Wrm2ZdvTa991JAY8fhnnM66PEVtA1HAekKTtnu66ilIvwZAFVyfiDsyp3GHM8CBUsIBxdGOPxMMu/qVB3U1AFgIoFltIh7sKYv718SaJVd54ljOd52Lk65z8GZOCRf5xV3F/KFvQGHPTUlXzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9IqYirsTfPFoanwe71V3AznI6fGToidU+Wn4d+MyqT4OjOIEJ373GpJaDvbz?=
 =?us-ascii?Q?GxQG5S9V+uxfnBB2Dx5Y60JMhOJCWtX2LjR1E/zGQl60tj41moflFYCHYbC5?=
 =?us-ascii?Q?rL7qVoCODl59iZsDIvyrLJRW1H7lYDKApHpex/IWC+bWJBCdUxnP0W3rzqG+?=
 =?us-ascii?Q?JGYJLW2xQWEK/lXHB490jD8q6/IkAjaKPmUfJEms7EkbI5zpRhLwK5x+eQct?=
 =?us-ascii?Q?B62SGW4jryyrEuhNMyhRxsQApNP99RBo7AUkhJIx4bZmT9kQkUtppn3Phxxl?=
 =?us-ascii?Q?Q3ZS3ZKa5vLyPY09mzHsd0TdM25LV2VadAVkK3WjIzc+Rssv2HJPtiQUcPQR?=
 =?us-ascii?Q?UQJTX6dWnG3DjG4nl+T76riN9px8hYAJE98OVcfrPMo79e6qe1dPW8gZ+fps?=
 =?us-ascii?Q?O2xQTcv8keRgGcyB07P0+uaAxj8womhNeORhSNXxJm3YQpU6BzMZLZfapacf?=
 =?us-ascii?Q?feLOEh8PCawiUBJlYXlu96ZIVT9j19AudErztWXG2y2y8EnDn3SPpjmDiSF/?=
 =?us-ascii?Q?06wPAc83fdT8KPKcPFHofLrMeniNBSIGMdSwARVSGkrY1fyjL3yBWgWFE18+?=
 =?us-ascii?Q?57l2r4MCHBIILzoF8rAecEYO5nwazwn4H5lmgtF4yjgQfacr7ejAwWV1/xuH?=
 =?us-ascii?Q?IpRJQxQIyoKmM+zks2JCbDsJJ4/KyDL0nx15qKz9V+S2MLHjTqJLSLDlqkdM?=
 =?us-ascii?Q?S3IswmqvSr7WhfyGNThmvd6kfGQxqdSFdqdgkgKaR5DjXHS6lJatCN5Cnl3z?=
 =?us-ascii?Q?cmzqhcjrOBPVB0qoaJtjRJS94r1sLm6VMuN8A9udtHnDXb4yznKJqOGklxt/?=
 =?us-ascii?Q?OXz4Wj+6U5twTaz1VIbW+CHFiyNqQmgX5uokxdMQd2fzxraY0bE0jNWfVtSX?=
 =?us-ascii?Q?g3a/Q2L6rN65Xcyvc8ohvP94hxznCRxd2MCDQH5/zfouVrP2PzVtWED1lML2?=
 =?us-ascii?Q?jQz1nJjNq6pAHt7jbSlbFf/sjdFtu5bBEITDPz3F5KflZ0HTsOeIQ1isWOXl?=
 =?us-ascii?Q?yqqmoFeMkF4OwSmeU+bHm6Lmq3Sm0LY3ADWPq4LTMLLznWxZPiKAUUYXHmKX?=
 =?us-ascii?Q?PHRlz1tKhr5M1P1vBa7BjmJiG5skooWa/yqDs/+OzjKNlNOKT5GG8e3lTMhG?=
 =?us-ascii?Q?olHBJN/xvyt+5x/5zueVdSwZuic8mILFF1Pj/VVl8XPHHnZW8lAnvxAO2FdP?=
 =?us-ascii?Q?3kSMoWXDOG/tFcj2cx/EXibIwF75MIv7NnloE5j8dkO7AvVnP/qgLpK+3mz2?=
 =?us-ascii?Q?1yaPlok5kiUTU/655IhwHmaqxzSu5MiTVcen24PeV1zR5wmcmYG+KylOXVXx?=
 =?us-ascii?Q?UH0ht+9OXZYhT4+DiQS145/L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f7d7ba-a543-48d8-aa52-08d97ce9748c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:37.5410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3SsOJd6f1h0NwoJB1MYxKNKrqS4kdZrv1BdwyMm0wwX+hcgIi3iXJNQBR70iCBGjm0mY9WuAoHHJTMxSvt4ae+zbgts0K4ISa0hfH8s9g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

As of HEAD^, there is no meaning to s->synced other than whether the job
is READY or not.  job_is_ready() gives us that information, too.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210907124245.143492-4-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index cad61496c2..86ddecb86b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -56,7 +56,6 @@ typedef struct MirrorBlockJob {
     bool zero_target;
     MirrorCopyMode copy_mode;
     BlockdevOnError on_source_error, on_target_error;
-    bool synced;
     /* Set when the target is synced (dirty bitmap is clean, nothing
      * in flight) and the job is running in active mode */
     bool actively_synced;
@@ -943,7 +942,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     if (s->bdev_length == 0) {
         /* Transition to the READY state and wait for complete. */
         job_transition_to_ready(&s->common.job);
-        s->synced = true;
         s->actively_synced = true;
         while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
@@ -1035,7 +1033,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         should_complete = false;
         if (s->in_flight == 0 && cnt == 0) {
             trace_mirror_before_flush(s);
-            if (!s->synced) {
+            if (!job_is_ready(&s->common.job)) {
                 if (mirror_flush(s) < 0) {
                     /* Go check s->ret.  */
                     continue;
@@ -1046,7 +1044,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
                  * the target in a consistent state.
                  */
                 job_transition_to_ready(&s->common.job);
-                s->synced = true;
                 if (s->copy_mode != MIRROR_COPY_MODE_BACKGROUND) {
                     s->actively_synced = true;
                 }
@@ -1090,14 +1087,15 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
         ret = 0;
 
-        if (s->synced && !should_complete) {
+        if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
         }
-        trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
+        trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
+                                  delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
         if (job_is_cancelled(&s->common.job) &&
-            (!s->synced || s->common.job.force_cancel))
+            (!job_is_ready(&s->common.job) || s->common.job.force_cancel))
         {
             break;
         }
@@ -1110,8 +1108,9 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 || ((s->common.job.force_cancel || !s->synced) &&
-               job_is_cancelled(&s->common.job)));
+        assert(ret < 0 ||
+               ((s->common.job.force_cancel || !job_is_ready(&s->common.job)) &&
+                job_is_cancelled(&s->common.job)));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
@@ -1134,7 +1133,7 @@ static void mirror_complete(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
 
-    if (!s->synced) {
+    if (!job_is_ready(job)) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.29.2


