Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BD413177
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:28:01 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd0K-0007xu-TU
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctI-0001GU-Mq; Tue, 21 Sep 2021 06:20:44 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctF-0002Rp-MF; Tue, 21 Sep 2021 06:20:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfPU6tfLKbiGJlJzSC75KDU2yle0NR5kcBlkHmBe9RhmFf5C13+NbsxfteaiXzRZ2SzA5dRgXU2E+uPeiwGtN8IarrZb508kpZC3Dpu0aGLDrgnNXKHTBh82kFUfKyi5hD5ihFy9fRi5bw5nfA840NwUPLbp7s715FQiu3lbKJG2cG8H+ZHIh6MVtpO2LkIY8u4dMxfhPxDrsLbr7FpLwUySx0cw9XEU+aZWjlegzItfglvFKVd4CkXxvEqZNV6Bln1pBOrn2mHJDGJWYPQf0A1eJjjWKc7bYhRX+hPw1dF7XX+SRZGZ0SUhb4MhxcbgpOtO1d5+0Ll5ZDoY7siA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sxm6wNINJAMInjyY1j3HNs187mlCkDXEIXD01+CIunU=;
 b=Kde0p64KDSHfBNxaNS+ZMbNjhzGJxgYX6Lp5tpmEby/HbpQhdylFXod5fIraLc0VISyvdJpEDpQWw0FiM/tP5Gwo+pjVgG2NaNk1WGGRxS4qGnzAHU5VEJoAKj1/9sMV7ZbWZ2RBkIrci0vgNScx++GMKQgzfJ7onCRyB1WufTSinafTyEGe0jb5TKB4o/MDrm+ZRrANvlfGBV+s+/UnCAC8MtM6XjlY6k7kzt6o0irZYHRIoA5xW4b9i73MThF1rCvRtGOZmgyogyVLsLd8ZgjTWuNbguq1QOsoS9fy1tt5/rUbV0uWLrfcfL6+OUKt9zSxlmZ5mxN1gfh5XRQEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxm6wNINJAMInjyY1j3HNs187mlCkDXEIXD01+CIunU=;
 b=nelafYezrSpA+VT3pyH4yZXDi+9seD21/2rosFCm98fH3wFImaIYyUwHPNf+KB3uwb+YoZLL3uP3KXjSB78BO8VUKfsVfq8Jr4jXcqfVgubKBHTQxlclXWpmnVSaQXCfzL4ASVzU3S9WuF+QkJ6iVsIrmxNbY3K7gSVvZRePcO0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 04/12] job: Force-cancel jobs in a failed transaction
