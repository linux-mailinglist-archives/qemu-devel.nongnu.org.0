Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20579310E28
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:50:44 +0100 (CET)
Received: from localhost ([::1]:35862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Jf-0003gU-4R
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847D-0008Sz-3f; Fri, 05 Feb 2021 11:37:51 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847B-0002Vt-7t; Fri, 05 Feb 2021 11:37:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN78T8SlL6A+818I2n+iWRWREZcI/RIS04GNAx1Jj1kb+dn3Y3CCND7mig/aV8QJinn3my094dpQ/oYADZrEB+wWkL5qLGLNE8nsGOulWIfLH2z1ePx1HD0VAMZ24GO7Si1DKMvXUE7xaxRL5k81qzuz9f7RFfe6PwJwVc1s4Hq428mUgSa29X3XPK3a7RiptS+1k6CDUNdLfIrBUwAjO85RUwSJHh+EfJ9rBdlN5lZn4PFl1mmdzQoT7HsS8LnhU84g7nA8am7dn5ABZphOQJGYo5zv2/7SJ0ezYUsFxLA7ViQht9+YaMEcrsong7StH7L4cph6Lj7BFxF3e5DPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5QBz2YH06izKiytUc4ao7dNFfscxKi3lGg6bfqQ1SQ=;
 b=dJdMQZDoFJAyjtA1axB4JS6Jl+ZfAGFzmzS/sQ9HGqF+uLnmSahMPUUEbrpUbkY15TQ0GdZP1X+3eQ6zufB1HsSkGq9xgMfTZRtCrvle+iYSfFgy1GAxkm+q76UFJ+o5K0xhZ2ZPqn5veJeii40P6Srffp49mdvrNdwQk0JUStD/OEIV5qbUx3GEoqjZam0kqWxgszbSEnmInSpctNpMNDVSZQ/58RaQ2ZCjQTTKR06Q6kY8kyR927ONW0ggmCmlxKZaZslrhN8rIWfr4m5KqCLvd7K6/mfFg9VJ6RakGi8/S1U4dJD0daOM/6dpEMZsnyLzcdYv8rejgbKiTFQLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5QBz2YH06izKiytUc4ao7dNFfscxKi3lGg6bfqQ1SQ=;
 b=KLx/ydyo5NrhU7Xtrj0+iT6+dUt52k4oEWIDC2IsaZABtKgACBxX7V9Wzdtni1JKgqBZUcy1XukZ+FCefvAqW+xXO1qbr350ukIjMPVBO6VqhQzSmWeC+A/Rkxundj4ilCLf6290B8BlxG0U5GxYoU/9r4A4INDiHnylGJPbwe0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 04/10] job: add .cancel handler for the driver
