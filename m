Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4F4256FB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:46:29 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVbI-0001XP-2a
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUs-0002y1-0o; Thu, 07 Oct 2021 11:39:50 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:51642 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUp-0008Og-Rp; Thu, 07 Oct 2021 11:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlpdS5FlgUCmKhRqvyWP3ZyP5PS+enE7JYGaojdth+SekvQ49iHuehTOEh/u2j4Gbq9mcdvBqijcIoOJK3FUHgkJULn31agXQEcVWCiaOy02qnxQhxrqa5MrdDXdNuq28Tcj/NTkgg6mqggt5kh4x8QLOoBYqlGIuqcCD+Zx2vLITe2n6ZQIxQ6TNBZwVAmCvNvzM8NiWhd3FC/tcyn+OAeEbtjE4HjOua01lyQaSapLcotytws1Wf3SqFJcWa78ChriqYCE92Mxykcs/2nSAPH/8VIFwOn+Di6yIPGEJ9P/HRDiZGTMfbAo2yjC/XfLE4ZAWKDNBOqqkkHZ1a9Ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8NSIavpzuYvJwBA9LzrrSXWZKBe+OgV/I2GQXuypy0=;
 b=nOzNr482tSPVgH2opZ0U+oOLexSBxRar3xgrBNzyB/B93RRFpgVi96nfZcvtWQ1MtuOSmMzi4cwVLNae0brDbCZE2Ul5gWmr0sbjeGNf13qdmF9cxWG4Ie9XoO1TbswWw/3lTZ326vNoRSGvWLgtEC/XM20fOkz8Jo+ttr5eaCczCsUVrjI6+SU3Y5Wmo/ZqrgRJww+HJ1lETVdoWupTT+YV0ZyBJKH8TFgK2wdi6wqJBJSK7fqSg8IouSWS0rHa+QuiViSdNSsjoybIz8NtcvHZLLTd/KFWb+I0Fn3uj8ekmhAHTdTes9XZNHZvZFIJtHt9OyKdx/DFnV+jpXYXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8NSIavpzuYvJwBA9LzrrSXWZKBe+OgV/I2GQXuypy0=;
 b=rnbcbc41dTVGIoj7MPR9NzmuPdzZHxu77eRDzrMS+JM8iMj+ERV9zDsoCN5vWysFyYkXjQYfKUlhPl/8zqCMTEkF20i8WAvXbD66JboAMRgIKWt741EzXB6CCQm8GmxAGRJ8krsiuI25hCZnWKbNQidRuzXGVpGbXmTJ7k2hOLU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:39:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:39:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 richard.henderson@linaro.org, Eric Blake <eblake@redhat.com>
