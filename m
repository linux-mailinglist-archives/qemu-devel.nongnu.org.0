Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F34256F2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:45:46 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVab-00014b-Lq
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUi-0002ef-KV; Thu, 07 Oct 2021 11:39:40 -0400
Received: from mail-am6eur05on20719.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::719]:49281
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUg-0007Fx-2B; Thu, 07 Oct 2021 11:39:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwyfTA+4vFII1sjsTCuP4HNBiXWPbRman51AnEZ4XWa2WOBGcwaM66bSjstM9oSnhkKvOTIZTMXYi8URr6X+jTTxCyl469O6Mjf3kGj2jGHGQUgR0EQSgM0Umfoyyg2fRcdWr6wAD0zom2/hP+UOOJjVocXX1uzEdziXPG6qKs8GosxTBZt1ncCd9klWeDtiM4c14CClwMG4iVll90IysIqkxGLlmAzMf24bOtAKA39K36D73pQnqXkrs6UXnzrbbvnvuOXhQ1UZRgoD43dv0DKm3NLTXe+00Fu+iE+4nhMxfh+uUAxjd451R22iL9zbB33MuNZ2n4vkx0j+cHpO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKZPmX/LcSladWMQoWU2IfHJEGNcrvXsGQSDIk+COHw=;
 b=kdLW0/1Pe5ICIHJ0VuKl37pI+2H2G/uVjJcMZ+ThU5IaqK7EsQxR7sy1B76eCuIKmXqykzkjsM2V7j4lz7U5mmJupQkiv2RnlAjb0+oKrmEj+joYhainIWPTCrpF3XFg7/G00v4UD9UHQIydyhaZKXdnZT5rBFMUYq71vwwBLmeaggqU3/3aI+aVwiZwqLWGAV2J16zByjbyT5v5Mj2t5fr/LhX6k1UUWU2gXfhuSUJYenw4Wvn/2Lbz7A/q3//oZNuYqbUyi9bbLiQ9FfYTmoaE8Zd7ng165D/Z1nHLR3iJR/a67otiKFkiUxlJV0G9HH7LqfFRdnWiyRZWae0YLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKZPmX/LcSladWMQoWU2IfHJEGNcrvXsGQSDIk+COHw=;
 b=mrLKWUCLd+q40v3YXiMvjd1LA93spzIB0dkYNiZdlHg+fOOFLJy67j5G2wXDea6vDNVx9gVv80uk/gRs9b3tPvxN5ZAnnkSD5AmpCFUpTSPIhUp3P5E0GD+igWXdQHxonIenk7MR++504YkXcbMKWEXKm+TElQiazllvH8X9mtE=
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
Subject: [PULL v2 02/15] block/aio_task: assert `max_busy_tasks` is greater
 than 0