Date: Tue, 21 Sep 2021 13:20:09 +0300
Message-Id: <20210921102017.273679-5-vsementsov@virtuozzo.com>
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
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15a52fe6-0bf9-438d-fddd-08d97ce97534
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59447C39DF694C6CB5CA3774C1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKNNFMjj/nG3d35KFjFeVKi5xnSoNAT8Ls6W05i6O3Rw6PnMiINKY7AtO4TrJ7bsZ+bPdVj+ocvG1i4+AapnlSneGeTTMZmwZcB7UCn3NdbBt+ys/AHhWntf7zcXMB0+sxBkq2LQQofOAv2GmBt8STjZeimKPCkKbjVXZL9y98t278osvsJrXihBjlE9Yb8hOuKuVexzQJQ18ahrfuk6Gn0bgwkKso0GQYkLDfllKON9QDMC/B1ka81i/W6Qm4vsOB8qkUwsMsx8/XF/Wr2gANNWS6YvLqD7cGtPHh+Zr9cSu+SHyADWuOqtsdkz/EEOzV2trB9X7zKMl25fMaMO3I0ly43h0Xfy6WO0QyBRRDZnx+L2pRJC39Kj0+KOTypgx1i1KT6jU77273R3dudImwei+5MN8TlKvzMrcGJRPjG6roJe7iSxeGoz/1cMkxoPBU/w1dbxlp9KW3XEeSG0B25bjZFmBHHelOoL/Xy6iKT7tNH0+eU31Y3PxHwYBIE2tzVXfnshWCd9fnt9ryiPoSYWJ2HnBkOlpbBFklo4HN8J5/mafI0JTuGXpd9vkm1feUZIQSst+iaO+QBPVE2ktztcZjEkaZwtTnhV6RI4brqIXd8Jyh0/Q2144KoRftAWbZYhYQN0VBYo3nP7i5QU1xNolTPB3opH/TQmr4yTfUnrYM7Dyok4OoZULFPrdF662Nb/q/SH0lWo4Ib7ZMNTkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bT12ls6Kn3A31vFGILjB0e1xfBsk9+BGnfDLqH3wDdz1RZT6xMlXb9FoIgmv?=
 =?us-ascii?Q?lQMLGjk5dpMB/0UMBKuF3aY7lah28wqqdFfjAmMbxqnkw/gALfLGuBcvqWsM?=
 =?us-ascii?Q?h70xy2PY3ite4aVLe6pN1stHurjV+gBhOg8/27gh20ysE3t34Jz6rCxYRbzq?=
 =?us-ascii?Q?VCQZyikoGul1skuYk/oCGUdtzI9ISdLRT2cFuQb8Vkh5tsEGPkeS0JafHuhD?=
 =?us-ascii?Q?gAqMl0lZ+JTQkVE12IsoMpsZhefeLBQszmkz+Ju6KdKUV2BT37X0Uy7ZJk29?=
 =?us-ascii?Q?W6mk64T+TgzNNiM+xm2Pq/eeauVLY4VacGq/AdA5H4lLFVsLa+DiU6qXjpmf?=
 =?us-ascii?Q?ctZQo0sRwpUXceDJGfaQDjQ/Pkxth9n1A7B6Xm2BWMKQuR76+zosYjChLGUF?=
 =?us-ascii?Q?a8GngxDLkOacRFOjLjuR6gDiejK0rQU+zaMeFpEKGF3DOtNQuXnf8MYbQj8W?=
 =?us-ascii?Q?34MKBJY9r+CNdAKp9WSTH0O30H6pBULF1h/DAButTCwM8iukkNzRhuwEBl4F?=
 =?us-ascii?Q?b16UAVkAe5TgLk+suhYwf6UFz4nhwa0cXCKQN+IWOe1MqJ844sXg351K5paA?=
 =?us-ascii?Q?sr+blryivZLj5nPdAEB3bZ7/oafOKkiwKngTbv6/38bLpKgo0z8+Itk+TQoY?=
 =?us-ascii?Q?/q+9FycZMCusnzs4lqnIQTa4r67d4mzm2Oj/LrPnZnTZPBgFGACRTlBJNsfM?=
 =?us-ascii?Q?htRn8I+GNIKDCEI4Q1vhZ2UXRtsYRT3rjX+qPqYtw/Ss+ZTqjUHfsI9+4QSZ?=
 =?us-ascii?Q?jwESMkVkzsZyJER6KnssoWWWBjkGBbKVosbVLue88JMUZWY+Xuojo6dtS4C9?=
 =?us-ascii?Q?BjYJdB0jByOUTDJN7vwU7U5LLE5HLzB3JsYj7vgJHZDlom2cWVlDmDZlNTJ/?=
 =?us-ascii?Q?dz98IcnKo3fduZpv2frPWMedM8D07AHP/63sNMgfmT6yN8OZIBV5cl0DnpBS?=
 =?us-ascii?Q?z3p2+ExET/89JAhW7kc6EjaUl/DLGSa5+8wXbBTIL6yGqtVAuDAvbuQc43q3?=
 =?us-ascii?Q?pJ3JjDEvxCJn8vSw5Z0qa9IVmwZrqDjujjXIGwEbdJanMlfNSJbdrBKGp78r?=
 =?us-ascii?Q?ooxS8gR1oXZ7pYDJdO8w70Cv5Z4t/a0CQ2wbeA7QooguGQdgHB4QNe1AGwAV?=
 =?us-ascii?Q?Wzz2DCpn0Cpmq6NRdXgU8sGcWoMB0kbTURPo0MV+tkgUvJGQgmIcDqZGr654?=
 =?us-ascii?Q?QTLDo35ghxXL4UcFtPywtXEjMZr+Cd+Q7jMLA9rbIeigBObTb1iZBhapFRIm?=
 =?us-ascii?Q?H4142GOR9ZSh+EiMsbEDvHDEbzbtLCI5P1jF8qx+K7+Wzpf4lfXfZv0P3PTy?=
 =?us-ascii?Q?j7Y1L+WTfMwpigV1JUpkV7He?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a52fe6-0bf9-438d-fddd-08d97ce97534
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:38.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fceLTJTrjE3CUcXhv7iTpvFJtReSGmeO3lvPunBnpG9v5MADQzauIXohJSW5JanV9jZido+dZSQ9VjEStczoAZAnzQyI+1VWI44HPe5Ury8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

When a transaction is aborted, no result matters, and so all jobs within
should be force-cancelled.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-5-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/job.c b/job.c
index 810e6a2065..e74d81928d 100644
--- a/job.c
+++ b/job.c
@@ -766,7 +766,12 @@ static void job_completed_txn_abort(Job *job)
         if (other_job != job) {
             ctx = other_job->aio_context;
             aio_context_acquire(ctx);
-            job_cancel_async(other_job, false);
+            /*
+             * This is a transaction: If one job failed, no result will matter.
+             * Therefore, pass force=true to terminate all other jobs as quickly
+             * as possible.
+             */
+            job_cancel_async(other_job, true);
             aio_context_release(ctx);
         }
     }
-- 
2.29.2


