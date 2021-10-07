Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A94256D4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:43:07 +0200 (CEST)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVY2-0005dM-QN
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUe-0002Y7-Nm; Thu, 07 Oct 2021 11:39:36 -0400
Received: from mail-am6eur05on20719.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::719]:49281
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUc-0007Fx-3Q; Thu, 07 Oct 2021 11:39:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiLi0ama/XwBTkRCpLtjSDYDyowc49JY0fOGigO+UdxHnSXpNRw+i5oMHNgR9KBFWg/o9a3QCnFzprkfXXX+QFVmeoSnYjPez2BQc5b1rkKrceNr/hPvyrYPF7M+zXdiX+2w049ZNDaCfIrEC+ulunw//EiFDn8WKj2JgOh+NoqDmcVcerwhqdyZuqOKrgyGuNwjYZoMR6Wa+nP8j1sxLuIXOIGQ85TE/dSwREUaP886s+s8RN48CQNu7Ghvtng/wkg8cCnScyz3T+8YonNGvoIv0zi7PqMeDSb0YP+MhtaymcwS1VKGW9Zmy0y8JOHoPptDt3p1lm76gP2YbB2gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wid2L+9imfwPEuSCp7YnrG47bsLS1JFpSPlgukYTavU=;
 b=UANp2/2gP/Ck6O6hRVKTnWc2Mq7SBAAhwv9hXiPleeJ+B09qSkeI0D77qYNZoSHizxDaLkkDg6EdFh+1EJLUly8QYoC9/H6SkDUgdJouaNCH7Pj9IZpdi5QmR+TzqVkyhvObZ7gluv2NOnQsjghCL/QfIX2W9LrSRswN8/p0xt0tT3bLLfnEhuWp7aVOYIYStrMt37gOyDKjkPrvcfejo2PnHYPSpiiTICpfocrKsEfFsEws6YyYgpmuq2Uv2o3u57Jbj2BqUfF3UrBUiPZAa4qw3bKGAL57R+V6sZr8QpS6voUW7MpHkcKZ7M0l6rEySL8CG/Y45rnQVgZuKyHX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wid2L+9imfwPEuSCp7YnrG47bsLS1JFpSPlgukYTavU=;
 b=dX0iEo/31BR2OsEtFdQjOU9QS12wJX3tECr6OmYKKCZQd7iqx4Pz8sHCW/cDisKWtKAD1uiLz962/0bd3P+HW6g+0CilY7As3JLPFOB7O1XLVfug3it3agT2xJI+WXSx0C1J9HTawLT9y51rbQJXmMz0arRY5Zm98zKdWN4WIqo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:39:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:39:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 richard.henderson@linaro.org, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL v2 01/15] block/backup: avoid integer overflow of `max-workers`