Date: Thu,  7 Oct 2021 17:39:02 +0200
Message-Id: <20211007153904.445009-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b4a32b1d-8edb-4b10-16a8-08d989a8a0b3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB613416BE5683204897E31D22C1B19@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdvUYV8ktZBZcXSEYgxh5U71bj+SE5L991FQBcRwdgfEX3ii+cTIZbgx9Nj8ji0YXadOR/sKSFaC2MjlbNtrAUX1si36QQ4kvUDeny567FtIHNUc5h3j4LDQ2mqDLkAbF4kOEff3OJVRmLyCAN0wLbGeRzPP0eevKQ5mIg/kdFpahUK4oFEvhPi4UYDGz7o0aWW2zEwjpO9PTVfcPeHXOKgo69bbHdCLg55KEWLO2Kt3rR8jIc4jJiqAbO+7Y1RE6DFkMg60U5K0Z3Pk7FHKxTCWMbzu81oCYuOlEZ53H18WlSFRByWT3Tusu63HkBBYkUG1Ro527NhmLhyqAp5cgFN/i5UhQhSWiaCpfkJuKAysPlXaqdT5JCvYyOUVhc3kTWFj04X+dYttOR7F2yos1rTA0NbgQlyO9BkNfsXoFCf+gyXYQAe0hx8aobQYlrLqXHOnfpADr5MRe/jOVhbjbMeMLc3EbnLPE6lncKcyEXJzwLI/9kDDDe/7g5VBFStksZiudeywCwTRO7yM9Ozq7Z44eVEVeQy9CfetIyYmliX6xL2/UJ1V6a/5K21I48KFCEYJITndcPPZSeXUbzBy5TwtS8SWNK0gI4BQJ+FImuvqeboixrcPWsQYW0dME0ga+Q7btkzUbSoe3JOnjCxe1wyaG4whcq4eqclKkuTBPocGLh7iQDY3bLUBYiK74Q3QVuV0pudKtHs3NbkEQg06Irt2ROV4Xzrmpzxes4vjCXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(83380400001)(6486002)(2906002)(38100700002)(316002)(508600001)(4326008)(6512007)(8936002)(86362001)(1076003)(2616005)(8676002)(5660300002)(6666004)(6506007)(66476007)(66556008)(186003)(52116002)(66946007)(4744005)(956004)(26005)(6916009)(81973001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T5Y7d/q1hhoNEqsET2QtwxfrguwQ4x00MbjnWMj+tQm9AvsTNIP9LH8wNvnGzW5IRtY+8xjsJoHBqk5Gne5ggYmZ3sHEbJ0j3ZwJ7dGUZRBpSEuJL9ZX+H84tXgkV91vB9QCSEIOyazx/RFOreohx48Bl3fweJ8BPHzBwHp++tv1ze8RvibNSQJaDGvSVDql9njua1Dq4ahT+8+NMFD65IdDWK4wIrOcfRsiD5s+cdfQ++uGYayWLqv2EDEQp5AIdyMbfEhkNzhb6XIVbtYzXZDEUWoZDjIqd9vby1/diAYO+UzCH98rgTvH9jIPjMf9r1uDbt5NfDeVscB3dDX29ijmfkLj9JLwDnPURGJKCIkcojLfQWvM4w3Gd+lQRWW1EPYo3GB6QmLmTOpz3CEEKgx3uy4UHws6TY1rgfF7utis+m5Rqe+LONT+cY/3a0tm7Oj2sft09rCdcSGOsCNt/1XgMOzUjK32IO2+0F3aAnrxbyL+xWTRxnNFua4sDo80zjpQAhsACvcy0coIzogMkaQb3pYx6g6nWEtQOvHPE5tj2B1NWlIyCU1GfHV2DONEH1KadETOeY6TCP80PXhYw8GoUn55gt6qnvNyyu4bbJivUfOLMA5S/HG1mGoizPDh7X3980nqFeOGM6RGkXWO3U8caOsbVS4nHSXWvVF+eLL3udo+6UUT+/eyIAGtxYg+wTKOAKg2W9DsJ+Uc2t5eYU6KK1FAaKdDTG267NChPGl60D6Tg2MdVhtJhA3IWQuk
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a32b1d-8edb-4b10-16a8-08d989a8a0b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:39:19.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovo48DIyxCFGfKXHB6tRuVU4pT/ogJNiYdibYNWRtExayMJ+BakebpL4HXZLPNGr7sFrTLJoLPokxDrntVfzDsqNQG9ckEUMHY/bXW5Rb1Y=
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

All code in block/aio_task.c expects `max_busy_tasks` to always
be greater than 0.

Assert this condition during the AioTaskPool creation where
`max_busy_tasks` is set.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211005161157.282396-3-sgarzare@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/aio_task.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/aio_task.c b/block/aio_task.c
index 88989fa248..9bd17ea2c1 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -98,6 +98,8 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
 {
     AioTaskPool *pool = g_new0(AioTaskPool, 1);
 
+    assert(max_busy_tasks > 0);
+
     pool->main_co = qemu_coroutine_self();
     pool->max_busy_tasks = max_busy_tasks;
 
-- 
2.31.1


