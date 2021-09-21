Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91441316C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:23:12 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScve-0004At-GY
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctK-0001HN-KO; Tue, 21 Sep 2021 06:20:46 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctI-0002LA-6i; Tue, 21 Sep 2021 06:20:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkNWQU4TlEBGigeF44y3FH8s/wmw+nH2BcY9b6lTmTD4nny9Uonj1uexMgqdW/EA/G6zuUsL7ygP5CA7IDKwvbSy/U/nz+OlIh5LdsnKsQfIhcyhYOjXZfmsirL494C6Cjmn+ZlPzS4zK/BkcCCwtk+r57JA86h3vn2aRB+9fmkUGESt0GhPgd/NntCvlA+IBG/hitvkVcZvVJCwAsFEUd3Hfz9JlYzjEIYHoa4wFDqRtdhj2FjVVopLCyHrP4QgZcLVReYAixOv9tB5JygGWbvWkSxOSlNw5/+tLjqcWcNYjBgpDBLvtL1Gt4Nn2JBDrecJkyyfDnIOJ6YIoqe0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GGGyH9opW9gsNAVl9bR0Y/OZG7Q/NAepFfY7PMujBE4=;
 b=jGU9iVtdMMnEb2gJq62/i/bOxkGftoMzosHvM59EWSUlIez9tb0B8B76+IsmQKHDKwixVR7UYz7cmjIPi1D2dR62z6fGgqsS5ng82DBg2i0Jya6E/gfAgjZrY5FyPc6hpmc04qvCY03ti/KN+FDYLbRbBWw+QGnpwApP/5RHEbVwbJKP/oZRiRWZF3ut6s5yOZcZNjF3rLjCIriE2G2yHKd+wv8tLZiXAZIGoGenhbiOFxRGRNT/e7AqKRdDfsIreb4krC8ab1USfugB4FXb8LnOwvkZCZircpGmMMHZyilbUAAjY2f1OPE9SlWnyQukb54c07/Pj4iv/KbgrsD19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGGyH9opW9gsNAVl9bR0Y/OZG7Q/NAepFfY7PMujBE4=;
 b=neMJvoE3X6h6vG6djinLjDZDsVAoRznOluKKx9QPKE8LmnkdDAD4KmQ/IpOfB5dTim9Z1VCJ3yJAlhAguMbt9PVehRQyuEr3AGhdTAH8SgICulDeWk9my6yDrsDoUCAfGN2+pebjR/J0oo07RcXdjGvrP4WL/gizHp1+RCPMtno=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PULL 01/12] job: Context changes in job_completed_txn_abort()