Date: Thu,  7 Oct 2021 17:39:01 +0200
Message-Id: <20211007153904.445009-2-vsementsov@virtuozzo.com>
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
 Transport; Thu, 7 Oct 2021 15:39:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097eb58f-6a1c-4196-881f-08d989a8a05f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61343559895C032BAF5B5B8FC1B19@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7N67IJ2zmFcviiz8azIy+3kZZxbpyEHwjvMHKYKsJtivhteaAD1PkvohxxD4N2vDp2fabbpJ/sxEHLbfIf+5iKfJ50S7bBHTdrOrG2fmW5fPTBjxB7k+qukF/GRZ5XsEygfC2ifKXUGvJRr8mCAsQ5rvxLnW4FI9QczFDdgQN0mcLIyzUvq9gHDzDu+vGyaAamUchY/uXy6T6ghW1LIeSllXb9R8DT5tJ2VUopPXGi8s3sv9LQ8hS/WEjD3rFfp234AyigAHgQgbxlsvDYqcpJMDJoUt7cxJM6wNBmJI+Gjw1WTutDHgMqK3D23ZXleSdq1q9KjYTK9yMOo7bO7tZ/smgADOrMkq3dx2pb8FkCGsYsGjxUk5yO4SSzJs3Rdv4Os5dZlRA7aDjDBXdToKks1KBeb1uQ0T/1LXndgU1+r0FQ9KjTiyfMRtaX1B/y4rn+TlpINCaE1h9oHabt/3+kh11S8jvoirVhf28Cbz2Y9ISGYqM3EPL6W7pe135O23qsE8dWKXE2cMi82uBHPeGCfFgjcRJs6mV3Z7bLxnwjs3MqQeZ3I2PQXruHjFj3tlU75jdgvSIsdhDV0qKSMNP1wMVcrGekRBYztVtSFgIW2amEt1tQS/8ku4sx5sBLzlvk9EncYJy4e2CdZ7EYVwOJjodkwkH+OmktudyV+ZHlRfiNoIVgbH9YVc+SiBkBZ0WqTW13d3K/BAGYnhXHt3Z1eniiRtcASZF9Lo23eCm/xl92SBildbhVI/wZ0rhp1IFmQ7SIwJBtgBaFQ2q2XjF0anMTkN48/BpvbA32xDOBQ+xA0hw/7vDRTHCVcdYwo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(83380400001)(6486002)(2906002)(38100700002)(316002)(508600001)(4326008)(6512007)(8936002)(86362001)(966005)(1076003)(2616005)(8676002)(5660300002)(6666004)(6506007)(66476007)(66556008)(186003)(52116002)(66946007)(956004)(26005)(6916009)(81973001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gtdt1iecwK6fi1aTg18ogVFG5Em+jPWH8NLu2pmJ+241o3vXwztH0ZNqKK3jyt30jzdE7vUbxq6gCI0tAFv8Tq343zDzMfKI4JrJeebPsErRYmbC9G803SJUoQVuMTuKMfS0PXMGhbcF+rNmY5eNXTpjAU79EjDlu+g5xGYa8knSZNbLpw+pSwL4apBXUX18dckkNHhPPDcrdJlf028kg3reDpkm+Kms08dtkz2U2h318XOT9BlCqxkELMerNzJWUNmW9lJP9HDc7QOJSJZL7G+ok4fvxi5MevV1g1ftFuO/y9UgbmpGqScVZVQBoIeMaC4CZez//H25d0nBwUt4ofEW3FK5cqg0OAOU4mtVd/yAQ67YEnB0D5DVjKhDWZw8syuv/HiQUfQp9fUTRiqiqRA/Fn8A3dHa20hdvrm7bhF8CsWMPlhIOYBK9e8p/bKwArJtZ2dazM058ytOuqyZWuanpSYnyLbyG6UqqM7u5IqTF/4nT8sIKTLllI8UkAD8glm+72275aggJISFPcXp0e5+4uX4OsjQD+/IxGazP29Rw6XN+kCfQOdYh8DKAKwesaLmGH288UC1ubn+i2iC75UINFg7ygPnwi9OFE8pmj1axH03OLjrGsamPa2kjGjUYNWtq3L3ng/k6CBkoNYbfM/7vbYHAQwjneb9gfpDFgwIDrbh+akNb9mDe8y4xMHuBFM0KQFWRDR7aCmVyjzBEMFP6yQfJPTYJj9zMzOgJnU4MuioAaAcXmd+zMJldl5O
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097eb58f-6a1c-4196-881f-08d989a8a05f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:39:18.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y50knpWB6z2UEGyl8u88VVMJvqQ12by3ZQhl3GNs7Kdwtktkt2sUSbD+ykJytWYUYvCbjlXvjznE5nKZmzrMgA6/pj5EO1Zvk1BCifUBOow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=2a01:111:f400:7e1b::719;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

From: Stefano Garzarella <sgarzare@redhat.com>

QAPI generates `struct BackupPerf` where `max-workers` value is stored
in an `int64_t` variable.
But block_copy_async(), and the underlying code, uses an `int` parameter.

At the end that variable is used to initialize `max_busy_tasks` in
block/aio_task.c causing the following assertion failure if a value
greater than INT_MAX(2147483647) is used:

  ../block/aio_task.c:63: aio_task_pool_wait_one: Assertion `pool->busy_tasks > 0' failed.

Let's check that `max-workers` doesn't exceed INT_MAX and print an
error in that case.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2009310
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211005161157.282396-2-sgarzare@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 687d2882bc..8b072db5d9 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,8 +407,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    if (perf->max_workers < 1) {
-        error_setg(errp, "max-workers must be greater than zero");
+    if (perf->max_workers < 1 || perf->max_workers > INT_MAX) {
+        error_setg(errp, "max-workers must be between 1 and %d", INT_MAX);
         return NULL;
     }
 
-- 
2.31.1