Date: Fri,  5 Feb 2021 19:37:14 +0300
Message-Id: <20210205163720.887197-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b163f2d0-37d5-41a0-6f54-08d8c9f45898
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470DB9EDFA46A9260626310C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrMZ/htpPUa6vlH35k9kiDWq0LDVzWbJGZrcfdZDB1FEYqkrt3cFmR0id2hseY5+xArC8xulmQfQ5HYNocos67VVxFEE6EErs3xbsP7Y/Xz5RZBktVXw0nS2xg1BjKHcJ6fqgFmlEdrD1mjHx/A5CNje1JCm25W23OiB+USBKtmzfceGIwe+HFY8+hD61FXqlpYmTc0uXpK/LdygD7cGO0uXXYv03sgFGuQroGKrOe5uPh+Sri30MPTByV2EqY7qSa7M/B2Tqi9QqWOhlJGBCNLqy9BlEe1aR6pkA8PMDjtqSNCaMDXz5+Uh04RNhSSzyJFFRBtIhxmOVLDI9w9oUKzagWto+90F20TRbn4pyhpOYL3ErzA54fD2RrnOmDkxDGRxj3FQjVMSOstrmYNx3C90g+ts3B8D/aQIndB3n/8gKMhDKFC7qrdYvmH8kKyVrPOGrUmGCvktZonbvKLWlUycC/mVI7d00RK1mvlscVFDPg+80/uNobP8xXvBgaWjEvrqTmgx6Zmp7sfi82fqV/4+VnhH14ieGmnzKDmTFnuKswH/Rgv41hGfoHjV0epkKg1OcyVj8ohnpgBRo2GNeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ma2x+djkZngdIzj6CqKxVw+6Ab0n0TWJk9uRXABTxfvY4uo8EsElZpdtwFWj?=
 =?us-ascii?Q?DYZxqthaSgdcQXXtCkDzcykpFFaiYteKN+Lf7gX3NyOEe2fmMHFSY6QRs7VQ?=
 =?us-ascii?Q?WQGYmgE/a1x5K9nQ/DG8JKq3BZwYy4DGKaRq0iH45dt8Gh+bJAXd4M1obl0g?=
 =?us-ascii?Q?zEhUv1GT1wk7nfL7JGuIq6/GMsI1TbuWqFpunOdBvqFuO5vsWpL3qoqpD+n5?=
 =?us-ascii?Q?SyqPDbuH3J5orUZH1/Gol33B9AylrQ75aV1NQl/BOUDyItQ+sQ/Fy7OyIUuJ?=
 =?us-ascii?Q?xdx4umS+3vMtzTTlnnSXuMyNPtixyhcb88p02oo4rQccX1QZKxgvp1m4o/aB?=
 =?us-ascii?Q?BUkjTJC3cWzYewXQElGoVJCxOJfErkRTvQRnVqNRDY3pAoMPhn0FuJg2f5z0?=
 =?us-ascii?Q?fWFKjWQwNrZ5YoMyaEOflTb/KC8D9zlZlaTral+GFxZ5B2Uco1LKqzVyJnlt?=
 =?us-ascii?Q?Z3rOIeHxecfUR9mX6GOECFyvLSRFJDIr4yRZZH2//vUmUr9Dg3ht8k6lRZF2?=
 =?us-ascii?Q?vZQBbv/5RqajrPfFsry6oF0Bs59OL55fd8Z+ewHHtMq2UpGhJC1EXuOpU0nx?=
 =?us-ascii?Q?ezdevWXSGYiBhqaRQBJ80+FiMcCvTW3szUeJaodmOcSbMESAwkE77QPK7TtZ?=
 =?us-ascii?Q?DDvoCSLMU+avkFCA0pGrdewVwfX+z1d5pf7FrEwiA6+JHYfXA5nHYDGdeLI8?=
 =?us-ascii?Q?v420LsSbAXJY28vrnQorB8TYRQ5T0lolIlt8+UgaA8FvPTqIbJ8anWrDWDk4?=
 =?us-ascii?Q?xXvYQ8Vkvu9z8FaaS3RxypfoVC1GAZ0wn1SgmRUqLcuL+2naXCU7QsYIxmOz?=
 =?us-ascii?Q?dh84cN/TGj0NyP3UGsTZKaiQ7OIx3Y1wKT0FKtdF6OKupQpee0J+6PbVNYPa?=
 =?us-ascii?Q?o7TsC6i6wPorMIkR5+EGW1MVox4LcKv1iNaE4Q+JKlBdGX/dm0sgPQV3ZAfu?=
 =?us-ascii?Q?EM+g7g3BqpNfQID5FAyeCQ8XW8vVHSx9gPvEW+CwSoSbvm7NxuCCvYRevMTE?=
 =?us-ascii?Q?qtYKnec/zqU9vtqAM+FislDs5vGyXXBojx4y9wPf9Ch1Bf6RtiB6BxjKfkg7?=
 =?us-ascii?Q?8N5A2QTHCVbDHhnthGe2TyXpC9nGyx7i66VgCa9KPvQk+IJE4TDrxDqKPb20?=
 =?us-ascii?Q?uOrRrQRxj4lrtpLGx315Msri5t1mmbdacUNgydY3An8L8owEov98mbwyMEpV?=
 =?us-ascii?Q?4ANUcv1E7NzDw8E/v8UURnrpSRwZcVL9OSjalIyRR0zkbb86Y/d8VAwo6v4W?=
 =?us-ascii?Q?MO/XKqAXDsHimwgsTxrUB9CrKj544pkhYVHfizM33JhnSuepBrP7w7sCYzsz?=
 =?us-ascii?Q?/0k0GE0BSC2FzOQetXrRpoMQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b163f2d0-37d5-41a0-6f54-08d8c9f45898
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:37.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OzSU/qI1Rd74waIdJHyLalIV07175ioOnD/tYpEZg3/yyu1+mgXgFMvLldBpd9Cj4SaKOdz9JjIbwfgLwthaFOdX9oujZolZyb/R9n/eVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

To be used in mirror in the following commit to cancel in-flight io on
target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h | 5 +++++
 job.c              | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 32aabb1c60..efc6fa7544 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -251,6 +251,11 @@ struct JobDriver {
      */
     void (*clean)(Job *job);
 
+    /**
+     * If the callback is not NULL, it will be invoked in job_cancel_async
+     */
+    void (*cancel)(Job *job);
+
 
     /** Called when the job is freed */
     void (*free)(Job *job);
diff --git a/job.c b/job.c
index 3aaaebafe2..289edee143 100644
--- a/job.c
+++ b/job.c
@@ -715,6 +715,9 @@ static int job_finalize_single(Job *job)
 
 static void job_cancel_async(Job *job, bool force)
 {
+    if (job->driver->cancel) {
+        job->driver->cancel(job);
+    }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
-- 
2.29.2


