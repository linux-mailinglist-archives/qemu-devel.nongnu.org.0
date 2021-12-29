Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE7481647
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:26:56 +0100 (CET)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2eb9-000152-NX
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWO-0006bo-OE; Wed, 29 Dec 2021 14:22:01 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWM-0000B6-N1; Wed, 29 Dec 2021 14:22:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGdB/hD6/Ldms3SZ41gOZLGKDZ6VA0XjImqVJORHv0QQsHx19aY7eY2neHFTpdiLsrHs0/6FhprheZxTh/bw5vxtVd5R+AZkmBItoPoH5TerYp+bu+DqVwq/3Qha7CvBHPH00qSjSrMOYpCaexzfY0rCxRI9eyiBeTj1ESDd//I/z9CoxRVQU6BeIRQh29nG9axfWeZIxC5VzOBT76lkKRDg4aME7ghcXE0EbAnYB6FJs30c18uLu94E/mZKQfBNqf75YA0zKzXmpRJKfdsUweuouzp0V0IRHCbOce0bTKyZ0nwEcnMSiRIO8Yq8v2x8bUVBSLEoIs/wSubLE98SqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwRSLijJwtMQ8wi2MoQWbVYoDW0tsOv1cUG2vNnkRfA=;
 b=TirAy9eGIors7TerYyctQReOdVHcOoVMDg1PvSMFaqKnSaQFvPpQMF3Sd3TyyXgFKUfDT6iwjlLAJVsxyTDspv3aHgd0hGaOSmFzNoDe66XWBZbB4T7nGPRPeFPDuF+Qghd02eeBCtRnh9iM2iqw1ruqA4FTKHQaDZpPaDta/AvNhtH0WgCQNIdXYhvvi/2/rQr979kHLZE4N2NBakNTpjssD2E69hQhJWxUTSD41crPBqNWA8Nc3jyet1LKrIqxcdIttHZYiEjcOvxZ6diIDlo4TC8AF7o+uhbjDTlzS/e3vym0029gu7M51vXbddQYj2iGyoMfgS9L6j4SRARdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwRSLijJwtMQ8wi2MoQWbVYoDW0tsOv1cUG2vNnkRfA=;
 b=m8eBM26MJVQKN0XxM/nHyYh68b3PbVGk9MrHOszlWHb+wi2xMK6Eh0UEmGOmhJOwC6co+CAWjkhjX0iEVFl8khO+AbR4MHs3w/rEhYQMhNReKMvls1DfxzDlMTE8et1+dD0No/+ahJIocz+1p/pVNT4CJP0Kcig/MICZL9/H/TU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 3/6] test-blockjob-txn: don't abuse job->blk