Subject: [PULL v2 09/15] job: Do not soft-cancel after a job is done
Date: Thu,  7 Oct 2021 17:39:03 +0200
Message-Id: <20211007153904.445009-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007153904.445009-1-vsementsov@virtuozzo.com>
References: <20211007153904.445009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0347.eurprd06.prod.outlook.com (2603:10a6:20b:466::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 15:39:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be69e6ad-d6d3-400d-cb93-08d989a8a0fa
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134C36D0919B99A0A763BAAC1B19@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsS719LpBvbZM6Deu/s5f+93+YuLm1OZqZq51Cm0Ds96+RAnX2oklbNaQLhkTR6AVWZjE+moXYhlJkR7AXA2d3h+xiWMM+UkFrwkZhJ5N7ASk9j02lVV6hvkr0saBwohnMqBMHIqfC8bnRSLtjl4xV92F/zx80DZizc+E7txFQhl3jVil1zG35T0wzRUK4H/Ehf7Nlt6w+cwqWmz3qJE5aBmtuzJhiALxqE7oEwYzecLKF7E3HVJZkCFFqvcjE4EyFwxydrEIPpMBgupgEDsZ0Lzf8w66GQN98E5aFHBz6hQfB0SuCNnK76hCnZyYxs0SCuyx05/o2JQhnZsBLAlW5wSA8q+HawMp3WEDXpxWUbUq103nj7F+G2y8gR9/ayTCKyPTr4czuqrnNsWDpNOiw7ok1T0Hs5hLnMlywyALOjArg+kf8LRL5JofTuxUSjp865OaG/AST51Go/uIHo5+jiQEEgNooj7zE+EHjtPJ7yY+p4URT2V4JVGwt5D7YbTdRzqkb6xZrAGf9WeqDe0GQbOxKVUMOOa96eHaaxpnfGnb+jyLYgEt9diM0PXGeMU1yllCUV2WbhMIBUWvPFvuQ5Y3wNyn0j0BghRlEPdAzNjXgESKtigA4CsFPP1X8Z6tTGiaP/Sa9Ok0nyZf4x1QjwUOsCjaJ2Mcl9dMYCkyC3x+sPhHx0ncGSjSHlK6YX3v6tJlH37LG5ufQyjWl6wxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(83380400001)(6486002)(2906002)(38100700002)(316002)(508600001)(4326008)(6512007)(8936002)(86362001)(1076003)(2616005)(8676002)(5660300002)(6666004)(6506007)(66476007)(66556008)(186003)(52116002)(66946007)(956004)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VPCjYrw+5tfJYb7PNYHpScoJEudEIQzM4YmtiOfXBLCxbumLIX3cv0GfKWETDWa8mPgToxIoIazQSHrlGP9yAmOL1KNJcTOIr5zIEakiguKE+tHGGB9kVsngYAyYC2CphCDQLzxmJz9quglFpPYXbeHR37+WvxE5eLxc0vechLttFLfINf8W6dDghsdGEJwoFt9eZDXxfHsqVCNE0qhqIBCi0Kx3f7EG4JGEEmUZDJ70zmbofXoLaLOQIFuOYvsQXtWFblkOUxR8HB0JHtPGbE1cED6QtqyGXdhT/L8FiHhqysFSUI2M/diAczjJzTRN5xPvDNVMuY3ffJdkl2otrAFnROQI3TX8pwUZ+n/OT2BLjPAn++pzxhL5DIqk1m1tXDUmGvyqHWxbYwoNW4CDZcemsNGRjrjSqFW6NdV0gLSuybVXZsEOmIghIy8+4UWGfVU5JB18sQxvOB8Dv+qa0D1RdxrXlejqJg4AhqWf6R/OLqKxB1d9m4gieiDAObTCh5xJ2NH6jTJEmE1g1RCpObqsiKAHOBRyvr2el99EU9w95HllFCjxGuc9A9vWRUvWjvutREHmPr2T2Q7C/oA/sevGc2QJu9sRCA1loxVs3QXVOXckyoumeX0LhAj09P6ig2CQHMucJPp3UveXzyOtta8bbxc0CJfnJGcl/ukrAV6kharyzYzksxZPSqdVHuG5kBjHDiXtryKMc5aU0TEm9xcAB1M/OcsaPWy/222ifrsH0F4A+ln9WYAOnLf2/lX8
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be69e6ad-d6d3-400d-cb93-08d989a8a0fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:39:19.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNwUD8DIEAoKnT/6bJppkPDCWIic8LYmUMGc+41g8+ASy+7LX8FZPT4esxVKmQCXRdNk6ZdMbDLl0cENwwqvPNCIpSsMdKJtjKXrpXXJA1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

The only job that supports a soft cancel mode is the mirror job, and in
such a case it resets its .cancelled field before it leaves its .run()
function, so it does not really count as cancelled.

However, it is possible to cancel the job after .run() returns and
before job_exit() (which is run in the main loop) is executed.  Then,
.cancelled would still be true and the job would count as cancelled.
This does not seem to be in the interest of the mirror job, so adjust
job_cancel_async() to not set .cancelled in such a case, and
job_cancel() to not invoke job_completed_txn_abort().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006151940.214590-8-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index 81c016eb10..44e741ebd4 100644
--- a/job.c
+++ b/job.c
@@ -734,9 +734,19 @@ static void job_cancel_async(Job *job, bool force)
         assert(job->pause_count > 0);
         job->pause_count--;
     }
-    job->cancelled = true;
-    /* To prevent 'force == false' overriding a previous 'force == true' */
-    job->force_cancel |= force;
+
+    /*
+     * Ignore soft cancel requests after the job is already done
+     * (We will still invoke job->driver->cancel() above, but if the
+     * job driver supports soft cancelling and the job is done, that
+     * should be a no-op, too.  We still call it so it can override
+     * @force.)
+     */
+    if (force || !job->deferred_to_main_loop) {
+        job->cancelled = true;
+        /* To prevent 'force == false' overriding a previous 'force == true' */
+        job->force_cancel |= force;
+    }
 }
 
 static void job_completed_txn_abort(Job *job)
@@ -963,7 +973,14 @@ void job_cancel(Job *job, bool force)
     if (!job_started(job)) {
         job_completed(job);
     } else if (job->deferred_to_main_loop) {
-        job_completed_txn_abort(job);
+        /*
+         * job_cancel_async() ignores soft-cancel requests for jobs
+         * that are already done (i.e. deferred to the main loop).  We
+         * have to check again whether the job is really cancelled.
+         */
+        if (job_is_cancelled(job)) {
+            job_completed_txn_abort(job);
+        }
     } else {
         job_enter(job);
     }
-- 
2.31.1