Date: Tue, 21 Sep 2021 13:20:06 +0300
Message-Id: <20210921102017.273679-2-vsementsov@virtuozzo.com>
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
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4127a5c-17a9-47ee-afc8-08d97ce97355
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631B74524C12E783FC30090C1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mN1dIpE6CYDFV2EmdKzKXYpplX771H9RFNLHC5Tk4m6hfjZ5VqQUO6BV4uneOQrVUgSOxSdVQmGle9Qal8c+LxV4zS0V6bk0xYfnHCEb4woNfgplu31MhIoZuGruRMF+QOORWVNAvFIMTDCcD0yAddlyZZpnyhNota6n2XwuUuXcHLNKNAyDhNycjsiUrIPqWwFHs5JhjKE0b7I9tHchrZ2NfbiKGhBG/MH/sAJWPkJyBVgcjbJyuKynpAvDdRewgq6Sfd8+K1s0mW1amN/YFLQcbZhBhBc1++tVWTGE91It7tgQaHIQYbBjdWncmdSNaJPhKrIPHJx/69wubvNEDXp74ajUBG/oQSpKo1B59Zg5oEpGh/xeHLKEO2mQ4qCTrWdjIhRLYs3bHpA03OePJ4OCsHeUy2Ww21xhPGAOlk6ZVFVzumiJ6KZwXKus58HrqdbXgOzGnI0Qs4vtAjmpi0jYOBRJOGr8NQQmBKLoC2m3PNK5i1AnawQ2WQ4sx3LvARDCUnilg/+SgS2mNSIuAFZVy5uOYk8oSVr9zWqekNq5PzQ8WU3YbDES9e5MuAUvugTul6fhtQVj/Dnx1bGr6yieA9sNT0wUtp2ZtgS1r0rBkLLHVts7FbG3GOidtrwJ/2KM0YAYUt+M6b9MAhgG0o4kFYImLYSamDe2nEtF+TaNLzjCUFAQ4iWE6HQutUVHO7HrQT8l3C26yWNqhubgKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0l7H53E8/qZEWWzsZ425Ry17n5Yn+MhmluyE8f+Hojz3zYt+TawRdLBPoJ4r?=
 =?us-ascii?Q?U94YW9/YWH+CQQaE+67Z1Eg92B9XbRDREoHiX1NQwMyWcLqAZinEpowoupH8?=
 =?us-ascii?Q?6aVP5QE8tn7IBzsjRSsB+WtvSu0GEmjkhB7XK2Trl8kdoa0eOy1TOfxd4ymC?=
 =?us-ascii?Q?lOKKrl+JWJoF2QOCWUX2Rc8AfQJUt0ygGywWZhzfn61D3/dmsjhX0dFSQ2pq?=
 =?us-ascii?Q?VPwKLCzf2BjSlXRPEFJPnqY/I9nIl5iCGvGTp/A6m0Rus3wCbGXE1YbSgli8?=
 =?us-ascii?Q?LGIjJE55icLZtbw/k33L8QD/e4FVeDxvV9jo50iD1iIJCmky20rEoF+jfYRd?=
 =?us-ascii?Q?3yBmJ2Nkc20ESILNrdzwgmv9ve7peAezJ1e3PGvAh7uvmB7P3eahFhkDLNWs?=
 =?us-ascii?Q?jiaPahzCTKZHcUTaAkwAv2UrwqoH47Dy09DZQuuqCYRUl6X1D+szayNSbi6O?=
 =?us-ascii?Q?w5yc0mVDnDGsvYAKI1SMWaRTXKH7c6nIDYBdnjEqrBT1nMhAvcRRVPWU1CuD?=
 =?us-ascii?Q?SEDLgB/5mZjphSDCwzgH0LztkqpXnVqMcvHPAVHaCetgd/VYeS0/IFeMhfAn?=
 =?us-ascii?Q?7v+yOeAouLKgQ+SFYHZO3L70muu1ipM0BRdE3DVIiAp1kY5KD91MpXfRUF7p?=
 =?us-ascii?Q?C7Pq8iW2x3OHaN+Njrx5RQZfhAVGHQPK+0cbNZgXT8O7D5urBuMiDYpflTG6?=
 =?us-ascii?Q?u6SnRq/AuoMs+qBDwcB5Q7S+yza/Vqd2sXb+MQ9eexyTVPlVoAdIKV8U/oPm?=
 =?us-ascii?Q?EH1Pej+IGVeKRnJ9ydqpg256XoH5RXMbZuuQ2oxf0Gp8D5TmwOxn+LGtkqTw?=
 =?us-ascii?Q?JyjCDnnVJynNOPVgdIa3DjuZSerbjzOBwOVjtPRgt2Wf67ibBFbcxLLl2ZSR?=
 =?us-ascii?Q?rzdyt5oC+IDEURDV1i5upk4unW/U9DZtT8VFhfpQSbXhaevz01ytrgFdjX0N?=
 =?us-ascii?Q?XWUm3fqzUfXgNBStCmJHSROEol6OuFWO6ylzgHebnXxMbg8NgGcvMHUMzTnY?=
 =?us-ascii?Q?2MibWw3sWNze8sST4MnINdPxc0r7oeWq0eAVlzyGrhZOjSu2sI2AdYsfR2/+?=
 =?us-ascii?Q?L0ekXUPJXRr4t9eSRnIG1BS4gj0WHLB57o0dYBmDgULEWxT+z2qH2UnGRKAA?=
 =?us-ascii?Q?dcs0sgB18+5gVa0snyYZinNztMUcBQoiwB3proWR+qi5GUHnUXrgelfdOwPa?=
 =?us-ascii?Q?GWZvcHeQWMVmq6wYeabMrnhwv4uHOhJH6gHZ+/Z1qVLPPK6gqPh651xTS/JC?=
 =?us-ascii?Q?gG4SMTNrZRSTBxinGsZf9eh6yfjTLxZmEVwst+19Ch8/Ygghb9iJdn3wV0rW?=
 =?us-ascii?Q?eebLsqR/nurn2AWgypr5+Jfu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4127a5c-17a9-47ee-afc8-08d97ce97355
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:35.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u3NdD67FZVyFZblHkL4iBl/a4IV0rHgO1hf+GaZEumo3Gnb/zMUHi6jPd99NdP+ZXbo3V3kRSognmLtlpBbAa2lh3k6AqaDbavspgixNQI=
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

Finalizing the job may cause its AioContext to change.  This is noted by
job_exit(), which points at job_txn_apply() to take this fact into
account.

However, job_completed() does not necessarily invoke job_txn_apply()
(through job_completed_txn_success()), but potentially also
job_completed_txn_abort().  The latter stores the context in a local
variable, and so always acquires the same context at its end that it has
released in the beginning -- which may be a different context from the
one that job_exit() releases at its end.  If it is different, qemu
aborts ("qemu_mutex_unlock_impl: Operation not permitted").

Drop the local @outer_ctx variable from job_completed_txn_abort(), and
instead re-acquire the actual job's context at the end of the function,
so job_exit() will release the same.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-2-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/job.c b/job.c
index e7a5d28854..810e6a2065 100644
--- a/job.c
+++ b/job.c
@@ -737,7 +737,6 @@ static void job_cancel_async(Job *job, bool force)
 
 static void job_completed_txn_abort(Job *job)
 {
-    AioContext *outer_ctx = job->aio_context;
     AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
@@ -751,10 +750,14 @@ static void job_completed_txn_abort(Job *job)
     txn->aborting = true;
     job_txn_ref(txn);
 
-    /* We can only hold the single job's AioContext lock while calling
+    /*
+     * We can only hold the single job's AioContext lock while calling
      * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise. */
-    aio_context_release(outer_ctx);
+     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
+     * Note that the job's AioContext may change when it is finalized.
+     */
+    job_ref(job);
+    aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
      * them; this job, however, may or may not be cancelled, depending
@@ -769,6 +772,10 @@ static void job_completed_txn_abort(Job *job)
     }
     while (!QLIST_EMPTY(&txn->jobs)) {
         other_job = QLIST_FIRST(&txn->jobs);
+        /*
+         * The job's AioContext may change, so store it in @ctx so we
+         * release the same context that we have acquired before.
+         */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
@@ -779,7 +786,12 @@ static void job_completed_txn_abort(Job *job)
         aio_context_release(ctx);
     }
 
-    aio_context_acquire(outer_ctx);
+    /*
+     * Use job_ref()/job_unref() so we can read the AioContext here
+     * even if the job went away during job_finalize_single().
+     */
+    aio_context_acquire(job->aio_context);
+    job_unref(job);
 
     job_txn_unref(txn);
 }
-- 
2.29.2