Date: Wed, 29 Dec 2021 20:21:24 +0100
Message-Id: <20211229192127.1772134-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 120fb2d5-dfd1-4577-4773-08d9cb007384
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2276E7ADD5BF6CF577CA4CBAC1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /r2AVI/aEZObtmenh4f+XQE9/qL1iFpw3yTAaP33ZlxD30E5rnwlc6iijITeLb3ygG7yiZety7U7QpEV4ZagJ+iPpsCEr9fcOWNXUZAO0wpCuDK01LAqBA2i1qJ8uXQSedTao/IMtpPQhbG0JTrh7jAnxnYK6yvIt9lYITn6WVFdpHRW1aASdKbvhz6+3qzL/Y3cS1NTS6lAOAn0PqywJyEEBngNd7kJTFMIuePcM0qMEJ64SOUByS5wUYc0/Oj7PpTfMCF5Axfmj7HIsPYi/arJZzL6lhczY/mBdSub+cogu5YDouF77NKHJVRbphUWzOdWYvc1kevI8QPfIOvpr9z6Alj/lpdXGt2JvuzbB1PPP/tSfCzLYBHeD4EasDLNMc8M5T3Oc2WJ4xRWKaJau6+evxYjEX2B5dSHInB/Z1YEPkTUU4tBjH0FkA/7oYGHvEqjR/1JM/xD8Q31z8Bxya6qtyqR3W9jynfonTJDxLNU4b5q9A6xNaCYTM+oWOnZQjEJHR/ONKnWAou8JeuKTxKZYbtCF/uYBdfV9ET0bJKmzBFM3fvwv3Ixe4MYzdSQJsN9IdB5xMvk7P0Rs8pod1clIynlUhGqI+oDdP91CqneqF3iBoWbbVBs2WSzEeqIBVqHY0CkynqvAWs3R5qo5UMpY23gMqhjl+7/03sa/fXkvKSGaQhC48T9yvKKPMGMMj0RTp1HZdy9GoH14tGlGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(6506007)(107886003)(316002)(86362001)(38350700002)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aBLQFUPZ1mFFmwdhPXL2pDK0R2i3powQ7qqiFc4a/gfS2X+vxraxnseECuVH?=
 =?us-ascii?Q?lJ+FTpA4GDD5hZnzKKgqfDcYJyDAEcBekpkqlRjFkYBc0K+8hPXoQDJ67qaF?=
 =?us-ascii?Q?POccMJ2z4loXxGpIGlY0txsaNKZG6TXJkXQx9Mo7uYewYLXX9GsPwb54QIOQ?=
 =?us-ascii?Q?ZUwMNuH9S8yGd41/ZLGDSJKuhsf4D7Q8h9Mc4eqmZj0vYRlWFcVIWAt6jlK6?=
 =?us-ascii?Q?PqQ3Ogiz+EjnkboAk7lijZPw6pZ6D/Mng5NtBHJMT6yQuXA87VSvFPf75DBm?=
 =?us-ascii?Q?mC1RzGL6HmABK6CCkloTbXI/h8DkEjYq6/6gNQau8hTaLcC6nuSCEUwwB3HF?=
 =?us-ascii?Q?e6uZwwlRvpZ5p86CB1rijIRXdoxgFke6cw1WZn6QPHiVw0aohN6EdCVTEYSa?=
 =?us-ascii?Q?tFBIM56IRRwnEUIFGNFye3bBfJCr/4+r+6p40snHBZBAzhcHp7z6sjApN0fg?=
 =?us-ascii?Q?WRI2t+IJFecLgYNNCGZatKkFM/hIlI89944Gr1bR6mWJBoJutMPxaSXN0ViD?=
 =?us-ascii?Q?6vMgL8wk5m92GmjPYOrhGPgQPEvOzZYkU/Wwwt0VVuPsiPUwjujdqyCbDEtW?=
 =?us-ascii?Q?LpMME1Ft4cSiN1vE+oLkd10z44vWL4N8Ep6KgQ3gx493e9eVMn0G7NoNWsRZ?=
 =?us-ascii?Q?JgaFuEMA5nrUcpMURaNhOPUoEMnZlfv4imtH0FKOCDgkNp8gwBrJOnWnL8Uj?=
 =?us-ascii?Q?berr6z8t1lrFgIjZIqUtiWEn+fNFrhh4KzRp/X8y73JjRJJ51+HkkzQOMY6R?=
 =?us-ascii?Q?SKVj41gW0nj+CipJ0bt6FO6Juhid9M8edxxLkMXR9ZbY28M4RsLVGVTtR1Qt?=
 =?us-ascii?Q?3I8NHAsvsq3cje+3N4ifWQnMQKpAcAEQjV/EQ8hqE7Qpy4pDcGpTHTh1o1r0?=
 =?us-ascii?Q?bXLekgVutZO6YWwMXwzKnsawNHtM0emTwsIDMZiG/VJOBjEbMXqnB++XYbtq?=
 =?us-ascii?Q?idK74XhK2FWcfaIyRGIqcvu79WDyvbmxhythW6XXBlx7cLJMBpxzLetuZIQ9?=
 =?us-ascii?Q?cPyVP5UFvyITfy9OWLrWTe6RsfI40zIFaulwPMb/rWJuHHHY7fFtMR8z8LKe?=
 =?us-ascii?Q?4yvog0Tb0VpG4EXTH1oMaiedxm9msSx/4n+EBRril3RZp2+jsH9Ge7CUPLfy?=
 =?us-ascii?Q?5Mw15YcV/QWqUfHwLnBE1LkgthNENCX3PMesA17CbgluiHPMcDRr2CqXgGR0?=
 =?us-ascii?Q?oXzCXKPfy1UQ6znsOGcqVf41LC8uJaK3+vsRCBem9lP3jB1tqWd3CagOHRNR?=
 =?us-ascii?Q?SZSP6rZj4gwWs7sb2vX2tLJtt6dehCG/xAhVeZQ6rmjijdDb7Nm8wU6DHmWF?=
 =?us-ascii?Q?WdvIanN05b+8qfezQJTEIlSjkM111Fi0QxeGuM3CzRPa5Jf8xvlGtn8A86Ko?=
 =?us-ascii?Q?f99BHhlaW1VBUUo+w7oSJs06Uh5BCLl6HiHXJ6mGJqVENNRWSkJZoLIqDYbq?=
 =?us-ascii?Q?rGQFzhXL4Ba7ImdWFOaCiLqzuG808euO2JpC6Go85Eg0wtOIfW4JK3zMhTgf?=
 =?us-ascii?Q?9t8suWXBsvZuF2av19wwcilllquck1y+7XnMEFLFXLmKt8lmesuHoazjrXYH?=
 =?us-ascii?Q?B8TikXKXQu72RcfzBkgqtqFxisi+p0nRoWrb/z+S02xfTQdwDOV/iMMphM6D?=
 =?us-ascii?Q?+qMj3wbGd9A/CGvNZ07l1bvACCY+42T8f3LiTJOV7wGOj+dSmytLDgSIdIxN?=
 =?us-ascii?Q?45M9bw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120fb2d5-dfd1-4577-4773-08d9cb007384
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:44.9217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNQK+zF6zdwfUBGQaEN0c9SNmWShm8sSdDlh5SGqFTPKFAIT264ZFGjWEuPqkB1vMplS/znWTKSCSw5I1q/WsoUbrpozSaLJcGwupxQn6XQ=
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

Here we use job->blk to drop our own reference in job cleanup. Let's do
simpler: drop our reference immediately after job creation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 tests/unit/test-blockjob-txn.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 8bd13b9949..c69028b450 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -25,14 +25,6 @@ typedef struct {
     int *result;
 } TestBlockJob;
 
-static void test_block_job_clean(Job *job)
-{
-    BlockJob *bjob = container_of(job, BlockJob, job);
-    BlockDriverState *bs = blk_bs(bjob->blk);
-
-    bdrv_unref(bs);
-}
-
 static int coroutine_fn test_block_job_run(Job *job, Error **errp)
 {
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
@@ -73,7 +65,6 @@ static const BlockJobDriver test_block_job_driver = {
         .free          = block_job_free,
         .user_resume   = block_job_user_resume,
         .run           = test_block_job_run,
-        .clean         = test_block_job_clean,
     },
 };
 
@@ -105,6 +96,7 @@ static BlockJob *test_block_job_start(unsigned int iterations,
     s = block_job_create(job_id, &test_block_job_driver, txn, bs,
                          0, BLK_PERM_ALL, 0, JOB_DEFAULT,
                          test_block_job_cb, data, &error_abort);
+    bdrv_unref(bs); /* referenced by job now */
     s->iterations = iterations;
     s->use_timer = use_timer;
     s->rc = rc;
-- 
2.31.1


